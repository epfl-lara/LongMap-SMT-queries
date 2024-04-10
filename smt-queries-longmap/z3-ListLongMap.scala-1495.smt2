; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28406 () Bool)

(assert start!28406)

(declare-fun b!290833 () Bool)

(declare-fun e!184037 () Bool)

(declare-fun e!184035 () Bool)

(assert (=> b!290833 (= e!184037 e!184035)))

(declare-fun res!152172 () Bool)

(assert (=> b!290833 (=> (not res!152172) (not e!184035))))

(declare-fun lt!143742 () Bool)

(declare-datatypes ((array!14675 0))(
  ( (array!14676 (arr!6963 (Array (_ BitVec 32) (_ BitVec 64))) (size!7315 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14675)

(declare-datatypes ((SeekEntryResult!2112 0))(
  ( (MissingZero!2112 (index!10618 (_ BitVec 32))) (Found!2112 (index!10619 (_ BitVec 32))) (Intermediate!2112 (undefined!2924 Bool) (index!10620 (_ BitVec 32)) (x!28811 (_ BitVec 32))) (Undefined!2112) (MissingVacant!2112 (index!10621 (_ BitVec 32))) )
))
(declare-fun lt!143738 () SeekEntryResult!2112)

(assert (=> b!290833 (= res!152172 (and (or lt!143742 (not (undefined!2924 lt!143738))) (not lt!143742) (= (select (arr!6963 a!3312) (index!10620 lt!143738)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!290833 (= lt!143742 (not ((_ is Intermediate!2112) lt!143738)))))

(declare-fun b!290834 () Bool)

(declare-fun res!152175 () Bool)

(declare-fun e!184034 () Bool)

(assert (=> b!290834 (=> (not res!152175) (not e!184034))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290834 (= res!152175 (and (= (size!7315 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7315 a!3312))))))

(declare-fun b!290835 () Bool)

(declare-fun e!184033 () Bool)

(assert (=> b!290835 (= e!184033 e!184037)))

(declare-fun res!152174 () Bool)

(assert (=> b!290835 (=> (not res!152174) (not e!184037))))

(declare-fun lt!143740 () SeekEntryResult!2112)

(declare-fun lt!143739 () Bool)

(assert (=> b!290835 (= res!152174 (and (not lt!143739) (= lt!143740 (MissingVacant!2112 i!1256))))))

(declare-fun lt!143743 () SeekEntryResult!2112)

(declare-fun lt!143741 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14675 (_ BitVec 32)) SeekEntryResult!2112)

(assert (=> b!290835 (= lt!143743 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143741 k0!2524 (array!14676 (store (arr!6963 a!3312) i!1256 k0!2524) (size!7315 a!3312)) mask!3809))))

(assert (=> b!290835 (= lt!143738 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143741 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290835 (= lt!143741 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!152177 () Bool)

(assert (=> start!28406 (=> (not res!152177) (not e!184034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28406 (= res!152177 (validMask!0 mask!3809))))

(assert (=> start!28406 e!184034))

(assert (=> start!28406 true))

(declare-fun array_inv!4926 (array!14675) Bool)

(assert (=> start!28406 (array_inv!4926 a!3312)))

(declare-fun b!290836 () Bool)

(declare-fun res!152171 () Bool)

(assert (=> b!290836 (=> (not res!152171) (not e!184034))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290836 (= res!152171 (validKeyInArray!0 k0!2524))))

(declare-fun b!290837 () Bool)

(assert (=> b!290837 (= e!184035 (not true))))

(assert (=> b!290837 (= (index!10620 lt!143738) i!1256)))

(declare-fun b!290838 () Bool)

(declare-fun res!152176 () Bool)

(assert (=> b!290838 (=> (not res!152176) (not e!184034))))

(declare-fun arrayContainsKey!0 (array!14675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290838 (= res!152176 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!290839 () Bool)

(assert (=> b!290839 (= e!184034 e!184033)))

(declare-fun res!152178 () Bool)

(assert (=> b!290839 (=> (not res!152178) (not e!184033))))

(assert (=> b!290839 (= res!152178 (or lt!143739 (= lt!143740 (MissingVacant!2112 i!1256))))))

(assert (=> b!290839 (= lt!143739 (= lt!143740 (MissingZero!2112 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14675 (_ BitVec 32)) SeekEntryResult!2112)

(assert (=> b!290839 (= lt!143740 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!290840 () Bool)

(declare-fun res!152173 () Bool)

(assert (=> b!290840 (=> (not res!152173) (not e!184033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14675 (_ BitVec 32)) Bool)

(assert (=> b!290840 (= res!152173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28406 res!152177) b!290834))

(assert (= (and b!290834 res!152175) b!290836))

(assert (= (and b!290836 res!152171) b!290838))

(assert (= (and b!290838 res!152176) b!290839))

(assert (= (and b!290839 res!152178) b!290840))

(assert (= (and b!290840 res!152173) b!290835))

(assert (= (and b!290835 res!152174) b!290833))

(assert (= (and b!290833 res!152172) b!290837))

(declare-fun m!304819 () Bool)

(assert (=> b!290838 m!304819))

(declare-fun m!304821 () Bool)

(assert (=> b!290835 m!304821))

(declare-fun m!304823 () Bool)

(assert (=> b!290835 m!304823))

(declare-fun m!304825 () Bool)

(assert (=> b!290835 m!304825))

(declare-fun m!304827 () Bool)

(assert (=> b!290835 m!304827))

(declare-fun m!304829 () Bool)

(assert (=> b!290833 m!304829))

(declare-fun m!304831 () Bool)

(assert (=> b!290840 m!304831))

(declare-fun m!304833 () Bool)

(assert (=> b!290839 m!304833))

(declare-fun m!304835 () Bool)

(assert (=> b!290836 m!304835))

(declare-fun m!304837 () Bool)

(assert (=> start!28406 m!304837))

(declare-fun m!304839 () Bool)

(assert (=> start!28406 m!304839))

(check-sat (not b!290835) (not b!290836) (not b!290839) (not b!290838) (not b!290840) (not start!28406))
(check-sat)
