; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!120384 () Bool)

(assert start!120384)

(declare-fun b!1401344 () Bool)

(declare-fun res!939855 () Bool)

(declare-fun e!793474 () Bool)

(assert (=> b!1401344 (=> (not res!939855) (not e!793474))))

(declare-datatypes ((array!95793 0))(
  ( (array!95794 (arr!46247 (Array (_ BitVec 32) (_ BitVec 64))) (size!46797 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95793)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95793 (_ BitVec 32)) Bool)

(assert (=> b!1401344 (= res!939855 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401345 () Bool)

(declare-fun e!793476 () Bool)

(declare-fun e!793478 () Bool)

(assert (=> b!1401345 (= e!793476 e!793478)))

(declare-fun res!939862 () Bool)

(assert (=> b!1401345 (=> res!939862 e!793478)))

(declare-fun lt!616866 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10564 0))(
  ( (MissingZero!10564 (index!44633 (_ BitVec 32))) (Found!10564 (index!44634 (_ BitVec 32))) (Intermediate!10564 (undefined!11376 Bool) (index!44635 (_ BitVec 32)) (x!126271 (_ BitVec 32))) (Undefined!10564) (MissingVacant!10564 (index!44636 (_ BitVec 32))) )
))
(declare-fun lt!616867 () SeekEntryResult!10564)

(declare-fun lt!616868 () SeekEntryResult!10564)

(assert (=> b!1401345 (= res!939862 (or (bvslt (x!126271 lt!616867) #b00000000000000000000000000000000) (bvsgt (x!126271 lt!616867) #b01111111111111111111111111111110) (bvslt (x!126271 lt!616868) #b00000000000000000000000000000000) (bvsgt (x!126271 lt!616868) #b01111111111111111111111111111110) (bvslt lt!616866 #b00000000000000000000000000000000) (bvsge lt!616866 (size!46797 a!2901)) (bvslt (index!44635 lt!616867) #b00000000000000000000000000000000) (bvsge (index!44635 lt!616867) (size!46797 a!2901)) (bvslt (index!44635 lt!616868) #b00000000000000000000000000000000) (bvsge (index!44635 lt!616868) (size!46797 a!2901)) (not (= lt!616867 (Intermediate!10564 false (index!44635 lt!616867) (x!126271 lt!616867)))) (not (= lt!616868 (Intermediate!10564 false (index!44635 lt!616868) (x!126271 lt!616868))))))))

(declare-fun e!793477 () Bool)

(assert (=> b!1401345 e!793477))

(declare-fun res!939859 () Bool)

(assert (=> b!1401345 (=> (not res!939859) (not e!793477))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401345 (= res!939859 (and (not (undefined!11376 lt!616868)) (= (index!44635 lt!616868) i!1037) (bvslt (x!126271 lt!616868) (x!126271 lt!616867)) (= (select (store (arr!46247 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44635 lt!616868)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((Unit!47132 0))(
  ( (Unit!47133) )
))
(declare-fun lt!616863 () Unit!47132)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47132)

(assert (=> b!1401345 (= lt!616863 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616866 (x!126271 lt!616867) (index!44635 lt!616867) (x!126271 lt!616868) (index!44635 lt!616868) (undefined!11376 lt!616868) mask!2840))))

(declare-fun e!793473 () Bool)

(declare-fun b!1401346 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95793 (_ BitVec 32)) SeekEntryResult!10564)

(assert (=> b!1401346 (= e!793473 (= (seekEntryOrOpen!0 (select (arr!46247 a!2901) j!112) a!2901 mask!2840) (Found!10564 j!112)))))

(declare-fun b!1401347 () Bool)

(declare-fun e!793472 () Bool)

(assert (=> b!1401347 (= e!793472 e!793476)))

(declare-fun res!939864 () Bool)

(assert (=> b!1401347 (=> res!939864 e!793476)))

(assert (=> b!1401347 (= res!939864 (or (= lt!616867 lt!616868) (not (is-Intermediate!10564 lt!616868))))))

(declare-fun lt!616864 () (_ BitVec 64))

(declare-fun lt!616865 () array!95793)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95793 (_ BitVec 32)) SeekEntryResult!10564)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401347 (= lt!616868 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616864 mask!2840) lt!616864 lt!616865 mask!2840))))

(assert (=> b!1401347 (= lt!616864 (select (store (arr!46247 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401347 (= lt!616865 (array!95794 (store (arr!46247 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46797 a!2901)))))

(declare-fun b!1401348 () Bool)

(assert (=> b!1401348 (= e!793478 true)))

(declare-fun lt!616862 () SeekEntryResult!10564)

(assert (=> b!1401348 (= lt!616862 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616866 lt!616864 lt!616865 mask!2840))))

(declare-fun b!1401350 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95793 (_ BitVec 32)) SeekEntryResult!10564)

(assert (=> b!1401350 (= e!793477 (= (seekEntryOrOpen!0 lt!616864 lt!616865 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126271 lt!616868) (index!44635 lt!616868) (index!44635 lt!616868) (select (arr!46247 a!2901) j!112) lt!616865 mask!2840)))))

(declare-fun b!1401351 () Bool)

(declare-fun res!939858 () Bool)

(assert (=> b!1401351 (=> (not res!939858) (not e!793474))))

(declare-datatypes ((List!32766 0))(
  ( (Nil!32763) (Cons!32762 (h!34010 (_ BitVec 64)) (t!47460 List!32766)) )
))
(declare-fun arrayNoDuplicates!0 (array!95793 (_ BitVec 32) List!32766) Bool)

(assert (=> b!1401351 (= res!939858 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32763))))

(declare-fun b!1401352 () Bool)

(declare-fun res!939865 () Bool)

(assert (=> b!1401352 (=> (not res!939865) (not e!793474))))

(assert (=> b!1401352 (= res!939865 (and (= (size!46797 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46797 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46797 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401349 () Bool)

(declare-fun res!939857 () Bool)

(assert (=> b!1401349 (=> (not res!939857) (not e!793474))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401349 (= res!939857 (validKeyInArray!0 (select (arr!46247 a!2901) j!112)))))

(declare-fun res!939856 () Bool)

(assert (=> start!120384 (=> (not res!939856) (not e!793474))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120384 (= res!939856 (validMask!0 mask!2840))))

(assert (=> start!120384 e!793474))

(assert (=> start!120384 true))

(declare-fun array_inv!35275 (array!95793) Bool)

(assert (=> start!120384 (array_inv!35275 a!2901)))

(declare-fun b!1401353 () Bool)

(declare-fun res!939863 () Bool)

(assert (=> b!1401353 (=> (not res!939863) (not e!793474))))

(assert (=> b!1401353 (= res!939863 (validKeyInArray!0 (select (arr!46247 a!2901) i!1037)))))

(declare-fun b!1401354 () Bool)

(assert (=> b!1401354 (= e!793474 (not e!793472))))

(declare-fun res!939861 () Bool)

(assert (=> b!1401354 (=> res!939861 e!793472)))

(assert (=> b!1401354 (= res!939861 (or (not (is-Intermediate!10564 lt!616867)) (undefined!11376 lt!616867)))))

(assert (=> b!1401354 e!793473))

(declare-fun res!939860 () Bool)

(assert (=> b!1401354 (=> (not res!939860) (not e!793473))))

(assert (=> b!1401354 (= res!939860 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616869 () Unit!47132)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95793 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47132)

(assert (=> b!1401354 (= lt!616869 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401354 (= lt!616867 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616866 (select (arr!46247 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401354 (= lt!616866 (toIndex!0 (select (arr!46247 a!2901) j!112) mask!2840))))

(assert (= (and start!120384 res!939856) b!1401352))

(assert (= (and b!1401352 res!939865) b!1401353))

(assert (= (and b!1401353 res!939863) b!1401349))

(assert (= (and b!1401349 res!939857) b!1401344))

(assert (= (and b!1401344 res!939855) b!1401351))

(assert (= (and b!1401351 res!939858) b!1401354))

(assert (= (and b!1401354 res!939860) b!1401346))

(assert (= (and b!1401354 (not res!939861)) b!1401347))

(assert (= (and b!1401347 (not res!939864)) b!1401345))

(assert (= (and b!1401345 res!939859) b!1401350))

(assert (= (and b!1401345 (not res!939862)) b!1401348))

(declare-fun m!1289097 () Bool)

(assert (=> b!1401347 m!1289097))

(assert (=> b!1401347 m!1289097))

(declare-fun m!1289099 () Bool)

(assert (=> b!1401347 m!1289099))

(declare-fun m!1289101 () Bool)

(assert (=> b!1401347 m!1289101))

(declare-fun m!1289103 () Bool)

(assert (=> b!1401347 m!1289103))

(declare-fun m!1289105 () Bool)

(assert (=> b!1401354 m!1289105))

(declare-fun m!1289107 () Bool)

(assert (=> b!1401354 m!1289107))

(assert (=> b!1401354 m!1289105))

(assert (=> b!1401354 m!1289105))

(declare-fun m!1289109 () Bool)

(assert (=> b!1401354 m!1289109))

(declare-fun m!1289111 () Bool)

(assert (=> b!1401354 m!1289111))

(declare-fun m!1289113 () Bool)

(assert (=> b!1401354 m!1289113))

(declare-fun m!1289115 () Bool)

(assert (=> b!1401348 m!1289115))

(declare-fun m!1289117 () Bool)

(assert (=> b!1401353 m!1289117))

(assert (=> b!1401353 m!1289117))

(declare-fun m!1289119 () Bool)

(assert (=> b!1401353 m!1289119))

(declare-fun m!1289121 () Bool)

(assert (=> b!1401350 m!1289121))

(assert (=> b!1401350 m!1289105))

(assert (=> b!1401350 m!1289105))

(declare-fun m!1289123 () Bool)

(assert (=> b!1401350 m!1289123))

(declare-fun m!1289125 () Bool)

(assert (=> b!1401351 m!1289125))

(assert (=> b!1401346 m!1289105))

(assert (=> b!1401346 m!1289105))

(declare-fun m!1289127 () Bool)

(assert (=> b!1401346 m!1289127))

(declare-fun m!1289129 () Bool)

(assert (=> b!1401344 m!1289129))

(assert (=> b!1401349 m!1289105))

(assert (=> b!1401349 m!1289105))

(declare-fun m!1289131 () Bool)

(assert (=> b!1401349 m!1289131))

(declare-fun m!1289133 () Bool)

(assert (=> start!120384 m!1289133))

(declare-fun m!1289135 () Bool)

(assert (=> start!120384 m!1289135))

(assert (=> b!1401345 m!1289101))

(declare-fun m!1289137 () Bool)

(assert (=> b!1401345 m!1289137))

(declare-fun m!1289139 () Bool)

(assert (=> b!1401345 m!1289139))

(push 1)

