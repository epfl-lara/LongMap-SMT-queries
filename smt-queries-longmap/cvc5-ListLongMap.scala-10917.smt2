; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!127764 () Bool)

(assert start!127764)

(declare-fun b!1501468 () Bool)

(declare-fun res!1022545 () Bool)

(declare-fun e!839936 () Bool)

(assert (=> b!1501468 (=> (not res!1022545) (not e!839936))))

(declare-datatypes ((array!100145 0))(
  ( (array!100146 (arr!48332 (Array (_ BitVec 32) (_ BitVec 64))) (size!48882 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100145)

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100145 (_ BitVec 32)) Bool)

(assert (=> b!1501468 (= res!1022545 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1501469 () Bool)

(declare-fun res!1022554 () Bool)

(declare-fun e!839937 () Bool)

(assert (=> b!1501469 (=> (not res!1022554) (not e!839937))))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1501469 (= res!1022554 (not (= (select (arr!48332 a!2850) index!625) (select (arr!48332 a!2850) j!87))))))

(declare-fun b!1501470 () Bool)

(declare-fun res!1022552 () Bool)

(declare-fun e!839935 () Bool)

(assert (=> b!1501470 (=> (not res!1022552) (not e!839935))))

(declare-datatypes ((SeekEntryResult!12542 0))(
  ( (MissingZero!12542 (index!52560 (_ BitVec 32))) (Found!12542 (index!52561 (_ BitVec 32))) (Intermediate!12542 (undefined!13354 Bool) (index!52562 (_ BitVec 32)) (x!134224 (_ BitVec 32))) (Undefined!12542) (MissingVacant!12542 (index!52563 (_ BitVec 32))) )
))
(declare-fun lt!653181 () SeekEntryResult!12542)

(declare-fun lt!653182 () (_ BitVec 32))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100145 (_ BitVec 32)) SeekEntryResult!12542)

(assert (=> b!1501470 (= res!1022552 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653182 vacantBefore!10 (select (arr!48332 a!2850) j!87) a!2850 mask!2661) lt!653181))))

(declare-fun b!1501471 () Bool)

(assert (=> b!1501471 (= e!839936 e!839937)))

(declare-fun res!1022549 () Bool)

(assert (=> b!1501471 (=> (not res!1022549) (not e!839937))))

(assert (=> b!1501471 (= res!1022549 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48332 a!2850) j!87) a!2850 mask!2661) lt!653181))))

(assert (=> b!1501471 (= lt!653181 (Found!12542 j!87))))

(declare-fun res!1022544 () Bool)

(assert (=> start!127764 (=> (not res!1022544) (not e!839936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127764 (= res!1022544 (validMask!0 mask!2661))))

(assert (=> start!127764 e!839936))

(assert (=> start!127764 true))

(declare-fun array_inv!37360 (array!100145) Bool)

(assert (=> start!127764 (array_inv!37360 a!2850)))

(declare-fun b!1501472 () Bool)

(declare-fun res!1022551 () Bool)

(assert (=> b!1501472 (=> (not res!1022551) (not e!839936))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1501472 (= res!1022551 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48882 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48882 a!2850)) (= (select (arr!48332 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48332 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48882 a!2850))))))

(declare-fun b!1501473 () Bool)

(assert (=> b!1501473 (= e!839937 e!839935)))

(declare-fun res!1022548 () Bool)

(assert (=> b!1501473 (=> (not res!1022548) (not e!839935))))

(assert (=> b!1501473 (= res!1022548 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653182 #b00000000000000000000000000000000) (bvslt lt!653182 (size!48882 a!2850))))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1501473 (= lt!653182 (nextIndex!0 index!625 x!647 mask!2661))))

(declare-fun b!1501474 () Bool)

(declare-fun res!1022550 () Bool)

(assert (=> b!1501474 (=> (not res!1022550) (not e!839936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1501474 (= res!1022550 (validKeyInArray!0 (select (arr!48332 a!2850) i!996)))))

(declare-fun b!1501475 () Bool)

(assert (=> b!1501475 (= e!839935 (not (or (bvslt mask!2661 #b00000000000000000000000000000000) (bvsge index!625 (bvadd #b00000000000000000000000000000001 mask!2661)) (bvslt vacantAfter!10 (bvadd #b00000000000000000000000000000001 mask!2661)))))))

(assert (=> b!1501475 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653182 vacantAfter!10 (select (store (arr!48332 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100146 (store (arr!48332 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48882 a!2850)) mask!2661) lt!653181)))

(declare-datatypes ((Unit!50238 0))(
  ( (Unit!50239) )
))
(declare-fun lt!653180 () Unit!50238)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50238)

(assert (=> b!1501475 (= lt!653180 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653182 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1501476 () Bool)

(declare-fun res!1022547 () Bool)

(assert (=> b!1501476 (=> (not res!1022547) (not e!839936))))

(assert (=> b!1501476 (= res!1022547 (and (= (size!48882 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48882 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48882 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1501477 () Bool)

(declare-fun res!1022546 () Bool)

(assert (=> b!1501477 (=> (not res!1022546) (not e!839936))))

(assert (=> b!1501477 (= res!1022546 (validKeyInArray!0 (select (arr!48332 a!2850) j!87)))))

(declare-fun b!1501478 () Bool)

(declare-fun res!1022553 () Bool)

(assert (=> b!1501478 (=> (not res!1022553) (not e!839936))))

(declare-datatypes ((List!34824 0))(
  ( (Nil!34821) (Cons!34820 (h!36217 (_ BitVec 64)) (t!49518 List!34824)) )
))
(declare-fun arrayNoDuplicates!0 (array!100145 (_ BitVec 32) List!34824) Bool)

(assert (=> b!1501478 (= res!1022553 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34821))))

(assert (= (and start!127764 res!1022544) b!1501476))

(assert (= (and b!1501476 res!1022547) b!1501474))

(assert (= (and b!1501474 res!1022550) b!1501477))

(assert (= (and b!1501477 res!1022546) b!1501468))

(assert (= (and b!1501468 res!1022545) b!1501478))

(assert (= (and b!1501478 res!1022553) b!1501472))

(assert (= (and b!1501472 res!1022551) b!1501471))

(assert (= (and b!1501471 res!1022549) b!1501469))

(assert (= (and b!1501469 res!1022554) b!1501473))

(assert (= (and b!1501473 res!1022548) b!1501470))

(assert (= (and b!1501470 res!1022552) b!1501475))

(declare-fun m!1384705 () Bool)

(assert (=> b!1501470 m!1384705))

(assert (=> b!1501470 m!1384705))

(declare-fun m!1384707 () Bool)

(assert (=> b!1501470 m!1384707))

(declare-fun m!1384709 () Bool)

(assert (=> b!1501475 m!1384709))

(declare-fun m!1384711 () Bool)

(assert (=> b!1501475 m!1384711))

(assert (=> b!1501475 m!1384711))

(declare-fun m!1384713 () Bool)

(assert (=> b!1501475 m!1384713))

(declare-fun m!1384715 () Bool)

(assert (=> b!1501475 m!1384715))

(assert (=> b!1501477 m!1384705))

(assert (=> b!1501477 m!1384705))

(declare-fun m!1384717 () Bool)

(assert (=> b!1501477 m!1384717))

(declare-fun m!1384719 () Bool)

(assert (=> b!1501478 m!1384719))

(declare-fun m!1384721 () Bool)

(assert (=> b!1501474 m!1384721))

(assert (=> b!1501474 m!1384721))

(declare-fun m!1384723 () Bool)

(assert (=> b!1501474 m!1384723))

(declare-fun m!1384725 () Bool)

(assert (=> start!127764 m!1384725))

(declare-fun m!1384727 () Bool)

(assert (=> start!127764 m!1384727))

(declare-fun m!1384729 () Bool)

(assert (=> b!1501468 m!1384729))

(declare-fun m!1384731 () Bool)

(assert (=> b!1501472 m!1384731))

(assert (=> b!1501472 m!1384709))

(declare-fun m!1384733 () Bool)

(assert (=> b!1501472 m!1384733))

(declare-fun m!1384735 () Bool)

(assert (=> b!1501473 m!1384735))

(declare-fun m!1384737 () Bool)

(assert (=> b!1501469 m!1384737))

(assert (=> b!1501469 m!1384705))

(assert (=> b!1501471 m!1384705))

(assert (=> b!1501471 m!1384705))

(declare-fun m!1384739 () Bool)

(assert (=> b!1501471 m!1384739))

(push 1)

(assert (not b!1501477))

(assert (not b!1501470))

(assert (not b!1501468))

(assert (not b!1501478))

(assert (not b!1501473))

(assert (not b!1501475))

(assert (not b!1501474))

(assert (not start!127764))

(assert (not b!1501471))

(check-sat)

(pop 1)

(push 1)

(check-sat)

