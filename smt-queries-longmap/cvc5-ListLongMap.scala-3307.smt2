; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!45786 () Bool)

(assert start!45786)

(declare-fun b!506752 () Bool)

(declare-fun e!296588 () Bool)

(declare-fun e!296590 () Bool)

(assert (=> b!506752 (= e!296588 (not e!296590))))

(declare-fun res!307721 () Bool)

(assert (=> b!506752 (=> res!307721 e!296590)))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun i!1204 () (_ BitVec 32))

(declare-datatypes ((array!32542 0))(
  ( (array!32543 (arr!15651 (Array (_ BitVec 32) (_ BitVec 64))) (size!16015 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32542)

(declare-fun lt!231263 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4118 0))(
  ( (MissingZero!4118 (index!18660 (_ BitVec 32))) (Found!4118 (index!18661 (_ BitVec 32))) (Intermediate!4118 (undefined!4930 Bool) (index!18662 (_ BitVec 32)) (x!47663 (_ BitVec 32))) (Undefined!4118) (MissingVacant!4118 (index!18663 (_ BitVec 32))) )
))
(declare-fun lt!231267 () SeekEntryResult!4118)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32542 (_ BitVec 32)) SeekEntryResult!4118)

(assert (=> b!506752 (= res!307721 (= lt!231267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231263 (select (store (arr!15651 a!3235) i!1204 k!2280) j!176) (array!32543 (store (arr!15651 a!3235) i!1204 k!2280) (size!16015 a!3235)) mask!3524)))))

(declare-fun lt!231268 () (_ BitVec 32))

(assert (=> b!506752 (= lt!231267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!231268 (select (arr!15651 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!506752 (= lt!231263 (toIndex!0 (select (store (arr!15651 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!506752 (= lt!231268 (toIndex!0 (select (arr!15651 a!3235) j!176) mask!3524))))

(declare-fun e!296589 () Bool)

(assert (=> b!506752 e!296589))

(declare-fun res!307717 () Bool)

(assert (=> b!506752 (=> (not res!307717) (not e!296589))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32542 (_ BitVec 32)) Bool)

(assert (=> b!506752 (= res!307717 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15524 0))(
  ( (Unit!15525) )
))
(declare-fun lt!231264 () Unit!15524)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32542 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15524)

(assert (=> b!506752 (= lt!231264 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!506753 () Bool)

(declare-fun res!307713 () Bool)

(assert (=> b!506753 (=> (not res!307713) (not e!296588))))

(assert (=> b!506753 (= res!307713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!506754 () Bool)

(declare-fun e!296591 () Bool)

(assert (=> b!506754 (= e!296591 true)))

(assert (=> b!506754 false))

(declare-fun b!506755 () Bool)

(assert (=> b!506755 (= e!296590 e!296591)))

(declare-fun res!307711 () Bool)

(assert (=> b!506755 (=> res!307711 e!296591)))

(declare-fun lt!231265 () Bool)

(assert (=> b!506755 (= res!307711 (or (and (not lt!231265) (undefined!4930 lt!231267)) (and (not lt!231265) (not (undefined!4930 lt!231267)))))))

(assert (=> b!506755 (= lt!231265 (not (is-Intermediate!4118 lt!231267)))))

(declare-fun b!506756 () Bool)

(declare-fun res!307716 () Bool)

(declare-fun e!296592 () Bool)

(assert (=> b!506756 (=> (not res!307716) (not e!296592))))

(declare-fun arrayContainsKey!0 (array!32542 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!506756 (= res!307716 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun res!307718 () Bool)

(assert (=> start!45786 (=> (not res!307718) (not e!296592))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!45786 (= res!307718 (validMask!0 mask!3524))))

(assert (=> start!45786 e!296592))

(assert (=> start!45786 true))

(declare-fun array_inv!11447 (array!32542) Bool)

(assert (=> start!45786 (array_inv!11447 a!3235)))

(declare-fun b!506757 () Bool)

(declare-fun res!307715 () Bool)

(assert (=> b!506757 (=> (not res!307715) (not e!296592))))

(assert (=> b!506757 (= res!307715 (and (= (size!16015 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16015 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16015 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!506758 () Bool)

(declare-fun res!307714 () Bool)

(assert (=> b!506758 (=> (not res!307714) (not e!296588))))

(declare-datatypes ((List!9809 0))(
  ( (Nil!9806) (Cons!9805 (h!10682 (_ BitVec 64)) (t!16037 List!9809)) )
))
(declare-fun arrayNoDuplicates!0 (array!32542 (_ BitVec 32) List!9809) Bool)

(assert (=> b!506758 (= res!307714 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9806))))

(declare-fun b!506759 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32542 (_ BitVec 32)) SeekEntryResult!4118)

(assert (=> b!506759 (= e!296589 (= (seekEntryOrOpen!0 (select (arr!15651 a!3235) j!176) a!3235 mask!3524) (Found!4118 j!176)))))

(declare-fun b!506760 () Bool)

(declare-fun res!307712 () Bool)

(assert (=> b!506760 (=> (not res!307712) (not e!296592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!506760 (= res!307712 (validKeyInArray!0 (select (arr!15651 a!3235) j!176)))))

(declare-fun b!506761 () Bool)

(assert (=> b!506761 (= e!296592 e!296588)))

(declare-fun res!307720 () Bool)

(assert (=> b!506761 (=> (not res!307720) (not e!296588))))

(declare-fun lt!231266 () SeekEntryResult!4118)

(assert (=> b!506761 (= res!307720 (or (= lt!231266 (MissingZero!4118 i!1204)) (= lt!231266 (MissingVacant!4118 i!1204))))))

(assert (=> b!506761 (= lt!231266 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!506762 () Bool)

(declare-fun res!307719 () Bool)

(assert (=> b!506762 (=> (not res!307719) (not e!296592))))

(assert (=> b!506762 (= res!307719 (validKeyInArray!0 k!2280))))

(assert (= (and start!45786 res!307718) b!506757))

(assert (= (and b!506757 res!307715) b!506760))

(assert (= (and b!506760 res!307712) b!506762))

(assert (= (and b!506762 res!307719) b!506756))

(assert (= (and b!506756 res!307716) b!506761))

(assert (= (and b!506761 res!307720) b!506753))

(assert (= (and b!506753 res!307713) b!506758))

(assert (= (and b!506758 res!307714) b!506752))

(assert (= (and b!506752 res!307717) b!506759))

(assert (= (and b!506752 (not res!307721)) b!506755))

(assert (= (and b!506755 (not res!307711)) b!506754))

(declare-fun m!487443 () Bool)

(assert (=> b!506760 m!487443))

(assert (=> b!506760 m!487443))

(declare-fun m!487445 () Bool)

(assert (=> b!506760 m!487445))

(declare-fun m!487447 () Bool)

(assert (=> b!506762 m!487447))

(declare-fun m!487449 () Bool)

(assert (=> b!506761 m!487449))

(declare-fun m!487451 () Bool)

(assert (=> b!506753 m!487451))

(assert (=> b!506759 m!487443))

(assert (=> b!506759 m!487443))

(declare-fun m!487453 () Bool)

(assert (=> b!506759 m!487453))

(declare-fun m!487455 () Bool)

(assert (=> b!506758 m!487455))

(declare-fun m!487457 () Bool)

(assert (=> start!45786 m!487457))

(declare-fun m!487459 () Bool)

(assert (=> start!45786 m!487459))

(declare-fun m!487461 () Bool)

(assert (=> b!506756 m!487461))

(declare-fun m!487463 () Bool)

(assert (=> b!506752 m!487463))

(declare-fun m!487465 () Bool)

(assert (=> b!506752 m!487465))

(declare-fun m!487467 () Bool)

(assert (=> b!506752 m!487467))

(assert (=> b!506752 m!487467))

(declare-fun m!487469 () Bool)

(assert (=> b!506752 m!487469))

(assert (=> b!506752 m!487443))

(declare-fun m!487471 () Bool)

(assert (=> b!506752 m!487471))

(assert (=> b!506752 m!487443))

(declare-fun m!487473 () Bool)

(assert (=> b!506752 m!487473))

(assert (=> b!506752 m!487443))

(declare-fun m!487475 () Bool)

(assert (=> b!506752 m!487475))

(assert (=> b!506752 m!487467))

(declare-fun m!487477 () Bool)

(assert (=> b!506752 m!487477))

(push 1)

