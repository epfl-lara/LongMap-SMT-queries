; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69094 () Bool)

(assert start!69094)

(declare-fun b!805904 () Bool)

(declare-fun res!550226 () Bool)

(declare-fun e!446301 () Bool)

(assert (=> b!805904 (=> (not res!550226) (not e!446301))))

(declare-datatypes ((array!43839 0))(
  ( (array!43840 (arr!20998 (Array (_ BitVec 32) (_ BitVec 64))) (size!21419 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43839)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805904 (= res!550226 (validKeyInArray!0 (select (arr!20998 a!3170) j!153)))))

(declare-fun b!805905 () Bool)

(declare-fun res!550234 () Bool)

(assert (=> b!805905 (=> (not res!550234) (not e!446301))))

(declare-fun k0!2044 () (_ BitVec 64))

(assert (=> b!805905 (= res!550234 (validKeyInArray!0 k0!2044))))

(declare-fun b!805906 () Bool)

(declare-fun res!550232 () Bool)

(declare-fun e!446302 () Bool)

(assert (=> b!805906 (=> (not res!550232) (not e!446302))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805906 (= res!550232 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21419 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20998 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21419 a!3170)) (= (select (arr!20998 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!805907 () Bool)

(declare-fun res!550233 () Bool)

(assert (=> b!805907 (=> (not res!550233) (not e!446301))))

(declare-fun mask!3266 () (_ BitVec 32))

(assert (=> b!805907 (= res!550233 (and (= (size!21419 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21419 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21419 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805908 () Bool)

(assert (=> b!805908 (= e!446301 e!446302)))

(declare-fun res!550230 () Bool)

(assert (=> b!805908 (=> (not res!550230) (not e!446302))))

(declare-datatypes ((SeekEntryResult!8589 0))(
  ( (MissingZero!8589 (index!36724 (_ BitVec 32))) (Found!8589 (index!36725 (_ BitVec 32))) (Intermediate!8589 (undefined!9401 Bool) (index!36726 (_ BitVec 32)) (x!67542 (_ BitVec 32))) (Undefined!8589) (MissingVacant!8589 (index!36727 (_ BitVec 32))) )
))
(declare-fun lt!360869 () SeekEntryResult!8589)

(assert (=> b!805908 (= res!550230 (or (= lt!360869 (MissingZero!8589 i!1163)) (= lt!360869 (MissingVacant!8589 i!1163))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43839 (_ BitVec 32)) SeekEntryResult!8589)

(assert (=> b!805908 (= lt!360869 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!805909 () Bool)

(declare-fun e!446299 () Bool)

(assert (=> b!805909 (= e!446299 (not true))))

(declare-fun lt!360865 () SeekEntryResult!8589)

(assert (=> b!805909 (= lt!360865 (Found!8589 index!1236))))

(declare-fun res!550225 () Bool)

(assert (=> start!69094 (=> (not res!550225) (not e!446301))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69094 (= res!550225 (validMask!0 mask!3266))))

(assert (=> start!69094 e!446301))

(assert (=> start!69094 true))

(declare-fun array_inv!16794 (array!43839) Bool)

(assert (=> start!69094 (array_inv!16794 a!3170)))

(declare-fun b!805910 () Bool)

(declare-fun e!446303 () Bool)

(assert (=> b!805910 (= e!446302 e!446303)))

(declare-fun res!550228 () Bool)

(assert (=> b!805910 (=> (not res!550228) (not e!446303))))

(declare-fun lt!360867 () SeekEntryResult!8589)

(assert (=> b!805910 (= res!550228 (= lt!360867 lt!360865))))

(declare-fun lt!360866 () (_ BitVec 64))

(declare-fun lt!360868 () array!43839)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43839 (_ BitVec 32)) SeekEntryResult!8589)

(assert (=> b!805910 (= lt!360865 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360866 lt!360868 mask!3266))))

(assert (=> b!805910 (= lt!360867 (seekEntryOrOpen!0 lt!360866 lt!360868 mask!3266))))

(assert (=> b!805910 (= lt!360866 (select (store (arr!20998 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!805910 (= lt!360868 (array!43840 (store (arr!20998 a!3170) i!1163 k0!2044) (size!21419 a!3170)))))

(declare-fun b!805911 () Bool)

(declare-fun res!550229 () Bool)

(assert (=> b!805911 (=> (not res!550229) (not e!446302))))

(declare-datatypes ((List!14961 0))(
  ( (Nil!14958) (Cons!14957 (h!16086 (_ BitVec 64)) (t!21276 List!14961)) )
))
(declare-fun arrayNoDuplicates!0 (array!43839 (_ BitVec 32) List!14961) Bool)

(assert (=> b!805911 (= res!550229 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14958))))

(declare-fun b!805912 () Bool)

(declare-fun res!550227 () Bool)

(assert (=> b!805912 (=> (not res!550227) (not e!446302))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43839 (_ BitVec 32)) Bool)

(assert (=> b!805912 (= res!550227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805913 () Bool)

(declare-fun res!550231 () Bool)

(assert (=> b!805913 (=> (not res!550231) (not e!446301))))

(declare-fun arrayContainsKey!0 (array!43839 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805913 (= res!550231 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805914 () Bool)

(assert (=> b!805914 (= e!446303 e!446299)))

(declare-fun res!550235 () Bool)

(assert (=> b!805914 (=> (not res!550235) (not e!446299))))

(declare-fun lt!360863 () SeekEntryResult!8589)

(declare-fun lt!360864 () SeekEntryResult!8589)

(assert (=> b!805914 (= res!550235 (and (= lt!360864 lt!360863) (= lt!360863 (Found!8589 j!153)) (= (select (arr!20998 a!3170) index!1236) (select (arr!20998 a!3170) j!153))))))

(assert (=> b!805914 (= lt!360863 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20998 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!805914 (= lt!360864 (seekEntryOrOpen!0 (select (arr!20998 a!3170) j!153) a!3170 mask!3266))))

(assert (= (and start!69094 res!550225) b!805907))

(assert (= (and b!805907 res!550233) b!805904))

(assert (= (and b!805904 res!550226) b!805905))

(assert (= (and b!805905 res!550234) b!805913))

(assert (= (and b!805913 res!550231) b!805908))

(assert (= (and b!805908 res!550230) b!805912))

(assert (= (and b!805912 res!550227) b!805911))

(assert (= (and b!805911 res!550229) b!805906))

(assert (= (and b!805906 res!550232) b!805910))

(assert (= (and b!805910 res!550228) b!805914))

(assert (= (and b!805914 res!550235) b!805909))

(declare-fun m!747845 () Bool)

(assert (=> b!805905 m!747845))

(declare-fun m!747847 () Bool)

(assert (=> b!805904 m!747847))

(assert (=> b!805904 m!747847))

(declare-fun m!747849 () Bool)

(assert (=> b!805904 m!747849))

(declare-fun m!747851 () Bool)

(assert (=> start!69094 m!747851))

(declare-fun m!747853 () Bool)

(assert (=> start!69094 m!747853))

(declare-fun m!747855 () Bool)

(assert (=> b!805911 m!747855))

(declare-fun m!747857 () Bool)

(assert (=> b!805906 m!747857))

(declare-fun m!747859 () Bool)

(assert (=> b!805906 m!747859))

(declare-fun m!747861 () Bool)

(assert (=> b!805908 m!747861))

(declare-fun m!747863 () Bool)

(assert (=> b!805914 m!747863))

(assert (=> b!805914 m!747847))

(assert (=> b!805914 m!747847))

(declare-fun m!747865 () Bool)

(assert (=> b!805914 m!747865))

(assert (=> b!805914 m!747847))

(declare-fun m!747867 () Bool)

(assert (=> b!805914 m!747867))

(declare-fun m!747869 () Bool)

(assert (=> b!805910 m!747869))

(declare-fun m!747871 () Bool)

(assert (=> b!805910 m!747871))

(declare-fun m!747873 () Bool)

(assert (=> b!805910 m!747873))

(declare-fun m!747875 () Bool)

(assert (=> b!805910 m!747875))

(declare-fun m!747877 () Bool)

(assert (=> b!805913 m!747877))

(declare-fun m!747879 () Bool)

(assert (=> b!805912 m!747879))

(check-sat (not b!805905) (not b!805908) (not b!805911) (not b!805914) (not start!69094) (not b!805910) (not b!805904) (not b!805913) (not b!805912))
(check-sat)
