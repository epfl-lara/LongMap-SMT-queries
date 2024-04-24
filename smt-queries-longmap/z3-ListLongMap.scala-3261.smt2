; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45428 () Bool)

(assert start!45428)

(declare-fun b!499757 () Bool)

(declare-datatypes ((Unit!14959 0))(
  ( (Unit!14960) )
))
(declare-fun e!292834 () Unit!14959)

(declare-fun Unit!14961 () Unit!14959)

(assert (=> b!499757 (= e!292834 Unit!14961)))

(declare-fun b!499758 () Bool)

(declare-fun Unit!14962 () Unit!14959)

(assert (=> b!499758 (= e!292834 Unit!14962)))

(declare-fun lt!226712 () Unit!14959)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!226716 () (_ BitVec 32))

(declare-datatypes ((array!32254 0))(
  ( (array!32255 (arr!15508 (Array (_ BitVec 32) (_ BitVec 64))) (size!15872 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32254)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!3931 0))(
  ( (MissingZero!3931 (index!17906 (_ BitVec 32))) (Found!3931 (index!17907 (_ BitVec 32))) (Intermediate!3931 (undefined!4743 Bool) (index!17908 (_ BitVec 32)) (x!47093 (_ BitVec 32))) (Undefined!3931) (MissingVacant!3931 (index!17909 (_ BitVec 32))) )
))
(declare-fun lt!226713 () SeekEntryResult!3931)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32254 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14959)

(assert (=> b!499758 (= lt!226712 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!226716 #b00000000000000000000000000000000 (index!17908 lt!226713) (x!47093 lt!226713) mask!3524))))

(declare-fun lt!226720 () array!32254)

(declare-fun lt!226718 () (_ BitVec 64))

(declare-fun res!301724 () Bool)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32254 (_ BitVec 32)) SeekEntryResult!3931)

(assert (=> b!499758 (= res!301724 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226716 lt!226718 lt!226720 mask!3524) (Intermediate!3931 false (index!17908 lt!226713) (x!47093 lt!226713))))))

(declare-fun e!292839 () Bool)

(assert (=> b!499758 (=> (not res!301724) (not e!292839))))

(assert (=> b!499758 e!292839))

(declare-fun b!499759 () Bool)

(declare-fun res!301723 () Bool)

(declare-fun e!292835 () Bool)

(assert (=> b!499759 (=> (not res!301723) (not e!292835))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!499759 (= res!301723 (validKeyInArray!0 (select (arr!15508 a!3235) j!176)))))

(declare-fun b!499760 () Bool)

(declare-fun res!301733 () Bool)

(assert (=> b!499760 (=> (not res!301733) (not e!292835))))

(declare-fun arrayContainsKey!0 (array!32254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!499760 (= res!301733 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!499761 () Bool)

(declare-fun res!301735 () Bool)

(declare-fun e!292833 () Bool)

(assert (=> b!499761 (=> (not res!301735) (not e!292833))))

(declare-datatypes ((List!9573 0))(
  ( (Nil!9570) (Cons!9569 (h!10443 (_ BitVec 64)) (t!15793 List!9573)) )
))
(declare-fun arrayNoDuplicates!0 (array!32254 (_ BitVec 32) List!9573) Bool)

(assert (=> b!499761 (= res!301735 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9570))))

(declare-fun b!499763 () Bool)

(declare-fun res!301734 () Bool)

(assert (=> b!499763 (=> (not res!301734) (not e!292835))))

(assert (=> b!499763 (= res!301734 (validKeyInArray!0 k0!2280))))

(declare-fun b!499764 () Bool)

(declare-fun res!301728 () Bool)

(assert (=> b!499764 (=> (not res!301728) (not e!292835))))

(assert (=> b!499764 (= res!301728 (and (= (size!15872 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15872 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15872 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!499765 () Bool)

(assert (=> b!499765 (= e!292839 false)))

(declare-fun b!499766 () Bool)

(declare-fun e!292832 () Bool)

(assert (=> b!499766 (= e!292833 (not e!292832))))

(declare-fun res!301727 () Bool)

(assert (=> b!499766 (=> res!301727 e!292832)))

(declare-fun lt!226717 () (_ BitVec 32))

(assert (=> b!499766 (= res!301727 (= lt!226713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226717 lt!226718 lt!226720 mask!3524)))))

(assert (=> b!499766 (= lt!226713 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226716 (select (arr!15508 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!499766 (= lt!226717 (toIndex!0 lt!226718 mask!3524))))

(assert (=> b!499766 (= lt!226718 (select (store (arr!15508 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!499766 (= lt!226716 (toIndex!0 (select (arr!15508 a!3235) j!176) mask!3524))))

(assert (=> b!499766 (= lt!226720 (array!32255 (store (arr!15508 a!3235) i!1204 k0!2280) (size!15872 a!3235)))))

(declare-fun e!292836 () Bool)

(assert (=> b!499766 e!292836))

(declare-fun res!301731 () Bool)

(assert (=> b!499766 (=> (not res!301731) (not e!292836))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32254 (_ BitVec 32)) Bool)

(assert (=> b!499766 (= res!301731 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!226719 () Unit!14959)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32254 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14959)

(assert (=> b!499766 (= lt!226719 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!499767 () Bool)

(declare-fun res!301732 () Bool)

(assert (=> b!499767 (=> res!301732 e!292832)))

(get-info :version)

(assert (=> b!499767 (= res!301732 (or (undefined!4743 lt!226713) (not ((_ is Intermediate!3931) lt!226713))))))

(declare-fun b!499768 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32254 (_ BitVec 32)) SeekEntryResult!3931)

(assert (=> b!499768 (= e!292836 (= (seekEntryOrOpen!0 (select (arr!15508 a!3235) j!176) a!3235 mask!3524) (Found!3931 j!176)))))

(declare-fun b!499769 () Bool)

(assert (=> b!499769 (= e!292835 e!292833)))

(declare-fun res!301729 () Bool)

(assert (=> b!499769 (=> (not res!301729) (not e!292833))))

(declare-fun lt!226714 () SeekEntryResult!3931)

(assert (=> b!499769 (= res!301729 (or (= lt!226714 (MissingZero!3931 i!1204)) (= lt!226714 (MissingVacant!3931 i!1204))))))

(assert (=> b!499769 (= lt!226714 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun res!301726 () Bool)

(assert (=> start!45428 (=> (not res!301726) (not e!292835))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45428 (= res!301726 (validMask!0 mask!3524))))

(assert (=> start!45428 e!292835))

(assert (=> start!45428 true))

(declare-fun array_inv!11367 (array!32254) Bool)

(assert (=> start!45428 (array_inv!11367 a!3235)))

(declare-fun b!499762 () Bool)

(declare-fun res!301725 () Bool)

(assert (=> b!499762 (=> (not res!301725) (not e!292833))))

(assert (=> b!499762 (= res!301725 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!499770 () Bool)

(declare-fun e!292837 () Bool)

(assert (=> b!499770 (= e!292832 e!292837)))

(declare-fun res!301730 () Bool)

(assert (=> b!499770 (=> res!301730 e!292837)))

(assert (=> b!499770 (= res!301730 (or (bvsgt #b00000000000000000000000000000000 (x!47093 lt!226713)) (bvsgt (x!47093 lt!226713) #b01111111111111111111111111111110) (bvslt lt!226716 #b00000000000000000000000000000000) (bvsge lt!226716 (size!15872 a!3235)) (bvslt (index!17908 lt!226713) #b00000000000000000000000000000000) (bvsge (index!17908 lt!226713) (size!15872 a!3235)) (not (= lt!226713 (Intermediate!3931 false (index!17908 lt!226713) (x!47093 lt!226713))))))))

(assert (=> b!499770 (and (or (= (select (arr!15508 a!3235) (index!17908 lt!226713)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15508 a!3235) (index!17908 lt!226713)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15508 a!3235) (index!17908 lt!226713)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15508 a!3235) (index!17908 lt!226713)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!226715 () Unit!14959)

(assert (=> b!499770 (= lt!226715 e!292834)))

(declare-fun c!59294 () Bool)

(assert (=> b!499770 (= c!59294 (= (select (arr!15508 a!3235) (index!17908 lt!226713)) (select (arr!15508 a!3235) j!176)))))

(assert (=> b!499770 (and (bvslt (x!47093 lt!226713) #b01111111111111111111111111111110) (or (= (select (arr!15508 a!3235) (index!17908 lt!226713)) (select (arr!15508 a!3235) j!176)) (= (select (arr!15508 a!3235) (index!17908 lt!226713)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15508 a!3235) (index!17908 lt!226713)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!499771 () Bool)

(assert (=> b!499771 (= e!292837 true)))

(declare-fun lt!226711 () SeekEntryResult!3931)

(assert (=> b!499771 (= lt!226711 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!226716 lt!226718 lt!226720 mask!3524))))

(assert (= (and start!45428 res!301726) b!499764))

(assert (= (and b!499764 res!301728) b!499759))

(assert (= (and b!499759 res!301723) b!499763))

(assert (= (and b!499763 res!301734) b!499760))

(assert (= (and b!499760 res!301733) b!499769))

(assert (= (and b!499769 res!301729) b!499762))

(assert (= (and b!499762 res!301725) b!499761))

(assert (= (and b!499761 res!301735) b!499766))

(assert (= (and b!499766 res!301731) b!499768))

(assert (= (and b!499766 (not res!301727)) b!499767))

(assert (= (and b!499767 (not res!301732)) b!499770))

(assert (= (and b!499770 c!59294) b!499758))

(assert (= (and b!499770 (not c!59294)) b!499757))

(assert (= (and b!499758 res!301724) b!499765))

(assert (= (and b!499770 (not res!301730)) b!499771))

(declare-fun m!481177 () Bool)

(assert (=> b!499771 m!481177))

(declare-fun m!481179 () Bool)

(assert (=> b!499770 m!481179))

(declare-fun m!481181 () Bool)

(assert (=> b!499770 m!481181))

(assert (=> b!499768 m!481181))

(assert (=> b!499768 m!481181))

(declare-fun m!481183 () Bool)

(assert (=> b!499768 m!481183))

(declare-fun m!481185 () Bool)

(assert (=> b!499758 m!481185))

(assert (=> b!499758 m!481177))

(assert (=> b!499759 m!481181))

(assert (=> b!499759 m!481181))

(declare-fun m!481187 () Bool)

(assert (=> b!499759 m!481187))

(declare-fun m!481189 () Bool)

(assert (=> b!499760 m!481189))

(declare-fun m!481191 () Bool)

(assert (=> b!499763 m!481191))

(declare-fun m!481193 () Bool)

(assert (=> start!45428 m!481193))

(declare-fun m!481195 () Bool)

(assert (=> start!45428 m!481195))

(declare-fun m!481197 () Bool)

(assert (=> b!499766 m!481197))

(declare-fun m!481199 () Bool)

(assert (=> b!499766 m!481199))

(declare-fun m!481201 () Bool)

(assert (=> b!499766 m!481201))

(assert (=> b!499766 m!481181))

(declare-fun m!481203 () Bool)

(assert (=> b!499766 m!481203))

(declare-fun m!481205 () Bool)

(assert (=> b!499766 m!481205))

(assert (=> b!499766 m!481181))

(declare-fun m!481207 () Bool)

(assert (=> b!499766 m!481207))

(assert (=> b!499766 m!481181))

(declare-fun m!481209 () Bool)

(assert (=> b!499766 m!481209))

(declare-fun m!481211 () Bool)

(assert (=> b!499766 m!481211))

(declare-fun m!481213 () Bool)

(assert (=> b!499762 m!481213))

(declare-fun m!481215 () Bool)

(assert (=> b!499761 m!481215))

(declare-fun m!481217 () Bool)

(assert (=> b!499769 m!481217))

(check-sat (not b!499771) (not b!499766) (not b!499758) (not b!499769) (not b!499759) (not b!499760) (not b!499762) (not b!499763) (not b!499761) (not b!499768) (not start!45428))
(check-sat)
