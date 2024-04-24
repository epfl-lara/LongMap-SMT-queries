; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69092 () Bool)

(assert start!69092)

(declare-fun b!804905 () Bool)

(declare-fun res!548884 () Bool)

(declare-fun e!446047 () Bool)

(assert (=> b!804905 (=> (not res!548884) (not e!446047))))

(declare-datatypes ((array!43714 0))(
  ( (array!43715 (arr!20932 (Array (_ BitVec 32) (_ BitVec 64))) (size!21352 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43714)

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43714 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!804905 (= res!548884 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!804906 () Bool)

(declare-fun e!446048 () Bool)

(declare-fun e!446049 () Bool)

(assert (=> b!804906 (= e!446048 e!446049)))

(declare-fun res!548886 () Bool)

(assert (=> b!804906 (=> (not res!548886) (not e!446049))))

(declare-datatypes ((SeekEntryResult!8479 0))(
  ( (MissingZero!8479 (index!36284 (_ BitVec 32))) (Found!8479 (index!36285 (_ BitVec 32))) (Intermediate!8479 (undefined!9291 Bool) (index!36286 (_ BitVec 32)) (x!67283 (_ BitVec 32))) (Undefined!8479) (MissingVacant!8479 (index!36287 (_ BitVec 32))) )
))
(declare-fun lt!360375 () SeekEntryResult!8479)

(declare-fun lt!360374 () SeekEntryResult!8479)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!804906 (= res!548886 (and (= lt!360375 lt!360374) (= lt!360374 (Found!8479 j!153)) (not (= (select (arr!20932 a!3170) index!1236) (select (arr!20932 a!3170) j!153)))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43714 (_ BitVec 32)) SeekEntryResult!8479)

(assert (=> b!804906 (= lt!360374 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20932 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43714 (_ BitVec 32)) SeekEntryResult!8479)

(assert (=> b!804906 (= lt!360375 (seekEntryOrOpen!0 (select (arr!20932 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!804907 () Bool)

(assert (=> b!804907 (= e!446049 (not true))))

(declare-fun lt!360380 () array!43714)

(declare-fun lt!360377 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!360376 () (_ BitVec 64))

(assert (=> b!804907 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360377 vacantAfter!23 lt!360376 lt!360380 mask!3266) (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!360377 vacantBefore!23 (select (arr!20932 a!3170) j!153) a!3170 mask!3266))))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((Unit!27583 0))(
  ( (Unit!27584) )
))
(declare-fun lt!360379 () Unit!27583)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 (array!43714 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!27583)

(assert (=> b!804907 (= lt!360379 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey2AfterFindingLongMinValueLater!0 a!3170 i!1163 k0!2044 j!153 lt!360377 (bvadd #b00000000000000000000000000000001 x!1077) vacantBefore!23 vacantAfter!23 mask!3266))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!804907 (= lt!360377 (nextIndex!0 index!1236 (bvadd #b00000000000000000000000000000001 x!1077) mask!3266))))

(declare-fun b!804908 () Bool)

(declare-fun res!548876 () Bool)

(assert (=> b!804908 (=> (not res!548876) (not e!446047))))

(assert (=> b!804908 (= res!548876 (and (= (size!21352 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21352 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21352 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!804909 () Bool)

(declare-fun e!446050 () Bool)

(assert (=> b!804909 (= e!446050 e!446048)))

(declare-fun res!548883 () Bool)

(assert (=> b!804909 (=> (not res!548883) (not e!446048))))

(assert (=> b!804909 (= res!548883 (= (seekEntryOrOpen!0 lt!360376 lt!360380 mask!3266) (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360376 lt!360380 mask!3266)))))

(assert (=> b!804909 (= lt!360376 (select (store (arr!20932 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!804909 (= lt!360380 (array!43715 (store (arr!20932 a!3170) i!1163 k0!2044) (size!21352 a!3170)))))

(declare-fun b!804910 () Bool)

(declare-fun res!548879 () Bool)

(assert (=> b!804910 (=> (not res!548879) (not e!446050))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43714 (_ BitVec 32)) Bool)

(assert (=> b!804910 (= res!548879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!804911 () Bool)

(assert (=> b!804911 (= e!446047 e!446050)))

(declare-fun res!548877 () Bool)

(assert (=> b!804911 (=> (not res!548877) (not e!446050))))

(declare-fun lt!360378 () SeekEntryResult!8479)

(assert (=> b!804911 (= res!548877 (or (= lt!360378 (MissingZero!8479 i!1163)) (= lt!360378 (MissingVacant!8479 i!1163))))))

(assert (=> b!804911 (= lt!360378 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!804913 () Bool)

(declare-fun res!548878 () Bool)

(assert (=> b!804913 (=> (not res!548878) (not e!446047))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!804913 (= res!548878 (validKeyInArray!0 k0!2044))))

(declare-fun b!804914 () Bool)

(declare-fun res!548885 () Bool)

(assert (=> b!804914 (=> (not res!548885) (not e!446050))))

(declare-datatypes ((List!14802 0))(
  ( (Nil!14799) (Cons!14798 (h!15933 (_ BitVec 64)) (t!21109 List!14802)) )
))
(declare-fun arrayNoDuplicates!0 (array!43714 (_ BitVec 32) List!14802) Bool)

(assert (=> b!804914 (= res!548885 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14799))))

(declare-fun b!804915 () Bool)

(declare-fun res!548881 () Bool)

(assert (=> b!804915 (=> (not res!548881) (not e!446047))))

(assert (=> b!804915 (= res!548881 (validKeyInArray!0 (select (arr!20932 a!3170) j!153)))))

(declare-fun res!548880 () Bool)

(assert (=> start!69092 (=> (not res!548880) (not e!446047))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69092 (= res!548880 (validMask!0 mask!3266))))

(assert (=> start!69092 e!446047))

(assert (=> start!69092 true))

(declare-fun array_inv!16791 (array!43714) Bool)

(assert (=> start!69092 (array_inv!16791 a!3170)))

(declare-fun b!804912 () Bool)

(declare-fun res!548882 () Bool)

(assert (=> b!804912 (=> (not res!548882) (not e!446050))))

(assert (=> b!804912 (= res!548882 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21352 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20932 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21352 a!3170)) (= (select (arr!20932 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69092 res!548880) b!804908))

(assert (= (and b!804908 res!548876) b!804915))

(assert (= (and b!804915 res!548881) b!804913))

(assert (= (and b!804913 res!548878) b!804905))

(assert (= (and b!804905 res!548884) b!804911))

(assert (= (and b!804911 res!548877) b!804910))

(assert (= (and b!804910 res!548879) b!804914))

(assert (= (and b!804914 res!548885) b!804912))

(assert (= (and b!804912 res!548882) b!804909))

(assert (= (and b!804909 res!548883) b!804906))

(assert (= (and b!804906 res!548886) b!804907))

(declare-fun m!747163 () Bool)

(assert (=> b!804915 m!747163))

(assert (=> b!804915 m!747163))

(declare-fun m!747165 () Bool)

(assert (=> b!804915 m!747165))

(declare-fun m!747167 () Bool)

(assert (=> b!804914 m!747167))

(declare-fun m!747169 () Bool)

(assert (=> b!804912 m!747169))

(declare-fun m!747171 () Bool)

(assert (=> b!804912 m!747171))

(declare-fun m!747173 () Bool)

(assert (=> start!69092 m!747173))

(declare-fun m!747175 () Bool)

(assert (=> start!69092 m!747175))

(declare-fun m!747177 () Bool)

(assert (=> b!804909 m!747177))

(declare-fun m!747179 () Bool)

(assert (=> b!804909 m!747179))

(declare-fun m!747181 () Bool)

(assert (=> b!804909 m!747181))

(declare-fun m!747183 () Bool)

(assert (=> b!804909 m!747183))

(declare-fun m!747185 () Bool)

(assert (=> b!804911 m!747185))

(declare-fun m!747187 () Bool)

(assert (=> b!804913 m!747187))

(assert (=> b!804907 m!747163))

(declare-fun m!747189 () Bool)

(assert (=> b!804907 m!747189))

(assert (=> b!804907 m!747163))

(declare-fun m!747191 () Bool)

(assert (=> b!804907 m!747191))

(declare-fun m!747193 () Bool)

(assert (=> b!804907 m!747193))

(declare-fun m!747195 () Bool)

(assert (=> b!804907 m!747195))

(declare-fun m!747197 () Bool)

(assert (=> b!804905 m!747197))

(declare-fun m!747199 () Bool)

(assert (=> b!804906 m!747199))

(assert (=> b!804906 m!747163))

(assert (=> b!804906 m!747163))

(declare-fun m!747201 () Bool)

(assert (=> b!804906 m!747201))

(assert (=> b!804906 m!747163))

(declare-fun m!747203 () Bool)

(assert (=> b!804906 m!747203))

(declare-fun m!747205 () Bool)

(assert (=> b!804910 m!747205))

(check-sat (not b!804911) (not b!804907) (not b!804914) (not b!804915) (not b!804913) (not b!804906) (not b!804905) (not b!804910) (not b!804909) (not start!69092))
(check-sat)
