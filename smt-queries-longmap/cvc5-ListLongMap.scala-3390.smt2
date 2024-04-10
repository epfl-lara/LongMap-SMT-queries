; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!46752 () Bool)

(assert start!46752)

(declare-fun b!516271 () Bool)

(declare-fun res!315839 () Bool)

(declare-fun e!301327 () Bool)

(assert (=> b!516271 (=> (not res!315839) (not e!301327))))

(declare-datatypes ((array!33064 0))(
  ( (array!33065 (arr!15900 (Array (_ BitVec 32) (_ BitVec 64))) (size!16264 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!33064)

(declare-datatypes ((List!10058 0))(
  ( (Nil!10055) (Cons!10054 (h!10952 (_ BitVec 64)) (t!16286 List!10058)) )
))
(declare-fun arrayNoDuplicates!0 (array!33064 (_ BitVec 32) List!10058) Bool)

(assert (=> b!516271 (= res!315839 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!10055))))

(declare-fun b!516272 () Bool)

(declare-fun res!315838 () Bool)

(declare-fun e!301329 () Bool)

(assert (=> b!516272 (=> (not res!315838) (not e!301329))))

(declare-fun j!176 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!516272 (= res!315838 (validKeyInArray!0 (select (arr!15900 a!3235) j!176)))))

(declare-fun b!516273 () Bool)

(declare-fun res!315845 () Bool)

(declare-fun e!301328 () Bool)

(assert (=> b!516273 (=> res!315845 e!301328)))

(declare-datatypes ((SeekEntryResult!4367 0))(
  ( (MissingZero!4367 (index!19656 (_ BitVec 32))) (Found!4367 (index!19657 (_ BitVec 32))) (Intermediate!4367 (undefined!5179 Bool) (index!19658 (_ BitVec 32)) (x!48618 (_ BitVec 32))) (Undefined!4367) (MissingVacant!4367 (index!19659 (_ BitVec 32))) )
))
(declare-fun lt!236341 () SeekEntryResult!4367)

(assert (=> b!516273 (= res!315845 (or (undefined!5179 lt!236341) (not (is-Intermediate!4367 lt!236341))))))

(declare-fun b!516275 () Bool)

(declare-fun res!315835 () Bool)

(assert (=> b!516275 (=> (not res!315835) (not e!301327))))

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33064 (_ BitVec 32)) Bool)

(assert (=> b!516275 (= res!315835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!516276 () Bool)

(declare-fun res!315842 () Bool)

(assert (=> b!516276 (=> (not res!315842) (not e!301329))))

(declare-fun k!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33064 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!516276 (= res!315842 (not (arrayContainsKey!0 a!3235 k!2280 #b00000000000000000000000000000000)))))

(declare-fun b!516277 () Bool)

(declare-fun res!315837 () Bool)

(assert (=> b!516277 (=> (not res!315837) (not e!301329))))

(assert (=> b!516277 (= res!315837 (validKeyInArray!0 k!2280))))

(declare-fun b!516278 () Bool)

(assert (=> b!516278 (= e!301329 e!301327)))

(declare-fun res!315836 () Bool)

(assert (=> b!516278 (=> (not res!315836) (not e!301327))))

(declare-fun lt!236342 () SeekEntryResult!4367)

(declare-fun i!1204 () (_ BitVec 32))

(assert (=> b!516278 (= res!315836 (or (= lt!236342 (MissingZero!4367 i!1204)) (= lt!236342 (MissingVacant!4367 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33064 (_ BitVec 32)) SeekEntryResult!4367)

(assert (=> b!516278 (= lt!236342 (seekEntryOrOpen!0 k!2280 a!3235 mask!3524))))

(declare-fun b!516279 () Bool)

(assert (=> b!516279 (= e!301328 true)))

(assert (=> b!516279 (and (bvslt (x!48618 lt!236341) #b01111111111111111111111111111110) (or (= (select (arr!15900 a!3235) (index!19658 lt!236341)) (select (arr!15900 a!3235) j!176)) (= (select (arr!15900 a!3235) (index!19658 lt!236341)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!15900 a!3235) (index!19658 lt!236341)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!315841 () Bool)

(assert (=> start!46752 (=> (not res!315841) (not e!301329))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46752 (= res!315841 (validMask!0 mask!3524))))

(assert (=> start!46752 e!301329))

(assert (=> start!46752 true))

(declare-fun array_inv!11696 (array!33064) Bool)

(assert (=> start!46752 (array_inv!11696 a!3235)))

(declare-fun b!516274 () Bool)

(declare-fun e!301326 () Bool)

(assert (=> b!516274 (= e!301326 (= (seekEntryOrOpen!0 (select (arr!15900 a!3235) j!176) a!3235 mask!3524) (Found!4367 j!176)))))

(declare-fun b!516280 () Bool)

(assert (=> b!516280 (= e!301327 (not e!301328))))

(declare-fun res!315840 () Bool)

(assert (=> b!516280 (=> res!315840 e!301328)))

(declare-fun lt!236344 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33064 (_ BitVec 32)) SeekEntryResult!4367)

(assert (=> b!516280 (= res!315840 (= lt!236341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236344 (select (store (arr!15900 a!3235) i!1204 k!2280) j!176) (array!33065 (store (arr!15900 a!3235) i!1204 k!2280) (size!16264 a!3235)) mask!3524)))))

(declare-fun lt!236343 () (_ BitVec 32))

(assert (=> b!516280 (= lt!236341 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!236343 (select (arr!15900 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!516280 (= lt!236344 (toIndex!0 (select (store (arr!15900 a!3235) i!1204 k!2280) j!176) mask!3524))))

(assert (=> b!516280 (= lt!236343 (toIndex!0 (select (arr!15900 a!3235) j!176) mask!3524))))

(assert (=> b!516280 e!301326))

(declare-fun res!315843 () Bool)

(assert (=> b!516280 (=> (not res!315843) (not e!301326))))

(assert (=> b!516280 (= res!315843 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15992 0))(
  ( (Unit!15993) )
))
(declare-fun lt!236340 () Unit!15992)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!33064 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15992)

(assert (=> b!516280 (= lt!236340 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!516281 () Bool)

(declare-fun res!315844 () Bool)

(assert (=> b!516281 (=> (not res!315844) (not e!301329))))

(assert (=> b!516281 (= res!315844 (and (= (size!16264 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16264 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16264 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46752 res!315841) b!516281))

(assert (= (and b!516281 res!315844) b!516272))

(assert (= (and b!516272 res!315838) b!516277))

(assert (= (and b!516277 res!315837) b!516276))

(assert (= (and b!516276 res!315842) b!516278))

(assert (= (and b!516278 res!315836) b!516275))

(assert (= (and b!516275 res!315835) b!516271))

(assert (= (and b!516271 res!315839) b!516280))

(assert (= (and b!516280 res!315843) b!516274))

(assert (= (and b!516280 (not res!315840)) b!516273))

(assert (= (and b!516273 (not res!315845)) b!516279))

(declare-fun m!497733 () Bool)

(assert (=> b!516277 m!497733))

(declare-fun m!497735 () Bool)

(assert (=> b!516272 m!497735))

(assert (=> b!516272 m!497735))

(declare-fun m!497737 () Bool)

(assert (=> b!516272 m!497737))

(declare-fun m!497739 () Bool)

(assert (=> b!516271 m!497739))

(declare-fun m!497741 () Bool)

(assert (=> b!516275 m!497741))

(assert (=> b!516274 m!497735))

(assert (=> b!516274 m!497735))

(declare-fun m!497743 () Bool)

(assert (=> b!516274 m!497743))

(declare-fun m!497745 () Bool)

(assert (=> b!516278 m!497745))

(declare-fun m!497747 () Bool)

(assert (=> b!516279 m!497747))

(assert (=> b!516279 m!497735))

(declare-fun m!497749 () Bool)

(assert (=> start!46752 m!497749))

(declare-fun m!497751 () Bool)

(assert (=> start!46752 m!497751))

(declare-fun m!497753 () Bool)

(assert (=> b!516280 m!497753))

(declare-fun m!497755 () Bool)

(assert (=> b!516280 m!497755))

(assert (=> b!516280 m!497735))

(declare-fun m!497757 () Bool)

(assert (=> b!516280 m!497757))

(assert (=> b!516280 m!497735))

(declare-fun m!497759 () Bool)

(assert (=> b!516280 m!497759))

(declare-fun m!497761 () Bool)

(assert (=> b!516280 m!497761))

(declare-fun m!497763 () Bool)

(assert (=> b!516280 m!497763))

(assert (=> b!516280 m!497735))

(declare-fun m!497765 () Bool)

(assert (=> b!516280 m!497765))

(assert (=> b!516280 m!497761))

(declare-fun m!497767 () Bool)

(assert (=> b!516280 m!497767))

(assert (=> b!516280 m!497761))

(declare-fun m!497769 () Bool)

(assert (=> b!516276 m!497769))

(push 1)

