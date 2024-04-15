; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!120386 () Bool)

(assert start!120386)

(declare-fun res!939929 () Bool)

(declare-fun e!793502 () Bool)

(assert (=> start!120386 (=> (not res!939929) (not e!793502))))

(declare-fun mask!2840 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!120386 (= res!939929 (validMask!0 mask!2840))))

(assert (=> start!120386 e!793502))

(assert (=> start!120386 true))

(declare-datatypes ((array!95748 0))(
  ( (array!95749 (arr!46225 (Array (_ BitVec 32) (_ BitVec 64))) (size!46777 (_ BitVec 32))) )
))
(declare-fun a!2901 () array!95748)

(declare-fun array_inv!35458 (array!95748) Bool)

(assert (=> start!120386 (array_inv!35458 a!2901)))

(declare-fun b!1401362 () Bool)

(declare-fun e!793496 () Bool)

(declare-fun j!112 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!10568 0))(
  ( (MissingZero!10568 (index!44649 (_ BitVec 32))) (Found!10568 (index!44650 (_ BitVec 32))) (Intermediate!10568 (undefined!11380 Bool) (index!44651 (_ BitVec 32)) (x!126280 (_ BitVec 32))) (Undefined!10568) (MissingVacant!10568 (index!44652 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!95748 (_ BitVec 32)) SeekEntryResult!10568)

(assert (=> b!1401362 (= e!793496 (= (seekEntryOrOpen!0 (select (arr!46225 a!2901) j!112) a!2901 mask!2840) (Found!10568 j!112)))))

(declare-fun b!1401363 () Bool)

(declare-fun e!793499 () Bool)

(assert (=> b!1401363 (= e!793499 true)))

(declare-fun lt!616745 () (_ BitVec 64))

(declare-fun lt!616747 () (_ BitVec 32))

(declare-fun lt!616751 () SeekEntryResult!10568)

(declare-fun lt!616749 () array!95748)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95748 (_ BitVec 32)) SeekEntryResult!10568)

(assert (=> b!1401363 (= lt!616751 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616747 lt!616745 lt!616749 mask!2840))))

(declare-fun b!1401364 () Bool)

(declare-fun res!939931 () Bool)

(assert (=> b!1401364 (=> (not res!939931) (not e!793502))))

(declare-fun i!1037 () (_ BitVec 32))

(assert (=> b!1401364 (= res!939931 (and (= (size!46777 a!2901) (bvadd #b00000000000000000000000000000001 mask!2840)) (bvsge i!1037 #b00000000000000000000000000000000) (bvslt i!1037 (size!46777 a!2901)) (bvsge j!112 #b00000000000000000000000000000000) (bvslt j!112 (size!46777 a!2901)) (not (= i!1037 j!112))))))

(declare-fun b!1401365 () Bool)

(declare-fun e!793501 () Bool)

(assert (=> b!1401365 (= e!793501 e!793499)))

(declare-fun res!939934 () Bool)

(assert (=> b!1401365 (=> res!939934 e!793499)))

(declare-fun lt!616748 () SeekEntryResult!10568)

(declare-fun lt!616744 () SeekEntryResult!10568)

(assert (=> b!1401365 (= res!939934 (or (bvslt (x!126280 lt!616748) #b00000000000000000000000000000000) (bvsgt (x!126280 lt!616748) #b01111111111111111111111111111110) (bvslt (x!126280 lt!616744) #b00000000000000000000000000000000) (bvsgt (x!126280 lt!616744) #b01111111111111111111111111111110) (bvslt lt!616747 #b00000000000000000000000000000000) (bvsge lt!616747 (size!46777 a!2901)) (bvslt (index!44651 lt!616748) #b00000000000000000000000000000000) (bvsge (index!44651 lt!616748) (size!46777 a!2901)) (bvslt (index!44651 lt!616744) #b00000000000000000000000000000000) (bvsge (index!44651 lt!616744) (size!46777 a!2901)) (not (= lt!616748 (Intermediate!10568 false (index!44651 lt!616748) (x!126280 lt!616748)))) (not (= lt!616744 (Intermediate!10568 false (index!44651 lt!616744) (x!126280 lt!616744))))))))

(declare-fun e!793497 () Bool)

(assert (=> b!1401365 e!793497))

(declare-fun res!939927 () Bool)

(assert (=> b!1401365 (=> (not res!939927) (not e!793497))))

(assert (=> b!1401365 (= res!939927 (and (not (undefined!11380 lt!616744)) (= (index!44651 lt!616744) i!1037) (bvslt (x!126280 lt!616744) (x!126280 lt!616748)) (= (select (store (arr!46225 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (index!44651 lt!616744)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((Unit!46983 0))(
  ( (Unit!46984) )
))
(declare-fun lt!616746 () Unit!46983)

(declare-fun lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 (array!95748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) Bool (_ BitVec 32)) Unit!46983)

(assert (=> b!1401365 (= lt!616746 (lemmaPutLongMinValueIntermediateNotSameThenNewIsSmallerXAndAtI!0 a!2901 i!1037 j!112 #b00000000000000000000000000000000 lt!616747 (x!126280 lt!616748) (index!44651 lt!616748) (x!126280 lt!616744) (index!44651 lt!616744) (undefined!11380 lt!616744) mask!2840))))

(declare-fun b!1401366 () Bool)

(declare-fun e!793500 () Bool)

(assert (=> b!1401366 (= e!793500 e!793501)))

(declare-fun res!939932 () Bool)

(assert (=> b!1401366 (=> res!939932 e!793501)))

(get-info :version)

(assert (=> b!1401366 (= res!939932 (or (= lt!616748 lt!616744) (not ((_ is Intermediate!10568) lt!616744))))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1401366 (= lt!616744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!616745 mask!2840) lt!616745 lt!616749 mask!2840))))

(assert (=> b!1401366 (= lt!616745 (select (store (arr!46225 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) j!112))))

(assert (=> b!1401366 (= lt!616749 (array!95749 (store (arr!46225 a!2901) i!1037 #b1000000000000000000000000000000000000000000000000000000000000000) (size!46777 a!2901)))))

(declare-fun b!1401367 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!95748 (_ BitVec 32)) SeekEntryResult!10568)

(assert (=> b!1401367 (= e!793497 (= (seekEntryOrOpen!0 lt!616745 lt!616749 mask!2840) (seekKeyOrZeroReturnVacant!0 (x!126280 lt!616744) (index!44651 lt!616744) (index!44651 lt!616744) (select (arr!46225 a!2901) j!112) lt!616749 mask!2840)))))

(declare-fun b!1401368 () Bool)

(declare-fun res!939926 () Bool)

(assert (=> b!1401368 (=> (not res!939926) (not e!793502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!95748 (_ BitVec 32)) Bool)

(assert (=> b!1401368 (= res!939926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2901 mask!2840))))

(declare-fun b!1401369 () Bool)

(assert (=> b!1401369 (= e!793502 (not e!793500))))

(declare-fun res!939933 () Bool)

(assert (=> b!1401369 (=> res!939933 e!793500)))

(assert (=> b!1401369 (= res!939933 (or (not ((_ is Intermediate!10568) lt!616748)) (undefined!11380 lt!616748)))))

(assert (=> b!1401369 e!793496))

(declare-fun res!939930 () Bool)

(assert (=> b!1401369 (=> (not res!939930) (not e!793496))))

(assert (=> b!1401369 (= res!939930 (arrayForallSeekEntryOrOpenFound!0 j!112 a!2901 mask!2840))))

(declare-fun lt!616750 () Unit!46983)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!95748 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!46983)

(assert (=> b!1401369 (= lt!616750 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!2901 mask!2840 #b00000000000000000000000000000000 j!112))))

(assert (=> b!1401369 (= lt!616748 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!616747 (select (arr!46225 a!2901) j!112) a!2901 mask!2840))))

(assert (=> b!1401369 (= lt!616747 (toIndex!0 (select (arr!46225 a!2901) j!112) mask!2840))))

(declare-fun b!1401370 () Bool)

(declare-fun res!939924 () Bool)

(assert (=> b!1401370 (=> (not res!939924) (not e!793502))))

(declare-datatypes ((List!32822 0))(
  ( (Nil!32819) (Cons!32818 (h!34066 (_ BitVec 64)) (t!47508 List!32822)) )
))
(declare-fun arrayNoDuplicates!0 (array!95748 (_ BitVec 32) List!32822) Bool)

(assert (=> b!1401370 (= res!939924 (arrayNoDuplicates!0 a!2901 #b00000000000000000000000000000000 Nil!32819))))

(declare-fun b!1401371 () Bool)

(declare-fun res!939925 () Bool)

(assert (=> b!1401371 (=> (not res!939925) (not e!793502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1401371 (= res!939925 (validKeyInArray!0 (select (arr!46225 a!2901) i!1037)))))

(declare-fun b!1401372 () Bool)

(declare-fun res!939928 () Bool)

(assert (=> b!1401372 (=> (not res!939928) (not e!793502))))

(assert (=> b!1401372 (= res!939928 (validKeyInArray!0 (select (arr!46225 a!2901) j!112)))))

(assert (= (and start!120386 res!939929) b!1401364))

(assert (= (and b!1401364 res!939931) b!1401371))

(assert (= (and b!1401371 res!939925) b!1401372))

(assert (= (and b!1401372 res!939928) b!1401368))

(assert (= (and b!1401368 res!939926) b!1401370))

(assert (= (and b!1401370 res!939924) b!1401369))

(assert (= (and b!1401369 res!939930) b!1401362))

(assert (= (and b!1401369 (not res!939933)) b!1401366))

(assert (= (and b!1401366 (not res!939932)) b!1401365))

(assert (= (and b!1401365 res!939927) b!1401367))

(assert (= (and b!1401365 (not res!939934)) b!1401363))

(declare-fun m!1288693 () Bool)

(assert (=> b!1401369 m!1288693))

(declare-fun m!1288695 () Bool)

(assert (=> b!1401369 m!1288695))

(assert (=> b!1401369 m!1288693))

(assert (=> b!1401369 m!1288693))

(declare-fun m!1288697 () Bool)

(assert (=> b!1401369 m!1288697))

(declare-fun m!1288699 () Bool)

(assert (=> b!1401369 m!1288699))

(declare-fun m!1288701 () Bool)

(assert (=> b!1401369 m!1288701))

(assert (=> b!1401372 m!1288693))

(assert (=> b!1401372 m!1288693))

(declare-fun m!1288703 () Bool)

(assert (=> b!1401372 m!1288703))

(declare-fun m!1288705 () Bool)

(assert (=> b!1401370 m!1288705))

(assert (=> b!1401362 m!1288693))

(assert (=> b!1401362 m!1288693))

(declare-fun m!1288707 () Bool)

(assert (=> b!1401362 m!1288707))

(declare-fun m!1288709 () Bool)

(assert (=> b!1401368 m!1288709))

(declare-fun m!1288711 () Bool)

(assert (=> b!1401366 m!1288711))

(assert (=> b!1401366 m!1288711))

(declare-fun m!1288713 () Bool)

(assert (=> b!1401366 m!1288713))

(declare-fun m!1288715 () Bool)

(assert (=> b!1401366 m!1288715))

(declare-fun m!1288717 () Bool)

(assert (=> b!1401366 m!1288717))

(declare-fun m!1288719 () Bool)

(assert (=> b!1401371 m!1288719))

(assert (=> b!1401371 m!1288719))

(declare-fun m!1288721 () Bool)

(assert (=> b!1401371 m!1288721))

(declare-fun m!1288723 () Bool)

(assert (=> b!1401363 m!1288723))

(assert (=> b!1401365 m!1288715))

(declare-fun m!1288725 () Bool)

(assert (=> b!1401365 m!1288725))

(declare-fun m!1288727 () Bool)

(assert (=> b!1401365 m!1288727))

(declare-fun m!1288729 () Bool)

(assert (=> start!120386 m!1288729))

(declare-fun m!1288731 () Bool)

(assert (=> start!120386 m!1288731))

(declare-fun m!1288733 () Bool)

(assert (=> b!1401367 m!1288733))

(assert (=> b!1401367 m!1288693))

(assert (=> b!1401367 m!1288693))

(declare-fun m!1288735 () Bool)

(assert (=> b!1401367 m!1288735))

(check-sat (not b!1401369) (not b!1401363) (not b!1401362) (not b!1401366) (not b!1401365) (not b!1401372) (not b!1401368) (not b!1401367) (not b!1401371) (not b!1401370) (not start!120386))
(check-sat)
