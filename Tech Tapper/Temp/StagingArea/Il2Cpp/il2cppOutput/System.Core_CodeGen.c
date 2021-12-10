#include "pch-c.h"
#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif


#include "codegen/il2cpp-codegen-metadata.h"





// 0x00000001 System.Exception System.Linq.Error::ArgumentNull(System.String)
extern void Error_ArgumentNull_m0EDA0D46D72CA692518E3E2EB75B48044D8FD41E (void);
// 0x00000002 System.Exception System.Linq.Error::MoreThanOneMatch()
extern void Error_MoreThanOneMatch_m4C4756AF34A76EF12F3B2B6D8C78DE547F0FBCF8 (void);
// 0x00000003 System.Exception System.Linq.Error::NoElements()
extern void Error_NoElements_mB89E91246572F009281D79730950808F17C3F353 (void);
// 0x00000004 System.Collections.Generic.IEnumerable`1<TSource> System.Linq.Enumerable::Where(System.Collections.Generic.IEnumerable`1<TSource>,System.Func`2<TSource,System.Boolean>)
// 0x00000005 System.Func`2<TSource,System.Boolean> System.Linq.Enumerable::CombinePredicates(System.Func`2<TSource,System.Boolean>,System.Func`2<TSource,System.Boolean>)
// 0x00000006 System.Linq.IOrderedEnumerable`1<TSource> System.Linq.Enumerable::OrderBy(System.Collections.Generic.IEnumerable`1<TSource>,System.Func`2<TSource,TKey>)
// 0x00000007 System.Linq.IOrderedEnumerable`1<TSource> System.Linq.Enumerable::ThenBy(System.Linq.IOrderedEnumerable`1<TSource>,System.Func`2<TSource,TKey>)
// 0x00000008 TSource[] System.Linq.Enumerable::ToArray(System.Collections.Generic.IEnumerable`1<TSource>)
// 0x00000009 System.Collections.Generic.List`1<TSource> System.Linq.Enumerable::ToList(System.Collections.Generic.IEnumerable`1<TSource>)
// 0x0000000A TSource System.Linq.Enumerable::First(System.Collections.Generic.IEnumerable`1<TSource>)
// 0x0000000B TSource System.Linq.Enumerable::Last(System.Collections.Generic.IEnumerable`1<TSource>)
// 0x0000000C TSource System.Linq.Enumerable::SingleOrDefault(System.Collections.Generic.IEnumerable`1<TSource>,System.Func`2<TSource,System.Boolean>)
// 0x0000000D System.Boolean System.Linq.Enumerable::Any(System.Collections.Generic.IEnumerable`1<TSource>)
// 0x0000000E System.Boolean System.Linq.Enumerable::Any(System.Collections.Generic.IEnumerable`1<TSource>,System.Func`2<TSource,System.Boolean>)
// 0x0000000F System.Int32 System.Linq.Enumerable::Count(System.Collections.Generic.IEnumerable`1<TSource>)
// 0x00000010 System.Boolean System.Linq.Enumerable::Contains(System.Collections.Generic.IEnumerable`1<TSource>,TSource)
// 0x00000011 System.Boolean System.Linq.Enumerable::Contains(System.Collections.Generic.IEnumerable`1<TSource>,TSource,System.Collections.Generic.IEqualityComparer`1<TSource>)
// 0x00000012 System.Void System.Linq.Enumerable/Iterator`1::.ctor()
// 0x00000013 TSource System.Linq.Enumerable/Iterator`1::get_Current()
// 0x00000014 System.Linq.Enumerable/Iterator`1<TSource> System.Linq.Enumerable/Iterator`1::Clone()
// 0x00000015 System.Void System.Linq.Enumerable/Iterator`1::Dispose()
// 0x00000016 System.Collections.Generic.IEnumerator`1<TSource> System.Linq.Enumerable/Iterator`1::GetEnumerator()
// 0x00000017 System.Boolean System.Linq.Enumerable/Iterator`1::MoveNext()
// 0x00000018 System.Collections.Generic.IEnumerable`1<TSource> System.Linq.Enumerable/Iterator`1::Where(System.Func`2<TSource,System.Boolean>)
// 0x00000019 System.Object System.Linq.Enumerable/Iterator`1::System.Collections.IEnumerator.get_Current()
// 0x0000001A System.Collections.IEnumerator System.Linq.Enumerable/Iterator`1::System.Collections.IEnumerable.GetEnumerator()
// 0x0000001B System.Void System.Linq.Enumerable/Iterator`1::System.Collections.IEnumerator.Reset()
// 0x0000001C System.Void System.Linq.Enumerable/WhereEnumerableIterator`1::.ctor(System.Collections.Generic.IEnumerable`1<TSource>,System.Func`2<TSource,System.Boolean>)
// 0x0000001D System.Linq.Enumerable/Iterator`1<TSource> System.Linq.Enumerable/WhereEnumerableIterator`1::Clone()
// 0x0000001E System.Void System.Linq.Enumerable/WhereEnumerableIterator`1::Dispose()
// 0x0000001F System.Boolean System.Linq.Enumerable/WhereEnumerableIterator`1::MoveNext()
// 0x00000020 System.Collections.Generic.IEnumerable`1<TSource> System.Linq.Enumerable/WhereEnumerableIterator`1::Where(System.Func`2<TSource,System.Boolean>)
// 0x00000021 System.Void System.Linq.Enumerable/WhereArrayIterator`1::.ctor(TSource[],System.Func`2<TSource,System.Boolean>)
// 0x00000022 System.Linq.Enumerable/Iterator`1<TSource> System.Linq.Enumerable/WhereArrayIterator`1::Clone()
// 0x00000023 System.Boolean System.Linq.Enumerable/WhereArrayIterator`1::MoveNext()
// 0x00000024 System.Collections.Generic.IEnumerable`1<TSource> System.Linq.Enumerable/WhereArrayIterator`1::Where(System.Func`2<TSource,System.Boolean>)
// 0x00000025 System.Void System.Linq.Enumerable/WhereListIterator`1::.ctor(System.Collections.Generic.List`1<TSource>,System.Func`2<TSource,System.Boolean>)
// 0x00000026 System.Linq.Enumerable/Iterator`1<TSource> System.Linq.Enumerable/WhereListIterator`1::Clone()
// 0x00000027 System.Boolean System.Linq.Enumerable/WhereListIterator`1::MoveNext()
// 0x00000028 System.Collections.Generic.IEnumerable`1<TSource> System.Linq.Enumerable/WhereListIterator`1::Where(System.Func`2<TSource,System.Boolean>)
// 0x00000029 System.Void System.Linq.Enumerable/<>c__DisplayClass6_0`1::.ctor()
// 0x0000002A System.Boolean System.Linq.Enumerable/<>c__DisplayClass6_0`1::<CombinePredicates>b__0(TSource)
// 0x0000002B System.Linq.IOrderedEnumerable`1<TElement> System.Linq.IOrderedEnumerable`1::CreateOrderedEnumerable(System.Func`2<TElement,TKey>,System.Collections.Generic.IComparer`1<TKey>,System.Boolean)
// 0x0000002C System.Collections.Generic.IEnumerator`1<TElement> System.Linq.OrderedEnumerable`1::GetEnumerator()
// 0x0000002D System.Linq.EnumerableSorter`1<TElement> System.Linq.OrderedEnumerable`1::GetEnumerableSorter(System.Linq.EnumerableSorter`1<TElement>)
// 0x0000002E System.Collections.IEnumerator System.Linq.OrderedEnumerable`1::System.Collections.IEnumerable.GetEnumerator()
// 0x0000002F System.Linq.IOrderedEnumerable`1<TElement> System.Linq.OrderedEnumerable`1::System.Linq.IOrderedEnumerable<TElement>.CreateOrderedEnumerable(System.Func`2<TElement,TKey>,System.Collections.Generic.IComparer`1<TKey>,System.Boolean)
// 0x00000030 System.Void System.Linq.OrderedEnumerable`1::.ctor()
// 0x00000031 System.Void System.Linq.OrderedEnumerable`1/<GetEnumerator>d__1::.ctor(System.Int32)
// 0x00000032 System.Void System.Linq.OrderedEnumerable`1/<GetEnumerator>d__1::System.IDisposable.Dispose()
// 0x00000033 System.Boolean System.Linq.OrderedEnumerable`1/<GetEnumerator>d__1::MoveNext()
// 0x00000034 TElement System.Linq.OrderedEnumerable`1/<GetEnumerator>d__1::System.Collections.Generic.IEnumerator<TElement>.get_Current()
// 0x00000035 System.Void System.Linq.OrderedEnumerable`1/<GetEnumerator>d__1::System.Collections.IEnumerator.Reset()
// 0x00000036 System.Object System.Linq.OrderedEnumerable`1/<GetEnumerator>d__1::System.Collections.IEnumerator.get_Current()
// 0x00000037 System.Void System.Linq.OrderedEnumerable`2::.ctor(System.Collections.Generic.IEnumerable`1<TElement>,System.Func`2<TElement,TKey>,System.Collections.Generic.IComparer`1<TKey>,System.Boolean)
// 0x00000038 System.Linq.EnumerableSorter`1<TElement> System.Linq.OrderedEnumerable`2::GetEnumerableSorter(System.Linq.EnumerableSorter`1<TElement>)
// 0x00000039 System.Void System.Linq.EnumerableSorter`1::ComputeKeys(TElement[],System.Int32)
// 0x0000003A System.Int32 System.Linq.EnumerableSorter`1::CompareKeys(System.Int32,System.Int32)
// 0x0000003B System.Int32[] System.Linq.EnumerableSorter`1::Sort(TElement[],System.Int32)
// 0x0000003C System.Void System.Linq.EnumerableSorter`1::QuickSort(System.Int32[],System.Int32,System.Int32)
// 0x0000003D System.Void System.Linq.EnumerableSorter`1::.ctor()
// 0x0000003E System.Void System.Linq.EnumerableSorter`2::.ctor(System.Func`2<TElement,TKey>,System.Collections.Generic.IComparer`1<TKey>,System.Boolean,System.Linq.EnumerableSorter`1<TElement>)
// 0x0000003F System.Void System.Linq.EnumerableSorter`2::ComputeKeys(TElement[],System.Int32)
// 0x00000040 System.Int32 System.Linq.EnumerableSorter`2::CompareKeys(System.Int32,System.Int32)
// 0x00000041 System.Void System.Linq.Buffer`1::.ctor(System.Collections.Generic.IEnumerable`1<TElement>)
// 0x00000042 TElement[] System.Linq.Buffer`1::ToArray()
// 0x00000043 System.Void System.Collections.Generic.HashSet`1::.ctor()
// 0x00000044 System.Void System.Collections.Generic.HashSet`1::.ctor(System.Collections.Generic.IEqualityComparer`1<T>)
// 0x00000045 System.Void System.Collections.Generic.HashSet`1::.ctor(System.Collections.Generic.IEnumerable`1<T>)
// 0x00000046 System.Void System.Collections.Generic.HashSet`1::.ctor(System.Collections.Generic.IEnumerable`1<T>,System.Collections.Generic.IEqualityComparer`1<T>)
// 0x00000047 System.Void System.Collections.Generic.HashSet`1::.ctor(System.Runtime.Serialization.SerializationInfo,System.Runtime.Serialization.StreamingContext)
// 0x00000048 System.Void System.Collections.Generic.HashSet`1::CopyFrom(System.Collections.Generic.HashSet`1<T>)
// 0x00000049 System.Void System.Collections.Generic.HashSet`1::System.Collections.Generic.ICollection<T>.Add(T)
// 0x0000004A System.Void System.Collections.Generic.HashSet`1::Clear()
// 0x0000004B System.Boolean System.Collections.Generic.HashSet`1::Contains(T)
// 0x0000004C System.Void System.Collections.Generic.HashSet`1::CopyTo(T[],System.Int32)
// 0x0000004D System.Boolean System.Collections.Generic.HashSet`1::Remove(T)
// 0x0000004E System.Int32 System.Collections.Generic.HashSet`1::get_Count()
// 0x0000004F System.Boolean System.Collections.Generic.HashSet`1::System.Collections.Generic.ICollection<T>.get_IsReadOnly()
// 0x00000050 System.Collections.Generic.HashSet`1/Enumerator<T> System.Collections.Generic.HashSet`1::GetEnumerator()
// 0x00000051 System.Collections.Generic.IEnumerator`1<T> System.Collections.Generic.HashSet`1::System.Collections.Generic.IEnumerable<T>.GetEnumerator()
// 0x00000052 System.Collections.IEnumerator System.Collections.Generic.HashSet`1::System.Collections.IEnumerable.GetEnumerator()
// 0x00000053 System.Void System.Collections.Generic.HashSet`1::GetObjectData(System.Runtime.Serialization.SerializationInfo,System.Runtime.Serialization.StreamingContext)
// 0x00000054 System.Void System.Collections.Generic.HashSet`1::OnDeserialization(System.Object)
// 0x00000055 System.Boolean System.Collections.Generic.HashSet`1::Add(T)
// 0x00000056 System.Void System.Collections.Generic.HashSet`1::UnionWith(System.Collections.Generic.IEnumerable`1<T>)
// 0x00000057 System.Void System.Collections.Generic.HashSet`1::CopyTo(T[])
// 0x00000058 System.Void System.Collections.Generic.HashSet`1::CopyTo(T[],System.Int32,System.Int32)
// 0x00000059 System.Collections.Generic.IEqualityComparer`1<T> System.Collections.Generic.HashSet`1::get_Comparer()
// 0x0000005A System.Void System.Collections.Generic.HashSet`1::TrimExcess()
// 0x0000005B System.Void System.Collections.Generic.HashSet`1::Initialize(System.Int32)
// 0x0000005C System.Void System.Collections.Generic.HashSet`1::IncreaseCapacity()
// 0x0000005D System.Void System.Collections.Generic.HashSet`1::SetCapacity(System.Int32)
// 0x0000005E System.Boolean System.Collections.Generic.HashSet`1::AddIfNotPresent(T)
// 0x0000005F System.Void System.Collections.Generic.HashSet`1::AddValue(System.Int32,System.Int32,T)
// 0x00000060 System.Boolean System.Collections.Generic.HashSet`1::AreEqualityComparersEqual(System.Collections.Generic.HashSet`1<T>,System.Collections.Generic.HashSet`1<T>)
// 0x00000061 System.Int32 System.Collections.Generic.HashSet`1::InternalGetHashCode(T)
// 0x00000062 System.Void System.Collections.Generic.HashSet`1/Enumerator::.ctor(System.Collections.Generic.HashSet`1<T>)
// 0x00000063 System.Void System.Collections.Generic.HashSet`1/Enumerator::Dispose()
// 0x00000064 System.Boolean System.Collections.Generic.HashSet`1/Enumerator::MoveNext()
// 0x00000065 T System.Collections.Generic.HashSet`1/Enumerator::get_Current()
// 0x00000066 System.Object System.Collections.Generic.HashSet`1/Enumerator::System.Collections.IEnumerator.get_Current()
// 0x00000067 System.Void System.Collections.Generic.HashSet`1/Enumerator::System.Collections.IEnumerator.Reset()
static Il2CppMethodPointer s_methodPointers[103] = 
{
	Error_ArgumentNull_m0EDA0D46D72CA692518E3E2EB75B48044D8FD41E,
	Error_MoreThanOneMatch_m4C4756AF34A76EF12F3B2B6D8C78DE547F0FBCF8,
	Error_NoElements_mB89E91246572F009281D79730950808F17C3F353,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
	NULL,
};
static const int32_t s_InvokerIndices[103] = 
{
	2300,
	2381,
	2381,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
	-1,
};
static const Il2CppTokenRangePair s_rgctxIndices[28] = 
{
	{ 0x02000004, { 47, 4 } },
	{ 0x02000005, { 51, 9 } },
	{ 0x02000006, { 60, 7 } },
	{ 0x02000007, { 67, 10 } },
	{ 0x02000008, { 77, 1 } },
	{ 0x0200000A, { 78, 3 } },
	{ 0x0200000B, { 83, 5 } },
	{ 0x0200000C, { 88, 7 } },
	{ 0x0200000D, { 95, 3 } },
	{ 0x0200000E, { 98, 7 } },
	{ 0x0200000F, { 105, 4 } },
	{ 0x02000010, { 109, 34 } },
	{ 0x02000012, { 143, 2 } },
	{ 0x06000004, { 0, 10 } },
	{ 0x06000005, { 10, 5 } },
	{ 0x06000006, { 15, 2 } },
	{ 0x06000007, { 17, 1 } },
	{ 0x06000008, { 18, 3 } },
	{ 0x06000009, { 21, 2 } },
	{ 0x0600000A, { 23, 4 } },
	{ 0x0600000B, { 27, 4 } },
	{ 0x0600000C, { 31, 3 } },
	{ 0x0600000D, { 34, 1 } },
	{ 0x0600000E, { 35, 3 } },
	{ 0x0600000F, { 38, 2 } },
	{ 0x06000010, { 40, 2 } },
	{ 0x06000011, { 42, 5 } },
	{ 0x0600002F, { 81, 2 } },
};
static const Il2CppRGCTXDefinition s_rgctxValues[145] = 
{
	{ (Il2CppRGCTXDataType)2, 1190 },
	{ (Il2CppRGCTXDataType)3, 4218 },
	{ (Il2CppRGCTXDataType)2, 1982 },
	{ (Il2CppRGCTXDataType)2, 1685 },
	{ (Il2CppRGCTXDataType)3, 7181 },
	{ (Il2CppRGCTXDataType)2, 1267 },
	{ (Il2CppRGCTXDataType)2, 1689 },
	{ (Il2CppRGCTXDataType)3, 7194 },
	{ (Il2CppRGCTXDataType)2, 1687 },
	{ (Il2CppRGCTXDataType)3, 7187 },
	{ (Il2CppRGCTXDataType)2, 435 },
	{ (Il2CppRGCTXDataType)3, 19 },
	{ (Il2CppRGCTXDataType)3, 20 },
	{ (Il2CppRGCTXDataType)2, 795 },
	{ (Il2CppRGCTXDataType)3, 3097 },
	{ (Il2CppRGCTXDataType)2, 1500 },
	{ (Il2CppRGCTXDataType)3, 6241 },
	{ (Il2CppRGCTXDataType)3, 3449 },
	{ (Il2CppRGCTXDataType)2, 494 },
	{ (Il2CppRGCTXDataType)3, 439 },
	{ (Il2CppRGCTXDataType)3, 440 },
	{ (Il2CppRGCTXDataType)2, 1268 },
	{ (Il2CppRGCTXDataType)3, 4637 },
	{ (Il2CppRGCTXDataType)2, 1132 },
	{ (Il2CppRGCTXDataType)2, 870 },
	{ (Il2CppRGCTXDataType)2, 953 },
	{ (Il2CppRGCTXDataType)2, 1002 },
	{ (Il2CppRGCTXDataType)2, 1133 },
	{ (Il2CppRGCTXDataType)2, 871 },
	{ (Il2CppRGCTXDataType)2, 954 },
	{ (Il2CppRGCTXDataType)2, 1003 },
	{ (Il2CppRGCTXDataType)2, 955 },
	{ (Il2CppRGCTXDataType)2, 1004 },
	{ (Il2CppRGCTXDataType)3, 3098 },
	{ (Il2CppRGCTXDataType)2, 946 },
	{ (Il2CppRGCTXDataType)2, 947 },
	{ (Il2CppRGCTXDataType)2, 1000 },
	{ (Il2CppRGCTXDataType)3, 3096 },
	{ (Il2CppRGCTXDataType)2, 869 },
	{ (Il2CppRGCTXDataType)2, 952 },
	{ (Il2CppRGCTXDataType)2, 868 },
	{ (Il2CppRGCTXDataType)3, 8685 },
	{ (Il2CppRGCTXDataType)3, 2754 },
	{ (Il2CppRGCTXDataType)2, 703 },
	{ (Il2CppRGCTXDataType)2, 949 },
	{ (Il2CppRGCTXDataType)2, 1001 },
	{ (Il2CppRGCTXDataType)2, 1049 },
	{ (Il2CppRGCTXDataType)3, 4219 },
	{ (Il2CppRGCTXDataType)3, 4221 },
	{ (Il2CppRGCTXDataType)2, 313 },
	{ (Il2CppRGCTXDataType)3, 4220 },
	{ (Il2CppRGCTXDataType)3, 4229 },
	{ (Il2CppRGCTXDataType)2, 1193 },
	{ (Il2CppRGCTXDataType)2, 1688 },
	{ (Il2CppRGCTXDataType)3, 7188 },
	{ (Il2CppRGCTXDataType)3, 4230 },
	{ (Il2CppRGCTXDataType)2, 980 },
	{ (Il2CppRGCTXDataType)2, 1023 },
	{ (Il2CppRGCTXDataType)3, 3103 },
	{ (Il2CppRGCTXDataType)3, 8680 },
	{ (Il2CppRGCTXDataType)3, 4222 },
	{ (Il2CppRGCTXDataType)2, 1192 },
	{ (Il2CppRGCTXDataType)2, 1686 },
	{ (Il2CppRGCTXDataType)3, 7182 },
	{ (Il2CppRGCTXDataType)3, 3102 },
	{ (Il2CppRGCTXDataType)3, 4223 },
	{ (Il2CppRGCTXDataType)3, 8679 },
	{ (Il2CppRGCTXDataType)3, 4236 },
	{ (Il2CppRGCTXDataType)2, 1194 },
	{ (Il2CppRGCTXDataType)2, 1690 },
	{ (Il2CppRGCTXDataType)3, 7195 },
	{ (Il2CppRGCTXDataType)3, 4680 },
	{ (Il2CppRGCTXDataType)3, 2241 },
	{ (Il2CppRGCTXDataType)3, 3104 },
	{ (Il2CppRGCTXDataType)3, 2240 },
	{ (Il2CppRGCTXDataType)3, 4237 },
	{ (Il2CppRGCTXDataType)3, 8681 },
	{ (Il2CppRGCTXDataType)3, 3101 },
	{ (Il2CppRGCTXDataType)2, 436 },
	{ (Il2CppRGCTXDataType)3, 23 },
	{ (Il2CppRGCTXDataType)3, 6228 },
	{ (Il2CppRGCTXDataType)2, 1501 },
	{ (Il2CppRGCTXDataType)3, 6242 },
	{ (Il2CppRGCTXDataType)2, 495 },
	{ (Il2CppRGCTXDataType)3, 441 },
	{ (Il2CppRGCTXDataType)3, 6234 },
	{ (Il2CppRGCTXDataType)3, 2221 },
	{ (Il2CppRGCTXDataType)2, 329 },
	{ (Il2CppRGCTXDataType)3, 6229 },
	{ (Il2CppRGCTXDataType)2, 1497 },
	{ (Il2CppRGCTXDataType)3, 467 },
	{ (Il2CppRGCTXDataType)2, 507 },
	{ (Il2CppRGCTXDataType)2, 689 },
	{ (Il2CppRGCTXDataType)3, 2227 },
	{ (Il2CppRGCTXDataType)3, 6230 },
	{ (Il2CppRGCTXDataType)3, 2216 },
	{ (Il2CppRGCTXDataType)3, 2217 },
	{ (Il2CppRGCTXDataType)3, 2215 },
	{ (Il2CppRGCTXDataType)3, 2218 },
	{ (Il2CppRGCTXDataType)2, 685 },
	{ (Il2CppRGCTXDataType)2, 2044 },
	{ (Il2CppRGCTXDataType)3, 3100 },
	{ (Il2CppRGCTXDataType)3, 2220 },
	{ (Il2CppRGCTXDataType)2, 932 },
	{ (Il2CppRGCTXDataType)3, 2219 },
	{ (Il2CppRGCTXDataType)2, 872 },
	{ (Il2CppRGCTXDataType)2, 2005 },
	{ (Il2CppRGCTXDataType)2, 958 },
	{ (Il2CppRGCTXDataType)2, 1005 },
	{ (Il2CppRGCTXDataType)3, 2770 },
	{ (Il2CppRGCTXDataType)2, 711 },
	{ (Il2CppRGCTXDataType)3, 3293 },
	{ (Il2CppRGCTXDataType)3, 3294 },
	{ (Il2CppRGCTXDataType)2, 851 },
	{ (Il2CppRGCTXDataType)3, 3297 },
	{ (Il2CppRGCTXDataType)2, 851 },
	{ (Il2CppRGCTXDataType)3, 3298 },
	{ (Il2CppRGCTXDataType)2, 873 },
	{ (Il2CppRGCTXDataType)3, 3302 },
	{ (Il2CppRGCTXDataType)3, 3306 },
	{ (Il2CppRGCTXDataType)3, 3305 },
	{ (Il2CppRGCTXDataType)2, 2058 },
	{ (Il2CppRGCTXDataType)3, 3296 },
	{ (Il2CppRGCTXDataType)3, 3295 },
	{ (Il2CppRGCTXDataType)3, 3303 },
	{ (Il2CppRGCTXDataType)2, 1057 },
	{ (Il2CppRGCTXDataType)3, 3300 },
	{ (Il2CppRGCTXDataType)3, 8931 },
	{ (Il2CppRGCTXDataType)2, 690 },
	{ (Il2CppRGCTXDataType)3, 2234 },
	{ (Il2CppRGCTXDataType)1, 929 },
	{ (Il2CppRGCTXDataType)2, 2013 },
	{ (Il2CppRGCTXDataType)3, 3299 },
	{ (Il2CppRGCTXDataType)1, 2013 },
	{ (Il2CppRGCTXDataType)1, 1057 },
	{ (Il2CppRGCTXDataType)2, 2058 },
	{ (Il2CppRGCTXDataType)2, 2013 },
	{ (Il2CppRGCTXDataType)2, 960 },
	{ (Il2CppRGCTXDataType)2, 1007 },
	{ (Il2CppRGCTXDataType)3, 3304 },
	{ (Il2CppRGCTXDataType)3, 3301 },
	{ (Il2CppRGCTXDataType)3, 3307 },
	{ (Il2CppRGCTXDataType)2, 224 },
	{ (Il2CppRGCTXDataType)3, 2242 },
	{ (Il2CppRGCTXDataType)2, 319 },
};
extern const CustomAttributesCacheGenerator g_System_Core_AttributeGenerators[];
IL2CPP_EXTERN_C const Il2CppCodeGenModule g_System_Core_CodeGenModule;
const Il2CppCodeGenModule g_System_Core_CodeGenModule = 
{
	"System.Core.dll",
	103,
	s_methodPointers,
	0,
	NULL,
	s_InvokerIndices,
	0,
	NULL,
	28,
	s_rgctxIndices,
	145,
	s_rgctxValues,
	NULL,
	g_System_Core_AttributeGenerators,
	NULL, // module initializer,
	NULL,
	NULL,
	NULL,
};
