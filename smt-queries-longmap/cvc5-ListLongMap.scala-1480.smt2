; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28266 () Bool)

(assert start!28266)

(declare-fun b!289609 () Bool)

(declare-datatypes ((Unit!9110 0))(
  ( (Unit!9111) )
))
(declare-fun e!183339 () Unit!9110)

(declare-fun e!183344 () Unit!9110)

(assert (=> b!289609 (= e!183339 e!183344)))

(declare-fun c!46790 () Bool)

(declare-datatypes ((SeekEntryResult!2066 0))(
  ( (MissingZero!2066 (index!10434 (_ BitVec 32))) (Found!2066 (index!10435 (_ BitVec 32))) (Intermediate!2066 (undefined!2878 Bool) (index!10436 (_ BitVec 32)) (x!28639 (_ BitVec 32))) (Undefined!2066) (MissingVacant!2066 (index!10437 (_ BitVec 32))) )
))
(declare-fun lt!142934 () SeekEntryResult!2066)

(assert (=> b!289609 (= c!46790 (is-Intermediate!2066 lt!142934))))

(declare-fun b!289610 () Bool)

(declare-fun res!151158 () Bool)

(declare-fun e!183343 () Bool)

(assert (=> b!289610 (=> (not res!151158) (not e!183343))))

(declare-datatypes ((array!14580 0))(
  ( (array!14581 (arr!6917 (Array (_ BitVec 32) (_ BitVec 64))) (size!7269 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14580)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14580 (_ BitVec 32)) Bool)

(assert (=> b!289610 (= res!151158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289611 () Bool)

(declare-fun e!183341 () Bool)

(assert (=> b!289611 (= e!183341 e!183343)))

(declare-fun res!151153 () Bool)

(assert (=> b!289611 (=> (not res!151153) (not e!183343))))

(declare-fun lt!142939 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142937 () SeekEntryResult!2066)

(assert (=> b!289611 (= res!151153 (or lt!142939 (= lt!142937 (MissingVacant!2066 i!1256))))))

(assert (=> b!289611 (= lt!142939 (= lt!142937 (MissingZero!2066 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14580 (_ BitVec 32)) SeekEntryResult!2066)

(assert (=> b!289611 (= lt!142937 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun lt!142935 () SeekEntryResult!2066)

(declare-fun b!289612 () Bool)

(assert (=> b!289612 (and (= lt!142935 lt!142934) (= (select (store (arr!6917 a!3312) i!1256 k!2524) (index!10436 lt!142934)) k!2524))))

(declare-fun lt!142936 () (_ BitVec 32))

(declare-fun lt!142933 () Unit!9110)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14580 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9110)

(assert (=> b!289612 (= lt!142933 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!142936 (index!10436 lt!142934) (x!28639 lt!142934) mask!3809))))

(assert (=> b!289612 (and (= (select (arr!6917 a!3312) (index!10436 lt!142934)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10436 lt!142934) i!1256))))

(declare-fun Unit!9112 () Unit!9110)

(assert (=> b!289612 (= e!183344 Unit!9112)))

(declare-fun b!289613 () Bool)

(declare-fun res!151157 () Bool)

(assert (=> b!289613 (=> (not res!151157) (not e!183341))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289613 (= res!151157 (validKeyInArray!0 k!2524))))

(declare-fun b!289614 () Bool)

(declare-fun e!183340 () Bool)

(assert (=> b!289614 (= e!183340 false)))

(declare-fun lt!142938 () Unit!9110)

(assert (=> b!289614 (= lt!142938 e!183339)))

(declare-fun c!46791 () Bool)

(assert (=> b!289614 (= c!46791 (or (and (is-Intermediate!2066 lt!142934) (undefined!2878 lt!142934)) (and (is-Intermediate!2066 lt!142934) (= (select (arr!6917 a!3312) (index!10436 lt!142934)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2066 lt!142934) (= (select (arr!6917 a!3312) (index!10436 lt!142934)) k!2524))))))

(declare-fun b!289615 () Bool)

(declare-fun res!151156 () Bool)

(assert (=> b!289615 (=> (not res!151156) (not e!183341))))

(assert (=> b!289615 (= res!151156 (and (= (size!7269 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7269 a!3312))))))

(declare-fun b!289616 () Bool)

(declare-fun Unit!9113 () Unit!9110)

(assert (=> b!289616 (= e!183339 Unit!9113)))

(assert (=> b!289616 false))

(declare-fun b!289617 () Bool)

(declare-fun res!151155 () Bool)

(assert (=> b!289617 (=> (not res!151155) (not e!183341))))

(declare-fun arrayContainsKey!0 (array!14580 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289617 (= res!151155 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun res!151152 () Bool)

(assert (=> start!28266 (=> (not res!151152) (not e!183341))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28266 (= res!151152 (validMask!0 mask!3809))))

(assert (=> start!28266 e!183341))

(assert (=> start!28266 true))

(declare-fun array_inv!4880 (array!14580) Bool)

(assert (=> start!28266 (array_inv!4880 a!3312)))

(declare-fun b!289618 () Bool)

(assert (=> b!289618 (= e!183343 e!183340)))

(declare-fun res!151154 () Bool)

(assert (=> b!289618 (=> (not res!151154) (not e!183340))))

(assert (=> b!289618 (= res!151154 lt!142939)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14580 (_ BitVec 32)) SeekEntryResult!2066)

(assert (=> b!289618 (= lt!142935 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142936 k!2524 (array!14581 (store (arr!6917 a!3312) i!1256 k!2524) (size!7269 a!3312)) mask!3809))))

(assert (=> b!289618 (= lt!142934 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142936 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289618 (= lt!142936 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289619 () Bool)

(assert (=> b!289619 false))

(declare-fun Unit!9114 () Unit!9110)

(assert (=> b!289619 (= e!183344 Unit!9114)))

(assert (= (and start!28266 res!151152) b!289615))

(assert (= (and b!289615 res!151156) b!289613))

(assert (= (and b!289613 res!151157) b!289617))

(assert (= (and b!289617 res!151155) b!289611))

(assert (= (and b!289611 res!151153) b!289610))

(assert (= (and b!289610 res!151158) b!289618))

(assert (= (and b!289618 res!151154) b!289614))

(assert (= (and b!289614 c!46791) b!289616))

(assert (= (and b!289614 (not c!46791)) b!289609))

(assert (= (and b!289609 c!46790) b!289612))

(assert (= (and b!289609 (not c!46790)) b!289619))

(declare-fun m!303711 () Bool)

(assert (=> b!289618 m!303711))

(declare-fun m!303713 () Bool)

(assert (=> b!289618 m!303713))

(declare-fun m!303715 () Bool)

(assert (=> b!289618 m!303715))

(declare-fun m!303717 () Bool)

(assert (=> b!289618 m!303717))

(assert (=> b!289612 m!303711))

(declare-fun m!303719 () Bool)

(assert (=> b!289612 m!303719))

(declare-fun m!303721 () Bool)

(assert (=> b!289612 m!303721))

(declare-fun m!303723 () Bool)

(assert (=> b!289612 m!303723))

(declare-fun m!303725 () Bool)

(assert (=> start!28266 m!303725))

(declare-fun m!303727 () Bool)

(assert (=> start!28266 m!303727))

(declare-fun m!303729 () Bool)

(assert (=> b!289611 m!303729))

(declare-fun m!303731 () Bool)

(assert (=> b!289617 m!303731))

(declare-fun m!303733 () Bool)

(assert (=> b!289613 m!303733))

(assert (=> b!289614 m!303723))

(declare-fun m!303735 () Bool)

(assert (=> b!289610 m!303735))

(push 1)

