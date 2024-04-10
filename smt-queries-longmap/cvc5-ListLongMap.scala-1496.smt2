; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28410 () Bool)

(assert start!28410)

(declare-fun b!290881 () Bool)

(declare-fun res!152219 () Bool)

(declare-fun e!184066 () Bool)

(assert (=> b!290881 (=> (not res!152219) (not e!184066))))

(declare-datatypes ((array!14679 0))(
  ( (array!14680 (arr!6965 (Array (_ BitVec 32) (_ BitVec 64))) (size!7317 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14679)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14679 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290881 (= res!152219 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!152226 () Bool)

(assert (=> start!28410 (=> (not res!152226) (not e!184066))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28410 (= res!152226 (validMask!0 mask!3809))))

(assert (=> start!28410 e!184066))

(assert (=> start!28410 true))

(declare-fun array_inv!4928 (array!14679) Bool)

(assert (=> start!28410 (array_inv!4928 a!3312)))

(declare-fun b!290882 () Bool)

(declare-fun res!152221 () Bool)

(assert (=> b!290882 (=> (not res!152221) (not e!184066))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!290882 (= res!152221 (and (= (size!7317 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7317 a!3312))))))

(declare-fun b!290883 () Bool)

(declare-fun e!184065 () Bool)

(declare-fun e!184063 () Bool)

(assert (=> b!290883 (= e!184065 e!184063)))

(declare-fun res!152222 () Bool)

(assert (=> b!290883 (=> (not res!152222) (not e!184063))))

(declare-fun lt!143775 () Bool)

(declare-datatypes ((SeekEntryResult!2114 0))(
  ( (MissingZero!2114 (index!10626 (_ BitVec 32))) (Found!2114 (index!10627 (_ BitVec 32))) (Intermediate!2114 (undefined!2926 Bool) (index!10628 (_ BitVec 32)) (x!28821 (_ BitVec 32))) (Undefined!2114) (MissingVacant!2114 (index!10629 (_ BitVec 32))) )
))
(declare-fun lt!143778 () SeekEntryResult!2114)

(assert (=> b!290883 (= res!152222 (and (not lt!143775) (= lt!143778 (MissingVacant!2114 i!1256))))))

(declare-fun lt!143774 () (_ BitVec 32))

(declare-fun lt!143777 () SeekEntryResult!2114)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14679 (_ BitVec 32)) SeekEntryResult!2114)

(assert (=> b!290883 (= lt!143777 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143774 k!2524 (array!14680 (store (arr!6965 a!3312) i!1256 k!2524) (size!7317 a!3312)) mask!3809))))

(declare-fun lt!143779 () SeekEntryResult!2114)

(assert (=> b!290883 (= lt!143779 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143774 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290883 (= lt!143774 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290884 () Bool)

(declare-fun res!152225 () Bool)

(assert (=> b!290884 (=> (not res!152225) (not e!184065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14679 (_ BitVec 32)) Bool)

(assert (=> b!290884 (= res!152225 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!290885 () Bool)

(assert (=> b!290885 (= e!184066 e!184065)))

(declare-fun res!152224 () Bool)

(assert (=> b!290885 (=> (not res!152224) (not e!184065))))

(assert (=> b!290885 (= res!152224 (or lt!143775 (= lt!143778 (MissingVacant!2114 i!1256))))))

(assert (=> b!290885 (= lt!143775 (= lt!143778 (MissingZero!2114 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14679 (_ BitVec 32)) SeekEntryResult!2114)

(assert (=> b!290885 (= lt!143778 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290886 () Bool)

(declare-fun e!184067 () Bool)

(assert (=> b!290886 (= e!184063 e!184067)))

(declare-fun res!152223 () Bool)

(assert (=> b!290886 (=> (not res!152223) (not e!184067))))

(declare-fun lt!143776 () Bool)

(assert (=> b!290886 (= res!152223 (and (or lt!143776 (not (undefined!2926 lt!143779))) (not lt!143776) (= (select (arr!6965 a!3312) (index!10628 lt!143779)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290886 (= lt!143776 (not (is-Intermediate!2114 lt!143779)))))

(declare-fun b!290887 () Bool)

(assert (=> b!290887 (= e!184067 (not true))))

(assert (=> b!290887 (= (index!10628 lt!143779) i!1256)))

(declare-fun b!290888 () Bool)

(declare-fun res!152220 () Bool)

(assert (=> b!290888 (=> (not res!152220) (not e!184066))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290888 (= res!152220 (validKeyInArray!0 k!2524))))

(assert (= (and start!28410 res!152226) b!290882))

(assert (= (and b!290882 res!152221) b!290888))

(assert (= (and b!290888 res!152220) b!290881))

(assert (= (and b!290881 res!152219) b!290885))

(assert (= (and b!290885 res!152224) b!290884))

(assert (= (and b!290884 res!152225) b!290883))

(assert (= (and b!290883 res!152222) b!290886))

(assert (= (and b!290886 res!152223) b!290887))

(declare-fun m!304863 () Bool)

(assert (=> b!290888 m!304863))

(declare-fun m!304865 () Bool)

(assert (=> b!290883 m!304865))

(declare-fun m!304867 () Bool)

(assert (=> b!290883 m!304867))

(declare-fun m!304869 () Bool)

(assert (=> b!290883 m!304869))

(declare-fun m!304871 () Bool)

(assert (=> b!290883 m!304871))

(declare-fun m!304873 () Bool)

(assert (=> start!28410 m!304873))

(declare-fun m!304875 () Bool)

(assert (=> start!28410 m!304875))

(declare-fun m!304877 () Bool)

(assert (=> b!290886 m!304877))

(declare-fun m!304879 () Bool)

(assert (=> b!290881 m!304879))

(declare-fun m!304881 () Bool)

(assert (=> b!290885 m!304881))

(declare-fun m!304883 () Bool)

(assert (=> b!290884 m!304883))

(push 1)

