; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!121154 () Bool)

(assert start!121154)

(declare-fun b!1408694 () Bool)

(declare-fun res!946418 () Bool)

(declare-fun e!797225 () Bool)

(assert (=> b!1408694 (=> (not res!946418) (not e!797225))))

(declare-datatypes ((array!96308 0))(
  ( (array!96309 (arr!46497 (Array (_ BitVec 32) (_ BitVec 64))) (size!47047 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!96308)

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96308 (_ BitVec 32)) Bool)

(assert (=> b!1408694 (= res!946418 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1408695 () Bool)

(declare-fun e!797223 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10808 0))(
  ( (MissingZero!10808 (index!45609 (_ BitVec 32))) (Found!10808 (index!45610 (_ BitVec 32))) (Intermediate!10808 (undefined!11620 Bool) (index!45611 (_ BitVec 32)) (x!127209 (_ BitVec 32))) (Undefined!10808) (MissingVacant!10808 (index!45612 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!96308 (_ BitVec 32)) SeekEntryResult!10808)

(assert (=> b!1408695 (= e!797223 (= (seekEntryOrOpen!0 (select (arr!46497 a!2901) j!112) a!2901 mask!2840) (Found!10808 j!112)))))

(declare-fun b!1408696 () Bool)

(declare-fun e!797224 () Bool)

(assert (=> b!1408696 (= e!797225 (not e!797224))))

(declare-fun res!946417 () Bool)

(assert (=> b!1408696 (=> res!946417 e!797224)))

(declare-fun lt!620445 () SeekEntryResult!10808)

(get-info :version)

(assert (=> b!1408696 (= res!946417 (or (not ((_ is Intermediate!10808) lt!620445)) (undefined!11620 lt!620445)))))

(assert (=> b!1408696 e!797223))

(declare-fun res!946422 () Bool)

(assert (=> b!1408696 (=> (not res!946422) (not e!797223))))

(assert (=> b!1408696 (= res!946422 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-datatypes ((Unit!47590 0))(
  ( (Unit!47591) )
))
(declare-fun lt!620444 () Unit!47590)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!96308 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!47590)

(assert (=> b!1408696 (= lt!620444 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!96308 (_ BitVec 32)) SeekEntryResult!10808)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1408696 (= lt!620445 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!46497 a!2901) j!112) mask!2840) (select (arr!46497 a!2901) j!112) a!2901 mask!2840))))

(declare-fun b!1408697 () Bool)

(declare-fun res!946421 () Bool)

(assert (=> b!1408697 (=> (not res!946421) (not e!797225))))

(declare-fun i!1037 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1408697 (= res!946421 (validKeyInArray!0 (select (arr!46497 a!2901) i!1037)))))

(declare-fun b!1408698 () Bool)

(declare-fun res!946419 () Bool)

(assert (=> b!1408698 (=> (not res!946419) (not e!797225))))

(assert (=> b!1408698 (= res!946419 (validKeyInArray!0 (select (arr!46497 a!2901) j!112)))))

(declare-fun res!946420 () Bool)

(assert (=> start!121154 (=> (not res!946420) (not e!797225))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!121154 (= res!946420 (validMask!0 mask!2840))))

(assert (=> start!121154 e!797225))

(assert (=> start!121154 true))

(declare-fun array_inv!35525 (array!96308) Bool)

(assert (=> start!121154 (array_inv!35525 a!2901)))

(declare-fun b!1408699 () Bool)

(assert (=> b!1408699 (= e!797224 true)))

(declare-fun lt!620443 () SeekEntryResult!10808)

(assert (=> b!1408699 (= lt!620443 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (store (arr!46497 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) mask!2840) (select (store (arr!46497 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112) (array!96309 (store (arr!46497 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!47047 a!2901)) mask!2840))))

(declare-fun b!1408700 () Bool)

(declare-fun res!946416 () Bool)

(assert (=> b!1408700 (=> (not res!946416) (not e!797225))))

(assert (=> b!1408700 (= res!946416 (and (= (size!47047 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!47047 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!47047 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1408701 () Bool)

(declare-fun res!946423 () Bool)

(assert (=> b!1408701 (=> (not res!946423) (not e!797225))))

(declare-datatypes ((List!33016 0))(
  ( (Nil!33013) (Cons!33012 (h!34275 (_ BitVec 64)) (t!47710 List!33016)) )
))
(declare-fun arrayNoDuplicates!0 (array!96308 (_ BitVec 32) List!33016) Bool)

(assert (=> b!1408701 (= res!946423 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!33013))))

(assert (= (and start!121154 res!946420) b!1408700))

(assert (= (and b!1408700 res!946416) b!1408697))

(assert (= (and b!1408697 res!946421) b!1408698))

(assert (= (and b!1408698 res!946419) b!1408694))

(assert (= (and b!1408694 res!946418) b!1408701))

(assert (= (and b!1408701 res!946423) b!1408696))

(assert (= (and b!1408696 res!946422) b!1408695))

(assert (= (and b!1408696 (not res!946417)) b!1408699))

(declare-fun m!1298101 () Bool)

(assert (=> b!1408696 m!1298101))

(declare-fun m!1298103 () Bool)

(assert (=> b!1408696 m!1298103))

(assert (=> b!1408696 m!1298101))

(declare-fun m!1298105 () Bool)

(assert (=> b!1408696 m!1298105))

(assert (=> b!1408696 m!1298103))

(assert (=> b!1408696 m!1298101))

(declare-fun m!1298107 () Bool)

(assert (=> b!1408696 m!1298107))

(declare-fun m!1298109 () Bool)

(assert (=> b!1408696 m!1298109))

(declare-fun m!1298111 () Bool)

(assert (=> b!1408699 m!1298111))

(declare-fun m!1298113 () Bool)

(assert (=> b!1408699 m!1298113))

(assert (=> b!1408699 m!1298113))

(declare-fun m!1298115 () Bool)

(assert (=> b!1408699 m!1298115))

(assert (=> b!1408699 m!1298115))

(assert (=> b!1408699 m!1298113))

(declare-fun m!1298117 () Bool)

(assert (=> b!1408699 m!1298117))

(declare-fun m!1298119 () Bool)

(assert (=> b!1408701 m!1298119))

(assert (=> b!1408695 m!1298101))

(assert (=> b!1408695 m!1298101))

(declare-fun m!1298121 () Bool)

(assert (=> b!1408695 m!1298121))

(declare-fun m!1298123 () Bool)

(assert (=> start!121154 m!1298123))

(declare-fun m!1298125 () Bool)

(assert (=> start!121154 m!1298125))

(declare-fun m!1298127 () Bool)

(assert (=> b!1408694 m!1298127))

(declare-fun m!1298129 () Bool)

(assert (=> b!1408697 m!1298129))

(assert (=> b!1408697 m!1298129))

(declare-fun m!1298131 () Bool)

(assert (=> b!1408697 m!1298131))

(assert (=> b!1408698 m!1298101))

(assert (=> b!1408698 m!1298101))

(declare-fun m!1298133 () Bool)

(assert (=> b!1408698 m!1298133))

(check-sat (not b!1408699) (not b!1408698) (not start!121154) (not b!1408694) (not b!1408701) (not b!1408695) (not b!1408697) (not b!1408696))
