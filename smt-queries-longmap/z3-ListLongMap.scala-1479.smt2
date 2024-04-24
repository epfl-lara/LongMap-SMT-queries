; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28252 () Bool)

(assert start!28252)

(declare-fun b!289557 () Bool)

(declare-fun e!183314 () Bool)

(declare-fun e!183310 () Bool)

(assert (=> b!289557 (= e!183314 e!183310)))

(declare-fun res!151112 () Bool)

(assert (=> b!289557 (=> (not res!151112) (not e!183310))))

(declare-fun lt!142932 () Bool)

(assert (=> b!289557 (= res!151112 lt!142932)))

(declare-datatypes ((SeekEntryResult!2027 0))(
  ( (MissingZero!2027 (index!10278 (_ BitVec 32))) (Found!2027 (index!10279 (_ BitVec 32))) (Intermediate!2027 (undefined!2839 Bool) (index!10280 (_ BitVec 32)) (x!28592 (_ BitVec 32))) (Undefined!2027) (MissingVacant!2027 (index!10281 (_ BitVec 32))) )
))
(declare-fun lt!142930 () SeekEntryResult!2027)

(declare-fun i!1256 () (_ BitVec 32))

(declare-fun lt!142933 () (_ BitVec 32))

(declare-datatypes ((array!14571 0))(
  ( (array!14572 (arr!6913 (Array (_ BitVec 32) (_ BitVec 64))) (size!7265 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14571)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14571 (_ BitVec 32)) SeekEntryResult!2027)

(assert (=> b!289557 (= lt!142930 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142933 k0!2524 (array!14572 (store (arr!6913 a!3312) i!1256 k0!2524) (size!7265 a!3312)) mask!3809))))

(declare-fun lt!142931 () SeekEntryResult!2027)

(assert (=> b!289557 (= lt!142931 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142933 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289557 (= lt!142933 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289558 () Bool)

(declare-fun res!151116 () Bool)

(assert (=> b!289558 (=> (not res!151116) (not e!183314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14571 (_ BitVec 32)) Bool)

(assert (=> b!289558 (= res!151116 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!289559 () Bool)

(assert (=> b!289559 (= e!183310 (and (= lt!142930 lt!142931) (bvslt mask!3809 #b00000000000000000000000000000000)))))

(declare-datatypes ((Unit!9063 0))(
  ( (Unit!9064) )
))
(declare-fun lt!142935 () Unit!9063)

(declare-fun e!183311 () Unit!9063)

(assert (=> b!289559 (= lt!142935 e!183311)))

(declare-fun c!46786 () Bool)

(get-info :version)

(assert (=> b!289559 (= c!46786 (or (and ((_ is Intermediate!2027) lt!142931) (undefined!2839 lt!142931)) (and ((_ is Intermediate!2027) lt!142931) (= (select (arr!6913 a!3312) (index!10280 lt!142931)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2027) lt!142931) (= (select (arr!6913 a!3312) (index!10280 lt!142931)) k0!2524))))))

(declare-fun b!289560 () Bool)

(assert (=> b!289560 false))

(declare-fun e!183312 () Unit!9063)

(declare-fun Unit!9065 () Unit!9063)

(assert (=> b!289560 (= e!183312 Unit!9065)))

(declare-fun b!289561 () Bool)

(declare-fun e!183313 () Bool)

(assert (=> b!289561 (= e!183313 e!183314)))

(declare-fun res!151114 () Bool)

(assert (=> b!289561 (=> (not res!151114) (not e!183314))))

(declare-fun lt!142929 () SeekEntryResult!2027)

(assert (=> b!289561 (= res!151114 (or lt!142932 (= lt!142929 (MissingVacant!2027 i!1256))))))

(assert (=> b!289561 (= lt!142932 (= lt!142929 (MissingZero!2027 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14571 (_ BitVec 32)) SeekEntryResult!2027)

(assert (=> b!289561 (= lt!142929 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289562 () Bool)

(declare-fun res!151110 () Bool)

(assert (=> b!289562 (=> (not res!151110) (not e!183313))))

(declare-fun arrayContainsKey!0 (array!14571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289562 (= res!151110 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289563 () Bool)

(declare-fun Unit!9066 () Unit!9063)

(assert (=> b!289563 (= e!183311 Unit!9066)))

(assert (=> b!289563 false))

(declare-fun res!151113 () Bool)

(assert (=> start!28252 (=> (not res!151113) (not e!183313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28252 (= res!151113 (validMask!0 mask!3809))))

(assert (=> start!28252 e!183313))

(assert (=> start!28252 true))

(declare-fun array_inv!4863 (array!14571) Bool)

(assert (=> start!28252 (array_inv!4863 a!3312)))

(declare-fun b!289564 () Bool)

(declare-fun res!151111 () Bool)

(assert (=> b!289564 (=> (not res!151111) (not e!183313))))

(assert (=> b!289564 (= res!151111 (and (= (size!7265 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7265 a!3312))))))

(declare-fun b!289565 () Bool)

(declare-fun res!151115 () Bool)

(assert (=> b!289565 (=> (not res!151115) (not e!183313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289565 (= res!151115 (validKeyInArray!0 k0!2524))))

(declare-fun b!289566 () Bool)

(assert (=> b!289566 (= e!183311 e!183312)))

(declare-fun c!46785 () Bool)

(assert (=> b!289566 (= c!46785 ((_ is Intermediate!2027) lt!142931))))

(declare-fun b!289567 () Bool)

(assert (=> b!289567 (and (= lt!142930 lt!142931) (= (select (store (arr!6913 a!3312) i!1256 k0!2524) (index!10280 lt!142931)) k0!2524))))

(declare-fun lt!142934 () Unit!9063)

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14571 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9063)

(assert (=> b!289567 (= lt!142934 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142933 (index!10280 lt!142931) (x!28592 lt!142931) mask!3809))))

(assert (=> b!289567 (and (= (select (arr!6913 a!3312) (index!10280 lt!142931)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10280 lt!142931) i!1256))))

(declare-fun Unit!9067 () Unit!9063)

(assert (=> b!289567 (= e!183312 Unit!9067)))

(assert (= (and start!28252 res!151113) b!289564))

(assert (= (and b!289564 res!151111) b!289565))

(assert (= (and b!289565 res!151115) b!289562))

(assert (= (and b!289562 res!151110) b!289561))

(assert (= (and b!289561 res!151114) b!289558))

(assert (= (and b!289558 res!151116) b!289557))

(assert (= (and b!289557 res!151112) b!289559))

(assert (= (and b!289559 c!46786) b!289563))

(assert (= (and b!289559 (not c!46786)) b!289566))

(assert (= (and b!289566 c!46785) b!289567))

(assert (= (and b!289566 (not c!46785)) b!289560))

(declare-fun m!303839 () Bool)

(assert (=> b!289561 m!303839))

(declare-fun m!303841 () Bool)

(assert (=> b!289562 m!303841))

(declare-fun m!303843 () Bool)

(assert (=> b!289567 m!303843))

(declare-fun m!303845 () Bool)

(assert (=> b!289567 m!303845))

(declare-fun m!303847 () Bool)

(assert (=> b!289567 m!303847))

(declare-fun m!303849 () Bool)

(assert (=> b!289567 m!303849))

(declare-fun m!303851 () Bool)

(assert (=> b!289558 m!303851))

(declare-fun m!303853 () Bool)

(assert (=> start!28252 m!303853))

(declare-fun m!303855 () Bool)

(assert (=> start!28252 m!303855))

(declare-fun m!303857 () Bool)

(assert (=> b!289565 m!303857))

(assert (=> b!289559 m!303849))

(assert (=> b!289557 m!303843))

(declare-fun m!303859 () Bool)

(assert (=> b!289557 m!303859))

(declare-fun m!303861 () Bool)

(assert (=> b!289557 m!303861))

(declare-fun m!303863 () Bool)

(assert (=> b!289557 m!303863))

(check-sat (not b!289565) (not b!289558) (not b!289567) (not b!289557) (not start!28252) (not b!289562) (not b!289561))
(check-sat)
