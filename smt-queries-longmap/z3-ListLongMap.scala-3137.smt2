; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!44142 () Bool)

(assert start!44142)

(declare-fun b!485976 () Bool)

(declare-fun res!289650 () Bool)

(declare-fun e!286038 () Bool)

(assert (=> b!485976 (=> (not res!289650) (not e!286038))))

(declare-datatypes ((array!31487 0))(
  ( (array!31488 (arr!15140 (Array (_ BitVec 32) (_ BitVec 64))) (size!15505 (_ BitVec 32))) )
))
(declare-fun a!3235 () array!31487)

(declare-fun mask!3524 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31487 (_ BitVec 32)) Bool)

(assert (=> b!485976 (= res!289650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524))))

(declare-fun b!485977 () Bool)

(declare-fun res!289649 () Bool)

(declare-fun e!286036 () Bool)

(assert (=> b!485977 (=> (not res!289649) (not e!286036))))

(declare-fun i!1204 () (_ BitVec 32))

(declare-fun j!176 () (_ BitVec 32))

(assert (=> b!485977 (= res!289649 (and (= (size!15505 a!3235) (bvadd #b00000000000000000000000000000001 mask!3524)) (bvsge i!1204 #b00000000000000000000000000000000) (bvslt i!1204 (size!15505 a!3235)) (bvsge j!176 #b00000000000000000000000000000000) (bvslt j!176 (size!15505 a!3235)) (not (= i!1204 j!176))))))

(declare-fun b!485978 () Bool)

(declare-fun res!289651 () Bool)

(assert (=> b!485978 (=> (not res!289651) (not e!286036))))

(declare-fun k0!2280 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31487 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!485978 (= res!289651 (not (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000)))))

(declare-fun b!485979 () Bool)

(assert (=> b!485979 (= e!286036 e!286038)))

(declare-fun res!289655 () Bool)

(assert (=> b!485979 (=> (not res!289655) (not e!286038))))

(declare-datatypes ((SeekEntryResult!3604 0))(
  ( (MissingZero!3604 (index!16595 (_ BitVec 32))) (Found!3604 (index!16596 (_ BitVec 32))) (Intermediate!3604 (undefined!4416 Bool) (index!16597 (_ BitVec 32)) (x!45739 (_ BitVec 32))) (Undefined!3604) (MissingVacant!3604 (index!16598 (_ BitVec 32))) )
))
(declare-fun lt!219451 () SeekEntryResult!3604)

(assert (=> b!485979 (= res!289655 (or (= lt!219451 (MissingZero!3604 i!1204)) (= lt!219451 (MissingVacant!3604 i!1204))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!31487 (_ BitVec 32)) SeekEntryResult!3604)

(assert (=> b!485979 (= lt!219451 (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524))))

(declare-fun b!485980 () Bool)

(declare-fun res!289648 () Bool)

(assert (=> b!485980 (=> (not res!289648) (not e!286036))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!485980 (= res!289648 (validKeyInArray!0 (select (arr!15140 a!3235) j!176)))))

(declare-fun b!485981 () Bool)

(declare-datatypes ((List!9337 0))(
  ( (Nil!9334) (Cons!9333 (h!10189 (_ BitVec 64)) (t!15556 List!9337)) )
))
(declare-fun noDuplicate!212 (List!9337) Bool)

(assert (=> b!485981 (= e!286038 (not (noDuplicate!212 Nil!9334)))))

(declare-fun b!485982 () Bool)

(declare-fun res!289654 () Bool)

(assert (=> b!485982 (=> (not res!289654) (not e!286038))))

(assert (=> b!485982 (= res!289654 (and (bvsle #b00000000000000000000000000000000 (size!15505 a!3235)) (bvslt (size!15505 a!3235) #b01111111111111111111111111111111)))))

(declare-fun res!289652 () Bool)

(assert (=> start!44142 (=> (not res!289652) (not e!286036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!44142 (= res!289652 (validMask!0 mask!3524))))

(assert (=> start!44142 e!286036))

(assert (=> start!44142 true))

(declare-fun array_inv!11023 (array!31487) Bool)

(assert (=> start!44142 (array_inv!11023 a!3235)))

(declare-fun b!485983 () Bool)

(declare-fun res!289653 () Bool)

(assert (=> b!485983 (=> (not res!289653) (not e!286036))))

(assert (=> b!485983 (= res!289653 (validKeyInArray!0 k0!2280))))

(assert (= (and start!44142 res!289652) b!485977))

(assert (= (and b!485977 res!289649) b!485980))

(assert (= (and b!485980 res!289648) b!485983))

(assert (= (and b!485983 res!289653) b!485978))

(assert (= (and b!485978 res!289651) b!485979))

(assert (= (and b!485979 res!289655) b!485976))

(assert (= (and b!485976 res!289650) b!485982))

(assert (= (and b!485982 res!289654) b!485981))

(declare-fun m!465513 () Bool)

(assert (=> b!485979 m!465513))

(declare-fun m!465515 () Bool)

(assert (=> start!44142 m!465515))

(declare-fun m!465517 () Bool)

(assert (=> start!44142 m!465517))

(declare-fun m!465519 () Bool)

(assert (=> b!485980 m!465519))

(assert (=> b!485980 m!465519))

(declare-fun m!465521 () Bool)

(assert (=> b!485980 m!465521))

(declare-fun m!465523 () Bool)

(assert (=> b!485978 m!465523))

(declare-fun m!465525 () Bool)

(assert (=> b!485976 m!465525))

(declare-fun m!465527 () Bool)

(assert (=> b!485983 m!465527))

(declare-fun m!465529 () Bool)

(assert (=> b!485981 m!465529))

(check-sat (not start!44142) (not b!485980) (not b!485978) (not b!485979) (not b!485983) (not b!485981) (not b!485976))
(check-sat)
(get-model)

(declare-fun d!77299 () Bool)

(assert (=> d!77299 (= (validKeyInArray!0 (select (arr!15140 a!3235) j!176)) (and (not (= (select (arr!15140 a!3235) j!176) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!15140 a!3235) j!176) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485980 d!77299))

(declare-fun d!77301 () Bool)

(assert (=> d!77301 (= (validMask!0 mask!3524) (and (or (= mask!3524 #b00000000000000000000000000000111) (= mask!3524 #b00000000000000000000000000001111) (= mask!3524 #b00000000000000000000000000011111) (= mask!3524 #b00000000000000000000000000111111) (= mask!3524 #b00000000000000000000000001111111) (= mask!3524 #b00000000000000000000000011111111) (= mask!3524 #b00000000000000000000000111111111) (= mask!3524 #b00000000000000000000001111111111) (= mask!3524 #b00000000000000000000011111111111) (= mask!3524 #b00000000000000000000111111111111) (= mask!3524 #b00000000000000000001111111111111) (= mask!3524 #b00000000000000000011111111111111) (= mask!3524 #b00000000000000000111111111111111) (= mask!3524 #b00000000000000001111111111111111) (= mask!3524 #b00000000000000011111111111111111) (= mask!3524 #b00000000000000111111111111111111) (= mask!3524 #b00000000000001111111111111111111) (= mask!3524 #b00000000000011111111111111111111) (= mask!3524 #b00000000000111111111111111111111) (= mask!3524 #b00000000001111111111111111111111) (= mask!3524 #b00000000011111111111111111111111) (= mask!3524 #b00000000111111111111111111111111) (= mask!3524 #b00000001111111111111111111111111) (= mask!3524 #b00000011111111111111111111111111) (= mask!3524 #b00000111111111111111111111111111) (= mask!3524 #b00001111111111111111111111111111) (= mask!3524 #b00011111111111111111111111111111) (= mask!3524 #b00111111111111111111111111111111)) (bvsle mask!3524 #b00111111111111111111111111111111)))))

(assert (=> start!44142 d!77301))

(declare-fun d!77307 () Bool)

(assert (=> d!77307 (= (array_inv!11023 a!3235) (bvsge (size!15505 a!3235) #b00000000000000000000000000000000))))

(assert (=> start!44142 d!77307))

(declare-fun d!77309 () Bool)

(declare-fun res!289718 () Bool)

(declare-fun e!286075 () Bool)

(assert (=> d!77309 (=> res!289718 e!286075)))

(assert (=> d!77309 (= res!289718 (bvsge #b00000000000000000000000000000000 (size!15505 a!3235)))))

(assert (=> d!77309 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3235 mask!3524) e!286075)))

(declare-fun b!486054 () Bool)

(declare-fun e!286077 () Bool)

(assert (=> b!486054 (= e!286075 e!286077)))

(declare-fun c!58436 () Bool)

(assert (=> b!486054 (= c!58436 (validKeyInArray!0 (select (arr!15140 a!3235) #b00000000000000000000000000000000)))))

(declare-fun b!486055 () Bool)

(declare-fun call!31245 () Bool)

(assert (=> b!486055 (= e!286077 call!31245)))

(declare-fun bm!31242 () Bool)

(assert (=> bm!31242 (= call!31245 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3235 mask!3524))))

(declare-fun b!486056 () Bool)

(declare-fun e!286076 () Bool)

(assert (=> b!486056 (= e!286076 call!31245)))

(declare-fun b!486057 () Bool)

(assert (=> b!486057 (= e!286077 e!286076)))

(declare-fun lt!219471 () (_ BitVec 64))

(assert (=> b!486057 (= lt!219471 (select (arr!15140 a!3235) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!14174 0))(
  ( (Unit!14175) )
))
(declare-fun lt!219470 () Unit!14174)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!31487 (_ BitVec 64) (_ BitVec 32)) Unit!14174)

(assert (=> b!486057 (= lt!219470 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3235 lt!219471 #b00000000000000000000000000000000))))

(assert (=> b!486057 (arrayContainsKey!0 a!3235 lt!219471 #b00000000000000000000000000000000)))

(declare-fun lt!219472 () Unit!14174)

(assert (=> b!486057 (= lt!219472 lt!219470)))

(declare-fun res!289719 () Bool)

(assert (=> b!486057 (= res!289719 (= (seekEntryOrOpen!0 (select (arr!15140 a!3235) #b00000000000000000000000000000000) a!3235 mask!3524) (Found!3604 #b00000000000000000000000000000000)))))

(assert (=> b!486057 (=> (not res!289719) (not e!286076))))

(assert (= (and d!77309 (not res!289718)) b!486054))

(assert (= (and b!486054 c!58436) b!486057))

(assert (= (and b!486054 (not c!58436)) b!486055))

(assert (= (and b!486057 res!289719) b!486056))

(assert (= (or b!486056 b!486055) bm!31242))

(declare-fun m!465571 () Bool)

(assert (=> b!486054 m!465571))

(assert (=> b!486054 m!465571))

(declare-fun m!465573 () Bool)

(assert (=> b!486054 m!465573))

(declare-fun m!465575 () Bool)

(assert (=> bm!31242 m!465575))

(assert (=> b!486057 m!465571))

(declare-fun m!465577 () Bool)

(assert (=> b!486057 m!465577))

(declare-fun m!465579 () Bool)

(assert (=> b!486057 m!465579))

(assert (=> b!486057 m!465571))

(declare-fun m!465581 () Bool)

(assert (=> b!486057 m!465581))

(assert (=> b!485976 d!77309))

(declare-fun d!77313 () Bool)

(declare-fun res!289726 () Bool)

(declare-fun e!286085 () Bool)

(assert (=> d!77313 (=> res!289726 e!286085)))

(get-info :version)

(assert (=> d!77313 (= res!289726 ((_ is Nil!9334) Nil!9334))))

(assert (=> d!77313 (= (noDuplicate!212 Nil!9334) e!286085)))

(declare-fun b!486066 () Bool)

(declare-fun e!286086 () Bool)

(assert (=> b!486066 (= e!286085 e!286086)))

(declare-fun res!289727 () Bool)

(assert (=> b!486066 (=> (not res!289727) (not e!286086))))

(declare-fun contains!2678 (List!9337 (_ BitVec 64)) Bool)

(assert (=> b!486066 (= res!289727 (not (contains!2678 (t!15556 Nil!9334) (h!10189 Nil!9334))))))

(declare-fun b!486067 () Bool)

(assert (=> b!486067 (= e!286086 (noDuplicate!212 (t!15556 Nil!9334)))))

(assert (= (and d!77313 (not res!289726)) b!486066))

(assert (= (and b!486066 res!289727) b!486067))

(declare-fun m!465593 () Bool)

(assert (=> b!486066 m!465593))

(declare-fun m!465595 () Bool)

(assert (=> b!486067 m!465595))

(assert (=> b!485981 d!77313))

(declare-fun d!77319 () Bool)

(assert (=> d!77319 (= (validKeyInArray!0 k0!2280) (and (not (= k0!2280 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2280 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!485983 d!77319))

(declare-fun b!486128 () Bool)

(declare-fun lt!219511 () SeekEntryResult!3604)

(declare-fun e!286121 () SeekEntryResult!3604)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31487 (_ BitVec 32)) SeekEntryResult!3604)

(assert (=> b!486128 (= e!286121 (seekKeyOrZeroReturnVacant!0 (x!45739 lt!219511) (index!16597 lt!219511) (index!16597 lt!219511) k0!2280 a!3235 mask!3524))))

(declare-fun d!77321 () Bool)

(declare-fun lt!219509 () SeekEntryResult!3604)

(assert (=> d!77321 (and (or ((_ is Undefined!3604) lt!219509) (not ((_ is Found!3604) lt!219509)) (and (bvsge (index!16596 lt!219509) #b00000000000000000000000000000000) (bvslt (index!16596 lt!219509) (size!15505 a!3235)))) (or ((_ is Undefined!3604) lt!219509) ((_ is Found!3604) lt!219509) (not ((_ is MissingZero!3604) lt!219509)) (and (bvsge (index!16595 lt!219509) #b00000000000000000000000000000000) (bvslt (index!16595 lt!219509) (size!15505 a!3235)))) (or ((_ is Undefined!3604) lt!219509) ((_ is Found!3604) lt!219509) ((_ is MissingZero!3604) lt!219509) (not ((_ is MissingVacant!3604) lt!219509)) (and (bvsge (index!16598 lt!219509) #b00000000000000000000000000000000) (bvslt (index!16598 lt!219509) (size!15505 a!3235)))) (or ((_ is Undefined!3604) lt!219509) (ite ((_ is Found!3604) lt!219509) (= (select (arr!15140 a!3235) (index!16596 lt!219509)) k0!2280) (ite ((_ is MissingZero!3604) lt!219509) (= (select (arr!15140 a!3235) (index!16595 lt!219509)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3604) lt!219509) (= (select (arr!15140 a!3235) (index!16598 lt!219509)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!286122 () SeekEntryResult!3604)

(assert (=> d!77321 (= lt!219509 e!286122)))

(declare-fun c!58465 () Bool)

(assert (=> d!77321 (= c!58465 (and ((_ is Intermediate!3604) lt!219511) (undefined!4416 lt!219511)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!31487 (_ BitVec 32)) SeekEntryResult!3604)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!77321 (= lt!219511 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2280 mask!3524) k0!2280 a!3235 mask!3524))))

(assert (=> d!77321 (validMask!0 mask!3524)))

(assert (=> d!77321 (= (seekEntryOrOpen!0 k0!2280 a!3235 mask!3524) lt!219509)))

(declare-fun b!486129 () Bool)

(declare-fun e!286120 () SeekEntryResult!3604)

(assert (=> b!486129 (= e!286120 (Found!3604 (index!16597 lt!219511)))))

(declare-fun b!486130 () Bool)

(declare-fun c!58467 () Bool)

(declare-fun lt!219510 () (_ BitVec 64))

(assert (=> b!486130 (= c!58467 (= lt!219510 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!486130 (= e!286120 e!286121)))

(declare-fun b!486131 () Bool)

(assert (=> b!486131 (= e!286121 (MissingZero!3604 (index!16597 lt!219511)))))

(declare-fun b!486132 () Bool)

(assert (=> b!486132 (= e!286122 e!286120)))

(assert (=> b!486132 (= lt!219510 (select (arr!15140 a!3235) (index!16597 lt!219511)))))

(declare-fun c!58466 () Bool)

(assert (=> b!486132 (= c!58466 (= lt!219510 k0!2280))))

(declare-fun b!486133 () Bool)

(assert (=> b!486133 (= e!286122 Undefined!3604)))

(assert (= (and d!77321 c!58465) b!486133))

(assert (= (and d!77321 (not c!58465)) b!486132))

(assert (= (and b!486132 c!58466) b!486129))

(assert (= (and b!486132 (not c!58466)) b!486130))

(assert (= (and b!486130 c!58467) b!486131))

(assert (= (and b!486130 (not c!58467)) b!486128))

(declare-fun m!465637 () Bool)

(assert (=> b!486128 m!465637))

(assert (=> d!77321 m!465515))

(declare-fun m!465639 () Bool)

(assert (=> d!77321 m!465639))

(declare-fun m!465641 () Bool)

(assert (=> d!77321 m!465641))

(assert (=> d!77321 m!465639))

(declare-fun m!465643 () Bool)

(assert (=> d!77321 m!465643))

(declare-fun m!465645 () Bool)

(assert (=> d!77321 m!465645))

(declare-fun m!465647 () Bool)

(assert (=> d!77321 m!465647))

(declare-fun m!465649 () Bool)

(assert (=> b!486132 m!465649))

(assert (=> b!485979 d!77321))

(declare-fun d!77329 () Bool)

(declare-fun res!289744 () Bool)

(declare-fun e!286133 () Bool)

(assert (=> d!77329 (=> res!289744 e!286133)))

(assert (=> d!77329 (= res!289744 (= (select (arr!15140 a!3235) #b00000000000000000000000000000000) k0!2280))))

(assert (=> d!77329 (= (arrayContainsKey!0 a!3235 k0!2280 #b00000000000000000000000000000000) e!286133)))

(declare-fun b!486144 () Bool)

(declare-fun e!286134 () Bool)

(assert (=> b!486144 (= e!286133 e!286134)))

(declare-fun res!289745 () Bool)

(assert (=> b!486144 (=> (not res!289745) (not e!286134))))

(assert (=> b!486144 (= res!289745 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!15505 a!3235)))))

(declare-fun b!486145 () Bool)

(assert (=> b!486145 (= e!286134 (arrayContainsKey!0 a!3235 k0!2280 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!77329 (not res!289744)) b!486144))

(assert (= (and b!486144 res!289745) b!486145))

(assert (=> d!77329 m!465571))

(declare-fun m!465655 () Bool)

(assert (=> b!486145 m!465655))

(assert (=> b!485978 d!77329))

(check-sat (not b!486054) (not b!486067) (not bm!31242) (not b!486066) (not b!486128) (not b!486057) (not b!486145) (not d!77321))
(check-sat)
