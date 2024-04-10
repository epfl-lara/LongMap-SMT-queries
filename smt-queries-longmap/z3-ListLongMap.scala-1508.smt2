; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28580 () Bool)

(assert start!28580)

(declare-fun b!292201 () Bool)

(declare-fun res!153258 () Bool)

(declare-fun e!184886 () Bool)

(assert (=> b!292201 (=> (not res!153258) (not e!184886))))

(declare-datatypes ((array!14759 0))(
  ( (array!14760 (arr!7002 (Array (_ BitVec 32) (_ BitVec 64))) (size!7354 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14759)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!14759 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!292201 (= res!153258 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!292202 () Bool)

(declare-fun e!184883 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!292202 (= e!184883 (not (bvsge mask!3809 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!9164 0))(
  ( (Unit!9165) )
))
(declare-fun lt!144646 () Unit!9164)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!2151 0))(
  ( (MissingZero!2151 (index!10774 (_ BitVec 32))) (Found!2151 (index!10775 (_ BitVec 32))) (Intermediate!2151 (undefined!2963 Bool) (index!10776 (_ BitVec 32)) (x!28966 (_ BitVec 32))) (Undefined!2151) (MissingVacant!2151 (index!10777 (_ BitVec 32))) )
))
(declare-fun lt!144652 () SeekEntryResult!2151)

(declare-fun lt!144648 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 (array!14759 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9164)

(assert (=> b!292202 (= lt!144646 (lemmaPutValidKeyAtRightPlaceThenFindsHelper2!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!144648 (index!10776 lt!144652) (x!28966 lt!144652) mask!3809))))

(assert (=> b!292202 (= (index!10776 lt!144652) i!1256)))

(declare-fun b!292203 () Bool)

(declare-fun e!184882 () Bool)

(assert (=> b!292203 (= e!184882 e!184883)))

(declare-fun res!153263 () Bool)

(assert (=> b!292203 (=> (not res!153263) (not e!184883))))

(declare-fun lt!144651 () Bool)

(assert (=> b!292203 (= res!153263 (and (or lt!144651 (not (undefined!2963 lt!144652))) (not lt!144651) (= (select (arr!7002 a!3312) (index!10776 lt!144652)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(get-info :version)

(assert (=> b!292203 (= lt!144651 (not ((_ is Intermediate!2151) lt!144652)))))

(declare-fun b!292204 () Bool)

(declare-fun e!184885 () Bool)

(assert (=> b!292204 (= e!184885 e!184882)))

(declare-fun res!153257 () Bool)

(assert (=> b!292204 (=> (not res!153257) (not e!184882))))

(declare-fun lt!144647 () Bool)

(declare-fun lt!144650 () SeekEntryResult!2151)

(assert (=> b!292204 (= res!153257 (and (not lt!144647) (= lt!144650 (MissingVacant!2151 i!1256))))))

(declare-fun lt!144649 () SeekEntryResult!2151)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14759 (_ BitVec 32)) SeekEntryResult!2151)

(assert (=> b!292204 (= lt!144649 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144648 k0!2524 (array!14760 (store (arr!7002 a!3312) i!1256 k0!2524) (size!7354 a!3312)) mask!3809))))

(assert (=> b!292204 (= lt!144652 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!144648 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!292204 (= lt!144648 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!292205 () Bool)

(declare-fun res!153260 () Bool)

(assert (=> b!292205 (=> (not res!153260) (not e!184885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14759 (_ BitVec 32)) Bool)

(assert (=> b!292205 (= res!153260 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!153264 () Bool)

(assert (=> start!28580 (=> (not res!153264) (not e!184886))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28580 (= res!153264 (validMask!0 mask!3809))))

(assert (=> start!28580 e!184886))

(assert (=> start!28580 true))

(declare-fun array_inv!4965 (array!14759) Bool)

(assert (=> start!28580 (array_inv!4965 a!3312)))

(declare-fun b!292206 () Bool)

(declare-fun res!153262 () Bool)

(assert (=> b!292206 (=> (not res!153262) (not e!184886))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!292206 (= res!153262 (validKeyInArray!0 k0!2524))))

(declare-fun b!292207 () Bool)

(declare-fun res!153261 () Bool)

(assert (=> b!292207 (=> (not res!153261) (not e!184886))))

(assert (=> b!292207 (= res!153261 (and (= (size!7354 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7354 a!3312))))))

(declare-fun b!292208 () Bool)

(assert (=> b!292208 (= e!184886 e!184885)))

(declare-fun res!153259 () Bool)

(assert (=> b!292208 (=> (not res!153259) (not e!184885))))

(assert (=> b!292208 (= res!153259 (or lt!144647 (= lt!144650 (MissingVacant!2151 i!1256))))))

(assert (=> b!292208 (= lt!144647 (= lt!144650 (MissingZero!2151 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14759 (_ BitVec 32)) SeekEntryResult!2151)

(assert (=> b!292208 (= lt!144650 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!28580 res!153264) b!292207))

(assert (= (and b!292207 res!153261) b!292206))

(assert (= (and b!292206 res!153262) b!292201))

(assert (= (and b!292201 res!153258) b!292208))

(assert (= (and b!292208 res!153259) b!292205))

(assert (= (and b!292205 res!153260) b!292204))

(assert (= (and b!292204 res!153257) b!292203))

(assert (= (and b!292203 res!153263) b!292202))

(declare-fun m!305925 () Bool)

(assert (=> b!292204 m!305925))

(declare-fun m!305927 () Bool)

(assert (=> b!292204 m!305927))

(declare-fun m!305929 () Bool)

(assert (=> b!292204 m!305929))

(declare-fun m!305931 () Bool)

(assert (=> b!292204 m!305931))

(declare-fun m!305933 () Bool)

(assert (=> b!292205 m!305933))

(declare-fun m!305935 () Bool)

(assert (=> b!292203 m!305935))

(declare-fun m!305937 () Bool)

(assert (=> b!292208 m!305937))

(declare-fun m!305939 () Bool)

(assert (=> b!292206 m!305939))

(declare-fun m!305941 () Bool)

(assert (=> b!292201 m!305941))

(declare-fun m!305943 () Bool)

(assert (=> start!28580 m!305943))

(declare-fun m!305945 () Bool)

(assert (=> start!28580 m!305945))

(declare-fun m!305947 () Bool)

(assert (=> b!292202 m!305947))

(check-sat (not b!292201) (not b!292204) (not b!292206) (not start!28580) (not b!292202) (not b!292205) (not b!292208))
(check-sat)
