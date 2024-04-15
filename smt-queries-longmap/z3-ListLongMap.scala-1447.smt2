; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27920 () Bool)

(assert start!27920)

(declare-fun b!286680 () Bool)

(declare-fun res!148742 () Bool)

(declare-fun e!181615 () Bool)

(assert (=> b!286680 (=> (not res!148742) (not e!181615))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286680 (= res!148742 (validKeyInArray!0 k0!2524))))

(declare-fun b!286681 () Bool)

(declare-fun e!181617 () Bool)

(assert (=> b!286681 (= e!181615 e!181617)))

(declare-fun res!148745 () Bool)

(assert (=> b!286681 (=> (not res!148745) (not e!181617))))

(declare-datatypes ((SeekEntryResult!1961 0))(
  ( (MissingZero!1961 (index!10014 (_ BitVec 32))) (Found!1961 (index!10015 (_ BitVec 32))) (Intermediate!1961 (undefined!2773 Bool) (index!10016 (_ BitVec 32)) (x!28251 (_ BitVec 32))) (Undefined!1961) (MissingVacant!1961 (index!10017 (_ BitVec 32))) )
))
(declare-fun lt!141090 () SeekEntryResult!1961)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286681 (= res!148745 (or (= lt!141090 (MissingZero!1961 i!1256)) (= lt!141090 (MissingVacant!1961 i!1256))))))

(declare-datatypes ((array!14362 0))(
  ( (array!14363 (arr!6813 (Array (_ BitVec 32) (_ BitVec 64))) (size!7166 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14362)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14362 (_ BitVec 32)) SeekEntryResult!1961)

(assert (=> b!286681 (= lt!141090 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286682 () Bool)

(declare-fun res!148743 () Bool)

(assert (=> b!286682 (=> (not res!148743) (not e!181615))))

(declare-fun arrayContainsKey!0 (array!14362 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286682 (= res!148743 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!148747 () Bool)

(assert (=> start!27920 (=> (not res!148747) (not e!181615))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27920 (= res!148747 (validMask!0 mask!3809))))

(assert (=> start!27920 e!181615))

(assert (=> start!27920 true))

(declare-fun array_inv!4785 (array!14362) Bool)

(assert (=> start!27920 (array_inv!4785 a!3312)))

(declare-fun b!286683 () Bool)

(assert (=> b!286683 (= e!181617 false)))

(declare-fun lt!141089 () (_ BitVec 32))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!286683 (= lt!141089 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!286684 () Bool)

(declare-fun res!148746 () Bool)

(assert (=> b!286684 (=> (not res!148746) (not e!181617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14362 (_ BitVec 32)) Bool)

(assert (=> b!286684 (= res!148746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286685 () Bool)

(declare-fun res!148744 () Bool)

(assert (=> b!286685 (=> (not res!148744) (not e!181615))))

(assert (=> b!286685 (= res!148744 (and (= (size!7166 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7166 a!3312))))))

(assert (= (and start!27920 res!148747) b!286685))

(assert (= (and b!286685 res!148744) b!286680))

(assert (= (and b!286680 res!148742) b!286682))

(assert (= (and b!286682 res!148743) b!286681))

(assert (= (and b!286681 res!148745) b!286684))

(assert (= (and b!286684 res!148746) b!286683))

(declare-fun m!300815 () Bool)

(assert (=> b!286683 m!300815))

(declare-fun m!300817 () Bool)

(assert (=> start!27920 m!300817))

(declare-fun m!300819 () Bool)

(assert (=> start!27920 m!300819))

(declare-fun m!300821 () Bool)

(assert (=> b!286684 m!300821))

(declare-fun m!300823 () Bool)

(assert (=> b!286680 m!300823))

(declare-fun m!300825 () Bool)

(assert (=> b!286682 m!300825))

(declare-fun m!300827 () Bool)

(assert (=> b!286681 m!300827))

(check-sat (not b!286683) (not b!286684) (not start!27920) (not b!286680) (not b!286682) (not b!286681))
(check-sat)
