; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48276 () Bool)

(assert start!48276)

(declare-fun b!531149 () Bool)

(declare-fun e!309378 () Bool)

(declare-fun e!309376 () Bool)

(assert (=> b!531149 (= e!309378 e!309376)))

(declare-fun res!326784 () Bool)

(assert (=> b!531149 (=> (not res!326784) (not e!309376))))

(declare-datatypes ((SeekEntryResult!4637 0))(
  ( (MissingZero!4637 (index!20772 (_ BitVec 32))) (Found!4637 (index!20773 (_ BitVec 32))) (Intermediate!4637 (undefined!5449 Bool) (index!20774 (_ BitVec 32)) (x!49755 (_ BitVec 32))) (Undefined!4637) (MissingVacant!4637 (index!20775 (_ BitVec 32))) )
))
(declare-fun lt!244894 () SeekEntryResult!4637)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531149 (= res!326784 (or (= lt!244894 (MissingZero!4637 i!1153)) (= lt!244894 (MissingVacant!4637 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k!1998 () (_ BitVec 64))

(declare-datatypes ((array!33668 0))(
  ( (array!33669 (arr!16179 (Array (_ BitVec 32) (_ BitVec 64))) (size!16543 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33668)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33668 (_ BitVec 32)) SeekEntryResult!4637)

(assert (=> b!531149 (= lt!244894 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!531150 () Bool)

(declare-datatypes ((List!10298 0))(
  ( (Nil!10295) (Cons!10294 (h!11234 (_ BitVec 64)) (t!16526 List!10298)) )
))
(declare-fun noDuplicate!213 (List!10298) Bool)

(assert (=> b!531150 (= e!309376 (not (noDuplicate!213 Nil!10295)))))

(declare-fun b!531151 () Bool)

(declare-fun res!326783 () Bool)

(assert (=> b!531151 (=> (not res!326783) (not e!309376))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33668 (_ BitVec 32)) Bool)

(assert (=> b!531151 (= res!326783 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531152 () Bool)

(declare-fun res!326785 () Bool)

(assert (=> b!531152 (=> (not res!326785) (not e!309378))))

(declare-fun arrayContainsKey!0 (array!33668 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531152 (= res!326785 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531153 () Bool)

(declare-fun res!326788 () Bool)

(assert (=> b!531153 (=> (not res!326788) (not e!309378))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531153 (= res!326788 (validKeyInArray!0 (select (arr!16179 a!3154) j!147)))))

(declare-fun b!531154 () Bool)

(declare-fun res!326786 () Bool)

(assert (=> b!531154 (=> (not res!326786) (not e!309376))))

(assert (=> b!531154 (= res!326786 (and (bvsle #b00000000000000000000000000000000 (size!16543 a!3154)) (bvslt (size!16543 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!531155 () Bool)

(declare-fun res!326782 () Bool)

(assert (=> b!531155 (=> (not res!326782) (not e!309378))))

(assert (=> b!531155 (= res!326782 (and (= (size!16543 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16543 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16543 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531148 () Bool)

(declare-fun res!326787 () Bool)

(assert (=> b!531148 (=> (not res!326787) (not e!309378))))

(assert (=> b!531148 (= res!326787 (validKeyInArray!0 k!1998))))

(declare-fun res!326789 () Bool)

(assert (=> start!48276 (=> (not res!326789) (not e!309378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48276 (= res!326789 (validMask!0 mask!3216))))

(assert (=> start!48276 e!309378))

(assert (=> start!48276 true))

(declare-fun array_inv!11975 (array!33668) Bool)

(assert (=> start!48276 (array_inv!11975 a!3154)))

(assert (= (and start!48276 res!326789) b!531155))

(assert (= (and b!531155 res!326782) b!531153))

(assert (= (and b!531153 res!326788) b!531148))

(assert (= (and b!531148 res!326787) b!531152))

(assert (= (and b!531152 res!326785) b!531149))

(assert (= (and b!531149 res!326784) b!531151))

(assert (= (and b!531151 res!326783) b!531154))

(assert (= (and b!531154 res!326786) b!531150))

(declare-fun m!511629 () Bool)

(assert (=> b!531150 m!511629))

(declare-fun m!511631 () Bool)

(assert (=> b!531151 m!511631))

(declare-fun m!511633 () Bool)

(assert (=> start!48276 m!511633))

(declare-fun m!511635 () Bool)

(assert (=> start!48276 m!511635))

(declare-fun m!511637 () Bool)

(assert (=> b!531152 m!511637))

(declare-fun m!511639 () Bool)

(assert (=> b!531149 m!511639))

(declare-fun m!511641 () Bool)

(assert (=> b!531148 m!511641))

(declare-fun m!511643 () Bool)

(assert (=> b!531153 m!511643))

(assert (=> b!531153 m!511643))

(declare-fun m!511645 () Bool)

(assert (=> b!531153 m!511645))

(push 1)

(assert (not b!531148))

(assert (not b!531151))

(assert (not b!531152))

(assert (not b!531150))

(assert (not b!531153))

(assert (not b!531149))

(assert (not start!48276))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!531218 () Bool)

(declare-fun e!309411 () Bool)

(declare-fun call!31946 () Bool)

(assert (=> b!531218 (= e!309411 call!31946)))

(declare-fun d!81213 () Bool)

(declare-fun res!326848 () Bool)

(declare-fun e!309409 () Bool)

(assert (=> d!81213 (=> res!326848 e!309409)))

(assert (=> d!81213 (= res!326848 (bvsge #b00000000000000000000000000000000 (size!16543 a!3154)))))

(assert (=> d!81213 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309409)))

(declare-fun b!531219 () Bool)

(declare-fun e!309410 () Bool)

(assert (=> b!531219 (= e!309409 e!309410)))

(declare-fun c!62495 () Bool)

(assert (=> b!531219 (= c!62495 (validKeyInArray!0 (select (arr!16179 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!31943 () Bool)

(assert (=> bm!31943 (= call!31946 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!531220 () Bool)

(assert (=> b!531220 (= e!309410 call!31946)))

(declare-fun b!531221 () Bool)

(assert (=> b!531221 (= e!309410 e!309411)))

(declare-fun lt!244908 () (_ BitVec 64))

(assert (=> b!531221 (= lt!244908 (select (arr!16179 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16830 0))(
  ( (Unit!16831) )
))
(declare-fun lt!244907 () Unit!16830)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33668 (_ BitVec 64) (_ BitVec 32)) Unit!16830)

(assert (=> b!531221 (= lt!244907 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!244908 #b00000000000000000000000000000000))))

(assert (=> b!531221 (arrayContainsKey!0 a!3154 lt!244908 #b00000000000000000000000000000000)))

(declare-fun lt!244909 () Unit!16830)

(assert (=> b!531221 (= lt!244909 lt!244907)))

(declare-fun res!326849 () Bool)

(assert (=> b!531221 (= res!326849 (= (seekEntryOrOpen!0 (select (arr!16179 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4637 #b00000000000000000000000000000000)))))

(assert (=> b!531221 (=> (not res!326849) (not e!309411))))

(assert (= (and d!81213 (not res!326848)) b!531219))

(assert (= (and b!531219 c!62495) b!531221))

(assert (= (and b!531219 (not c!62495)) b!531220))

(assert (= (and b!531221 res!326849) b!531218))

(assert (= (or b!531218 b!531220) bm!31943))

(declare-fun m!511687 () Bool)

(assert (=> b!531219 m!511687))

(assert (=> b!531219 m!511687))

(declare-fun m!511689 () Bool)

(assert (=> b!531219 m!511689))

(declare-fun m!511691 () Bool)

(assert (=> bm!31943 m!511691))

(assert (=> b!531221 m!511687))

(declare-fun m!511693 () Bool)

(assert (=> b!531221 m!511693))

(declare-fun m!511695 () Bool)

(assert (=> b!531221 m!511695))

(assert (=> b!531221 m!511687))

(declare-fun m!511697 () Bool)

(assert (=> b!531221 m!511697))

(assert (=> b!531151 d!81213))

(declare-fun d!81219 () Bool)

(declare-fun res!326854 () Bool)

(declare-fun e!309416 () Bool)

(assert (=> d!81219 (=> res!326854 e!309416)))

(assert (=> d!81219 (= res!326854 (= (select (arr!16179 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81219 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!309416)))

(declare-fun b!531226 () Bool)

(declare-fun e!309417 () Bool)

(assert (=> b!531226 (= e!309416 e!309417)))

(declare-fun res!326855 () Bool)

(assert (=> b!531226 (=> (not res!326855) (not e!309417))))

(assert (=> b!531226 (= res!326855 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16543 a!3154)))))

(declare-fun b!531227 () Bool)

(assert (=> b!531227 (= e!309417 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81219 (not res!326854)) b!531226))

(assert (= (and b!531226 res!326855) b!531227))

(assert (=> d!81219 m!511687))

(declare-fun m!511699 () Bool)

(assert (=> b!531227 m!511699))

(assert (=> b!531152 d!81219))

(declare-fun d!81221 () Bool)

(assert (=> d!81221 (= (validKeyInArray!0 (select (arr!16179 a!3154) j!147)) (and (not (= (select (arr!16179 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16179 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531153 d!81221))

(declare-fun d!81223 () Bool)

(assert (=> d!81223 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531148 d!81223))

(declare-fun d!81225 () Bool)

(assert (=> d!81225 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48276 d!81225))

(declare-fun d!81233 () Bool)

(assert (=> d!81233 (= (array_inv!11975 a!3154) (bvsge (size!16543 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48276 d!81233))

(declare-fun b!531308 () Bool)

(declare-fun e!309471 () SeekEntryResult!4637)

(declare-fun lt!244950 () SeekEntryResult!4637)

(assert (=> b!531308 (= e!309471 (MissingZero!4637 (index!20774 lt!244950)))))

(declare-fun b!531309 () Bool)

(declare-fun e!309470 () SeekEntryResult!4637)

(declare-fun e!309469 () SeekEntryResult!4637)

(assert (=> b!531309 (= e!309470 e!309469)))

(declare-fun lt!244951 () (_ BitVec 64))

(assert (=> b!531309 (= lt!244951 (select (arr!16179 a!3154) (index!20774 lt!244950)))))

(declare-fun c!62525 () Bool)

(assert (=> b!531309 (= c!62525 (= lt!244951 k!1998))))

(declare-fun b!531310 () Bool)

(declare-fun c!62526 () Bool)

(assert (=> b!531310 (= c!62526 (= lt!244951 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!531310 (= e!309469 e!309471)))

(declare-fun b!531311 () Bool)

(assert (=> b!531311 (= e!309469 (Found!4637 (index!20774 lt!244950)))))

(declare-fun b!531312 () Bool)

(assert (=> b!531312 (= e!309470 Undefined!4637)))

(declare-fun b!531313 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33668 (_ BitVec 32)) SeekEntryResult!4637)

(assert (=> b!531313 (= e!309471 (seekKeyOrZeroReturnVacant!0 (x!49755 lt!244950) (index!20774 lt!244950) (index!20774 lt!244950) k!1998 a!3154 mask!3216))))

(declare-fun d!81237 () Bool)

(declare-fun lt!244949 () SeekEntryResult!4637)

(assert (=> d!81237 (and (or (is-Undefined!4637 lt!244949) (not (is-Found!4637 lt!244949)) (and (bvsge (index!20773 lt!244949) #b00000000000000000000000000000000) (bvslt (index!20773 lt!244949) (size!16543 a!3154)))) (or (is-Undefined!4637 lt!244949) (is-Found!4637 lt!244949) (not (is-MissingZero!4637 lt!244949)) (and (bvsge (index!20772 lt!244949) #b00000000000000000000000000000000) (bvslt (index!20772 lt!244949) (size!16543 a!3154)))) (or (is-Undefined!4637 lt!244949) (is-Found!4637 lt!244949) (is-MissingZero!4637 lt!244949) (not (is-MissingVacant!4637 lt!244949)) (and (bvsge (index!20775 lt!244949) #b00000000000000000000000000000000) (bvslt (index!20775 lt!244949) (size!16543 a!3154)))) (or (is-Undefined!4637 lt!244949) (ite (is-Found!4637 lt!244949) (= (select (arr!16179 a!3154) (index!20773 lt!244949)) k!1998) (ite (is-MissingZero!4637 lt!244949) (= (select (arr!16179 a!3154) (index!20772 lt!244949)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4637 lt!244949) (= (select (arr!16179 a!3154) (index!20775 lt!244949)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81237 (= lt!244949 e!309470)))

(declare-fun c!62527 () Bool)

(assert (=> d!81237 (= c!62527 (and (is-Intermediate!4637 lt!244950) (undefined!5449 lt!244950)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33668 (_ BitVec 32)) SeekEntryResult!4637)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81237 (= lt!244950 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81237 (validMask!0 mask!3216)))

(assert (=> d!81237 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!244949)))

(assert (= (and d!81237 c!62527) b!531312))

(assert (= (and d!81237 (not c!62527)) b!531309))

(assert (= (and b!531309 c!62525) b!531311))

(assert (= (and b!531309 (not c!62525)) b!531310))

(assert (= (and b!531310 c!62526) b!531308))

(assert (= (and b!531310 (not c!62526)) b!531313))

(declare-fun m!511747 () Bool)

(assert (=> b!531309 m!511747))

(declare-fun m!511749 () Bool)

(assert (=> b!531313 m!511749))

(declare-fun m!511751 () Bool)

(assert (=> d!81237 m!511751))

(declare-fun m!511753 () Bool)

(assert (=> d!81237 m!511753))

(assert (=> d!81237 m!511633))

(declare-fun m!511755 () Bool)

(assert (=> d!81237 m!511755))

(assert (=> d!81237 m!511751))

(declare-fun m!511757 () Bool)

(assert (=> d!81237 m!511757))

(declare-fun m!511759 () Bool)

(assert (=> d!81237 m!511759))

(assert (=> b!531149 d!81237))

(declare-fun d!81253 () Bool)

(declare-fun res!326884 () Bool)

(declare-fun e!309479 () Bool)

(assert (=> d!81253 (=> res!326884 e!309479)))

(assert (=> d!81253 (= res!326884 (is-Nil!10295 Nil!10295))))

(assert (=> d!81253 (= (noDuplicate!213 Nil!10295) e!309479)))

(declare-fun b!531322 () Bool)

(declare-fun e!309480 () Bool)

