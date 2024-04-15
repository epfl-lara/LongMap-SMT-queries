; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!28250 () Bool)

(assert start!28250)

(declare-datatypes ((SeekEntryResult!2054 0))(
  ( (MissingZero!2054 (index!10386 (_ BitVec 32))) (Found!2054 (index!10387 (_ BitVec 32))) (Intermediate!2054 (undefined!2866 Bool) (index!10388 (_ BitVec 32)) (x!28610 (_ BitVec 32))) (Undefined!2054) (MissingVacant!2054 (index!10389 (_ BitVec 32))) )
))
(declare-fun lt!142629 () SeekEntryResult!2054)

(declare-fun i!1256 () (_ BitVec 32))

(declare-datatypes ((array!14557 0))(
  ( (array!14558 (arr!6906 (Array (_ BitVec 32) (_ BitVec 64))) (size!7259 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14557)

(declare-fun b!289264 () Bool)

(declare-fun lt!142632 () SeekEntryResult!2054)

(declare-fun k0!2524 () (_ BitVec 64))

(assert (=> b!289264 (and (= lt!142632 lt!142629) (= (select (store (arr!6906 a!3312) i!1256 k0!2524) (index!10388 lt!142629)) k0!2524))))

(declare-datatypes ((Unit!9030 0))(
  ( (Unit!9031) )
))
(declare-fun lt!142626 () Unit!9030)

(declare-fun lt!142628 () (_ BitVec 32))

(declare-fun mask!3809 () (_ BitVec 32))

(declare-fun lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 (array!14557 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!9030)

(assert (=> b!289264 (= lt!142626 (lemmaPutValidKeyAtRightPlaceThenFindsHelper1!0 a!3312 i!1256 k0!2524 #b00000000000000000000000000000000 lt!142628 (index!10388 lt!142629) (x!28610 lt!142629) mask!3809))))

(assert (=> b!289264 (and (= (select (arr!6906 a!3312) (index!10388 lt!142629)) #b0000000000000000000000000000000000000000000000000000000000000000) (= (index!10388 lt!142629) i!1256))))

(declare-fun e!183130 () Unit!9030)

(declare-fun Unit!9032 () Unit!9030)

(assert (=> b!289264 (= e!183130 Unit!9032)))

(declare-fun b!289265 () Bool)

(declare-fun e!183133 () Bool)

(assert (=> b!289265 (= e!183133 false)))

(declare-fun lt!142631 () Unit!9030)

(declare-fun e!183135 () Unit!9030)

(assert (=> b!289265 (= lt!142631 e!183135)))

(declare-fun c!46729 () Bool)

(get-info :version)

(assert (=> b!289265 (= c!46729 (or (and ((_ is Intermediate!2054) lt!142629) (undefined!2866 lt!142629)) (and ((_ is Intermediate!2054) lt!142629) (= (select (arr!6906 a!3312) (index!10388 lt!142629)) #b1000000000000000000000000000000000000000000000000000000000000000)) (and ((_ is Intermediate!2054) lt!142629) (= (select (arr!6906 a!3312) (index!10388 lt!142629)) k0!2524))))))

(declare-fun b!289266 () Bool)

(declare-fun e!183132 () Bool)

(assert (=> b!289266 (= e!183132 e!183133)))

(declare-fun res!150937 () Bool)

(assert (=> b!289266 (=> (not res!150937) (not e!183133))))

(declare-fun lt!142630 () Bool)

(assert (=> b!289266 (= res!150937 lt!142630)))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14557 (_ BitVec 32)) SeekEntryResult!2054)

(assert (=> b!289266 (= lt!142632 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142628 k0!2524 (array!14558 (store (arr!6906 a!3312) i!1256 k0!2524) (size!7259 a!3312)) mask!3809))))

(assert (=> b!289266 (= lt!142629 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 lt!142628 k0!2524 a!3312 mask!3809))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!289266 (= lt!142628 (toIndex!0 k0!2524 mask!3809))))

(declare-fun b!289267 () Bool)

(declare-fun e!183134 () Bool)

(assert (=> b!289267 (= e!183134 e!183132)))

(declare-fun res!150932 () Bool)

(assert (=> b!289267 (=> (not res!150932) (not e!183132))))

(declare-fun lt!142627 () SeekEntryResult!2054)

(assert (=> b!289267 (= res!150932 (or lt!142630 (= lt!142627 (MissingVacant!2054 i!1256))))))

(assert (=> b!289267 (= lt!142630 (= lt!142627 (MissingZero!2054 i!1256)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14557 (_ BitVec 32)) SeekEntryResult!2054)

(assert (=> b!289267 (= lt!142627 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!289268 () Bool)

(declare-fun res!150935 () Bool)

(assert (=> b!289268 (=> (not res!150935) (not e!183134))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!289268 (= res!150935 (validKeyInArray!0 k0!2524))))

(declare-fun b!289269 () Bool)

(assert (=> b!289269 false))

(declare-fun Unit!9033 () Unit!9030)

(assert (=> b!289269 (= e!183130 Unit!9033)))

(declare-fun b!289271 () Bool)

(declare-fun Unit!9034 () Unit!9030)

(assert (=> b!289271 (= e!183135 Unit!9034)))

(assert (=> b!289271 false))

(declare-fun b!289272 () Bool)

(declare-fun res!150933 () Bool)

(assert (=> b!289272 (=> (not res!150933) (not e!183134))))

(declare-fun arrayContainsKey!0 (array!14557 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!289272 (= res!150933 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(declare-fun b!289273 () Bool)

(assert (=> b!289273 (= e!183135 e!183130)))

(declare-fun c!46728 () Bool)

(assert (=> b!289273 (= c!46728 ((_ is Intermediate!2054) lt!142629))))

(declare-fun b!289274 () Bool)

(declare-fun res!150931 () Bool)

(assert (=> b!289274 (=> (not res!150931) (not e!183134))))

(assert (=> b!289274 (= res!150931 (and (= (size!7259 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7259 a!3312))))))

(declare-fun b!289270 () Bool)

(declare-fun res!150934 () Bool)

(assert (=> b!289270 (=> (not res!150934) (not e!183132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14557 (_ BitVec 32)) Bool)

(assert (=> b!289270 (= res!150934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun res!150936 () Bool)

(assert (=> start!28250 (=> (not res!150936) (not e!183134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!28250 (= res!150936 (validMask!0 mask!3809))))

(assert (=> start!28250 e!183134))

(assert (=> start!28250 true))

(declare-fun array_inv!4878 (array!14557) Bool)

(assert (=> start!28250 (array_inv!4878 a!3312)))

(assert (= (and start!28250 res!150936) b!289274))

(assert (= (and b!289274 res!150931) b!289268))

(assert (= (and b!289268 res!150935) b!289272))

(assert (= (and b!289272 res!150933) b!289267))

(assert (= (and b!289267 res!150932) b!289270))

(assert (= (and b!289270 res!150934) b!289266))

(assert (= (and b!289266 res!150937) b!289265))

(assert (= (and b!289265 c!46729) b!289271))

(assert (= (and b!289265 (not c!46729)) b!289273))

(assert (= (and b!289273 c!46728) b!289264))

(assert (= (and b!289273 (not c!46728)) b!289269))

(declare-fun m!302963 () Bool)

(assert (=> b!289270 m!302963))

(declare-fun m!302965 () Bool)

(assert (=> b!289265 m!302965))

(declare-fun m!302967 () Bool)

(assert (=> b!289272 m!302967))

(declare-fun m!302969 () Bool)

(assert (=> b!289267 m!302969))

(declare-fun m!302971 () Bool)

(assert (=> start!28250 m!302971))

(declare-fun m!302973 () Bool)

(assert (=> start!28250 m!302973))

(declare-fun m!302975 () Bool)

(assert (=> b!289268 m!302975))

(declare-fun m!302977 () Bool)

(assert (=> b!289266 m!302977))

(declare-fun m!302979 () Bool)

(assert (=> b!289266 m!302979))

(declare-fun m!302981 () Bool)

(assert (=> b!289266 m!302981))

(declare-fun m!302983 () Bool)

(assert (=> b!289266 m!302983))

(assert (=> b!289264 m!302977))

(declare-fun m!302985 () Bool)

(assert (=> b!289264 m!302985))

(declare-fun m!302987 () Bool)

(assert (=> b!289264 m!302987))

(assert (=> b!289264 m!302965))

(check-sat (not b!289268) (not start!28250) (not b!289266) (not b!289270) (not b!289272) (not b!289267) (not b!289264))
(check-sat)
