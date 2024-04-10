; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28264 () Bool)

(assert start!28264)

(declare-fun b!289576 () Bool)

(declare-fun res!151137 () Bool)

(declare-fun e!183325 () Bool)

(assert (=> b!289576 (=> (not res!151137) (not e!183325))))

(declare-datatypes ((array!14578 0))(
  ( (array!14579 (arr!6916 (Array (_ BitVec 32) (_ BitVec 64))) (size!7268 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14578)

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14578 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289576 (= res!151137 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289577 () Bool)

(declare-fun res!151132 () Bool)

(assert (=> b!289577 (=> (not res!151132) (not e!183325))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289577 (= res!151132 (validKeyInArray!0 k!2524))))

(declare-fun b!289578 () Bool)

(declare-fun res!151136 () Bool)

(assert (=> b!289578 (=> (not res!151136) (not e!183325))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289578 (= res!151136 (and (= (size!7268 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7268 a!3312))))))

(declare-fun res!151133 () Bool)

(assert (=> start!28264 (=> (not res!151133) (not e!183325))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28264 (= res!151133 (validMask!0 mask!3809))))

(assert (=> start!28264 e!183325))

(assert (=> start!28264 true))

(declare-fun array_inv!4879 (array!14578) Bool)

(assert (=> start!28264 (array_inv!4879 a!3312)))

(declare-fun b!289579 () Bool)

(assert (=> b!289579 false))

(declare-datatypes ((Unit!9105 0))(
  ( (Unit!9106) )
))
(declare-fun e!183321 () Unit!9105)

(declare-fun Unit!9107 () Unit!9105)

(assert (=> b!289579 (= e!183321 Unit!9107)))

(declare-fun b!289580 () Bool)

(declare-fun res!151135 () Bool)

(declare-fun e!183322 () Bool)

(assert (=> b!289580 (=> (not res!151135) (not e!183322))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14578 (_ BitVec 32)) Bool)

(assert (=> b!289580 (= res!151135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289581 () Bool)

(declare-fun e!183323 () Bool)

(assert (=> b!289581 (= e!183322 e!183323)))

(declare-fun res!151131 () Bool)

(assert (=> b!289581 (=> (not res!151131) (not e!183323))))

(declare-fun lt!142918 () Bool)

(assert (=> b!289581 (= res!151131 lt!142918)))

(declare-fun lt!142917 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2065 0))(
  ( (MissingZero!2065 (index!10430 (_ BitVec 32))) (Found!2065 (index!10431 (_ BitVec 32))) (Intermediate!2065 (undefined!2877 Bool) (index!10432 (_ BitVec 32)) (x!28630 (_ BitVec 32))) (Undefined!2065) (MissingVacant!2065 (index!10433 (_ BitVec 32))) )
))
(declare-fun lt!142913 () SeekEntryResult!2065)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14578 (_ BitVec 32)) SeekEntryResult!2065)

(assert (=> b!289581 (= lt!142913 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142917 k!2524 (array!14579 (store (arr!6916 a!3312) i!1256 k!2524) (size!7268 a!3312)) mask!3809))))

(declare-fun lt!142912 () SeekEntryResult!2065)

(assert (=> b!289581 (= lt!142912 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142917 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289581 (= lt!142917 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289582 () Bool)

(declare-fun e!183326 () Unit!9105)

(assert (=> b!289582 (= e!183326 e!183321)))

(declare-fun c!46785 () Bool)

(assert (=> b!289582 (= c!46785 (is-Intermediate!2065 lt!142912))))

(declare-fun b!289583 () Bool)

(assert (=> b!289583 (= e!183323 (and (= lt!142913 lt!142912) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-fun lt!142915 () Unit!9105)

(assert (=> b!289583 (= lt!142915 e!183326)))

(declare-fun c!46784 () Bool)

(assert (=> b!289583 (= c!46784 (or (and (is-Intermediate!2065 lt!142912) (undefined!2877 lt!142912)) (and (is-Intermediate!2065 lt!142912) (= (select (arr!6916 a!3312) (index!10432 lt!142912)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2065 lt!142912) (= (select (arr!6916 a!3312) (index!10432 lt!142912)) k!2524))))))

(declare-fun b!289584 () Bool)

(assert (=> b!289584 (and (= lt!142913 lt!142912) (= (select (store (arr!6916 a!3312) i!1256 k!2524) (index!10432 lt!142912)) k!2524))))

(declare-fun lt!142916 () Unit!9105)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14578 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9105)

(assert (=> b!289584 (= lt!142916 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!142917 (index!10432 lt!142912) (x!28630 lt!142912) mask!3809))))

(assert (=> b!289584 (and (= (select (arr!6916 a!3312) (index!10432 lt!142912)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10432 lt!142912) i!1256))))

(declare-fun Unit!9108 () Unit!9105)

(assert (=> b!289584 (= e!183321 Unit!9108)))

(declare-fun b!289585 () Bool)

(assert (=> b!289585 (= e!183325 e!183322)))

(declare-fun res!151134 () Bool)

(assert (=> b!289585 (=> (not res!151134) (not e!183322))))

(declare-fun lt!142914 () SeekEntryResult!2065)

(assert (=> b!289585 (= res!151134 (or lt!142918 (= lt!142914 (MissingVacant!2065 i!1256))))))

(assert (=> b!289585 (= lt!142918 (= lt!142914 (MissingZero!2065 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14578 (_ BitVec 32)) SeekEntryResult!2065)

(assert (=> b!289585 (= lt!142914 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun b!289586 () Bool)

(declare-fun Unit!9109 () Unit!9105)

(assert (=> b!289586 (= e!183326 Unit!9109)))

(assert (=> b!289586 false))

(assert (= (and start!28264 res!151133) b!289578))

(assert (= (and b!289578 res!151136) b!289577))

(assert (= (and b!289577 res!151132) b!289576))

(assert (= (and b!289576 res!151137) b!289585))

(assert (= (and b!289585 res!151134) b!289580))

(assert (= (and b!289580 res!151135) b!289581))

(assert (= (and b!289581 res!151131) b!289583))

(assert (= (and b!289583 c!46784) b!289586))

(assert (= (and b!289583 (not c!46784)) b!289582))

(assert (= (and b!289582 c!46785) b!289584))

(assert (= (and b!289582 (not c!46785)) b!289579))

(declare-fun m!303685 () Bool)

(assert (=> b!289585 m!303685))

(declare-fun m!303687 () Bool)

(assert (=> b!289584 m!303687))

(declare-fun m!303689 () Bool)

(assert (=> b!289584 m!303689))

(declare-fun m!303691 () Bool)

(assert (=> b!289584 m!303691))

(declare-fun m!303693 () Bool)

(assert (=> b!289584 m!303693))

(declare-fun m!303695 () Bool)

(assert (=> b!289577 m!303695))

(declare-fun m!303697 () Bool)

(assert (=> start!28264 m!303697))

(declare-fun m!303699 () Bool)

(assert (=> start!28264 m!303699))

(declare-fun m!303701 () Bool)

(assert (=> b!289580 m!303701))

(declare-fun m!303703 () Bool)

(assert (=> b!289576 m!303703))

(assert (=> b!289581 m!303687))

(declare-fun m!303705 () Bool)

(assert (=> b!289581 m!303705))

(declare-fun m!303707 () Bool)

(assert (=> b!289581 m!303707))

(declare-fun m!303709 () Bool)

(assert (=> b!289581 m!303709))

(assert (=> b!289583 m!303693))

(push 1)

