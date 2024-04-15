; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!45264 () Bool)

(assert start!45264)

(declare-fun b!497106 () Bool)

(declare-fun res!299637 () Bool)

(declare-fun e!291376 () Bool)

(assert (=> b!497106 (=> (not res!299637) (not e!291376))))

(declare-datatypes ((array!32162 0))(
  ( (array!32163 (arr!15464 (Array (_ BitVec 32) (_ BitVec 64))) (size!15829 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32162)

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32162 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!497106 (= res!299637 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!497107 () Bool)

(declare-fun res!299639 () Bool)

(assert (=> b!497107 (=> (not res!299639) (not e!291376))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!497107 (= res!299639 (and (= (size!15829 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15829 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15829 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!497108 () Bool)

(declare-fun res!299640 () Bool)

(declare-fun e!291375 () Bool)

(assert (=> b!497108 (=> (not res!299640) (not e!291375))))

(declare-datatypes ((List!9661 0))(
  ( (Nil!9658) (Cons!9657 (h!10528 (_ BitVec 64)) (t!15880 List!9661)) )
))
(declare-fun arrayNoDuplicates!0 (array!32162 (_ BitVec 32) List!9661) Bool)

(assert (=> b!497108 (= res!299640 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9658))))

(declare-fun res!299644 () Bool)

(assert (=> start!45264 (=> (not res!299644) (not e!291376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45264 (= res!299644 (validMask!0 mask!3524))))

(assert (=> start!45264 e!291376))

(assert (=> start!45264 true))

(declare-fun array_inv!11347 (array!32162) Bool)

(assert (=> start!45264 (array_inv!11347 a!3235)))

(declare-fun b!497109 () Bool)

(declare-fun res!299638 () Bool)

(assert (=> b!497109 (=> (not res!299638) (not e!291375))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32162 (_ BitVec 32)) Bool)

(assert (=> b!497109 (= res!299638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!497110 () Bool)

(declare-fun res!299642 () Bool)

(assert (=> b!497110 (=> (not res!299642) (not e!291376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!497110 (= res!299642 (validKeyInArray!0 k0!2280))))

(declare-fun b!497111 () Bool)

(assert (=> b!497111 (= e!291376 e!291375)))

(declare-fun res!299645 () Bool)

(assert (=> b!497111 (=> (not res!299645) (not e!291375))))

(declare-datatypes ((SeekEntryResult!3928 0))(
  ( (MissingZero!3928 (index!17891 (_ BitVec 32))) (Found!3928 (index!17892 (_ BitVec 32))) (Intermediate!3928 (undefined!4740 Bool) (index!17893 (_ BitVec 32)) (x!46951 (_ BitVec 32))) (Undefined!3928) (MissingVacant!3928 (index!17894 (_ BitVec 32))) )
))
(declare-fun lt!224935 () SeekEntryResult!3928)

(assert (=> b!497111 (= res!299645 (or (= lt!224935 (MissingZero!3928 i!1204)) (= lt!224935 (MissingVacant!3928 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32162 (_ BitVec 32)) SeekEntryResult!3928)

(assert (=> b!497111 (= lt!224935 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!497112 () Bool)

(declare-fun res!299643 () Bool)

(declare-fun e!291378 () Bool)

(assert (=> b!497112 (=> res!299643 e!291378)))

(declare-fun lt!224938 () SeekEntryResult!3928)

(get-info :version)

(assert (=> b!497112 (= res!299643 (or (undefined!4740 lt!224938) (not ((_ is Intermediate!3928) lt!224938))))))

(declare-fun b!497113 () Bool)

(assert (=> b!497113 (= e!291375 (not e!291378))))

(declare-fun res!299641 () Bool)

(assert (=> b!497113 (=> res!299641 e!291378)))

(declare-fun lt!224937 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32162 (_ BitVec 32)) SeekEntryResult!3928)

(assert (=> b!497113 (= res!299641 (= lt!224938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224937 (select (store (arr!15464 a!3235) i!1204 k0!2280) j!176) (array!32163 (store (arr!15464 a!3235) i!1204 k0!2280) (size!15829 a!3235)) mask!3524)))))

(declare-fun lt!224936 () (_ BitVec 32))

(assert (=> b!497113 (= lt!224938 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224936 (select (arr!15464 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!497113 (= lt!224937 (toIndex!0 (select (store (arr!15464 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!497113 (= lt!224936 (toIndex!0 (select (arr!15464 a!3235) j!176) mask!3524))))

(declare-fun e!291374 () Bool)

(assert (=> b!497113 e!291374))

(declare-fun res!299635 () Bool)

(assert (=> b!497113 (=> (not res!299635) (not e!291374))))

(assert (=> b!497113 (= res!299635 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14788 0))(
  ( (Unit!14789) )
))
(declare-fun lt!224934 () Unit!14788)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32162 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14788)

(assert (=> b!497113 (= lt!224934 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!497114 () Bool)

(assert (=> b!497114 (= e!291378 true)))

(assert (=> b!497114 (and (bvslt (x!46951 lt!224938) #b01111111111111111111111111111110) (or (= (select (arr!15464 a!3235) (index!17893 lt!224938)) (select (arr!15464 a!3235) j!176)) (= (select (arr!15464 a!3235) (index!17893 lt!224938)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15464 a!3235) (index!17893 lt!224938)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!497115 () Bool)

(declare-fun res!299636 () Bool)

(assert (=> b!497115 (=> (not res!299636) (not e!291376))))

(assert (=> b!497115 (= res!299636 (validKeyInArray!0 (select (arr!15464 a!3235) j!176)))))

(declare-fun b!497116 () Bool)

(assert (=> b!497116 (= e!291374 (= (seekEntryOrOpen!0 (select (arr!15464 a!3235) j!176) a!3235 mask!3524) (Found!3928 j!176)))))

(assert (= (and start!45264 res!299644) b!497107))

(assert (= (and b!497107 res!299639) b!497115))

(assert (= (and b!497115 res!299636) b!497110))

(assert (= (and b!497110 res!299642) b!497106))

(assert (= (and b!497106 res!299637) b!497111))

(assert (= (and b!497111 res!299645) b!497109))

(assert (= (and b!497109 res!299638) b!497108))

(assert (= (and b!497108 res!299640) b!497113))

(assert (= (and b!497113 res!299635) b!497116))

(assert (= (and b!497113 (not res!299641)) b!497112))

(assert (= (and b!497112 (not res!299643)) b!497114))

(declare-fun m!478003 () Bool)

(assert (=> b!497116 m!478003))

(assert (=> b!497116 m!478003))

(declare-fun m!478005 () Bool)

(assert (=> b!497116 m!478005))

(declare-fun m!478007 () Bool)

(assert (=> b!497114 m!478007))

(assert (=> b!497114 m!478003))

(declare-fun m!478009 () Bool)

(assert (=> b!497113 m!478009))

(declare-fun m!478011 () Bool)

(assert (=> b!497113 m!478011))

(declare-fun m!478013 () Bool)

(assert (=> b!497113 m!478013))

(assert (=> b!497113 m!478003))

(declare-fun m!478015 () Bool)

(assert (=> b!497113 m!478015))

(assert (=> b!497113 m!478003))

(declare-fun m!478017 () Bool)

(assert (=> b!497113 m!478017))

(assert (=> b!497113 m!478003))

(declare-fun m!478019 () Bool)

(assert (=> b!497113 m!478019))

(assert (=> b!497113 m!478013))

(declare-fun m!478021 () Bool)

(assert (=> b!497113 m!478021))

(assert (=> b!497113 m!478013))

(declare-fun m!478023 () Bool)

(assert (=> b!497113 m!478023))

(assert (=> b!497115 m!478003))

(assert (=> b!497115 m!478003))

(declare-fun m!478025 () Bool)

(assert (=> b!497115 m!478025))

(declare-fun m!478027 () Bool)

(assert (=> b!497109 m!478027))

(declare-fun m!478029 () Bool)

(assert (=> b!497106 m!478029))

(declare-fun m!478031 () Bool)

(assert (=> b!497110 m!478031))

(declare-fun m!478033 () Bool)

(assert (=> b!497108 m!478033))

(declare-fun m!478035 () Bool)

(assert (=> b!497111 m!478035))

(declare-fun m!478037 () Bool)

(assert (=> start!45264 m!478037))

(declare-fun m!478039 () Bool)

(assert (=> start!45264 m!478039))

(check-sat (not b!497113) (not b!497106) (not b!497108) (not b!497111) (not b!497109) (not start!45264) (not b!497115) (not b!497110) (not b!497116))
(check-sat)
