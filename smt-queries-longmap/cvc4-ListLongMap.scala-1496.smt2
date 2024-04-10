; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28414 () Bool)

(assert start!28414)

(declare-fun b!290929 () Bool)

(declare-fun res!152267 () Bool)

(declare-fun e!184095 () Bool)

(assert (=> b!290929 (=> (not res!152267) (not e!184095))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14683 0))(
  ( (array!14684 (arr!6967 (Array (_ BitVec 32) (_ BitVec 64))) (size!7319 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14683)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!290929 (= res!152267 (and (= (size!7319 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7319 a!3312))))))

(declare-fun b!290930 () Bool)

(declare-fun res!152274 () Bool)

(declare-fun e!184097 () Bool)

(assert (=> b!290930 (=> (not res!152274) (not e!184097))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14683 (_ BitVec 32)) Bool)

(assert (=> b!290930 (= res!152274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!152273 () Bool)

(assert (=> start!28414 (=> (not res!152273) (not e!184095))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28414 (= res!152273 (validMask!0 mask!3809))))

(assert (=> start!28414 e!184095))

(assert (=> start!28414 true))

(declare-fun array_inv!4930 (array!14683) Bool)

(assert (=> start!28414 (array_inv!4930 a!3312)))

(declare-fun b!290931 () Bool)

(declare-fun e!184093 () Bool)

(declare-fun e!184094 () Bool)

(assert (=> b!290931 (= e!184093 e!184094)))

(declare-fun res!152271 () Bool)

(assert (=> b!290931 (=> (not res!152271) (not e!184094))))

(declare-fun lt!143815 () Bool)

(declare-datatypes ((SeekEntryResult!2116 0))(
  ( (MissingZero!2116 (index!10634 (_ BitVec 32))) (Found!2116 (index!10635 (_ BitVec 32))) (Intermediate!2116 (undefined!2928 Bool) (index!10636 (_ BitVec 32)) (x!28823 (_ BitVec 32))) (Undefined!2116) (MissingVacant!2116 (index!10637 (_ BitVec 32))) )
))
(declare-fun lt!143811 () SeekEntryResult!2116)

(assert (=> b!290931 (= res!152271 (and (or lt!143815 (not (undefined!2928 lt!143811))) (not lt!143815) (= (select (arr!6967 a!3312) (index!10636 lt!143811)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!290931 (= lt!143815 (not (is-Intermediate!2116 lt!143811)))))

(declare-fun b!290932 () Bool)

(assert (=> b!290932 (= e!184094 (not true))))

(assert (=> b!290932 (= (index!10636 lt!143811) i!1256)))

(declare-fun b!290933 () Bool)

(assert (=> b!290933 (= e!184097 e!184093)))

(declare-fun res!152268 () Bool)

(assert (=> b!290933 (=> (not res!152268) (not e!184093))))

(declare-fun lt!143813 () SeekEntryResult!2116)

(declare-fun lt!143810 () Bool)

(assert (=> b!290933 (= res!152268 (and (not lt!143810) (= lt!143813 (MissingVacant!2116 i!1256))))))

(declare-fun lt!143814 () SeekEntryResult!2116)

(declare-fun lt!143812 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14683 (_ BitVec 32)) SeekEntryResult!2116)

(assert (=> b!290933 (= lt!143814 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143812 k!2524 (array!14684 (store (arr!6967 a!3312) i!1256 k!2524) (size!7319 a!3312)) mask!3809))))

(assert (=> b!290933 (= lt!143811 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!143812 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!290933 (= lt!143812 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!290934 () Bool)

(assert (=> b!290934 (= e!184095 e!184097)))

(declare-fun res!152269 () Bool)

(assert (=> b!290934 (=> (not res!152269) (not e!184097))))

(assert (=> b!290934 (= res!152269 (or lt!143810 (= lt!143813 (MissingVacant!2116 i!1256))))))

(assert (=> b!290934 (= lt!143810 (= lt!143813 (MissingZero!2116 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14683 (_ BitVec 32)) SeekEntryResult!2116)

(assert (=> b!290934 (= lt!143813 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!290935 () Bool)

(declare-fun res!152270 () Bool)

(assert (=> b!290935 (=> (not res!152270) (not e!184095))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!290935 (= res!152270 (validKeyInArray!0 k!2524))))

(declare-fun b!290936 () Bool)

(declare-fun res!152272 () Bool)

(assert (=> b!290936 (=> (not res!152272) (not e!184095))))

(declare-fun arrayContainsKey!0 (array!14683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!290936 (= res!152272 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!28414 res!152273) b!290929))

(assert (= (and b!290929 res!152267) b!290935))

(assert (= (and b!290935 res!152270) b!290936))

(assert (= (and b!290936 res!152272) b!290934))

(assert (= (and b!290934 res!152269) b!290930))

(assert (= (and b!290930 res!152274) b!290933))

(assert (= (and b!290933 res!152268) b!290931))

(assert (= (and b!290931 res!152271) b!290932))

(declare-fun m!304907 () Bool)

(assert (=> b!290935 m!304907))

(declare-fun m!304909 () Bool)

(assert (=> b!290930 m!304909))

(declare-fun m!304911 () Bool)

(assert (=> b!290936 m!304911))

(declare-fun m!304913 () Bool)

(assert (=> start!28414 m!304913))

(declare-fun m!304915 () Bool)

(assert (=> start!28414 m!304915))

(declare-fun m!304917 () Bool)

(assert (=> b!290931 m!304917))

(declare-fun m!304919 () Bool)

(assert (=> b!290933 m!304919))

(declare-fun m!304921 () Bool)

(assert (=> b!290933 m!304921))

(declare-fun m!304923 () Bool)

(assert (=> b!290933 m!304923))

(declare-fun m!304925 () Bool)

(assert (=> b!290933 m!304925))

(declare-fun m!304927 () Bool)

(assert (=> b!290934 m!304927))

(push 1)

