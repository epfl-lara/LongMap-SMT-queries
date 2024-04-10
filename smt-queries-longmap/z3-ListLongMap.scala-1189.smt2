; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!25554 () Bool)

(assert start!25554)

(declare-fun b!265410 () Bool)

(declare-fun e!171869 () Bool)

(declare-fun e!171871 () Bool)

(assert (=> b!265410 (= e!171869 e!171871)))

(declare-fun res!129782 () Bool)

(assert (=> b!265410 (=> res!129782 e!171871)))

(declare-datatypes ((List!3859 0))(
  ( (Nil!3856) (Cons!3855 (h!4522 (_ BitVec 64)) (t!8941 List!3859)) )
))
(declare-fun contains!1920 (List!3859 (_ BitVec 64)) Bool)

(assert (=> b!265410 (= res!129782 (contains!1920 Nil!3856 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265411 () Bool)

(declare-fun res!129786 () Bool)

(assert (=> b!265411 (=> (not res!129786) (not e!171869))))

(declare-fun noDuplicate!108 (List!3859) Bool)

(assert (=> b!265411 (= res!129786 (noDuplicate!108 Nil!3856))))

(declare-fun b!265413 () Bool)

(declare-fun e!171870 () Bool)

(assert (=> b!265413 (= e!171870 e!171869)))

(declare-fun res!129784 () Bool)

(assert (=> b!265413 (=> (not res!129784) (not e!171869))))

(declare-datatypes ((SeekEntryResult!1236 0))(
  ( (MissingZero!1236 (index!7114 (_ BitVec 32))) (Found!1236 (index!7115 (_ BitVec 32))) (Intermediate!1236 (undefined!2048 Bool) (index!7116 (_ BitVec 32)) (x!25433 (_ BitVec 32))) (Undefined!1236) (MissingVacant!1236 (index!7117 (_ BitVec 32))) )
))
(declare-fun lt!134089 () SeekEntryResult!1236)

(declare-fun i!1355 () (_ BitVec 32))

(assert (=> b!265413 (= res!129784 (or (= lt!134089 (MissingZero!1236 i!1355)) (= lt!134089 (MissingVacant!1236 i!1355))))))

(declare-fun k0!2698 () (_ BitVec 64))

(declare-datatypes ((array!12778 0))(
  ( (array!12779 (arr!6045 (Array (_ BitVec 32) (_ BitVec 64))) (size!6397 (_ BitVec 32))) )
))
(declare-fun a!3436 () array!12778)

(declare-fun mask!4002 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12778 (_ BitVec 32)) SeekEntryResult!1236)

(assert (=> b!265413 (= lt!134089 (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002))))

(declare-fun b!265414 () Bool)

(declare-fun res!129778 () Bool)

(assert (=> b!265414 (=> (not res!129778) (not e!171870))))

(assert (=> b!265414 (= res!129778 (and (= (size!6397 a!3436) (bvadd #b00000000000000000000000000000001 mask!4002)) (bvsge i!1355 #b00000000000000000000000000000000) (bvslt i!1355 (size!6397 a!3436))))))

(declare-fun b!265415 () Bool)

(assert (=> b!265415 (= e!171871 (contains!1920 Nil!3856 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265416 () Bool)

(declare-fun res!129781 () Bool)

(assert (=> b!265416 (=> (not res!129781) (not e!171869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12778 (_ BitVec 32)) Bool)

(assert (=> b!265416 (= res!129781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002))))

(declare-fun b!265412 () Bool)

(declare-fun res!129785 () Bool)

(assert (=> b!265412 (=> (not res!129785) (not e!171870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!265412 (= res!129785 (validKeyInArray!0 k0!2698))))

(declare-fun res!129779 () Bool)

(assert (=> start!25554 (=> (not res!129779) (not e!171870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!25554 (= res!129779 (validMask!0 mask!4002))))

(assert (=> start!25554 e!171870))

(assert (=> start!25554 true))

(declare-fun array_inv!4008 (array!12778) Bool)

(assert (=> start!25554 (array_inv!4008 a!3436)))

(declare-fun b!265417 () Bool)

(declare-fun res!129780 () Bool)

(assert (=> b!265417 (=> (not res!129780) (not e!171870))))

(declare-fun arrayContainsKey!0 (array!12778 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!265417 (= res!129780 (not (arrayContainsKey!0 a!3436 k0!2698 #b00000000000000000000000000000000)))))

(declare-fun b!265418 () Bool)

(declare-fun res!129783 () Bool)

(assert (=> b!265418 (=> (not res!129783) (not e!171869))))

(assert (=> b!265418 (= res!129783 (and (bvsle #b00000000000000000000000000000000 (size!6397 a!3436)) (bvslt (size!6397 a!3436) #b01111111111111111111111111111111)))))

(assert (= (and start!25554 res!129779) b!265414))

(assert (= (and b!265414 res!129778) b!265412))

(assert (= (and b!265412 res!129785) b!265417))

(assert (= (and b!265417 res!129780) b!265413))

(assert (= (and b!265413 res!129784) b!265416))

(assert (= (and b!265416 res!129781) b!265418))

(assert (= (and b!265418 res!129783) b!265411))

(assert (= (and b!265411 res!129786) b!265410))

(assert (= (and b!265410 (not res!129782)) b!265415))

(declare-fun m!282213 () Bool)

(assert (=> b!265410 m!282213))

(declare-fun m!282215 () Bool)

(assert (=> b!265416 m!282215))

(declare-fun m!282217 () Bool)

(assert (=> b!265411 m!282217))

(declare-fun m!282219 () Bool)

(assert (=> b!265412 m!282219))

(declare-fun m!282221 () Bool)

(assert (=> b!265413 m!282221))

(declare-fun m!282223 () Bool)

(assert (=> b!265417 m!282223))

(declare-fun m!282225 () Bool)

(assert (=> b!265415 m!282225))

(declare-fun m!282227 () Bool)

(assert (=> start!25554 m!282227))

(declare-fun m!282229 () Bool)

(assert (=> start!25554 m!282229))

(check-sat (not start!25554) (not b!265415) (not b!265416) (not b!265413) (not b!265417) (not b!265410) (not b!265412) (not b!265411))
(check-sat)
(get-model)

(declare-fun d!64195 () Bool)

(assert (=> d!64195 (= (validMask!0 mask!4002) (and (or (= mask!4002 #b00000000000000000000000000000111) (= mask!4002 #b00000000000000000000000000001111) (= mask!4002 #b00000000000000000000000000011111) (= mask!4002 #b00000000000000000000000000111111) (= mask!4002 #b00000000000000000000000001111111) (= mask!4002 #b00000000000000000000000011111111) (= mask!4002 #b00000000000000000000000111111111) (= mask!4002 #b00000000000000000000001111111111) (= mask!4002 #b00000000000000000000011111111111) (= mask!4002 #b00000000000000000000111111111111) (= mask!4002 #b00000000000000000001111111111111) (= mask!4002 #b00000000000000000011111111111111) (= mask!4002 #b00000000000000000111111111111111) (= mask!4002 #b00000000000000001111111111111111) (= mask!4002 #b00000000000000011111111111111111) (= mask!4002 #b00000000000000111111111111111111) (= mask!4002 #b00000000000001111111111111111111) (= mask!4002 #b00000000000011111111111111111111) (= mask!4002 #b00000000000111111111111111111111) (= mask!4002 #b00000000001111111111111111111111) (= mask!4002 #b00000000011111111111111111111111) (= mask!4002 #b00000000111111111111111111111111) (= mask!4002 #b00000001111111111111111111111111) (= mask!4002 #b00000011111111111111111111111111) (= mask!4002 #b00000111111111111111111111111111) (= mask!4002 #b00001111111111111111111111111111) (= mask!4002 #b00011111111111111111111111111111) (= mask!4002 #b00111111111111111111111111111111)) (bvsle mask!4002 #b00111111111111111111111111111111)))))

(assert (=> start!25554 d!64195))

(declare-fun d!64211 () Bool)

(assert (=> d!64211 (= (array_inv!4008 a!3436) (bvsge (size!6397 a!3436) #b00000000000000000000000000000000))))

(assert (=> start!25554 d!64211))

(declare-fun b!265550 () Bool)

(declare-fun e!171961 () SeekEntryResult!1236)

(declare-fun lt!134140 () SeekEntryResult!1236)

(assert (=> b!265550 (= e!171961 (MissingZero!1236 (index!7116 lt!134140)))))

(declare-fun b!265551 () Bool)

(declare-fun e!171960 () SeekEntryResult!1236)

(assert (=> b!265551 (= e!171960 (Found!1236 (index!7116 lt!134140)))))

(declare-fun b!265552 () Bool)

(declare-fun e!171959 () SeekEntryResult!1236)

(assert (=> b!265552 (= e!171959 Undefined!1236)))

(declare-fun b!265553 () Bool)

(assert (=> b!265553 (= e!171959 e!171960)))

(declare-fun lt!134139 () (_ BitVec 64))

(assert (=> b!265553 (= lt!134139 (select (arr!6045 a!3436) (index!7116 lt!134140)))))

(declare-fun c!45398 () Bool)

(assert (=> b!265553 (= c!45398 (= lt!134139 k0!2698))))

(declare-fun d!64213 () Bool)

(declare-fun lt!134141 () SeekEntryResult!1236)

(get-info :version)

(assert (=> d!64213 (and (or ((_ is Undefined!1236) lt!134141) (not ((_ is Found!1236) lt!134141)) (and (bvsge (index!7115 lt!134141) #b00000000000000000000000000000000) (bvslt (index!7115 lt!134141) (size!6397 a!3436)))) (or ((_ is Undefined!1236) lt!134141) ((_ is Found!1236) lt!134141) (not ((_ is MissingZero!1236) lt!134141)) (and (bvsge (index!7114 lt!134141) #b00000000000000000000000000000000) (bvslt (index!7114 lt!134141) (size!6397 a!3436)))) (or ((_ is Undefined!1236) lt!134141) ((_ is Found!1236) lt!134141) ((_ is MissingZero!1236) lt!134141) (not ((_ is MissingVacant!1236) lt!134141)) (and (bvsge (index!7117 lt!134141) #b00000000000000000000000000000000) (bvslt (index!7117 lt!134141) (size!6397 a!3436)))) (or ((_ is Undefined!1236) lt!134141) (ite ((_ is Found!1236) lt!134141) (= (select (arr!6045 a!3436) (index!7115 lt!134141)) k0!2698) (ite ((_ is MissingZero!1236) lt!134141) (= (select (arr!6045 a!3436) (index!7114 lt!134141)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1236) lt!134141) (= (select (arr!6045 a!3436) (index!7117 lt!134141)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!64213 (= lt!134141 e!171959)))

(declare-fun c!45399 () Bool)

(assert (=> d!64213 (= c!45399 (and ((_ is Intermediate!1236) lt!134140) (undefined!2048 lt!134140)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12778 (_ BitVec 32)) SeekEntryResult!1236)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!64213 (= lt!134140 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2698 mask!4002) k0!2698 a!3436 mask!4002))))

(assert (=> d!64213 (validMask!0 mask!4002)))

(assert (=> d!64213 (= (seekEntryOrOpen!0 k0!2698 a!3436 mask!4002) lt!134141)))

(declare-fun b!265554 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12778 (_ BitVec 32)) SeekEntryResult!1236)

(assert (=> b!265554 (= e!171961 (seekKeyOrZeroReturnVacant!0 (x!25433 lt!134140) (index!7116 lt!134140) (index!7116 lt!134140) k0!2698 a!3436 mask!4002))))

(declare-fun b!265555 () Bool)

(declare-fun c!45397 () Bool)

(assert (=> b!265555 (= c!45397 (= lt!134139 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!265555 (= e!171960 e!171961)))

(assert (= (and d!64213 c!45399) b!265552))

(assert (= (and d!64213 (not c!45399)) b!265553))

(assert (= (and b!265553 c!45398) b!265551))

(assert (= (and b!265553 (not c!45398)) b!265555))

(assert (= (and b!265555 c!45397) b!265550))

(assert (= (and b!265555 (not c!45397)) b!265554))

(declare-fun m!282323 () Bool)

(assert (=> b!265553 m!282323))

(declare-fun m!282325 () Bool)

(assert (=> d!64213 m!282325))

(declare-fun m!282327 () Bool)

(assert (=> d!64213 m!282327))

(declare-fun m!282329 () Bool)

(assert (=> d!64213 m!282329))

(assert (=> d!64213 m!282227))

(declare-fun m!282331 () Bool)

(assert (=> d!64213 m!282331))

(declare-fun m!282333 () Bool)

(assert (=> d!64213 m!282333))

(assert (=> d!64213 m!282325))

(declare-fun m!282335 () Bool)

(assert (=> b!265554 m!282335))

(assert (=> b!265413 d!64213))

(declare-fun b!265572 () Bool)

(declare-fun e!171978 () Bool)

(declare-fun call!25339 () Bool)

(assert (=> b!265572 (= e!171978 call!25339)))

(declare-fun d!64227 () Bool)

(declare-fun res!129870 () Bool)

(declare-fun e!171977 () Bool)

(assert (=> d!64227 (=> res!129870 e!171977)))

(assert (=> d!64227 (= res!129870 (bvsge #b00000000000000000000000000000000 (size!6397 a!3436)))))

(assert (=> d!64227 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3436 mask!4002) e!171977)))

(declare-fun bm!25336 () Bool)

(assert (=> bm!25336 (= call!25339 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3436 mask!4002))))

(declare-fun b!265573 () Bool)

(declare-fun e!171976 () Bool)

(assert (=> b!265573 (= e!171976 e!171978)))

(declare-fun lt!134153 () (_ BitVec 64))

(assert (=> b!265573 (= lt!134153 (select (arr!6045 a!3436) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!8267 0))(
  ( (Unit!8268) )
))
(declare-fun lt!134154 () Unit!8267)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!12778 (_ BitVec 64) (_ BitVec 32)) Unit!8267)

(assert (=> b!265573 (= lt!134154 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3436 lt!134153 #b00000000000000000000000000000000))))

(assert (=> b!265573 (arrayContainsKey!0 a!3436 lt!134153 #b00000000000000000000000000000000)))

(declare-fun lt!134152 () Unit!8267)

(assert (=> b!265573 (= lt!134152 lt!134154)))

(declare-fun res!129871 () Bool)

(assert (=> b!265573 (= res!129871 (= (seekEntryOrOpen!0 (select (arr!6045 a!3436) #b00000000000000000000000000000000) a!3436 mask!4002) (Found!1236 #b00000000000000000000000000000000)))))

(assert (=> b!265573 (=> (not res!129871) (not e!171978))))

(declare-fun b!265574 () Bool)

(assert (=> b!265574 (= e!171977 e!171976)))

(declare-fun c!45402 () Bool)

(assert (=> b!265574 (= c!45402 (validKeyInArray!0 (select (arr!6045 a!3436) #b00000000000000000000000000000000)))))

(declare-fun b!265575 () Bool)

(assert (=> b!265575 (= e!171976 call!25339)))

(assert (= (and d!64227 (not res!129870)) b!265574))

(assert (= (and b!265574 c!45402) b!265573))

(assert (= (and b!265574 (not c!45402)) b!265575))

(assert (= (and b!265573 res!129871) b!265572))

(assert (= (or b!265572 b!265575) bm!25336))

(declare-fun m!282347 () Bool)

(assert (=> bm!25336 m!282347))

(declare-fun m!282349 () Bool)

(assert (=> b!265573 m!282349))

(declare-fun m!282351 () Bool)

(assert (=> b!265573 m!282351))

(declare-fun m!282353 () Bool)

(assert (=> b!265573 m!282353))

(assert (=> b!265573 m!282349))

(declare-fun m!282355 () Bool)

(assert (=> b!265573 m!282355))

(assert (=> b!265574 m!282349))

(assert (=> b!265574 m!282349))

(declare-fun m!282357 () Bool)

(assert (=> b!265574 m!282357))

(assert (=> b!265416 d!64227))

(declare-fun d!64231 () Bool)

(declare-fun lt!134157 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!180 (List!3859) (InoxSet (_ BitVec 64)))

(assert (=> d!64231 (= lt!134157 (select (content!180 Nil!3856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171983 () Bool)

(assert (=> d!64231 (= lt!134157 e!171983)))

(declare-fun res!129877 () Bool)

(assert (=> d!64231 (=> (not res!129877) (not e!171983))))

(assert (=> d!64231 (= res!129877 ((_ is Cons!3855) Nil!3856))))

(assert (=> d!64231 (= (contains!1920 Nil!3856 #b0000000000000000000000000000000000000000000000000000000000000000) lt!134157)))

(declare-fun b!265580 () Bool)

(declare-fun e!171984 () Bool)

(assert (=> b!265580 (= e!171983 e!171984)))

(declare-fun res!129876 () Bool)

(assert (=> b!265580 (=> res!129876 e!171984)))

(assert (=> b!265580 (= res!129876 (= (h!4522 Nil!3856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!265581 () Bool)

(assert (=> b!265581 (= e!171984 (contains!1920 (t!8941 Nil!3856) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!64231 res!129877) b!265580))

(assert (= (and b!265580 (not res!129876)) b!265581))

(declare-fun m!282359 () Bool)

(assert (=> d!64231 m!282359))

(declare-fun m!282361 () Bool)

(assert (=> d!64231 m!282361))

(declare-fun m!282363 () Bool)

(assert (=> b!265581 m!282363))

(assert (=> b!265410 d!64231))

(declare-fun d!64233 () Bool)

(declare-fun lt!134158 () Bool)

(assert (=> d!64233 (= lt!134158 (select (content!180 Nil!3856) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!171985 () Bool)

(assert (=> d!64233 (= lt!134158 e!171985)))

(declare-fun res!129879 () Bool)

(assert (=> d!64233 (=> (not res!129879) (not e!171985))))

(assert (=> d!64233 (= res!129879 ((_ is Cons!3855) Nil!3856))))

(assert (=> d!64233 (= (contains!1920 Nil!3856 #b1000000000000000000000000000000000000000000000000000000000000000) lt!134158)))

