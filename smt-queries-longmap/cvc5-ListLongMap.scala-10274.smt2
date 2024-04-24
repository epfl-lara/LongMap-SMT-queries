; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120996 () Bool)

(assert start!120996)

(declare-fun b!1406781 () Bool)

(declare-fun res!944317 () Bool)

(declare-fun e!796381 () Bool)

(assert (=> b!1406781 (=> (not res!944317) (not e!796381))))

(declare-datatypes ((array!96225 0))(
  ( (array!96226 (arr!46458 (Array (_ BitVec 32) (_ BitVec 64))) (size!47009 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96225)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1406781 (= res!944317 (validKeyInArray!0 (select (arr!46458 a!2901) i!1037)))))

(declare-fun b!1406782 () Bool)

(declare-fun res!944316 () Bool)

(assert (=> b!1406782 (=> (not res!944316) (not e!796381))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1406782 (= res!944316 (and (= (size!47009 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47009 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47009 a!2901)) (not (= i!1037 j!112))))))

(declare-fun res!944318 () Bool)

(assert (=> start!120996 (=> (not res!944318) (not e!796381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120996 (= res!944318 (validMask!0 mask!2840))))

(assert (=> start!120996 e!796381))

(assert (=> start!120996 true))

(declare-fun array_inv!35739 (array!96225) Bool)

(assert (=> start!120996 (array_inv!35739 a!2901)))

(declare-fun b!1406783 () Bool)

(declare-fun res!944314 () Bool)

(assert (=> b!1406783 (=> (not res!944314) (not e!796381))))

(declare-datatypes ((List!32964 0))(
  ( (Nil!32961) (Cons!32960 (h!34222 (_ BitVec 64)) (t!47650 List!32964)) )
))
(declare-fun arrayNoDuplicates!0 (array!96225 (_ BitVec 32) List!32964) Bool)

(assert (=> b!1406783 (= res!944314 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32961))))

(declare-fun b!1406784 () Bool)

(declare-fun res!944319 () Bool)

(assert (=> b!1406784 (=> (not res!944319) (not e!796381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96225 (_ BitVec 32)) Bool)

(assert (=> b!1406784 (= res!944319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1406785 () Bool)

(declare-fun res!944320 () Bool)

(assert (=> b!1406785 (=> (not res!944320) (not e!796381))))

(assert (=> b!1406785 (= res!944320 (validKeyInArray!0 (select (arr!46458 a!2901) j!112)))))

(declare-fun b!1406786 () Bool)

(assert (=> b!1406786 (= e!796381 (not true))))

(declare-fun e!796382 () Bool)

(assert (=> b!1406786 e!796382))

(declare-fun res!944315 () Bool)

(assert (=> b!1406786 (=> (not res!944315) (not e!796382))))

(assert (=> b!1406786 (= res!944315 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47345 0))(
  ( (Unit!47346) )
))
(declare-fun lt!619484 () Unit!47345)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96225 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47345)

(assert (=> b!1406786 (= lt!619484 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-datatypes ((SeekEntryResult!10672 0))(
  ( (MissingZero!10672 (index!45065 (_ BitVec 32))) (Found!10672 (index!45066 (_ BitVec 32))) (Intermediate!10672 (undefined!11484 Bool) (index!45067 (_ BitVec 32)) (x!126826 (_ BitVec 32))) (Undefined!10672) (MissingVacant!10672 (index!45068 (_ BitVec 32))) )
))
(declare-fun lt!619483 () SeekEntryResult!10672)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96225 (_ BitVec 32)) SeekEntryResult!10672)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1406786 (= lt!619483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46458 a!2901) j!112) mask!2840) (select (arr!46458 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1406787 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96225 (_ BitVec 32)) SeekEntryResult!10672)

(assert (=> b!1406787 (= e!796382 (= (seekEntryOrOpen!0 (select (arr!46458 a!2901) j!112) a!2901 mask!2840) (Found!10672 j!112)))))

(assert (= (and start!120996 res!944318) b!1406782))

(assert (= (and b!1406782 res!944316) b!1406781))

(assert (= (and b!1406781 res!944317) b!1406785))

(assert (= (and b!1406785 res!944320) b!1406784))

(assert (= (and b!1406784 res!944319) b!1406783))

(assert (= (and b!1406783 res!944314) b!1406786))

(assert (= (and b!1406786 res!944315) b!1406787))

(declare-fun m!1295843 () Bool)

(assert (=> b!1406786 m!1295843))

(declare-fun m!1295845 () Bool)

(assert (=> b!1406786 m!1295845))

(assert (=> b!1406786 m!1295843))

(declare-fun m!1295847 () Bool)

(assert (=> b!1406786 m!1295847))

(assert (=> b!1406786 m!1295845))

(assert (=> b!1406786 m!1295843))

(declare-fun m!1295849 () Bool)

(assert (=> b!1406786 m!1295849))

(declare-fun m!1295851 () Bool)

(assert (=> b!1406786 m!1295851))

(assert (=> b!1406785 m!1295843))

(assert (=> b!1406785 m!1295843))

(declare-fun m!1295853 () Bool)

(assert (=> b!1406785 m!1295853))

(declare-fun m!1295855 () Bool)

(assert (=> b!1406784 m!1295855))

(declare-fun m!1295857 () Bool)

(assert (=> start!120996 m!1295857))

(declare-fun m!1295859 () Bool)

(assert (=> start!120996 m!1295859))

(declare-fun m!1295861 () Bool)

(assert (=> b!1406783 m!1295861))

(assert (=> b!1406787 m!1295843))

(assert (=> b!1406787 m!1295843))

(declare-fun m!1295863 () Bool)

(assert (=> b!1406787 m!1295863))

(declare-fun m!1295865 () Bool)

(assert (=> b!1406781 m!1295865))

(assert (=> b!1406781 m!1295865))

(declare-fun m!1295867 () Bool)

(assert (=> b!1406781 m!1295867))

(push 1)

(assert (not b!1406783))

(assert (not b!1406785))

(assert (not start!120996))

(assert (not b!1406786))

(assert (not b!1406787))

(assert (not b!1406781))

(assert (not b!1406784))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

