; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!44386 () Bool)

(assert start!44386)

(declare-fun b!487851 () Bool)

(declare-fun res!291129 () Bool)

(declare-fun e!287016 () Bool)

(assert (=> b!487851 (=> (not res!291129) (not e!287016))))

(declare-datatypes ((array!31592 0))(
  ( (array!31593 (arr!15188 (Array (_ BitVec 32) (_ BitVec 64))) (size!15552 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31592)

(declare-datatypes ((List!9346 0))(
  ( (Nil!9343) (Cons!9342 (h!10198 (_ BitVec 64)) (t!15574 List!9346)) )
))
(declare-fun arrayNoDuplicates!0 (array!31592 (_ BitVec 32) List!9346) Bool)

(assert (=> b!487851 (= res!291129 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9343))))

(declare-fun b!487853 () Bool)

(declare-fun res!291123 () Bool)

(assert (=> b!487853 (=> (not res!291123) (not e!287016))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31592 (_ BitVec 32)) Bool)

(assert (=> b!487853 (= res!291123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!487854 () Bool)

(declare-fun e!287017 () Bool)

(assert (=> b!487854 (= e!287017 e!287016)))

(declare-fun res!291124 () Bool)

(assert (=> b!487854 (=> (not res!291124) (not e!287016))))

(declare-datatypes ((SeekEntryResult!3655 0))(
  ( (MissingZero!3655 (index!16799 (_ BitVec 32))) (Found!3655 (index!16800 (_ BitVec 32))) (Intermediate!3655 (undefined!4467 Bool) (index!16801 (_ BitVec 32)) (x!45915 (_ BitVec 32))) (Undefined!3655) (MissingVacant!3655 (index!16802 (_ BitVec 32))) )
))
(declare-fun lt!220180 () SeekEntryResult!3655)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!487854 (= res!291124 (or (= lt!220180 (MissingZero!3655 i!1204)) (= lt!220180 (MissingVacant!3655 i!1204))))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31592 (_ BitVec 32)) SeekEntryResult!3655)

(assert (=> b!487854 (= lt!220180 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!487855 () Bool)

(assert (=> b!487855 (= e!287016 (not true))))

(declare-fun lt!220178 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!487855 (= lt!220178 (toIndex!0 (select (arr!15188 a!3235) j!176) mask!3524))))

(declare-fun e!287018 () Bool)

(assert (=> b!487855 e!287018))

(declare-fun res!291126 () Bool)

(assert (=> b!487855 (=> (not res!291126) (not e!287018))))

(assert (=> b!487855 (= res!291126 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!14256 0))(
  ( (Unit!14257) )
))
(declare-fun lt!220179 () Unit!14256)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31592 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14256)

(assert (=> b!487855 (= lt!220179 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!487856 () Bool)

(assert (=> b!487856 (= e!287018 (= (seekEntryOrOpen!0 (select (arr!15188 a!3235) j!176) a!3235 mask!3524) (Found!3655 j!176)))))

(declare-fun b!487852 () Bool)

(declare-fun res!291125 () Bool)

(assert (=> b!487852 (=> (not res!291125) (not e!287017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!487852 (= res!291125 (validKeyInArray!0 k!2280))))

(declare-fun res!291128 () Bool)

(assert (=> start!44386 (=> (not res!291128) (not e!287017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44386 (= res!291128 (validMask!0 mask!3524))))

(assert (=> start!44386 e!287017))

(assert (=> start!44386 true))

(declare-fun array_inv!10984 (array!31592) Bool)

(assert (=> start!44386 (array_inv!10984 a!3235)))

(declare-fun b!487857 () Bool)

(declare-fun res!291130 () Bool)

(assert (=> b!487857 (=> (not res!291130) (not e!287017))))

(declare-fun arrayContainsKey!0 (array!31592 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!487857 (= res!291130 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!487858 () Bool)

(declare-fun res!291131 () Bool)

(assert (=> b!487858 (=> (not res!291131) (not e!287017))))

(assert (=> b!487858 (= res!291131 (validKeyInArray!0 (select (arr!15188 a!3235) j!176)))))

(declare-fun b!487859 () Bool)

(declare-fun res!291127 () Bool)

(assert (=> b!487859 (=> (not res!291127) (not e!287017))))

(assert (=> b!487859 (= res!291127 (and (= (size!15552 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15552 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15552 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!44386 res!291128) b!487859))

(assert (= (and b!487859 res!291127) b!487858))

(assert (= (and b!487858 res!291131) b!487852))

(assert (= (and b!487852 res!291125) b!487857))

(assert (= (and b!487857 res!291130) b!487854))

(assert (= (and b!487854 res!291124) b!487853))

(assert (= (and b!487853 res!291123) b!487851))

(assert (= (and b!487851 res!291129) b!487855))

(assert (= (and b!487855 res!291126) b!487856))

(declare-fun m!467635 () Bool)

(assert (=> start!44386 m!467635))

(declare-fun m!467637 () Bool)

(assert (=> start!44386 m!467637))

(declare-fun m!467639 () Bool)

(assert (=> b!487851 m!467639))

(declare-fun m!467641 () Bool)

(assert (=> b!487856 m!467641))

(assert (=> b!487856 m!467641))

(declare-fun m!467643 () Bool)

(assert (=> b!487856 m!467643))

(declare-fun m!467645 () Bool)

(assert (=> b!487854 m!467645))

(declare-fun m!467647 () Bool)

(assert (=> b!487852 m!467647))

(assert (=> b!487855 m!467641))

(assert (=> b!487855 m!467641))

(declare-fun m!467649 () Bool)

(assert (=> b!487855 m!467649))

(declare-fun m!467651 () Bool)

(assert (=> b!487855 m!467651))

(declare-fun m!467653 () Bool)

(assert (=> b!487855 m!467653))

(declare-fun m!467655 () Bool)

(assert (=> b!487857 m!467655))

(assert (=> b!487858 m!467641))

(assert (=> b!487858 m!467641))

(declare-fun m!467657 () Bool)

(assert (=> b!487858 m!467657))

(declare-fun m!467659 () Bool)

(assert (=> b!487853 m!467659))

(push 1)

(assert (not b!487857))

(assert (not b!487854))

(assert (not b!487853))

(assert (not b!487858))

(assert (not b!487852))

(assert (not b!487855))

(assert (not b!487856))

(assert (not b!487851))

(assert (not start!44386))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

