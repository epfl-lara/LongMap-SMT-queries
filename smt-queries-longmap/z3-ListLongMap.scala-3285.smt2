; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45656 () Bool)

(assert start!45656)

(declare-fun b!503656 () Bool)

(declare-fun res!304943 () Bool)

(declare-fun e!294939 () Bool)

(assert (=> b!503656 (=> (not res!304943) (not e!294939))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!503656 (= res!304943 (validKeyInArray!0 k0!2280))))

(declare-fun b!503657 () Bool)

(declare-fun e!294944 () Bool)

(declare-fun e!294938 () Bool)

(assert (=> b!503657 (= e!294944 (not e!294938))))

(declare-fun res!304941 () Bool)

(assert (=> b!503657 (=> res!304941 e!294938)))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun lt!229168 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4053 0))(
  ( (MissingZero!4053 (index!18400 (_ BitVec 32))) (Found!4053 (index!18401 (_ BitVec 32))) (Intermediate!4053 (undefined!4865 Bool) (index!18402 (_ BitVec 32)) (x!47422 (_ BitVec 32))) (Undefined!4053) (MissingVacant!4053 (index!18403 (_ BitVec 32))) )
))
(declare-fun lt!229170 () SeekEntryResult!4053)

(declare-fun lt!229169 () (_ BitVec 64))

(declare-datatypes ((array!32412 0))(
  ( (array!32413 (arr!15586 (Array (_ BitVec 32) (_ BitVec 64))) (size!15950 (_ BitVec 32))) )
))
(declare-fun lt!229164 () array!32412)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32412 (_ BitVec 32)) SeekEntryResult!4053)

(assert (=> b!503657 (= res!304941 (= lt!229170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229168 lt!229169 lt!229164 mask!3524)))))

(declare-fun a!3235 () array!32412)

(declare-fun lt!229172 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!503657 (= lt!229170 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229172 (select (arr!15586 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!503657 (= lt!229168 (toIndex!0 lt!229169 mask!3524))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!503657 (= lt!229169 (select (store (arr!15586 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!503657 (= lt!229172 (toIndex!0 (select (arr!15586 a!3235) j!176) mask!3524))))

(assert (=> b!503657 (= lt!229164 (array!32413 (store (arr!15586 a!3235) i!1204 k0!2280) (size!15950 a!3235)))))

(declare-fun e!294941 () Bool)

(assert (=> b!503657 e!294941))

(declare-fun res!304937 () Bool)

(assert (=> b!503657 (=> (not res!304937) (not e!294941))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32412 (_ BitVec 32)) Bool)

(assert (=> b!503657 (= res!304937 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15288 0))(
  ( (Unit!15289) )
))
(declare-fun lt!229167 () Unit!15288)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32412 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15288)

(assert (=> b!503657 (= lt!229167 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!503658 () Bool)

(declare-fun e!294937 () Bool)

(assert (=> b!503658 (= e!294937 true)))

(declare-fun lt!229165 () SeekEntryResult!4053)

(assert (=> b!503658 (= lt!229165 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229172 lt!229169 lt!229164 mask!3524))))

(declare-fun res!304940 () Bool)

(assert (=> start!45656 (=> (not res!304940) (not e!294939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45656 (= res!304940 (validMask!0 mask!3524))))

(assert (=> start!45656 e!294939))

(assert (=> start!45656 true))

(declare-fun array_inv!11382 (array!32412) Bool)

(assert (=> start!45656 (array_inv!11382 a!3235)))

(declare-fun b!503659 () Bool)

(declare-fun res!304930 () Bool)

(assert (=> b!503659 (=> (not res!304930) (not e!294939))))

(assert (=> b!503659 (= res!304930 (validKeyInArray!0 (select (arr!15586 a!3235) j!176)))))

(declare-fun b!503660 () Bool)

(declare-fun res!304935 () Bool)

(assert (=> b!503660 (=> (not res!304935) (not e!294944))))

(assert (=> b!503660 (= res!304935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun e!294943 () Bool)

(declare-fun b!503661 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32412 (_ BitVec 32)) SeekEntryResult!4053)

(assert (=> b!503661 (= e!294943 (not (= (seekKeyOrZeroReturnVacant!0 #b00000000000000000000000000000000 lt!229172 (index!18402 lt!229170) (select (arr!15586 a!3235) j!176) a!3235 mask!3524) (Found!4053 j!176))))))

(declare-fun b!503662 () Bool)

(declare-fun res!304929 () Bool)

(assert (=> b!503662 (=> (not res!304929) (not e!294944))))

(declare-datatypes ((List!9744 0))(
  ( (Nil!9741) (Cons!9740 (h!10617 (_ BitVec 64)) (t!15972 List!9744)) )
))
(declare-fun arrayNoDuplicates!0 (array!32412 (_ BitVec 32) List!9744) Bool)

(assert (=> b!503662 (= res!304929 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9741))))

(declare-fun b!503663 () Bool)

(assert (=> b!503663 (= e!294939 e!294944)))

(declare-fun res!304942 () Bool)

(assert (=> b!503663 (=> (not res!304942) (not e!294944))))

(declare-fun lt!229174 () SeekEntryResult!4053)

(assert (=> b!503663 (= res!304942 (or (= lt!229174 (MissingZero!4053 i!1204)) (= lt!229174 (MissingVacant!4053 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32412 (_ BitVec 32)) SeekEntryResult!4053)

(assert (=> b!503663 (= lt!229174 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!503664 () Bool)

(assert (=> b!503664 (= e!294938 e!294937)))

(declare-fun res!304939 () Bool)

(assert (=> b!503664 (=> res!304939 e!294937)))

(assert (=> b!503664 (= res!304939 (or (bvsgt (x!47422 lt!229170) #b01111111111111111111111111111110) (bvslt lt!229172 #b00000000000000000000000000000000) (bvsge lt!229172 (size!15950 a!3235)) (bvslt (index!18402 lt!229170) #b00000000000000000000000000000000) (bvsge (index!18402 lt!229170) (size!15950 a!3235)) (not (= lt!229170 (Intermediate!4053 false (index!18402 lt!229170) (x!47422 lt!229170))))))))

(assert (=> b!503664 (= (index!18402 lt!229170) i!1204)))

(declare-fun lt!229173 () Unit!15288)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 (array!32412 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15288)

(assert (=> b!503664 (= lt!229173 (lemmaseekKeyOrZeroOrLongMinValueThenChangedAtReturnedIndex!0 a!3235 i!1204 k0!2280 j!176 lt!229172 #b00000000000000000000000000000000 (index!18402 lt!229170) (x!47422 lt!229170) mask!3524))))

(assert (=> b!503664 (and (or (= (select (arr!15586 a!3235) (index!18402 lt!229170)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15586 a!3235) (index!18402 lt!229170)) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15586 a!3235) (index!18402 lt!229170)) #b0000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!15586 a!3235) (index!18402 lt!229170)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!229171 () Unit!15288)

(declare-fun e!294942 () Unit!15288)

(assert (=> b!503664 (= lt!229171 e!294942)))

(declare-fun c!59642 () Bool)

(assert (=> b!503664 (= c!59642 (= (select (arr!15586 a!3235) (index!18402 lt!229170)) (select (arr!15586 a!3235) j!176)))))

(assert (=> b!503664 (and (bvslt (x!47422 lt!229170) #b01111111111111111111111111111110) (or (= (select (arr!15586 a!3235) (index!18402 lt!229170)) (select (arr!15586 a!3235) j!176)) (= (select (arr!15586 a!3235) (index!18402 lt!229170)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15586 a!3235) (index!18402 lt!229170)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!503665 () Bool)

(declare-fun Unit!15290 () Unit!15288)

(assert (=> b!503665 (= e!294942 Unit!15290)))

(declare-fun b!503666 () Bool)

(declare-fun e!294945 () Bool)

(assert (=> b!503666 (= e!294945 false)))

(declare-fun b!503667 () Bool)

(declare-fun res!304931 () Bool)

(assert (=> b!503667 (=> (not res!304931) (not e!294939))))

(declare-fun arrayContainsKey!0 (array!32412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!503667 (= res!304931 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!503668 () Bool)

(declare-fun res!304934 () Bool)

(assert (=> b!503668 (=> (not res!304934) (not e!294939))))

(assert (=> b!503668 (= res!304934 (and (= (size!15950 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15950 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15950 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!503669 () Bool)

(declare-fun res!304932 () Bool)

(assert (=> b!503669 (=> res!304932 e!294937)))

(assert (=> b!503669 (= res!304932 e!294943)))

(declare-fun res!304936 () Bool)

(assert (=> b!503669 (=> (not res!304936) (not e!294943))))

(assert (=> b!503669 (= res!304936 (bvsgt #b00000000000000000000000000000000 (x!47422 lt!229170)))))

(declare-fun b!503670 () Bool)

(declare-fun Unit!15291 () Unit!15288)

(assert (=> b!503670 (= e!294942 Unit!15291)))

(declare-fun lt!229166 () Unit!15288)

(declare-fun lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 (array!32412 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15288)

(assert (=> b!503670 (= lt!229166 (lemmaseekKeyOrZeroOrLongMinValueFoundKeyThenSameAfterChangingI!0 a!3235 i!1204 k0!2280 j!176 lt!229172 #b00000000000000000000000000000000 (index!18402 lt!229170) (x!47422 lt!229170) mask!3524))))

(declare-fun res!304938 () Bool)

(assert (=> b!503670 (= res!304938 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!229172 lt!229169 lt!229164 mask!3524) (Intermediate!4053 false (index!18402 lt!229170) (x!47422 lt!229170))))))

(assert (=> b!503670 (=> (not res!304938) (not e!294945))))

(assert (=> b!503670 e!294945))

(declare-fun b!503671 () Bool)

(declare-fun res!304933 () Bool)

(assert (=> b!503671 (=> res!304933 e!294938)))

(get-info :version)

(assert (=> b!503671 (= res!304933 (or (undefined!4865 lt!229170) (not ((_ is Intermediate!4053) lt!229170))))))

(declare-fun b!503672 () Bool)

(assert (=> b!503672 (= e!294941 (= (seekEntryOrOpen!0 (select (arr!15586 a!3235) j!176) a!3235 mask!3524) (Found!4053 j!176)))))

(assert (= (and start!45656 res!304940) b!503668))

(assert (= (and b!503668 res!304934) b!503659))

(assert (= (and b!503659 res!304930) b!503656))

(assert (= (and b!503656 res!304943) b!503667))

(assert (= (and b!503667 res!304931) b!503663))

(assert (= (and b!503663 res!304942) b!503660))

(assert (= (and b!503660 res!304935) b!503662))

(assert (= (and b!503662 res!304929) b!503657))

(assert (= (and b!503657 res!304937) b!503672))

(assert (= (and b!503657 (not res!304941)) b!503671))

(assert (= (and b!503671 (not res!304933)) b!503664))

(assert (= (and b!503664 c!59642) b!503670))

(assert (= (and b!503664 (not c!59642)) b!503665))

(assert (= (and b!503670 res!304938) b!503666))

(assert (= (and b!503664 (not res!304939)) b!503669))

(assert (= (and b!503669 res!304936) b!503661))

(assert (= (and b!503669 (not res!304932)) b!503658))

(declare-fun m!484471 () Bool)

(assert (=> b!503661 m!484471))

(assert (=> b!503661 m!484471))

(declare-fun m!484473 () Bool)

(assert (=> b!503661 m!484473))

(declare-fun m!484475 () Bool)

(assert (=> b!503664 m!484475))

(declare-fun m!484477 () Bool)

(assert (=> b!503664 m!484477))

(assert (=> b!503664 m!484471))

(declare-fun m!484479 () Bool)

(assert (=> b!503667 m!484479))

(declare-fun m!484481 () Bool)

(assert (=> b!503656 m!484481))

(assert (=> b!503672 m!484471))

(assert (=> b!503672 m!484471))

(declare-fun m!484483 () Bool)

(assert (=> b!503672 m!484483))

(declare-fun m!484485 () Bool)

(assert (=> b!503658 m!484485))

(declare-fun m!484487 () Bool)

(assert (=> start!45656 m!484487))

(declare-fun m!484489 () Bool)

(assert (=> start!45656 m!484489))

(assert (=> b!503659 m!484471))

(assert (=> b!503659 m!484471))

(declare-fun m!484491 () Bool)

(assert (=> b!503659 m!484491))

(declare-fun m!484493 () Bool)

(assert (=> b!503662 m!484493))

(declare-fun m!484495 () Bool)

(assert (=> b!503660 m!484495))

(declare-fun m!484497 () Bool)

(assert (=> b!503670 m!484497))

(assert (=> b!503670 m!484485))

(declare-fun m!484499 () Bool)

(assert (=> b!503663 m!484499))

(declare-fun m!484501 () Bool)

(assert (=> b!503657 m!484501))

(declare-fun m!484503 () Bool)

(assert (=> b!503657 m!484503))

(declare-fun m!484505 () Bool)

(assert (=> b!503657 m!484505))

(declare-fun m!484507 () Bool)

(assert (=> b!503657 m!484507))

(assert (=> b!503657 m!484471))

(declare-fun m!484509 () Bool)

(assert (=> b!503657 m!484509))

(assert (=> b!503657 m!484471))

(declare-fun m!484511 () Bool)

(assert (=> b!503657 m!484511))

(assert (=> b!503657 m!484471))

(declare-fun m!484513 () Bool)

(assert (=> b!503657 m!484513))

(declare-fun m!484515 () Bool)

(assert (=> b!503657 m!484515))

(check-sat (not b!503662) (not b!503657) (not b!503660) (not b!503667) (not b!503670) (not b!503656) (not b!503659) (not b!503663) (not b!503664) (not b!503672) (not b!503658) (not start!45656) (not b!503661))
(check-sat)
