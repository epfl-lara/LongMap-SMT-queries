; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!119292 () Bool)

(assert start!119292)

(declare-fun b!1390681 () Bool)

(declare-fun res!930160 () Bool)

(declare-fun e!787814 () Bool)

(assert (=> b!1390681 (=> (not res!930160) (not e!787814))))

(declare-datatypes ((array!95151 0))(
  ( (array!95152 (arr!45939 (Array (_ BitVec 32) (_ BitVec 64))) (size!46490 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95151)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95151 (_ BitVec 32)) Bool)

(assert (=> b!1390681 (= res!930160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1390682 () Bool)

(declare-fun res!930159 () Bool)

(assert (=> b!1390682 (=> (not res!930159) (not e!787814))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1390682 (= res!930159 (validKeyInArray!0 (select (arr!45939 a!2901) j!112)))))

(declare-fun b!1390683 () Bool)

(declare-fun res!930163 () Bool)

(assert (=> b!1390683 (=> (not res!930163) (not e!787814))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1390683 (= res!930163 (and (= (size!46490 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46490 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46490 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1390685 () Bool)

(declare-fun res!930161 () Bool)

(assert (=> b!1390685 (=> (not res!930161) (not e!787814))))

(assert (=> b!1390685 (= res!930161 (validKeyInArray!0 (select (arr!45939 a!2901) i!1037)))))

(declare-fun b!1390686 () Bool)

(declare-fun res!930162 () Bool)

(assert (=> b!1390686 (=> (not res!930162) (not e!787814))))

(declare-datatypes ((List!32445 0))(
  ( (Nil!32442) (Cons!32441 (h!33667 (_ BitVec 64)) (t!47131 List!32445)) )
))
(declare-fun arrayNoDuplicates!0 (array!95151 (_ BitVec 32) List!32445) Bool)

(assert (=> b!1390686 (= res!930162 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32442))))

(declare-fun b!1390684 () Bool)

(assert (=> b!1390684 (= e!787814 false)))

(declare-datatypes ((SeekEntryResult!10159 0))(
  ( (MissingZero!10159 (index!43007 (_ BitVec 32))) (Found!10159 (index!43008 (_ BitVec 32))) (Intermediate!10159 (undefined!10971 Bool) (index!43009 (_ BitVec 32)) (x!124848 (_ BitVec 32))) (Undefined!10159) (MissingVacant!10159 (index!43010 (_ BitVec 32))) )
))
(declare-fun lt!610982 () SeekEntryResult!10159)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95151 (_ BitVec 32)) SeekEntryResult!10159)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1390684 (= lt!610982 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!45939 a!2901) j!112) mask!2840) (select (arr!45939 a!2901) j!112) a!2901 mask!2840))))

(declare-fun res!930158 () Bool)

(assert (=> start!119292 (=> (not res!930158) (not e!787814))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!119292 (= res!930158 (validMask!0 mask!2840))))

(assert (=> start!119292 e!787814))

(assert (=> start!119292 true))

(declare-fun array_inv!35220 (array!95151) Bool)

(assert (=> start!119292 (array_inv!35220 a!2901)))

(assert (= (and start!119292 res!930158) b!1390683))

(assert (= (and b!1390683 res!930163) b!1390685))

(assert (= (and b!1390685 res!930161) b!1390682))

(assert (= (and b!1390682 res!930159) b!1390681))

(assert (= (and b!1390681 res!930160) b!1390686))

(assert (= (and b!1390686 res!930162) b!1390684))

(declare-fun m!1276559 () Bool)

(assert (=> start!119292 m!1276559))

(declare-fun m!1276561 () Bool)

(assert (=> start!119292 m!1276561))

(declare-fun m!1276563 () Bool)

(assert (=> b!1390685 m!1276563))

(assert (=> b!1390685 m!1276563))

(declare-fun m!1276565 () Bool)

(assert (=> b!1390685 m!1276565))

(declare-fun m!1276567 () Bool)

(assert (=> b!1390686 m!1276567))

(declare-fun m!1276569 () Bool)

(assert (=> b!1390681 m!1276569))

(declare-fun m!1276571 () Bool)

(assert (=> b!1390684 m!1276571))

(assert (=> b!1390684 m!1276571))

(declare-fun m!1276573 () Bool)

(assert (=> b!1390684 m!1276573))

(assert (=> b!1390684 m!1276573))

(assert (=> b!1390684 m!1276571))

(declare-fun m!1276575 () Bool)

(assert (=> b!1390684 m!1276575))

(assert (=> b!1390682 m!1276571))

(assert (=> b!1390682 m!1276571))

(declare-fun m!1276577 () Bool)

(assert (=> b!1390682 m!1276577))

(push 1)

(assert (not b!1390682))

(assert (not b!1390686))

(assert (not b!1390684))

(assert (not start!119292))

(assert (not b!1390685))

(assert (not b!1390681))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

