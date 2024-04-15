; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69522 () Bool)

(assert start!69522)

(declare-fun b!810100 () Bool)

(declare-fun e!448404 () Bool)

(declare-fun e!448406 () Bool)

(assert (=> b!810100 (= e!448404 e!448406)))

(declare-fun res!553530 () Bool)

(assert (=> b!810100 (=> (not res!553530) (not e!448406))))

(declare-datatypes ((SeekEntryResult!8677 0))(
  ( (MissingZero!8677 (index!37076 (_ BitVec 32))) (Found!8677 (index!37077 (_ BitVec 32))) (Intermediate!8677 (undefined!9489 Bool) (index!37078 (_ BitVec 32)) (x!67900 (_ BitVec 32))) (Undefined!8677) (MissingVacant!8677 (index!37079 (_ BitVec 32))) )
))
(declare-fun lt!362922 () SeekEntryResult!8677)

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!810100 (= res!553530 (or (= lt!362922 (MissingZero!8677 i!1163)) (= lt!362922 (MissingVacant!8677 i!1163))))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun mask!3266 () (_ BitVec 32))

(declare-datatypes ((array!44035 0))(
  ( (array!44036 (arr!21089 (Array (_ BitVec 32) (_ BitVec 64))) (size!21510 (_ BitVec 32))) )
))
(declare-fun a!3170 () array!44035)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44035 (_ BitVec 32)) SeekEntryResult!8677)

(assert (=> b!810100 (= lt!362922 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!810101 () Bool)

(declare-fun e!448403 () Bool)

(declare-fun e!448402 () Bool)

(assert (=> b!810101 (= e!448403 e!448402)))

(declare-fun res!553522 () Bool)

(assert (=> b!810101 (=> (not res!553522) (not e!448402))))

(declare-fun lt!362927 () (_ BitVec 32))

(declare-fun x!1077 () (_ BitVec 32))

(assert (=> b!810101 (= res!553522 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!362927 #b00000000000000000000000000000000) (bvslt lt!362927 (size!21510 a!3170))))))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!810101 (= lt!362927 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!810102 () Bool)

(declare-fun res!553521 () Bool)

(assert (=> b!810102 (=> (not res!553521) (not e!448406))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44035 (_ BitVec 32)) Bool)

(assert (=> b!810102 (= res!553521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun b!810103 () Bool)

(declare-fun res!553519 () Bool)

(assert (=> b!810103 (=> (not res!553519) (not e!448404))))

(declare-fun j!153 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!810103 (= res!553519 (validKeyInArray!0 (select (arr!21089 a!3170) j!153)))))

(declare-fun b!810104 () Bool)

(declare-fun res!553524 () Bool)

(assert (=> b!810104 (=> (not res!553524) (not e!448402))))

(declare-fun lt!362923 () SeekEntryResult!8677)

(declare-fun lt!362928 () array!44035)

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-fun lt!362926 () (_ BitVec 64))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!44035 (_ BitVec 32)) SeekEntryResult!8677)

(assert (=> b!810104 (= res!553524 (= lt!362923 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362927 vacantAfter!23 lt!362926 lt!362928 mask!3266)))))

(declare-fun lt!362924 () SeekEntryResult!8677)

(declare-fun b!810105 () Bool)

(declare-fun lt!362925 () SeekEntryResult!8677)

(declare-fun lt!362929 () SeekEntryResult!8677)

(assert (=> b!810105 (= e!448402 (and (= lt!362924 lt!362925) (not (= lt!362925 lt!362929))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!810105 (= lt!362925 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!362927 vacantBefore!23 (select (arr!21089 a!3170) j!153) a!3170 mask!3266))))

(declare-fun res!553527 () Bool)

(assert (=> start!69522 (=> (not res!553527) (not e!448404))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69522 (= res!553527 (validMask!0 mask!3266))))

(assert (=> start!69522 e!448404))

(assert (=> start!69522 true))

(declare-fun array_inv!16972 (array!44035) Bool)

(assert (=> start!69522 (array_inv!16972 a!3170)))

(declare-fun b!810106 () Bool)

(declare-fun e!448405 () Bool)

(assert (=> b!810106 (= e!448406 e!448405)))

(declare-fun res!553526 () Bool)

(assert (=> b!810106 (=> (not res!553526) (not e!448405))))

(assert (=> b!810106 (= res!553526 (= lt!362923 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!362926 lt!362928 mask!3266)))))

(assert (=> b!810106 (= lt!362923 (seekEntryOrOpen!0 lt!362926 lt!362928 mask!3266))))

(assert (=> b!810106 (= lt!362926 (select (store (arr!21089 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!810106 (= lt!362928 (array!44036 (store (arr!21089 a!3170) i!1163 k0!2044) (size!21510 a!3170)))))

(declare-fun b!810107 () Bool)

(declare-fun res!553525 () Bool)

(assert (=> b!810107 (=> (not res!553525) (not e!448404))))

(assert (=> b!810107 (= res!553525 (validKeyInArray!0 k0!2044))))

(declare-fun b!810108 () Bool)

(declare-fun e!448408 () Bool)

(assert (=> b!810108 (= e!448405 e!448408)))

(declare-fun res!553529 () Bool)

(assert (=> b!810108 (=> (not res!553529) (not e!448408))))

(declare-fun lt!362930 () SeekEntryResult!8677)

(assert (=> b!810108 (= res!553529 (= lt!362924 lt!362930))))

(assert (=> b!810108 (= lt!362930 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!21089 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!810108 (= lt!362924 (seekEntryOrOpen!0 (select (arr!21089 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!810109 () Bool)

(declare-fun res!553520 () Bool)

(assert (=> b!810109 (=> (not res!553520) (not e!448404))))

(declare-fun arrayContainsKey!0 (array!44035 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!810109 (= res!553520 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!810110 () Bool)

(declare-fun res!553528 () Bool)

(assert (=> b!810110 (=> (not res!553528) (not e!448404))))

(assert (=> b!810110 (= res!553528 (and (= (size!21510 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21510 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21510 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!810111 () Bool)

(assert (=> b!810111 (= e!448408 e!448403)))

(declare-fun res!553523 () Bool)

(assert (=> b!810111 (=> (not res!553523) (not e!448403))))

(assert (=> b!810111 (= res!553523 (and (= lt!362930 lt!362929) (not (= (select (arr!21089 a!3170) index!1236) (select (arr!21089 a!3170) j!153)))))))

(assert (=> b!810111 (= lt!362929 (Found!8677 j!153))))

(declare-fun b!810112 () Bool)

(declare-fun res!553518 () Bool)

(assert (=> b!810112 (=> (not res!553518) (not e!448406))))

(declare-datatypes ((List!15091 0))(
  ( (Nil!15088) (Cons!15087 (h!16216 (_ BitVec 64)) (t!21397 List!15091)) )
))
(declare-fun arrayNoDuplicates!0 (array!44035 (_ BitVec 32) List!15091) Bool)

(assert (=> b!810112 (= res!553518 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!15088))))

(declare-fun b!810113 () Bool)

(declare-fun res!553517 () Bool)

(assert (=> b!810113 (=> (not res!553517) (not e!448406))))

(assert (=> b!810113 (= res!553517 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21510 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!21089 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21510 a!3170)) (= (select (arr!21089 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(assert (= (and start!69522 res!553527) b!810110))

(assert (= (and b!810110 res!553528) b!810103))

(assert (= (and b!810103 res!553519) b!810107))

(assert (= (and b!810107 res!553525) b!810109))

(assert (= (and b!810109 res!553520) b!810100))

(assert (= (and b!810100 res!553530) b!810102))

(assert (= (and b!810102 res!553521) b!810112))

(assert (= (and b!810112 res!553518) b!810113))

(assert (= (and b!810113 res!553517) b!810106))

(assert (= (and b!810106 res!553526) b!810108))

(assert (= (and b!810108 res!553529) b!810111))

(assert (= (and b!810111 res!553523) b!810101))

(assert (= (and b!810101 res!553522) b!810104))

(assert (= (and b!810104 res!553524) b!810105))

(declare-fun m!751795 () Bool)

(assert (=> b!810111 m!751795))

(declare-fun m!751797 () Bool)

(assert (=> b!810111 m!751797))

(declare-fun m!751799 () Bool)

(assert (=> b!810112 m!751799))

(declare-fun m!751801 () Bool)

(assert (=> start!69522 m!751801))

(declare-fun m!751803 () Bool)

(assert (=> start!69522 m!751803))

(declare-fun m!751805 () Bool)

(assert (=> b!810106 m!751805))

(declare-fun m!751807 () Bool)

(assert (=> b!810106 m!751807))

(declare-fun m!751809 () Bool)

(assert (=> b!810106 m!751809))

(declare-fun m!751811 () Bool)

(assert (=> b!810106 m!751811))

(assert (=> b!810105 m!751797))

(assert (=> b!810105 m!751797))

(declare-fun m!751813 () Bool)

(assert (=> b!810105 m!751813))

(declare-fun m!751815 () Bool)

(assert (=> b!810100 m!751815))

(declare-fun m!751817 () Bool)

(assert (=> b!810104 m!751817))

(declare-fun m!751819 () Bool)

(assert (=> b!810107 m!751819))

(assert (=> b!810108 m!751797))

(assert (=> b!810108 m!751797))

(declare-fun m!751821 () Bool)

(assert (=> b!810108 m!751821))

(assert (=> b!810108 m!751797))

(declare-fun m!751823 () Bool)

(assert (=> b!810108 m!751823))

(declare-fun m!751825 () Bool)

(assert (=> b!810101 m!751825))

(declare-fun m!751827 () Bool)

(assert (=> b!810102 m!751827))

(declare-fun m!751829 () Bool)

(assert (=> b!810113 m!751829))

(declare-fun m!751831 () Bool)

(assert (=> b!810113 m!751831))

(assert (=> b!810103 m!751797))

(assert (=> b!810103 m!751797))

(declare-fun m!751833 () Bool)

(assert (=> b!810103 m!751833))

(declare-fun m!751835 () Bool)

(assert (=> b!810109 m!751835))

(check-sat (not b!810105) (not start!69522) (not b!810101) (not b!810103) (not b!810112) (not b!810102) (not b!810108) (not b!810100) (not b!810104) (not b!810109) (not b!810106) (not b!810107))
(check-sat)
