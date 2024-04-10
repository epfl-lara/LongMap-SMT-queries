; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68490 () Bool)

(assert start!68490)

(declare-fun b!796280 () Bool)

(declare-fun e!441861 () Bool)

(declare-fun e!441862 () Bool)

(assert (=> b!796280 (= e!441861 e!441862)))

(declare-fun res!540808 () Bool)

(assert (=> b!796280 (=> (not res!540808) (not e!441862))))

(declare-datatypes ((SeekEntryResult!8311 0))(
  ( (MissingZero!8311 (index!35612 (_ BitVec 32))) (Found!8311 (index!35613 (_ BitVec 32))) (Intermediate!8311 (undefined!9123 Bool) (index!35614 (_ BitVec 32)) (x!66517 (_ BitVec 32))) (Undefined!8311) (MissingVacant!8311 (index!35615 (_ BitVec 32))) )
))
(declare-fun lt!355034 () SeekEntryResult!8311)

(declare-fun lt!355029 () SeekEntryResult!8311)

(declare-datatypes ((array!43280 0))(
  ( (array!43281 (arr!20720 (Array (_ BitVec 32) (_ BitVec 64))) (size!21141 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43280)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!796280 (= res!540808 (and (= lt!355029 lt!355034) (= lt!355034 (Found!8311 j!153)) (= (select (arr!20720 a!3170) index!1236) (select (arr!20720 a!3170) j!153))))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43280 (_ BitVec 32)) SeekEntryResult!8311)

(assert (=> b!796280 (= lt!355034 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20720 a!3170) j!153) a!3170 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43280 (_ BitVec 32)) SeekEntryResult!8311)

(assert (=> b!796280 (= lt!355029 (seekEntryOrOpen!0 (select (arr!20720 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796281 () Bool)

(declare-fun res!540803 () Bool)

(declare-fun e!441860 () Bool)

(assert (=> b!796281 (=> (not res!540803) (not e!441860))))

(declare-datatypes ((List!14683 0))(
  ( (Nil!14680) (Cons!14679 (h!15808 (_ BitVec 64)) (t!20998 List!14683)) )
))
(declare-fun arrayNoDuplicates!0 (array!43280 (_ BitVec 32) List!14683) Bool)

(assert (=> b!796281 (= res!540803 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14680))))

(declare-fun b!796282 () Bool)

(declare-fun e!441863 () Bool)

(assert (=> b!796282 (= e!441863 e!441860)))

(declare-fun res!540807 () Bool)

(assert (=> b!796282 (=> (not res!540807) (not e!441860))))

(declare-fun lt!355028 () SeekEntryResult!8311)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796282 (= res!540807 (or (= lt!355028 (MissingZero!8311 i!1163)) (= lt!355028 (MissingVacant!8311 i!1163))))))

(declare-fun k!2044 () (_ BitVec 64))

(assert (=> b!796282 (= lt!355028 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796283 () Bool)

(declare-fun res!540801 () Bool)

(assert (=> b!796283 (=> (not res!540801) (not e!441863))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796283 (= res!540801 (validKeyInArray!0 (select (arr!20720 a!3170) j!153)))))

(declare-fun b!796284 () Bool)

(declare-fun res!540804 () Bool)

(assert (=> b!796284 (=> (not res!540804) (not e!441863))))

(assert (=> b!796284 (= res!540804 (validKeyInArray!0 k!2044))))

(declare-fun b!796285 () Bool)

(declare-fun res!540802 () Bool)

(assert (=> b!796285 (=> (not res!540802) (not e!441860))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(assert (=> b!796285 (= res!540802 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21141 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20720 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21141 a!3170)) (= (select (arr!20720 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!796286 () Bool)

(declare-fun res!540809 () Bool)

(assert (=> b!796286 (=> (not res!540809) (not e!441863))))

(assert (=> b!796286 (= res!540809 (and (= (size!21141 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21141 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21141 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796287 () Bool)

(declare-fun res!540806 () Bool)

(assert (=> b!796287 (=> (not res!540806) (not e!441863))))

(declare-fun arrayContainsKey!0 (array!43280 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796287 (= res!540806 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796288 () Bool)

(assert (=> b!796288 (= e!441860 e!441861)))

(declare-fun res!540800 () Bool)

(assert (=> b!796288 (=> (not res!540800) (not e!441861))))

(declare-fun lt!355031 () SeekEntryResult!8311)

(declare-fun lt!355030 () SeekEntryResult!8311)

(assert (=> b!796288 (= res!540800 (= lt!355031 lt!355030))))

(declare-fun lt!355033 () (_ BitVec 64))

(declare-fun lt!355032 () array!43280)

(assert (=> b!796288 (= lt!355030 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!355033 lt!355032 mask!3266))))

(assert (=> b!796288 (= lt!355031 (seekEntryOrOpen!0 lt!355033 lt!355032 mask!3266))))

(assert (=> b!796288 (= lt!355033 (select (store (arr!20720 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796288 (= lt!355032 (array!43281 (store (arr!20720 a!3170) i!1163 k!2044) (size!21141 a!3170)))))

(declare-fun b!796289 () Bool)

(assert (=> b!796289 (= e!441862 (not true))))

(assert (=> b!796289 (= lt!355030 (Found!8311 index!1236))))

(declare-fun res!540799 () Bool)

(assert (=> start!68490 (=> (not res!540799) (not e!441863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68490 (= res!540799 (validMask!0 mask!3266))))

(assert (=> start!68490 e!441863))

(assert (=> start!68490 true))

(declare-fun array_inv!16516 (array!43280) Bool)

(assert (=> start!68490 (array_inv!16516 a!3170)))

(declare-fun b!796290 () Bool)

(declare-fun res!540805 () Bool)

(assert (=> b!796290 (=> (not res!540805) (not e!441860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43280 (_ BitVec 32)) Bool)

(assert (=> b!796290 (= res!540805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(assert (= (and start!68490 res!540799) b!796286))

(assert (= (and b!796286 res!540809) b!796283))

(assert (= (and b!796283 res!540801) b!796284))

(assert (= (and b!796284 res!540804) b!796287))

(assert (= (and b!796287 res!540806) b!796282))

(assert (= (and b!796282 res!540807) b!796290))

(assert (= (and b!796290 res!540805) b!796281))

(assert (= (and b!796281 res!540803) b!796285))

(assert (= (and b!796285 res!540802) b!796288))

(assert (= (and b!796288 res!540800) b!796280))

(assert (= (and b!796280 res!540808) b!796289))

(declare-fun m!737051 () Bool)

(assert (=> b!796290 m!737051))

(declare-fun m!737053 () Bool)

(assert (=> b!796284 m!737053))

(declare-fun m!737055 () Bool)

(assert (=> b!796280 m!737055))

(declare-fun m!737057 () Bool)

(assert (=> b!796280 m!737057))

(assert (=> b!796280 m!737057))

(declare-fun m!737059 () Bool)

(assert (=> b!796280 m!737059))

(assert (=> b!796280 m!737057))

(declare-fun m!737061 () Bool)

(assert (=> b!796280 m!737061))

(declare-fun m!737063 () Bool)

(assert (=> b!796285 m!737063))

(declare-fun m!737065 () Bool)

(assert (=> b!796285 m!737065))

(assert (=> b!796283 m!737057))

(assert (=> b!796283 m!737057))

(declare-fun m!737067 () Bool)

(assert (=> b!796283 m!737067))

(declare-fun m!737069 () Bool)

(assert (=> b!796282 m!737069))

(declare-fun m!737071 () Bool)

(assert (=> start!68490 m!737071))

(declare-fun m!737073 () Bool)

(assert (=> start!68490 m!737073))

(declare-fun m!737075 () Bool)

(assert (=> b!796287 m!737075))

(declare-fun m!737077 () Bool)

(assert (=> b!796281 m!737077))

(declare-fun m!737079 () Bool)

(assert (=> b!796288 m!737079))

(declare-fun m!737081 () Bool)

(assert (=> b!796288 m!737081))

(declare-fun m!737083 () Bool)

(assert (=> b!796288 m!737083))

(declare-fun m!737085 () Bool)

(assert (=> b!796288 m!737085))

(push 1)

(assert (not b!796281))

(assert (not b!796283))

