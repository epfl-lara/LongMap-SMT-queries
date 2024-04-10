; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!29158 () Bool)

(assert start!29158)

(declare-fun res!155656 () Bool)

(declare-fun e!186990 () Bool)

(assert (=> start!29158 (=> (not res!155656) (not e!186990))))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29158 (= res!155656 (validMask!0 mask!3809))))

(assert (=> start!29158 e!186990))

(assert (=> start!29158 true))

(declare-datatypes ((array!14961 0))(
  ( (array!14962 (arr!7091 (Array (_ BitVec 32) (_ BitVec 64))) (size!7443 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14961)

(declare-fun array_inv!5054 (array!14961) Bool)

(assert (=> start!29158 (array_inv!5054 a!3312)))

(declare-fun b!295846 () Bool)

(declare-fun res!155661 () Bool)

(declare-fun e!186989 () Bool)

(assert (=> b!295846 (=> (not res!155661) (not e!186989))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14961 (_ BitVec 32)) Bool)

(assert (=> b!295846 (= res!155661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!295847 () Bool)

(declare-fun res!155657 () Bool)

(assert (=> b!295847 (=> (not res!155657) (not e!186990))))

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!295847 (= res!155657 (and (= (size!7443 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7443 a!3312))))))

(declare-fun b!295848 () Bool)

(declare-fun e!186991 () Bool)

(assert (=> b!295848 (= e!186989 e!186991)))

(declare-fun res!155655 () Bool)

(assert (=> b!295848 (=> (not res!155655) (not e!186991))))

(declare-fun lt!146771 () Bool)

(assert (=> b!295848 (= res!155655 lt!146771)))

(declare-fun lt!146770 () (_ BitVec 32))

(declare-fun k!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2240 0))(
  ( (MissingZero!2240 (index!11130 (_ BitVec 32))) (Found!2240 (index!11131 (_ BitVec 32))) (Intermediate!2240 (undefined!3052 Bool) (index!11132 (_ BitVec 32)) (x!29348 (_ BitVec 32))) (Undefined!2240) (MissingVacant!2240 (index!11133 (_ BitVec 32))) )
))
(declare-fun lt!146775 () SeekEntryResult!2240)

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14961 (_ BitVec 32)) SeekEntryResult!2240)

(assert (=> b!295848 (= lt!146775 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146770 k!2524 (array!14962 (store (arr!7091 a!3312) i!1256 k!2524) (size!7443 a!3312)) mask!3809))))

(declare-fun lt!146774 () SeekEntryResult!2240)

(assert (=> b!295848 (= lt!146774 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!146770 k!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!295848 (= lt!146770 (toIndex!0 k!2524 mask!3809))))

(declare-fun b!295849 () Bool)

(declare-fun e!186987 () Bool)

(assert (=> b!295849 (= e!186991 e!186987)))

(declare-fun res!155659 () Bool)

(assert (=> b!295849 (=> (not res!155659) (not e!186987))))

(declare-fun lt!146773 () Bool)

(assert (=> b!295849 (= res!155659 (and (or lt!146773 (not (undefined!3052 lt!146774))) (or lt!146773 (not (= (select (arr!7091 a!3312) (index!11132 lt!146774)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!146773 (not (= (select (arr!7091 a!3312) (index!11132 lt!146774)) k!2524))) (not lt!146773)))))

(assert (=> b!295849 (= lt!146773 (not (is-Intermediate!2240 lt!146774)))))

(declare-fun b!295850 () Bool)

(declare-fun res!155654 () Bool)

(assert (=> b!295850 (=> (not res!155654) (not e!186990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!295850 (= res!155654 (validKeyInArray!0 k!2524))))

(declare-fun b!295851 () Bool)

(declare-fun res!155658 () Bool)

(assert (=> b!295851 (=> (not res!155658) (not e!186990))))

(declare-fun arrayContainsKey!0 (array!14961 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!295851 (= res!155658 (not (arrayContainsKey!0 a!3312 k!2524 #b00000000000000000000000000000000)))))

(declare-fun b!295852 () Bool)

(assert (=> b!295852 (= e!186987 (not true))))

(assert (=> b!295852 (and (= (select (arr!7091 a!3312) (index!11132 lt!146774)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11132 lt!146774) i!1256))))

(declare-fun b!295853 () Bool)

(assert (=> b!295853 (= e!186990 e!186989)))

(declare-fun res!155660 () Bool)

(assert (=> b!295853 (=> (not res!155660) (not e!186989))))

(declare-fun lt!146772 () SeekEntryResult!2240)

(assert (=> b!295853 (= res!155660 (or lt!146771 (= lt!146772 (MissingVacant!2240 i!1256))))))

(assert (=> b!295853 (= lt!146771 (= lt!146772 (MissingZero!2240 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14961 (_ BitVec 32)) SeekEntryResult!2240)

(assert (=> b!295853 (= lt!146772 (seekEntryOrOpen!0 k!2524 a!3312 mask!3809))))

(assert (= (and start!29158 res!155656) b!295847))

(assert (= (and b!295847 res!155657) b!295850))

(assert (= (and b!295850 res!155654) b!295851))

(assert (= (and b!295851 res!155658) b!295853))

(assert (= (and b!295853 res!155660) b!295846))

(assert (= (and b!295846 res!155661) b!295848))

(assert (= (and b!295848 res!155655) b!295849))

(assert (= (and b!295849 res!155659) b!295852))

(declare-fun m!308919 () Bool)

(assert (=> b!295852 m!308919))

(declare-fun m!308921 () Bool)

(assert (=> b!295846 m!308921))

(assert (=> b!295849 m!308919))

(declare-fun m!308923 () Bool)

(assert (=> start!29158 m!308923))

(declare-fun m!308925 () Bool)

(assert (=> start!29158 m!308925))

(declare-fun m!308927 () Bool)

(assert (=> b!295851 m!308927))

(declare-fun m!308929 () Bool)

(assert (=> b!295850 m!308929))

(declare-fun m!308931 () Bool)

(assert (=> b!295853 m!308931))

(declare-fun m!308933 () Bool)

(assert (=> b!295848 m!308933))

(declare-fun m!308935 () Bool)

(assert (=> b!295848 m!308935))

(declare-fun m!308937 () Bool)

(assert (=> b!295848 m!308937))

(declare-fun m!308939 () Bool)

(assert (=> b!295848 m!308939))

(push 1)

