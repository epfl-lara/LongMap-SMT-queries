; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!119642 () Bool)

(assert start!119642)

(declare-fun b!1393643 () Bool)

(declare-fun res!933053 () Bool)

(declare-fun e!789122 () Bool)

(assert (=> b!1393643 (=> (not res!933053) (not e!789122))))

(declare-datatypes ((array!95324 0))(
  ( (array!95325 (arr!46020 (Array (_ BitVec 32) (_ BitVec 64))) (size!46570 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95324)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393643 (= res!933053 (validKeyInArray!0 (select (arr!46020 a!2901) j!112)))))

(declare-fun res!933054 () Bool)

(assert (=> start!119642 (=> (not res!933054) (not e!789122))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119642 (= res!933054 (validMask!0 mask!2840))))

(assert (=> start!119642 e!789122))

(assert (=> start!119642 true))

(declare-fun array_inv!35048 (array!95324) Bool)

(assert (=> start!119642 (array_inv!35048 a!2901)))

(declare-fun b!1393644 () Bool)

(declare-fun e!789121 () Bool)

(assert (=> b!1393644 (= e!789121 true)))

(declare-fun i!1037 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10337 0))(
  ( (MissingZero!10337 (index!43719 (_ BitVec 32))) (Found!10337 (index!43720 (_ BitVec 32))) (Intermediate!10337 (undefined!11149 Bool) (index!43721 (_ BitVec 32)) (x!125397 (_ BitVec 32))) (Undefined!10337) (MissingVacant!10337 (index!43722 (_ BitVec 32))) )
))
(declare-fun lt!612067 () SeekEntryResult!10337)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95324 (_ BitVec 32)) SeekEntryResult!10337)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393644 (= lt!612067 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46020 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46020 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95325 (store (arr!46020 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46570 a!2901)) mask!2840))))

(declare-fun b!1393645 () Bool)

(declare-fun res!933057 () Bool)

(assert (=> b!1393645 (=> (not res!933057) (not e!789122))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95324 (_ BitVec 32)) Bool)

(assert (=> b!1393645 (= res!933057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun e!789119 () Bool)

(declare-fun b!1393646 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95324 (_ BitVec 32)) SeekEntryResult!10337)

(assert (=> b!1393646 (= e!789119 (= (seekEntryOrOpen!0 (select (arr!46020 a!2901) j!112) a!2901 mask!2840) (Found!10337 j!112)))))

(declare-fun b!1393647 () Bool)

(declare-fun res!933055 () Bool)

(assert (=> b!1393647 (=> (not res!933055) (not e!789122))))

(assert (=> b!1393647 (= res!933055 (validKeyInArray!0 (select (arr!46020 a!2901) i!1037)))))

(declare-fun b!1393648 () Bool)

(declare-fun res!933051 () Bool)

(assert (=> b!1393648 (=> (not res!933051) (not e!789122))))

(declare-datatypes ((List!32539 0))(
  ( (Nil!32536) (Cons!32535 (h!33768 (_ BitVec 64)) (t!47233 List!32539)) )
))
(declare-fun arrayNoDuplicates!0 (array!95324 (_ BitVec 32) List!32539) Bool)

(assert (=> b!1393648 (= res!933051 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32536))))

(declare-fun b!1393649 () Bool)

(declare-fun res!933056 () Bool)

(assert (=> b!1393649 (=> (not res!933056) (not e!789122))))

(assert (=> b!1393649 (= res!933056 (and (= (size!46570 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46570 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46570 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1393650 () Bool)

(assert (=> b!1393650 (= e!789122 (not e!789121))))

(declare-fun res!933058 () Bool)

(assert (=> b!1393650 (=> res!933058 e!789121)))

(declare-fun lt!612069 () SeekEntryResult!10337)

(get-info :version)

(assert (=> b!1393650 (= res!933058 (or (not ((_ is Intermediate!10337) lt!612069)) (undefined!11149 lt!612069)))))

(assert (=> b!1393650 e!789119))

(declare-fun res!933052 () Bool)

(assert (=> b!1393650 (=> (not res!933052) (not e!789119))))

(assert (=> b!1393650 (= res!933052 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46678 0))(
  ( (Unit!46679) )
))
(declare-fun lt!612068 () Unit!46678)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95324 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46678)

(assert (=> b!1393650 (= lt!612068 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393650 (= lt!612069 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46020 a!2901) j!112) mask!2840) (select (arr!46020 a!2901) j!112) a!2901 mask!2840))))

(assert (= (and start!119642 res!933054) b!1393649))

(assert (= (and b!1393649 res!933056) b!1393647))

(assert (= (and b!1393647 res!933055) b!1393643))

(assert (= (and b!1393643 res!933053) b!1393645))

(assert (= (and b!1393645 res!933057) b!1393648))

(assert (= (and b!1393648 res!933051) b!1393650))

(assert (= (and b!1393650 res!933052) b!1393646))

(assert (= (and b!1393650 (not res!933058)) b!1393644))

(declare-fun m!1279639 () Bool)

(assert (=> b!1393647 m!1279639))

(assert (=> b!1393647 m!1279639))

(declare-fun m!1279641 () Bool)

(assert (=> b!1393647 m!1279641))

(declare-fun m!1279643 () Bool)

(assert (=> b!1393650 m!1279643))

(declare-fun m!1279645 () Bool)

(assert (=> b!1393650 m!1279645))

(assert (=> b!1393650 m!1279643))

(declare-fun m!1279647 () Bool)

(assert (=> b!1393650 m!1279647))

(assert (=> b!1393650 m!1279645))

(assert (=> b!1393650 m!1279643))

(declare-fun m!1279649 () Bool)

(assert (=> b!1393650 m!1279649))

(declare-fun m!1279651 () Bool)

(assert (=> b!1393650 m!1279651))

(assert (=> b!1393643 m!1279643))

(assert (=> b!1393643 m!1279643))

(declare-fun m!1279653 () Bool)

(assert (=> b!1393643 m!1279653))

(declare-fun m!1279655 () Bool)

(assert (=> start!119642 m!1279655))

(declare-fun m!1279657 () Bool)

(assert (=> start!119642 m!1279657))

(declare-fun m!1279659 () Bool)

(assert (=> b!1393645 m!1279659))

(declare-fun m!1279661 () Bool)

(assert (=> b!1393644 m!1279661))

(declare-fun m!1279663 () Bool)

(assert (=> b!1393644 m!1279663))

(assert (=> b!1393644 m!1279663))

(declare-fun m!1279665 () Bool)

(assert (=> b!1393644 m!1279665))

(assert (=> b!1393644 m!1279665))

(assert (=> b!1393644 m!1279663))

(declare-fun m!1279667 () Bool)

(assert (=> b!1393644 m!1279667))

(assert (=> b!1393646 m!1279643))

(assert (=> b!1393646 m!1279643))

(declare-fun m!1279669 () Bool)

(assert (=> b!1393646 m!1279669))

(declare-fun m!1279671 () Bool)

(assert (=> b!1393648 m!1279671))

(check-sat (not b!1393648) (not b!1393646) (not b!1393650) (not start!119642) (not b!1393645) (not b!1393644) (not b!1393647) (not b!1393643))
