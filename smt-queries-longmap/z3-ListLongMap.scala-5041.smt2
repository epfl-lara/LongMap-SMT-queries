; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!68758 () Bool)

(assert start!68758)

(declare-fun b!801108 () Bool)

(declare-fun e!444100 () Bool)

(declare-fun e!444104 () Bool)

(assert (=> b!801108 (= e!444100 e!444104)))

(declare-fun res!545638 () Bool)

(assert (=> b!801108 (=> (not res!545638) (not e!444104))))

(declare-fun x!1077 () (_ BitVec 32))

(declare-fun lt!358019 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!8445 0))(
  ( (MissingZero!8445 (index!36148 (_ BitVec 32))) (Found!8445 (index!36149 (_ BitVec 32))) (Intermediate!8445 (undefined!9257 Bool) (index!36150 (_ BitVec 32)) (x!67011 (_ BitVec 32))) (Undefined!8445) (MissingVacant!8445 (index!36151 (_ BitVec 32))) )
))
(declare-fun lt!358022 () SeekEntryResult!8445)

(declare-fun mask!3266 () (_ BitVec 32))

(declare-fun index!1236 () (_ BitVec 32))

(declare-fun vacantAfter!23 () (_ BitVec 32))

(declare-datatypes ((array!43548 0))(
  ( (array!43549 (arr!20854 (Array (_ BitVec 32) (_ BitVec 64))) (size!21275 (_ BitVec 32))) )
))
(declare-fun lt!358025 () array!43548)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!43548 (_ BitVec 32)) SeekEntryResult!8445)

(assert (=> b!801108 (= res!545638 (= lt!358022 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantAfter!23 lt!358019 lt!358025 mask!3266)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!43548 (_ BitVec 32)) SeekEntryResult!8445)

(assert (=> b!801108 (= lt!358022 (seekEntryOrOpen!0 lt!358019 lt!358025 mask!3266))))

(declare-fun k0!2044 () (_ BitVec 64))

(declare-fun a!3170 () array!43548)

(declare-fun j!153 () (_ BitVec 32))

(declare-fun i!1163 () (_ BitVec 32))

(assert (=> b!801108 (= lt!358019 (select (store (arr!20854 a!3170) i!1163 k0!2044) j!153))))

(assert (=> b!801108 (= lt!358025 (array!43549 (store (arr!20854 a!3170) i!1163 k0!2044) (size!21275 a!3170)))))

(declare-fun b!801109 () Bool)

(declare-fun res!545630 () Bool)

(declare-fun e!444101 () Bool)

(assert (=> b!801109 (=> (not res!545630) (not e!444101))))

(declare-fun lt!358020 () (_ BitVec 32))

(assert (=> b!801109 (= res!545630 (= lt!358022 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358020 vacantAfter!23 lt!358019 lt!358025 mask!3266)))))

(declare-fun b!801110 () Bool)

(declare-fun e!444103 () Bool)

(assert (=> b!801110 (= e!444104 e!444103)))

(declare-fun res!545628 () Bool)

(assert (=> b!801110 (=> (not res!545628) (not e!444103))))

(declare-fun lt!358023 () SeekEntryResult!8445)

(declare-fun lt!358024 () SeekEntryResult!8445)

(assert (=> b!801110 (= res!545628 (and (= lt!358024 lt!358023) (= lt!358023 (Found!8445 j!153)) (not (= (select (arr!20854 a!3170) index!1236) (select (arr!20854 a!3170) j!153)))))))

(declare-fun vacantBefore!23 () (_ BitVec 32))

(assert (=> b!801110 (= lt!358023 (seekKeyOrZeroReturnVacant!0 x!1077 index!1236 vacantBefore!23 (select (arr!20854 a!3170) j!153) a!3170 mask!3266))))

(assert (=> b!801110 (= lt!358024 (seekEntryOrOpen!0 (select (arr!20854 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801111 () Bool)

(assert (=> b!801111 (= e!444103 e!444101)))

(declare-fun res!545629 () Bool)

(assert (=> b!801111 (=> (not res!545629) (not e!444101))))

(assert (=> b!801111 (= res!545629 (and (bvsle (bvadd #b00000000000000000000000000000001 x!1077) #b01111111111111111111111111111110) (bvsge (bvadd #b00000000000000000000000000000001 x!1077) #b00000000000000000000000000000000) (bvsge lt!358020 #b00000000000000000000000000000000) (bvslt lt!358020 (size!21275 a!3170))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!801111 (= lt!358020 (nextIndex!0 index!1236 x!1077 mask!3266))))

(declare-fun b!801112 () Bool)

(declare-fun res!545633 () Bool)

(assert (=> b!801112 (=> (not res!545633) (not e!444100))))

(assert (=> b!801112 (= res!545633 (and (bvsle x!1077 #b01111111111111111111111111111110) (bvsge x!1077 #b00000000000000000000000000000000) (bvsge index!1236 #b00000000000000000000000000000000) (bvslt index!1236 (size!21275 a!3170)) (= vacantBefore!23 i!1163) (= (select (arr!20854 a!3170) vacantBefore!23) #b1000000000000000000000000000000000000000000000000000000000000000) (bvsge vacantAfter!23 #b00000000000000000000000000000000) (bvslt vacantAfter!23 (size!21275 a!3170)) (= (select (arr!20854 a!3170) vacantAfter!23) #b1000000000000000000000000000000000000000000000000000000000000000) (not (= vacantAfter!23 vacantBefore!23))))))

(declare-fun b!801113 () Bool)

(declare-fun e!444099 () Bool)

(assert (=> b!801113 (= e!444099 e!444100)))

(declare-fun res!545639 () Bool)

(assert (=> b!801113 (=> (not res!545639) (not e!444100))))

(declare-fun lt!358018 () SeekEntryResult!8445)

(assert (=> b!801113 (= res!545639 (or (= lt!358018 (MissingZero!8445 i!1163)) (= lt!358018 (MissingVacant!8445 i!1163))))))

(assert (=> b!801113 (= lt!358018 (seekEntryOrOpen!0 k0!2044 a!3170 mask!3266))))

(declare-fun b!801114 () Bool)

(declare-fun res!545632 () Bool)

(assert (=> b!801114 (=> (not res!545632) (not e!444099))))

(assert (=> b!801114 (= res!545632 (and (= (size!21275 a!3170) (bvadd #b00000000000000000000000000000001 mask!3266)) (bvsge i!1163 #b00000000000000000000000000000000) (bvslt i!1163 (size!21275 a!3170)) (bvsge j!153 #b00000000000000000000000000000000) (bvslt j!153 (size!21275 a!3170)) (not (= i!1163 j!153))))))

(declare-fun b!801115 () Bool)

(declare-fun res!545636 () Bool)

(assert (=> b!801115 (=> (not res!545636) (not e!444099))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!801115 (= res!545636 (validKeyInArray!0 k0!2044))))

(declare-fun b!801116 () Bool)

(declare-fun res!545627 () Bool)

(assert (=> b!801116 (=> (not res!545627) (not e!444099))))

(declare-fun arrayContainsKey!0 (array!43548 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!801116 (= res!545627 (not (arrayContainsKey!0 a!3170 k0!2044 #b00000000000000000000000000000000)))))

(declare-fun b!801117 () Bool)

(declare-fun res!545631 () Bool)

(assert (=> b!801117 (=> (not res!545631) (not e!444100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!43548 (_ BitVec 32)) Bool)

(assert (=> b!801117 (= res!545631 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3170 mask!3266))))

(declare-fun res!545637 () Bool)

(assert (=> start!68758 (=> (not res!545637) (not e!444099))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!68758 (= res!545637 (validMask!0 mask!3266))))

(assert (=> start!68758 e!444099))

(assert (=> start!68758 true))

(declare-fun array_inv!16650 (array!43548) Bool)

(assert (=> start!68758 (array_inv!16650 a!3170)))

(declare-fun b!801118 () Bool)

(assert (=> b!801118 (= e!444101 false)))

(declare-fun lt!358021 () SeekEntryResult!8445)

(assert (=> b!801118 (= lt!358021 (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!1077) lt!358020 vacantBefore!23 (select (arr!20854 a!3170) j!153) a!3170 mask!3266))))

(declare-fun b!801119 () Bool)

(declare-fun res!545635 () Bool)

(assert (=> b!801119 (=> (not res!545635) (not e!444099))))

(assert (=> b!801119 (= res!545635 (validKeyInArray!0 (select (arr!20854 a!3170) j!153)))))

(declare-fun b!801120 () Bool)

(declare-fun res!545634 () Bool)

(assert (=> b!801120 (=> (not res!545634) (not e!444100))))

(declare-datatypes ((List!14817 0))(
  ( (Nil!14814) (Cons!14813 (h!15942 (_ BitVec 64)) (t!21132 List!14817)) )
))
(declare-fun arrayNoDuplicates!0 (array!43548 (_ BitVec 32) List!14817) Bool)

(assert (=> b!801120 (= res!545634 (arrayNoDuplicates!0 a!3170 #b00000000000000000000000000000000 Nil!14814))))

(assert (= (and start!68758 res!545637) b!801114))

(assert (= (and b!801114 res!545632) b!801119))

(assert (= (and b!801119 res!545635) b!801115))

(assert (= (and b!801115 res!545636) b!801116))

(assert (= (and b!801116 res!545627) b!801113))

(assert (= (and b!801113 res!545639) b!801117))

(assert (= (and b!801117 res!545631) b!801120))

(assert (= (and b!801120 res!545634) b!801112))

(assert (= (and b!801112 res!545633) b!801108))

(assert (= (and b!801108 res!545638) b!801110))

(assert (= (and b!801110 res!545628) b!801111))

(assert (= (and b!801111 res!545629) b!801109))

(assert (= (and b!801109 res!545630) b!801118))

(declare-fun m!742247 () Bool)

(assert (=> b!801113 m!742247))

(declare-fun m!742249 () Bool)

(assert (=> b!801117 m!742249))

(declare-fun m!742251 () Bool)

(assert (=> start!68758 m!742251))

(declare-fun m!742253 () Bool)

(assert (=> start!68758 m!742253))

(declare-fun m!742255 () Bool)

(assert (=> b!801115 m!742255))

(declare-fun m!742257 () Bool)

(assert (=> b!801116 m!742257))

(declare-fun m!742259 () Bool)

(assert (=> b!801118 m!742259))

(assert (=> b!801118 m!742259))

(declare-fun m!742261 () Bool)

(assert (=> b!801118 m!742261))

(declare-fun m!742263 () Bool)

(assert (=> b!801108 m!742263))

(declare-fun m!742265 () Bool)

(assert (=> b!801108 m!742265))

(declare-fun m!742267 () Bool)

(assert (=> b!801108 m!742267))

(declare-fun m!742269 () Bool)

(assert (=> b!801108 m!742269))

(declare-fun m!742271 () Bool)

(assert (=> b!801109 m!742271))

(declare-fun m!742273 () Bool)

(assert (=> b!801112 m!742273))

(declare-fun m!742275 () Bool)

(assert (=> b!801112 m!742275))

(assert (=> b!801119 m!742259))

(assert (=> b!801119 m!742259))

(declare-fun m!742277 () Bool)

(assert (=> b!801119 m!742277))

(declare-fun m!742279 () Bool)

(assert (=> b!801110 m!742279))

(assert (=> b!801110 m!742259))

(assert (=> b!801110 m!742259))

(declare-fun m!742281 () Bool)

(assert (=> b!801110 m!742281))

(assert (=> b!801110 m!742259))

(declare-fun m!742283 () Bool)

(assert (=> b!801110 m!742283))

(declare-fun m!742285 () Bool)

(assert (=> b!801120 m!742285))

(declare-fun m!742287 () Bool)

(assert (=> b!801111 m!742287))

(check-sat (not start!68758) (not b!801113) (not b!801115) (not b!801109) (not b!801108) (not b!801110) (not b!801119) (not b!801117) (not b!801111) (not b!801120) (not b!801116) (not b!801118))
(check-sat)
