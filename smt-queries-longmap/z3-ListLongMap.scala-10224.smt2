; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120398 () Bool)

(assert start!120398)

(declare-fun b!1401575 () Bool)

(declare-fun e!793621 () Bool)

(assert (=> b!1401575 (= e!793621 true)))

(declare-datatypes ((array!95807 0))(
  ( (array!95808 (arr!46254 (Array (_ BitVec 32) (_ BitVec 64))) (size!46804 (_ BitVec 32))) )
))
(declare-fun lt!617031 () array!95807)

(declare-fun lt!617033 () (_ BitVec 32))

(declare-fun lt!617036 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!10571 0))(
  ( (MissingZero!10571 (index!44661 (_ BitVec 32))) (Found!10571 (index!44662 (_ BitVec 32))) (Intermediate!10571 (undefined!11383 Bool) (index!44663 (_ BitVec 32)) (x!126294 (_ BitVec 32))) (Undefined!10571) (MissingVacant!10571 (index!44664 (_ BitVec 32))) )
))
(declare-fun lt!617032 () SeekEntryResult!10571)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95807 (_ BitVec 32)) SeekEntryResult!10571)

(assert (=> b!1401575 (= lt!617032 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617033 lt!617036 lt!617031 mask!2840))))

(declare-fun b!1401576 () Bool)

(declare-fun e!793624 () Bool)

(declare-fun e!793619 () Bool)

(assert (=> b!1401576 (= e!793624 (not e!793619))))

(declare-fun res!940090 () Bool)

(assert (=> b!1401576 (=> res!940090 e!793619)))

(declare-fun lt!617037 () SeekEntryResult!10571)

(get-info :version)

(assert (=> b!1401576 (= res!940090 (or (not ((_ is Intermediate!10571) lt!617037)) (undefined!11383 lt!617037)))))

(declare-fun e!793622 () Bool)

(assert (=> b!1401576 e!793622))

(declare-fun res!940094 () Bool)

(assert (=> b!1401576 (=> (not res!940094) (not e!793622))))

(declare-fun a!2901 () array!95807)

(declare-fun j!112 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95807 (_ BitVec 32)) Bool)

(assert (=> b!1401576 (= res!940094 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47146 0))(
  ( (Unit!47147) )
))
(declare-fun lt!617030 () Unit!47146)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47146)

(assert (=> b!1401576 (= lt!617030 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401576 (= lt!617037 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!617033 (select (arr!46254 a!2901) j!112) a!2901 mask!2840))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401576 (= lt!617033 (toIndex!0 (select (arr!46254 a!2901) j!112) mask!2840))))

(declare-fun b!1401577 () Bool)

(declare-fun e!793620 () Bool)

(assert (=> b!1401577 (= e!793620 e!793621)))

(declare-fun res!940092 () Bool)

(assert (=> b!1401577 (=> res!940092 e!793621)))

(declare-fun lt!617035 () SeekEntryResult!10571)

(assert (=> b!1401577 (= res!940092 (or (bvslt (x!126294 lt!617037) #b00000000000000000000000000000000) (bvsgt (x!126294 lt!617037) #b01111111111111111111111111111110) (bvslt (x!126294 lt!617035) #b00000000000000000000000000000000) (bvsgt (x!126294 lt!617035) #b01111111111111111111111111111110) (bvslt lt!617033 #b00000000000000000000000000000000) (bvsge lt!617033 (size!46804 a!2901)) (bvslt (index!44663 lt!617037) #b00000000000000000000000000000000) (bvsge (index!44663 lt!617037) (size!46804 a!2901)) (bvslt (index!44663 lt!617035) #b00000000000000000000000000000000) (bvsge (index!44663 lt!617035) (size!46804 a!2901)) (not (= lt!617037 (Intermediate!10571 false (index!44663 lt!617037) (x!126294 lt!617037)))) (not (= lt!617035 (Intermediate!10571 false (index!44663 lt!617035) (x!126294 lt!617035))))))))

(declare-fun e!793625 () Bool)

(assert (=> b!1401577 e!793625))

(declare-fun res!940093 () Bool)

(assert (=> b!1401577 (=> (not res!940093) (not e!793625))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401577 (= res!940093 (and (not (undefined!11383 lt!617035)) (= (index!44663 lt!617035) i!1037) (bvslt (x!126294 lt!617035) (x!126294 lt!617037)) (= (select (store (arr!46254 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44663 lt!617035)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!617034 () Unit!47146)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47146)

(assert (=> b!1401577 (= lt!617034 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!617033 (x!126294 lt!617037) (index!44663 lt!617037) (x!126294 lt!617035) (index!44663 lt!617035) (undefined!11383 lt!617035) mask!2840))))

(declare-fun b!1401578 () Bool)

(declare-fun res!940095 () Bool)

(assert (=> b!1401578 (=> (not res!940095) (not e!793624))))

(assert (=> b!1401578 (= res!940095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun res!940087 () Bool)

(assert (=> start!120398 (=> (not res!940087) (not e!793624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120398 (= res!940087 (validMask!0 mask!2840))))

(assert (=> start!120398 e!793624))

(assert (=> start!120398 true))

(declare-fun array_inv!35282 (array!95807) Bool)

(assert (=> start!120398 (array_inv!35282 a!2901)))

(declare-fun b!1401579 () Bool)

(declare-fun res!940088 () Bool)

(assert (=> b!1401579 (=> (not res!940088) (not e!793624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401579 (= res!940088 (validKeyInArray!0 (select (arr!46254 a!2901) j!112)))))

(declare-fun b!1401580 () Bool)

(declare-fun res!940086 () Bool)

(assert (=> b!1401580 (=> (not res!940086) (not e!793624))))

(declare-datatypes ((List!32773 0))(
  ( (Nil!32770) (Cons!32769 (h!34017 (_ BitVec 64)) (t!47467 List!32773)) )
))
(declare-fun arrayNoDuplicates!0 (array!95807 (_ BitVec 32) List!32773) Bool)

(assert (=> b!1401580 (= res!940086 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32770))))

(declare-fun b!1401581 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95807 (_ BitVec 32)) SeekEntryResult!10571)

(assert (=> b!1401581 (= e!793622 (= (seekEntryOrOpen!0 (select (arr!46254 a!2901) j!112) a!2901 mask!2840) (Found!10571 j!112)))))

(declare-fun b!1401582 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95807 (_ BitVec 32)) SeekEntryResult!10571)

(assert (=> b!1401582 (= e!793625 (= (seekEntryOrOpen!0 lt!617036 lt!617031 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126294 lt!617035) (index!44663 lt!617035) (index!44663 lt!617035) (select (arr!46254 a!2901) j!112) lt!617031 mask!2840)))))

(declare-fun b!1401583 () Bool)

(declare-fun res!940091 () Bool)

(assert (=> b!1401583 (=> (not res!940091) (not e!793624))))

(assert (=> b!1401583 (= res!940091 (and (= (size!46804 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46804 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46804 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401584 () Bool)

(declare-fun res!940089 () Bool)

(assert (=> b!1401584 (=> (not res!940089) (not e!793624))))

(assert (=> b!1401584 (= res!940089 (validKeyInArray!0 (select (arr!46254 a!2901) i!1037)))))

(declare-fun b!1401585 () Bool)

(assert (=> b!1401585 (= e!793619 e!793620)))

(declare-fun res!940096 () Bool)

(assert (=> b!1401585 (=> res!940096 e!793620)))

(assert (=> b!1401585 (= res!940096 (or (= lt!617037 lt!617035) (not ((_ is Intermediate!10571) lt!617035))))))

(assert (=> b!1401585 (= lt!617035 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!617036 mask!2840) lt!617036 lt!617031 mask!2840))))

(assert (=> b!1401585 (= lt!617036 (select (store (arr!46254 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401585 (= lt!617031 (array!95808 (store (arr!46254 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46804 a!2901)))))

(assert (= (and start!120398 res!940087) b!1401583))

(assert (= (and b!1401583 res!940091) b!1401584))

(assert (= (and b!1401584 res!940089) b!1401579))

(assert (= (and b!1401579 res!940088) b!1401578))

(assert (= (and b!1401578 res!940095) b!1401580))

(assert (= (and b!1401580 res!940086) b!1401576))

(assert (= (and b!1401576 res!940094) b!1401581))

(assert (= (and b!1401576 (not res!940090)) b!1401585))

(assert (= (and b!1401585 (not res!940096)) b!1401577))

(assert (= (and b!1401577 res!940093) b!1401582))

(assert (= (and b!1401577 (not res!940092)) b!1401575))

(declare-fun m!1289405 () Bool)

(assert (=> b!1401576 m!1289405))

(declare-fun m!1289407 () Bool)

(assert (=> b!1401576 m!1289407))

(assert (=> b!1401576 m!1289405))

(assert (=> b!1401576 m!1289405))

(declare-fun m!1289409 () Bool)

(assert (=> b!1401576 m!1289409))

(declare-fun m!1289411 () Bool)

(assert (=> b!1401576 m!1289411))

(declare-fun m!1289413 () Bool)

(assert (=> b!1401576 m!1289413))

(declare-fun m!1289415 () Bool)

(assert (=> b!1401582 m!1289415))

(assert (=> b!1401582 m!1289405))

(assert (=> b!1401582 m!1289405))

(declare-fun m!1289417 () Bool)

(assert (=> b!1401582 m!1289417))

(declare-fun m!1289419 () Bool)

(assert (=> b!1401580 m!1289419))

(assert (=> b!1401579 m!1289405))

(assert (=> b!1401579 m!1289405))

(declare-fun m!1289421 () Bool)

(assert (=> b!1401579 m!1289421))

(declare-fun m!1289423 () Bool)

(assert (=> b!1401577 m!1289423))

(declare-fun m!1289425 () Bool)

(assert (=> b!1401577 m!1289425))

(declare-fun m!1289427 () Bool)

(assert (=> b!1401577 m!1289427))

(declare-fun m!1289429 () Bool)

(assert (=> b!1401585 m!1289429))

(assert (=> b!1401585 m!1289429))

(declare-fun m!1289431 () Bool)

(assert (=> b!1401585 m!1289431))

(assert (=> b!1401585 m!1289423))

(declare-fun m!1289433 () Bool)

(assert (=> b!1401585 m!1289433))

(declare-fun m!1289435 () Bool)

(assert (=> b!1401575 m!1289435))

(assert (=> b!1401581 m!1289405))

(assert (=> b!1401581 m!1289405))

(declare-fun m!1289437 () Bool)

(assert (=> b!1401581 m!1289437))

(declare-fun m!1289439 () Bool)

(assert (=> start!120398 m!1289439))

(declare-fun m!1289441 () Bool)

(assert (=> start!120398 m!1289441))

(declare-fun m!1289443 () Bool)

(assert (=> b!1401584 m!1289443))

(assert (=> b!1401584 m!1289443))

(declare-fun m!1289445 () Bool)

(assert (=> b!1401584 m!1289445))

(declare-fun m!1289447 () Bool)

(assert (=> b!1401578 m!1289447))

(check-sat (not b!1401577) (not b!1401584) (not start!120398) (not b!1401578) (not b!1401582) (not b!1401579) (not b!1401585) (not b!1401581) (not b!1401580) (not b!1401576) (not b!1401575))
(check-sat)
