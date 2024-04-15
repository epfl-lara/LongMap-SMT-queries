; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28268 () Bool)

(assert start!28268)

(declare-fun res!151121 () Bool)

(declare-fun e!183295 () Bool)

(assert (=> start!28268 (=> (not res!151121) (not e!183295))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28268 (= res!151121 (validMask!0 mask!3809))))

(assert (=> start!28268 e!183295))

(assert (=> start!28268 true))

(declare-datatypes ((array!14575 0))(
  ( (array!14576 (arr!6915 (Array (_ BitVec 32) (_ BitVec 64))) (size!7268 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14575)

(declare-fun array_inv!4887 (array!14575) Bool)

(assert (=> start!28268 (array_inv!4887 a!3312)))

(declare-fun b!289561 () Bool)

(declare-fun e!183292 () Bool)

(assert (=> b!289561 (= e!183292 false)))

(declare-datatypes ((Unit!9075 0))(
  ( (Unit!9076) )
))
(declare-fun lt!142818 () Unit!9075)

(declare-fun e!183293 () Unit!9075)

(assert (=> b!289561 (= lt!142818 e!183293)))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2063 0))(
  ( (MissingZero!2063 (index!10422 (_ BitVec 32))) (Found!2063 (index!10423 (_ BitVec 32))) (Intermediate!2063 (undefined!2875 Bool) (index!10424 (_ BitVec 32)) (x!28643 (_ BitVec 32))) (Undefined!2063) (MissingVacant!2063 (index!10425 (_ BitVec 32))) )
))
(declare-fun lt!142821 () SeekEntryResult!2063)

(declare-fun c!46783 () Bool)

(get-info :version)

(assert (=> b!289561 (= c!46783 (or (and ((_ is Intermediate!2063) lt!142821) (undefined!2875 lt!142821)) (and ((_ is Intermediate!2063) lt!142821) (= (select (arr!6915 a!3312) (index!10424 lt!142821)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2063) lt!142821) (= (select (arr!6915 a!3312) (index!10424 lt!142821)) k0!2524))))))

(declare-fun b!289562 () Bool)

(declare-fun res!151123 () Bool)

(assert (=> b!289562 (=> (not res!151123) (not e!183295))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!289562 (= res!151123 (and (= (size!7268 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7268 a!3312))))))

(declare-fun b!289563 () Bool)

(declare-fun e!183294 () Bool)

(assert (=> b!289563 (= e!183294 e!183292)))

(declare-fun res!151126 () Bool)

(assert (=> b!289563 (=> (not res!151126) (not e!183292))))

(declare-fun lt!142820 () Bool)

(assert (=> b!289563 (= res!151126 lt!142820)))

(declare-fun lt!142816 () (_ BitVec 32))

(declare-fun lt!142819 () SeekEntryResult!2063)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14575 (_ BitVec 32)) SeekEntryResult!2063)

(assert (=> b!289563 (= lt!142819 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142816 k0!2524 (array!14576 (store (arr!6915 a!3312) i!1256 k0!2524) (size!7268 a!3312)) mask!3809))))

(assert (=> b!289563 (= lt!142821 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142816 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289563 (= lt!142816 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289564 () Bool)

(declare-fun res!151122 () Bool)

(assert (=> b!289564 (=> (not res!151122) (not e!183294))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14575 (_ BitVec 32)) Bool)

(assert (=> b!289564 (= res!151122 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289565 () Bool)

(declare-fun e!183297 () Unit!9075)

(assert (=> b!289565 (= e!183293 e!183297)))

(declare-fun c!46782 () Bool)

(assert (=> b!289565 (= c!46782 ((_ is Intermediate!2063) lt!142821))))

(declare-fun b!289566 () Bool)

(declare-fun res!151125 () Bool)

(assert (=> b!289566 (=> (not res!151125) (not e!183295))))

(declare-fun arrayContainsKey!0 (array!14575 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289566 (= res!151125 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289567 () Bool)

(assert (=> b!289567 false))

(declare-fun Unit!9077 () Unit!9075)

(assert (=> b!289567 (= e!183297 Unit!9077)))

(declare-fun b!289568 () Bool)

(declare-fun res!151120 () Bool)

(assert (=> b!289568 (=> (not res!151120) (not e!183295))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289568 (= res!151120 (validKeyInArray!0 k0!2524))))

(declare-fun b!289569 () Bool)

(assert (=> b!289569 (= e!183295 e!183294)))

(declare-fun res!151124 () Bool)

(assert (=> b!289569 (=> (not res!151124) (not e!183294))))

(declare-fun lt!142817 () SeekEntryResult!2063)

(assert (=> b!289569 (= res!151124 (or lt!142820 (= lt!142817 (MissingVacant!2063 i!1256))))))

(assert (=> b!289569 (= lt!142820 (= lt!142817 (MissingZero!2063 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14575 (_ BitVec 32)) SeekEntryResult!2063)

(assert (=> b!289569 (= lt!142817 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289570 () Bool)

(declare-fun Unit!9078 () Unit!9075)

(assert (=> b!289570 (= e!183293 Unit!9078)))

(assert (=> b!289570 false))

(declare-fun b!289571 () Bool)

(assert (=> b!289571 (and (= lt!142819 lt!142821) (= (select (store (arr!6915 a!3312) i!1256 k0!2524) (index!10424 lt!142821)) k0!2524))))

(declare-fun lt!142815 () Unit!9075)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14575 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9075)

(assert (=> b!289571 (= lt!142815 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142816 (index!10424 lt!142821) (x!28643 lt!142821) mask!3809))))

(assert (=> b!289571 (and (= (select (arr!6915 a!3312) (index!10424 lt!142821)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10424 lt!142821) i!1256))))

(declare-fun Unit!9079 () Unit!9075)

(assert (=> b!289571 (= e!183297 Unit!9079)))

(assert (= (and start!28268 res!151121) b!289562))

(assert (= (and b!289562 res!151123) b!289568))

(assert (= (and b!289568 res!151120) b!289566))

(assert (= (and b!289566 res!151125) b!289569))

(assert (= (and b!289569 res!151124) b!289564))

(assert (= (and b!289564 res!151122) b!289563))

(assert (= (and b!289563 res!151126) b!289561))

(assert (= (and b!289561 c!46783) b!289570))

(assert (= (and b!289561 (not c!46783)) b!289565))

(assert (= (and b!289565 c!46782) b!289571))

(assert (= (and b!289565 (not c!46782)) b!289567))

(declare-fun m!303197 () Bool)

(assert (=> b!289563 m!303197))

(declare-fun m!303199 () Bool)

(assert (=> b!289563 m!303199))

(declare-fun m!303201 () Bool)

(assert (=> b!289563 m!303201))

(declare-fun m!303203 () Bool)

(assert (=> b!289563 m!303203))

(declare-fun m!303205 () Bool)

(assert (=> b!289566 m!303205))

(assert (=> b!289571 m!303197))

(declare-fun m!303207 () Bool)

(assert (=> b!289571 m!303207))

(declare-fun m!303209 () Bool)

(assert (=> b!289571 m!303209))

(declare-fun m!303211 () Bool)

(assert (=> b!289571 m!303211))

(declare-fun m!303213 () Bool)

(assert (=> b!289564 m!303213))

(declare-fun m!303215 () Bool)

(assert (=> b!289568 m!303215))

(assert (=> b!289561 m!303211))

(declare-fun m!303217 () Bool)

(assert (=> b!289569 m!303217))

(declare-fun m!303219 () Bool)

(assert (=> start!28268 m!303219))

(declare-fun m!303221 () Bool)

(assert (=> start!28268 m!303221))

(check-sat (not b!289566) (not b!289571) (not b!289568) (not b!289569) (not start!28268) (not b!289563) (not b!289564))
(check-sat)
