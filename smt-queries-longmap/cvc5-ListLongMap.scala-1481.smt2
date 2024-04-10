; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!28272 () Bool)

(assert start!28272)

(declare-fun b!289708 () Bool)

(declare-fun res!151217 () Bool)

(declare-fun e!183398 () Bool)

(assert (=> b!289708 (=> (not res!151217) (not e!183398))))

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14586 0))(
  ( (array!14587 (arr!6920 (Array (_ BitVec 32) (_ BitVec 64))) (size!7272 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14586)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!289708 (= res!151217 (and (= (size!7272 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7272 a!3312))))))

(declare-fun b!289709 () Bool)

(declare-fun e!183396 () Bool)

(assert (=> b!289709 (= e!183398 e!183396)))

(declare-fun res!151221 () Bool)

(assert (=> b!289709 (=> (not res!151221) (not e!183396))))

(declare-fun lt!142999 () Bool)

(declare-datatypes ((SeekEntryResult!2069 0))(
  ( (MissingZero!2069 (index!10446 (_ BitVec 32))) (Found!2069 (index!10447 (_ BitVec 32))) (Intermediate!2069 (undefined!2881 Bool) (index!10448 (_ BitVec 32)) (x!28650 (_ BitVec 32))) (Undefined!2069) (MissingVacant!2069 (index!10449 (_ BitVec 32))) )
))
(declare-fun lt!143000 () SeekEntryResult!2069)

(assert (=> b!289709 (= res!151221 (or lt!142999 (= lt!143000 (MissingVacant!2069 i!1256))))))

(assert (=> b!289709 (= lt!142999 (= lt!143000 (MissingZero!2069 i!1256)))))

(declare-fun k!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14586 (_ BitVec 32)) SeekEntryResult!2069)

(assert (=> b!289709 (= lt!143000 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(declare-fun res!151219 () Bool)

(assert (=> start!28272 (=> (not res!151219) (not e!183398))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28272 (= res!151219 (validMask!0 mask!3809))))

(assert (=> start!28272 e!183398))

(assert (=> start!28272 true))

(declare-fun array_inv!4883 (array!14586) Bool)

(assert (=> start!28272 (array_inv!4883 a!3312)))

(declare-fun b!289710 () Bool)

(declare-datatypes ((Unit!9125 0))(
  ( (Unit!9126) )
))
(declare-fun e!183397 () Unit!9125)

(declare-fun Unit!9127 () Unit!9125)

(assert (=> b!289710 (= e!183397 Unit!9127)))

(assert (=> b!289710 false))

(declare-fun b!289711 () Bool)

(declare-fun e!183395 () Bool)

(assert (=> b!289711 (= e!183396 e!183395)))

(declare-fun res!151215 () Bool)

(assert (=> b!289711 (=> (not res!151215) (not e!183395))))

(assert (=> b!289711 (= res!151215 lt!142999)))

(declare-fun lt!142997 () (_ BitVec 32))

(declare-fun lt!142996 () SeekEntryResult!2069)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14586 (_ BitVec 32)) SeekEntryResult!2069)

(assert (=> b!289711 (= lt!142996 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142997 k!2524 (array!14587 (store (arr!6920 a!3312) i!1256 k!2524) (size!7272 a!3312)) mask!3809))))

(declare-fun lt!143001 () SeekEntryResult!2069)

(assert (=> b!289711 (= lt!143001 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142997 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289711 (= lt!142997 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!289712 () Bool)

(declare-fun e!183393 () Unit!9125)

(assert (=> b!289712 (= e!183397 e!183393)))

(declare-fun c!46809 () Bool)

(assert (=> b!289712 (= c!46809 (is-Intermediate!2069 lt!143001))))

(declare-fun b!289713 () Bool)

(declare-fun res!151220 () Bool)

(assert (=> b!289713 (=> (not res!151220) (not e!183396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14586 (_ BitVec 32)) Bool)

(assert (=> b!289713 (= res!151220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289714 () Bool)

(declare-fun res!151216 () Bool)

(assert (=> b!289714 (=> (not res!151216) (not e!183398))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289714 (= res!151216 (validKeyInArray!0 k!2524))))

(declare-fun b!289715 () Bool)

(assert (=> b!289715 false))

(declare-fun Unit!9128 () Unit!9125)

(assert (=> b!289715 (= e!183393 Unit!9128)))

(declare-fun b!289716 () Bool)

(declare-fun res!151218 () Bool)

(assert (=> b!289716 (=> (not res!151218) (not e!183398))))

(declare-fun arrayContainsKey!0 (array!14586 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289716 (= res!151218 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289717 () Bool)

(assert (=> b!289717 (= e!183395 false)))

(declare-fun lt!142998 () Unit!9125)

(assert (=> b!289717 (= lt!142998 e!183397)))

(declare-fun c!46808 () Bool)

(assert (=> b!289717 (= c!46808 (or (and (is-Intermediate!2069 lt!143001) (undefined!2881 lt!143001)) (and (is-Intermediate!2069 lt!143001) (= (select (arr!6920 a!3312) (index!10448 lt!143001)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and (is-Intermediate!2069 lt!143001) (= (select (arr!6920 a!3312) (index!10448 lt!143001)) k!2524))))))

(declare-fun b!289718 () Bool)

(assert (=> b!289718 (and (= lt!142996 lt!143001) (= (select (store (arr!6920 a!3312) i!1256 k!2524) (index!10448 lt!143001)) k!2524))))

(declare-fun lt!143002 () Unit!9125)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14586 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9125)

(assert (=> b!289718 (= lt!143002 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k!2524 #b00000000000000000000000000000000 lt!142997 (index!10448 lt!143001) (x!28650 lt!143001) mask!3809))))

(assert (=> b!289718 (and (= (select (arr!6920 a!3312) (index!10448 lt!143001)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10448 lt!143001) i!1256))))

(declare-fun Unit!9129 () Unit!9125)

(assert (=> b!289718 (= e!183393 Unit!9129)))

(assert (= (and start!28272 res!151219) b!289708))

(assert (= (and b!289708 res!151217) b!289714))

(assert (= (and b!289714 res!151216) b!289716))

(assert (= (and b!289716 res!151218) b!289709))

(assert (= (and b!289709 res!151221) b!289713))

(assert (= (and b!289713 res!151220) b!289711))

(assert (= (and b!289711 res!151215) b!289717))

(assert (= (and b!289717 c!46808) b!289710))

(assert (= (and b!289717 (not c!46808)) b!289712))

(assert (= (and b!289712 c!46809) b!289718))

(assert (= (and b!289712 (not c!46809)) b!289715))

(declare-fun m!303789 () Bool)

(assert (=> b!289716 m!303789))

(declare-fun m!303791 () Bool)

(assert (=> start!28272 m!303791))

(declare-fun m!303793 () Bool)

(assert (=> start!28272 m!303793))

(declare-fun m!303795 () Bool)

(assert (=> b!289717 m!303795))

(declare-fun m!303797 () Bool)

(assert (=> b!289711 m!303797))

(declare-fun m!303799 () Bool)

(assert (=> b!289711 m!303799))

(declare-fun m!303801 () Bool)

(assert (=> b!289711 m!303801))

(declare-fun m!303803 () Bool)

(assert (=> b!289711 m!303803))

(declare-fun m!303805 () Bool)

(assert (=> b!289709 m!303805))

(declare-fun m!303807 () Bool)

(assert (=> b!289713 m!303807))

(assert (=> b!289718 m!303797))

(declare-fun m!303809 () Bool)

(assert (=> b!289718 m!303809))

(declare-fun m!303811 () Bool)

(assert (=> b!289718 m!303811))

(assert (=> b!289718 m!303795))

(declare-fun m!303813 () Bool)

(assert (=> b!289714 m!303813))

(push 1)

