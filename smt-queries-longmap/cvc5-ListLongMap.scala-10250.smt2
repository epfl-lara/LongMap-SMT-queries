; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120552 () Bool)

(assert start!120552)

(declare-fun b!1403682 () Bool)

(declare-fun res!942245 () Bool)

(declare-fun e!794749 () Bool)

(assert (=> b!1403682 (=> (not res!942245) (not e!794749))))

(declare-datatypes ((array!95914 0))(
  ( (array!95915 (arr!46308 (Array (_ BitVec 32) (_ BitVec 64))) (size!46860 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95914)

(declare-datatypes ((List!32905 0))(
  ( (Nil!32902) (Cons!32901 (h!34149 (_ BitVec 64)) (t!47591 List!32905)) )
))
(declare-fun arrayNoDuplicates!0 (array!95914 (_ BitVec 32) List!32905) Bool)

(assert (=> b!1403682 (= res!942245 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32902))))

(declare-fun b!1403683 () Bool)

(declare-fun res!942250 () Bool)

(assert (=> b!1403683 (=> (not res!942250) (not e!794749))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95914 (_ BitVec 32)) Bool)

(assert (=> b!1403683 (= res!942250 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403684 () Bool)

(assert (=> b!1403684 (= e!794749 (not true))))

(declare-fun e!794750 () Bool)

(assert (=> b!1403684 e!794750))

(declare-fun res!942249 () Bool)

(assert (=> b!1403684 (=> (not res!942249) (not e!794750))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403684 (= res!942249 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47149 0))(
  ( (Unit!47150) )
))
(declare-fun lt!618311 () Unit!47149)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95914 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47149)

(assert (=> b!1403684 (= lt!618311 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10651 0))(
  ( (MissingZero!10651 (index!44981 (_ BitVec 32))) (Found!10651 (index!44982 (_ BitVec 32))) (Intermediate!10651 (undefined!11463 Bool) (index!44983 (_ BitVec 32)) (x!126579 (_ BitVec 32))) (Undefined!10651) (MissingVacant!10651 (index!44984 (_ BitVec 32))) )
))
(declare-fun lt!618310 () SeekEntryResult!10651)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95914 (_ BitVec 32)) SeekEntryResult!10651)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403684 (= lt!618310 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46308 a!2901) j!112) mask!2840) (select (arr!46308 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403685 () Bool)

(declare-fun res!942247 () Bool)

(assert (=> b!1403685 (=> (not res!942247) (not e!794749))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1403685 (= res!942247 (and (= (size!46860 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46860 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46860 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403686 () Bool)

(declare-fun res!942248 () Bool)

(assert (=> b!1403686 (=> (not res!942248) (not e!794749))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403686 (= res!942248 (validKeyInArray!0 (select (arr!46308 a!2901) i!1037)))))

(declare-fun res!942244 () Bool)

(assert (=> start!120552 (=> (not res!942244) (not e!794749))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120552 (= res!942244 (validMask!0 mask!2840))))

(assert (=> start!120552 e!794749))

(assert (=> start!120552 true))

(declare-fun array_inv!35541 (array!95914) Bool)

(assert (=> start!120552 (array_inv!35541 a!2901)))

(declare-fun b!1403687 () Bool)

(declare-fun res!942246 () Bool)

(assert (=> b!1403687 (=> (not res!942246) (not e!794749))))

(assert (=> b!1403687 (= res!942246 (validKeyInArray!0 (select (arr!46308 a!2901) j!112)))))

(declare-fun b!1403688 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95914 (_ BitVec 32)) SeekEntryResult!10651)

(assert (=> b!1403688 (= e!794750 (= (seekEntryOrOpen!0 (select (arr!46308 a!2901) j!112) a!2901 mask!2840) (Found!10651 j!112)))))

(assert (= (and start!120552 res!942244) b!1403685))

(assert (= (and b!1403685 res!942247) b!1403686))

(assert (= (and b!1403686 res!942248) b!1403687))

(assert (= (and b!1403687 res!942246) b!1403683))

(assert (= (and b!1403683 res!942250) b!1403682))

(assert (= (and b!1403682 res!942245) b!1403684))

(assert (= (and b!1403684 res!942249) b!1403688))

(declare-fun m!1291961 () Bool)

(assert (=> b!1403683 m!1291961))

(declare-fun m!1291963 () Bool)

(assert (=> start!120552 m!1291963))

(declare-fun m!1291965 () Bool)

(assert (=> start!120552 m!1291965))

(declare-fun m!1291967 () Bool)

(assert (=> b!1403684 m!1291967))

(declare-fun m!1291969 () Bool)

(assert (=> b!1403684 m!1291969))

(assert (=> b!1403684 m!1291967))

(declare-fun m!1291971 () Bool)

(assert (=> b!1403684 m!1291971))

(assert (=> b!1403684 m!1291969))

(assert (=> b!1403684 m!1291967))

(declare-fun m!1291973 () Bool)

(assert (=> b!1403684 m!1291973))

(declare-fun m!1291975 () Bool)

(assert (=> b!1403684 m!1291975))

(declare-fun m!1291977 () Bool)

(assert (=> b!1403686 m!1291977))

(assert (=> b!1403686 m!1291977))

(declare-fun m!1291979 () Bool)

(assert (=> b!1403686 m!1291979))

(assert (=> b!1403687 m!1291967))

(assert (=> b!1403687 m!1291967))

(declare-fun m!1291981 () Bool)

(assert (=> b!1403687 m!1291981))

(assert (=> b!1403688 m!1291967))

(assert (=> b!1403688 m!1291967))

(declare-fun m!1291983 () Bool)

(assert (=> b!1403688 m!1291983))

(declare-fun m!1291985 () Bool)

(assert (=> b!1403682 m!1291985))

(push 1)

(assert (not b!1403688))

(assert (not b!1403682))

(assert (not b!1403684))

(assert (not b!1403686))

(assert (not b!1403687))

(assert (not b!1403683))

(assert (not start!120552))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

