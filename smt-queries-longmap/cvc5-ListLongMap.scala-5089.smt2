; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69092 () Bool)

(assert start!69092)

(declare-fun b!805871 () Bool)

(declare-fun res!550196 () Bool)

(declare-fun e!446285 () Bool)

(assert (=> b!805871 (=> (not res!550196) (not e!446285))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(declare-datatypes ((array!43837 0))(
  ( (array!43838 (arr!20997 (Array (_ BitVec 32) (_ BitVec 64))) (size!21418 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43837)

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!805871 (= res!550196 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21418 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20997 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21418 a!3170)) (= (select (arr!20997 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun res!550197 () Bool)

(declare-fun e!446284 () Bool)

(assert (=> start!69092 (=> (not res!550197) (not e!446284))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69092 (= res!550197 (validMask!0 mask!3266))))

(assert (=> start!69092 e!446284))

(assert (=> start!69092 true))

(declare-fun array_inv!16793 (array!43837) Bool)

(assert (=> start!69092 (array_inv!16793 a!3170)))

(declare-fun b!805872 () Bool)

(declare-fun res!550202 () Bool)

(assert (=> b!805872 (=> (not res!550202) (not e!446284))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!805872 (= res!550202 (validKeyInArray!0 (select (arr!20997 a!3170) j!153)))))

(declare-fun b!805873 () Bool)

(declare-fun e!446286 () Bool)

(declare-fun e!446288 () Bool)

(assert (=> b!805873 (= e!446286 e!446288)))

(declare-fun res!550192 () Bool)

(assert (=> b!805873 (=> (not res!550192) (not e!446288))))

(declare-datatypes ((SeekEntryResult!8588 0))(
  ( (MissingZero!8588 (index!36720 (_ BitVec 32))) (Found!8588 (index!36721 (_ BitVec 32))) (Intermediate!8588 (undefined!9400 Bool) (index!36722 (_ BitVec 32)) (x!67541 (_ BitVec 32))) (Undefined!8588) (MissingVacant!8588 (index!36723 (_ BitVec 32))) )
))
(declare-fun lt!360846 () SeekEntryResult!8588)

(declare-fun lt!360847 () SeekEntryResult!8588)

(assert (=> b!805873 (= res!550192 (and (= lt!360846 lt!360847) (= lt!360847 (Found!8588 j!153)) (= (select (arr!20997 a!3170) index!1236) (select (arr!20997 a!3170) j!153))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43837 (_ BitVec 32)) SeekEntryResult!8588)

(assert (=> b!805873 (= lt!360847 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20997 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43837 (_ BitVec 32)) SeekEntryResult!8588)

(assert (=> b!805873 (= lt!360846 (seekEntryOrOpen!0 (select (arr!20997 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!805874 () Bool)

(declare-fun res!550198 () Bool)

(assert (=> b!805874 (=> (not res!550198) (not e!446285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43837 (_ BitVec 32)) Bool)

(assert (=> b!805874 (= res!550198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!805875 () Bool)

(declare-fun res!550199 () Bool)

(assert (=> b!805875 (=> (not res!550199) (not e!446284))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!43837 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!805875 (= res!550199 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!805876 () Bool)

(declare-fun res!550194 () Bool)

(assert (=> b!805876 (=> (not res!550194) (not e!446284))))

(assert (=> b!805876 (= res!550194 (and (= (size!21418 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21418 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21418 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!805877 () Bool)

(assert (=> b!805877 (= e!446284 e!446285)))

(declare-fun res!550200 () Bool)

(assert (=> b!805877 (=> (not res!550200) (not e!446285))))

(declare-fun lt!360844 () SeekEntryResult!8588)

(assert (=> b!805877 (= res!550200 (or (= lt!360844 (MissingZero!8588 i!1163)) (= lt!360844 (MissingVacant!8588 i!1163))))))

(assert (=> b!805877 (= lt!360844 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!805878 () Bool)

(assert (=> b!805878 (= e!446285 e!446286)))

(declare-fun res!550195 () Bool)

(assert (=> b!805878 (=> (not res!550195) (not e!446286))))

(declare-fun lt!360843 () SeekEntryResult!8588)

(declare-fun lt!360842 () SeekEntryResult!8588)

(assert (=> b!805878 (= res!550195 (= lt!360843 lt!360842))))

(declare-fun lt!360848 () (_ BitVec 64))

(declare-fun lt!360845 () array!43837)

(assert (=> b!805878 (= lt!360842 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!360848 lt!360845 mask!3266))))

(assert (=> b!805878 (= lt!360843 (seekEntryOrOpen!0 lt!360848 lt!360845 mask!3266))))

(assert (=> b!805878 (= lt!360848 (select (store (arr!20997 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!805878 (= lt!360845 (array!43838 (store (arr!20997 a!3170) i!1163 k!2044) (size!21418 a!3170)))))

(declare-fun b!805879 () Bool)

(declare-fun res!550193 () Bool)

(assert (=> b!805879 (=> (not res!550193) (not e!446284))))

(assert (=> b!805879 (= res!550193 (validKeyInArray!0 k!2044))))

(declare-fun b!805880 () Bool)

(declare-fun res!550201 () Bool)

(assert (=> b!805880 (=> (not res!550201) (not e!446285))))

(declare-datatypes ((List!14960 0))(
  ( (Nil!14957) (Cons!14956 (h!16085 (_ BitVec 64)) (t!21275 List!14960)) )
))
(declare-fun arrayNoDuplicates!0 (array!43837 (_ BitVec 32) List!14960) Bool)

(assert (=> b!805880 (= res!550201 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14957))))

(declare-fun b!805881 () Bool)

(assert (=> b!805881 (= e!446288 (not true))))

(assert (=> b!805881 (= lt!360842 (Found!8588 index!1236))))

(assert (= (and start!69092 res!550197) b!805876))

(assert (= (and b!805876 res!550194) b!805872))

(assert (= (and b!805872 res!550202) b!805879))

(assert (= (and b!805879 res!550193) b!805875))

(assert (= (and b!805875 res!550199) b!805877))

(assert (= (and b!805877 res!550200) b!805874))

(assert (= (and b!805874 res!550198) b!805880))

(assert (= (and b!805880 res!550201) b!805871))

(assert (= (and b!805871 res!550196) b!805878))

(assert (= (and b!805878 res!550195) b!805873))

(assert (= (and b!805873 res!550192) b!805881))

(declare-fun m!747809 () Bool)

(assert (=> b!805878 m!747809))

(declare-fun m!747811 () Bool)

(assert (=> b!805878 m!747811))

(declare-fun m!747813 () Bool)

(assert (=> b!805878 m!747813))

(declare-fun m!747815 () Bool)

(assert (=> b!805878 m!747815))

(declare-fun m!747817 () Bool)

(assert (=> b!805873 m!747817))

(declare-fun m!747819 () Bool)

(assert (=> b!805873 m!747819))

(assert (=> b!805873 m!747819))

(declare-fun m!747821 () Bool)

(assert (=> b!805873 m!747821))

(assert (=> b!805873 m!747819))

(declare-fun m!747823 () Bool)

(assert (=> b!805873 m!747823))

(declare-fun m!747825 () Bool)

(assert (=> b!805875 m!747825))

(declare-fun m!747827 () Bool)

(assert (=> start!69092 m!747827))

(declare-fun m!747829 () Bool)

(assert (=> start!69092 m!747829))

(declare-fun m!747831 () Bool)

(assert (=> b!805877 m!747831))

(assert (=> b!805872 m!747819))

(assert (=> b!805872 m!747819))

(declare-fun m!747833 () Bool)

(assert (=> b!805872 m!747833))

(declare-fun m!747835 () Bool)

(assert (=> b!805879 m!747835))

(declare-fun m!747837 () Bool)

(assert (=> b!805880 m!747837))

(declare-fun m!747839 () Bool)

(assert (=> b!805871 m!747839))

(declare-fun m!747841 () Bool)

(assert (=> b!805871 m!747841))

(declare-fun m!747843 () Bool)

(assert (=> b!805874 m!747843))

(push 1)

