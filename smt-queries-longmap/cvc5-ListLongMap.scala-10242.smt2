; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120504 () Bool)

(assert start!120504)

(declare-fun b!1403174 () Bool)

(declare-fun res!941685 () Bool)

(declare-fun e!794510 () Bool)

(assert (=> b!1403174 (=> (not res!941685) (not e!794510))))

(declare-datatypes ((array!95913 0))(
  ( (array!95914 (arr!46307 (Array (_ BitVec 32) (_ BitVec 64))) (size!46857 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95913)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403174 (= res!941685 (validKeyInArray!0 (select (arr!46307 a!2901) j!112)))))

(declare-fun b!1403175 () Bool)

(declare-fun res!941690 () Bool)

(assert (=> b!1403175 (=> (not res!941690) (not e!794510))))

(declare-datatypes ((List!32826 0))(
  ( (Nil!32823) (Cons!32822 (h!34070 (_ BitVec 64)) (t!47520 List!32826)) )
))
(declare-fun arrayNoDuplicates!0 (array!95913 (_ BitVec 32) List!32826) Bool)

(assert (=> b!1403175 (= res!941690 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32823))))

(declare-fun b!1403176 () Bool)

(declare-fun e!794512 () Bool)

(assert (=> b!1403176 (= e!794510 (not e!794512))))

(declare-fun res!941692 () Bool)

(assert (=> b!1403176 (=> res!941692 e!794512)))

(declare-datatypes ((SeekEntryResult!10624 0))(
  ( (MissingZero!10624 (index!44873 (_ BitVec 32))) (Found!10624 (index!44874 (_ BitVec 32))) (Intermediate!10624 (undefined!11436 Bool) (index!44875 (_ BitVec 32)) (x!126491 (_ BitVec 32))) (Undefined!10624) (MissingVacant!10624 (index!44876 (_ BitVec 32))) )
))
(declare-fun lt!618302 () SeekEntryResult!10624)

(assert (=> b!1403176 (= res!941692 (or (not (is-Intermediate!10624 lt!618302)) (undefined!11436 lt!618302)))))

(declare-fun e!794511 () Bool)

(assert (=> b!1403176 e!794511))

(declare-fun res!941691 () Bool)

(assert (=> b!1403176 (=> (not res!941691) (not e!794511))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95913 (_ BitVec 32)) Bool)

(assert (=> b!1403176 (= res!941691 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47252 0))(
  ( (Unit!47253) )
))
(declare-fun lt!618303 () Unit!47252)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95913 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47252)

(assert (=> b!1403176 (= lt!618303 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95913 (_ BitVec 32)) SeekEntryResult!10624)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403176 (= lt!618302 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46307 a!2901) j!112) mask!2840) (select (arr!46307 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403177 () Bool)

(declare-fun res!941689 () Bool)

(assert (=> b!1403177 (=> (not res!941689) (not e!794510))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403177 (= res!941689 (and (= (size!46857 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46857 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46857 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403178 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95913 (_ BitVec 32)) SeekEntryResult!10624)

(assert (=> b!1403178 (= e!794511 (= (seekEntryOrOpen!0 (select (arr!46307 a!2901) j!112) a!2901 mask!2840) (Found!10624 j!112)))))

(declare-fun res!941688 () Bool)

(assert (=> start!120504 (=> (not res!941688) (not e!794510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120504 (= res!941688 (validMask!0 mask!2840))))

(assert (=> start!120504 e!794510))

(assert (=> start!120504 true))

(declare-fun array_inv!35335 (array!95913) Bool)

(assert (=> start!120504 (array_inv!35335 a!2901)))

(declare-fun b!1403179 () Bool)

(declare-fun res!941687 () Bool)

(assert (=> b!1403179 (=> (not res!941687) (not e!794510))))

(assert (=> b!1403179 (= res!941687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403180 () Bool)

(declare-fun res!941686 () Bool)

(assert (=> b!1403180 (=> (not res!941686) (not e!794510))))

(assert (=> b!1403180 (= res!941686 (validKeyInArray!0 (select (arr!46307 a!2901) i!1037)))))

(declare-fun b!1403181 () Bool)

(assert (=> b!1403181 (= e!794512 true)))

(declare-fun lt!618301 () SeekEntryResult!10624)

(assert (=> b!1403181 (= lt!618301 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46307 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46307 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!95914 (store (arr!46307 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46857 a!2901)) mask!2840))))

(assert (= (and start!120504 res!941688) b!1403177))

(assert (= (and b!1403177 res!941689) b!1403180))

(assert (= (and b!1403180 res!941686) b!1403174))

(assert (= (and b!1403174 res!941685) b!1403179))

(assert (= (and b!1403179 res!941687) b!1403175))

(assert (= (and b!1403175 res!941690) b!1403176))

(assert (= (and b!1403176 res!941691) b!1403178))

(assert (= (and b!1403176 (not res!941692)) b!1403181))

(declare-fun m!1291701 () Bool)

(assert (=> b!1403176 m!1291701))

(declare-fun m!1291703 () Bool)

(assert (=> b!1403176 m!1291703))

(assert (=> b!1403176 m!1291701))

(declare-fun m!1291705 () Bool)

(assert (=> b!1403176 m!1291705))

(assert (=> b!1403176 m!1291703))

(assert (=> b!1403176 m!1291701))

(declare-fun m!1291707 () Bool)

(assert (=> b!1403176 m!1291707))

(declare-fun m!1291709 () Bool)

(assert (=> b!1403176 m!1291709))

(declare-fun m!1291711 () Bool)

(assert (=> b!1403175 m!1291711))

(declare-fun m!1291713 () Bool)

(assert (=> b!1403179 m!1291713))

(declare-fun m!1291715 () Bool)

(assert (=> b!1403181 m!1291715))

(declare-fun m!1291717 () Bool)

(assert (=> b!1403181 m!1291717))

(assert (=> b!1403181 m!1291717))

(declare-fun m!1291719 () Bool)

(assert (=> b!1403181 m!1291719))

(assert (=> b!1403181 m!1291719))

(assert (=> b!1403181 m!1291717))

(declare-fun m!1291721 () Bool)

(assert (=> b!1403181 m!1291721))

(assert (=> b!1403178 m!1291701))

(assert (=> b!1403178 m!1291701))

(declare-fun m!1291723 () Bool)

(assert (=> b!1403178 m!1291723))

(declare-fun m!1291725 () Bool)

(assert (=> start!120504 m!1291725))

(declare-fun m!1291727 () Bool)

(assert (=> start!120504 m!1291727))

(declare-fun m!1291729 () Bool)

(assert (=> b!1403180 m!1291729))

(assert (=> b!1403180 m!1291729))

(declare-fun m!1291731 () Bool)

(assert (=> b!1403180 m!1291731))

(assert (=> b!1403174 m!1291701))

(assert (=> b!1403174 m!1291701))

(declare-fun m!1291733 () Bool)

(assert (=> b!1403174 m!1291733))

(push 1)

(assert (not b!1403176))

(assert (not b!1403181))

(assert (not b!1403174))

(assert (not start!120504))

(assert (not b!1403178))

(assert (not b!1403179))

(assert (not b!1403180))

(assert (not b!1403175))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

