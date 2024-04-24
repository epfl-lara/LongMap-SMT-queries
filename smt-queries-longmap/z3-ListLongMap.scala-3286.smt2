; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45650 () Bool)

(assert start!45650)

(declare-fun b!503697 () Bool)

(declare-fun e!294958 () Bool)

(declare-fun e!294954 () Bool)

(assert (=> b!503697 (= e!294958 e!294954)))

(declare-fun res!305013 () Bool)

(assert (=> b!503697 (=> res!305013 e!294954)))

(declare-fun lt!229248 () (_ BitVec 32))

(declare-datatypes ((array!32407 0))(
  ( (array!32408 (arr!15583 (Array (_ BitVec 32) (_ BitVec 64))) (size!15947 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32407)

(declare-datatypes ((SeekEntryResult!4006 0))(
  ( (MissingZero!4006 (index!18212 (_ BitVec 32))) (Found!4006 (index!18213 (_ BitVec 32))) (Intermediate!4006 (undefined!4818 Bool) (index!18214 (_ BitVec 32)) (x!47380 (_ BitVec 32))) (Undefined!4006) (MissingVacant!4006 (index!18215 (_ BitVec 32))) )
))
(declare-fun lt!229245 () SeekEntryResult!4006)

(assert (=> b!503697 (= res!305013 (or (bvsgt (x!47380 lt!229245) #b01111111111111111111111111111110) (bvslt lt!229248 #b00000000000000000000000000000000) (bvsge lt!229248 (size!15947 a!3235)) (bvslt (index!18214 lt!229245) #b00000000000000000000000000000000) (bvsge (index!18214 lt!229245) (size!15947 a!3235)) (not (= lt!229245 (Intermediate!4006 false (index!18214 lt!229245) (x!47380 lt!229245))))))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503697 (= (index!18214 lt!229245) i!1204)))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((Unit!15259 0))(
  ( (Unit!15260) )
))
(declare-fun lt!229250 () Unit!15259)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32407 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15259)

(assert (=> b!503697 (= lt!229250 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229248 #b00000000000000000000000000000000 (index!18214 lt!229245) (x!47380 lt!229245) mask!3524))))

(assert (=> b!503697 (and (or (= (select (arr!15583 a!3235) (index!18214 lt!229245)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15583 a!3235) (index!18214 lt!229245)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15583 a!3235) (index!18214 lt!229245)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15583 a!3235) (index!18214 lt!229245)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229249 () Unit!15259)

(declare-fun e!294957 () Unit!15259)

(assert (=> b!503697 (= lt!229249 e!294957)))

(declare-fun c!59621 () Bool)

(assert (=> b!503697 (= c!59621 (= (select (arr!15583 a!3235) (index!18214 lt!229245)) (select (arr!15583 a!3235) j!176)))))

(assert (=> b!503697 (and (bvslt (x!47380 lt!229245) #b01111111111111111111111111111110) (or (= (select (arr!15583 a!3235) (index!18214 lt!229245)) (select (arr!15583 a!3235) j!176)) (= (select (arr!15583 a!3235) (index!18214 lt!229245)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15583 a!3235) (index!18214 lt!229245)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503698 () Bool)

(declare-fun e!294960 () Bool)

(assert (=> b!503698 (= e!294960 (not e!294958))))

(declare-fun res!305025 () Bool)

(assert (=> b!503698 (=> res!305025 e!294958)))

(declare-fun lt!229243 () (_ BitVec 64))

(declare-fun lt!229247 () array!32407)

(declare-fun lt!229246 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32407 (_ BitVec 32)) SeekEntryResult!4006)

(assert (=> b!503698 (= res!305025 (= lt!229245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229246 lt!229243 lt!229247 mask!3524)))))

(assert (=> b!503698 (= lt!229245 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229248 (select (arr!15583 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503698 (= lt!229246 (toIndex!0 lt!229243 mask!3524))))

(assert (=> b!503698 (= lt!229243 (select (store (arr!15583 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503698 (= lt!229248 (toIndex!0 (select (arr!15583 a!3235) j!176) mask!3524))))

(assert (=> b!503698 (= lt!229247 (array!32408 (store (arr!15583 a!3235) i!1204 k0!2280) (size!15947 a!3235)))))

(declare-fun e!294952 () Bool)

(assert (=> b!503698 e!294952))

(declare-fun res!305023 () Bool)

(assert (=> b!503698 (=> (not res!305023) (not e!294952))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32407 (_ BitVec 32)) Bool)

(assert (=> b!503698 (= res!305023 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!229252 () Unit!15259)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15259)

(assert (=> b!503698 (= lt!229252 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503699 () Bool)

(declare-fun res!305020 () Bool)

(assert (=> b!503699 (=> res!305020 e!294954)))

(declare-fun e!294953 () Bool)

(assert (=> b!503699 (= res!305020 e!294953)))

(declare-fun res!305016 () Bool)

(assert (=> b!503699 (=> (not res!305016) (not e!294953))))

(assert (=> b!503699 (= res!305016 (bvsgt #b00000000000000000000000000000000 (x!47380 lt!229245)))))

(declare-fun b!503700 () Bool)

(declare-fun res!305012 () Bool)

(assert (=> b!503700 (=> res!305012 e!294958)))

(get-info :version)

(assert (=> b!503700 (= res!305012 (or (undefined!4818 lt!229245) (not ((_ is Intermediate!4006) lt!229245))))))

(declare-fun b!503701 () Bool)

(declare-fun res!305018 () Bool)

(declare-fun e!294955 () Bool)

(assert (=> b!503701 (=> (not res!305018) (not e!294955))))

(declare-fun arrayContainsKey!0 (array!32407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503701 (= res!305018 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503702 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32407 (_ BitVec 32)) SeekEntryResult!4006)

(assert (=> b!503702 (= e!294952 (= (seekEntryOrOpen!0 (select (arr!15583 a!3235) j!176) a!3235 mask!3524) (Found!4006 j!176)))))

(declare-fun b!503703 () Bool)

(declare-fun res!305026 () Bool)

(assert (=> b!503703 (=> (not res!305026) (not e!294955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503703 (= res!305026 (validKeyInArray!0 k0!2280))))

(declare-fun b!503704 () Bool)

(declare-fun res!305015 () Bool)

(assert (=> b!503704 (=> (not res!305015) (not e!294960))))

(assert (=> b!503704 (= res!305015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!503706 () Bool)

(declare-fun res!305024 () Bool)

(assert (=> b!503706 (=> (not res!305024) (not e!294960))))

(declare-datatypes ((List!9648 0))(
  ( (Nil!9645) (Cons!9644 (h!10521 (_ BitVec 64)) (t!15868 List!9648)) )
))
(declare-fun arrayNoDuplicates!0 (array!32407 (_ BitVec 32) List!9648) Bool)

(assert (=> b!503706 (= res!305024 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9645))))

(declare-fun b!503707 () Bool)

(declare-fun Unit!15261 () Unit!15259)

(assert (=> b!503707 (= e!294957 Unit!15261)))

(declare-fun b!503708 () Bool)

(declare-fun e!294959 () Bool)

(assert (=> b!503708 (= e!294959 false)))

(declare-fun b!503709 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32407 (_ BitVec 32)) SeekEntryResult!4006)

(assert (=> b!503709 (= e!294953 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229248 (index!18214 lt!229245) (select (arr!15583 a!3235) j!176) a!3235 mask!3524) (Found!4006 j!176))))))

(declare-fun b!503710 () Bool)

(declare-fun res!305014 () Bool)

(assert (=> b!503710 (=> (not res!305014) (not e!294955))))

(assert (=> b!503710 (= res!305014 (and (= (size!15947 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15947 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15947 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503711 () Bool)

(assert (=> b!503711 (= e!294955 e!294960)))

(declare-fun res!305019 () Bool)

(assert (=> b!503711 (=> (not res!305019) (not e!294960))))

(declare-fun lt!229251 () SeekEntryResult!4006)

(assert (=> b!503711 (= res!305019 (or (= lt!229251 (MissingZero!4006 i!1204)) (= lt!229251 (MissingVacant!4006 i!1204))))))

(assert (=> b!503711 (= lt!229251 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503712 () Bool)

(declare-fun Unit!15262 () Unit!15259)

(assert (=> b!503712 (= e!294957 Unit!15262)))

(declare-fun lt!229242 () Unit!15259)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32407 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15259)

(assert (=> b!503712 (= lt!229242 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229248 #b00000000000000000000000000000000 (index!18214 lt!229245) (x!47380 lt!229245) mask!3524))))

(declare-fun res!305021 () Bool)

(assert (=> b!503712 (= res!305021 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229248 lt!229243 lt!229247 mask!3524) (Intermediate!4006 false (index!18214 lt!229245) (x!47380 lt!229245))))))

(assert (=> b!503712 (=> (not res!305021) (not e!294959))))

(assert (=> b!503712 e!294959))

(declare-fun b!503713 () Bool)

(declare-fun res!305022 () Bool)

(assert (=> b!503713 (=> (not res!305022) (not e!294955))))

(assert (=> b!503713 (= res!305022 (validKeyInArray!0 (select (arr!15583 a!3235) j!176)))))

(declare-fun res!305017 () Bool)

(assert (=> start!45650 (=> (not res!305017) (not e!294955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45650 (= res!305017 (validMask!0 mask!3524))))

(assert (=> start!45650 e!294955))

(assert (=> start!45650 true))

(declare-fun array_inv!11442 (array!32407) Bool)

(assert (=> start!45650 (array_inv!11442 a!3235)))

(declare-fun b!503705 () Bool)

(assert (=> b!503705 (= e!294954 true)))

(declare-fun lt!229244 () SeekEntryResult!4006)

(assert (=> b!503705 (= lt!229244 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229248 lt!229243 lt!229247 mask!3524))))

(assert (= (and start!45650 res!305017) b!503710))

(assert (= (and b!503710 res!305014) b!503713))

(assert (= (and b!503713 res!305022) b!503703))

(assert (= (and b!503703 res!305026) b!503701))

(assert (= (and b!503701 res!305018) b!503711))

(assert (= (and b!503711 res!305019) b!503704))

(assert (= (and b!503704 res!305015) b!503706))

(assert (= (and b!503706 res!305024) b!503698))

(assert (= (and b!503698 res!305023) b!503702))

(assert (= (and b!503698 (not res!305025)) b!503700))

(assert (= (and b!503700 (not res!305012)) b!503697))

(assert (= (and b!503697 c!59621) b!503712))

(assert (= (and b!503697 (not c!59621)) b!503707))

(assert (= (and b!503712 res!305021) b!503708))

(assert (= (and b!503697 (not res!305013)) b!503699))

(assert (= (and b!503699 res!305016) b!503709))

(assert (= (and b!503699 (not res!305020)) b!503705))

(declare-fun m!484747 () Bool)

(assert (=> b!503697 m!484747))

(declare-fun m!484749 () Bool)

(assert (=> b!503697 m!484749))

(declare-fun m!484751 () Bool)

(assert (=> b!503697 m!484751))

(declare-fun m!484753 () Bool)

(assert (=> b!503698 m!484753))

(declare-fun m!484755 () Bool)

(assert (=> b!503698 m!484755))

(declare-fun m!484757 () Bool)

(assert (=> b!503698 m!484757))

(assert (=> b!503698 m!484751))

(declare-fun m!484759 () Bool)

(assert (=> b!503698 m!484759))

(assert (=> b!503698 m!484751))

(declare-fun m!484761 () Bool)

(assert (=> b!503698 m!484761))

(assert (=> b!503698 m!484751))

(declare-fun m!484763 () Bool)

(assert (=> b!503698 m!484763))

(declare-fun m!484765 () Bool)

(assert (=> b!503698 m!484765))

(declare-fun m!484767 () Bool)

(assert (=> b!503698 m!484767))

(declare-fun m!484769 () Bool)

(assert (=> b!503711 m!484769))

(declare-fun m!484771 () Bool)

(assert (=> b!503712 m!484771))

(declare-fun m!484773 () Bool)

(assert (=> b!503712 m!484773))

(declare-fun m!484775 () Bool)

(assert (=> b!503701 m!484775))

(assert (=> b!503702 m!484751))

(assert (=> b!503702 m!484751))

(declare-fun m!484777 () Bool)

(assert (=> b!503702 m!484777))

(declare-fun m!484779 () Bool)

(assert (=> start!45650 m!484779))

(declare-fun m!484781 () Bool)

(assert (=> start!45650 m!484781))

(assert (=> b!503705 m!484773))

(assert (=> b!503713 m!484751))

(assert (=> b!503713 m!484751))

(declare-fun m!484783 () Bool)

(assert (=> b!503713 m!484783))

(declare-fun m!484785 () Bool)

(assert (=> b!503706 m!484785))

(assert (=> b!503709 m!484751))

(assert (=> b!503709 m!484751))

(declare-fun m!484787 () Bool)

(assert (=> b!503709 m!484787))

(declare-fun m!484789 () Bool)

(assert (=> b!503704 m!484789))

(declare-fun m!484791 () Bool)

(assert (=> b!503703 m!484791))

(check-sat (not b!503705) (not b!503702) (not b!503711) (not b!503712) (not b!503703) (not start!45650) (not b!503709) (not b!503713) (not b!503704) (not b!503701) (not b!503706) (not b!503697) (not b!503698))
(check-sat)
