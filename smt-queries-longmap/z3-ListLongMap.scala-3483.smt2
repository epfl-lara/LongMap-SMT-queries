; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48278 () Bool)

(assert start!48278)

(declare-fun res!326808 () Bool)

(declare-fun e!309386 () Bool)

(assert (=> start!48278 (=> (not res!326808) (not e!309386))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48278 (= res!326808 (validMask!0 mask!3216))))

(assert (=> start!48278 e!309386))

(assert (=> start!48278 true))

(declare-datatypes ((array!33670 0))(
  ( (array!33671 (arr!16180 (Array (_ BitVec 32) (_ BitVec 64))) (size!16544 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33670)

(declare-fun array_inv!11976 (array!33670) Bool)

(assert (=> start!48278 (array_inv!11976 a!3154)))

(declare-fun b!531172 () Bool)

(declare-fun res!326807 () Bool)

(declare-fun e!309385 () Bool)

(assert (=> b!531172 (=> (not res!326807) (not e!309385))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33670 (_ BitVec 32)) Bool)

(assert (=> b!531172 (= res!326807 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531173 () Bool)

(declare-datatypes ((List!10299 0))(
  ( (Nil!10296) (Cons!10295 (h!11235 (_ BitVec 64)) (t!16527 List!10299)) )
))
(declare-fun noDuplicate!214 (List!10299) Bool)

(assert (=> b!531173 (= e!309385 (not (noDuplicate!214 Nil!10296)))))

(declare-fun b!531174 () Bool)

(assert (=> b!531174 (= e!309386 e!309385)))

(declare-fun res!326810 () Bool)

(assert (=> b!531174 (=> (not res!326810) (not e!309385))))

(declare-datatypes ((SeekEntryResult!4638 0))(
  ( (MissingZero!4638 (index!20776 (_ BitVec 32))) (Found!4638 (index!20777 (_ BitVec 32))) (Intermediate!4638 (undefined!5450 Bool) (index!20778 (_ BitVec 32)) (x!49756 (_ BitVec 32))) (Undefined!4638) (MissingVacant!4638 (index!20779 (_ BitVec 32))) )
))
(declare-fun lt!244897 () SeekEntryResult!4638)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531174 (= res!326810 (or (= lt!244897 (MissingZero!4638 i!1153)) (= lt!244897 (MissingVacant!4638 i!1153))))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33670 (_ BitVec 32)) SeekEntryResult!4638)

(assert (=> b!531174 (= lt!244897 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531175 () Bool)

(declare-fun res!326813 () Bool)

(assert (=> b!531175 (=> (not res!326813) (not e!309386))))

(declare-fun arrayContainsKey!0 (array!33670 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531175 (= res!326813 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531176 () Bool)

(declare-fun res!326809 () Bool)

(assert (=> b!531176 (=> (not res!326809) (not e!309386))))

(declare-fun j!147 () (_ BitVec 32))

(assert (=> b!531176 (= res!326809 (and (= (size!16544 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16544 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16544 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531177 () Bool)

(declare-fun res!326811 () Bool)

(assert (=> b!531177 (=> (not res!326811) (not e!309386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531177 (= res!326811 (validKeyInArray!0 k0!1998))))

(declare-fun b!531178 () Bool)

(declare-fun res!326812 () Bool)

(assert (=> b!531178 (=> (not res!326812) (not e!309386))))

(assert (=> b!531178 (= res!326812 (validKeyInArray!0 (select (arr!16180 a!3154) j!147)))))

(declare-fun b!531179 () Bool)

(declare-fun res!326806 () Bool)

(assert (=> b!531179 (=> (not res!326806) (not e!309385))))

(assert (=> b!531179 (= res!326806 (and (bvsle #b00000000000000000000000000000000 (size!16544 a!3154)) (bvslt (size!16544 a!3154) #b01111111111111111111111111111111)))))

(assert (= (and start!48278 res!326808) b!531176))

(assert (= (and b!531176 res!326809) b!531178))

(assert (= (and b!531178 res!326812) b!531177))

(assert (= (and b!531177 res!326811) b!531175))

(assert (= (and b!531175 res!326813) b!531174))

(assert (= (and b!531174 res!326810) b!531172))

(assert (= (and b!531172 res!326807) b!531179))

(assert (= (and b!531179 res!326806) b!531173))

(declare-fun m!511647 () Bool)

(assert (=> b!531172 m!511647))

(declare-fun m!511649 () Bool)

(assert (=> b!531173 m!511649))

(declare-fun m!511651 () Bool)

(assert (=> b!531178 m!511651))

(assert (=> b!531178 m!511651))

(declare-fun m!511653 () Bool)

(assert (=> b!531178 m!511653))

(declare-fun m!511655 () Bool)

(assert (=> b!531174 m!511655))

(declare-fun m!511657 () Bool)

(assert (=> b!531177 m!511657))

(declare-fun m!511659 () Bool)

(assert (=> start!48278 m!511659))

(declare-fun m!511661 () Bool)

(assert (=> start!48278 m!511661))

(declare-fun m!511663 () Bool)

(assert (=> b!531175 m!511663))

(check-sat (not b!531173) (not b!531178) (not b!531174) (not b!531172) (not start!48278) (not b!531177) (not b!531175))
(check-sat)
(get-model)

(declare-fun d!81209 () Bool)

(declare-fun res!326842 () Bool)

(declare-fun e!309401 () Bool)

(assert (=> d!81209 (=> res!326842 e!309401)))

(get-info :version)

(assert (=> d!81209 (= res!326842 ((_ is Nil!10296) Nil!10296))))

(assert (=> d!81209 (= (noDuplicate!214 Nil!10296) e!309401)))

(declare-fun b!531208 () Bool)

(declare-fun e!309402 () Bool)

(assert (=> b!531208 (= e!309401 e!309402)))

(declare-fun res!326843 () Bool)

(assert (=> b!531208 (=> (not res!326843) (not e!309402))))

(declare-fun contains!2782 (List!10299 (_ BitVec 64)) Bool)

(assert (=> b!531208 (= res!326843 (not (contains!2782 (t!16527 Nil!10296) (h!11235 Nil!10296))))))

(declare-fun b!531209 () Bool)

(assert (=> b!531209 (= e!309402 (noDuplicate!214 (t!16527 Nil!10296)))))

(assert (= (and d!81209 (not res!326842)) b!531208))

(assert (= (and b!531208 res!326843) b!531209))

(declare-fun m!511683 () Bool)

(assert (=> b!531208 m!511683))

(declare-fun m!511685 () Bool)

(assert (=> b!531209 m!511685))

(assert (=> b!531173 d!81209))

(declare-fun d!81211 () Bool)

(declare-fun lt!244917 () SeekEntryResult!4638)

(assert (=> d!81211 (and (or ((_ is Undefined!4638) lt!244917) (not ((_ is Found!4638) lt!244917)) (and (bvsge (index!20777 lt!244917) #b00000000000000000000000000000000) (bvslt (index!20777 lt!244917) (size!16544 a!3154)))) (or ((_ is Undefined!4638) lt!244917) ((_ is Found!4638) lt!244917) (not ((_ is MissingZero!4638) lt!244917)) (and (bvsge (index!20776 lt!244917) #b00000000000000000000000000000000) (bvslt (index!20776 lt!244917) (size!16544 a!3154)))) (or ((_ is Undefined!4638) lt!244917) ((_ is Found!4638) lt!244917) ((_ is MissingZero!4638) lt!244917) (not ((_ is MissingVacant!4638) lt!244917)) (and (bvsge (index!20779 lt!244917) #b00000000000000000000000000000000) (bvslt (index!20779 lt!244917) (size!16544 a!3154)))) (or ((_ is Undefined!4638) lt!244917) (ite ((_ is Found!4638) lt!244917) (= (select (arr!16180 a!3154) (index!20777 lt!244917)) k0!1998) (ite ((_ is MissingZero!4638) lt!244917) (= (select (arr!16180 a!3154) (index!20776 lt!244917)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4638) lt!244917) (= (select (arr!16180 a!3154) (index!20779 lt!244917)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!309425 () SeekEntryResult!4638)

(assert (=> d!81211 (= lt!244917 e!309425)))

(declare-fun c!62504 () Bool)

(declare-fun lt!244916 () SeekEntryResult!4638)

(assert (=> d!81211 (= c!62504 (and ((_ is Intermediate!4638) lt!244916) (undefined!5450 lt!244916)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33670 (_ BitVec 32)) SeekEntryResult!4638)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81211 (= lt!244916 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81211 (validMask!0 mask!3216)))

(assert (=> d!81211 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!244917)))

(declare-fun b!531240 () Bool)

(declare-fun e!309426 () SeekEntryResult!4638)

(assert (=> b!531240 (= e!309426 (MissingZero!4638 (index!20778 lt!244916)))))

(declare-fun b!531241 () Bool)

(declare-fun e!309424 () SeekEntryResult!4638)

(assert (=> b!531241 (= e!309424 (Found!4638 (index!20778 lt!244916)))))

(declare-fun b!531242 () Bool)

(declare-fun c!62502 () Bool)

(declare-fun lt!244918 () (_ BitVec 64))

(assert (=> b!531242 (= c!62502 (= lt!244918 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!531242 (= e!309424 e!309426)))

(declare-fun b!531243 () Bool)

(assert (=> b!531243 (= e!309425 e!309424)))

(assert (=> b!531243 (= lt!244918 (select (arr!16180 a!3154) (index!20778 lt!244916)))))

(declare-fun c!62503 () Bool)

(assert (=> b!531243 (= c!62503 (= lt!244918 k0!1998))))

(declare-fun b!531244 () Bool)

(assert (=> b!531244 (= e!309425 Undefined!4638)))

(declare-fun b!531245 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33670 (_ BitVec 32)) SeekEntryResult!4638)

(assert (=> b!531245 (= e!309426 (seekKeyOrZeroReturnVacant!0 (x!49756 lt!244916) (index!20778 lt!244916) (index!20778 lt!244916) k0!1998 a!3154 mask!3216))))

(assert (= (and d!81211 c!62504) b!531244))

(assert (= (and d!81211 (not c!62504)) b!531243))

(assert (= (and b!531243 c!62503) b!531241))

(assert (= (and b!531243 (not c!62503)) b!531242))

(assert (= (and b!531242 c!62502) b!531240))

(assert (= (and b!531242 (not c!62502)) b!531245))

(declare-fun m!511701 () Bool)

(assert (=> d!81211 m!511701))

(declare-fun m!511703 () Bool)

(assert (=> d!81211 m!511703))

(assert (=> d!81211 m!511659))

(declare-fun m!511705 () Bool)

(assert (=> d!81211 m!511705))

(declare-fun m!511707 () Bool)

(assert (=> d!81211 m!511707))

(assert (=> d!81211 m!511705))

(declare-fun m!511709 () Bool)

(assert (=> d!81211 m!511709))

(declare-fun m!511711 () Bool)

(assert (=> b!531243 m!511711))

(declare-fun m!511713 () Bool)

(assert (=> b!531245 m!511713))

(assert (=> b!531174 d!81211))

(declare-fun d!81227 () Bool)

(declare-fun res!326860 () Bool)

(declare-fun e!309437 () Bool)

(assert (=> d!81227 (=> res!326860 e!309437)))

(assert (=> d!81227 (= res!326860 (= (select (arr!16180 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81227 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309437)))

(declare-fun b!531262 () Bool)

(declare-fun e!309438 () Bool)

(assert (=> b!531262 (= e!309437 e!309438)))

(declare-fun res!326861 () Bool)

(assert (=> b!531262 (=> (not res!326861) (not e!309438))))

(assert (=> b!531262 (= res!326861 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16544 a!3154)))))

(declare-fun b!531263 () Bool)

(assert (=> b!531263 (= e!309438 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81227 (not res!326860)) b!531262))

(assert (= (and b!531262 res!326861) b!531263))

(declare-fun m!511715 () Bool)

(assert (=> d!81227 m!511715))

(declare-fun m!511717 () Bool)

(assert (=> b!531263 m!511717))

(assert (=> b!531175 d!81227))

(declare-fun d!81229 () Bool)

(assert (=> d!81229 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531177 d!81229))

(declare-fun b!531278 () Bool)

(declare-fun e!309450 () Bool)

(declare-fun e!309449 () Bool)

(assert (=> b!531278 (= e!309450 e!309449)))

(declare-fun lt!244934 () (_ BitVec 64))

(assert (=> b!531278 (= lt!244934 (select (arr!16180 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16832 0))(
  ( (Unit!16833) )
))
(declare-fun lt!244935 () Unit!16832)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33670 (_ BitVec 64) (_ BitVec 32)) Unit!16832)

(assert (=> b!531278 (= lt!244935 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!244934 #b00000000000000000000000000000000))))

(assert (=> b!531278 (arrayContainsKey!0 a!3154 lt!244934 #b00000000000000000000000000000000)))

(declare-fun lt!244936 () Unit!16832)

(assert (=> b!531278 (= lt!244936 lt!244935)))

(declare-fun res!326867 () Bool)

(assert (=> b!531278 (= res!326867 (= (seekEntryOrOpen!0 (select (arr!16180 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4638 #b00000000000000000000000000000000)))))

(assert (=> b!531278 (=> (not res!326867) (not e!309449))))

(declare-fun b!531279 () Bool)

(declare-fun call!31949 () Bool)

(assert (=> b!531279 (= e!309449 call!31949)))

(declare-fun b!531280 () Bool)

(declare-fun e!309448 () Bool)

(assert (=> b!531280 (= e!309448 e!309450)))

(declare-fun c!62516 () Bool)

(assert (=> b!531280 (= c!62516 (validKeyInArray!0 (select (arr!16180 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!531281 () Bool)

(assert (=> b!531281 (= e!309450 call!31949)))

(declare-fun bm!31946 () Bool)

(assert (=> bm!31946 (= call!31949 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun d!81231 () Bool)

(declare-fun res!326866 () Bool)

(assert (=> d!81231 (=> res!326866 e!309448)))

(assert (=> d!81231 (= res!326866 (bvsge #b00000000000000000000000000000000 (size!16544 a!3154)))))

(assert (=> d!81231 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309448)))

(assert (= (and d!81231 (not res!326866)) b!531280))

(assert (= (and b!531280 c!62516) b!531278))

(assert (= (and b!531280 (not c!62516)) b!531281))

(assert (= (and b!531278 res!326867) b!531279))

(assert (= (or b!531279 b!531281) bm!31946))

(assert (=> b!531278 m!511715))

(declare-fun m!511733 () Bool)

(assert (=> b!531278 m!511733))

(declare-fun m!511735 () Bool)

(assert (=> b!531278 m!511735))

(assert (=> b!531278 m!511715))

(declare-fun m!511737 () Bool)

(assert (=> b!531278 m!511737))

(assert (=> b!531280 m!511715))

(assert (=> b!531280 m!511715))

(declare-fun m!511739 () Bool)

(assert (=> b!531280 m!511739))

(declare-fun m!511741 () Bool)

(assert (=> bm!31946 m!511741))

(assert (=> b!531172 d!81231))

(declare-fun d!81239 () Bool)

(assert (=> d!81239 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48278 d!81239))

(declare-fun d!81249 () Bool)

(assert (=> d!81249 (= (array_inv!11976 a!3154) (bvsge (size!16544 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48278 d!81249))

(declare-fun d!81251 () Bool)

(assert (=> d!81251 (= (validKeyInArray!0 (select (arr!16180 a!3154) j!147)) (and (not (= (select (arr!16180 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16180 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531178 d!81251))

(check-sat (not b!531280) (not b!531208) (not d!81211) (not b!531278) (not b!531209) (not bm!31946) (not b!531245) (not b!531263))
(check-sat)
