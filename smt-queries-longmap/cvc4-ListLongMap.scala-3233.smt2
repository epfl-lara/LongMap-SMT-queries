; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45208 () Bool)

(assert start!45208)

(declare-fun b!496255 () Bool)

(declare-fun res!298644 () Bool)

(declare-fun e!291040 () Bool)

(assert (=> b!496255 (=> (not res!298644) (not e!291040))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!496255 (= res!298644 (validKeyInArray!0 k!2280))))

(declare-fun e!291042 () Bool)

(declare-datatypes ((array!32096 0))(
  ( (array!32097 (arr!15431 (Array (_ BitVec 32) (_ BitVec 64))) (size!15795 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32096)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!496256 () Bool)

(declare-datatypes ((SeekEntryResult!3898 0))(
  ( (MissingZero!3898 (index!17771 (_ BitVec 32))) (Found!3898 (index!17772 (_ BitVec 32))) (Intermediate!3898 (undefined!4710 Bool) (index!17773 (_ BitVec 32)) (x!46830 (_ BitVec 32))) (Undefined!3898) (MissingVacant!3898 (index!17774 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32096 (_ BitVec 32)) SeekEntryResult!3898)

(assert (=> b!496256 (= e!291042 (= (seekEntryOrOpen!0 (select (arr!15431 a!3235) j!176) a!3235 mask!3524) (Found!3898 j!176)))))

(declare-fun b!496257 () Bool)

(declare-fun e!291041 () Bool)

(assert (=> b!496257 (= e!291040 e!291041)))

(declare-fun res!298649 () Bool)

(assert (=> b!496257 (=> (not res!298649) (not e!291041))))

(declare-fun lt!224660 () SeekEntryResult!3898)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!496257 (= res!298649 (or (= lt!224660 (MissingZero!3898 i!1204)) (= lt!224660 (MissingVacant!3898 i!1204))))))

(assert (=> b!496257 (= lt!224660 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!496258 () Bool)

(declare-fun res!298648 () Bool)

(assert (=> b!496258 (=> (not res!298648) (not e!291041))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32096 (_ BitVec 32)) Bool)

(assert (=> b!496258 (= res!298648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!496259 () Bool)

(declare-fun res!298651 () Bool)

(assert (=> b!496259 (=> (not res!298651) (not e!291040))))

(declare-fun arrayContainsKey!0 (array!32096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!496259 (= res!298651 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!496260 () Bool)

(declare-fun res!298646 () Bool)

(assert (=> b!496260 (=> (not res!298646) (not e!291041))))

(declare-datatypes ((List!9589 0))(
  ( (Nil!9586) (Cons!9585 (h!10456 (_ BitVec 64)) (t!15817 List!9589)) )
))
(declare-fun arrayNoDuplicates!0 (array!32096 (_ BitVec 32) List!9589) Bool)

(assert (=> b!496260 (= res!298646 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9586))))

(declare-fun b!496261 () Bool)

(declare-fun e!291038 () Bool)

(assert (=> b!496261 (= e!291041 (not e!291038))))

(declare-fun res!298642 () Bool)

(assert (=> b!496261 (=> res!298642 e!291038)))

(declare-fun lt!224662 () SeekEntryResult!3898)

(declare-fun lt!224659 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32096 (_ BitVec 32)) SeekEntryResult!3898)

(assert (=> b!496261 (= res!298642 (= lt!224662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224659 (select (store (arr!15431 a!3235) i!1204 k!2280) j!176) (array!32097 (store (arr!15431 a!3235) i!1204 k!2280) (size!15795 a!3235)) mask!3524)))))

(declare-fun lt!224661 () (_ BitVec 32))

(assert (=> b!496261 (= lt!224662 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!224661 (select (arr!15431 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!496261 (= lt!224659 (toIndex!0 (select (store (arr!15431 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!496261 (= lt!224661 (toIndex!0 (select (arr!15431 a!3235) j!176) mask!3524))))

(assert (=> b!496261 e!291042))

(declare-fun res!298647 () Bool)

(assert (=> b!496261 (=> (not res!298647) (not e!291042))))

(assert (=> b!496261 (= res!298647 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14742 0))(
  ( (Unit!14743) )
))
(declare-fun lt!224658 () Unit!14742)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32096 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14742)

(assert (=> b!496261 (= lt!224658 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!496262 () Bool)

(declare-fun res!298643 () Bool)

(assert (=> b!496262 (=> (not res!298643) (not e!291040))))

(assert (=> b!496262 (= res!298643 (and (= (size!15795 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15795 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15795 a!3235)) (not (= i!1204 j!176))))))

(declare-fun res!298652 () Bool)

(assert (=> start!45208 (=> (not res!298652) (not e!291040))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45208 (= res!298652 (validMask!0 mask!3524))))

(assert (=> start!45208 e!291040))

(assert (=> start!45208 true))

(declare-fun array_inv!11227 (array!32096) Bool)

(assert (=> start!45208 (array_inv!11227 a!3235)))

(declare-fun b!496263 () Bool)

(assert (=> b!496263 (= e!291038 true)))

(assert (=> b!496263 (and (bvslt (x!46830 lt!224662) #b01111111111111111111111111111110) (or (= (select (arr!15431 a!3235) (index!17773 lt!224662)) (select (arr!15431 a!3235) j!176)) (= (select (arr!15431 a!3235) (index!17773 lt!224662)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15431 a!3235) (index!17773 lt!224662)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!496264 () Bool)

(declare-fun res!298645 () Bool)

(assert (=> b!496264 (=> (not res!298645) (not e!291040))))

(assert (=> b!496264 (= res!298645 (validKeyInArray!0 (select (arr!15431 a!3235) j!176)))))

(declare-fun b!496265 () Bool)

(declare-fun res!298650 () Bool)

(assert (=> b!496265 (=> res!298650 e!291038)))

(assert (=> b!496265 (= res!298650 (or (undefined!4710 lt!224662) (not (is-Intermediate!3898 lt!224662))))))

(assert (= (and start!45208 res!298652) b!496262))

(assert (= (and b!496262 res!298643) b!496264))

(assert (= (and b!496264 res!298645) b!496255))

(assert (= (and b!496255 res!298644) b!496259))

(assert (= (and b!496259 res!298651) b!496257))

(assert (= (and b!496257 res!298649) b!496258))

(assert (= (and b!496258 res!298648) b!496260))

(assert (= (and b!496260 res!298646) b!496261))

(assert (= (and b!496261 res!298647) b!496256))

(assert (= (and b!496261 (not res!298642)) b!496265))

(assert (= (and b!496265 (not res!298650)) b!496263))

(declare-fun m!477463 () Bool)

(assert (=> b!496256 m!477463))

(assert (=> b!496256 m!477463))

(declare-fun m!477465 () Bool)

(assert (=> b!496256 m!477465))

(declare-fun m!477467 () Bool)

(assert (=> start!45208 m!477467))

(declare-fun m!477469 () Bool)

(assert (=> start!45208 m!477469))

(declare-fun m!477471 () Bool)

(assert (=> b!496255 m!477471))

(declare-fun m!477473 () Bool)

(assert (=> b!496258 m!477473))

(assert (=> b!496264 m!477463))

(assert (=> b!496264 m!477463))

(declare-fun m!477475 () Bool)

(assert (=> b!496264 m!477475))

(declare-fun m!477477 () Bool)

(assert (=> b!496259 m!477477))

(declare-fun m!477479 () Bool)

(assert (=> b!496257 m!477479))

(declare-fun m!477481 () Bool)

(assert (=> b!496260 m!477481))

(declare-fun m!477483 () Bool)

(assert (=> b!496261 m!477483))

(declare-fun m!477485 () Bool)

(assert (=> b!496261 m!477485))

(assert (=> b!496261 m!477485))

(declare-fun m!477487 () Bool)

(assert (=> b!496261 m!477487))

(assert (=> b!496261 m!477463))

(declare-fun m!477489 () Bool)

(assert (=> b!496261 m!477489))

(assert (=> b!496261 m!477463))

(declare-fun m!477491 () Bool)

(assert (=> b!496261 m!477491))

(assert (=> b!496261 m!477485))

(declare-fun m!477493 () Bool)

(assert (=> b!496261 m!477493))

(declare-fun m!477495 () Bool)

(assert (=> b!496261 m!477495))

(assert (=> b!496261 m!477463))

(declare-fun m!477497 () Bool)

(assert (=> b!496261 m!477497))

(declare-fun m!477499 () Bool)

(assert (=> b!496263 m!477499))

(assert (=> b!496263 m!477463))

(push 1)

