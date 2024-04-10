; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68302 () Bool)

(assert start!68302)

(declare-fun res!538001 () Bool)

(declare-fun e!440774 () Bool)

(assert (=> start!68302 (=> (not res!538001) (not e!440774))))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68302 (= res!538001 (validMask!0 mask!3266))))

(assert (=> start!68302 e!440774))

(assert (=> start!68302 true))

(declare-datatypes ((array!43092 0))(
  ( (array!43093 (arr!20626 (Array (_ BitVec 32) (_ BitVec 64))) (size!21047 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!43092)

(declare-fun array_inv!16422 (array!43092) Bool)

(assert (=> start!68302 (array_inv!16422 a!3170)))

(declare-fun b!793474 () Bool)

(declare-fun e!440773 () Bool)

(assert (=> b!793474 (= e!440774 e!440773)))

(declare-fun res!537997 () Bool)

(assert (=> b!793474 (=> (not res!537997) (not e!440773))))

(declare-datatypes ((SeekEntryResult!8217 0))(
  ( (MissingZero!8217 (index!35236 (_ BitVec 32))) (Found!8217 (index!35237 (_ BitVec 32))) (Intermediate!8217 (undefined!9029 Bool) (index!35238 (_ BitVec 32)) (x!66175 (_ BitVec 32))) (Undefined!8217) (MissingVacant!8217 (index!35239 (_ BitVec 32))) )
))
(declare-fun lt!353708 () SeekEntryResult!8217)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!793474 (= res!537997 (or (= lt!353708 (MissingZero!8217 i!1163)) (= lt!353708 (MissingVacant!8217 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43092 (_ BitVec 32)) SeekEntryResult!8217)

(assert (=> b!793474 (= lt!353708 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!793475 () Bool)

(declare-fun res!538000 () Bool)

(assert (=> b!793475 (=> (not res!538000) (not e!440774))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!793475 (= res!538000 (validKeyInArray!0 (select (arr!20626 a!3170) j!153)))))

(declare-fun b!793476 () Bool)

(declare-fun res!537999 () Bool)

(assert (=> b!793476 (=> (not res!537999) (not e!440774))))

(assert (=> b!793476 (= res!537999 (and (= (size!21047 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21047 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21047 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!793477 () Bool)

(declare-fun res!537994 () Bool)

(assert (=> b!793477 (=> (not res!537994) (not e!440773))))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(assert (=> b!793477 (= res!537994 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21047 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20626 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21047 a!3170)) (= (select (arr!20626 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23)) (bvsge mask!3266 #b00000000000000000000000000000000) (bvslt index!1236 (bvadd #b00000000000000000000000000000001 mask!3266)) (bvslt vacantAfter!23 (bvadd #b00000000000000000000000000000001 mask!3266)) (= (select (store (arr!20626 a!3170) i!1163 k0!2044) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!793478 () Bool)

(declare-fun res!537993 () Bool)

(assert (=> b!793478 (=> (not res!537993) (not e!440774))))

(declare-fun arrayContainsKey!0 (array!43092 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!793478 (= res!537993 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!793479 () Bool)

(declare-fun res!537998 () Bool)

(assert (=> b!793479 (=> (not res!537998) (not e!440773))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43092 (_ BitVec 32)) Bool)

(assert (=> b!793479 (= res!537998 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!793480 () Bool)

(declare-fun res!537996 () Bool)

(assert (=> b!793480 (=> (not res!537996) (not e!440773))))

(declare-datatypes ((List!14589 0))(
  ( (Nil!14586) (Cons!14585 (h!15714 (_ BitVec 64)) (t!20904 List!14589)) )
))
(declare-fun arrayNoDuplicates!0 (array!43092 (_ BitVec 32) List!14589) Bool)

(assert (=> b!793480 (= res!537996 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14586))))

(declare-fun b!793481 () Bool)

(assert (=> b!793481 (= e!440773 (not (validKeyInArray!0 (select (store (arr!20626 a!3170) i!1163 k0!2044) j!153))))))

(declare-fun b!793482 () Bool)

(declare-fun res!537995 () Bool)

(assert (=> b!793482 (=> (not res!537995) (not e!440774))))

(assert (=> b!793482 (= res!537995 (validKeyInArray!0 k0!2044))))

(assert (= (and start!68302 res!538001) b!793476))

(assert (= (and b!793476 res!537999) b!793475))

(assert (= (and b!793475 res!538000) b!793482))

(assert (= (and b!793482 res!537995) b!793478))

(assert (= (and b!793478 res!537993) b!793474))

(assert (= (and b!793474 res!537997) b!793479))

(assert (= (and b!793479 res!537998) b!793480))

(assert (= (and b!793480 res!537996) b!793477))

(assert (= (and b!793477 res!537994) b!793481))

(declare-fun m!733943 () Bool)

(assert (=> b!793474 m!733943))

(declare-fun m!733945 () Bool)

(assert (=> b!793479 m!733945))

(declare-fun m!733947 () Bool)

(assert (=> b!793480 m!733947))

(declare-fun m!733949 () Bool)

(assert (=> b!793477 m!733949))

(declare-fun m!733951 () Bool)

(assert (=> b!793477 m!733951))

(declare-fun m!733953 () Bool)

(assert (=> b!793477 m!733953))

(declare-fun m!733955 () Bool)

(assert (=> b!793477 m!733955))

(declare-fun m!733957 () Bool)

(assert (=> b!793478 m!733957))

(assert (=> b!793481 m!733953))

(declare-fun m!733959 () Bool)

(assert (=> b!793481 m!733959))

(assert (=> b!793481 m!733959))

(declare-fun m!733961 () Bool)

(assert (=> b!793481 m!733961))

(declare-fun m!733963 () Bool)

(assert (=> b!793482 m!733963))

(declare-fun m!733965 () Bool)

(assert (=> b!793475 m!733965))

(assert (=> b!793475 m!733965))

(declare-fun m!733967 () Bool)

(assert (=> b!793475 m!733967))

(declare-fun m!733969 () Bool)

(assert (=> start!68302 m!733969))

(declare-fun m!733971 () Bool)

(assert (=> start!68302 m!733971))

(check-sat (not b!793475) (not b!793481) (not b!793479) (not b!793478) (not b!793480) (not b!793474) (not start!68302) (not b!793482))
