; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120396 () Bool)

(assert start!120396)

(declare-fun b!1401542 () Bool)

(declare-fun res!940059 () Bool)

(declare-fun e!793602 () Bool)

(assert (=> b!1401542 (=> (not res!940059) (not e!793602))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95805 0))(
  ( (array!95806 (arr!46253 (Array (_ BitVec 32) (_ BitVec 64))) (size!46803 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95805)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1401542 (= res!940059 (and (= (size!46803 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46803 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46803 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401543 () Bool)

(declare-fun res!940057 () Bool)

(assert (=> b!1401543 (=> (not res!940057) (not e!793602))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95805 (_ BitVec 32)) Bool)

(assert (=> b!1401543 (= res!940057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401544 () Bool)

(declare-fun e!793600 () Bool)

(assert (=> b!1401544 (= e!793602 (not e!793600))))

(declare-fun res!940060 () Bool)

(assert (=> b!1401544 (=> res!940060 e!793600)))

(declare-datatypes ((SeekEntryResult!10570 0))(
  ( (MissingZero!10570 (index!44657 (_ BitVec 32))) (Found!10570 (index!44658 (_ BitVec 32))) (Intermediate!10570 (undefined!11382 Bool) (index!44659 (_ BitVec 32)) (x!126293 (_ BitVec 32))) (Undefined!10570) (MissingVacant!10570 (index!44660 (_ BitVec 32))) )
))
(declare-fun lt!617012 () SeekEntryResult!10570)

(assert (=> b!1401544 (= res!940060 (or (not (is-Intermediate!10570 lt!617012)) (undefined!11382 lt!617012)))))

(declare-fun e!793603 () Bool)

(assert (=> b!1401544 e!793603))

(declare-fun res!940058 () Bool)

(assert (=> b!1401544 (=> (not res!940058) (not e!793603))))

(assert (=> b!1401544 (= res!940058 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47144 0))(
  ( (Unit!47145) )
))
(declare-fun lt!617010 () Unit!47144)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47144)

(assert (=> b!1401544 (= lt!617010 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun lt!617008 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95805 (_ BitVec 32)) SeekEntryResult!10570)

(assert (=> b!1401544 (= lt!617012 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617008 (select (arr!46253 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401544 (= lt!617008 (toIndex!0 (select (arr!46253 a!2901) j!112) mask!2840))))

(declare-fun e!793604 () Bool)

(declare-fun lt!617006 () SeekEntryResult!10570)

(declare-fun lt!617007 () array!95805)

(declare-fun lt!617011 () (_ BitVec 64))

(declare-fun b!1401545 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95805 (_ BitVec 32)) SeekEntryResult!10570)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95805 (_ BitVec 32)) SeekEntryResult!10570)

(assert (=> b!1401545 (= e!793604 (= (seekEntryOrOpen!0 lt!617011 lt!617007 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126293 lt!617006) (index!44659 lt!617006) (index!44659 lt!617006) (select (arr!46253 a!2901) j!112) lt!617007 mask!2840)))))

(declare-fun res!940063 () Bool)

(assert (=> start!120396 (=> (not res!940063) (not e!793602))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120396 (= res!940063 (validMask!0 mask!2840))))

(assert (=> start!120396 e!793602))

(assert (=> start!120396 true))

(declare-fun array_inv!35281 (array!95805) Bool)

(assert (=> start!120396 (array_inv!35281 a!2901)))

(declare-fun b!1401546 () Bool)

(assert (=> b!1401546 (= e!793603 (= (seekEntryOrOpen!0 (select (arr!46253 a!2901) j!112) a!2901 mask!2840) (Found!10570 j!112)))))

(declare-fun b!1401547 () Bool)

(declare-fun res!940056 () Bool)

(assert (=> b!1401547 (=> (not res!940056) (not e!793602))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401547 (= res!940056 (validKeyInArray!0 (select (arr!46253 a!2901) j!112)))))

(declare-fun b!1401548 () Bool)

(declare-fun e!793601 () Bool)

(assert (=> b!1401548 (= e!793601 true)))

(declare-fun lt!617009 () SeekEntryResult!10570)

(assert (=> b!1401548 (= lt!617009 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617008 lt!617011 lt!617007 mask!2840))))

(declare-fun b!1401549 () Bool)

(declare-fun res!940061 () Bool)

(assert (=> b!1401549 (=> (not res!940061) (not e!793602))))

(declare-datatypes ((List!32772 0))(
  ( (Nil!32769) (Cons!32768 (h!34016 (_ BitVec 64)) (t!47466 List!32772)) )
))
(declare-fun arrayNoDuplicates!0 (array!95805 (_ BitVec 32) List!32772) Bool)

(assert (=> b!1401549 (= res!940061 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32769))))

(declare-fun b!1401550 () Bool)

(declare-fun e!793599 () Bool)

(assert (=> b!1401550 (= e!793600 e!793599)))

(declare-fun res!940053 () Bool)

(assert (=> b!1401550 (=> res!940053 e!793599)))

(assert (=> b!1401550 (= res!940053 (or (= lt!617012 lt!617006) (not (is-Intermediate!10570 lt!617006))))))

(assert (=> b!1401550 (= lt!617006 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617011 mask!2840) lt!617011 lt!617007 mask!2840))))

(assert (=> b!1401550 (= lt!617011 (select (store (arr!46253 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401550 (= lt!617007 (array!95806 (store (arr!46253 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46803 a!2901)))))

(declare-fun b!1401551 () Bool)

(declare-fun res!940054 () Bool)

(assert (=> b!1401551 (=> (not res!940054) (not e!793602))))

(assert (=> b!1401551 (= res!940054 (validKeyInArray!0 (select (arr!46253 a!2901) i!1037)))))

(declare-fun b!1401552 () Bool)

(assert (=> b!1401552 (= e!793599 e!793601)))

(declare-fun res!940055 () Bool)

(assert (=> b!1401552 (=> res!940055 e!793601)))

(assert (=> b!1401552 (= res!940055 (or (bvslt (x!126293 lt!617012) #b00000000000000000000000000000000) (bvsgt (x!126293 lt!617012) #b01111111111111111111111111111110) (bvslt (x!126293 lt!617006) #b00000000000000000000000000000000) (bvsgt (x!126293 lt!617006) #b01111111111111111111111111111110) (bvslt lt!617008 #b00000000000000000000000000000000) (bvsge lt!617008 (size!46803 a!2901)) (bvslt (index!44659 lt!617012) #b00000000000000000000000000000000) (bvsge (index!44659 lt!617012) (size!46803 a!2901)) (bvslt (index!44659 lt!617006) #b00000000000000000000000000000000) (bvsge (index!44659 lt!617006) (size!46803 a!2901)) (not (= lt!617012 (Intermediate!10570 false (index!44659 lt!617012) (x!126293 lt!617012)))) (not (= lt!617006 (Intermediate!10570 false (index!44659 lt!617006) (x!126293 lt!617006))))))))

(assert (=> b!1401552 e!793604))

(declare-fun res!940062 () Bool)

(assert (=> b!1401552 (=> (not res!940062) (not e!793604))))

(assert (=> b!1401552 (= res!940062 (and (not (undefined!11382 lt!617006)) (= (index!44659 lt!617006) i!1037) (bvslt (x!126293 lt!617006) (x!126293 lt!617012)) (= (select (store (arr!46253 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44659 lt!617006)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617013 () Unit!47144)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95805 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47144)

(assert (=> b!1401552 (= lt!617013 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617008 (x!126293 lt!617012) (index!44659 lt!617012) (x!126293 lt!617006) (index!44659 lt!617006) (undefined!11382 lt!617006) mask!2840))))

(assert (= (and start!120396 res!940063) b!1401542))

(assert (= (and b!1401542 res!940059) b!1401551))

(assert (= (and b!1401551 res!940054) b!1401547))

(assert (= (and b!1401547 res!940056) b!1401543))

(assert (= (and b!1401543 res!940057) b!1401549))

(assert (= (and b!1401549 res!940061) b!1401544))

(assert (= (and b!1401544 res!940058) b!1401546))

(assert (= (and b!1401544 (not res!940060)) b!1401550))

(assert (= (and b!1401550 (not res!940053)) b!1401552))

(assert (= (and b!1401552 res!940062) b!1401545))

(assert (= (and b!1401552 (not res!940055)) b!1401548))

(declare-fun m!1289361 () Bool)

(assert (=> b!1401544 m!1289361))

(declare-fun m!1289363 () Bool)

(assert (=> b!1401544 m!1289363))

(assert (=> b!1401544 m!1289361))

(assert (=> b!1401544 m!1289361))

(declare-fun m!1289365 () Bool)

(assert (=> b!1401544 m!1289365))

(declare-fun m!1289367 () Bool)

(assert (=> b!1401544 m!1289367))

(declare-fun m!1289369 () Bool)

(assert (=> b!1401544 m!1289369))

(declare-fun m!1289371 () Bool)

(assert (=> b!1401548 m!1289371))

(declare-fun m!1289373 () Bool)

(assert (=> b!1401549 m!1289373))

(assert (=> b!1401546 m!1289361))

(assert (=> b!1401546 m!1289361))

(declare-fun m!1289375 () Bool)

(assert (=> b!1401546 m!1289375))

(declare-fun m!1289377 () Bool)

(assert (=> b!1401550 m!1289377))

(assert (=> b!1401550 m!1289377))

(declare-fun m!1289379 () Bool)

(assert (=> b!1401550 m!1289379))

(declare-fun m!1289381 () Bool)

(assert (=> b!1401550 m!1289381))

(declare-fun m!1289383 () Bool)

(assert (=> b!1401550 m!1289383))

(declare-fun m!1289385 () Bool)

(assert (=> b!1401545 m!1289385))

(assert (=> b!1401545 m!1289361))

(assert (=> b!1401545 m!1289361))

(declare-fun m!1289387 () Bool)

(assert (=> b!1401545 m!1289387))

(declare-fun m!1289389 () Bool)

(assert (=> b!1401543 m!1289389))

(assert (=> b!1401547 m!1289361))

(assert (=> b!1401547 m!1289361))

(declare-fun m!1289391 () Bool)

(assert (=> b!1401547 m!1289391))

(declare-fun m!1289393 () Bool)

(assert (=> b!1401551 m!1289393))

(assert (=> b!1401551 m!1289393))

(declare-fun m!1289395 () Bool)

(assert (=> b!1401551 m!1289395))

(declare-fun m!1289397 () Bool)

(assert (=> start!120396 m!1289397))

(declare-fun m!1289399 () Bool)

(assert (=> start!120396 m!1289399))

(assert (=> b!1401552 m!1289381))

(declare-fun m!1289401 () Bool)

(assert (=> b!1401552 m!1289401))

(declare-fun m!1289403 () Bool)

(assert (=> b!1401552 m!1289403))

(push 1)

