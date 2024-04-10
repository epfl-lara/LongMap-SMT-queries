; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44714 () Bool)

(assert start!44714)

(declare-fun b!490731 () Bool)

(declare-fun e!288437 () Bool)

(declare-fun e!288436 () Bool)

(assert (=> b!490731 (= e!288437 e!288436)))

(declare-fun res!293671 () Bool)

(assert (=> b!490731 (=> (not res!293671) (not e!288436))))

(declare-datatypes ((SeekEntryResult!3741 0))(
  ( (MissingZero!3741 (index!17143 (_ BitVec 32))) (Found!3741 (index!17144 (_ BitVec 32))) (Intermediate!3741 (undefined!4553 Bool) (index!17145 (_ BitVec 32)) (x!46239 (_ BitVec 32))) (Undefined!3741) (MissingVacant!3741 (index!17146 (_ BitVec 32))) )
))
(declare-fun lt!221689 () SeekEntryResult!3741)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490731 (= res!293671 (or (= lt!221689 (MissingZero!3741 i!1204)) (= lt!221689 (MissingVacant!3741 i!1204))))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-datatypes ((array!31773 0))(
  ( (array!31774 (arr!15274 (Array (_ BitVec 32) (_ BitVec 64))) (size!15638 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31773)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31773 (_ BitVec 32)) SeekEntryResult!3741)

(assert (=> b!490731 (= lt!221689 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!490732 () Bool)

(declare-fun e!288435 () Bool)

(assert (=> b!490732 (= e!288435 true)))

(declare-fun lt!221690 () (_ BitVec 64))

(declare-fun lt!221688 () array!31773)

(declare-fun lt!221691 () SeekEntryResult!3741)

(assert (=> b!490732 (= lt!221691 (seekEntryOrOpen!0 lt!221690 lt!221688 mask!3524))))

(declare-datatypes ((Unit!14428 0))(
  ( (Unit!14429) )
))
(declare-fun lt!221692 () Unit!14428)

(declare-fun j!176 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31773 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14428)

(assert (=> b!490732 (= lt!221692 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k0!2280 j!176 mask!3524))))

(declare-fun b!490733 () Bool)

(declare-fun res!293670 () Bool)

(assert (=> b!490733 (=> (not res!293670) (not e!288437))))

(declare-fun arrayContainsKey!0 (array!31773 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490733 (= res!293670 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490734 () Bool)

(declare-fun res!293672 () Bool)

(assert (=> b!490734 (=> (not res!293672) (not e!288436))))

(declare-datatypes ((List!9432 0))(
  ( (Nil!9429) (Cons!9428 (h!10290 (_ BitVec 64)) (t!15660 List!9432)) )
))
(declare-fun arrayNoDuplicates!0 (array!31773 (_ BitVec 32) List!9432) Bool)

(assert (=> b!490734 (= res!293672 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9429))))

(declare-fun b!490735 () Bool)

(declare-fun res!293674 () Bool)

(assert (=> b!490735 (=> (not res!293674) (not e!288437))))

(assert (=> b!490735 (= res!293674 (and (= (size!15638 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15638 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15638 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490736 () Bool)

(declare-fun res!293673 () Bool)

(assert (=> b!490736 (=> (not res!293673) (not e!288437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490736 (= res!293673 (validKeyInArray!0 k0!2280))))

(declare-fun b!490737 () Bool)

(declare-fun res!293675 () Bool)

(assert (=> b!490737 (=> (not res!293675) (not e!288436))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31773 (_ BitVec 32)) Bool)

(assert (=> b!490737 (= res!293675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490738 () Bool)

(declare-fun res!293669 () Bool)

(assert (=> b!490738 (=> (not res!293669) (not e!288437))))

(assert (=> b!490738 (= res!293669 (validKeyInArray!0 (select (arr!15274 a!3235) j!176)))))

(declare-fun b!490739 () Bool)

(assert (=> b!490739 (= e!288436 (not e!288435))))

(declare-fun res!293668 () Bool)

(assert (=> b!490739 (=> res!293668 e!288435)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31773 (_ BitVec 32)) SeekEntryResult!3741)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490739 (= res!293668 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15274 a!3235) j!176) mask!3524) (select (arr!15274 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221690 mask!3524) lt!221690 lt!221688 mask!3524))))))

(assert (=> b!490739 (= lt!221690 (select (store (arr!15274 a!3235) i!1204 k0!2280) j!176))))

(assert (=> b!490739 (= lt!221688 (array!31774 (store (arr!15274 a!3235) i!1204 k0!2280) (size!15638 a!3235)))))

(assert (=> b!490739 (= lt!221691 (Found!3741 j!176))))

(assert (=> b!490739 (= lt!221691 (seekEntryOrOpen!0 (select (arr!15274 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490739 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221687 () Unit!14428)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31773 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14428)

(assert (=> b!490739 (= lt!221687 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun res!293667 () Bool)

(assert (=> start!44714 (=> (not res!293667) (not e!288437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44714 (= res!293667 (validMask!0 mask!3524))))

(assert (=> start!44714 e!288437))

(assert (=> start!44714 true))

(declare-fun array_inv!11070 (array!31773) Bool)

(assert (=> start!44714 (array_inv!11070 a!3235)))

(assert (= (and start!44714 res!293667) b!490735))

(assert (= (and b!490735 res!293674) b!490738))

(assert (= (and b!490738 res!293669) b!490736))

(assert (= (and b!490736 res!293673) b!490733))

(assert (= (and b!490733 res!293670) b!490731))

(assert (= (and b!490731 res!293671) b!490737))

(assert (= (and b!490737 res!293675) b!490734))

(assert (= (and b!490734 res!293672) b!490739))

(assert (= (and b!490739 (not res!293668)) b!490732))

(declare-fun m!470977 () Bool)

(assert (=> b!490739 m!470977))

(declare-fun m!470979 () Bool)

(assert (=> b!490739 m!470979))

(declare-fun m!470981 () Bool)

(assert (=> b!490739 m!470981))

(declare-fun m!470983 () Bool)

(assert (=> b!490739 m!470983))

(declare-fun m!470985 () Bool)

(assert (=> b!490739 m!470985))

(declare-fun m!470987 () Bool)

(assert (=> b!490739 m!470987))

(declare-fun m!470989 () Bool)

(assert (=> b!490739 m!470989))

(declare-fun m!470991 () Bool)

(assert (=> b!490739 m!470991))

(assert (=> b!490739 m!470989))

(assert (=> b!490739 m!470985))

(assert (=> b!490739 m!470983))

(assert (=> b!490739 m!470985))

(declare-fun m!470993 () Bool)

(assert (=> b!490739 m!470993))

(assert (=> b!490739 m!470985))

(declare-fun m!470995 () Bool)

(assert (=> b!490739 m!470995))

(declare-fun m!470997 () Bool)

(assert (=> start!44714 m!470997))

(declare-fun m!470999 () Bool)

(assert (=> start!44714 m!470999))

(declare-fun m!471001 () Bool)

(assert (=> b!490733 m!471001))

(assert (=> b!490738 m!470985))

(assert (=> b!490738 m!470985))

(declare-fun m!471003 () Bool)

(assert (=> b!490738 m!471003))

(declare-fun m!471005 () Bool)

(assert (=> b!490734 m!471005))

(declare-fun m!471007 () Bool)

(assert (=> b!490732 m!471007))

(declare-fun m!471009 () Bool)

(assert (=> b!490732 m!471009))

(declare-fun m!471011 () Bool)

(assert (=> b!490737 m!471011))

(declare-fun m!471013 () Bool)

(assert (=> b!490736 m!471013))

(declare-fun m!471015 () Bool)

(assert (=> b!490731 m!471015))

(check-sat (not b!490736) (not b!490732) (not b!490737) (not b!490739) (not start!44714) (not b!490731) (not b!490733) (not b!490734) (not b!490738))
(check-sat)
