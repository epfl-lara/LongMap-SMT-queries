; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120352 () Bool)

(assert start!120352)

(declare-fun b!1400816 () Bool)

(declare-fun e!793139 () Bool)

(declare-fun e!793138 () Bool)

(assert (=> b!1400816 (= e!793139 e!793138)))

(declare-fun res!939336 () Bool)

(assert (=> b!1400816 (=> res!939336 e!793138)))

(declare-datatypes ((SeekEntryResult!10548 0))(
  ( (MissingZero!10548 (index!44569 (_ BitVec 32))) (Found!10548 (index!44570 (_ BitVec 32))) (Intermediate!10548 (undefined!11360 Bool) (index!44571 (_ BitVec 32)) (x!126207 (_ BitVec 32))) (Undefined!10548) (MissingVacant!10548 (index!44572 (_ BitVec 32))) )
))
(declare-fun lt!616483 () SeekEntryResult!10548)

(declare-fun lt!616481 () SeekEntryResult!10548)

(assert (=> b!1400816 (= res!939336 (or (= lt!616483 lt!616481) (not (is-Intermediate!10548 lt!616481))))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!95761 0))(
  ( (array!95762 (arr!46231 (Array (_ BitVec 32) (_ BitVec 64))) (size!46781 (_ BitVec 32))) )
))
(declare-fun lt!616484 () array!95761)

(declare-fun lt!616482 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95761 (_ BitVec 32)) SeekEntryResult!10548)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1400816 (= lt!616481 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616482 mask!2840) lt!616482 lt!616484 mask!2840))))

(declare-fun a!2901 () array!95761)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1400816 (= lt!616482 (select (store (arr!46231 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1400816 (= lt!616484 (array!95762 (store (arr!46231 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46781 a!2901)))))

(declare-fun b!1400817 () Bool)

(declare-fun res!939332 () Bool)

(declare-fun e!793136 () Bool)

(assert (=> b!1400817 (=> (not res!939332) (not e!793136))))

(declare-datatypes ((List!32750 0))(
  ( (Nil!32747) (Cons!32746 (h!33994 (_ BitVec 64)) (t!47444 List!32750)) )
))
(declare-fun arrayNoDuplicates!0 (array!95761 (_ BitVec 32) List!32750) Bool)

(assert (=> b!1400817 (= res!939332 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32747))))

(declare-fun res!939334 () Bool)

(assert (=> start!120352 (=> (not res!939334) (not e!793136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120352 (= res!939334 (validMask!0 mask!2840))))

(assert (=> start!120352 e!793136))

(assert (=> start!120352 true))

(declare-fun array_inv!35259 (array!95761) Bool)

(assert (=> start!120352 (array_inv!35259 a!2901)))

(declare-fun b!1400818 () Bool)

(declare-fun e!793137 () Bool)

(assert (=> b!1400818 (= e!793138 e!793137)))

(declare-fun res!939335 () Bool)

(assert (=> b!1400818 (=> res!939335 e!793137)))

(declare-fun lt!616479 () (_ BitVec 32))

(assert (=> b!1400818 (= res!939335 (or (bvslt (x!126207 lt!616483) #b00000000000000000000000000000000) (bvsgt (x!126207 lt!616483) #b01111111111111111111111111111110) (bvslt (x!126207 lt!616481) #b00000000000000000000000000000000) (bvsgt (x!126207 lt!616481) #b01111111111111111111111111111110) (bvslt lt!616479 #b00000000000000000000000000000000) (bvsge lt!616479 (size!46781 a!2901)) (bvslt (index!44571 lt!616483) #b00000000000000000000000000000000) (bvsge (index!44571 lt!616483) (size!46781 a!2901)) (bvslt (index!44571 lt!616481) #b00000000000000000000000000000000) (bvsge (index!44571 lt!616481) (size!46781 a!2901)) (not (= lt!616483 (Intermediate!10548 false (index!44571 lt!616483) (x!126207 lt!616483)))) (not (= lt!616481 (Intermediate!10548 false (index!44571 lt!616481) (x!126207 lt!616481))))))))

(declare-fun e!793142 () Bool)

(assert (=> b!1400818 e!793142))

(declare-fun res!939333 () Bool)

(assert (=> b!1400818 (=> (not res!939333) (not e!793142))))

(assert (=> b!1400818 (= res!939333 (and (not (undefined!11360 lt!616481)) (= (index!44571 lt!616481) i!1037) (bvslt (x!126207 lt!616481) (x!126207 lt!616483)) (= (select (store (arr!46231 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44571 lt!616481)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!47100 0))(
  ( (Unit!47101) )
))
(declare-fun lt!616480 () Unit!47100)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47100)

(assert (=> b!1400818 (= lt!616480 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616479 (x!126207 lt!616483) (index!44571 lt!616483) (x!126207 lt!616481) (index!44571 lt!616481) (undefined!11360 lt!616481) mask!2840))))

(declare-fun b!1400819 () Bool)

(assert (=> b!1400819 (= e!793136 (not e!793139))))

(declare-fun res!939328 () Bool)

(assert (=> b!1400819 (=> res!939328 e!793139)))

(assert (=> b!1400819 (= res!939328 (or (not (is-Intermediate!10548 lt!616483)) (undefined!11360 lt!616483)))))

(declare-fun e!793141 () Bool)

(assert (=> b!1400819 e!793141))

(declare-fun res!939337 () Bool)

(assert (=> b!1400819 (=> (not res!939337) (not e!793141))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95761 (_ BitVec 32)) Bool)

(assert (=> b!1400819 (= res!939337 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616485 () Unit!47100)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95761 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47100)

(assert (=> b!1400819 (= lt!616485 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1400819 (= lt!616483 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616479 (select (arr!46231 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1400819 (= lt!616479 (toIndex!0 (select (arr!46231 a!2901) j!112) mask!2840))))

(declare-fun b!1400820 () Bool)

(declare-fun res!939327 () Bool)

(assert (=> b!1400820 (=> (not res!939327) (not e!793136))))

(assert (=> b!1400820 (= res!939327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1400821 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95761 (_ BitVec 32)) SeekEntryResult!10548)

(assert (=> b!1400821 (= e!793141 (= (seekEntryOrOpen!0 (select (arr!46231 a!2901) j!112) a!2901 mask!2840) (Found!10548 j!112)))))

(declare-fun b!1400822 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95761 (_ BitVec 32)) SeekEntryResult!10548)

(assert (=> b!1400822 (= e!793142 (= (seekEntryOrOpen!0 lt!616482 lt!616484 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126207 lt!616481) (index!44571 lt!616481) (index!44571 lt!616481) (select (arr!46231 a!2901) j!112) lt!616484 mask!2840)))))

(declare-fun b!1400823 () Bool)

(declare-fun res!939330 () Bool)

(assert (=> b!1400823 (=> (not res!939330) (not e!793136))))

(assert (=> b!1400823 (= res!939330 (and (= (size!46781 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46781 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46781 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1400824 () Bool)

(assert (=> b!1400824 (= e!793137 true)))

(declare-fun lt!616478 () SeekEntryResult!10548)

(assert (=> b!1400824 (= lt!616478 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616479 lt!616482 lt!616484 mask!2840))))

(declare-fun b!1400825 () Bool)

(declare-fun res!939331 () Bool)

(assert (=> b!1400825 (=> (not res!939331) (not e!793136))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1400825 (= res!939331 (validKeyInArray!0 (select (arr!46231 a!2901) i!1037)))))

(declare-fun b!1400826 () Bool)

(declare-fun res!939329 () Bool)

(assert (=> b!1400826 (=> (not res!939329) (not e!793136))))

(assert (=> b!1400826 (= res!939329 (validKeyInArray!0 (select (arr!46231 a!2901) j!112)))))

(assert (= (and start!120352 res!939334) b!1400823))

(assert (= (and b!1400823 res!939330) b!1400825))

(assert (= (and b!1400825 res!939331) b!1400826))

(assert (= (and b!1400826 res!939329) b!1400820))

(assert (= (and b!1400820 res!939327) b!1400817))

(assert (= (and b!1400817 res!939332) b!1400819))

(assert (= (and b!1400819 res!939337) b!1400821))

(assert (= (and b!1400819 (not res!939328)) b!1400816))

(assert (= (and b!1400816 (not res!939336)) b!1400818))

(assert (= (and b!1400818 res!939333) b!1400822))

(assert (= (and b!1400818 (not res!939335)) b!1400824))

(declare-fun m!1288393 () Bool)

(assert (=> b!1400820 m!1288393))

(declare-fun m!1288395 () Bool)

(assert (=> b!1400819 m!1288395))

(declare-fun m!1288397 () Bool)

(assert (=> b!1400819 m!1288397))

(assert (=> b!1400819 m!1288395))

(declare-fun m!1288399 () Bool)

(assert (=> b!1400819 m!1288399))

(assert (=> b!1400819 m!1288395))

(declare-fun m!1288401 () Bool)

(assert (=> b!1400819 m!1288401))

(declare-fun m!1288403 () Bool)

(assert (=> b!1400819 m!1288403))

(assert (=> b!1400826 m!1288395))

(assert (=> b!1400826 m!1288395))

(declare-fun m!1288405 () Bool)

(assert (=> b!1400826 m!1288405))

(declare-fun m!1288407 () Bool)

(assert (=> b!1400824 m!1288407))

(declare-fun m!1288409 () Bool)

(assert (=> b!1400817 m!1288409))

(assert (=> b!1400821 m!1288395))

(assert (=> b!1400821 m!1288395))

(declare-fun m!1288411 () Bool)

(assert (=> b!1400821 m!1288411))

(declare-fun m!1288413 () Bool)

(assert (=> start!120352 m!1288413))

(declare-fun m!1288415 () Bool)

(assert (=> start!120352 m!1288415))

(declare-fun m!1288417 () Bool)

(assert (=> b!1400822 m!1288417))

(assert (=> b!1400822 m!1288395))

(assert (=> b!1400822 m!1288395))

(declare-fun m!1288419 () Bool)

(assert (=> b!1400822 m!1288419))

(declare-fun m!1288421 () Bool)

(assert (=> b!1400816 m!1288421))

(assert (=> b!1400816 m!1288421))

(declare-fun m!1288423 () Bool)

(assert (=> b!1400816 m!1288423))

(declare-fun m!1288425 () Bool)

(assert (=> b!1400816 m!1288425))

(declare-fun m!1288427 () Bool)

(assert (=> b!1400816 m!1288427))

(assert (=> b!1400818 m!1288425))

(declare-fun m!1288429 () Bool)

(assert (=> b!1400818 m!1288429))

(declare-fun m!1288431 () Bool)

(assert (=> b!1400818 m!1288431))

(declare-fun m!1288433 () Bool)

(assert (=> b!1400825 m!1288433))

(assert (=> b!1400825 m!1288433))

(declare-fun m!1288435 () Bool)

(assert (=> b!1400825 m!1288435))

(push 1)

