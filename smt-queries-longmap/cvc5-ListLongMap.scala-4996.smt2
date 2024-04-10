; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!68486 () Bool)

(assert start!68486)

(declare-fun b!796214 () Bool)

(declare-fun res!540735 () Bool)

(declare-fun e!441831 () Bool)

(assert (=> b!796214 (=> (not res!540735) (not e!441831))))

(declare-datatypes ((array!43276 0))(
  ( (array!43277 (arr!20718 (Array (_ BitVec 32) (_ BitVec 64))) (size!21139 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43276)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!796214 (= res!540735 (validKeyInArray!0 (select (arr!20718 a!3170) j!153)))))

(declare-fun b!796215 () Bool)

(declare-fun e!441829 () Bool)

(declare-fun e!441832 () Bool)

(assert (=> b!796215 (= e!441829 e!441832)))

(declare-fun res!540738 () Bool)

(assert (=> b!796215 (=> (not res!540738) (not e!441832))))

(declare-datatypes ((SeekEntryResult!8309 0))(
  ( (MissingZero!8309 (index!35604 (_ BitVec 32))) (Found!8309 (index!35605 (_ BitVec 32))) (Intermediate!8309 (undefined!9121 Bool) (index!35606 (_ BitVec 32)) (x!66515 (_ BitVec 32))) (Undefined!8309) (MissingVacant!8309 (index!35607 (_ BitVec 32))) )
))
(declare-fun lt!354992 () SeekEntryResult!8309)

(declare-fun lt!354989 () SeekEntryResult!8309)

(assert (=> b!796215 (= res!540738 (= lt!354992 lt!354989))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!354986 () (_ BitVec 64))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun lt!354987 () array!43276)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43276 (_ BitVec 32)) SeekEntryResult!8309)

(assert (=> b!796215 (= lt!354989 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!354986 lt!354987 mask!3266))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43276 (_ BitVec 32)) SeekEntryResult!8309)

(assert (=> b!796215 (= lt!354992 (seekEntryOrOpen!0 lt!354986 lt!354987 mask!3266))))

(declare-fun k!2044 () (_ BitVec 64))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!796215 (= lt!354986 (select (store (arr!20718 a!3170) i!1163 k!2044) j!153))))

(assert (=> b!796215 (= lt!354987 (array!43277 (store (arr!20718 a!3170) i!1163 k!2044) (size!21139 a!3170)))))

(declare-fun b!796216 () Bool)

(declare-fun res!540743 () Bool)

(assert (=> b!796216 (=> (not res!540743) (not e!441831))))

(assert (=> b!796216 (= res!540743 (validKeyInArray!0 k!2044))))

(declare-fun res!540739 () Bool)

(assert (=> start!68486 (=> (not res!540739) (not e!441831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68486 (= res!540739 (validMask!0 mask!3266))))

(assert (=> start!68486 e!441831))

(assert (=> start!68486 true))

(declare-fun array_inv!16514 (array!43276) Bool)

(assert (=> start!68486 (array_inv!16514 a!3170)))

(declare-fun b!796217 () Bool)

(declare-fun e!441833 () Bool)

(assert (=> b!796217 (= e!441833 (not true))))

(assert (=> b!796217 (= lt!354989 (Found!8309 index!1236))))

(declare-fun b!796218 () Bool)

(assert (=> b!796218 (= e!441832 e!441833)))

(declare-fun res!540736 () Bool)

(assert (=> b!796218 (=> (not res!540736) (not e!441833))))

(declare-fun lt!354991 () SeekEntryResult!8309)

(declare-fun lt!354988 () SeekEntryResult!8309)

(assert (=> b!796218 (= res!540736 (and (= lt!354991 lt!354988) (= lt!354988 (Found!8309 j!153)) (= (select (arr!20718 a!3170) index!1236) (select (arr!20718 a!3170) j!153))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!796218 (= lt!354988 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20718 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!796218 (= lt!354991 (seekEntryOrOpen!0 (select (arr!20718 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!796219 () Bool)

(declare-fun res!540740 () Bool)

(assert (=> b!796219 (=> (not res!540740) (not e!441831))))

(assert (=> b!796219 (= res!540740 (and (= (size!21139 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21139 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21139 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!796220 () Bool)

(declare-fun res!540734 () Bool)

(assert (=> b!796220 (=> (not res!540734) (not e!441829))))

(declare-datatypes ((List!14681 0))(
  ( (Nil!14678) (Cons!14677 (h!15806 (_ BitVec 64)) (t!20996 List!14681)) )
))
(declare-fun arrayNoDuplicates!0 (array!43276 (_ BitVec 32) List!14681) Bool)

(assert (=> b!796220 (= res!540734 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14678))))

(declare-fun b!796221 () Bool)

(declare-fun res!540733 () Bool)

(assert (=> b!796221 (=> (not res!540733) (not e!441829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43276 (_ BitVec 32)) Bool)

(assert (=> b!796221 (= res!540733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!796222 () Bool)

(assert (=> b!796222 (= e!441831 e!441829)))

(declare-fun res!540737 () Bool)

(assert (=> b!796222 (=> (not res!540737) (not e!441829))))

(declare-fun lt!354990 () SeekEntryResult!8309)

(assert (=> b!796222 (= res!540737 (or (= lt!354990 (MissingZero!8309 i!1163)) (= lt!354990 (MissingVacant!8309 i!1163))))))

(assert (=> b!796222 (= lt!354990 (seekEntryOrOpen!0 k!2044 a!3170 mask!3266))))

(declare-fun b!796223 () Bool)

(declare-fun res!540741 () Bool)

(assert (=> b!796223 (=> (not res!540741) (not e!441831))))

(declare-fun arrayContainsKey!0 (array!43276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!796223 (= res!540741 (not (arrayContainsKey!0 a!3170 k!2044 #b00000000000000000000000000000000)))))

(declare-fun b!796224 () Bool)

(declare-fun res!540742 () Bool)

(assert (=> b!796224 (=> (not res!540742) (not e!441829))))

(assert (=> b!796224 (= res!540742 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21139 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20718 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21139 a!3170)) (= (select (arr!20718 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!68486 res!540739) b!796219))

(assert (= (and b!796219 res!540740) b!796214))

(assert (= (and b!796214 res!540735) b!796216))

(assert (= (and b!796216 res!540743) b!796223))

(assert (= (and b!796223 res!540741) b!796222))

(assert (= (and b!796222 res!540737) b!796221))

(assert (= (and b!796221 res!540733) b!796220))

(assert (= (and b!796220 res!540734) b!796224))

(assert (= (and b!796224 res!540742) b!796215))

(assert (= (and b!796215 res!540738) b!796218))

(assert (= (and b!796218 res!540736) b!796217))

(declare-fun m!736979 () Bool)

(assert (=> start!68486 m!736979))

(declare-fun m!736981 () Bool)

(assert (=> start!68486 m!736981))

(declare-fun m!736983 () Bool)

(assert (=> b!796224 m!736983))

(declare-fun m!736985 () Bool)

(assert (=> b!796224 m!736985))

(declare-fun m!736987 () Bool)

(assert (=> b!796218 m!736987))

(declare-fun m!736989 () Bool)

(assert (=> b!796218 m!736989))

(assert (=> b!796218 m!736989))

(declare-fun m!736991 () Bool)

(assert (=> b!796218 m!736991))

(assert (=> b!796218 m!736989))

(declare-fun m!736993 () Bool)

(assert (=> b!796218 m!736993))

(declare-fun m!736995 () Bool)

(assert (=> b!796223 m!736995))

(declare-fun m!736997 () Bool)

(assert (=> b!796222 m!736997))

(declare-fun m!736999 () Bool)

(assert (=> b!796216 m!736999))

(declare-fun m!737001 () Bool)

(assert (=> b!796220 m!737001))

(assert (=> b!796214 m!736989))

(assert (=> b!796214 m!736989))

(declare-fun m!737003 () Bool)

(assert (=> b!796214 m!737003))

(declare-fun m!737005 () Bool)

(assert (=> b!796221 m!737005))

(declare-fun m!737007 () Bool)

(assert (=> b!796215 m!737007))

(declare-fun m!737009 () Bool)

(assert (=> b!796215 m!737009))

(declare-fun m!737011 () Bool)

(assert (=> b!796215 m!737011))

(declare-fun m!737013 () Bool)

(assert (=> b!796215 m!737013))

(push 1)

(assert (not b!796220))

(assert (not b!796221))

(assert (not b!796222))

(assert (not b!796216))

(assert (not b!796215))

(assert (not start!68486))

(assert (not b!796214))

(assert (not b!796223))

(assert (not b!796218))

(check-sat)

(pop 1)

(push 1)

(check-sat)

