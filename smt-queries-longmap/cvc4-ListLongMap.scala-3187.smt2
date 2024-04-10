; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44752 () Bool)

(assert start!44752)

(declare-fun b!491253 () Bool)

(declare-fun res!294193 () Bool)

(declare-fun e!288674 () Bool)

(assert (=> b!491253 (=> (not res!294193) (not e!288674))))

(declare-datatypes ((array!31811 0))(
  ( (array!31812 (arr!15293 (Array (_ BitVec 32) (_ BitVec 64))) (size!15657 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31811)

(declare-datatypes ((List!9451 0))(
  ( (Nil!9448) (Cons!9447 (h!10309 (_ BitVec 64)) (t!15679 List!9451)) )
))
(declare-fun arrayNoDuplicates!0 (array!31811 (_ BitVec 32) List!9451) Bool)

(assert (=> b!491253 (= res!294193 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9448))))

(declare-fun b!491254 () Bool)

(declare-fun res!294194 () Bool)

(declare-fun e!288672 () Bool)

(assert (=> b!491254 (=> (not res!294194) (not e!288672))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31811 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!491254 (= res!294194 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!491255 () Bool)

(declare-fun res!294191 () Bool)

(assert (=> b!491255 (=> (not res!294191) (not e!288672))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!491255 (= res!294191 (validKeyInArray!0 k!2280))))

(declare-fun b!491256 () Bool)

(declare-fun res!294189 () Bool)

(assert (=> b!491256 (=> (not res!294189) (not e!288672))))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!491256 (= res!294189 (validKeyInArray!0 (select (arr!15293 a!3235) j!176)))))

(declare-fun res!294196 () Bool)

(assert (=> start!44752 (=> (not res!294196) (not e!288672))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44752 (= res!294196 (validMask!0 mask!3524))))

(assert (=> start!44752 e!288672))

(assert (=> start!44752 true))

(declare-fun array_inv!11089 (array!31811) Bool)

(assert (=> start!44752 (array_inv!11089 a!3235)))

(declare-fun b!491257 () Bool)

(declare-fun res!294192 () Bool)

(assert (=> b!491257 (=> (not res!294192) (not e!288672))))

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!491257 (= res!294192 (and (= (size!15657 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15657 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15657 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!491258 () Bool)

(declare-fun res!294190 () Bool)

(assert (=> b!491258 (=> (not res!294190) (not e!288674))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31811 (_ BitVec 32)) Bool)

(assert (=> b!491258 (= res!294190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!491259 () Bool)

(assert (=> b!491259 (= e!288672 e!288674)))

(declare-fun res!294197 () Bool)

(assert (=> b!491259 (=> (not res!294197) (not e!288674))))

(declare-datatypes ((SeekEntryResult!3760 0))(
  ( (MissingZero!3760 (index!17219 (_ BitVec 32))) (Found!3760 (index!17220 (_ BitVec 32))) (Intermediate!3760 (undefined!4572 Bool) (index!17221 (_ BitVec 32)) (x!46306 (_ BitVec 32))) (Undefined!3760) (MissingVacant!3760 (index!17222 (_ BitVec 32))) )
))
(declare-fun lt!222034 () SeekEntryResult!3760)

(assert (=> b!491259 (= res!294197 (or (= lt!222034 (MissingZero!3760 i!1204)) (= lt!222034 (MissingVacant!3760 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31811 (_ BitVec 32)) SeekEntryResult!3760)

(assert (=> b!491259 (= lt!222034 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!491260 () Bool)

(declare-fun e!288675 () Bool)

(assert (=> b!491260 (= e!288675 (bvsge mask!3524 #b00000000000000000000000000000000))))

(declare-fun lt!222029 () SeekEntryResult!3760)

(declare-fun lt!222033 () (_ BitVec 64))

(declare-fun lt!222031 () array!31811)

(assert (=> b!491260 (= lt!222029 (seekEntryOrOpen!0 lt!222033 lt!222031 mask!3524))))

(declare-datatypes ((Unit!14466 0))(
  ( (Unit!14467) )
))
(declare-fun lt!222032 () Unit!14466)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31811 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14466)

(assert (=> b!491260 (= lt!222032 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!491261 () Bool)

(assert (=> b!491261 (= e!288674 (not e!288675))))

(declare-fun res!294195 () Bool)

(assert (=> b!491261 (=> res!294195 e!288675)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31811 (_ BitVec 32)) SeekEntryResult!3760)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!491261 (= res!294195 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15293 a!3235) j!176) mask!3524) (select (arr!15293 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!222033 mask!3524) lt!222033 lt!222031 mask!3524))))))

(assert (=> b!491261 (= lt!222033 (select (store (arr!15293 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!491261 (= lt!222031 (array!31812 (store (arr!15293 a!3235) i!1204 k!2280) (size!15657 a!3235)))))

(assert (=> b!491261 (= lt!222029 (Found!3760 j!176))))

(assert (=> b!491261 (= lt!222029 (seekEntryOrOpen!0 (select (arr!15293 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!491261 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!222030 () Unit!14466)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31811 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14466)

(assert (=> b!491261 (= lt!222030 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44752 res!294196) b!491257))

(assert (= (and b!491257 res!294192) b!491256))

(assert (= (and b!491256 res!294189) b!491255))

(assert (= (and b!491255 res!294191) b!491254))

(assert (= (and b!491254 res!294194) b!491259))

(assert (= (and b!491259 res!294197) b!491258))

(assert (= (and b!491258 res!294190) b!491253))

(assert (= (and b!491253 res!294193) b!491261))

(assert (= (and b!491261 (not res!294195)) b!491260))

(declare-fun m!471743 () Bool)

(assert (=> b!491258 m!471743))

(declare-fun m!471745 () Bool)

(assert (=> b!491254 m!471745))

(declare-fun m!471747 () Bool)

(assert (=> b!491260 m!471747))

(declare-fun m!471749 () Bool)

(assert (=> b!491260 m!471749))

(declare-fun m!471751 () Bool)

(assert (=> start!44752 m!471751))

(declare-fun m!471753 () Bool)

(assert (=> start!44752 m!471753))

(declare-fun m!471755 () Bool)

(assert (=> b!491255 m!471755))

(declare-fun m!471757 () Bool)

(assert (=> b!491261 m!471757))

(declare-fun m!471759 () Bool)

(assert (=> b!491261 m!471759))

(declare-fun m!471761 () Bool)

(assert (=> b!491261 m!471761))

(declare-fun m!471763 () Bool)

(assert (=> b!491261 m!471763))

(declare-fun m!471765 () Bool)

(assert (=> b!491261 m!471765))

(declare-fun m!471767 () Bool)

(assert (=> b!491261 m!471767))

(declare-fun m!471769 () Bool)

(assert (=> b!491261 m!471769))

(assert (=> b!491261 m!471765))

(declare-fun m!471771 () Bool)

(assert (=> b!491261 m!471771))

(assert (=> b!491261 m!471765))

(declare-fun m!471773 () Bool)

(assert (=> b!491261 m!471773))

(assert (=> b!491261 m!471765))

(assert (=> b!491261 m!471763))

(assert (=> b!491261 m!471769))

(declare-fun m!471775 () Bool)

(assert (=> b!491261 m!471775))

(declare-fun m!471777 () Bool)

(assert (=> b!491253 m!471777))

(declare-fun m!471779 () Bool)

(assert (=> b!491259 m!471779))

(assert (=> b!491256 m!471765))

(assert (=> b!491256 m!471765))

(declare-fun m!471781 () Bool)

(assert (=> b!491256 m!471781))

(push 1)

(assert (not b!491256))

(assert (not b!491255))

(assert (not b!491254))

(assert (not b!491261))

