; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44718 () Bool)

(assert start!44718)

(declare-fun b!490785 () Bool)

(declare-fun res!293726 () Bool)

(declare-fun e!288460 () Bool)

(assert (=> b!490785 (=> (not res!293726) (not e!288460))))

(declare-datatypes ((array!31777 0))(
  ( (array!31778 (arr!15276 (Array (_ BitVec 32) (_ BitVec 64))) (size!15640 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31777)

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31777 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!490785 (= res!293726 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!490786 () Bool)

(declare-fun e!288461 () Bool)

(assert (=> b!490786 (= e!288460 e!288461)))

(declare-fun res!293727 () Bool)

(assert (=> b!490786 (=> (not res!293727) (not e!288461))))

(declare-datatypes ((SeekEntryResult!3743 0))(
  ( (MissingZero!3743 (index!17151 (_ BitVec 32))) (Found!3743 (index!17152 (_ BitVec 32))) (Intermediate!3743 (undefined!4555 Bool) (index!17153 (_ BitVec 32)) (x!46249 (_ BitVec 32))) (Undefined!3743) (MissingVacant!3743 (index!17154 (_ BitVec 32))) )
))
(declare-fun lt!221728 () SeekEntryResult!3743)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!490786 (= res!293727 (or (= lt!221728 (MissingZero!3743 i!1204)) (= lt!221728 (MissingVacant!3743 i!1204))))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31777 (_ BitVec 32)) SeekEntryResult!3743)

(assert (=> b!490786 (= lt!221728 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!490787 () Bool)

(declare-fun e!288459 () Bool)

(assert (=> b!490787 (= e!288459 true)))

(declare-fun lt!221725 () SeekEntryResult!3743)

(declare-fun lt!221724 () (_ BitVec 64))

(declare-fun lt!221723 () array!31777)

(assert (=> b!490787 (= lt!221725 (seekEntryOrOpen!0 lt!221724 lt!221723 mask!3524))))

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((Unit!14432 0))(
  ( (Unit!14433) )
))
(declare-fun lt!221727 () Unit!14432)

(declare-fun lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 (array!31777 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!14432)

(assert (=> b!490787 (= lt!221727 (lemmaPutValidKeyPreservesForallSeekEntryOrOpenKey1!0 a!3235 i!1204 k!2280 j!176 mask!3524))))

(declare-fun b!490788 () Bool)

(declare-fun res!293721 () Bool)

(assert (=> b!490788 (=> (not res!293721) (not e!288460))))

(assert (=> b!490788 (= res!293721 (and (= (size!15640 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15640 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15640 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!490789 () Bool)

(declare-fun res!293728 () Bool)

(assert (=> b!490789 (=> (not res!293728) (not e!288460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!490789 (= res!293728 (validKeyInArray!0 (select (arr!15276 a!3235) j!176)))))

(declare-fun res!293722 () Bool)

(assert (=> start!44718 (=> (not res!293722) (not e!288460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44718 (= res!293722 (validMask!0 mask!3524))))

(assert (=> start!44718 e!288460))

(assert (=> start!44718 true))

(declare-fun array_inv!11072 (array!31777) Bool)

(assert (=> start!44718 (array_inv!11072 a!3235)))

(declare-fun b!490790 () Bool)

(declare-fun res!293724 () Bool)

(assert (=> b!490790 (=> (not res!293724) (not e!288461))))

(declare-datatypes ((List!9434 0))(
  ( (Nil!9431) (Cons!9430 (h!10292 (_ BitVec 64)) (t!15662 List!9434)) )
))
(declare-fun arrayNoDuplicates!0 (array!31777 (_ BitVec 32) List!9434) Bool)

(assert (=> b!490790 (= res!293724 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9431))))

(declare-fun b!490791 () Bool)

(declare-fun res!293729 () Bool)

(assert (=> b!490791 (=> (not res!293729) (not e!288461))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31777 (_ BitVec 32)) Bool)

(assert (=> b!490791 (= res!293729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!490792 () Bool)

(declare-fun res!293725 () Bool)

(assert (=> b!490792 (=> (not res!293725) (not e!288460))))

(assert (=> b!490792 (= res!293725 (validKeyInArray!0 k!2280))))

(declare-fun b!490793 () Bool)

(assert (=> b!490793 (= e!288461 (not e!288459))))

(declare-fun res!293723 () Bool)

(assert (=> b!490793 (=> res!293723 e!288459)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31777 (_ BitVec 32)) SeekEntryResult!3743)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!490793 (= res!293723 (not (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!15276 a!3235) j!176) mask!3524) (select (arr!15276 a!3235) j!176) a!3235 mask!3524) (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 lt!221724 mask!3524) lt!221724 lt!221723 mask!3524))))))

(assert (=> b!490793 (= lt!221724 (select (store (arr!15276 a!3235) i!1204 k!2280) j!176))))

(assert (=> b!490793 (= lt!221723 (array!31778 (store (arr!15276 a!3235) i!1204 k!2280) (size!15640 a!3235)))))

(assert (=> b!490793 (= lt!221725 (Found!3743 j!176))))

(assert (=> b!490793 (= lt!221725 (seekEntryOrOpen!0 (select (arr!15276 a!3235) j!176) a!3235 mask!3524))))

(assert (=> b!490793 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524)))

(declare-fun lt!221726 () Unit!14432)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31777 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14432)

(assert (=> b!490793 (= lt!221726 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(assert (= (and start!44718 res!293722) b!490788))

(assert (= (and b!490788 res!293721) b!490789))

(assert (= (and b!490789 res!293728) b!490792))

(assert (= (and b!490792 res!293725) b!490785))

(assert (= (and b!490785 res!293726) b!490786))

(assert (= (and b!490786 res!293727) b!490791))

(assert (= (and b!490791 res!293729) b!490790))

(assert (= (and b!490790 res!293724) b!490793))

(assert (= (and b!490793 (not res!293723)) b!490787))

(declare-fun m!471057 () Bool)

(assert (=> b!490787 m!471057))

(declare-fun m!471059 () Bool)

(assert (=> b!490787 m!471059))

(declare-fun m!471061 () Bool)

(assert (=> b!490789 m!471061))

(assert (=> b!490789 m!471061))

(declare-fun m!471063 () Bool)

(assert (=> b!490789 m!471063))

(declare-fun m!471065 () Bool)

(assert (=> b!490786 m!471065))

(declare-fun m!471067 () Bool)

(assert (=> b!490793 m!471067))

(declare-fun m!471069 () Bool)

(assert (=> b!490793 m!471069))

(declare-fun m!471071 () Bool)

(assert (=> b!490793 m!471071))

(declare-fun m!471073 () Bool)

(assert (=> b!490793 m!471073))

(declare-fun m!471075 () Bool)

(assert (=> b!490793 m!471075))

(assert (=> b!490793 m!471061))

(declare-fun m!471077 () Bool)

(assert (=> b!490793 m!471077))

(assert (=> b!490793 m!471061))

(assert (=> b!490793 m!471075))

(assert (=> b!490793 m!471061))

(declare-fun m!471079 () Bool)

(assert (=> b!490793 m!471079))

(assert (=> b!490793 m!471061))

(declare-fun m!471081 () Bool)

(assert (=> b!490793 m!471081))

(assert (=> b!490793 m!471073))

(declare-fun m!471083 () Bool)

(assert (=> b!490793 m!471083))

(declare-fun m!471085 () Bool)

(assert (=> b!490790 m!471085))

(declare-fun m!471087 () Bool)

(assert (=> b!490792 m!471087))

(declare-fun m!471089 () Bool)

(assert (=> b!490791 m!471089))

(declare-fun m!471091 () Bool)

(assert (=> b!490785 m!471091))

(declare-fun m!471093 () Bool)

(assert (=> start!44718 m!471093))

(declare-fun m!471095 () Bool)

(assert (=> start!44718 m!471095))

(push 1)

