; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!127880 () Bool)

(assert start!127880)

(declare-fun res!1023475 () Bool)

(declare-fun e!840324 () Bool)

(assert (=> start!127880 (=> (not res!1023475) (not e!840324))))

(declare-fun mask!2661 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!127880 (= res!1023475 (validMask!0 mask!2661))))

(assert (=> start!127880 e!840324))

(assert (=> start!127880 true))

(declare-datatypes ((array!100228 0))(
  ( (array!100229 (arr!48372 (Array (_ BitVec 32) (_ BitVec 64))) (size!48922 (_ BitVec 32))) )
))
(declare-fun a!2850 () array!100228)

(declare-fun array_inv!37400 (array!100228) Bool)

(assert (=> start!127880 (array_inv!37400 a!2850)))

(declare-fun b!1502489 () Bool)

(assert (=> b!1502489 (= e!840324 false)))

(declare-fun vacantBefore!10 () (_ BitVec 32))

(declare-fun x!647 () (_ BitVec 32))

(declare-fun j!87 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!12570 0))(
  ( (MissingZero!12570 (index!52672 (_ BitVec 32))) (Found!12570 (index!52673 (_ BitVec 32))) (Intermediate!12570 (undefined!13382 Bool) (index!52674 (_ BitVec 32)) (x!134359 (_ BitVec 32))) (Undefined!12570) (MissingVacant!12570 (index!52675 (_ BitVec 32))) )
))
(declare-fun lt!653386 () SeekEntryResult!12570)

(declare-fun index!625 () (_ BitVec 32))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100228 (_ BitVec 32)) SeekEntryResult!12570)

(assert (=> b!1502489 (= lt!653386 (seekKeyOrZeroReturnVacant!0 x!647 index!625 vacantBefore!10 (select (arr!48372 a!2850) j!87) a!2850 mask!2661))))

(declare-fun b!1502490 () Bool)

(declare-fun res!1023480 () Bool)

(assert (=> b!1502490 (=> (not res!1023480) (not e!840324))))

(declare-fun i!996 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1502490 (= res!1023480 (validKeyInArray!0 (select (arr!48372 a!2850) i!996)))))

(declare-fun b!1502491 () Bool)

(declare-fun res!1023478 () Bool)

(assert (=> b!1502491 (=> (not res!1023478) (not e!840324))))

(assert (=> b!1502491 (= res!1023478 (and (= (size!48922 a!2850) (bvadd #b00000000000000000000000000000001 mask!2661)) (bvsge i!996 #b00000000000000000000000000000000) (bvslt i!996 (size!48922 a!2850)) (bvsge j!87 #b00000000000000000000000000000000) (bvslt j!87 (size!48922 a!2850)) (not (= i!996 j!87))))))

(declare-fun b!1502492 () Bool)

(declare-fun res!1023477 () Bool)

(assert (=> b!1502492 (=> (not res!1023477) (not e!840324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100228 (_ BitVec 32)) Bool)

(assert (=> b!1502492 (= res!1023477 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2850 mask!2661))))

(declare-fun b!1502493 () Bool)

(declare-fun res!1023479 () Bool)

(assert (=> b!1502493 (=> (not res!1023479) (not e!840324))))

(assert (=> b!1502493 (= res!1023479 (validKeyInArray!0 (select (arr!48372 a!2850) j!87)))))

(declare-fun b!1502494 () Bool)

(declare-fun res!1023476 () Bool)

(assert (=> b!1502494 (=> (not res!1023476) (not e!840324))))

(declare-datatypes ((List!34864 0))(
  ( (Nil!34861) (Cons!34860 (h!36257 (_ BitVec 64)) (t!49558 List!34864)) )
))
(declare-fun arrayNoDuplicates!0 (array!100228 (_ BitVec 32) List!34864) Bool)

(assert (=> b!1502494 (= res!1023476 (arrayNoDuplicates!0 a!2850 #b00000000000000000000000000000000 Nil!34861))))

(declare-fun b!1502495 () Bool)

(declare-fun res!1023481 () Bool)

(assert (=> b!1502495 (=> (not res!1023481) (not e!840324))))

(declare-fun vacantAfter!10 () (_ BitVec 32))

(assert (=> b!1502495 (= res!1023481 (and (bvsge x!647 #b00000000000000000000000000000000) (bvsle x!647 #b01111111111111111111111111111110) (bvsge vacantBefore!10 #b00000000000000000000000000000000) (bvslt vacantBefore!10 (size!48922 a!2850)) (bvsge vacantAfter!10 #b00000000000000000000000000000000) (bvslt vacantAfter!10 (size!48922 a!2850)) (= (select (arr!48372 a!2850) vacantBefore!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (store (arr!48372 a!2850) i!996 #b1000000000000000000000000000000000000000000000000000000000000000) vacantAfter!10) #b1000000000000000000000000000000000000000000000000000000000000000) (= vacantAfter!10 i!996) (bvsge index!625 #b00000000000000000000000000000000) (bvslt index!625 (size!48922 a!2850))))))

(assert (= (and start!127880 res!1023475) b!1502491))

(assert (= (and b!1502491 res!1023478) b!1502490))

(assert (= (and b!1502490 res!1023480) b!1502493))

(assert (= (and b!1502493 res!1023479) b!1502492))

(assert (= (and b!1502492 res!1023477) b!1502494))

(assert (= (and b!1502494 res!1023476) b!1502495))

(assert (= (and b!1502495 res!1023481) b!1502489))

(declare-fun m!1385761 () Bool)

(assert (=> b!1502492 m!1385761))

(declare-fun m!1385763 () Bool)

(assert (=> b!1502490 m!1385763))

(assert (=> b!1502490 m!1385763))

(declare-fun m!1385765 () Bool)

(assert (=> b!1502490 m!1385765))

(declare-fun m!1385767 () Bool)

(assert (=> b!1502489 m!1385767))

(assert (=> b!1502489 m!1385767))

(declare-fun m!1385769 () Bool)

(assert (=> b!1502489 m!1385769))

(declare-fun m!1385771 () Bool)

(assert (=> b!1502495 m!1385771))

(declare-fun m!1385773 () Bool)

(assert (=> b!1502495 m!1385773))

(declare-fun m!1385775 () Bool)

(assert (=> b!1502495 m!1385775))

(assert (=> b!1502493 m!1385767))

(assert (=> b!1502493 m!1385767))

(declare-fun m!1385777 () Bool)

(assert (=> b!1502493 m!1385777))

(declare-fun m!1385779 () Bool)

(assert (=> b!1502494 m!1385779))

(declare-fun m!1385781 () Bool)

(assert (=> start!127880 m!1385781))

(declare-fun m!1385783 () Bool)

(assert (=> start!127880 m!1385783))

(check-sat (not b!1502493) (not start!127880) (not b!1502494) (not b!1502492) (not b!1502489) (not b!1502490))
