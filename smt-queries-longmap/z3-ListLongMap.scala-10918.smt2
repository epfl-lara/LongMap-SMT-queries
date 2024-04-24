; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128072 () Bool)

(assert start!128072)

(declare-fun b!1503405 () Bool)

(declare-fun e!841110 () Bool)

(declare-fun e!841113 () Bool)

(assert (=> b!1503405 (= e!841110 e!841113)))

(declare-fun res!1023299 () Bool)

(assert (=> b!1503405 (=> (not res!1023299) (not e!841113))))

(declare-datatypes ((array!100267 0))(
  ( (array!100268 (arr!48388 (Array (_ BitVec 32) (_ BitVec 64))) (size!48939 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100267)

(declare-fun x!647 () (_ BitVec 32))

(declare-fun lt!653872 () (_ BitVec 32))

(assert (=> b!1503405 (= res!1023299 (and (bvsge (bvadd #b00000000000000000000000000000001 x!647) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 x!647) #b01111111111111111111111111111110) (bvsge lt!653872 #b00000000000000000000000000000000) (bvslt lt!653872 (size!48939 a!2850))))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun index!625 () (_ BitVec 32))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1503405 (= lt!653872 (nextIndex!0 index!625 (bvadd #b00000000000000000000000000000001 x!647) mask!2661))))

(declare-fun b!1503406 () Bool)

(declare-fun res!1023305 () Bool)

(assert (=> b!1503406 (=> (not res!1023305) (not e!841110))))

(declare-fun j!87 () (_ BitVec 32))

(assert (=> b!1503406 (= res!1023305 (not (= (select (arr!48388 a!2850) index!625) (select (arr!48388 a!2850) j!87))))))

(declare-fun b!1503407 () Bool)

(assert (=> b!1503407 (= e!841113 (not true))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12491 0))(
  ( (MissingZero!12491 (index!52356 (_ BitVec 32))) (Found!12491 (index!52357 (_ BitVec 32))) (Intermediate!12491 (undefined!13303 Bool) (index!52358 (_ BitVec 32)) (x!134218 (_ BitVec 32))) (Undefined!12491) (MissingVacant!12491 (index!52359 (_ BitVec 32))) )
))
(declare-fun lt!653874 () SeekEntryResult!12491)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100267 (_ BitVec 32)) SeekEntryResult!12491)

(assert (=> b!1503407 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653872 vacantAfter!10 (select (store (arr!48388 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) j!87) (array!100268 (store (arr!48388 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) (size!48939 a!2850)) mask!2661) lt!653874)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-datatypes ((Unit!50173 0))(
  ( (Unit!50174) )
))
(declare-fun lt!653873 () Unit!50173)

(declare-fun lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 (array!100267 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!50173)

(assert (=> b!1503407 (= lt!653873 (lemmaPutLongMinValuePreservesSeekKeyOrZeroReturnVacant!0 a!2850 i!996 j!87 (bvadd #b00000000000000000000000000000001 x!647) lt!653872 vacantBefore!10 vacantAfter!10 mask!2661))))

(declare-fun b!1503408 () Bool)

(declare-fun res!1023303 () Bool)

(declare-fun e!841111 () Bool)

(assert (=> b!1503408 (=> (not res!1023303) (not e!841111))))

(declare-datatypes ((List!34867 0))(
  ( (Nil!34864) (Cons!34863 (h!36275 (_ BitVec 64)) (t!49553 List!34867)) )
))
(declare-fun arrayNoDuplicates!0 (array!100267 (_ BitVec 32) List!34867) Bool)

(assert (=> b!1503408 (= res!1023303 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34864))))

(declare-fun b!1503409 () Bool)

(assert (=> b!1503409 (= e!841111 e!841110)))

(declare-fun res!1023306 () Bool)

(assert (=> b!1503409 (=> (not res!1023306) (not e!841110))))

(assert (=> b!1503409 (= res!1023306 (= (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48388 a!2850) j!87) a!2850 mask!2661) lt!653874))))

(assert (=> b!1503409 (= lt!653874 (Found!12491 j!87))))

(declare-fun res!1023302 () Bool)

(assert (=> start!128072 (=> (not res!1023302) (not e!841111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128072 (= res!1023302 (validMask!0 mask!2661))))

(assert (=> start!128072 e!841111))

(assert (=> start!128072 true))

(declare-fun array_inv!37669 (array!100267) Bool)

(assert (=> start!128072 (array_inv!37669 a!2850)))

(declare-fun b!1503410 () Bool)

(declare-fun res!1023304 () Bool)

(assert (=> b!1503410 (=> (not res!1023304) (not e!841111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1503410 (= res!1023304 (validKeyInArray!0 (select (arr!48388 a!2850) j!87)))))

(declare-fun b!1503411 () Bool)

(declare-fun res!1023298 () Bool)

(assert (=> b!1503411 (=> (not res!1023298) (not e!841111))))

(assert (=> b!1503411 (= res!1023298 (and (= (size!48939 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48939 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48939 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1503412 () Bool)

(declare-fun res!1023308 () Bool)

(assert (=> b!1503412 (=> (not res!1023308) (not e!841111))))

(assert (=> b!1503412 (= res!1023308 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48939 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48939 a!2850)) (= (select (arr!48388 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48388 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48939 a!2850))))))

(declare-fun b!1503413 () Bool)

(declare-fun res!1023301 () Bool)

(assert (=> b!1503413 (=> (not res!1023301) (not e!841111))))

(assert (=> b!1503413 (= res!1023301 (validKeyInArray!0 (select (arr!48388 a!2850) i!996)))))

(declare-fun b!1503414 () Bool)

(declare-fun res!1023300 () Bool)

(assert (=> b!1503414 (=> (not res!1023300) (not e!841111))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100267 (_ BitVec 32)) Bool)

(assert (=> b!1503414 (= res!1023300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1503415 () Bool)

(declare-fun res!1023307 () Bool)

(assert (=> b!1503415 (=> (not res!1023307) (not e!841113))))

(assert (=> b!1503415 (= res!1023307 (= (seekKeyOrZeroReturnVacant!0 (bvadd #b00000000000000000000000000000001 x!647) lt!653872 vacantBefore!10 (select (arr!48388 a!2850) j!87) a!2850 mask!2661) lt!653874))))

(assert (= (and start!128072 res!1023302) b!1503411))

(assert (= (and b!1503411 res!1023298) b!1503413))

(assert (= (and b!1503413 res!1023301) b!1503410))

(assert (= (and b!1503410 res!1023304) b!1503414))

(assert (= (and b!1503414 res!1023300) b!1503408))

(assert (= (and b!1503408 res!1023303) b!1503412))

(assert (= (and b!1503412 res!1023308) b!1503409))

(assert (= (and b!1503409 res!1023306) b!1503406))

(assert (= (and b!1503406 res!1023305) b!1503405))

(assert (= (and b!1503405 res!1023299) b!1503415))

(assert (= (and b!1503415 res!1023307) b!1503407))

(declare-fun m!1386601 () Bool)

(assert (=> start!128072 m!1386601))

(declare-fun m!1386603 () Bool)

(assert (=> start!128072 m!1386603))

(declare-fun m!1386605 () Bool)

(assert (=> b!1503406 m!1386605))

(declare-fun m!1386607 () Bool)

(assert (=> b!1503406 m!1386607))

(declare-fun m!1386609 () Bool)

(assert (=> b!1503405 m!1386609))

(declare-fun m!1386611 () Bool)

(assert (=> b!1503407 m!1386611))

(declare-fun m!1386613 () Bool)

(assert (=> b!1503407 m!1386613))

(assert (=> b!1503407 m!1386613))

(declare-fun m!1386615 () Bool)

(assert (=> b!1503407 m!1386615))

(declare-fun m!1386617 () Bool)

(assert (=> b!1503407 m!1386617))

(declare-fun m!1386619 () Bool)

(assert (=> b!1503408 m!1386619))

(assert (=> b!1503415 m!1386607))

(assert (=> b!1503415 m!1386607))

(declare-fun m!1386621 () Bool)

(assert (=> b!1503415 m!1386621))

(declare-fun m!1386623 () Bool)

(assert (=> b!1503412 m!1386623))

(assert (=> b!1503412 m!1386611))

(declare-fun m!1386625 () Bool)

(assert (=> b!1503412 m!1386625))

(assert (=> b!1503409 m!1386607))

(assert (=> b!1503409 m!1386607))

(declare-fun m!1386627 () Bool)

(assert (=> b!1503409 m!1386627))

(assert (=> b!1503410 m!1386607))

(assert (=> b!1503410 m!1386607))

(declare-fun m!1386629 () Bool)

(assert (=> b!1503410 m!1386629))

(declare-fun m!1386631 () Bool)

(assert (=> b!1503414 m!1386631))

(declare-fun m!1386633 () Bool)

(assert (=> b!1503413 m!1386633))

(assert (=> b!1503413 m!1386633))

(declare-fun m!1386635 () Bool)

(assert (=> b!1503413 m!1386635))

(check-sat (not b!1503414) (not start!128072) (not b!1503410) (not b!1503415) (not b!1503407) (not b!1503408) (not b!1503405) (not b!1503413) (not b!1503409))
(check-sat)
