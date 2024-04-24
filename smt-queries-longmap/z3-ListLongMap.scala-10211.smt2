; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120506 () Bool)

(assert start!120506)

(declare-fun b!1401395 () Bool)

(declare-fun e!793523 () Bool)

(declare-fun e!793518 () Bool)

(assert (=> b!1401395 (= e!793523 e!793518)))

(declare-fun res!939222 () Bool)

(assert (=> b!1401395 (=> res!939222 e!793518)))

(declare-fun lt!616468 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10487 0))(
  ( (MissingZero!10487 (index!44325 (_ BitVec 32))) (Found!10487 (index!44326 (_ BitVec 32))) (Intermediate!10487 (undefined!11299 Bool) (index!44327 (_ BitVec 32)) (x!126125 (_ BitVec 32))) (Undefined!10487) (MissingVacant!10487 (index!44328 (_ BitVec 32))) )
))
(declare-fun lt!616469 () SeekEntryResult!10487)

(declare-datatypes ((array!95837 0))(
  ( (array!95838 (arr!46267 (Array (_ BitVec 32) (_ BitVec 64))) (size!46818 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95837)

(declare-fun lt!616474 () SeekEntryResult!10487)

(assert (=> b!1401395 (= res!939222 (or (bvslt (x!126125 lt!616474) #b00000000000000000000000000000000) (bvsgt (x!126125 lt!616474) #b01111111111111111111111111111110) (bvslt (x!126125 lt!616469) #b00000000000000000000000000000000) (bvsgt (x!126125 lt!616469) #b01111111111111111111111111111110) (bvslt lt!616468 #b00000000000000000000000000000000) (bvsge lt!616468 (size!46818 a!2901)) (bvslt (index!44327 lt!616474) #b00000000000000000000000000000000) (bvsge (index!44327 lt!616474) (size!46818 a!2901)) (bvslt (index!44327 lt!616469) #b00000000000000000000000000000000) (bvsge (index!44327 lt!616469) (size!46818 a!2901)) (not (= lt!616474 (Intermediate!10487 false (index!44327 lt!616474) (x!126125 lt!616474)))) (not (= lt!616469 (Intermediate!10487 false (index!44327 lt!616469) (x!126125 lt!616469))))))))

(declare-fun e!793522 () Bool)

(assert (=> b!1401395 e!793522))

(declare-fun res!939228 () Bool)

(assert (=> b!1401395 (=> (not res!939228) (not e!793522))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401395 (= res!939228 (and (not (undefined!11299 lt!616469)) (= (index!44327 lt!616469) i!1037) (bvslt (x!126125 lt!616469) (x!126125 lt!616474)) (= (select (store (arr!46267 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44327 lt!616469)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun j!112 () (_ BitVec 32))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((Unit!47005 0))(
  ( (Unit!47006) )
))
(declare-fun lt!616475 () Unit!47005)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!47005)

(assert (=> b!1401395 (= lt!616475 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616468 (x!126125 lt!616474) (index!44327 lt!616474) (x!126125 lt!616469) (index!44327 lt!616469) (undefined!11299 lt!616469) mask!2840))))

(declare-fun b!1401397 () Bool)

(declare-fun e!793521 () Bool)

(assert (=> b!1401397 (= e!793521 e!793523)))

(declare-fun res!939230 () Bool)

(assert (=> b!1401397 (=> res!939230 e!793523)))

(get-info :version)

(assert (=> b!1401397 (= res!939230 (or (= lt!616474 lt!616469) (not ((_ is Intermediate!10487) lt!616469))))))

(declare-fun lt!616471 () array!95837)

(declare-fun lt!616472 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95837 (_ BitVec 32)) SeekEntryResult!10487)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401397 (= lt!616469 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616472 mask!2840) lt!616472 lt!616471 mask!2840))))

(assert (=> b!1401397 (= lt!616472 (select (store (arr!46267 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401397 (= lt!616471 (array!95838 (store (arr!46267 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46818 a!2901)))))

(declare-fun b!1401398 () Bool)

(declare-fun res!939231 () Bool)

(declare-fun e!793517 () Bool)

(assert (=> b!1401398 (=> (not res!939231) (not e!793517))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401398 (= res!939231 (validKeyInArray!0 (select (arr!46267 a!2901) i!1037)))))

(declare-fun b!1401399 () Bool)

(declare-fun res!939232 () Bool)

(assert (=> b!1401399 (=> (not res!939232) (not e!793517))))

(assert (=> b!1401399 (= res!939232 (validKeyInArray!0 (select (arr!46267 a!2901) j!112)))))

(declare-fun b!1401400 () Bool)

(declare-fun res!939226 () Bool)

(assert (=> b!1401400 (=> (not res!939226) (not e!793517))))

(assert (=> b!1401400 (= res!939226 (and (= (size!46818 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46818 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46818 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401401 () Bool)

(assert (=> b!1401401 (= e!793518 true)))

(declare-fun lt!616470 () SeekEntryResult!10487)

(assert (=> b!1401401 (= lt!616470 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616468 lt!616472 lt!616471 mask!2840))))

(declare-fun b!1401402 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95837 (_ BitVec 32)) SeekEntryResult!10487)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95837 (_ BitVec 32)) SeekEntryResult!10487)

(assert (=> b!1401402 (= e!793522 (= (seekEntryOrOpen!0 lt!616472 lt!616471 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126125 lt!616469) (index!44327 lt!616469) (index!44327 lt!616469) (select (arr!46267 a!2901) j!112) lt!616471 mask!2840)))))

(declare-fun b!1401403 () Bool)

(declare-fun res!939229 () Bool)

(assert (=> b!1401403 (=> (not res!939229) (not e!793517))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95837 (_ BitVec 32)) Bool)

(assert (=> b!1401403 (= res!939229 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401404 () Bool)

(declare-fun res!939225 () Bool)

(assert (=> b!1401404 (=> (not res!939225) (not e!793517))))

(declare-datatypes ((List!32773 0))(
  ( (Nil!32770) (Cons!32769 (h!34025 (_ BitVec 64)) (t!47459 List!32773)) )
))
(declare-fun arrayNoDuplicates!0 (array!95837 (_ BitVec 32) List!32773) Bool)

(assert (=> b!1401404 (= res!939225 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32770))))

(declare-fun b!1401405 () Bool)

(assert (=> b!1401405 (= e!793517 (not e!793521))))

(declare-fun res!939223 () Bool)

(assert (=> b!1401405 (=> res!939223 e!793521)))

(assert (=> b!1401405 (= res!939223 (or (not ((_ is Intermediate!10487) lt!616474)) (undefined!11299 lt!616474)))))

(declare-fun e!793519 () Bool)

(assert (=> b!1401405 e!793519))

(declare-fun res!939227 () Bool)

(assert (=> b!1401405 (=> (not res!939227) (not e!793519))))

(assert (=> b!1401405 (= res!939227 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616473 () Unit!47005)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95837 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47005)

(assert (=> b!1401405 (= lt!616473 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401405 (= lt!616474 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616468 (select (arr!46267 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401405 (= lt!616468 (toIndex!0 (select (arr!46267 a!2901) j!112) mask!2840))))

(declare-fun b!1401396 () Bool)

(assert (=> b!1401396 (= e!793519 (= (seekEntryOrOpen!0 (select (arr!46267 a!2901) j!112) a!2901 mask!2840) (Found!10487 j!112)))))

(declare-fun res!939224 () Bool)

(assert (=> start!120506 (=> (not res!939224) (not e!793517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120506 (= res!939224 (validMask!0 mask!2840))))

(assert (=> start!120506 e!793517))

(assert (=> start!120506 true))

(declare-fun array_inv!35548 (array!95837) Bool)

(assert (=> start!120506 (array_inv!35548 a!2901)))

(assert (= (and start!120506 res!939224) b!1401400))

(assert (= (and b!1401400 res!939226) b!1401398))

(assert (= (and b!1401398 res!939231) b!1401399))

(assert (= (and b!1401399 res!939232) b!1401403))

(assert (= (and b!1401403 res!939229) b!1401404))

(assert (= (and b!1401404 res!939225) b!1401405))

(assert (= (and b!1401405 res!939227) b!1401396))

(assert (= (and b!1401405 (not res!939223)) b!1401397))

(assert (= (and b!1401397 (not res!939230)) b!1401395))

(assert (= (and b!1401395 res!939228) b!1401402))

(assert (= (and b!1401395 (not res!939222)) b!1401401))

(declare-fun m!1289017 () Bool)

(assert (=> b!1401405 m!1289017))

(declare-fun m!1289019 () Bool)

(assert (=> b!1401405 m!1289019))

(assert (=> b!1401405 m!1289017))

(declare-fun m!1289021 () Bool)

(assert (=> b!1401405 m!1289021))

(assert (=> b!1401405 m!1289017))

(declare-fun m!1289023 () Bool)

(assert (=> b!1401405 m!1289023))

(declare-fun m!1289025 () Bool)

(assert (=> b!1401405 m!1289025))

(assert (=> b!1401396 m!1289017))

(assert (=> b!1401396 m!1289017))

(declare-fun m!1289027 () Bool)

(assert (=> b!1401396 m!1289027))

(declare-fun m!1289029 () Bool)

(assert (=> b!1401403 m!1289029))

(declare-fun m!1289031 () Bool)

(assert (=> b!1401397 m!1289031))

(assert (=> b!1401397 m!1289031))

(declare-fun m!1289033 () Bool)

(assert (=> b!1401397 m!1289033))

(declare-fun m!1289035 () Bool)

(assert (=> b!1401397 m!1289035))

(declare-fun m!1289037 () Bool)

(assert (=> b!1401397 m!1289037))

(assert (=> b!1401399 m!1289017))

(assert (=> b!1401399 m!1289017))

(declare-fun m!1289039 () Bool)

(assert (=> b!1401399 m!1289039))

(declare-fun m!1289041 () Bool)

(assert (=> b!1401398 m!1289041))

(assert (=> b!1401398 m!1289041))

(declare-fun m!1289043 () Bool)

(assert (=> b!1401398 m!1289043))

(assert (=> b!1401395 m!1289035))

(declare-fun m!1289045 () Bool)

(assert (=> b!1401395 m!1289045))

(declare-fun m!1289047 () Bool)

(assert (=> b!1401395 m!1289047))

(declare-fun m!1289049 () Bool)

(assert (=> start!120506 m!1289049))

(declare-fun m!1289051 () Bool)

(assert (=> start!120506 m!1289051))

(declare-fun m!1289053 () Bool)

(assert (=> b!1401401 m!1289053))

(declare-fun m!1289055 () Bool)

(assert (=> b!1401402 m!1289055))

(assert (=> b!1401402 m!1289017))

(assert (=> b!1401402 m!1289017))

(declare-fun m!1289057 () Bool)

(assert (=> b!1401402 m!1289057))

(declare-fun m!1289059 () Bool)

(assert (=> b!1401404 m!1289059))

(check-sat (not b!1401405) (not b!1401402) (not b!1401404) (not b!1401396) (not b!1401399) (not b!1401398) (not b!1401397) (not b!1401401) (not b!1401395) (not start!120506) (not b!1401403))
(check-sat)
