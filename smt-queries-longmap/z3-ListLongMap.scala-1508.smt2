; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28570 () Bool)

(assert start!28570)

(declare-fun b!292224 () Bool)

(declare-fun e!184891 () Bool)

(declare-fun e!184893 () Bool)

(assert (=> b!292224 (= e!184891 e!184893)))

(declare-fun res!153256 () Bool)

(assert (=> b!292224 (=> (not res!153256) (not e!184893))))

(declare-fun lt!144688 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2114 0))(
  ( (MissingZero!2114 (index!10626 (_ BitVec 32))) (Found!2114 (index!10627 (_ BitVec 32))) (Intermediate!2114 (undefined!2926 Bool) (index!10628 (_ BitVec 32)) (x!28929 (_ BitVec 32))) (Undefined!2114) (MissingVacant!2114 (index!10629 (_ BitVec 32))) )
))
(declare-fun lt!144684 () SeekEntryResult!2114)

(assert (=> b!292224 (= res!153256 (and (not lt!144688) (= lt!144684 (MissingVacant!2114 i!1256))))))

(declare-fun lt!144685 () SeekEntryResult!2114)

(declare-datatypes ((array!14754 0))(
  ( (array!14755 (arr!7000 (Array (_ BitVec 32) (_ BitVec 64))) (size!7352 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14754)

(declare-fun lt!144689 () (_ BitVec 32))

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14754 (_ BitVec 32)) SeekEntryResult!2114)

(assert (=> b!292224 (= lt!144685 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144689 k0!2524 (array!14755 (store (arr!7000 a!3312) i!1256 k0!2524) (size!7352 a!3312)) mask!3809))))

(declare-fun lt!144686 () SeekEntryResult!2114)

(assert (=> b!292224 (= lt!144686 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144689 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292224 (= lt!144689 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292225 () Bool)

(declare-fun e!184892 () Bool)

(assert (=> b!292225 (= e!184893 e!184892)))

(declare-fun res!153261 () Bool)

(assert (=> b!292225 (=> (not res!153261) (not e!184892))))

(declare-fun lt!144687 () Bool)

(assert (=> b!292225 (= res!153261 (and (or lt!144687 (not (undefined!2926 lt!144686))) (not lt!144687) (= (select (arr!7000 a!3312) (index!10628 lt!144686)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292225 (= lt!144687 (not ((_ is Intermediate!2114) lt!144686)))))

(declare-fun b!292226 () Bool)

(assert (=> b!292226 (= e!184892 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!9130 0))(
  ( (Unit!9131) )
))
(declare-fun lt!144690 () Unit!9130)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14754 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9130)

(assert (=> b!292226 (= lt!144690 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144689 (index!10628 lt!144686) (x!28929 lt!144686) mask!3809))))

(assert (=> b!292226 (= (index!10628 lt!144686) i!1256)))

(declare-fun b!292227 () Bool)

(declare-fun res!153260 () Bool)

(declare-fun e!184895 () Bool)

(assert (=> b!292227 (=> (not res!153260) (not e!184895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292227 (= res!153260 (validKeyInArray!0 k0!2524))))

(declare-fun b!292228 () Bool)

(declare-fun res!153254 () Bool)

(assert (=> b!292228 (=> (not res!153254) (not e!184895))))

(declare-fun arrayContainsKey!0 (array!14754 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292228 (= res!153254 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun res!153255 () Bool)

(assert (=> start!28570 (=> (not res!153255) (not e!184895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28570 (= res!153255 (validMask!0 mask!3809))))

(assert (=> start!28570 e!184895))

(assert (=> start!28570 true))

(declare-fun array_inv!4950 (array!14754) Bool)

(assert (=> start!28570 (array_inv!4950 a!3312)))

(declare-fun b!292229 () Bool)

(assert (=> b!292229 (= e!184895 e!184891)))

(declare-fun res!153257 () Bool)

(assert (=> b!292229 (=> (not res!153257) (not e!184891))))

(assert (=> b!292229 (= res!153257 (or lt!144688 (= lt!144684 (MissingVacant!2114 i!1256))))))

(assert (=> b!292229 (= lt!144688 (= lt!144684 (MissingZero!2114 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14754 (_ BitVec 32)) SeekEntryResult!2114)

(assert (=> b!292229 (= lt!144684 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!292230 () Bool)

(declare-fun res!153259 () Bool)

(assert (=> b!292230 (=> (not res!153259) (not e!184895))))

(assert (=> b!292230 (= res!153259 (and (= (size!7352 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7352 a!3312))))))

(declare-fun b!292231 () Bool)

(declare-fun res!153258 () Bool)

(assert (=> b!292231 (=> (not res!153258) (not e!184891))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14754 (_ BitVec 32)) Bool)

(assert (=> b!292231 (= res!153258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(assert (= (and start!28570 res!153255) b!292230))

(assert (= (and b!292230 res!153259) b!292227))

(assert (= (and b!292227 res!153260) b!292228))

(assert (= (and b!292228 res!153254) b!292229))

(assert (= (and b!292229 res!153257) b!292231))

(assert (= (and b!292231 res!153258) b!292224))

(assert (= (and b!292224 res!153256) b!292225))

(assert (= (and b!292225 res!153261) b!292226))

(declare-fun m!306107 () Bool)

(assert (=> b!292224 m!306107))

(declare-fun m!306109 () Bool)

(assert (=> b!292224 m!306109))

(declare-fun m!306111 () Bool)

(assert (=> b!292224 m!306111))

(declare-fun m!306113 () Bool)

(assert (=> b!292224 m!306113))

(declare-fun m!306115 () Bool)

(assert (=> b!292227 m!306115))

(declare-fun m!306117 () Bool)

(assert (=> b!292226 m!306117))

(declare-fun m!306119 () Bool)

(assert (=> b!292229 m!306119))

(declare-fun m!306121 () Bool)

(assert (=> b!292225 m!306121))

(declare-fun m!306123 () Bool)

(assert (=> start!28570 m!306123))

(declare-fun m!306125 () Bool)

(assert (=> start!28570 m!306125))

(declare-fun m!306127 () Bool)

(assert (=> b!292231 m!306127))

(declare-fun m!306129 () Bool)

(assert (=> b!292228 m!306129))

(check-sat (not start!28570) (not b!292228) (not b!292227) (not b!292224) (not b!292226) (not b!292229) (not b!292231))
(check-sat)
