; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!46112 () Bool)

(assert start!46112)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun b!510810 () Bool)

(declare-datatypes ((array!32823 0))(
  ( (array!32824 (arr!15790 (Array (_ BitVec 32) (_ BitVec 64))) (size!16154 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!32823)

(declare-fun e!298532 () Bool)

(declare-fun j!176 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!4257 0))(
  ( (MissingZero!4257 (index!19216 (_ BitVec 32))) (Found!4257 (index!19217 (_ BitVec 32))) (Intermediate!4257 (undefined!5069 Bool) (index!19218 (_ BitVec 32)) (x!48170 (_ BitVec 32))) (Undefined!4257) (MissingVacant!4257 (index!19219 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!32823 (_ BitVec 32)) SeekEntryResult!4257)

(assert (=> b!510810 (= e!298532 (= (seekEntryOrOpen!0 (select (arr!15790 a!3235) j!176) a!3235 mask!3524) (Found!4257 j!176)))))

(declare-fun res!311661 () Bool)

(declare-fun e!298530 () Bool)

(assert (=> start!46112 (=> (not res!311661) (not e!298530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!46112 (= res!311661 (validMask!0 mask!3524))))

(assert (=> start!46112 e!298530))

(assert (=> start!46112 true))

(declare-fun array_inv!11586 (array!32823) Bool)

(assert (=> start!46112 (array_inv!11586 a!3235)))

(declare-fun b!510811 () Bool)

(declare-fun res!311659 () Bool)

(assert (=> b!510811 (=> (not res!311659) (not e!298530))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!32823 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!510811 (= res!311659 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!510812 () Bool)

(declare-fun res!311662 () Bool)

(declare-fun e!298533 () Bool)

(assert (=> b!510812 (=> (not res!311662) (not e!298533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!32823 (_ BitVec 32)) Bool)

(assert (=> b!510812 (= res!311662 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!510813 () Bool)

(declare-fun res!311655 () Bool)

(assert (=> b!510813 (=> (not res!311655) (not e!298530))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!510813 (= res!311655 (validKeyInArray!0 k0!2280))))

(declare-fun b!510814 () Bool)

(assert (=> b!510814 (= e!298533 (not true))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun lt!233634 () SeekEntryResult!4257)

(declare-fun lt!233635 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!32823 (_ BitVec 32)) SeekEntryResult!4257)

(assert (=> b!510814 (= lt!233634 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233635 (select (store (arr!15790 a!3235) i!1204 k0!2280) j!176) (array!32824 (store (arr!15790 a!3235) i!1204 k0!2280) (size!16154 a!3235)) mask!3524))))

(declare-fun lt!233630 () (_ BitVec 32))

(declare-fun lt!233631 () SeekEntryResult!4257)

(assert (=> b!510814 (= lt!233631 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!233630 (select (arr!15790 a!3235) j!176) a!3235 mask!3524))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!510814 (= lt!233635 (toIndex!0 (select (store (arr!15790 a!3235) i!1204 k0!2280) j!176) mask!3524))))

(assert (=> b!510814 (= lt!233630 (toIndex!0 (select (arr!15790 a!3235) j!176) mask!3524))))

(assert (=> b!510814 e!298532))

(declare-fun res!311658 () Bool)

(assert (=> b!510814 (=> (not res!311658) (not e!298532))))

(assert (=> b!510814 (= res!311658 (arrayForallSeekEntryOrOpenFound!0 j!176 a!3235 mask!3524))))

(declare-datatypes ((Unit!15772 0))(
  ( (Unit!15773) )
))
(declare-fun lt!233633 () Unit!15772)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!32823 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!15772)

(assert (=> b!510814 (= lt!233633 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 a!3235 mask!3524 #b00000000000000000000000000000000 j!176))))

(declare-fun b!510815 () Bool)

(declare-fun res!311656 () Bool)

(assert (=> b!510815 (=> (not res!311656) (not e!298530))))

(assert (=> b!510815 (= res!311656 (validKeyInArray!0 (select (arr!15790 a!3235) j!176)))))

(declare-fun b!510816 () Bool)

(assert (=> b!510816 (= e!298530 e!298533)))

(declare-fun res!311657 () Bool)

(assert (=> b!510816 (=> (not res!311657) (not e!298533))))

(declare-fun lt!233632 () SeekEntryResult!4257)

(assert (=> b!510816 (= res!311657 (or (= lt!233632 (MissingZero!4257 i!1204)) (= lt!233632 (MissingVacant!4257 i!1204))))))

(assert (=> b!510816 (= lt!233632 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!510817 () Bool)

(declare-fun res!311663 () Bool)

(assert (=> b!510817 (=> (not res!311663) (not e!298533))))

(declare-datatypes ((List!9948 0))(
  ( (Nil!9945) (Cons!9944 (h!10821 (_ BitVec 64)) (t!16176 List!9948)) )
))
(declare-fun arrayNoDuplicates!0 (array!32823 (_ BitVec 32) List!9948) Bool)

(assert (=> b!510817 (= res!311663 (arrayNoDuplicates!0 a!3235 #b00000000000000000000000000000000 Nil!9945))))

(declare-fun b!510818 () Bool)

(declare-fun res!311660 () Bool)

(assert (=> b!510818 (=> (not res!311660) (not e!298530))))

(assert (=> b!510818 (= res!311660 (and (= (size!16154 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!16154 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!16154 a!3235)) (not (= i!1204 j!176))))))

(assert (= (and start!46112 res!311661) b!510818))

(assert (= (and b!510818 res!311660) b!510815))

(assert (= (and b!510815 res!311656) b!510813))

(assert (= (and b!510813 res!311655) b!510811))

(assert (= (and b!510811 res!311659) b!510816))

(assert (= (and b!510816 res!311657) b!510812))

(assert (= (and b!510812 res!311662) b!510817))

(assert (= (and b!510817 res!311663) b!510814))

(assert (= (and b!510814 res!311658) b!510810))

(declare-fun m!492249 () Bool)

(assert (=> b!510815 m!492249))

(assert (=> b!510815 m!492249))

(declare-fun m!492251 () Bool)

(assert (=> b!510815 m!492251))

(declare-fun m!492253 () Bool)

(assert (=> b!510813 m!492253))

(declare-fun m!492255 () Bool)

(assert (=> b!510812 m!492255))

(declare-fun m!492257 () Bool)

(assert (=> b!510817 m!492257))

(declare-fun m!492259 () Bool)

(assert (=> b!510811 m!492259))

(assert (=> b!510810 m!492249))

(assert (=> b!510810 m!492249))

(declare-fun m!492261 () Bool)

(assert (=> b!510810 m!492261))

(declare-fun m!492263 () Bool)

(assert (=> start!46112 m!492263))

(declare-fun m!492265 () Bool)

(assert (=> start!46112 m!492265))

(declare-fun m!492267 () Bool)

(assert (=> b!510816 m!492267))

(declare-fun m!492269 () Bool)

(assert (=> b!510814 m!492269))

(declare-fun m!492271 () Bool)

(assert (=> b!510814 m!492271))

(declare-fun m!492273 () Bool)

(assert (=> b!510814 m!492273))

(declare-fun m!492275 () Bool)

(assert (=> b!510814 m!492275))

(assert (=> b!510814 m!492269))

(assert (=> b!510814 m!492249))

(declare-fun m!492277 () Bool)

(assert (=> b!510814 m!492277))

(assert (=> b!510814 m!492249))

(assert (=> b!510814 m!492269))

(declare-fun m!492279 () Bool)

(assert (=> b!510814 m!492279))

(assert (=> b!510814 m!492249))

(declare-fun m!492281 () Bool)

(assert (=> b!510814 m!492281))

(declare-fun m!492283 () Bool)

(assert (=> b!510814 m!492283))

(check-sat (not b!510817) (not start!46112) (not b!510813) (not b!510811) (not b!510815) (not b!510812) (not b!510816) (not b!510810) (not b!510814))
(check-sat)
