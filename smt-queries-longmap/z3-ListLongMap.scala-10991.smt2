; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128726 () Bool)

(assert start!128726)

(declare-fun b!1508591 () Bool)

(declare-fun res!1028708 () Bool)

(declare-fun e!842719 () Bool)

(assert (=> b!1508591 (=> (not res!1028708) (not e!842719))))

(declare-datatypes ((array!100582 0))(
  ( (array!100583 (arr!48529 (Array (_ BitVec 32) (_ BitVec 64))) (size!49081 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100582)

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100582 (_ BitVec 32)) Bool)

(assert (=> b!1508591 (= res!1028708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1508592 () Bool)

(declare-fun res!1028704 () Bool)

(assert (=> b!1508592 (=> (not res!1028704) (not e!842719))))

(declare-fun i!961 () (_ BitVec 32))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1508592 (= res!1028704 (and (= (size!49081 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!49081 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!49081 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1508593 () Bool)

(declare-fun e!842720 () Bool)

(assert (=> b!1508593 (= e!842720 false)))

(declare-datatypes ((SeekEntryResult!12723 0))(
  ( (MissingZero!12723 (index!53287 (_ BitVec 32))) (Found!12723 (index!53288 (_ BitVec 32))) (Intermediate!12723 (undefined!13535 Bool) (index!53289 (_ BitVec 32)) (x!135051 (_ BitVec 32))) (Undefined!12723) (MissingVacant!12723 (index!53290 (_ BitVec 32))) )
))
(declare-fun lt!654476 () SeekEntryResult!12723)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!100582 (_ BitVec 32)) SeekEntryResult!12723)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1508593 (= lt!654476 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!48529 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) mask!2512) (select (store (arr!48529 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) j!70) (array!100583 (store (arr!48529 a!2804) i!961 #b1000000000000000000000000000000000000000000000000000000000000000) (size!49081 a!2804)) mask!2512))))

(declare-fun b!1508594 () Bool)

(declare-fun res!1028702 () Bool)

(assert (=> b!1508594 (=> (not res!1028702) (not e!842719))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1508594 (= res!1028702 (validKeyInArray!0 (select (arr!48529 a!2804) i!961)))))

(declare-fun b!1508595 () Bool)

(declare-fun res!1028705 () Bool)

(assert (=> b!1508595 (=> (not res!1028705) (not e!842719))))

(assert (=> b!1508595 (= res!1028705 (validKeyInArray!0 (select (arr!48529 a!2804) j!70)))))

(declare-fun res!1028706 () Bool)

(assert (=> start!128726 (=> (not res!1028706) (not e!842719))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128726 (= res!1028706 (validMask!0 mask!2512))))

(assert (=> start!128726 e!842719))

(assert (=> start!128726 true))

(declare-fun array_inv!37762 (array!100582) Bool)

(assert (=> start!128726 (array_inv!37762 a!2804)))

(declare-fun b!1508596 () Bool)

(declare-fun res!1028707 () Bool)

(assert (=> b!1508596 (=> (not res!1028707) (not e!842720))))

(declare-fun lt!654477 () SeekEntryResult!12723)

(declare-fun index!487 () (_ BitVec 32))

(declare-fun x!534 () (_ BitVec 32))

(assert (=> b!1508596 (= res!1028707 (= (seekKeyOrZeroOrLongMinValue!0 x!534 index!487 (select (arr!48529 a!2804) j!70) a!2804 mask!2512) lt!654477))))

(declare-fun b!1508597 () Bool)

(declare-fun res!1028703 () Bool)

(assert (=> b!1508597 (=> (not res!1028703) (not e!842719))))

(declare-datatypes ((List!35090 0))(
  ( (Nil!35087) (Cons!35086 (h!36499 (_ BitVec 64)) (t!49776 List!35090)) )
))
(declare-fun arrayNoDuplicates!0 (array!100582 (_ BitVec 32) List!35090) Bool)

(assert (=> b!1508597 (= res!1028703 (arrayNoDuplicates!0 a!2804 #b00000000000000000000000000000000 Nil!35087))))

(declare-fun b!1508598 () Bool)

(declare-fun res!1028700 () Bool)

(assert (=> b!1508598 (=> (not res!1028700) (not e!842719))))

(declare-fun resIndex!21 () (_ BitVec 32))

(declare-fun resX!21 () (_ BitVec 32))

(assert (=> b!1508598 (= res!1028700 (and (bvsge x!534 #b00000000000000000000000000000000) (bvsle x!534 #b01111111111111111111111111111110) (bvsge resX!21 #b00000000000000000000000000000000) (bvsle resX!21 #b01111111111111111111111111111110) (bvsge index!487 #b00000000000000000000000000000000) (bvslt index!487 (size!49081 a!2804)) (bvsge resIndex!21 #b00000000000000000000000000000000) (bvslt resIndex!21 (size!49081 a!2804))))))

(declare-fun b!1508599 () Bool)

(assert (=> b!1508599 (= e!842719 e!842720)))

(declare-fun res!1028701 () Bool)

(assert (=> b!1508599 (=> (not res!1028701) (not e!842720))))

(assert (=> b!1508599 (= res!1028701 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!48529 a!2804) j!70) mask!2512) (select (arr!48529 a!2804) j!70) a!2804 mask!2512) lt!654477))))

(assert (=> b!1508599 (= lt!654477 (Intermediate!12723 false resIndex!21 resX!21))))

(assert (= (and start!128726 res!1028706) b!1508592))

(assert (= (and b!1508592 res!1028704) b!1508594))

(assert (= (and b!1508594 res!1028702) b!1508595))

(assert (= (and b!1508595 res!1028705) b!1508591))

(assert (= (and b!1508591 res!1028708) b!1508597))

(assert (= (and b!1508597 res!1028703) b!1508598))

(assert (= (and b!1508598 res!1028700) b!1508599))

(assert (= (and b!1508599 res!1028701) b!1508596))

(assert (= (and b!1508596 res!1028707) b!1508593))

(declare-fun m!1390445 () Bool)

(assert (=> b!1508593 m!1390445))

(declare-fun m!1390447 () Bool)

(assert (=> b!1508593 m!1390447))

(assert (=> b!1508593 m!1390447))

(declare-fun m!1390449 () Bool)

(assert (=> b!1508593 m!1390449))

(assert (=> b!1508593 m!1390449))

(assert (=> b!1508593 m!1390447))

(declare-fun m!1390451 () Bool)

(assert (=> b!1508593 m!1390451))

(declare-fun m!1390453 () Bool)

(assert (=> b!1508597 m!1390453))

(declare-fun m!1390455 () Bool)

(assert (=> b!1508594 m!1390455))

(assert (=> b!1508594 m!1390455))

(declare-fun m!1390457 () Bool)

(assert (=> b!1508594 m!1390457))

(declare-fun m!1390459 () Bool)

(assert (=> b!1508595 m!1390459))

(assert (=> b!1508595 m!1390459))

(declare-fun m!1390461 () Bool)

(assert (=> b!1508595 m!1390461))

(declare-fun m!1390463 () Bool)

(assert (=> start!128726 m!1390463))

(declare-fun m!1390465 () Bool)

(assert (=> start!128726 m!1390465))

(assert (=> b!1508596 m!1390459))

(assert (=> b!1508596 m!1390459))

(declare-fun m!1390467 () Bool)

(assert (=> b!1508596 m!1390467))

(assert (=> b!1508599 m!1390459))

(assert (=> b!1508599 m!1390459))

(declare-fun m!1390469 () Bool)

(assert (=> b!1508599 m!1390469))

(assert (=> b!1508599 m!1390469))

(assert (=> b!1508599 m!1390459))

(declare-fun m!1390471 () Bool)

(assert (=> b!1508599 m!1390471))

(declare-fun m!1390473 () Bool)

(assert (=> b!1508591 m!1390473))

(check-sat (not b!1508596) (not b!1508594) (not b!1508595) (not b!1508599) (not start!128726) (not b!1508593) (not b!1508591) (not b!1508597))
(check-sat)
