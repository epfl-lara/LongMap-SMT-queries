; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119598 () Bool)

(assert start!119598)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95280 0))(
  ( (array!95281 (arr!45998 (Array (_ BitVec 32) (_ BitVec 64))) (size!46548 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95280)

(declare-fun b!1393115 () Bool)

(declare-fun e!788855 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10315 0))(
  ( (MissingZero!10315 (index!43631 (_ BitVec 32))) (Found!10315 (index!43632 (_ BitVec 32))) (Intermediate!10315 (undefined!11127 Bool) (index!43633 (_ BitVec 32)) (x!125319 (_ BitVec 32))) (Undefined!10315) (MissingVacant!10315 (index!43634 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95280 (_ BitVec 32)) SeekEntryResult!10315)

(assert (=> b!1393115 (= e!788855 (= (seekEntryOrOpen!0 (select (arr!45998 a!2901) j!112) a!2901 mask!2840) (Found!10315 j!112)))))

(declare-fun b!1393116 () Bool)

(declare-fun res!932523 () Bool)

(declare-fun e!788856 () Bool)

(assert (=> b!1393116 (=> (not res!932523) (not e!788856))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1393116 (= res!932523 (and (= (size!46548 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46548 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46548 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!932525 () Bool)

(assert (=> start!119598 (=> (not res!932525) (not e!788856))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119598 (= res!932525 (validMask!0 mask!2840))))

(assert (=> start!119598 e!788856))

(assert (=> start!119598 true))

(declare-fun array_inv!35026 (array!95280) Bool)

(assert (=> start!119598 (array_inv!35026 a!2901)))

(declare-fun b!1393117 () Bool)

(declare-fun res!932526 () Bool)

(assert (=> b!1393117 (=> (not res!932526) (not e!788856))))

(declare-datatypes ((List!32517 0))(
  ( (Nil!32514) (Cons!32513 (h!33746 (_ BitVec 64)) (t!47211 List!32517)) )
))
(declare-fun arrayNoDuplicates!0 (array!95280 (_ BitVec 32) List!32517) Bool)

(assert (=> b!1393117 (= res!932526 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32514))))

(declare-fun b!1393118 () Bool)

(declare-fun res!932527 () Bool)

(assert (=> b!1393118 (=> (not res!932527) (not e!788856))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95280 (_ BitVec 32)) Bool)

(assert (=> b!1393118 (= res!932527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1393119 () Bool)

(declare-fun res!932524 () Bool)

(assert (=> b!1393119 (=> (not res!932524) (not e!788856))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1393119 (= res!932524 (validKeyInArray!0 (select (arr!45998 a!2901) j!112)))))

(declare-fun b!1393120 () Bool)

(declare-fun e!788857 () Bool)

(assert (=> b!1393120 (= e!788857 true)))

(declare-fun lt!611871 () SeekEntryResult!10315)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95280 (_ BitVec 32)) SeekEntryResult!10315)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1393120 (= lt!611871 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!45998 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!45998 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95281 (store (arr!45998 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46548 a!2901)) mask!2840))))

(declare-fun b!1393121 () Bool)

(assert (=> b!1393121 (= e!788856 (not e!788857))))

(declare-fun res!932529 () Bool)

(assert (=> b!1393121 (=> res!932529 e!788857)))

(declare-fun lt!611869 () SeekEntryResult!10315)

(assert (=> b!1393121 (= res!932529 (or (not (is-Intermediate!10315 lt!611869)) (undefined!11127 lt!611869)))))

(assert (=> b!1393121 e!788855))

(declare-fun res!932530 () Bool)

(assert (=> b!1393121 (=> (not res!932530) (not e!788855))))

(assert (=> b!1393121 (= res!932530 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!46634 0))(
  ( (Unit!46635) )
))
(declare-fun lt!611870 () Unit!46634)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95280 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46634)

(assert (=> b!1393121 (= lt!611870 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1393121 (= lt!611869 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45998 a!2901) j!112) mask!2840) (select (arr!45998 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1393122 () Bool)

(declare-fun res!932528 () Bool)

(assert (=> b!1393122 (=> (not res!932528) (not e!788856))))

(assert (=> b!1393122 (= res!932528 (validKeyInArray!0 (select (arr!45998 a!2901) i!1037)))))

(assert (= (and start!119598 res!932525) b!1393116))

(assert (= (and b!1393116 res!932523) b!1393122))

(assert (= (and b!1393122 res!932528) b!1393119))

(assert (= (and b!1393119 res!932524) b!1393118))

(assert (= (and b!1393118 res!932527) b!1393117))

(assert (= (and b!1393117 res!932526) b!1393121))

(assert (= (and b!1393121 res!932530) b!1393115))

(assert (= (and b!1393121 (not res!932529)) b!1393120))

(declare-fun m!1278891 () Bool)

(assert (=> b!1393119 m!1278891))

(assert (=> b!1393119 m!1278891))

(declare-fun m!1278893 () Bool)

(assert (=> b!1393119 m!1278893))

(declare-fun m!1278895 () Bool)

(assert (=> b!1393118 m!1278895))

(declare-fun m!1278897 () Bool)

(assert (=> b!1393122 m!1278897))

(assert (=> b!1393122 m!1278897))

(declare-fun m!1278899 () Bool)

(assert (=> b!1393122 m!1278899))

(declare-fun m!1278901 () Bool)

(assert (=> b!1393120 m!1278901))

(declare-fun m!1278903 () Bool)

(assert (=> b!1393120 m!1278903))

(assert (=> b!1393120 m!1278903))

(declare-fun m!1278905 () Bool)

(assert (=> b!1393120 m!1278905))

(assert (=> b!1393120 m!1278905))

(assert (=> b!1393120 m!1278903))

(declare-fun m!1278907 () Bool)

(assert (=> b!1393120 m!1278907))

(assert (=> b!1393115 m!1278891))

(assert (=> b!1393115 m!1278891))

(declare-fun m!1278909 () Bool)

(assert (=> b!1393115 m!1278909))

(declare-fun m!1278911 () Bool)

(assert (=> b!1393117 m!1278911))

(declare-fun m!1278913 () Bool)

(assert (=> start!119598 m!1278913))

(declare-fun m!1278915 () Bool)

(assert (=> start!119598 m!1278915))

(assert (=> b!1393121 m!1278891))

(declare-fun m!1278917 () Bool)

(assert (=> b!1393121 m!1278917))

(assert (=> b!1393121 m!1278891))

(declare-fun m!1278919 () Bool)

(assert (=> b!1393121 m!1278919))

(assert (=> b!1393121 m!1278917))

(assert (=> b!1393121 m!1278891))

(declare-fun m!1278921 () Bool)

(assert (=> b!1393121 m!1278921))

(declare-fun m!1278923 () Bool)

(assert (=> b!1393121 m!1278923))

(push 1)

(assert (not b!1393122))

(assert (not start!119598))

(assert (not b!1393120))

(assert (not b!1393118))

(assert (not b!1393121))

(assert (not b!1393115))

(assert (not b!1393117))

(assert (not b!1393119))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

