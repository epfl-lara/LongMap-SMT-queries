; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121286 () Bool)

(assert start!121286)

(declare-fun b!1409119 () Bool)

(declare-fun res!946163 () Bool)

(declare-fun e!797624 () Bool)

(assert (=> b!1409119 (=> (not res!946163) (not e!797624))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-datatypes ((array!96362 0))(
  ( (array!96363 (arr!46522 (Array (_ BitVec 32) (_ BitVec 64))) (size!47073 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96362)

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun j!112 () (_ BitVec 32))

(assert (=> b!1409119 (= res!946163 (and (= (size!47073 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47073 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47073 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1409120 () Bool)

(declare-fun res!946161 () Bool)

(assert (=> b!1409120 (=> (not res!946161) (not e!797624))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1409120 (= res!946161 (validKeyInArray!0 (select (arr!46522 a!2901) j!112)))))

(declare-fun b!1409121 () Bool)

(declare-fun e!797625 () Bool)

(declare-fun e!797626 () Bool)

(assert (=> b!1409121 (= e!797625 e!797626)))

(declare-fun res!946157 () Bool)

(assert (=> b!1409121 (=> res!946157 e!797626)))

(declare-datatypes ((SeekEntryResult!10736 0))(
  ( (MissingZero!10736 (index!45321 (_ BitVec 32))) (Found!10736 (index!45322 (_ BitVec 32))) (Intermediate!10736 (undefined!11548 Bool) (index!45323 (_ BitVec 32)) (x!127084 (_ BitVec 32))) (Undefined!10736) (MissingVacant!10736 (index!45324 (_ BitVec 32))) )
))
(declare-fun lt!620420 () SeekEntryResult!10736)

(declare-fun lt!620419 () (_ BitVec 64))

(declare-fun lt!620422 () array!96362)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96362 (_ BitVec 32)) SeekEntryResult!10736)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1409121 (= res!946157 (not (= lt!620420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!620419 mask!2840) lt!620419 lt!620422 mask!2840))))))

(assert (=> b!1409121 (= lt!620419 (select (store (arr!46522 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1409121 (= lt!620422 (array!96363 (store (arr!46522 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47073 a!2901)))))

(declare-fun res!946164 () Bool)

(assert (=> start!121286 (=> (not res!946164) (not e!797624))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121286 (= res!946164 (validMask!0 mask!2840))))

(assert (=> start!121286 e!797624))

(assert (=> start!121286 true))

(declare-fun array_inv!35803 (array!96362) Bool)

(assert (=> start!121286 (array_inv!35803 a!2901)))

(declare-fun b!1409122 () Bool)

(declare-fun res!946162 () Bool)

(assert (=> b!1409122 (=> res!946162 e!797626)))

(declare-fun lt!620423 () (_ BitVec 32))

(assert (=> b!1409122 (= res!946162 (or (bvslt (x!127084 lt!620420) #b00000000000000000000000000000000) (bvsgt (x!127084 lt!620420) #b01111111111111111111111111111110) (bvslt lt!620423 #b00000000000000000000000000000000) (bvsge lt!620423 (size!47073 a!2901)) (bvslt (index!45323 lt!620420) #b00000000000000000000000000000000) (bvsge (index!45323 lt!620420) (size!47073 a!2901)) (not (= lt!620420 (Intermediate!10736 false (index!45323 lt!620420) (x!127084 lt!620420))))))))

(declare-fun b!1409123 () Bool)

(assert (=> b!1409123 (= e!797624 (not e!797625))))

(declare-fun res!946158 () Bool)

(assert (=> b!1409123 (=> res!946158 e!797625)))

(get-info :version)

(assert (=> b!1409123 (= res!946158 (or (not ((_ is Intermediate!10736) lt!620420)) (undefined!11548 lt!620420)))))

(declare-fun lt!620418 () SeekEntryResult!10736)

(assert (=> b!1409123 (= lt!620418 (Found!10736 j!112))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96362 (_ BitVec 32)) SeekEntryResult!10736)

(assert (=> b!1409123 (= lt!620418 (seekEntryOrOpen!0 (select (arr!46522 a!2901) j!112) a!2901 mask!2840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96362 (_ BitVec 32)) Bool)

(assert (=> b!1409123 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840)))

(declare-datatypes ((Unit!47473 0))(
  ( (Unit!47474) )
))
(declare-fun lt!620421 () Unit!47473)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47473)

(assert (=> b!1409123 (= lt!620421 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1409123 (= lt!620420 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!620423 (select (arr!46522 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1409123 (= lt!620423 (toIndex!0 (select (arr!46522 a!2901) j!112) mask!2840))))

(declare-fun b!1409124 () Bool)

(declare-fun res!946159 () Bool)

(assert (=> b!1409124 (=> (not res!946159) (not e!797624))))

(assert (=> b!1409124 (= res!946159 (validKeyInArray!0 (select (arr!46522 a!2901) i!1037)))))

(declare-fun b!1409125 () Bool)

(assert (=> b!1409125 (= e!797626 true)))

(assert (=> b!1409125 (= lt!620418 (seekEntryOrOpen!0 lt!620419 lt!620422 mask!2840))))

(declare-fun lt!620417 () Unit!47473)

(declare-fun lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 (array!96362 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47473)

(assert (=> b!1409125 (= lt!620417 (lemmaPutLongMinValuePreservesForallSeekEntryOrOpenKey1!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!620423 (x!127084 lt!620420) (index!45323 lt!620420) mask!2840))))

(declare-fun b!1409126 () Bool)

(declare-fun res!946165 () Bool)

(assert (=> b!1409126 (=> (not res!946165) (not e!797624))))

(declare-datatypes ((List!33028 0))(
  ( (Nil!33025) (Cons!33024 (h!34295 (_ BitVec 64)) (t!47714 List!33028)) )
))
(declare-fun arrayNoDuplicates!0 (array!96362 (_ BitVec 32) List!33028) Bool)

(assert (=> b!1409126 (= res!946165 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33025))))

(declare-fun b!1409127 () Bool)

(declare-fun res!946160 () Bool)

(assert (=> b!1409127 (=> (not res!946160) (not e!797624))))

(assert (=> b!1409127 (= res!946160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(assert (= (and start!121286 res!946164) b!1409119))

(assert (= (and b!1409119 res!946163) b!1409124))

(assert (= (and b!1409124 res!946159) b!1409120))

(assert (= (and b!1409120 res!946161) b!1409127))

(assert (= (and b!1409127 res!946160) b!1409126))

(assert (= (and b!1409126 res!946165) b!1409123))

(assert (= (and b!1409123 (not res!946158)) b!1409121))

(assert (= (and b!1409121 (not res!946157)) b!1409122))

(assert (= (and b!1409122 (not res!946162)) b!1409125))

(declare-fun m!1298461 () Bool)

(assert (=> b!1409120 m!1298461))

(assert (=> b!1409120 m!1298461))

(declare-fun m!1298463 () Bool)

(assert (=> b!1409120 m!1298463))

(declare-fun m!1298465 () Bool)

(assert (=> b!1409126 m!1298465))

(declare-fun m!1298467 () Bool)

(assert (=> b!1409121 m!1298467))

(assert (=> b!1409121 m!1298467))

(declare-fun m!1298469 () Bool)

(assert (=> b!1409121 m!1298469))

(declare-fun m!1298471 () Bool)

(assert (=> b!1409121 m!1298471))

(declare-fun m!1298473 () Bool)

(assert (=> b!1409121 m!1298473))

(declare-fun m!1298475 () Bool)

(assert (=> b!1409125 m!1298475))

(declare-fun m!1298477 () Bool)

(assert (=> b!1409125 m!1298477))

(declare-fun m!1298479 () Bool)

(assert (=> b!1409124 m!1298479))

(assert (=> b!1409124 m!1298479))

(declare-fun m!1298481 () Bool)

(assert (=> b!1409124 m!1298481))

(declare-fun m!1298483 () Bool)

(assert (=> b!1409127 m!1298483))

(declare-fun m!1298485 () Bool)

(assert (=> start!121286 m!1298485))

(declare-fun m!1298487 () Bool)

(assert (=> start!121286 m!1298487))

(assert (=> b!1409123 m!1298461))

(declare-fun m!1298489 () Bool)

(assert (=> b!1409123 m!1298489))

(assert (=> b!1409123 m!1298461))

(assert (=> b!1409123 m!1298461))

(declare-fun m!1298491 () Bool)

(assert (=> b!1409123 m!1298491))

(declare-fun m!1298493 () Bool)

(assert (=> b!1409123 m!1298493))

(assert (=> b!1409123 m!1298461))

(declare-fun m!1298495 () Bool)

(assert (=> b!1409123 m!1298495))

(declare-fun m!1298497 () Bool)

(assert (=> b!1409123 m!1298497))

(check-sat (not start!121286) (not b!1409121) (not b!1409120) (not b!1409125) (not b!1409124) (not b!1409123) (not b!1409127) (not b!1409126))
(check-sat)
