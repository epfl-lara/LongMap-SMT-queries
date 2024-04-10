; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45290 () Bool)

(assert start!45290)

(declare-fun b!497650 () Bool)

(declare-fun e!291685 () Bool)

(declare-fun e!291687 () Bool)

(assert (=> b!497650 (= e!291685 (not e!291687))))

(declare-fun res!300019 () Bool)

(assert (=> b!497650 (=> res!300019 e!291687)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!32178 0))(
  ( (array!32179 (arr!15472 (Array (_ BitVec 32) (_ BitVec 64))) (size!15836 (_ BitVec 32))) )
))
(declare-fun lt!225329 () array!32178)

(declare-fun lt!225332 () (_ BitVec 32))

(declare-fun lt!225330 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!3939 0))(
  ( (MissingZero!3939 (index!17935 (_ BitVec 32))) (Found!3939 (index!17936 (_ BitVec 32))) (Intermediate!3939 (undefined!4751 Bool) (index!17937 (_ BitVec 32)) (x!46983 (_ BitVec 32))) (Undefined!3939) (MissingVacant!3939 (index!17938 (_ BitVec 32))) )
))
(declare-fun lt!225331 () SeekEntryResult!3939)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32178 (_ BitVec 32)) SeekEntryResult!3939)

(assert (=> b!497650 (= res!300019 (= lt!225331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225332 lt!225330 lt!225329 mask!3524)))))

(declare-fun lt!225334 () (_ BitVec 32))

(declare-fun a!3235 () array!32178)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497650 (= lt!225331 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225334 (select (arr!15472 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497650 (= lt!225332 (toIndex!0 lt!225330 mask!3524))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!497650 (= lt!225330 (select (store (arr!15472 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!497650 (= lt!225334 (toIndex!0 (select (arr!15472 a!3235) j!176) mask!3524))))

(assert (=> b!497650 (= lt!225329 (array!32179 (store (arr!15472 a!3235) i!1204 k0!2280) (size!15836 a!3235)))))

(declare-fun e!291682 () Bool)

(assert (=> b!497650 e!291682))

(declare-fun res!300014 () Bool)

(assert (=> b!497650 (=> (not res!300014) (not e!291682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32178 (_ BitVec 32)) Bool)

(assert (=> b!497650 (= res!300014 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14832 0))(
  ( (Unit!14833) )
))
(declare-fun lt!225333 () Unit!14832)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14832)

(assert (=> b!497650 (= lt!225333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497651 () Bool)

(declare-fun e!291683 () Unit!14832)

(declare-fun Unit!14834 () Unit!14832)

(assert (=> b!497651 (= e!291683 Unit!14834)))

(declare-fun lt!225336 () Unit!14832)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32178 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14832)

(assert (=> b!497651 (= lt!225336 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225334 #b00000000000000000000000000000000 (index!17937 lt!225331) (x!46983 lt!225331) mask!3524))))

(declare-fun res!300009 () Bool)

(assert (=> b!497651 (= res!300009 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225334 lt!225330 lt!225329 mask!3524) (Intermediate!3939 false (index!17937 lt!225331) (x!46983 lt!225331))))))

(declare-fun e!291686 () Bool)

(assert (=> b!497651 (=> (not res!300009) (not e!291686))))

(assert (=> b!497651 e!291686))

(declare-fun res!300012 () Bool)

(declare-fun e!291681 () Bool)

(assert (=> start!45290 (=> (not res!300012) (not e!291681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45290 (= res!300012 (validMask!0 mask!3524))))

(assert (=> start!45290 e!291681))

(assert (=> start!45290 true))

(declare-fun array_inv!11268 (array!32178) Bool)

(assert (=> start!45290 (array_inv!11268 a!3235)))

(declare-fun b!497652 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32178 (_ BitVec 32)) SeekEntryResult!3939)

(assert (=> b!497652 (= e!291682 (= (seekEntryOrOpen!0 (select (arr!15472 a!3235) j!176) a!3235 mask!3524) (Found!3939 j!176)))))

(declare-fun b!497653 () Bool)

(assert (=> b!497653 (= e!291687 (or (bvslt mask!3524 #b00000000000000000000000000000000) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> b!497653 (and (or (= (select (arr!15472 a!3235) (index!17937 lt!225331)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15472 a!3235) (index!17937 lt!225331)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15472 a!3235) (index!17937 lt!225331)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15472 a!3235) (index!17937 lt!225331)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!225337 () Unit!14832)

(assert (=> b!497653 (= lt!225337 e!291683)))

(declare-fun c!59096 () Bool)

(assert (=> b!497653 (= c!59096 (= (select (arr!15472 a!3235) (index!17937 lt!225331)) (select (arr!15472 a!3235) j!176)))))

(assert (=> b!497653 (and (bvslt (x!46983 lt!225331) #b01111111111111111111111111111110) (or (= (select (arr!15472 a!3235) (index!17937 lt!225331)) (select (arr!15472 a!3235) j!176)) (= (select (arr!15472 a!3235) (index!17937 lt!225331)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15472 a!3235) (index!17937 lt!225331)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497654 () Bool)

(declare-fun res!300011 () Bool)

(assert (=> b!497654 (=> (not res!300011) (not e!291685))))

(declare-datatypes ((List!9630 0))(
  ( (Nil!9627) (Cons!9626 (h!10497 (_ BitVec 64)) (t!15858 List!9630)) )
))
(declare-fun arrayNoDuplicates!0 (array!32178 (_ BitVec 32) List!9630) Bool)

(assert (=> b!497654 (= res!300011 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9627))))

(declare-fun b!497655 () Bool)

(declare-fun res!300015 () Bool)

(assert (=> b!497655 (=> (not res!300015) (not e!291681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497655 (= res!300015 (validKeyInArray!0 (select (arr!15472 a!3235) j!176)))))

(declare-fun b!497656 () Bool)

(declare-fun res!300013 () Bool)

(assert (=> b!497656 (=> (not res!300013) (not e!291681))))

(declare-fun arrayContainsKey!0 (array!32178 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497656 (= res!300013 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497657 () Bool)

(assert (=> b!497657 (= e!291681 e!291685)))

(declare-fun res!300010 () Bool)

(assert (=> b!497657 (=> (not res!300010) (not e!291685))))

(declare-fun lt!225335 () SeekEntryResult!3939)

(assert (=> b!497657 (= res!300010 (or (= lt!225335 (MissingZero!3939 i!1204)) (= lt!225335 (MissingVacant!3939 i!1204))))))

(assert (=> b!497657 (= lt!225335 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497658 () Bool)

(declare-fun res!300017 () Bool)

(assert (=> b!497658 (=> (not res!300017) (not e!291681))))

(assert (=> b!497658 (= res!300017 (validKeyInArray!0 k0!2280))))

(declare-fun b!497659 () Bool)

(declare-fun res!300020 () Bool)

(assert (=> b!497659 (=> (not res!300020) (not e!291681))))

(assert (=> b!497659 (= res!300020 (and (= (size!15836 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15836 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15836 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497660 () Bool)

(declare-fun Unit!14835 () Unit!14832)

(assert (=> b!497660 (= e!291683 Unit!14835)))

(declare-fun b!497661 () Bool)

(declare-fun res!300016 () Bool)

(assert (=> b!497661 (=> (not res!300016) (not e!291685))))

(assert (=> b!497661 (= res!300016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497662 () Bool)

(declare-fun res!300018 () Bool)

(assert (=> b!497662 (=> res!300018 e!291687)))

(get-info :version)

(assert (=> b!497662 (= res!300018 (or (undefined!4751 lt!225331) (not ((_ is Intermediate!3939) lt!225331))))))

(declare-fun b!497663 () Bool)

(assert (=> b!497663 (= e!291686 false)))

(assert (= (and start!45290 res!300012) b!497659))

(assert (= (and b!497659 res!300020) b!497655))

(assert (= (and b!497655 res!300015) b!497658))

(assert (= (and b!497658 res!300017) b!497656))

(assert (= (and b!497656 res!300013) b!497657))

(assert (= (and b!497657 res!300010) b!497661))

(assert (= (and b!497661 res!300016) b!497654))

(assert (= (and b!497654 res!300011) b!497650))

(assert (= (and b!497650 res!300014) b!497652))

(assert (= (and b!497650 (not res!300019)) b!497662))

(assert (= (and b!497662 (not res!300018)) b!497653))

(assert (= (and b!497653 c!59096) b!497651))

(assert (= (and b!497653 (not c!59096)) b!497660))

(assert (= (and b!497651 res!300009) b!497663))

(declare-fun m!479037 () Bool)

(assert (=> b!497651 m!479037))

(declare-fun m!479039 () Bool)

(assert (=> b!497651 m!479039))

(declare-fun m!479041 () Bool)

(assert (=> b!497654 m!479041))

(declare-fun m!479043 () Bool)

(assert (=> b!497650 m!479043))

(declare-fun m!479045 () Bool)

(assert (=> b!497650 m!479045))

(declare-fun m!479047 () Bool)

(assert (=> b!497650 m!479047))

(declare-fun m!479049 () Bool)

(assert (=> b!497650 m!479049))

(declare-fun m!479051 () Bool)

(assert (=> b!497650 m!479051))

(assert (=> b!497650 m!479047))

(declare-fun m!479053 () Bool)

(assert (=> b!497650 m!479053))

(assert (=> b!497650 m!479047))

(declare-fun m!479055 () Bool)

(assert (=> b!497650 m!479055))

(declare-fun m!479057 () Bool)

(assert (=> b!497650 m!479057))

(declare-fun m!479059 () Bool)

(assert (=> b!497650 m!479059))

(declare-fun m!479061 () Bool)

(assert (=> b!497653 m!479061))

(assert (=> b!497653 m!479047))

(declare-fun m!479063 () Bool)

(assert (=> b!497661 m!479063))

(declare-fun m!479065 () Bool)

(assert (=> b!497657 m!479065))

(declare-fun m!479067 () Bool)

(assert (=> b!497656 m!479067))

(declare-fun m!479069 () Bool)

(assert (=> start!45290 m!479069))

(declare-fun m!479071 () Bool)

(assert (=> start!45290 m!479071))

(assert (=> b!497655 m!479047))

(assert (=> b!497655 m!479047))

(declare-fun m!479073 () Bool)

(assert (=> b!497655 m!479073))

(assert (=> b!497652 m!479047))

(assert (=> b!497652 m!479047))

(declare-fun m!479075 () Bool)

(assert (=> b!497652 m!479075))

(declare-fun m!479077 () Bool)

(assert (=> b!497658 m!479077))

(check-sat (not b!497658) (not b!497656) (not b!497661) (not b!497652) (not start!45290) (not b!497654) (not b!497655) (not b!497657) (not b!497650) (not b!497651))
(check-sat)
(get-model)

(declare-fun d!78375 () Bool)

(declare-fun lt!225371 () SeekEntryResult!3939)

(assert (=> d!78375 (and (or ((_ is Undefined!3939) lt!225371) (not ((_ is Found!3939) lt!225371)) (and (bvsge (index!17936 lt!225371) #b00000000000000000000000000000000) (bvslt (index!17936 lt!225371) (size!15836 a!3235)))) (or ((_ is Undefined!3939) lt!225371) ((_ is Found!3939) lt!225371) (not ((_ is MissingZero!3939) lt!225371)) (and (bvsge (index!17935 lt!225371) #b00000000000000000000000000000000) (bvslt (index!17935 lt!225371) (size!15836 a!3235)))) (or ((_ is Undefined!3939) lt!225371) ((_ is Found!3939) lt!225371) ((_ is MissingZero!3939) lt!225371) (not ((_ is MissingVacant!3939) lt!225371)) (and (bvsge (index!17938 lt!225371) #b00000000000000000000000000000000) (bvslt (index!17938 lt!225371) (size!15836 a!3235)))) (or ((_ is Undefined!3939) lt!225371) (ite ((_ is Found!3939) lt!225371) (= (select (arr!15472 a!3235) (index!17936 lt!225371)) k0!2280) (ite ((_ is MissingZero!3939) lt!225371) (= (select (arr!15472 a!3235) (index!17935 lt!225371)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3939) lt!225371) (= (select (arr!15472 a!3235) (index!17938 lt!225371)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!291717 () SeekEntryResult!3939)

(assert (=> d!78375 (= lt!225371 e!291717)))

(declare-fun c!59107 () Bool)

(declare-fun lt!225373 () SeekEntryResult!3939)

(assert (=> d!78375 (= c!59107 (and ((_ is Intermediate!3939) lt!225373) (undefined!4751 lt!225373)))))

(assert (=> d!78375 (= lt!225373 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!78375 (validMask!0 mask!3524)))

(assert (=> d!78375 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!225371)))

(declare-fun e!291716 () SeekEntryResult!3939)

(declare-fun b!497718 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32178 (_ BitVec 32)) SeekEntryResult!3939)

(assert (=> b!497718 (= e!291716 (seekKeyOrZeroReturnVacant!0 (x!46983 lt!225373) (index!17937 lt!225373) (index!17937 lt!225373) k0!2280 a!3235 mask!3524))))

(declare-fun b!497719 () Bool)

(declare-fun e!291715 () SeekEntryResult!3939)

(assert (=> b!497719 (= e!291717 e!291715)))

(declare-fun lt!225372 () (_ BitVec 64))

(assert (=> b!497719 (= lt!225372 (select (arr!15472 a!3235) (index!17937 lt!225373)))))

(declare-fun c!59106 () Bool)

(assert (=> b!497719 (= c!59106 (= lt!225372 k0!2280))))

(declare-fun b!497720 () Bool)

(assert (=> b!497720 (= e!291716 (MissingZero!3939 (index!17937 lt!225373)))))

(declare-fun b!497721 () Bool)

(assert (=> b!497721 (= e!291715 (Found!3939 (index!17937 lt!225373)))))

(declare-fun b!497722 () Bool)

(declare-fun c!59108 () Bool)

(assert (=> b!497722 (= c!59108 (= lt!225372 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!497722 (= e!291715 e!291716)))

(declare-fun b!497723 () Bool)

(assert (=> b!497723 (= e!291717 Undefined!3939)))

(assert (= (and d!78375 c!59107) b!497723))

(assert (= (and d!78375 (not c!59107)) b!497719))

(assert (= (and b!497719 c!59106) b!497721))

(assert (= (and b!497719 (not c!59106)) b!497722))

(assert (= (and b!497722 c!59108) b!497720))

(assert (= (and b!497722 (not c!59108)) b!497718))

(assert (=> d!78375 m!479069))

(declare-fun m!479121 () Bool)

(assert (=> d!78375 m!479121))

(declare-fun m!479123 () Bool)

(assert (=> d!78375 m!479123))

(declare-fun m!479125 () Bool)

(assert (=> d!78375 m!479125))

(declare-fun m!479127 () Bool)

(assert (=> d!78375 m!479127))

(declare-fun m!479129 () Bool)

(assert (=> d!78375 m!479129))

(assert (=> d!78375 m!479121))

(declare-fun m!479131 () Bool)

(assert (=> b!497718 m!479131))

(declare-fun m!479133 () Bool)

(assert (=> b!497719 m!479133))

(assert (=> b!497657 d!78375))

(declare-fun d!78377 () Bool)

(declare-fun res!300061 () Bool)

(declare-fun e!291722 () Bool)

(assert (=> d!78377 (=> res!300061 e!291722)))

(assert (=> d!78377 (= res!300061 (= (select (arr!15472 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!78377 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!291722)))

(declare-fun b!497728 () Bool)

(declare-fun e!291723 () Bool)

(assert (=> b!497728 (= e!291722 e!291723)))

(declare-fun res!300062 () Bool)

(assert (=> b!497728 (=> (not res!300062) (not e!291723))))

(assert (=> b!497728 (= res!300062 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15836 a!3235)))))

(declare-fun b!497729 () Bool)

(assert (=> b!497729 (= e!291723 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!78377 (not res!300061)) b!497728))

(assert (= (and b!497728 res!300062) b!497729))

(declare-fun m!479135 () Bool)

(assert (=> d!78377 m!479135))

(declare-fun m!479137 () Bool)

(assert (=> b!497729 m!479137))

(assert (=> b!497656 d!78377))

(declare-fun d!78379 () Bool)

(declare-fun e!291726 () Bool)

(assert (=> d!78379 e!291726))

(declare-fun res!300065 () Bool)

(assert (=> d!78379 (=> (not res!300065) (not e!291726))))

(assert (=> d!78379 (= res!300065 (and (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15836 a!3235)) (and (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15836 a!3235)))) (or (bvslt i!1204 #b00000000000000000000000000000000) (bvsge i!1204 (size!15836 a!3235)) (and (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15836 a!3235)))) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15836 a!3235))))))

(declare-fun lt!225376 () Unit!14832)

(declare-fun choose!47 (array!32178 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14832)

(assert (=> d!78379 (= lt!225376 (choose!47 a!3235 i!1204 k0!2280 j!176 lt!225334 #b00000000000000000000000000000000 (index!17937 lt!225331) (x!46983 lt!225331) mask!3524))))

(assert (=> d!78379 (validMask!0 mask!3524)))

(assert (=> d!78379 (= (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!225334 #b00000000000000000000000000000000 (index!17937 lt!225331) (x!46983 lt!225331) mask!3524) lt!225376)))

(declare-fun b!497732 () Bool)

(assert (=> b!497732 (= e!291726 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225334 (select (store (arr!15472 a!3235) i!1204 k0!2280) j!176) (array!32179 (store (arr!15472 a!3235) i!1204 k0!2280) (size!15836 a!3235)) mask!3524) (Intermediate!3939 false (index!17937 lt!225331) (x!46983 lt!225331))))))

(assert (= (and d!78379 res!300065) b!497732))

(declare-fun m!479139 () Bool)

(assert (=> d!78379 m!479139))

(assert (=> d!78379 m!479069))

(assert (=> b!497732 m!479043))

(assert (=> b!497732 m!479045))

(assert (=> b!497732 m!479045))

(declare-fun m!479141 () Bool)

(assert (=> b!497732 m!479141))

(assert (=> b!497651 d!78379))

(declare-fun b!497757 () Bool)

(declare-fun lt!225381 () SeekEntryResult!3939)

(assert (=> b!497757 (and (bvsge (index!17937 lt!225381) #b00000000000000000000000000000000) (bvslt (index!17937 lt!225381) (size!15836 lt!225329)))))

(declare-fun res!300078 () Bool)

(assert (=> b!497757 (= res!300078 (= (select (arr!15472 lt!225329) (index!17937 lt!225381)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291743 () Bool)

(assert (=> b!497757 (=> res!300078 e!291743)))

(declare-fun b!497758 () Bool)

(assert (=> b!497758 (and (bvsge (index!17937 lt!225381) #b00000000000000000000000000000000) (bvslt (index!17937 lt!225381) (size!15836 lt!225329)))))

(declare-fun res!300080 () Bool)

(assert (=> b!497758 (= res!300080 (= (select (arr!15472 lt!225329) (index!17937 lt!225381)) lt!225330))))

(assert (=> b!497758 (=> res!300080 e!291743)))

(declare-fun e!291746 () Bool)

(assert (=> b!497758 (= e!291746 e!291743)))

(declare-fun d!78381 () Bool)

(declare-fun e!291745 () Bool)

(assert (=> d!78381 e!291745))

(declare-fun c!59117 () Bool)

(assert (=> d!78381 (= c!59117 (and ((_ is Intermediate!3939) lt!225381) (undefined!4751 lt!225381)))))

(declare-fun e!291744 () SeekEntryResult!3939)

(assert (=> d!78381 (= lt!225381 e!291744)))

(declare-fun c!59115 () Bool)

(assert (=> d!78381 (= c!59115 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225382 () (_ BitVec 64))

(assert (=> d!78381 (= lt!225382 (select (arr!15472 lt!225329) lt!225334))))

(assert (=> d!78381 (validMask!0 mask!3524)))

(assert (=> d!78381 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225334 lt!225330 lt!225329 mask!3524) lt!225381)))

(declare-fun b!497759 () Bool)

(declare-fun e!291747 () SeekEntryResult!3939)

(assert (=> b!497759 (= e!291747 (Intermediate!3939 false lt!225334 #b00000000000000000000000000000000))))

(declare-fun b!497760 () Bool)

(assert (=> b!497760 (= e!291745 (bvsge (x!46983 lt!225381) #b01111111111111111111111111111110))))

(declare-fun b!497761 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497761 (= e!291747 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225334 #b00000000000000000000000000000000 mask!3524) lt!225330 lt!225329 mask!3524))))

(declare-fun b!497762 () Bool)

(assert (=> b!497762 (= e!291745 e!291746)))

(declare-fun res!300079 () Bool)

(assert (=> b!497762 (= res!300079 (and ((_ is Intermediate!3939) lt!225381) (not (undefined!4751 lt!225381)) (bvslt (x!46983 lt!225381) #b01111111111111111111111111111110) (bvsge (x!46983 lt!225381) #b00000000000000000000000000000000) (bvsge (x!46983 lt!225381) #b00000000000000000000000000000000)))))

(assert (=> b!497762 (=> (not res!300079) (not e!291746))))

(declare-fun b!497763 () Bool)

(assert (=> b!497763 (= e!291744 e!291747)))

(declare-fun c!59116 () Bool)

(assert (=> b!497763 (= c!59116 (or (= lt!225382 lt!225330) (= (bvadd lt!225382 lt!225382) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497764 () Bool)

(assert (=> b!497764 (and (bvsge (index!17937 lt!225381) #b00000000000000000000000000000000) (bvslt (index!17937 lt!225381) (size!15836 lt!225329)))))

(assert (=> b!497764 (= e!291743 (= (select (arr!15472 lt!225329) (index!17937 lt!225381)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!497765 () Bool)

(assert (=> b!497765 (= e!291744 (Intermediate!3939 true lt!225334 #b00000000000000000000000000000000))))

(assert (= (and d!78381 c!59115) b!497765))

(assert (= (and d!78381 (not c!59115)) b!497763))

(assert (= (and b!497763 c!59116) b!497759))

(assert (= (and b!497763 (not c!59116)) b!497761))

(assert (= (and d!78381 c!59117) b!497760))

(assert (= (and d!78381 (not c!59117)) b!497762))

(assert (= (and b!497762 res!300079) b!497758))

(assert (= (and b!497758 (not res!300080)) b!497757))

(assert (= (and b!497757 (not res!300078)) b!497764))

(declare-fun m!479147 () Bool)

(assert (=> b!497761 m!479147))

(assert (=> b!497761 m!479147))

(declare-fun m!479149 () Bool)

(assert (=> b!497761 m!479149))

(declare-fun m!479151 () Bool)

(assert (=> b!497757 m!479151))

(assert (=> b!497758 m!479151))

(declare-fun m!479153 () Bool)

(assert (=> d!78381 m!479153))

(assert (=> d!78381 m!479069))

(assert (=> b!497764 m!479151))

(assert (=> b!497651 d!78381))

(declare-fun d!78389 () Bool)

(declare-fun lt!225394 () (_ BitVec 32))

(declare-fun lt!225393 () (_ BitVec 32))

(assert (=> d!78389 (= lt!225394 (bvmul (bvxor lt!225393 (bvlshr lt!225393 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78389 (= lt!225393 ((_ extract 31 0) (bvand (bvxor lt!225330 (bvlshr lt!225330 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78389 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!300081 (let ((h!10499 ((_ extract 31 0) (bvand (bvxor lt!225330 (bvlshr lt!225330 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46987 (bvmul (bvxor h!10499 (bvlshr h!10499 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46987 (bvlshr x!46987 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!300081 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!300081 #b00000000000000000000000000000000))))))

(assert (=> d!78389 (= (toIndex!0 lt!225330 mask!3524) (bvand (bvxor lt!225394 (bvlshr lt!225394 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!497650 d!78389))

(declare-fun b!497778 () Bool)

(declare-fun lt!225395 () SeekEntryResult!3939)

(assert (=> b!497778 (and (bvsge (index!17937 lt!225395) #b00000000000000000000000000000000) (bvslt (index!17937 lt!225395) (size!15836 a!3235)))))

(declare-fun res!300082 () Bool)

(assert (=> b!497778 (= res!300082 (= (select (arr!15472 a!3235) (index!17937 lt!225395)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291754 () Bool)

(assert (=> b!497778 (=> res!300082 e!291754)))

(declare-fun b!497779 () Bool)

(assert (=> b!497779 (and (bvsge (index!17937 lt!225395) #b00000000000000000000000000000000) (bvslt (index!17937 lt!225395) (size!15836 a!3235)))))

(declare-fun res!300084 () Bool)

(assert (=> b!497779 (= res!300084 (= (select (arr!15472 a!3235) (index!17937 lt!225395)) (select (arr!15472 a!3235) j!176)))))

(assert (=> b!497779 (=> res!300084 e!291754)))

(declare-fun e!291757 () Bool)

(assert (=> b!497779 (= e!291757 e!291754)))

(declare-fun d!78391 () Bool)

(declare-fun e!291756 () Bool)

(assert (=> d!78391 e!291756))

(declare-fun c!59126 () Bool)

(assert (=> d!78391 (= c!59126 (and ((_ is Intermediate!3939) lt!225395) (undefined!4751 lt!225395)))))

(declare-fun e!291755 () SeekEntryResult!3939)

(assert (=> d!78391 (= lt!225395 e!291755)))

(declare-fun c!59124 () Bool)

(assert (=> d!78391 (= c!59124 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225396 () (_ BitVec 64))

(assert (=> d!78391 (= lt!225396 (select (arr!15472 a!3235) lt!225334))))

(assert (=> d!78391 (validMask!0 mask!3524)))

(assert (=> d!78391 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225334 (select (arr!15472 a!3235) j!176) a!3235 mask!3524) lt!225395)))

(declare-fun b!497780 () Bool)

(declare-fun e!291758 () SeekEntryResult!3939)

(assert (=> b!497780 (= e!291758 (Intermediate!3939 false lt!225334 #b00000000000000000000000000000000))))

(declare-fun b!497781 () Bool)

(assert (=> b!497781 (= e!291756 (bvsge (x!46983 lt!225395) #b01111111111111111111111111111110))))

(declare-fun b!497782 () Bool)

(assert (=> b!497782 (= e!291758 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225334 #b00000000000000000000000000000000 mask!3524) (select (arr!15472 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!497783 () Bool)

(assert (=> b!497783 (= e!291756 e!291757)))

(declare-fun res!300083 () Bool)

(assert (=> b!497783 (= res!300083 (and ((_ is Intermediate!3939) lt!225395) (not (undefined!4751 lt!225395)) (bvslt (x!46983 lt!225395) #b01111111111111111111111111111110) (bvsge (x!46983 lt!225395) #b00000000000000000000000000000000) (bvsge (x!46983 lt!225395) #b00000000000000000000000000000000)))))

(assert (=> b!497783 (=> (not res!300083) (not e!291757))))

(declare-fun b!497784 () Bool)

(assert (=> b!497784 (= e!291755 e!291758)))

(declare-fun c!59125 () Bool)

(assert (=> b!497784 (= c!59125 (or (= lt!225396 (select (arr!15472 a!3235) j!176)) (= (bvadd lt!225396 lt!225396) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497785 () Bool)

(assert (=> b!497785 (and (bvsge (index!17937 lt!225395) #b00000000000000000000000000000000) (bvslt (index!17937 lt!225395) (size!15836 a!3235)))))

(assert (=> b!497785 (= e!291754 (= (select (arr!15472 a!3235) (index!17937 lt!225395)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!497786 () Bool)

(assert (=> b!497786 (= e!291755 (Intermediate!3939 true lt!225334 #b00000000000000000000000000000000))))

(assert (= (and d!78391 c!59124) b!497786))

(assert (= (and d!78391 (not c!59124)) b!497784))

(assert (= (and b!497784 c!59125) b!497780))

(assert (= (and b!497784 (not c!59125)) b!497782))

(assert (= (and d!78391 c!59126) b!497781))

(assert (= (and d!78391 (not c!59126)) b!497783))

(assert (= (and b!497783 res!300083) b!497779))

(assert (= (and b!497779 (not res!300084)) b!497778))

(assert (= (and b!497778 (not res!300082)) b!497785))

(assert (=> b!497782 m!479147))

(assert (=> b!497782 m!479147))

(assert (=> b!497782 m!479047))

(declare-fun m!479155 () Bool)

(assert (=> b!497782 m!479155))

(declare-fun m!479157 () Bool)

(assert (=> b!497778 m!479157))

(assert (=> b!497779 m!479157))

(declare-fun m!479161 () Bool)

(assert (=> d!78391 m!479161))

(assert (=> d!78391 m!479069))

(assert (=> b!497785 m!479157))

(assert (=> b!497650 d!78391))

(declare-fun d!78393 () Bool)

(declare-fun lt!225401 () (_ BitVec 32))

(declare-fun lt!225400 () (_ BitVec 32))

(assert (=> d!78393 (= lt!225401 (bvmul (bvxor lt!225400 (bvlshr lt!225400 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!78393 (= lt!225400 ((_ extract 31 0) (bvand (bvxor (select (arr!15472 a!3235) j!176) (bvlshr (select (arr!15472 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!78393 (and (bvsge mask!3524 #b00000000000000000000000000000000) (let ((res!300081 (let ((h!10499 ((_ extract 31 0) (bvand (bvxor (select (arr!15472 a!3235) j!176) (bvlshr (select (arr!15472 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!46987 (bvmul (bvxor h!10499 (bvlshr h!10499 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!46987 (bvlshr x!46987 #b00000000000000000000000000001101)) mask!3524))))) (and (bvslt res!300081 (bvadd mask!3524 #b00000000000000000000000000000001)) (bvsge res!300081 #b00000000000000000000000000000000))))))

(assert (=> d!78393 (= (toIndex!0 (select (arr!15472 a!3235) j!176) mask!3524) (bvand (bvxor lt!225401 (bvlshr lt!225401 #b00000000000000000000000000001101)) mask!3524))))

(assert (=> b!497650 d!78393))

(declare-fun d!78397 () Bool)

(declare-fun res!300101 () Bool)

(declare-fun e!291788 () Bool)

(assert (=> d!78397 (=> res!300101 e!291788)))

(assert (=> d!78397 (= res!300101 (bvsge j!176 (size!15836 a!3235)))))

(assert (=> d!78397 (= (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524) e!291788)))

(declare-fun b!497831 () Bool)

(declare-fun e!291789 () Bool)

(declare-fun e!291787 () Bool)

(assert (=> b!497831 (= e!291789 e!291787)))

(declare-fun lt!225421 () (_ BitVec 64))

(assert (=> b!497831 (= lt!225421 (select (arr!15472 a!3235) j!176))))

(declare-fun lt!225422 () Unit!14832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!32178 (_ BitVec 64) (_ BitVec 32)) Unit!14832)

(assert (=> b!497831 (= lt!225422 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!225421 j!176))))

(assert (=> b!497831 (arrayContainsKey!0 a!3235 lt!225421 #b00000000000000000000000000000000)))

(declare-fun lt!225423 () Unit!14832)

(assert (=> b!497831 (= lt!225423 lt!225422)))

(declare-fun res!300102 () Bool)

(assert (=> b!497831 (= res!300102 (= (seekEntryOrOpen!0 (select (arr!15472 a!3235) j!176) a!3235 mask!3524) (Found!3939 j!176)))))

(assert (=> b!497831 (=> (not res!300102) (not e!291787))))

(declare-fun b!497832 () Bool)

(declare-fun call!31436 () Bool)

(assert (=> b!497832 (= e!291789 call!31436)))

(declare-fun b!497833 () Bool)

(assert (=> b!497833 (= e!291787 call!31436)))

(declare-fun bm!31433 () Bool)

(assert (=> bm!31433 (= call!31436 (arrayForallSeekEntryOrOpenFound!0 (bvadd j!176 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!497834 () Bool)

(assert (=> b!497834 (= e!291788 e!291789)))

(declare-fun c!59141 () Bool)

(assert (=> b!497834 (= c!59141 (validKeyInArray!0 (select (arr!15472 a!3235) j!176)))))

(assert (= (and d!78397 (not res!300101)) b!497834))

(assert (= (and b!497834 c!59141) b!497831))

(assert (= (and b!497834 (not c!59141)) b!497832))

(assert (= (and b!497831 res!300102) b!497833))

(assert (= (or b!497833 b!497832) bm!31433))

(assert (=> b!497831 m!479047))

(declare-fun m!479181 () Bool)

(assert (=> b!497831 m!479181))

(declare-fun m!479185 () Bool)

(assert (=> b!497831 m!479185))

(assert (=> b!497831 m!479047))

(assert (=> b!497831 m!479075))

(declare-fun m!479189 () Bool)

(assert (=> bm!31433 m!479189))

(assert (=> b!497834 m!479047))

(assert (=> b!497834 m!479047))

(assert (=> b!497834 m!479073))

(assert (=> b!497650 d!78397))

(declare-fun d!78401 () Bool)

(assert (=> d!78401 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!225428 () Unit!14832)

(declare-fun choose!38 (array!32178 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14832)

(assert (=> d!78401 (= lt!225428 (choose!38 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (=> d!78401 (validMask!0 mask!3524)))

(assert (=> d!78401 (= (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176) lt!225428)))

(declare-fun bs!15853 () Bool)

(assert (= bs!15853 d!78401))

(assert (=> bs!15853 m!479055))

(declare-fun m!479199 () Bool)

(assert (=> bs!15853 m!479199))

(assert (=> bs!15853 m!479069))

(assert (=> b!497650 d!78401))

(declare-fun b!497844 () Bool)

(declare-fun lt!225429 () SeekEntryResult!3939)

(assert (=> b!497844 (and (bvsge (index!17937 lt!225429) #b00000000000000000000000000000000) (bvslt (index!17937 lt!225429) (size!15836 lt!225329)))))

(declare-fun res!300107 () Bool)

(assert (=> b!497844 (= res!300107 (= (select (arr!15472 lt!225329) (index!17937 lt!225429)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!291795 () Bool)

(assert (=> b!497844 (=> res!300107 e!291795)))

(declare-fun b!497845 () Bool)

(assert (=> b!497845 (and (bvsge (index!17937 lt!225429) #b00000000000000000000000000000000) (bvslt (index!17937 lt!225429) (size!15836 lt!225329)))))

(declare-fun res!300109 () Bool)

(assert (=> b!497845 (= res!300109 (= (select (arr!15472 lt!225329) (index!17937 lt!225429)) lt!225330))))

(assert (=> b!497845 (=> res!300109 e!291795)))

(declare-fun e!291798 () Bool)

(assert (=> b!497845 (= e!291798 e!291795)))

(declare-fun d!78405 () Bool)

(declare-fun e!291797 () Bool)

(assert (=> d!78405 e!291797))

(declare-fun c!59147 () Bool)

(assert (=> d!78405 (= c!59147 (and ((_ is Intermediate!3939) lt!225429) (undefined!4751 lt!225429)))))

(declare-fun e!291796 () SeekEntryResult!3939)

(assert (=> d!78405 (= lt!225429 e!291796)))

(declare-fun c!59145 () Bool)

(assert (=> d!78405 (= c!59145 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!225430 () (_ BitVec 64))

(assert (=> d!78405 (= lt!225430 (select (arr!15472 lt!225329) lt!225332))))

(assert (=> d!78405 (validMask!0 mask!3524)))

(assert (=> d!78405 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!225332 lt!225330 lt!225329 mask!3524) lt!225429)))

(declare-fun b!497846 () Bool)

(declare-fun e!291799 () SeekEntryResult!3939)

(assert (=> b!497846 (= e!291799 (Intermediate!3939 false lt!225332 #b00000000000000000000000000000000))))

(declare-fun b!497847 () Bool)

(assert (=> b!497847 (= e!291797 (bvsge (x!46983 lt!225429) #b01111111111111111111111111111110))))

(declare-fun b!497848 () Bool)

(assert (=> b!497848 (= e!291799 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 lt!225332 #b00000000000000000000000000000000 mask!3524) lt!225330 lt!225329 mask!3524))))

(declare-fun b!497849 () Bool)

(assert (=> b!497849 (= e!291797 e!291798)))

(declare-fun res!300108 () Bool)

(assert (=> b!497849 (= res!300108 (and ((_ is Intermediate!3939) lt!225429) (not (undefined!4751 lt!225429)) (bvslt (x!46983 lt!225429) #b01111111111111111111111111111110) (bvsge (x!46983 lt!225429) #b00000000000000000000000000000000) (bvsge (x!46983 lt!225429) #b00000000000000000000000000000000)))))

(assert (=> b!497849 (=> (not res!300108) (not e!291798))))

(declare-fun b!497850 () Bool)

(assert (=> b!497850 (= e!291796 e!291799)))

(declare-fun c!59146 () Bool)

(assert (=> b!497850 (= c!59146 (or (= lt!225430 lt!225330) (= (bvadd lt!225430 lt!225430) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497851 () Bool)

(assert (=> b!497851 (and (bvsge (index!17937 lt!225429) #b00000000000000000000000000000000) (bvslt (index!17937 lt!225429) (size!15836 lt!225329)))))

(assert (=> b!497851 (= e!291795 (= (select (arr!15472 lt!225329) (index!17937 lt!225429)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!497852 () Bool)

(assert (=> b!497852 (= e!291796 (Intermediate!3939 true lt!225332 #b00000000000000000000000000000000))))

(assert (= (and d!78405 c!59145) b!497852))

(assert (= (and d!78405 (not c!59145)) b!497850))

(assert (= (and b!497850 c!59146) b!497846))

(assert (= (and b!497850 (not c!59146)) b!497848))

(assert (= (and d!78405 c!59147) b!497847))

(assert (= (and d!78405 (not c!59147)) b!497849))

(assert (= (and b!497849 res!300108) b!497845))

(assert (= (and b!497845 (not res!300109)) b!497844))

(assert (= (and b!497844 (not res!300107)) b!497851))

(declare-fun m!479201 () Bool)

(assert (=> b!497848 m!479201))

(assert (=> b!497848 m!479201))

(declare-fun m!479203 () Bool)

(assert (=> b!497848 m!479203))

(declare-fun m!479205 () Bool)

(assert (=> b!497844 m!479205))

(assert (=> b!497845 m!479205))

(declare-fun m!479207 () Bool)

(assert (=> d!78405 m!479207))

(assert (=> d!78405 m!479069))

(assert (=> b!497851 m!479205))

(assert (=> b!497650 d!78405))

(declare-fun d!78407 () Bool)

(declare-fun res!300110 () Bool)

(declare-fun e!291801 () Bool)

(assert (=> d!78407 (=> res!300110 e!291801)))

(assert (=> d!78407 (= res!300110 (bvsge #b00000000000000000000000000000000 (size!15836 a!3235)))))

(assert (=> d!78407 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!291801)))

(declare-fun b!497853 () Bool)

(declare-fun e!291802 () Bool)

(declare-fun e!291800 () Bool)

(assert (=> b!497853 (= e!291802 e!291800)))

(declare-fun lt!225431 () (_ BitVec 64))

(assert (=> b!497853 (= lt!225431 (select (arr!15472 a!3235) #b00000000000000000000000000000000))))

(declare-fun lt!225432 () Unit!14832)

(assert (=> b!497853 (= lt!225432 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!225431 #b00000000000000000000000000000000))))

(assert (=> b!497853 (arrayContainsKey!0 a!3235 lt!225431 #b00000000000000000000000000000000)))

(declare-fun lt!225433 () Unit!14832)

(assert (=> b!497853 (= lt!225433 lt!225432)))

(declare-fun res!300111 () Bool)

(assert (=> b!497853 (= res!300111 (= (seekEntryOrOpen!0 (select (arr!15472 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3939 #b00000000000000000000000000000000)))))

(assert (=> b!497853 (=> (not res!300111) (not e!291800))))

(declare-fun b!497854 () Bool)

(declare-fun call!31437 () Bool)

(assert (=> b!497854 (= e!291802 call!31437)))

(declare-fun b!497855 () Bool)

(assert (=> b!497855 (= e!291800 call!31437)))

(declare-fun bm!31434 () Bool)

(assert (=> bm!31434 (= call!31437 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!497856 () Bool)

(assert (=> b!497856 (= e!291801 e!291802)))

(declare-fun c!59148 () Bool)

(assert (=> b!497856 (= c!59148 (validKeyInArray!0 (select (arr!15472 a!3235) #b00000000000000000000000000000000)))))

(assert (= (and d!78407 (not res!300110)) b!497856))

(assert (= (and b!497856 c!59148) b!497853))

(assert (= (and b!497856 (not c!59148)) b!497854))

(assert (= (and b!497853 res!300111) b!497855))

(assert (= (or b!497855 b!497854) bm!31434))

(assert (=> b!497853 m!479135))

(declare-fun m!479209 () Bool)

(assert (=> b!497853 m!479209))

(declare-fun m!479211 () Bool)

(assert (=> b!497853 m!479211))

(assert (=> b!497853 m!479135))

(declare-fun m!479213 () Bool)

(assert (=> b!497853 m!479213))

(declare-fun m!479215 () Bool)

(assert (=> bm!31434 m!479215))

(assert (=> b!497856 m!479135))

(assert (=> b!497856 m!479135))

(declare-fun m!479217 () Bool)

(assert (=> b!497856 m!479217))

(assert (=> b!497661 d!78407))

(declare-fun d!78409 () Bool)

(assert (=> d!78409 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!45290 d!78409))

(declare-fun d!78415 () Bool)

(assert (=> d!78415 (= (array_inv!11268 a!3235) (bvsge (size!15836 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!45290 d!78415))

(declare-fun d!78417 () Bool)

(assert (=> d!78417 (= (validKeyInArray!0 (select (arr!15472 a!3235) j!176)) (and (not (= (select (arr!15472 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15472 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!497655 d!78417))

(declare-fun b!497891 () Bool)

(declare-fun e!291828 () Bool)

(declare-fun e!291829 () Bool)

(assert (=> b!497891 (= e!291828 e!291829)))

(declare-fun c!59157 () Bool)

(assert (=> b!497891 (= c!59157 (validKeyInArray!0 (select (arr!15472 a!3235) #b00000000000000000000000000000000)))))

(declare-fun d!78419 () Bool)

(declare-fun res!300130 () Bool)

(declare-fun e!291830 () Bool)

(assert (=> d!78419 (=> res!300130 e!291830)))

(assert (=> d!78419 (= res!300130 (bvsge #b00000000000000000000000000000000 (size!15836 a!3235)))))

(assert (=> d!78419 (= (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9627) e!291830)))

(declare-fun b!497892 () Bool)

(assert (=> b!497892 (= e!291830 e!291828)))

(declare-fun res!300131 () Bool)

(assert (=> b!497892 (=> (not res!300131) (not e!291828))))

(declare-fun e!291831 () Bool)

(assert (=> b!497892 (= res!300131 (not e!291831))))

(declare-fun res!300132 () Bool)

(assert (=> b!497892 (=> (not res!300132) (not e!291831))))

(assert (=> b!497892 (= res!300132 (validKeyInArray!0 (select (arr!15472 a!3235) #b00000000000000000000000000000000)))))

(declare-fun bm!31440 () Bool)

(declare-fun call!31443 () Bool)

(assert (=> bm!31440 (= call!31443 (arrayNoDuplicates!0 a!3235 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!59157 (Cons!9626 (select (arr!15472 a!3235) #b00000000000000000000000000000000) Nil!9627) Nil!9627)))))

(declare-fun b!497893 () Bool)

(assert (=> b!497893 (= e!291829 call!31443)))

(declare-fun b!497894 () Bool)

(declare-fun contains!2716 (List!9630 (_ BitVec 64)) Bool)

(assert (=> b!497894 (= e!291831 (contains!2716 Nil!9627 (select (arr!15472 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!497895 () Bool)

(assert (=> b!497895 (= e!291829 call!31443)))

(assert (= (and d!78419 (not res!300130)) b!497892))

(assert (= (and b!497892 res!300132) b!497894))

(assert (= (and b!497892 res!300131) b!497891))

(assert (= (and b!497891 c!59157) b!497893))

(assert (= (and b!497891 (not c!59157)) b!497895))

(assert (= (or b!497893 b!497895) bm!31440))

(assert (=> b!497891 m!479135))

(assert (=> b!497891 m!479135))

(assert (=> b!497891 m!479217))

(assert (=> b!497892 m!479135))

(assert (=> b!497892 m!479135))

(assert (=> b!497892 m!479217))

(assert (=> bm!31440 m!479135))

(declare-fun m!479237 () Bool)

(assert (=> bm!31440 m!479237))

(assert (=> b!497894 m!479135))

(assert (=> b!497894 m!479135))

(declare-fun m!479239 () Bool)

(assert (=> b!497894 m!479239))

(assert (=> b!497654 d!78419))

(declare-fun d!78427 () Bool)

(assert (=> d!78427 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!497658 d!78427))

(declare-fun d!78429 () Bool)

(declare-fun lt!225456 () SeekEntryResult!3939)

(assert (=> d!78429 (and (or ((_ is Undefined!3939) lt!225456) (not ((_ is Found!3939) lt!225456)) (and (bvsge (index!17936 lt!225456) #b00000000000000000000000000000000) (bvslt (index!17936 lt!225456) (size!15836 a!3235)))) (or ((_ is Undefined!3939) lt!225456) ((_ is Found!3939) lt!225456) (not ((_ is MissingZero!3939) lt!225456)) (and (bvsge (index!17935 lt!225456) #b00000000000000000000000000000000) (bvslt (index!17935 lt!225456) (size!15836 a!3235)))) (or ((_ is Undefined!3939) lt!225456) ((_ is Found!3939) lt!225456) ((_ is MissingZero!3939) lt!225456) (not ((_ is MissingVacant!3939) lt!225456)) (and (bvsge (index!17938 lt!225456) #b00000000000000000000000000000000) (bvslt (index!17938 lt!225456) (size!15836 a!3235)))) (or ((_ is Undefined!3939) lt!225456) (ite ((_ is Found!3939) lt!225456) (= (select (arr!15472 a!3235) (index!17936 lt!225456)) (select (arr!15472 a!3235) j!176)) (ite ((_ is MissingZero!3939) lt!225456) (= (select (arr!15472 a!3235) (index!17935 lt!225456)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3939) lt!225456) (= (select (arr!15472 a!3235) (index!17938 lt!225456)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!291834 () SeekEntryResult!3939)

(assert (=> d!78429 (= lt!225456 e!291834)))

(declare-fun c!59159 () Bool)

(declare-fun lt!225458 () SeekEntryResult!3939)

(assert (=> d!78429 (= c!59159 (and ((_ is Intermediate!3939) lt!225458) (undefined!4751 lt!225458)))))

(assert (=> d!78429 (= lt!225458 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15472 a!3235) j!176) mask!3524) (select (arr!15472 a!3235) j!176) a!3235 mask!3524))))

(assert (=> d!78429 (validMask!0 mask!3524)))

(assert (=> d!78429 (= (seekEntryOrOpen!0 (select (arr!15472 a!3235) j!176) a!3235 mask!3524) lt!225456)))

(declare-fun b!497896 () Bool)

(declare-fun e!291833 () SeekEntryResult!3939)

(assert (=> b!497896 (= e!291833 (seekKeyOrZeroReturnVacant!0 (x!46983 lt!225458) (index!17937 lt!225458) (index!17937 lt!225458) (select (arr!15472 a!3235) j!176) a!3235 mask!3524))))

(declare-fun b!497897 () Bool)

(declare-fun e!291832 () SeekEntryResult!3939)

(assert (=> b!497897 (= e!291834 e!291832)))

(declare-fun lt!225457 () (_ BitVec 64))

(assert (=> b!497897 (= lt!225457 (select (arr!15472 a!3235) (index!17937 lt!225458)))))

(declare-fun c!59158 () Bool)

(assert (=> b!497897 (= c!59158 (= lt!225457 (select (arr!15472 a!3235) j!176)))))

(declare-fun b!497898 () Bool)

(assert (=> b!497898 (= e!291833 (MissingZero!3939 (index!17937 lt!225458)))))

(declare-fun b!497899 () Bool)

(assert (=> b!497899 (= e!291832 (Found!3939 (index!17937 lt!225458)))))

(declare-fun b!497900 () Bool)

(declare-fun c!59160 () Bool)

(assert (=> b!497900 (= c!59160 (= lt!225457 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!497900 (= e!291832 e!291833)))

(declare-fun b!497901 () Bool)

(assert (=> b!497901 (= e!291834 Undefined!3939)))

(assert (= (and d!78429 c!59159) b!497901))

(assert (= (and d!78429 (not c!59159)) b!497897))

(assert (= (and b!497897 c!59158) b!497899))

(assert (= (and b!497897 (not c!59158)) b!497900))

(assert (= (and b!497900 c!59160) b!497898))

(assert (= (and b!497900 (not c!59160)) b!497896))

(assert (=> d!78429 m!479069))

(assert (=> d!78429 m!479053))

(assert (=> d!78429 m!479047))

(declare-fun m!479241 () Bool)

(assert (=> d!78429 m!479241))

(declare-fun m!479243 () Bool)

(assert (=> d!78429 m!479243))

(declare-fun m!479245 () Bool)

(assert (=> d!78429 m!479245))

(declare-fun m!479247 () Bool)

(assert (=> d!78429 m!479247))

(assert (=> d!78429 m!479047))

(assert (=> d!78429 m!479053))

(assert (=> b!497896 m!479047))

(declare-fun m!479249 () Bool)

(assert (=> b!497896 m!479249))

(declare-fun m!479251 () Bool)

(assert (=> b!497897 m!479251))

(assert (=> b!497652 d!78429))

(check-sat (not b!497831) (not b!497896) (not b!497856) (not b!497892) (not b!497732) (not bm!31434) (not b!497729) (not d!78375) (not b!497891) (not d!78381) (not b!497761) (not d!78401) (not b!497848) (not b!497718) (not b!497894) (not b!497834) (not d!78379) (not bm!31433) (not d!78405) (not b!497853) (not d!78391) (not bm!31440) (not b!497782) (not d!78429))
(check-sat)
