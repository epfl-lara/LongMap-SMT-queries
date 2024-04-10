; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120442 () Bool)

(assert start!120442)

(declare-fun b!1402293 () Bool)

(declare-fun e!794065 () Bool)

(declare-fun e!794066 () Bool)

(assert (=> b!1402293 (= e!794065 e!794066)))

(declare-fun res!940810 () Bool)

(assert (=> b!1402293 (=> res!940810 e!794066)))

(declare-datatypes ((SeekEntryResult!10593 0))(
  ( (MissingZero!10593 (index!44749 (_ BitVec 32))) (Found!10593 (index!44750 (_ BitVec 32))) (Intermediate!10593 (undefined!11405 Bool) (index!44751 (_ BitVec 32)) (x!126372 (_ BitVec 32))) (Undefined!10593) (MissingVacant!10593 (index!44752 (_ BitVec 32))) )
))
(declare-fun lt!617574 () SeekEntryResult!10593)

(declare-fun lt!617583 () SeekEntryResult!10593)

(assert (=> b!1402293 (= res!940810 (or (= lt!617574 lt!617583) (not (is-Intermediate!10593 lt!617583))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun lt!617577 () (_ BitVec 64))

(declare-datatypes ((array!95851 0))(
  ( (array!95852 (arr!46276 (Array (_ BitVec 32) (_ BitVec 64))) (size!46826 (_ BitVec 32))) )
))
(declare-fun lt!617576 () array!95851)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95851 (_ BitVec 32)) SeekEntryResult!10593)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1402293 (= lt!617583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617577 mask!2840) lt!617577 lt!617576 mask!2840))))

(declare-fun a!2901 () array!95851)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1402293 (= lt!617577 (select (store (arr!46276 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1402293 (= lt!617576 (array!95852 (store (arr!46276 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46826 a!2901)))))

(declare-fun res!940809 () Bool)

(declare-fun e!794069 () Bool)

(assert (=> start!120442 (=> (not res!940809) (not e!794069))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120442 (= res!940809 (validMask!0 mask!2840))))

(assert (=> start!120442 e!794069))

(assert (=> start!120442 true))

(declare-fun array_inv!35304 (array!95851) Bool)

(assert (=> start!120442 (array_inv!35304 a!2901)))

(declare-fun b!1402294 () Bool)

(declare-fun res!940806 () Bool)

(assert (=> b!1402294 (=> (not res!940806) (not e!794069))))

(assert (=> b!1402294 (= res!940806 (and (= (size!46826 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46826 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46826 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1402295 () Bool)

(declare-fun res!940813 () Bool)

(declare-fun e!794067 () Bool)

(assert (=> b!1402295 (=> res!940813 e!794067)))

(declare-fun lt!617575 () (_ BitVec 32))

(assert (=> b!1402295 (= res!940813 (not (= lt!617583 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617575 lt!617577 lt!617576 mask!2840))))))

(declare-fun b!1402296 () Bool)

(declare-fun res!940811 () Bool)

(assert (=> b!1402296 (=> (not res!940811) (not e!794069))))

(declare-datatypes ((List!32795 0))(
  ( (Nil!32792) (Cons!32791 (h!34039 (_ BitVec 64)) (t!47489 List!32795)) )
))
(declare-fun arrayNoDuplicates!0 (array!95851 (_ BitVec 32) List!32795) Bool)

(assert (=> b!1402296 (= res!940811 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32792))))

(declare-fun b!1402297 () Bool)

(assert (=> b!1402297 (= e!794069 (not e!794065))))

(declare-fun res!940808 () Bool)

(assert (=> b!1402297 (=> res!940808 e!794065)))

(assert (=> b!1402297 (= res!940808 (or (not (is-Intermediate!10593 lt!617574)) (undefined!11405 lt!617574)))))

(declare-fun lt!617580 () SeekEntryResult!10593)

(assert (=> b!1402297 (= lt!617580 (Found!10593 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95851 (_ BitVec 32)) SeekEntryResult!10593)

(assert (=> b!1402297 (= lt!617580 (seekEntryOrOpen!0 (select (arr!46276 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95851 (_ BitVec 32)) Bool)

(assert (=> b!1402297 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47190 0))(
  ( (Unit!47191) )
))
(declare-fun lt!617578 () Unit!47190)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47190)

(assert (=> b!1402297 (= lt!617578 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1402297 (= lt!617574 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617575 (select (arr!46276 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1402297 (= lt!617575 (toIndex!0 (select (arr!46276 a!2901) j!112) mask!2840))))

(declare-fun b!1402298 () Bool)

(assert (=> b!1402298 (= e!794067 true)))

(declare-fun lt!617582 () SeekEntryResult!10593)

(assert (=> b!1402298 (= lt!617580 lt!617582)))

(declare-fun lt!617581 () Unit!47190)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 (array!95851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47190)

(assert (=> b!1402298 (= lt!617581 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey2Helper!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617575 (x!126372 lt!617574) (index!44751 lt!617574) (x!126372 lt!617583) (index!44751 lt!617583) mask!2840))))

(declare-fun b!1402299 () Bool)

(declare-fun res!940805 () Bool)

(assert (=> b!1402299 (=> (not res!940805) (not e!794069))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1402299 (= res!940805 (validKeyInArray!0 (select (arr!46276 a!2901) i!1037)))))

(declare-fun b!1402300 () Bool)

(declare-fun res!940812 () Bool)

(assert (=> b!1402300 (=> (not res!940812) (not e!794069))))

(assert (=> b!1402300 (= res!940812 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1402301 () Bool)

(declare-fun res!940807 () Bool)

(assert (=> b!1402301 (=> (not res!940807) (not e!794069))))

(assert (=> b!1402301 (= res!940807 (validKeyInArray!0 (select (arr!46276 a!2901) j!112)))))

(declare-fun b!1402302 () Bool)

(assert (=> b!1402302 (= e!794066 e!794067)))

(declare-fun res!940804 () Bool)

(assert (=> b!1402302 (=> res!940804 e!794067)))

(assert (=> b!1402302 (= res!940804 (or (bvslt (x!126372 lt!617574) #b00000000000000000000000000000000) (bvsgt (x!126372 lt!617574) #b01111111111111111111111111111110) (bvslt (x!126372 lt!617583) #b00000000000000000000000000000000) (bvsgt (x!126372 lt!617583) #b01111111111111111111111111111110) (bvslt lt!617575 #b00000000000000000000000000000000) (bvsge lt!617575 (size!46826 a!2901)) (bvslt (index!44751 lt!617574) #b00000000000000000000000000000000) (bvsge (index!44751 lt!617574) (size!46826 a!2901)) (bvslt (index!44751 lt!617583) #b00000000000000000000000000000000) (bvsge (index!44751 lt!617583) (size!46826 a!2901)) (not (= lt!617574 (Intermediate!10593 false (index!44751 lt!617574) (x!126372 lt!617574)))) (not (= lt!617583 (Intermediate!10593 false (index!44751 lt!617583) (x!126372 lt!617583))))))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95851 (_ BitVec 32)) SeekEntryResult!10593)

(assert (=> b!1402302 (= lt!617582 (seekKeyOrZeroReturnVacant!0 (x!126372 lt!617583) (index!44751 lt!617583) (index!44751 lt!617583) (select (arr!46276 a!2901) j!112) lt!617576 mask!2840))))

(assert (=> b!1402302 (= lt!617582 (seekEntryOrOpen!0 lt!617577 lt!617576 mask!2840))))

(assert (=> b!1402302 (and (not (undefined!11405 lt!617583)) (= (index!44751 lt!617583) i!1037) (bvslt (x!126372 lt!617583) (x!126372 lt!617574)) (= (select (store (arr!46276 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44751 lt!617583)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!617579 () Unit!47190)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95851 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47190)

(assert (=> b!1402302 (= lt!617579 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617575 (x!126372 lt!617574) (index!44751 lt!617574) (x!126372 lt!617583) (index!44751 lt!617583) (undefined!11405 lt!617583) mask!2840))))

(assert (= (and start!120442 res!940809) b!1402294))

(assert (= (and b!1402294 res!940806) b!1402299))

(assert (= (and b!1402299 res!940805) b!1402301))

(assert (= (and b!1402301 res!940807) b!1402300))

(assert (= (and b!1402300 res!940812) b!1402296))

(assert (= (and b!1402296 res!940811) b!1402297))

(assert (= (and b!1402297 (not res!940808)) b!1402293))

(assert (= (and b!1402293 (not res!940810)) b!1402302))

(assert (= (and b!1402302 (not res!940804)) b!1402295))

(assert (= (and b!1402295 (not res!940813)) b!1402298))

(declare-fun m!1290377 () Bool)

(assert (=> start!120442 m!1290377))

(declare-fun m!1290379 () Bool)

(assert (=> start!120442 m!1290379))

(declare-fun m!1290381 () Bool)

(assert (=> b!1402299 m!1290381))

(assert (=> b!1402299 m!1290381))

(declare-fun m!1290383 () Bool)

(assert (=> b!1402299 m!1290383))

(declare-fun m!1290385 () Bool)

(assert (=> b!1402300 m!1290385))

(declare-fun m!1290387 () Bool)

(assert (=> b!1402297 m!1290387))

(declare-fun m!1290389 () Bool)

(assert (=> b!1402297 m!1290389))

(assert (=> b!1402297 m!1290387))

(assert (=> b!1402297 m!1290387))

(declare-fun m!1290391 () Bool)

(assert (=> b!1402297 m!1290391))

(declare-fun m!1290393 () Bool)

(assert (=> b!1402297 m!1290393))

(assert (=> b!1402297 m!1290387))

(declare-fun m!1290395 () Bool)

(assert (=> b!1402297 m!1290395))

(declare-fun m!1290397 () Bool)

(assert (=> b!1402297 m!1290397))

(declare-fun m!1290399 () Bool)

(assert (=> b!1402295 m!1290399))

(assert (=> b!1402301 m!1290387))

(assert (=> b!1402301 m!1290387))

(declare-fun m!1290401 () Bool)

(assert (=> b!1402301 m!1290401))

(declare-fun m!1290403 () Bool)

(assert (=> b!1402293 m!1290403))

(assert (=> b!1402293 m!1290403))

(declare-fun m!1290405 () Bool)

(assert (=> b!1402293 m!1290405))

(declare-fun m!1290407 () Bool)

(assert (=> b!1402293 m!1290407))

(declare-fun m!1290409 () Bool)

(assert (=> b!1402293 m!1290409))

(declare-fun m!1290411 () Bool)

(assert (=> b!1402298 m!1290411))

(declare-fun m!1290413 () Bool)

(assert (=> b!1402302 m!1290413))

(declare-fun m!1290415 () Bool)

(assert (=> b!1402302 m!1290415))

(declare-fun m!1290417 () Bool)

(assert (=> b!1402302 m!1290417))

(assert (=> b!1402302 m!1290407))

(assert (=> b!1402302 m!1290387))

(declare-fun m!1290419 () Bool)

(assert (=> b!1402302 m!1290419))

(assert (=> b!1402302 m!1290387))

(declare-fun m!1290421 () Bool)

(assert (=> b!1402296 m!1290421))

(push 1)

