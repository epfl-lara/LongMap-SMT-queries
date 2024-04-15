; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47760 () Bool)

(assert start!47760)

(declare-fun b!525741 () Bool)

(declare-fun res!322577 () Bool)

(declare-fun e!306477 () Bool)

(assert (=> b!525741 (=> (not res!322577) (not e!306477))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!33407 0))(
  ( (array!33408 (arr!16055 (Array (_ BitVec 32) (_ BitVec 64))) (size!16420 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33407)

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!525741 (= res!322577 (and (= (size!16420 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16420 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16420 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525742 () Bool)

(declare-fun e!306473 () Bool)

(assert (=> b!525742 (= e!306473 false)))

(declare-fun b!525743 () Bool)

(declare-fun res!322570 () Bool)

(assert (=> b!525743 (=> (not res!322570) (not e!306477))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525743 (= res!322570 (validKeyInArray!0 (select (arr!16055 a!3235) j!176)))))

(declare-fun b!525744 () Bool)

(declare-fun res!322574 () Bool)

(declare-fun e!306476 () Bool)

(assert (=> b!525744 (=> (not res!322574) (not e!306476))))

(declare-datatypes ((List!10252 0))(
  ( (Nil!10249) (Cons!10248 (h!11179 (_ BitVec 64)) (t!16471 List!10252)) )
))
(declare-fun arrayNoDuplicates!0 (array!33407 (_ BitVec 32) List!10252) Bool)

(assert (=> b!525744 (= res!322574 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10249))))

(declare-fun b!525745 () Bool)

(declare-datatypes ((Unit!16522 0))(
  ( (Unit!16523) )
))
(declare-fun e!306471 () Unit!16522)

(declare-fun Unit!16524 () Unit!16522)

(assert (=> b!525745 (= e!306471 Unit!16524)))

(declare-fun b!525746 () Bool)

(declare-fun res!322572 () Bool)

(declare-fun e!306475 () Bool)

(assert (=> b!525746 (=> res!322572 e!306475)))

(declare-datatypes ((SeekEntryResult!4519 0))(
  ( (MissingZero!4519 (index!20288 (_ BitVec 32))) (Found!4519 (index!20289 (_ BitVec 32))) (Intermediate!4519 (undefined!5331 Bool) (index!20290 (_ BitVec 32)) (x!49271 (_ BitVec 32))) (Undefined!4519) (MissingVacant!4519 (index!20291 (_ BitVec 32))) )
))
(declare-fun lt!241579 () SeekEntryResult!4519)

(get-info :version)

(assert (=> b!525746 (= res!322572 (or (undefined!5331 lt!241579) (not ((_ is Intermediate!4519) lt!241579))))))

(declare-fun b!525747 () Bool)

(declare-fun res!322566 () Bool)

(assert (=> b!525747 (=> (not res!322566) (not e!306477))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525747 (= res!322566 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525748 () Bool)

(declare-fun res!322576 () Bool)

(assert (=> b!525748 (=> (not res!322576) (not e!306477))))

(assert (=> b!525748 (= res!322576 (validKeyInArray!0 k0!2280))))

(declare-fun res!322573 () Bool)

(assert (=> start!47760 (=> (not res!322573) (not e!306477))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47760 (= res!322573 (validMask!0 mask!3524))))

(assert (=> start!47760 e!306477))

(assert (=> start!47760 true))

(declare-fun array_inv!11938 (array!33407) Bool)

(assert (=> start!47760 (array_inv!11938 a!3235)))

(declare-fun b!525749 () Bool)

(declare-fun res!322571 () Bool)

(assert (=> b!525749 (=> (not res!322571) (not e!306476))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33407 (_ BitVec 32)) Bool)

(assert (=> b!525749 (= res!322571 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525750 () Bool)

(declare-fun Unit!16525 () Unit!16522)

(assert (=> b!525750 (= e!306471 Unit!16525)))

(declare-fun lt!241573 () Unit!16522)

(declare-fun lt!241572 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33407 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16522)

(assert (=> b!525750 (= lt!241573 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241572 #b00000000000000000000000000000000 (index!20290 lt!241579) (x!49271 lt!241579) mask!3524))))

(declare-fun res!322575 () Bool)

(declare-fun lt!241571 () (_ BitVec 64))

(declare-fun lt!241570 () array!33407)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33407 (_ BitVec 32)) SeekEntryResult!4519)

(assert (=> b!525750 (= res!322575 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241572 lt!241571 lt!241570 mask!3524) (Intermediate!4519 false (index!20290 lt!241579) (x!49271 lt!241579))))))

(assert (=> b!525750 (=> (not res!322575) (not e!306473))))

(assert (=> b!525750 e!306473))

(declare-fun b!525751 () Bool)

(assert (=> b!525751 (= e!306475 true)))

(assert (=> b!525751 (= (index!20290 lt!241579) i!1204)))

(declare-fun lt!241578 () Unit!16522)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33407 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16522)

(assert (=> b!525751 (= lt!241578 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241572 #b00000000000000000000000000000000 (index!20290 lt!241579) (x!49271 lt!241579) mask!3524))))

(assert (=> b!525751 (and (or (= (select (arr!16055 a!3235) (index!20290 lt!241579)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16055 a!3235) (index!20290 lt!241579)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16055 a!3235) (index!20290 lt!241579)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16055 a!3235) (index!20290 lt!241579)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241575 () Unit!16522)

(assert (=> b!525751 (= lt!241575 e!306471)))

(declare-fun c!61893 () Bool)

(assert (=> b!525751 (= c!61893 (= (select (arr!16055 a!3235) (index!20290 lt!241579)) (select (arr!16055 a!3235) j!176)))))

(assert (=> b!525751 (and (bvslt (x!49271 lt!241579) #b01111111111111111111111111111110) (or (= (select (arr!16055 a!3235) (index!20290 lt!241579)) (select (arr!16055 a!3235) j!176)) (= (select (arr!16055 a!3235) (index!20290 lt!241579)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16055 a!3235) (index!20290 lt!241579)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525752 () Bool)

(assert (=> b!525752 (= e!306476 (not e!306475))))

(declare-fun res!322567 () Bool)

(assert (=> b!525752 (=> res!322567 e!306475)))

(declare-fun lt!241576 () (_ BitVec 32))

(assert (=> b!525752 (= res!322567 (= lt!241579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241576 lt!241571 lt!241570 mask!3524)))))

(assert (=> b!525752 (= lt!241579 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241572 (select (arr!16055 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525752 (= lt!241576 (toIndex!0 lt!241571 mask!3524))))

(assert (=> b!525752 (= lt!241571 (select (store (arr!16055 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525752 (= lt!241572 (toIndex!0 (select (arr!16055 a!3235) j!176) mask!3524))))

(assert (=> b!525752 (= lt!241570 (array!33408 (store (arr!16055 a!3235) i!1204 k0!2280) (size!16420 a!3235)))))

(declare-fun e!306472 () Bool)

(assert (=> b!525752 e!306472))

(declare-fun res!322568 () Bool)

(assert (=> b!525752 (=> (not res!322568) (not e!306472))))

(assert (=> b!525752 (= res!322568 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241574 () Unit!16522)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33407 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16522)

(assert (=> b!525752 (= lt!241574 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525753 () Bool)

(assert (=> b!525753 (= e!306477 e!306476)))

(declare-fun res!322569 () Bool)

(assert (=> b!525753 (=> (not res!322569) (not e!306476))))

(declare-fun lt!241577 () SeekEntryResult!4519)

(assert (=> b!525753 (= res!322569 (or (= lt!241577 (MissingZero!4519 i!1204)) (= lt!241577 (MissingVacant!4519 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33407 (_ BitVec 32)) SeekEntryResult!4519)

(assert (=> b!525753 (= lt!241577 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525754 () Bool)

(assert (=> b!525754 (= e!306472 (= (seekEntryOrOpen!0 (select (arr!16055 a!3235) j!176) a!3235 mask!3524) (Found!4519 j!176)))))

(assert (= (and start!47760 res!322573) b!525741))

(assert (= (and b!525741 res!322577) b!525743))

(assert (= (and b!525743 res!322570) b!525748))

(assert (= (and b!525748 res!322576) b!525747))

(assert (= (and b!525747 res!322566) b!525753))

(assert (= (and b!525753 res!322569) b!525749))

(assert (= (and b!525749 res!322571) b!525744))

(assert (= (and b!525744 res!322574) b!525752))

(assert (= (and b!525752 res!322568) b!525754))

(assert (= (and b!525752 (not res!322567)) b!525746))

(assert (= (and b!525746 (not res!322572)) b!525751))

(assert (= (and b!525751 c!61893) b!525750))

(assert (= (and b!525751 (not c!61893)) b!525745))

(assert (= (and b!525750 res!322575) b!525742))

(declare-fun m!505945 () Bool)

(assert (=> b!525754 m!505945))

(assert (=> b!525754 m!505945))

(declare-fun m!505947 () Bool)

(assert (=> b!525754 m!505947))

(declare-fun m!505949 () Bool)

(assert (=> start!47760 m!505949))

(declare-fun m!505951 () Bool)

(assert (=> start!47760 m!505951))

(declare-fun m!505953 () Bool)

(assert (=> b!525753 m!505953))

(declare-fun m!505955 () Bool)

(assert (=> b!525752 m!505955))

(declare-fun m!505957 () Bool)

(assert (=> b!525752 m!505957))

(declare-fun m!505959 () Bool)

(assert (=> b!525752 m!505959))

(assert (=> b!525752 m!505945))

(declare-fun m!505961 () Bool)

(assert (=> b!525752 m!505961))

(assert (=> b!525752 m!505945))

(declare-fun m!505963 () Bool)

(assert (=> b!525752 m!505963))

(assert (=> b!525752 m!505945))

(declare-fun m!505965 () Bool)

(assert (=> b!525752 m!505965))

(declare-fun m!505967 () Bool)

(assert (=> b!525752 m!505967))

(declare-fun m!505969 () Bool)

(assert (=> b!525752 m!505969))

(declare-fun m!505971 () Bool)

(assert (=> b!525751 m!505971))

(declare-fun m!505973 () Bool)

(assert (=> b!525751 m!505973))

(assert (=> b!525751 m!505945))

(declare-fun m!505975 () Bool)

(assert (=> b!525747 m!505975))

(assert (=> b!525743 m!505945))

(assert (=> b!525743 m!505945))

(declare-fun m!505977 () Bool)

(assert (=> b!525743 m!505977))

(declare-fun m!505979 () Bool)

(assert (=> b!525749 m!505979))

(declare-fun m!505981 () Bool)

(assert (=> b!525748 m!505981))

(declare-fun m!505983 () Bool)

(assert (=> b!525744 m!505983))

(declare-fun m!505985 () Bool)

(assert (=> b!525750 m!505985))

(declare-fun m!505987 () Bool)

(assert (=> b!525750 m!505987))

(check-sat (not b!525752) (not b!525747) (not start!47760) (not b!525749) (not b!525753) (not b!525751) (not b!525748) (not b!525743) (not b!525744) (not b!525754) (not b!525750))
(check-sat)
