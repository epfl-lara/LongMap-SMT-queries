; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!31056 () Bool)

(assert start!31056)

(declare-fun b!312312 () Bool)

(declare-fun res!168916 () Bool)

(declare-fun e!194720 () Bool)

(assert (=> b!312312 (=> (not res!168916) (not e!194720))))

(declare-datatypes ((array!15962 0))(
  ( (array!15963 (arr!7563 (Array (_ BitVec 32) (_ BitVec 64))) (size!7916 (_ BitVec 32))) )
))
(declare-fun a!3293 () array!15962)

(declare-fun i!1240 () (_ BitVec 32))

(declare-fun x!1427 () (_ BitVec 32))

(declare-fun index!1781 () (_ BitVec 32))

(declare-fun resIndex!52 () (_ BitVec 32))

(declare-fun resX!52 () (_ BitVec 32))

(assert (=> b!312312 (= res!168916 (and (= (select (arr!7563 a!3293) resIndex!52) #b0000000000000000000000000000000000000000000000000000000000000000) (= resIndex!52 i!1240) (bvsle x!1427 resX!52) (bvsge x!1427 #b00000000000000000000000000000000) (bvsge index!1781 #b00000000000000000000000000000000) (bvslt index!1781 (size!7916 a!3293))))))

(declare-fun res!168917 () Bool)

(declare-fun e!194716 () Bool)

(assert (=> start!31056 (=> (not res!168917) (not e!194716))))

(declare-fun mask!3709 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!31056 (= res!168917 (validMask!0 mask!3709))))

(assert (=> start!31056 e!194716))

(declare-fun array_inv!5535 (array!15962) Bool)

(assert (=> start!31056 (array_inv!5535 a!3293)))

(assert (=> start!31056 true))

(declare-fun b!312313 () Bool)

(declare-fun res!168920 () Bool)

(assert (=> b!312313 (=> (not res!168920) (not e!194716))))

(declare-fun k0!2441 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!312313 (= res!168920 (validKeyInArray!0 k0!2441))))

(declare-fun b!312314 () Bool)

(declare-fun res!168914 () Bool)

(assert (=> b!312314 (=> (not res!168914) (not e!194716))))

(declare-fun arrayContainsKey!0 (array!15962 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!312314 (= res!168914 (not (arrayContainsKey!0 a!3293 k0!2441 #b00000000000000000000000000000000)))))

(declare-fun b!312315 () Bool)

(declare-fun e!194717 () Bool)

(assert (=> b!312315 (= e!194720 e!194717)))

(declare-fun res!168918 () Bool)

(assert (=> b!312315 (=> (not res!168918) (not e!194717))))

(declare-datatypes ((SeekEntryResult!2702 0))(
  ( (MissingZero!2702 (index!12984 (_ BitVec 32))) (Found!2702 (index!12985 (_ BitVec 32))) (Intermediate!2702 (undefined!3514 Bool) (index!12986 (_ BitVec 32)) (x!31206 (_ BitVec 32))) (Undefined!2702) (MissingVacant!2702 (index!12987 (_ BitVec 32))) )
))
(declare-fun lt!152912 () SeekEntryResult!2702)

(declare-fun lt!152917 () SeekEntryResult!2702)

(assert (=> b!312315 (= res!168918 (and (= lt!152912 lt!152917) (bvslt resX!52 #b01111111111111111111111111111110) (not (= (select (arr!7563 a!3293) index!1781) k0!2441)) (not (= x!1427 resX!52))))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!15962 (_ BitVec 32)) SeekEntryResult!2702)

(assert (=> b!312315 (= lt!152912 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 a!3293 mask!3709))))

(declare-fun b!312316 () Bool)

(declare-fun e!194719 () Bool)

(assert (=> b!312316 (= e!194717 (not e!194719))))

(declare-fun res!168912 () Bool)

(assert (=> b!312316 (=> res!168912 e!194719)))

(declare-fun lt!152914 () (_ BitVec 32))

(declare-fun lt!152918 () SeekEntryResult!2702)

(assert (=> b!312316 (= res!168912 (or (bvsgt (bvadd #b00000000000000000000000000000001 x!1427) resX!52) (bvslt (bvadd #b00000000000000000000000000000001 x!1427) #b00000000000000000000000000000000) (bvslt lt!152914 #b00000000000000000000000000000000) (bvsge lt!152914 (size!7916 a!3293)) (not (= lt!152918 lt!152917))))))

(declare-fun lt!152911 () SeekEntryResult!2702)

(declare-fun lt!152916 () SeekEntryResult!2702)

(assert (=> b!312316 (= lt!152911 lt!152916)))

(declare-fun lt!152913 () array!15962)

(assert (=> b!312316 (= lt!152916 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152914 k0!2441 lt!152913 mask!3709))))

(assert (=> b!312316 (= lt!152911 (seekKeyOrZeroOrLongMinValue!0 x!1427 index!1781 k0!2441 lt!152913 mask!3709))))

(assert (=> b!312316 (= lt!152913 (array!15963 (store (arr!7563 a!3293) i!1240 k0!2441) (size!7916 a!3293)))))

(assert (=> b!312316 (= lt!152912 lt!152918)))

(assert (=> b!312316 (= lt!152918 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000001 x!1427) lt!152914 k0!2441 a!3293 mask!3709))))

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312316 (= lt!152914 (nextIndex!0 index!1781 x!1427 mask!3709))))

(declare-fun b!312317 () Bool)

(assert (=> b!312317 (= e!194716 e!194720)))

(declare-fun res!168913 () Bool)

(assert (=> b!312317 (=> (not res!168913) (not e!194720))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!312317 (= res!168913 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2441 mask!3709) k0!2441 a!3293 mask!3709) lt!152917))))

(assert (=> b!312317 (= lt!152917 (Intermediate!2702 false resIndex!52 resX!52))))

(declare-fun b!312318 () Bool)

(assert (=> b!312318 (= e!194719 (or (bvslt mask!3709 #b00000000000000000000000000000000) (bvslt index!1781 (bvadd #b00000000000000000000000000000001 mask!3709))))))

(assert (=> b!312318 (= lt!152916 lt!152918)))

(declare-datatypes ((Unit!9607 0))(
  ( (Unit!9608) )
))
(declare-fun lt!152915 () Unit!9607)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!15962 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9607)

(assert (=> b!312318 (= lt!152915 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3293 i!1240 k0!2441 (bvadd #b00000000000000000000000000000001 x!1427) lt!152914 resIndex!52 resX!52 mask!3709))))

(declare-fun b!312319 () Bool)

(declare-fun res!168915 () Bool)

(assert (=> b!312319 (=> (not res!168915) (not e!194716))))

(assert (=> b!312319 (= res!168915 (and (= (size!7916 a!3293) (bvadd #b00000000000000000000000000000001 mask!3709)) (bvsge i!1240 #b00000000000000000000000000000000) (bvslt i!1240 (size!7916 a!3293))))))

(declare-fun b!312320 () Bool)

(declare-fun res!168919 () Bool)

(assert (=> b!312320 (=> (not res!168919) (not e!194716))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!15962 (_ BitVec 32)) SeekEntryResult!2702)

(assert (=> b!312320 (= res!168919 (= (seekEntryOrOpen!0 k0!2441 a!3293 mask!3709) (MissingZero!2702 i!1240)))))

(declare-fun b!312321 () Bool)

(declare-fun res!168921 () Bool)

(assert (=> b!312321 (=> (not res!168921) (not e!194716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!15962 (_ BitVec 32)) Bool)

(assert (=> b!312321 (= res!168921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3293 mask!3709))))

(assert (= (and start!31056 res!168917) b!312319))

(assert (= (and b!312319 res!168915) b!312313))

(assert (= (and b!312313 res!168920) b!312314))

(assert (= (and b!312314 res!168914) b!312320))

(assert (= (and b!312320 res!168919) b!312321))

(assert (= (and b!312321 res!168921) b!312317))

(assert (= (and b!312317 res!168913) b!312312))

(assert (= (and b!312312 res!168916) b!312315))

(assert (= (and b!312315 res!168918) b!312316))

(assert (= (and b!312316 (not res!168912)) b!312318))

(declare-fun m!321961 () Bool)

(assert (=> b!312316 m!321961))

(declare-fun m!321963 () Bool)

(assert (=> b!312316 m!321963))

(declare-fun m!321965 () Bool)

(assert (=> b!312316 m!321965))

(declare-fun m!321967 () Bool)

(assert (=> b!312316 m!321967))

(declare-fun m!321969 () Bool)

(assert (=> b!312316 m!321969))

(declare-fun m!321971 () Bool)

(assert (=> start!31056 m!321971))

(declare-fun m!321973 () Bool)

(assert (=> start!31056 m!321973))

(declare-fun m!321975 () Bool)

(assert (=> b!312314 m!321975))

(declare-fun m!321977 () Bool)

(assert (=> b!312318 m!321977))

(declare-fun m!321979 () Bool)

(assert (=> b!312320 m!321979))

(declare-fun m!321981 () Bool)

(assert (=> b!312315 m!321981))

(declare-fun m!321983 () Bool)

(assert (=> b!312315 m!321983))

(declare-fun m!321985 () Bool)

(assert (=> b!312312 m!321985))

(declare-fun m!321987 () Bool)

(assert (=> b!312317 m!321987))

(assert (=> b!312317 m!321987))

(declare-fun m!321989 () Bool)

(assert (=> b!312317 m!321989))

(declare-fun m!321991 () Bool)

(assert (=> b!312321 m!321991))

(declare-fun m!321993 () Bool)

(assert (=> b!312313 m!321993))

(check-sat (not b!312314) (not b!312321) (not b!312317) (not b!312316) (not b!312313) (not start!31056) (not b!312315) (not b!312320) (not b!312318))
(check-sat)
