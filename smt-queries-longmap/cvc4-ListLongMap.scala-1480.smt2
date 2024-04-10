; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28270 () Bool)

(assert start!28270)

(declare-fun b!289675 () Bool)

(declare-fun res!151198 () Bool)

(declare-fun e!183375 () Bool)

(assert (=> b!289675 (=> (not res!151198) (not e!183375))))

(declare-datatypes ((array!14584 0))(
  ( (array!14585 (arr!6919 (Array (_ BitVec 32) (_ BitVec 64))) (size!7271 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14584)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14584 (_ BitVec 32)) Bool)

(assert (=> b!289675 (= res!151198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289676 () Bool)

(declare-datatypes ((Unit!9120 0))(
  ( (Unit!9121) )
))
(declare-fun e!183379 () Unit!9120)

(declare-fun Unit!9122 () Unit!9120)

(assert (=> b!289676 (= e!183379 Unit!9122)))

(assert (=> b!289676 false))

(declare-fun b!289677 () Bool)

(declare-fun e!183376 () Bool)

(assert (=> b!289677 (= e!183375 e!183376)))

(declare-fun res!151200 () Bool)

(assert (=> b!289677 (=> (not res!151200) (not e!183376))))

(declare-fun lt!142977 () Bool)

(assert (=> b!289677 (= res!151200 lt!142977)))

(declare-datatypes ((SeekEntryResult!2068 0))(
  ( (MissingZero!2068 (index!10442 (_ BitVec 32))) (Found!2068 (index!10443 (_ BitVec 32))) (Intermediate!2068 (undefined!2880 Bool) (index!10444 (_ BitVec 32)) (x!28641 (_ BitVec 32))) (Undefined!2068) (MissingVacant!2068 (index!10445 (_ BitVec 32))) )
))
(declare-fun lt!142979 () SeekEntryResult!2068)

(declare-fun lt!142976 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14584 (_ BitVec 32)) SeekEntryResult!2068)

(assert (=> b!289677 (= lt!142979 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142976 k!2524 (array!14585 (store (arr!6919 a!3312) i!1256 k!2524) (size!7271 a!3312)) mask!3809))))

(declare-fun lt!142978 () SeekEntryResult!2068)

(assert (=> b!289677 (= lt!142978 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142976 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289677 (= lt!142976 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289678 () Bool)

(declare-fun res!151196 () Bool)

(declare-fun e!183377 () Bool)

(assert (=> b!289678 (=> (not res!151196) (not e!183377))))

(assert (=> b!289678 (= res!151196 (and (= (size!7271 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7271 a!3312))))))

(declare-fun res!151199 () Bool)

(assert (=> start!28270 (=> (not res!151199) (not e!183377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28270 (= res!151199 (validMask!0 mask!3809))))

(assert (=> start!28270 e!183377))

(assert (=> start!28270 true))

(declare-fun array_inv!4882 (array!14584) Bool)

(assert (=> start!28270 (array_inv!4882 a!3312)))

(declare-fun b!289679 () Bool)

(assert (=> b!289679 (and (= lt!142979 lt!142978) (= (select (store (arr!6919 a!3312) i!1256 k!2524) (index!10444 lt!142978)) k!2524))))

(declare-fun lt!142975 () Unit!9120)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14584 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9120)

(assert (=> b!289679 (= lt!142975 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!142976 (index!10444 lt!142978) (x!28641 lt!142978) mask!3809))))

(assert (=> b!289679 (and (= (select (arr!6919 a!3312) (index!10444 lt!142978)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10444 lt!142978) i!1256))))

(declare-fun e!183378 () Unit!9120)

(declare-fun Unit!9123 () Unit!9120)

(assert (=> b!289679 (= e!183378 Unit!9123)))

(declare-fun b!289680 () Bool)

(assert (=> b!289680 false))

(declare-fun Unit!9124 () Unit!9120)

(assert (=> b!289680 (= e!183378 Unit!9124)))

(declare-fun b!289681 () Bool)

(assert (=> b!289681 (= e!183379 e!183378)))

(declare-fun c!46803 () Bool)

(assert (=> b!289681 (= c!46803 (is-Intermediate!2068 lt!142978))))

(declare-fun b!289682 () Bool)

(declare-fun res!151195 () Bool)

(assert (=> b!289682 (=> (not res!151195) (not e!183377))))

(declare-fun arrayContainsKey!0 (array!14584 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289682 (= res!151195 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289683 () Bool)

(assert (=> b!289683 (= e!183376 false)))

(declare-fun lt!142981 () Unit!9120)

(assert (=> b!289683 (= lt!142981 e!183379)))

(declare-fun c!46802 () Bool)

(assert (=> b!289683 (= c!46802 (or (and (is-Intermediate!2068 lt!142978) (undefined!2880 lt!142978)) (and (is-Intermediate!2068 lt!142978) (= (select (arr!6919 a!3312) (index!10444 lt!142978)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2068 lt!142978) (= (select (arr!6919 a!3312) (index!10444 lt!142978)) k!2524))))))

(declare-fun b!289684 () Bool)

(assert (=> b!289684 (= e!183377 e!183375)))

(declare-fun res!151194 () Bool)

(assert (=> b!289684 (=> (not res!151194) (not e!183375))))

(declare-fun lt!142980 () SeekEntryResult!2068)

(assert (=> b!289684 (= res!151194 (or lt!142977 (= lt!142980 (MissingVacant!2068 i!1256))))))

(assert (=> b!289684 (= lt!142977 (= lt!142980 (MissingZero!2068 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14584 (_ BitVec 32)) SeekEntryResult!2068)

(assert (=> b!289684 (= lt!142980 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289685 () Bool)

(declare-fun res!151197 () Bool)

(assert (=> b!289685 (=> (not res!151197) (not e!183377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289685 (= res!151197 (validKeyInArray!0 k!2524))))

(assert (= (and start!28270 res!151199) b!289678))

(assert (= (and b!289678 res!151196) b!289685))

(assert (= (and b!289685 res!151197) b!289682))

(assert (= (and b!289682 res!151195) b!289684))

(assert (= (and b!289684 res!151194) b!289675))

(assert (= (and b!289675 res!151198) b!289677))

(assert (= (and b!289677 res!151200) b!289683))

(assert (= (and b!289683 c!46802) b!289676))

(assert (= (and b!289683 (not c!46802)) b!289681))

(assert (= (and b!289681 c!46803) b!289679))

(assert (= (and b!289681 (not c!46803)) b!289680))

(declare-fun m!303763 () Bool)

(assert (=> b!289677 m!303763))

(declare-fun m!303765 () Bool)

(assert (=> b!289677 m!303765))

(declare-fun m!303767 () Bool)

(assert (=> b!289677 m!303767))

(declare-fun m!303769 () Bool)

(assert (=> b!289677 m!303769))

(declare-fun m!303771 () Bool)

(assert (=> b!289675 m!303771))

(declare-fun m!303773 () Bool)

(assert (=> b!289684 m!303773))

(assert (=> b!289679 m!303763))

(declare-fun m!303775 () Bool)

(assert (=> b!289679 m!303775))

(declare-fun m!303777 () Bool)

(assert (=> b!289679 m!303777))

(declare-fun m!303779 () Bool)

(assert (=> b!289679 m!303779))

(declare-fun m!303781 () Bool)

(assert (=> b!289682 m!303781))

(declare-fun m!303783 () Bool)

(assert (=> b!289685 m!303783))

(assert (=> b!289683 m!303779))

(declare-fun m!303785 () Bool)

(assert (=> start!28270 m!303785))

(declare-fun m!303787 () Bool)

(assert (=> start!28270 m!303787))

(push 1)

