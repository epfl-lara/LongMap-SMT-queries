; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51524 () Bool)

(assert start!51524)

(declare-fun b!563616 () Bool)

(declare-fun res!354910 () Bool)

(declare-fun e!324711 () Bool)

(assert (=> b!563616 (=> (not res!354910) (not e!324711))))

(declare-datatypes ((array!35398 0))(
  ( (array!35399 (arr!17000 (Array (_ BitVec 32) (_ BitVec 64))) (size!17365 (_ BitVec 32))) )
))
(declare-fun a!3118 () array!35398)

(declare-fun mask!3119 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!35398 (_ BitVec 32)) Bool)

(assert (=> b!563616 (= res!354910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3118 mask!3119))))

(declare-fun res!354916 () Bool)

(declare-fun e!324714 () Bool)

(assert (=> start!51524 (=> (not res!354916) (not e!324714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!51524 (= res!354916 (validMask!0 mask!3119))))

(assert (=> start!51524 e!324714))

(assert (=> start!51524 true))

(declare-fun array_inv!12883 (array!35398) Bool)

(assert (=> start!51524 (array_inv!12883 a!3118)))

(declare-fun b!563617 () Bool)

(assert (=> b!563617 (= e!324714 e!324711)))

(declare-fun res!354917 () Bool)

(assert (=> b!563617 (=> (not res!354917) (not e!324711))))

(declare-datatypes ((SeekEntryResult!5446 0))(
  ( (MissingZero!5446 (index!24011 (_ BitVec 32))) (Found!5446 (index!24012 (_ BitVec 32))) (Intermediate!5446 (undefined!6258 Bool) (index!24013 (_ BitVec 32)) (x!52904 (_ BitVec 32))) (Undefined!5446) (MissingVacant!5446 (index!24014 (_ BitVec 32))) )
))
(declare-fun lt!257133 () SeekEntryResult!5446)

(declare-fun i!1132 () (_ BitVec 32))

(assert (=> b!563617 (= res!354917 (or (= lt!257133 (MissingZero!5446 i!1132)) (= lt!257133 (MissingVacant!5446 i!1132))))))

(declare-fun k0!1914 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!35398 (_ BitVec 32)) SeekEntryResult!5446)

(assert (=> b!563617 (= lt!257133 (seekEntryOrOpen!0 k0!1914 a!3118 mask!3119))))

(declare-fun b!563618 () Bool)

(declare-fun e!324713 () Bool)

(assert (=> b!563618 (= e!324711 e!324713)))

(declare-fun res!354915 () Bool)

(assert (=> b!563618 (=> (not res!354915) (not e!324713))))

(declare-fun j!142 () (_ BitVec 32))

(declare-fun lt!257135 () SeekEntryResult!5446)

(declare-fun lt!257132 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!35398 (_ BitVec 32)) SeekEntryResult!5446)

(assert (=> b!563618 (= res!354915 (= lt!257135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257132 (select (store (arr!17000 a!3118) i!1132 k0!1914) j!142) (array!35399 (store (arr!17000 a!3118) i!1132 k0!1914) (size!17365 a!3118)) mask!3119)))))

(declare-fun lt!257137 () (_ BitVec 32))

(assert (=> b!563618 (= lt!257135 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!257137 (select (arr!17000 a!3118) j!142) a!3118 mask!3119))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!563618 (= lt!257132 (toIndex!0 (select (store (arr!17000 a!3118) i!1132 k0!1914) j!142) mask!3119))))

(assert (=> b!563618 (= lt!257137 (toIndex!0 (select (arr!17000 a!3118) j!142) mask!3119))))

(declare-fun b!563619 () Bool)

(declare-fun res!354913 () Bool)

(assert (=> b!563619 (=> (not res!354913) (not e!324714))))

(assert (=> b!563619 (= res!354913 (and (= (size!17365 a!3118) (bvadd #b00000000000000000000000000000001 mask!3119)) (bvsge i!1132 #b00000000000000000000000000000000) (bvslt i!1132 (size!17365 a!3118)) (bvsge j!142 #b00000000000000000000000000000000) (bvslt j!142 (size!17365 a!3118)) (not (= i!1132 j!142))))))

(declare-fun b!563620 () Bool)

(declare-fun res!354920 () Bool)

(assert (=> b!563620 (=> (not res!354920) (not e!324714))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!563620 (= res!354920 (validKeyInArray!0 (select (arr!17000 a!3118) j!142)))))

(declare-fun b!563621 () Bool)

(declare-fun e!324709 () Bool)

(assert (=> b!563621 (= e!324709 (= (seekEntryOrOpen!0 (select (arr!17000 a!3118) j!142) a!3118 mask!3119) (Found!5446 j!142)))))

(declare-fun b!563622 () Bool)

(declare-fun e!324710 () Bool)

(assert (=> b!563622 (= e!324713 (not e!324710))))

(declare-fun res!354912 () Bool)

(assert (=> b!563622 (=> res!354912 e!324710)))

(declare-fun lt!257136 () Bool)

(assert (=> b!563622 (= res!354912 (or (and (not lt!257136) (undefined!6258 lt!257135)) (and (not lt!257136) (not (undefined!6258 lt!257135))) (bvslt mask!3119 #b00000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!563622 (= lt!257136 (not ((_ is Intermediate!5446) lt!257135)))))

(assert (=> b!563622 e!324709))

(declare-fun res!354918 () Bool)

(assert (=> b!563622 (=> (not res!354918) (not e!324709))))

(assert (=> b!563622 (= res!354918 (arrayForallSeekEntryOrOpenFound!0 j!142 a!3118 mask!3119))))

(declare-datatypes ((Unit!17652 0))(
  ( (Unit!17653) )
))
(declare-fun lt!257134 () Unit!17652)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!35398 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17652)

(assert (=> b!563622 (= lt!257134 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3118 mask!3119 #b00000000000000000000000000000000 j!142))))

(declare-fun b!563623 () Bool)

(assert (=> b!563623 (= e!324710 (validKeyInArray!0 (select (store (arr!17000 a!3118) i!1132 k0!1914) j!142)))))

(declare-fun b!563624 () Bool)

(declare-fun res!354919 () Bool)

(assert (=> b!563624 (=> (not res!354919) (not e!324714))))

(declare-fun arrayContainsKey!0 (array!35398 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!563624 (= res!354919 (not (arrayContainsKey!0 a!3118 k0!1914 #b00000000000000000000000000000000)))))

(declare-fun b!563625 () Bool)

(declare-fun res!354911 () Bool)

(assert (=> b!563625 (=> (not res!354911) (not e!324714))))

(assert (=> b!563625 (= res!354911 (validKeyInArray!0 k0!1914))))

(declare-fun b!563626 () Bool)

(declare-fun res!354914 () Bool)

(assert (=> b!563626 (=> (not res!354914) (not e!324711))))

(declare-datatypes ((List!11119 0))(
  ( (Nil!11116) (Cons!11115 (h!12118 (_ BitVec 64)) (t!17338 List!11119)) )
))
(declare-fun arrayNoDuplicates!0 (array!35398 (_ BitVec 32) List!11119) Bool)

(assert (=> b!563626 (= res!354914 (arrayNoDuplicates!0 a!3118 #b00000000000000000000000000000000 Nil!11116))))

(assert (= (and start!51524 res!354916) b!563619))

(assert (= (and b!563619 res!354913) b!563620))

(assert (= (and b!563620 res!354920) b!563625))

(assert (= (and b!563625 res!354911) b!563624))

(assert (= (and b!563624 res!354919) b!563617))

(assert (= (and b!563617 res!354917) b!563616))

(assert (= (and b!563616 res!354910) b!563626))

(assert (= (and b!563626 res!354914) b!563618))

(assert (= (and b!563618 res!354915) b!563622))

(assert (= (and b!563622 res!354918) b!563621))

(assert (= (and b!563622 (not res!354912)) b!563623))

(declare-fun m!541547 () Bool)

(assert (=> b!563620 m!541547))

(assert (=> b!563620 m!541547))

(declare-fun m!541549 () Bool)

(assert (=> b!563620 m!541549))

(declare-fun m!541551 () Bool)

(assert (=> b!563623 m!541551))

(declare-fun m!541553 () Bool)

(assert (=> b!563623 m!541553))

(assert (=> b!563623 m!541553))

(declare-fun m!541555 () Bool)

(assert (=> b!563623 m!541555))

(declare-fun m!541557 () Bool)

(assert (=> b!563626 m!541557))

(declare-fun m!541559 () Bool)

(assert (=> b!563617 m!541559))

(declare-fun m!541561 () Bool)

(assert (=> b!563622 m!541561))

(declare-fun m!541563 () Bool)

(assert (=> b!563622 m!541563))

(declare-fun m!541565 () Bool)

(assert (=> b!563625 m!541565))

(assert (=> b!563618 m!541547))

(declare-fun m!541567 () Bool)

(assert (=> b!563618 m!541567))

(assert (=> b!563618 m!541547))

(assert (=> b!563618 m!541553))

(assert (=> b!563618 m!541551))

(assert (=> b!563618 m!541547))

(declare-fun m!541569 () Bool)

(assert (=> b!563618 m!541569))

(assert (=> b!563618 m!541553))

(declare-fun m!541571 () Bool)

(assert (=> b!563618 m!541571))

(assert (=> b!563618 m!541553))

(declare-fun m!541573 () Bool)

(assert (=> b!563618 m!541573))

(declare-fun m!541575 () Bool)

(assert (=> b!563624 m!541575))

(assert (=> b!563621 m!541547))

(assert (=> b!563621 m!541547))

(declare-fun m!541577 () Bool)

(assert (=> b!563621 m!541577))

(declare-fun m!541579 () Bool)

(assert (=> start!51524 m!541579))

(declare-fun m!541581 () Bool)

(assert (=> start!51524 m!541581))

(declare-fun m!541583 () Bool)

(assert (=> b!563616 m!541583))

(check-sat (not b!563625) (not b!563626) (not b!563623) (not b!563624) (not b!563618) (not b!563622) (not b!563617) (not b!563616) (not start!51524) (not b!563620) (not b!563621))
(check-sat)
