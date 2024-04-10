; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!29328 () Bool)

(assert start!29328)

(declare-fun b!297166 () Bool)

(declare-fun e!187808 () Bool)

(declare-fun e!187806 () Bool)

(assert (=> b!297166 (= e!187808 e!187806)))

(declare-fun res!156699 () Bool)

(assert (=> b!297166 (=> (not res!156699) (not e!187806))))

(declare-fun lt!147653 () Bool)

(declare-datatypes ((array!15041 0))(
  ( (array!15042 (arr!7128 (Array (_ BitVec 32) (_ BitVec 64))) (size!7480 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!15041)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!2277 0))(
  ( (MissingZero!2277 (index!11278 (_ BitVec 32))) (Found!2277 (index!11279 (_ BitVec 32))) (Intermediate!2277 (undefined!3089 Bool) (index!11280 (_ BitVec 32)) (x!29493 (_ BitVec 32))) (Undefined!2277) (MissingVacant!2277 (index!11281 (_ BitVec 32))) )
))
(declare-fun lt!147657 () SeekEntryResult!2277)

(assert (=> b!297166 (= res!156699 (and (or lt!147653 (not (undefined!3089 lt!147657))) (or lt!147653 (not (= (select (arr!7128 a!3312) (index!11280 lt!147657)) #b1000000000000000000000000000000000000000000000000000000000000000))) (or lt!147653 (not (= (select (arr!7128 a!3312) (index!11280 lt!147657)) k0!2524))) (not lt!147653)))))

(get-info :version)

(assert (=> b!297166 (= lt!147653 (not ((_ is Intermediate!2277) lt!147657)))))

(declare-fun b!297167 () Bool)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!297167 (= e!187806 (not (= (select (store (arr!7128 a!3312) i!1256 k0!2524) (index!11280 lt!147657)) k0!2524)))))

(declare-fun lt!147655 () SeekEntryResult!2277)

(assert (=> b!297167 (= lt!147655 lt!147657)))

(declare-fun lt!147656 () (_ BitVec 32))

(declare-datatypes ((Unit!9252 0))(
  ( (Unit!9253) )
))
(declare-fun lt!147651 () Unit!9252)

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15041 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9252)

(assert (=> b!297167 (= lt!147651 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!147656 (index!11280 lt!147657) (x!29493 lt!147657) mask!3809))))

(assert (=> b!297167 (and (= (select (arr!7128 a!3312) (index!11280 lt!147657)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!11280 lt!147657) i!1256))))

(declare-fun b!297168 () Bool)

(declare-fun e!187810 () Bool)

(assert (=> b!297168 (= e!187810 e!187808)))

(declare-fun res!156696 () Bool)

(assert (=> b!297168 (=> (not res!156696) (not e!187808))))

(declare-fun lt!147652 () Bool)

(assert (=> b!297168 (= res!156696 lt!147652)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15041 (_ BitVec 32)) SeekEntryResult!2277)

(assert (=> b!297168 (= lt!147655 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147656 k0!2524 (array!15042 (store (arr!7128 a!3312) i!1256 k0!2524) (size!7480 a!3312)) mask!3809))))

(assert (=> b!297168 (= lt!147657 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!147656 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!297168 (= lt!147656 (toIndex!0 k0!2524 mask!3809))))

(declare-fun res!156698 () Bool)

(declare-fun e!187809 () Bool)

(assert (=> start!29328 (=> (not res!156698) (not e!187809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!29328 (= res!156698 (validMask!0 mask!3809))))

(assert (=> start!29328 e!187809))

(assert (=> start!29328 true))

(declare-fun array_inv!5091 (array!15041) Bool)

(assert (=> start!29328 (array_inv!5091 a!3312)))

(declare-fun b!297169 () Bool)

(declare-fun res!156692 () Bool)

(assert (=> b!297169 (=> (not res!156692) (not e!187810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15041 (_ BitVec 32)) Bool)

(assert (=> b!297169 (= res!156692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!297170 () Bool)

(declare-fun res!156694 () Bool)

(assert (=> b!297170 (=> (not res!156694) (not e!187809))))

(declare-fun arrayContainsKey!0 (array!15041 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!297170 (= res!156694 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!297171 () Bool)

(declare-fun res!156697 () Bool)

(assert (=> b!297171 (=> (not res!156697) (not e!187809))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!297171 (= res!156697 (validKeyInArray!0 k0!2524))))

(declare-fun b!297172 () Bool)

(declare-fun res!156693 () Bool)

(assert (=> b!297172 (=> (not res!156693) (not e!187809))))

(assert (=> b!297172 (= res!156693 (and (= (size!7480 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7480 a!3312))))))

(declare-fun b!297173 () Bool)

(assert (=> b!297173 (= e!187809 e!187810)))

(declare-fun res!156695 () Bool)

(assert (=> b!297173 (=> (not res!156695) (not e!187810))))

(declare-fun lt!147654 () SeekEntryResult!2277)

(assert (=> b!297173 (= res!156695 (or lt!147652 (= lt!147654 (MissingVacant!2277 i!1256))))))

(assert (=> b!297173 (= lt!147652 (= lt!147654 (MissingZero!2277 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15041 (_ BitVec 32)) SeekEntryResult!2277)

(assert (=> b!297173 (= lt!147654 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(assert (= (and start!29328 res!156698) b!297172))

(assert (= (and b!297172 res!156693) b!297171))

(assert (= (and b!297171 res!156697) b!297170))

(assert (= (and b!297170 res!156694) b!297173))

(assert (= (and b!297173 res!156695) b!297169))

(assert (= (and b!297169 res!156692) b!297168))

(assert (= (and b!297168 res!156696) b!297166))

(assert (= (and b!297166 res!156699) b!297167))

(declare-fun m!309989 () Bool)

(assert (=> b!297168 m!309989))

(declare-fun m!309991 () Bool)

(assert (=> b!297168 m!309991))

(declare-fun m!309993 () Bool)

(assert (=> b!297168 m!309993))

(declare-fun m!309995 () Bool)

(assert (=> b!297168 m!309995))

(declare-fun m!309997 () Bool)

(assert (=> b!297173 m!309997))

(assert (=> b!297167 m!309989))

(declare-fun m!309999 () Bool)

(assert (=> b!297167 m!309999))

(declare-fun m!310001 () Bool)

(assert (=> b!297167 m!310001))

(declare-fun m!310003 () Bool)

(assert (=> b!297167 m!310003))

(declare-fun m!310005 () Bool)

(assert (=> b!297171 m!310005))

(declare-fun m!310007 () Bool)

(assert (=> b!297170 m!310007))

(declare-fun m!310009 () Bool)

(assert (=> start!29328 m!310009))

(declare-fun m!310011 () Bool)

(assert (=> start!29328 m!310011))

(assert (=> b!297166 m!310003))

(declare-fun m!310013 () Bool)

(assert (=> b!297169 m!310013))

(check-sat (not b!297173) (not b!297169) (not start!29328) (not b!297171) (not b!297170) (not b!297167) (not b!297168))
(check-sat)
