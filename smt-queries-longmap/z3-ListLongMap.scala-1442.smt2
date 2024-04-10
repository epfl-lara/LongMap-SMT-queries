; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27818 () Bool)

(assert start!27818)

(declare-fun b!286359 () Bool)

(declare-fun e!181447 () Bool)

(declare-fun mask!3809 () (_ BitVec 32))

(assert (=> b!286359 (= e!181447 (and (bvsge mask!3809 #b00000000000000000000000000000000) (bvsgt mask!3809 #b00111111111111111111111111111111)))))

(declare-fun b!286360 () Bool)

(declare-fun e!181446 () Bool)

(assert (=> b!286360 (= e!181446 e!181447)))

(declare-fun res!148512 () Bool)

(assert (=> b!286360 (=> (not res!148512) (not e!181447))))

(declare-datatypes ((SeekEntryResult!1953 0))(
  ( (MissingZero!1953 (index!9982 (_ BitVec 32))) (Found!1953 (index!9983 (_ BitVec 32))) (Intermediate!1953 (undefined!2765 Bool) (index!9984 (_ BitVec 32)) (x!28201 (_ BitVec 32))) (Undefined!1953) (MissingVacant!1953 (index!9985 (_ BitVec 32))) )
))
(declare-fun lt!141064 () SeekEntryResult!1953)

(declare-fun i!1256 () (_ BitVec 32))

(assert (=> b!286360 (= res!148512 (or (= lt!141064 (MissingZero!1953 i!1256)) (= lt!141064 (MissingVacant!1953 i!1256))))))

(declare-datatypes ((array!14339 0))(
  ( (array!14340 (arr!6804 (Array (_ BitVec 32) (_ BitVec 64))) (size!7156 (_ BitVec 32))) )
))
(declare-fun a!3312 () array!14339)

(declare-fun k0!2524 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!14339 (_ BitVec 32)) SeekEntryResult!1953)

(assert (=> b!286360 (= lt!141064 (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809))))

(declare-fun b!286361 () Bool)

(declare-fun res!148515 () Bool)

(assert (=> b!286361 (=> (not res!148515) (not e!181446))))

(assert (=> b!286361 (= res!148515 (and (= (size!7156 a!3312) (bvadd #b00000000000000000000000000000001 mask!3809)) (bvsge i!1256 #b00000000000000000000000000000000) (bvslt i!1256 (size!7156 a!3312))))))

(declare-fun res!148510 () Bool)

(assert (=> start!27818 (=> (not res!148510) (not e!181446))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!27818 (= res!148510 (validMask!0 mask!3809))))

(assert (=> start!27818 e!181446))

(assert (=> start!27818 true))

(declare-fun array_inv!4767 (array!14339) Bool)

(assert (=> start!27818 (array_inv!4767 a!3312)))

(declare-fun b!286362 () Bool)

(declare-fun res!148513 () Bool)

(assert (=> b!286362 (=> (not res!148513) (not e!181446))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!286362 (= res!148513 (validKeyInArray!0 k0!2524))))

(declare-fun b!286363 () Bool)

(declare-fun res!148514 () Bool)

(assert (=> b!286363 (=> (not res!148514) (not e!181447))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!14339 (_ BitVec 32)) Bool)

(assert (=> b!286363 (= res!148514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809))))

(declare-fun b!286364 () Bool)

(declare-fun res!148511 () Bool)

(assert (=> b!286364 (=> (not res!148511) (not e!181446))))

(declare-fun arrayContainsKey!0 (array!14339 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!286364 (= res!148511 (not (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000)))))

(assert (= (and start!27818 res!148510) b!286361))

(assert (= (and b!286361 res!148515) b!286362))

(assert (= (and b!286362 res!148513) b!286364))

(assert (= (and b!286364 res!148511) b!286360))

(assert (= (and b!286360 res!148512) b!286363))

(assert (= (and b!286363 res!148514) b!286359))

(declare-fun m!301053 () Bool)

(assert (=> b!286363 m!301053))

(declare-fun m!301055 () Bool)

(assert (=> b!286360 m!301055))

(declare-fun m!301057 () Bool)

(assert (=> b!286364 m!301057))

(declare-fun m!301059 () Bool)

(assert (=> b!286362 m!301059))

(declare-fun m!301061 () Bool)

(assert (=> start!27818 m!301061))

(declare-fun m!301063 () Bool)

(assert (=> start!27818 m!301063))

(check-sat (not b!286364) (not b!286363) (not start!27818) (not b!286362) (not b!286360))
(check-sat)
(get-model)

(declare-fun b!286431 () Bool)

(declare-fun c!46498 () Bool)

(declare-fun lt!141092 () (_ BitVec 64))

(assert (=> b!286431 (= c!46498 (= lt!141092 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!181490 () SeekEntryResult!1953)

(declare-fun e!181489 () SeekEntryResult!1953)

(assert (=> b!286431 (= e!181490 e!181489)))

(declare-fun b!286432 () Bool)

(declare-fun lt!141093 () SeekEntryResult!1953)

(assert (=> b!286432 (= e!181490 (Found!1953 (index!9984 lt!141093)))))

(declare-fun d!65955 () Bool)

(declare-fun lt!141094 () SeekEntryResult!1953)

(get-info :version)

(assert (=> d!65955 (and (or ((_ is Undefined!1953) lt!141094) (not ((_ is Found!1953) lt!141094)) (and (bvsge (index!9983 lt!141094) #b00000000000000000000000000000000) (bvslt (index!9983 lt!141094) (size!7156 a!3312)))) (or ((_ is Undefined!1953) lt!141094) ((_ is Found!1953) lt!141094) (not ((_ is MissingZero!1953) lt!141094)) (and (bvsge (index!9982 lt!141094) #b00000000000000000000000000000000) (bvslt (index!9982 lt!141094) (size!7156 a!3312)))) (or ((_ is Undefined!1953) lt!141094) ((_ is Found!1953) lt!141094) ((_ is MissingZero!1953) lt!141094) (not ((_ is MissingVacant!1953) lt!141094)) (and (bvsge (index!9985 lt!141094) #b00000000000000000000000000000000) (bvslt (index!9985 lt!141094) (size!7156 a!3312)))) (or ((_ is Undefined!1953) lt!141094) (ite ((_ is Found!1953) lt!141094) (= (select (arr!6804 a!3312) (index!9983 lt!141094)) k0!2524) (ite ((_ is MissingZero!1953) lt!141094) (= (select (arr!6804 a!3312) (index!9982 lt!141094)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1953) lt!141094) (= (select (arr!6804 a!3312) (index!9985 lt!141094)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!181488 () SeekEntryResult!1953)

(assert (=> d!65955 (= lt!141094 e!181488)))

(declare-fun c!46500 () Bool)

(assert (=> d!65955 (= c!46500 (and ((_ is Intermediate!1953) lt!141093) (undefined!2765 lt!141093)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14339 (_ BitVec 32)) SeekEntryResult!1953)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!65955 (= lt!141093 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2524 mask!3809) k0!2524 a!3312 mask!3809))))

(assert (=> d!65955 (validMask!0 mask!3809)))

(assert (=> d!65955 (= (seekEntryOrOpen!0 k0!2524 a!3312 mask!3809) lt!141094)))

(declare-fun b!286433 () Bool)

(assert (=> b!286433 (= e!181489 (MissingZero!1953 (index!9984 lt!141093)))))

(declare-fun b!286434 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!14339 (_ BitVec 32)) SeekEntryResult!1953)

(assert (=> b!286434 (= e!181489 (seekKeyOrZeroReturnVacant!0 (x!28201 lt!141093) (index!9984 lt!141093) (index!9984 lt!141093) k0!2524 a!3312 mask!3809))))

(declare-fun b!286435 () Bool)

(assert (=> b!286435 (= e!181488 Undefined!1953)))

(declare-fun b!286436 () Bool)

(assert (=> b!286436 (= e!181488 e!181490)))

(assert (=> b!286436 (= lt!141092 (select (arr!6804 a!3312) (index!9984 lt!141093)))))

(declare-fun c!46499 () Bool)

(assert (=> b!286436 (= c!46499 (= lt!141092 k0!2524))))

(assert (= (and d!65955 c!46500) b!286435))

(assert (= (and d!65955 (not c!46500)) b!286436))

(assert (= (and b!286436 c!46499) b!286432))

(assert (= (and b!286436 (not c!46499)) b!286431))

(assert (= (and b!286431 c!46498) b!286433))

(assert (= (and b!286431 (not c!46498)) b!286434))

(declare-fun m!301105 () Bool)

(assert (=> d!65955 m!301105))

(declare-fun m!301107 () Bool)

(assert (=> d!65955 m!301107))

(declare-fun m!301109 () Bool)

(assert (=> d!65955 m!301109))

(declare-fun m!301111 () Bool)

(assert (=> d!65955 m!301111))

(assert (=> d!65955 m!301109))

(declare-fun m!301113 () Bool)

(assert (=> d!65955 m!301113))

(assert (=> d!65955 m!301061))

(declare-fun m!301115 () Bool)

(assert (=> b!286434 m!301115))

(declare-fun m!301117 () Bool)

(assert (=> b!286436 m!301117))

(assert (=> b!286360 d!65955))

(declare-fun d!65971 () Bool)

(assert (=> d!65971 (= (validMask!0 mask!3809) (and (or (= mask!3809 #b00000000000000000000000000000111) (= mask!3809 #b00000000000000000000000000001111) (= mask!3809 #b00000000000000000000000000011111) (= mask!3809 #b00000000000000000000000000111111) (= mask!3809 #b00000000000000000000000001111111) (= mask!3809 #b00000000000000000000000011111111) (= mask!3809 #b00000000000000000000000111111111) (= mask!3809 #b00000000000000000000001111111111) (= mask!3809 #b00000000000000000000011111111111) (= mask!3809 #b00000000000000000000111111111111) (= mask!3809 #b00000000000000000001111111111111) (= mask!3809 #b00000000000000000011111111111111) (= mask!3809 #b00000000000000000111111111111111) (= mask!3809 #b00000000000000001111111111111111) (= mask!3809 #b00000000000000011111111111111111) (= mask!3809 #b00000000000000111111111111111111) (= mask!3809 #b00000000000001111111111111111111) (= mask!3809 #b00000000000011111111111111111111) (= mask!3809 #b00000000000111111111111111111111) (= mask!3809 #b00000000001111111111111111111111) (= mask!3809 #b00000000011111111111111111111111) (= mask!3809 #b00000000111111111111111111111111) (= mask!3809 #b00000001111111111111111111111111) (= mask!3809 #b00000011111111111111111111111111) (= mask!3809 #b00000111111111111111111111111111) (= mask!3809 #b00001111111111111111111111111111) (= mask!3809 #b00011111111111111111111111111111) (= mask!3809 #b00111111111111111111111111111111)) (bvsle mask!3809 #b00111111111111111111111111111111)))))

(assert (=> start!27818 d!65971))

(declare-fun d!65975 () Bool)

(assert (=> d!65975 (= (array_inv!4767 a!3312) (bvsge (size!7156 a!3312) #b00000000000000000000000000000000))))

(assert (=> start!27818 d!65975))

(declare-fun d!65977 () Bool)

(declare-fun res!148556 () Bool)

(declare-fun e!181513 () Bool)

(assert (=> d!65977 (=> res!148556 e!181513)))

(assert (=> d!65977 (= res!148556 (= (select (arr!6804 a!3312) #b00000000000000000000000000000000) k0!2524))))

(assert (=> d!65977 (= (arrayContainsKey!0 a!3312 k0!2524 #b00000000000000000000000000000000) e!181513)))

(declare-fun b!286471 () Bool)

(declare-fun e!181514 () Bool)

(assert (=> b!286471 (= e!181513 e!181514)))

(declare-fun res!148557 () Bool)

(assert (=> b!286471 (=> (not res!148557) (not e!181514))))

(assert (=> b!286471 (= res!148557 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!7156 a!3312)))))

(declare-fun b!286472 () Bool)

(assert (=> b!286472 (= e!181514 (arrayContainsKey!0 a!3312 k0!2524 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!65977 (not res!148556)) b!286471))

(assert (= (and b!286471 res!148557) b!286472))

(declare-fun m!301143 () Bool)

(assert (=> d!65977 m!301143))

(declare-fun m!301147 () Bool)

(assert (=> b!286472 m!301147))

(assert (=> b!286364 d!65977))

(declare-fun b!286487 () Bool)

(declare-fun e!181527 () Bool)

(declare-fun call!25597 () Bool)

(assert (=> b!286487 (= e!181527 call!25597)))

(declare-fun b!286488 () Bool)

(declare-fun e!181528 () Bool)

(assert (=> b!286488 (= e!181528 e!181527)))

(declare-fun lt!141120 () (_ BitVec 64))

(assert (=> b!286488 (= lt!141120 (select (arr!6804 a!3312) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!9054 0))(
  ( (Unit!9055) )
))
(declare-fun lt!141121 () Unit!9054)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!14339 (_ BitVec 64) (_ BitVec 32)) Unit!9054)

(assert (=> b!286488 (= lt!141121 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3312 lt!141120 #b00000000000000000000000000000000))))

(assert (=> b!286488 (arrayContainsKey!0 a!3312 lt!141120 #b00000000000000000000000000000000)))

(declare-fun lt!141119 () Unit!9054)

(assert (=> b!286488 (= lt!141119 lt!141121)))

(declare-fun res!148568 () Bool)

(assert (=> b!286488 (= res!148568 (= (seekEntryOrOpen!0 (select (arr!6804 a!3312) #b00000000000000000000000000000000) a!3312 mask!3809) (Found!1953 #b00000000000000000000000000000000)))))

(assert (=> b!286488 (=> (not res!148568) (not e!181527))))

(declare-fun bm!25594 () Bool)

(assert (=> bm!25594 (= call!25597 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3312 mask!3809))))

(declare-fun d!65985 () Bool)

(declare-fun res!148569 () Bool)

(declare-fun e!181529 () Bool)

(assert (=> d!65985 (=> res!148569 e!181529)))

(assert (=> d!65985 (= res!148569 (bvsge #b00000000000000000000000000000000 (size!7156 a!3312)))))

(assert (=> d!65985 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3312 mask!3809) e!181529)))

(declare-fun b!286489 () Bool)

(assert (=> b!286489 (= e!181528 call!25597)))

(declare-fun b!286490 () Bool)

(assert (=> b!286490 (= e!181529 e!181528)))

(declare-fun c!46515 () Bool)

(assert (=> b!286490 (= c!46515 (validKeyInArray!0 (select (arr!6804 a!3312) #b00000000000000000000000000000000)))))

(assert (= (and d!65985 (not res!148569)) b!286490))

(assert (= (and b!286490 c!46515) b!286488))

(assert (= (and b!286490 (not c!46515)) b!286489))

(assert (= (and b!286488 res!148568) b!286487))

(assert (= (or b!286487 b!286489) bm!25594))

(assert (=> b!286488 m!301143))

(declare-fun m!301151 () Bool)

(assert (=> b!286488 m!301151))

(declare-fun m!301153 () Bool)

(assert (=> b!286488 m!301153))

(assert (=> b!286488 m!301143))

(declare-fun m!301155 () Bool)

(assert (=> b!286488 m!301155))

(declare-fun m!301157 () Bool)

(assert (=> bm!25594 m!301157))

(assert (=> b!286490 m!301143))

(assert (=> b!286490 m!301143))

(declare-fun m!301159 () Bool)

(assert (=> b!286490 m!301159))

(assert (=> b!286363 d!65985))

(declare-fun d!65989 () Bool)

(assert (=> d!65989 (= (validKeyInArray!0 k0!2524) (and (not (= k0!2524 