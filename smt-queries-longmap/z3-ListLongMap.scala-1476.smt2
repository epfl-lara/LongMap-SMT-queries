; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28244 () Bool)

(assert start!28244)

(declare-fun b!289285 () Bool)

(declare-fun res!150914 () Bool)

(declare-fun e!183156 () Bool)

(assert (=> b!289285 (=> (not res!150914) (not e!183156))))

(declare-datatypes ((array!14558 0))(
  ( (array!14559 (arr!6906 (Array (_ BitVec 32) (_ BitVec 64))) (size!7258 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14558)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14558 (_ BitVec 32)) Bool)

(assert (=> b!289285 (= res!150914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150908 () Bool)

(declare-fun e!183154 () Bool)

(assert (=> start!28244 (=> (not res!150908) (not e!183154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28244 (= res!150908 (validMask!0 mask!3809))))

(assert (=> start!28244 e!183154))

(assert (=> start!28244 true))

(declare-fun array_inv!4869 (array!14558) Bool)

(assert (=> start!28244 (array_inv!4869 a!3312)))

(declare-fun b!289286 () Bool)

(declare-fun res!150915 () Bool)

(assert (=> b!289286 (=> (not res!150915) (not e!183154))))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14558 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289286 (= res!150915 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289287 () Bool)

(declare-fun e!183158 () Bool)

(assert (=> b!289287 (= e!183156 e!183158)))

(declare-fun res!150910 () Bool)

(assert (=> b!289287 (=> (not res!150910) (not e!183158))))

(declare-fun lt!142717 () Bool)

(assert (=> b!289287 (= res!150910 lt!142717)))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142716 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2055 0))(
  ( (MissingZero!2055 (index!10390 (_ BitVec 32))) (Found!2055 (index!10391 (_ BitVec 32))) (Intermediate!2055 (undefined!2867 Bool) (index!10392 (_ BitVec 32)) (x!28596 (_ BitVec 32))) (Undefined!2055) (MissingVacant!2055 (index!10393 (_ BitVec 32))) )
))
(declare-fun lt!142719 () SeekEntryResult!2055)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14558 (_ BitVec 32)) SeekEntryResult!2055)

(assert (=> b!289287 (= lt!142719 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142716 k0!2524 (array!14559 (store (arr!6906 a!3312) i!1256 k0!2524) (size!7258 a!3312)) mask!3809))))

(declare-fun lt!142718 () SeekEntryResult!2055)

(assert (=> b!289287 (= lt!142718 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142716 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289287 (= lt!142716 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289288 () Bool)

(declare-fun e!183157 () Bool)

(assert (=> b!289288 (= e!183157 (not true))))

(assert (=> b!289288 (and (= (select (arr!6906 a!3312) (index!10392 lt!142718)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10392 lt!142718) i!1256))))

(declare-fun b!289289 () Bool)

(assert (=> b!289289 (= e!183158 e!183157)))

(declare-fun res!150911 () Bool)

(assert (=> b!289289 (=> (not res!150911) (not e!183157))))

(declare-fun lt!142715 () Bool)

(assert (=> b!289289 (= res!150911 (and (or lt!142715 (not (undefined!2867 lt!142718))) (or lt!142715 (not (= (select (arr!6906 a!3312) (index!10392 lt!142718)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142715 (not (= (select (arr!6906 a!3312) (index!10392 lt!142718)) k0!2524))) (not lt!142715)))))

(get-info :version)

(assert (=> b!289289 (= lt!142715 (not ((_ is Intermediate!2055) lt!142718)))))

(declare-fun b!289290 () Bool)

(declare-fun res!150912 () Bool)

(assert (=> b!289290 (=> (not res!150912) (not e!183154))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289290 (= res!150912 (validKeyInArray!0 k0!2524))))

(declare-fun b!289291 () Bool)

(declare-fun res!150913 () Bool)

(assert (=> b!289291 (=> (not res!150913) (not e!183154))))

(assert (=> b!289291 (= res!150913 (and (= (size!7258 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7258 a!3312))))))

(declare-fun b!289292 () Bool)

(assert (=> b!289292 (= e!183154 e!183156)))

(declare-fun res!150909 () Bool)

(assert (=> b!289292 (=> (not res!150909) (not e!183156))))

(declare-fun lt!142720 () SeekEntryResult!2055)

(assert (=> b!289292 (= res!150909 (or lt!142717 (= lt!142720 (MissingVacant!2055 i!1256))))))

(assert (=> b!289292 (= lt!142717 (= lt!142720 (MissingZero!2055 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14558 (_ BitVec 32)) SeekEntryResult!2055)

(assert (=> b!289292 (= lt!142720 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28244 res!150908) b!289291))

(assert (= (and b!289291 res!150913) b!289290))

(assert (= (and b!289290 res!150912) b!289286))

(assert (= (and b!289286 res!150915) b!289292))

(assert (= (and b!289292 res!150909) b!289285))

(assert (= (and b!289285 res!150914) b!289287))

(assert (= (and b!289287 res!150910) b!289289))

(assert (= (and b!289289 res!150911) b!289288))

(declare-fun m!303445 () Bool)

(assert (=> b!289288 m!303445))

(declare-fun m!303447 () Bool)

(assert (=> start!28244 m!303447))

(declare-fun m!303449 () Bool)

(assert (=> start!28244 m!303449))

(declare-fun m!303451 () Bool)

(assert (=> b!289290 m!303451))

(assert (=> b!289289 m!303445))

(declare-fun m!303453 () Bool)

(assert (=> b!289286 m!303453))

(declare-fun m!303455 () Bool)

(assert (=> b!289287 m!303455))

(declare-fun m!303457 () Bool)

(assert (=> b!289287 m!303457))

(declare-fun m!303459 () Bool)

(assert (=> b!289287 m!303459))

(declare-fun m!303461 () Bool)

(assert (=> b!289287 m!303461))

(declare-fun m!303463 () Bool)

(assert (=> b!289285 m!303463))

(declare-fun m!303465 () Bool)

(assert (=> b!289292 m!303465))

(check-sat (not b!289292) (not b!289290) (not start!28244) (not b!289285) (not b!289287) (not b!289286))
(check-sat)
