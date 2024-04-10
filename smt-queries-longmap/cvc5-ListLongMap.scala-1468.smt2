; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28194 () Bool)

(assert start!28194)

(declare-fun b!288685 () Bool)

(declare-fun res!150313 () Bool)

(declare-fun e!182783 () Bool)

(assert (=> b!288685 (=> (not res!150313) (not e!182783))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14508 0))(
  ( (array!14509 (arr!6881 (Array (_ BitVec 32) (_ BitVec 64))) (size!7233 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14508)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!288685 (= res!150313 (and (= (size!7233 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7233 a!3312))))))

(declare-fun b!288686 () Bool)

(declare-fun res!150312 () Bool)

(declare-fun e!182782 () Bool)

(assert (=> b!288686 (=> (not res!150312) (not e!182782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14508 (_ BitVec 32)) Bool)

(assert (=> b!288686 (= res!150312 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!288687 () Bool)

(declare-fun e!182779 () Bool)

(assert (=> b!288687 (= e!182779 (not true))))

(declare-datatypes ((SeekEntryResult!2030 0))(
  ( (MissingZero!2030 (index!10290 (_ BitVec 32))) (Found!2030 (index!10291 (_ BitVec 32))) (Intermediate!2030 (undefined!2842 Bool) (index!10292 (_ BitVec 32)) (x!28507 (_ BitVec 32))) (Undefined!2030) (MissingVacant!2030 (index!10293 (_ BitVec 32))) )
))
(declare-fun lt!142268 () SeekEntryResult!2030)

(assert (=> b!288687 (and (= (select (arr!6881 a!3312) (index!10292 lt!142268)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10292 lt!142268) i!1256))))

(declare-fun b!288688 () Bool)

(declare-fun res!150308 () Bool)

(assert (=> b!288688 (=> (not res!150308) (not e!182783))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!288688 (= res!150308 (validKeyInArray!0 k!2524))))

(declare-fun res!150311 () Bool)

(assert (=> start!28194 (=> (not res!150311) (not e!182783))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28194 (= res!150311 (validMask!0 mask!3809))))

(assert (=> start!28194 e!182783))

(assert (=> start!28194 true))

(declare-fun array_inv!4844 (array!14508) Bool)

(assert (=> start!28194 (array_inv!4844 a!3312)))

(declare-fun b!288689 () Bool)

(assert (=> b!288689 (= e!182783 e!182782)))

(declare-fun res!150314 () Bool)

(assert (=> b!288689 (=> (not res!150314) (not e!182782))))

(declare-fun lt!142270 () Bool)

(declare-fun lt!142269 () SeekEntryResult!2030)

(assert (=> b!288689 (= res!150314 (or lt!142270 (= lt!142269 (MissingVacant!2030 i!1256))))))

(assert (=> b!288689 (= lt!142270 (= lt!142269 (MissingZero!2030 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14508 (_ BitVec 32)) SeekEntryResult!2030)

(assert (=> b!288689 (= lt!142269 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!288690 () Bool)

(declare-fun e!182780 () Bool)

(assert (=> b!288690 (= e!182782 e!182780)))

(declare-fun res!150310 () Bool)

(assert (=> b!288690 (=> (not res!150310) (not e!182780))))

(assert (=> b!288690 (= res!150310 lt!142270)))

(declare-fun lt!142266 () (_ BitVec 32))

(declare-fun lt!142267 () SeekEntryResult!2030)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14508 (_ BitVec 32)) SeekEntryResult!2030)

(assert (=> b!288690 (= lt!142267 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142266 k!2524 (array!14509 (store (arr!6881 a!3312) i!1256 k!2524) (size!7233 a!3312)) mask!3809))))

(assert (=> b!288690 (= lt!142268 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142266 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!288690 (= lt!142266 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!288691 () Bool)

(declare-fun res!150309 () Bool)

(assert (=> b!288691 (=> (not res!150309) (not e!182783))))

(declare-fun arrayContainsKey!0 (array!14508 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!288691 (= res!150309 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!288692 () Bool)

(assert (=> b!288692 (= e!182780 e!182779)))

(declare-fun res!150315 () Bool)

(assert (=> b!288692 (=> (not res!150315) (not e!182779))))

(declare-fun lt!142265 () Bool)

(assert (=> b!288692 (= res!150315 (and (or lt!142265 (not (undefined!2842 lt!142268))) (or lt!142265 (not (= (select (arr!6881 a!3312) (index!10292 lt!142268)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!142265 (not (= (select (arr!6881 a!3312) (index!10292 lt!142268)) k!2524))) (not lt!142265)))))

(assert (=> b!288692 (= lt!142265 (not (is-Intermediate!2030 lt!142268)))))

(assert (= (and start!28194 res!150311) b!288685))

(assert (= (and b!288685 res!150313) b!288688))

(assert (= (and b!288688 res!150308) b!288691))

(assert (= (and b!288691 res!150309) b!288689))

(assert (= (and b!288689 res!150314) b!288686))

(assert (= (and b!288686 res!150312) b!288690))

(assert (= (and b!288690 res!150310) b!288692))

(assert (= (and b!288692 res!150315) b!288687))

(declare-fun m!302895 () Bool)

(assert (=> b!288688 m!302895))

(declare-fun m!302897 () Bool)

(assert (=> start!28194 m!302897))

(declare-fun m!302899 () Bool)

(assert (=> start!28194 m!302899))

(declare-fun m!302901 () Bool)

(assert (=> b!288687 m!302901))

(assert (=> b!288692 m!302901))

(declare-fun m!302903 () Bool)

(assert (=> b!288686 m!302903))

(declare-fun m!302905 () Bool)

(assert (=> b!288689 m!302905))

(declare-fun m!302907 () Bool)

(assert (=> b!288690 m!302907))

(declare-fun m!302909 () Bool)

(assert (=> b!288690 m!302909))

(declare-fun m!302911 () Bool)

(assert (=> b!288690 m!302911))

(declare-fun m!302913 () Bool)

(assert (=> b!288690 m!302913))

(declare-fun m!302915 () Bool)

(assert (=> b!288691 m!302915))

(push 1)

