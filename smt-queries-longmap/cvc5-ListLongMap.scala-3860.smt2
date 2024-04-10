; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53080 () Bool)

(assert start!53080)

(declare-fun b!577657 () Bool)

(declare-fun res!365618 () Bool)

(declare-fun e!332244 () Bool)

(assert (=> b!577657 (=> (not res!365618) (not e!332244))))

(declare-datatypes ((array!36065 0))(
  ( (array!36066 (arr!17310 (Array (_ BitVec 32) (_ BitVec 64))) (size!17674 (_ BitVec 32))) )
))
(declare-fun a!2986 () array!36065)

(declare-fun k!1786 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!36065 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!577657 (= res!365618 (not (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000)))))

(declare-fun res!365623 () Bool)

(assert (=> start!53080 (=> (not res!365623) (not e!332244))))

(declare-fun mask!3053 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!53080 (= res!365623 (validMask!0 mask!3053))))

(assert (=> start!53080 e!332244))

(assert (=> start!53080 true))

(declare-fun array_inv!13106 (array!36065) Bool)

(assert (=> start!53080 (array_inv!13106 a!2986)))

(declare-fun b!577658 () Bool)

(declare-fun res!365622 () Bool)

(assert (=> b!577658 (=> (not res!365622) (not e!332244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!577658 (= res!365622 (validKeyInArray!0 k!1786))))

(declare-fun b!577659 () Bool)

(declare-fun e!332242 () Bool)

(declare-datatypes ((List!11351 0))(
  ( (Nil!11348) (Cons!11347 (h!12392 (_ BitVec 64)) (t!17579 List!11351)) )
))
(declare-fun noDuplicate!225 (List!11351) Bool)

(assert (=> b!577659 (= e!332242 (not (noDuplicate!225 Nil!11348)))))

(declare-fun b!577660 () Bool)

(declare-fun res!365620 () Bool)

(assert (=> b!577660 (=> (not res!365620) (not e!332242))))

(assert (=> b!577660 (= res!365620 (and (bvsle #b00000000000000000000000000000000 (size!17674 a!2986)) (bvslt (size!17674 a!2986) #b01111111111111111111111111111111)))))

(declare-fun b!577661 () Bool)

(declare-fun res!365617 () Bool)

(assert (=> b!577661 (=> (not res!365617) (not e!332244))))

(declare-fun j!136 () (_ BitVec 32))

(declare-fun i!1108 () (_ BitVec 32))

(assert (=> b!577661 (= res!365617 (and (= (size!17674 a!2986) (bvadd #b00000000000000000000000000000001 mask!3053)) (bvsge i!1108 #b00000000000000000000000000000000) (bvslt i!1108 (size!17674 a!2986)) (bvsge j!136 #b00000000000000000000000000000000) (bvslt j!136 (size!17674 a!2986)) (not (= i!1108 j!136))))))

(declare-fun b!577662 () Bool)

(declare-fun res!365624 () Bool)

(assert (=> b!577662 (=> (not res!365624) (not e!332244))))

(assert (=> b!577662 (= res!365624 (validKeyInArray!0 (select (arr!17310 a!2986) j!136)))))

(declare-fun b!577663 () Bool)

(assert (=> b!577663 (= e!332244 e!332242)))

(declare-fun res!365621 () Bool)

(assert (=> b!577663 (=> (not res!365621) (not e!332242))))

(declare-datatypes ((SeekEntryResult!5750 0))(
  ( (MissingZero!5750 (index!25227 (_ BitVec 32))) (Found!5750 (index!25228 (_ BitVec 32))) (Intermediate!5750 (undefined!6562 Bool) (index!25229 (_ BitVec 32)) (x!54139 (_ BitVec 32))) (Undefined!5750) (MissingVacant!5750 (index!25230 (_ BitVec 32))) )
))
(declare-fun lt!264034 () SeekEntryResult!5750)

(assert (=> b!577663 (= res!365621 (or (= lt!264034 (MissingZero!5750 i!1108)) (= lt!264034 (MissingVacant!5750 i!1108))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!36065 (_ BitVec 32)) SeekEntryResult!5750)

(assert (=> b!577663 (= lt!264034 (seekEntryOrOpen!0 k!1786 a!2986 mask!3053))))

(declare-fun b!577664 () Bool)

(declare-fun res!365619 () Bool)

(assert (=> b!577664 (=> (not res!365619) (not e!332242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!36065 (_ BitVec 32)) Bool)

(assert (=> b!577664 (= res!365619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053))))

(assert (= (and start!53080 res!365623) b!577661))

(assert (= (and b!577661 res!365617) b!577662))

(assert (= (and b!577662 res!365624) b!577658))

(assert (= (and b!577658 res!365622) b!577657))

(assert (= (and b!577657 res!365618) b!577663))

(assert (= (and b!577663 res!365621) b!577664))

(assert (= (and b!577664 res!365619) b!577660))

(assert (= (and b!577660 res!365620) b!577659))

(declare-fun m!556477 () Bool)

(assert (=> b!577658 m!556477))

(declare-fun m!556479 () Bool)

(assert (=> b!577662 m!556479))

(assert (=> b!577662 m!556479))

(declare-fun m!556481 () Bool)

(assert (=> b!577662 m!556481))

(declare-fun m!556483 () Bool)

(assert (=> b!577663 m!556483))

(declare-fun m!556485 () Bool)

(assert (=> b!577659 m!556485))

(declare-fun m!556487 () Bool)

(assert (=> start!53080 m!556487))

(declare-fun m!556489 () Bool)

(assert (=> start!53080 m!556489))

(declare-fun m!556491 () Bool)

(assert (=> b!577657 m!556491))

(declare-fun m!556493 () Bool)

(assert (=> b!577664 m!556493))

(push 1)

(assert (not b!577658))

(assert (not b!577662))

(assert (not b!577664))

(assert (not b!577663))

(assert (not b!577659))

(assert (not start!53080))

(assert (not b!577657))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!85589 () Bool)

(declare-fun res!365677 () Bool)

(declare-fun e!332267 () Bool)

(assert (=> d!85589 (=> res!365677 e!332267)))

(assert (=> d!85589 (= res!365677 (is-Nil!11348 Nil!11348))))

(assert (=> d!85589 (= (noDuplicate!225 Nil!11348) e!332267)))

(declare-fun b!577717 () Bool)

(declare-fun e!332268 () Bool)

(assert (=> b!577717 (= e!332267 e!332268)))

(declare-fun res!365678 () Bool)

(assert (=> b!577717 (=> (not res!365678) (not e!332268))))

(declare-fun contains!2900 (List!11351 (_ BitVec 64)) Bool)

(assert (=> b!577717 (= res!365678 (not (contains!2900 (t!17579 Nil!11348) (h!12392 Nil!11348))))))

(declare-fun b!577718 () Bool)

(assert (=> b!577718 (= e!332268 (noDuplicate!225 (t!17579 Nil!11348)))))

(assert (= (and d!85589 (not res!365677)) b!577717))

(assert (= (and b!577717 res!365678) b!577718))

(declare-fun m!556531 () Bool)

(assert (=> b!577717 m!556531))

(declare-fun m!556533 () Bool)

(assert (=> b!577718 m!556533))

(assert (=> b!577659 d!85589))

(declare-fun b!577739 () Bool)

(declare-fun e!332288 () Bool)

(declare-fun call!32762 () Bool)

(assert (=> b!577739 (= e!332288 call!32762)))

(declare-fun b!577740 () Bool)

(declare-fun e!332289 () Bool)

(assert (=> b!577740 (= e!332289 e!332288)))

(declare-fun c!66389 () Bool)

(assert (=> b!577740 (= c!66389 (validKeyInArray!0 (select (arr!17310 a!2986) #b00000000000000000000000000000000)))))

(declare-fun d!85593 () Bool)

(declare-fun res!365696 () Bool)

(assert (=> d!85593 (=> res!365696 e!332289)))

(assert (=> d!85593 (= res!365696 (bvsge #b00000000000000000000000000000000 (size!17674 a!2986)))))

(assert (=> d!85593 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2986 mask!3053) e!332289)))

(declare-fun bm!32759 () Bool)

(assert (=> bm!32759 (= call!32762 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2986 mask!3053))))

(declare-fun b!577741 () Bool)

(declare-fun e!332287 () Bool)

(assert (=> b!577741 (= e!332288 e!332287)))

(declare-fun lt!264048 () (_ BitVec 64))

(assert (=> b!577741 (= lt!264048 (select (arr!17310 a!2986) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!18148 0))(
  ( (Unit!18149) )
))
(declare-fun lt!264047 () Unit!18148)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!36065 (_ BitVec 64) (_ BitVec 32)) Unit!18148)

(assert (=> b!577741 (= lt!264047 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2986 lt!264048 #b00000000000000000000000000000000))))

(assert (=> b!577741 (arrayContainsKey!0 a!2986 lt!264048 #b00000000000000000000000000000000)))

(declare-fun lt!264049 () Unit!18148)

(assert (=> b!577741 (= lt!264049 lt!264047)))

(declare-fun res!365695 () Bool)

(assert (=> b!577741 (= res!365695 (= (seekEntryOrOpen!0 (select (arr!17310 a!2986) #b00000000000000000000000000000000) a!2986 mask!3053) (Found!5750 #b00000000000000000000000000000000)))))

(assert (=> b!577741 (=> (not res!365695) (not e!332287))))

(declare-fun b!577742 () Bool)

(assert (=> b!577742 (= e!332287 call!32762)))

(assert (= (and d!85593 (not res!365696)) b!577740))

(assert (= (and b!577740 c!66389) b!577741))

(assert (= (and b!577740 (not c!66389)) b!577739))

(assert (= (and b!577741 res!365695) b!577742))

(assert (= (or b!577742 b!577739) bm!32759))

(declare-fun m!556543 () Bool)

(assert (=> b!577740 m!556543))

(assert (=> b!577740 m!556543))

(declare-fun m!556545 () Bool)

(assert (=> b!577740 m!556545))

(declare-fun m!556547 () Bool)

(assert (=> bm!32759 m!556547))

(assert (=> b!577741 m!556543))

(declare-fun m!556549 () Bool)

(assert (=> b!577741 m!556549))

(declare-fun m!556551 () Bool)

(assert (=> b!577741 m!556551))

(assert (=> b!577741 m!556543))

(declare-fun m!556553 () Bool)

(assert (=> b!577741 m!556553))

(assert (=> b!577664 d!85593))

(declare-fun b!577797 () Bool)

(declare-fun e!332326 () SeekEntryResult!5750)

(declare-fun lt!264074 () SeekEntryResult!5750)

(assert (=> b!577797 (= e!332326 (Found!5750 (index!25229 lt!264074)))))

(declare-fun b!577798 () Bool)

(declare-fun e!332328 () SeekEntryResult!5750)

(assert (=> b!577798 (= e!332328 e!332326)))

(declare-fun lt!264075 () (_ BitVec 64))

(assert (=> b!577798 (= lt!264075 (select (arr!17310 a!2986) (index!25229 lt!264074)))))

(declare-fun c!66408 () Bool)

(assert (=> b!577798 (= c!66408 (= lt!264075 k!1786))))

(declare-fun b!577799 () Bool)

(assert (=> b!577799 (= e!332328 Undefined!5750)))

(declare-fun b!577800 () Bool)

(declare-fun e!332327 () SeekEntryResult!5750)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36065 (_ BitVec 32)) SeekEntryResult!5750)

(assert (=> b!577800 (= e!332327 (seekKeyOrZeroReturnVacant!0 (x!54139 lt!264074) (index!25229 lt!264074) (index!25229 lt!264074) k!1786 a!2986 mask!3053))))

(declare-fun b!577801 () Bool)

(declare-fun c!66410 () Bool)

(assert (=> b!577801 (= c!66410 (= lt!264075 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!577801 (= e!332326 e!332327)))

(declare-fun d!85607 () Bool)

(declare-fun lt!264076 () SeekEntryResult!5750)

(assert (=> d!85607 (and (or (is-Undefined!5750 lt!264076) (not (is-Found!5750 lt!264076)) (and (bvsge (index!25228 lt!264076) #b00000000000000000000000000000000) (bvslt (index!25228 lt!264076) (size!17674 a!2986)))) (or (is-Undefined!5750 lt!264076) (is-Found!5750 lt!264076) (not (is-MissingZero!5750 lt!264076)) (and (bvsge (index!25227 lt!264076) #b00000000000000000000000000000000) (bvslt (index!25227 lt!264076) (size!17674 a!2986)))) (or (is-Undefined!5750 lt!264076) (is-Found!5750 lt!264076) (is-MissingZero!5750 lt!264076) (not (is-MissingVacant!5750 lt!264076)) (and (bvsge (index!25230 lt!264076) #b00000000000000000000000000000000) (bvslt (index!25230 lt!264076) (size!17674 a!2986)))) (or (is-Undefined!5750 lt!264076) (ite (is-Found!5750 lt!264076) (= (select (arr!17310 a!2986) (index!25228 lt!264076)) k!1786) (ite (is-MissingZero!5750 lt!264076) (= (select (arr!17310 a!2986) (index!25227 lt!264076)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!5750 lt!264076) (= (select (arr!17310 a!2986) (index!25230 lt!264076)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!85607 (= lt!264076 e!332328)))

(declare-fun c!66409 () Bool)

(assert (=> d!85607 (= c!66409 (and (is-Intermediate!5750 lt!264074) (undefined!6562 lt!264074)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!36065 (_ BitVec 32)) SeekEntryResult!5750)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!85607 (= lt!264074 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1786 mask!3053) k!1786 a!2986 mask!3053))))

(assert (=> d!85607 (validMask!0 mask!3053)))

(assert (=> d!85607 (= (seekEntryOrOpen!0 k!1786 a!2986 mask!3053) lt!264076)))

(declare-fun b!577802 () Bool)

(assert (=> b!577802 (= e!332327 (MissingZero!5750 (index!25229 lt!264074)))))

(assert (= (and d!85607 c!66409) b!577799))

(assert (= (and d!85607 (not c!66409)) b!577798))

(assert (= (and b!577798 c!66408) b!577797))

(assert (= (and b!577798 (not c!66408)) b!577801))

(assert (= (and b!577801 c!66410) b!577802))

(assert (= (and b!577801 (not c!66410)) b!577800))

(declare-fun m!556587 () Bool)

(assert (=> b!577798 m!556587))

(declare-fun m!556589 () Bool)

(assert (=> b!577800 m!556589))

(declare-fun m!556591 () Bool)

(assert (=> d!85607 m!556591))

(declare-fun m!556593 () Bool)

(assert (=> d!85607 m!556593))

(assert (=> d!85607 m!556593))

(declare-fun m!556595 () Bool)

(assert (=> d!85607 m!556595))

(assert (=> d!85607 m!556487))

(declare-fun m!556597 () Bool)

(assert (=> d!85607 m!556597))

(declare-fun m!556599 () Bool)

(assert (=> d!85607 m!556599))

(assert (=> b!577663 d!85607))

(declare-fun d!85619 () Bool)

(assert (=> d!85619 (= (validMask!0 mask!3053) (and (or (= mask!3053 #b00000000000000000000000000000111) (= mask!3053 #b00000000000000000000000000001111) (= mask!3053 #b00000000000000000000000000011111) (= mask!3053 #b00000000000000000000000000111111) (= mask!3053 #b00000000000000000000000001111111) (= mask!3053 #b00000000000000000000000011111111) (= mask!3053 #b00000000000000000000000111111111) (= mask!3053 #b00000000000000000000001111111111) (= mask!3053 #b00000000000000000000011111111111) (= mask!3053 #b00000000000000000000111111111111) (= mask!3053 #b00000000000000000001111111111111) (= mask!3053 #b00000000000000000011111111111111) (= mask!3053 #b00000000000000000111111111111111) (= mask!3053 #b00000000000000001111111111111111) (= mask!3053 #b00000000000000011111111111111111) (= mask!3053 #b00000000000000111111111111111111) (= mask!3053 #b00000000000001111111111111111111) (= mask!3053 #b00000000000011111111111111111111) (= mask!3053 #b00000000000111111111111111111111) (= mask!3053 #b00000000001111111111111111111111) (= mask!3053 #b00000000011111111111111111111111) (= mask!3053 #b00000000111111111111111111111111) (= mask!3053 #b00000001111111111111111111111111) (= mask!3053 #b00000011111111111111111111111111) (= mask!3053 #b00000111111111111111111111111111) (= mask!3053 #b00001111111111111111111111111111) (= mask!3053 #b00011111111111111111111111111111) (= mask!3053 #b00111111111111111111111111111111)) (bvsle mask!3053 #b00111111111111111111111111111111)))))

(assert (=> start!53080 d!85619))

(declare-fun d!85623 () Bool)

(assert (=> d!85623 (= (array_inv!13106 a!2986) (bvsge (size!17674 a!2986) #b00000000000000000000000000000000))))

(assert (=> start!53080 d!85623))

(declare-fun d!85625 () Bool)

(assert (=> d!85625 (= (validKeyInArray!0 k!1786) (and (not (= k!1786 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1786 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!577658 d!85625))

(declare-fun d!85627 () Bool)

(declare-fun res!365725 () Bool)

(declare-fun e!332351 () Bool)

(assert (=> d!85627 (=> res!365725 e!332351)))

(assert (=> d!85627 (= res!365725 (= (select (arr!17310 a!2986) #b00000000000000000000000000000000) k!1786))))

(assert (=> d!85627 (= (arrayContainsKey!0 a!2986 k!1786 #b00000000000000000000000000000000) e!332351)))

(declare-fun b!577837 () Bool)

(declare-fun e!332352 () Bool)

(assert (=> b!577837 (= e!332351 e!332352)))

(declare-fun res!365726 () Bool)

(assert (=> b!577837 (=> (not res!365726) (not e!332352))))

(assert (=> b!577837 (= res!365726 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!17674 a!2986)))))

(declare-fun b!577838 () Bool)

