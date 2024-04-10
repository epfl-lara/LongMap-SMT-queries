; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120570 () Bool)

(assert start!120570)

(declare-fun b!1403910 () Bool)

(declare-fun res!942426 () Bool)

(declare-fun e!794851 () Bool)

(assert (=> b!1403910 (=> (not res!942426) (not e!794851))))

(declare-datatypes ((array!95979 0))(
  ( (array!95980 (arr!46340 (Array (_ BitVec 32) (_ BitVec 64))) (size!46890 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95979)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1403910 (= res!942426 (validKeyInArray!0 (select (arr!46340 a!2901) i!1037)))))

(declare-fun b!1403911 () Bool)

(declare-fun res!942422 () Bool)

(assert (=> b!1403911 (=> (not res!942422) (not e!794851))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95979 (_ BitVec 32)) Bool)

(assert (=> b!1403911 (= res!942422 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1403912 () Bool)

(declare-fun res!942421 () Bool)

(assert (=> b!1403912 (=> (not res!942421) (not e!794851))))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1403912 (= res!942421 (validKeyInArray!0 (select (arr!46340 a!2901) j!112)))))

(declare-fun b!1403913 () Bool)

(declare-fun e!794852 () Bool)

(declare-datatypes ((SeekEntryResult!10657 0))(
  ( (MissingZero!10657 (index!45005 (_ BitVec 32))) (Found!10657 (index!45006 (_ BitVec 32))) (Intermediate!10657 (undefined!11469 Bool) (index!45007 (_ BitVec 32)) (x!126612 (_ BitVec 32))) (Undefined!10657) (MissingVacant!10657 (index!45008 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95979 (_ BitVec 32)) SeekEntryResult!10657)

(assert (=> b!1403913 (= e!794852 (= (seekEntryOrOpen!0 (select (arr!46340 a!2901) j!112) a!2901 mask!2840) (Found!10657 j!112)))))

(declare-fun res!942423 () Bool)

(assert (=> start!120570 (=> (not res!942423) (not e!794851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120570 (= res!942423 (validMask!0 mask!2840))))

(assert (=> start!120570 e!794851))

(assert (=> start!120570 true))

(declare-fun array_inv!35368 (array!95979) Bool)

(assert (=> start!120570 (array_inv!35368 a!2901)))

(declare-fun b!1403914 () Bool)

(assert (=> b!1403914 (= e!794851 (not true))))

(assert (=> b!1403914 e!794852))

(declare-fun res!942425 () Bool)

(assert (=> b!1403914 (=> (not res!942425) (not e!794852))))

(assert (=> b!1403914 (= res!942425 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47318 0))(
  ( (Unit!47319) )
))
(declare-fun lt!618542 () Unit!47318)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95979 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47318)

(assert (=> b!1403914 (= lt!618542 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!618543 () SeekEntryResult!10657)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95979 (_ BitVec 32)) SeekEntryResult!10657)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1403914 (= lt!618543 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46340 a!2901) j!112) mask!2840) (select (arr!46340 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1403915 () Bool)

(declare-fun res!942427 () Bool)

(assert (=> b!1403915 (=> (not res!942427) (not e!794851))))

(assert (=> b!1403915 (= res!942427 (and (= (size!46890 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46890 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46890 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1403916 () Bool)

(declare-fun res!942424 () Bool)

(assert (=> b!1403916 (=> (not res!942424) (not e!794851))))

(declare-datatypes ((List!32859 0))(
  ( (Nil!32856) (Cons!32855 (h!34103 (_ BitVec 64)) (t!47553 List!32859)) )
))
(declare-fun arrayNoDuplicates!0 (array!95979 (_ BitVec 32) List!32859) Bool)

(assert (=> b!1403916 (= res!942424 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32856))))

(assert (= (and start!120570 res!942423) b!1403915))

(assert (= (and b!1403915 res!942427) b!1403910))

(assert (= (and b!1403910 res!942426) b!1403912))

(assert (= (and b!1403912 res!942421) b!1403911))

(assert (= (and b!1403911 res!942422) b!1403916))

(assert (= (and b!1403916 res!942424) b!1403914))

(assert (= (and b!1403914 res!942425) b!1403913))

(declare-fun m!1292679 () Bool)

(assert (=> b!1403913 m!1292679))

(assert (=> b!1403913 m!1292679))

(declare-fun m!1292681 () Bool)

(assert (=> b!1403913 m!1292681))

(assert (=> b!1403912 m!1292679))

(assert (=> b!1403912 m!1292679))

(declare-fun m!1292683 () Bool)

(assert (=> b!1403912 m!1292683))

(declare-fun m!1292685 () Bool)

(assert (=> b!1403911 m!1292685))

(assert (=> b!1403914 m!1292679))

(declare-fun m!1292687 () Bool)

(assert (=> b!1403914 m!1292687))

(assert (=> b!1403914 m!1292679))

(declare-fun m!1292689 () Bool)

(assert (=> b!1403914 m!1292689))

(assert (=> b!1403914 m!1292687))

(assert (=> b!1403914 m!1292679))

(declare-fun m!1292691 () Bool)

(assert (=> b!1403914 m!1292691))

(declare-fun m!1292693 () Bool)

(assert (=> b!1403914 m!1292693))

(declare-fun m!1292695 () Bool)

(assert (=> b!1403916 m!1292695))

(declare-fun m!1292697 () Bool)

(assert (=> start!120570 m!1292697))

(declare-fun m!1292699 () Bool)

(assert (=> start!120570 m!1292699))

(declare-fun m!1292701 () Bool)

(assert (=> b!1403910 m!1292701))

(assert (=> b!1403910 m!1292701))

(declare-fun m!1292703 () Bool)

(assert (=> b!1403910 m!1292703))

(push 1)

(assert (not b!1403910))

(assert (not b!1403913))

(assert (not b!1403914))

(assert (not b!1403916))

(assert (not b!1403911))

(assert (not start!120570))

(assert (not b!1403912))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

