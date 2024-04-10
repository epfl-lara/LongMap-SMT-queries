; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!47768 () Bool)

(assert start!47768)

(declare-fun b!525928 () Bool)

(declare-fun e!306608 () Bool)

(assert (=> b!525928 (= e!306608 true)))

(declare-datatypes ((SeekEntryResult!4521 0))(
  ( (MissingZero!4521 (index!20296 (_ BitVec 32))) (Found!4521 (index!20297 (_ BitVec 32))) (Intermediate!4521 (undefined!5333 Bool) (index!20298 (_ BitVec 32)) (x!49270 (_ BitVec 32))) (Undefined!4521) (MissingVacant!4521 (index!20299 (_ BitVec 32))) )
))
(declare-fun lt!241744 () SeekEntryResult!4521)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!525928 (= (index!20298 lt!241744) i!1204)))

(declare-datatypes ((Unit!16536 0))(
  ( (Unit!16537) )
))
(declare-fun lt!241749 () Unit!16536)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!33405 0))(
  ( (array!33406 (arr!16054 (Array (_ BitVec 32) (_ BitVec 64))) (size!16418 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33405)

(declare-fun lt!241746 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!33405 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16536)

(assert (=> b!525928 (= lt!241749 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!241746 #b00000000000000000000000000000000 (index!20298 lt!241744) (x!49270 lt!241744) mask!3524))))

(assert (=> b!525928 (and (or (= (select (arr!16054 a!3235) (index!20298 lt!241744)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16054 a!3235) (index!20298 lt!241744)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16054 a!3235) (index!20298 lt!241744)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16054 a!3235) (index!20298 lt!241744)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!241750 () Unit!16536)

(declare-fun e!306603 () Unit!16536)

(assert (=> b!525928 (= lt!241750 e!306603)))

(declare-fun c!61958 () Bool)

(assert (=> b!525928 (= c!61958 (= (select (arr!16054 a!3235) (index!20298 lt!241744)) (select (arr!16054 a!3235) j!176)))))

(assert (=> b!525928 (and (bvslt (x!49270 lt!241744) #b01111111111111111111111111111110) (or (= (select (arr!16054 a!3235) (index!20298 lt!241744)) (select (arr!16054 a!3235) j!176)) (= (select (arr!16054 a!3235) (index!20298 lt!241744)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!16054 a!3235) (index!20298 lt!241744)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!525929 () Bool)

(declare-fun res!322634 () Bool)

(declare-fun e!306606 () Bool)

(assert (=> b!525929 (=> (not res!322634) (not e!306606))))

(assert (=> b!525929 (= res!322634 (and (= (size!16418 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16418 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16418 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!525930 () Bool)

(declare-fun res!322627 () Bool)

(assert (=> b!525930 (=> (not res!322627) (not e!306606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!525930 (= res!322627 (validKeyInArray!0 k0!2280))))

(declare-fun b!525931 () Bool)

(declare-fun e!306604 () Bool)

(assert (=> b!525931 (= e!306604 false)))

(declare-fun b!525933 () Bool)

(declare-fun Unit!16538 () Unit!16536)

(assert (=> b!525933 (= e!306603 Unit!16538)))

(declare-fun b!525934 () Bool)

(declare-fun res!322629 () Bool)

(assert (=> b!525934 (=> (not res!322629) (not e!306606))))

(declare-fun arrayContainsKey!0 (array!33405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!525934 (= res!322629 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!525935 () Bool)

(declare-fun res!322624 () Bool)

(assert (=> b!525935 (=> res!322624 e!306608)))

(get-info :version)

(assert (=> b!525935 (= res!322624 (or (undefined!5333 lt!241744) (not ((_ is Intermediate!4521) lt!241744))))))

(declare-fun b!525936 () Bool)

(declare-fun e!306609 () Bool)

(assert (=> b!525936 (= e!306609 (not e!306608))))

(declare-fun res!322625 () Bool)

(assert (=> b!525936 (=> res!322625 e!306608)))

(declare-fun lt!241748 () (_ BitVec 64))

(declare-fun lt!241747 () array!33405)

(declare-fun lt!241753 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33405 (_ BitVec 32)) SeekEntryResult!4521)

(assert (=> b!525936 (= res!322625 (= lt!241744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241753 lt!241748 lt!241747 mask!3524)))))

(assert (=> b!525936 (= lt!241744 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241746 (select (arr!16054 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!525936 (= lt!241753 (toIndex!0 lt!241748 mask!3524))))

(assert (=> b!525936 (= lt!241748 (select (store (arr!16054 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!525936 (= lt!241746 (toIndex!0 (select (arr!16054 a!3235) j!176) mask!3524))))

(assert (=> b!525936 (= lt!241747 (array!33406 (store (arr!16054 a!3235) i!1204 k0!2280) (size!16418 a!3235)))))

(declare-fun e!306605 () Bool)

(assert (=> b!525936 e!306605))

(declare-fun res!322630 () Bool)

(assert (=> b!525936 (=> (not res!322630) (not e!306605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33405 (_ BitVec 32)) Bool)

(assert (=> b!525936 (= res!322630 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-fun lt!241745 () Unit!16536)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33405 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16536)

(assert (=> b!525936 (= lt!241745 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!525937 () Bool)

(declare-fun Unit!16539 () Unit!16536)

(assert (=> b!525937 (= e!306603 Unit!16539)))

(declare-fun lt!241752 () Unit!16536)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!33405 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!16536)

(assert (=> b!525937 (= lt!241752 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!241746 #b00000000000000000000000000000000 (index!20298 lt!241744) (x!49270 lt!241744) mask!3524))))

(declare-fun res!322623 () Bool)

(assert (=> b!525937 (= res!322623 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!241746 lt!241748 lt!241747 mask!3524) (Intermediate!4521 false (index!20298 lt!241744) (x!49270 lt!241744))))))

(assert (=> b!525937 (=> (not res!322623) (not e!306604))))

(assert (=> b!525937 e!306604))

(declare-fun b!525938 () Bool)

(assert (=> b!525938 (= e!306606 e!306609)))

(declare-fun res!322628 () Bool)

(assert (=> b!525938 (=> (not res!322628) (not e!306609))))

(declare-fun lt!241751 () SeekEntryResult!4521)

(assert (=> b!525938 (= res!322628 (or (= lt!241751 (MissingZero!4521 i!1204)) (= lt!241751 (MissingVacant!4521 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33405 (_ BitVec 32)) SeekEntryResult!4521)

(assert (=> b!525938 (= lt!241751 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!525939 () Bool)

(declare-fun res!322631 () Bool)

(assert (=> b!525939 (=> (not res!322631) (not e!306609))))

(declare-datatypes ((List!10212 0))(
  ( (Nil!10209) (Cons!10208 (h!11139 (_ BitVec 64)) (t!16440 List!10212)) )
))
(declare-fun arrayNoDuplicates!0 (array!33405 (_ BitVec 32) List!10212) Bool)

(assert (=> b!525939 (= res!322631 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10209))))

(declare-fun res!322632 () Bool)

(assert (=> start!47768 (=> (not res!322632) (not e!306606))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!47768 (= res!322632 (validMask!0 mask!3524))))

(assert (=> start!47768 e!306606))

(assert (=> start!47768 true))

(declare-fun array_inv!11850 (array!33405) Bool)

(assert (=> start!47768 (array_inv!11850 a!3235)))

(declare-fun b!525932 () Bool)

(assert (=> b!525932 (= e!306605 (= (seekEntryOrOpen!0 (select (arr!16054 a!3235) j!176) a!3235 mask!3524) (Found!4521 j!176)))))

(declare-fun b!525940 () Bool)

(declare-fun res!322633 () Bool)

(assert (=> b!525940 (=> (not res!322633) (not e!306609))))

(assert (=> b!525940 (= res!322633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!525941 () Bool)

(declare-fun res!322626 () Bool)

(assert (=> b!525941 (=> (not res!322626) (not e!306606))))

(assert (=> b!525941 (= res!322626 (validKeyInArray!0 (select (arr!16054 a!3235) j!176)))))

(assert (= (and start!47768 res!322632) b!525929))

(assert (= (and b!525929 res!322634) b!525941))

(assert (= (and b!525941 res!322626) b!525930))

(assert (= (and b!525930 res!322627) b!525934))

(assert (= (and b!525934 res!322629) b!525938))

(assert (= (and b!525938 res!322628) b!525940))

(assert (= (and b!525940 res!322633) b!525939))

(assert (= (and b!525939 res!322631) b!525936))

(assert (= (and b!525936 res!322630) b!525932))

(assert (= (and b!525936 (not res!322625)) b!525935))

(assert (= (and b!525935 (not res!322624)) b!525928))

(assert (= (and b!525928 c!61958) b!525937))

(assert (= (and b!525928 (not c!61958)) b!525933))

(assert (= (and b!525937 res!322623) b!525931))

(declare-fun m!506609 () Bool)

(assert (=> b!525937 m!506609))

(declare-fun m!506611 () Bool)

(assert (=> b!525937 m!506611))

(declare-fun m!506613 () Bool)

(assert (=> b!525940 m!506613))

(declare-fun m!506615 () Bool)

(assert (=> b!525934 m!506615))

(declare-fun m!506617 () Bool)

(assert (=> b!525939 m!506617))

(declare-fun m!506619 () Bool)

(assert (=> b!525928 m!506619))

(declare-fun m!506621 () Bool)

(assert (=> b!525928 m!506621))

(declare-fun m!506623 () Bool)

(assert (=> b!525928 m!506623))

(assert (=> b!525941 m!506623))

(assert (=> b!525941 m!506623))

(declare-fun m!506625 () Bool)

(assert (=> b!525941 m!506625))

(declare-fun m!506627 () Bool)

(assert (=> b!525936 m!506627))

(declare-fun m!506629 () Bool)

(assert (=> b!525936 m!506629))

(declare-fun m!506631 () Bool)

(assert (=> b!525936 m!506631))

(declare-fun m!506633 () Bool)

(assert (=> b!525936 m!506633))

(declare-fun m!506635 () Bool)

(assert (=> b!525936 m!506635))

(assert (=> b!525936 m!506623))

(declare-fun m!506637 () Bool)

(assert (=> b!525936 m!506637))

(assert (=> b!525936 m!506623))

(declare-fun m!506639 () Bool)

(assert (=> b!525936 m!506639))

(assert (=> b!525936 m!506623))

(declare-fun m!506641 () Bool)

(assert (=> b!525936 m!506641))

(declare-fun m!506643 () Bool)

(assert (=> start!47768 m!506643))

(declare-fun m!506645 () Bool)

(assert (=> start!47768 m!506645))

(declare-fun m!506647 () Bool)

(assert (=> b!525930 m!506647))

(declare-fun m!506649 () Bool)

(assert (=> b!525938 m!506649))

(assert (=> b!525932 m!506623))

(assert (=> b!525932 m!506623))

(declare-fun m!506651 () Bool)

(assert (=> b!525932 m!506651))

(check-sat (not b!525928) (not b!525932) (not b!525940) (not start!47768) (not b!525941) (not b!525939) (not b!525936) (not b!525938) (not b!525937) (not b!525930) (not b!525934))
(check-sat)
