; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69096 () Bool)

(assert start!69096)

(declare-fun b!805937 () Bool)

(declare-fun e!446317 () Bool)

(declare-fun e!446316 () Bool)

(assert (=> b!805937 (= e!446317 e!446316)))

(declare-fun res!550258 () Bool)

(assert (=> b!805937 (=> (not res!550258) (not e!446316))))

(declare-datatypes ((SeekEntryResult!8590 0))(
  ( (MissingZero!8590 (index!36728 (_ BitVec 32))) (Found!8590 (index!36729 (_ BitVec 32))) (Intermediate!8590 (undefined!9402 Bool) (index!36730 (_ BitVec 32)) (x!67543 (_ BitVec 32))) (Undefined!8590) (MissingVacant!8590 (index!36731 (_ BitVec 32))) )
))
(declare-fun lt!360886 () SeekEntryResult!8590)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!805937 (= res!550258 (or (= lt!360886 (MissingZero!8590 i!1163)) (= lt!360886 (MissingVacant!8590 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-datatypes ((array!43841 0))(
  ( (array!43842 (arr!20999 (Array (_ BitVec 32) (_ BitVec 64))) (size!21420 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43841)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43841 (_ BitVec 32)) SeekEntryResult!8590)

(assert (=> b!805937 (= lt!360886 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805938 () Bool)

(declare-fun res!550259 () Bool)

(assert (=> b!805938 (=> (not res!550259) (not e!446317))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805938 (= res!550259 (validKeyInArray!0 (select (arr!20999 a!3170) j!153)))))

(declare-fun b!805939 () Bool)

(declare-fun res!550265 () Bool)

(assert (=> b!805939 (=> (not res!550265) (not e!446316))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43841 (_ BitVec 32)) Bool)

(assert (=> b!805939 (= res!550265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805940 () Bool)

(declare-fun e!446314 () Bool)

(assert (=> b!805940 (= e!446316 e!446314)))

(declare-fun res!550262 () Bool)

(assert (=> b!805940 (=> (not res!550262) (not e!446314))))

(declare-fun lt!360884 () SeekEntryResult!8590)

(declare-fun lt!360887 () SeekEntryResult!8590)

(assert (=> b!805940 (= res!550262 (= lt!360884 lt!360887))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun lt!360889 () (_ BitVec 64))

(declare-fun lt!360885 () array!43841)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43841 (_ BitVec 32)) SeekEntryResult!8590)

(assert (=> b!805940 (= lt!360887 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360889 lt!360885 mask!3266))))

(assert (=> b!805940 (= lt!360884 (seekEntryOrOpen!0 lt!360889 lt!360885 mask!3266))))

(assert (=> b!805940 (= lt!360889 (select (store (arr!20999 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805940 (= lt!360885 (array!43842 (store (arr!20999 a!3170) i!1163 k!2044) (size!21420 a!3170)))))

(declare-fun b!805941 () Bool)

(declare-fun res!550266 () Bool)

(assert (=> b!805941 (=> (not res!550266) (not e!446316))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!805941 (= res!550266 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21420 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20999 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21420 a!3170)) (= (select (arr!20999 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!550263 () Bool)

(assert (=> start!69096 (=> (not res!550263) (not e!446317))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69096 (= res!550263 (validMask!0 mask!3266))))

(assert (=> start!69096 e!446317))

(assert (=> start!69096 true))

(declare-fun array_inv!16795 (array!43841) Bool)

(assert (=> start!69096 (array_inv!16795 a!3170)))

(declare-fun b!805942 () Bool)

(declare-fun e!446315 () Bool)

(assert (=> b!805942 (= e!446314 e!446315)))

(declare-fun res!550267 () Bool)

(assert (=> b!805942 (=> (not res!550267) (not e!446315))))

(declare-fun lt!360888 () SeekEntryResult!8590)

(declare-fun lt!360890 () SeekEntryResult!8590)

(assert (=> b!805942 (= res!550267 (and (= lt!360888 lt!360890) (= lt!360890 (Found!8590 j!153)) (= (select (arr!20999 a!3170) index!1236) (select (arr!20999 a!3170) j!153))))))

(assert (=> b!805942 (= lt!360890 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20999 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!805942 (= lt!360888 (seekEntryOrOpen!0 (select (arr!20999 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805943 () Bool)

(declare-fun res!550260 () Bool)

(assert (=> b!805943 (=> (not res!550260) (not e!446317))))

(assert (=> b!805943 (= res!550260 (validKeyInArray!0 k!2044))))

(declare-fun b!805944 () Bool)

(assert (=> b!805944 (= e!446315 (not true))))

(assert (=> b!805944 (= lt!360887 (Found!8590 index!1236))))

(declare-fun b!805945 () Bool)

(declare-fun res!550268 () Bool)

(assert (=> b!805945 (=> (not res!550268) (not e!446317))))

(assert (=> b!805945 (= res!550268 (and (= (size!21420 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21420 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21420 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805946 () Bool)

(declare-fun res!550264 () Bool)

(assert (=> b!805946 (=> (not res!550264) (not e!446316))))

(declare-datatypes ((List!14962 0))(
  ( (Nil!14959) (Cons!14958 (h!16087 (_ BitVec 64)) (t!21277 List!14962)) )
))
(declare-fun arrayNoDuplicates!0 (array!43841 (_ BitVec 32) List!14962) Bool)

(assert (=> b!805946 (= res!550264 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14959))))

(declare-fun b!805947 () Bool)

(declare-fun res!550261 () Bool)

(assert (=> b!805947 (=> (not res!550261) (not e!446317))))

(declare-fun arrayContainsKey!0 (array!43841 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805947 (= res!550261 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(assert (= (and start!69096 res!550263) b!805945))

(assert (= (and b!805945 res!550268) b!805938))

(assert (= (and b!805938 res!550259) b!805943))

(assert (= (and b!805943 res!550260) b!805947))

(assert (= (and b!805947 res!550261) b!805937))

(assert (= (and b!805937 res!550258) b!805939))

(assert (= (and b!805939 res!550265) b!805946))

(assert (= (and b!805946 res!550264) b!805941))

(assert (= (and b!805941 res!550266) b!805940))

(assert (= (and b!805940 res!550262) b!805942))

(assert (= (and b!805942 res!550267) b!805944))

(declare-fun m!747881 () Bool)

(assert (=> b!805939 m!747881))

(declare-fun m!747883 () Bool)

(assert (=> b!805943 m!747883))

(declare-fun m!747885 () Bool)

(assert (=> start!69096 m!747885))

(declare-fun m!747887 () Bool)

(assert (=> start!69096 m!747887))

(declare-fun m!747889 () Bool)

(assert (=> b!805937 m!747889))

(declare-fun m!747891 () Bool)

(assert (=> b!805940 m!747891))

(declare-fun m!747893 () Bool)

(assert (=> b!805940 m!747893))

(declare-fun m!747895 () Bool)

(assert (=> b!805940 m!747895))

(declare-fun m!747897 () Bool)

(assert (=> b!805940 m!747897))

(declare-fun m!747899 () Bool)

(assert (=> b!805938 m!747899))

(assert (=> b!805938 m!747899))

(declare-fun m!747901 () Bool)

(assert (=> b!805938 m!747901))

(declare-fun m!747903 () Bool)

(assert (=> b!805942 m!747903))

(assert (=> b!805942 m!747899))

(assert (=> b!805942 m!747899))

(declare-fun m!747905 () Bool)

(assert (=> b!805942 m!747905))

(assert (=> b!805942 m!747899))

(declare-fun m!747907 () Bool)

(assert (=> b!805942 m!747907))

(declare-fun m!747909 () Bool)

(assert (=> b!805947 m!747909))

(declare-fun m!747911 () Bool)

(assert (=> b!805941 m!747911))

(declare-fun m!747913 () Bool)

(assert (=> b!805941 m!747913))

(declare-fun m!747915 () Bool)

(assert (=> b!805946 m!747915))

(push 1)

(assert (not b!805939))

(assert (not b!805938))

(assert (not start!69096))

(assert (not b!805942))

(assert (not b!805937))

