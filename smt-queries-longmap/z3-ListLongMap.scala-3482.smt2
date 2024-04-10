; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48236 () Bool)

(assert start!48236)

(declare-fun b!530996 () Bool)

(declare-fun e!309287 () Bool)

(declare-fun e!309286 () Bool)

(assert (=> b!530996 (= e!309287 e!309286)))

(declare-fun res!326703 () Bool)

(assert (=> b!530996 (=> (not res!326703) (not e!309286))))

(declare-datatypes ((SeekEntryResult!4635 0))(
  ( (MissingZero!4635 (index!20764 (_ BitVec 32))) (Found!4635 (index!20765 (_ BitVec 32))) (Intermediate!4635 (undefined!5447 Bool) (index!20766 (_ BitVec 32)) (x!49745 (_ BitVec 32))) (Undefined!4635) (MissingVacant!4635 (index!20767 (_ BitVec 32))) )
))
(declare-fun lt!244834 () SeekEntryResult!4635)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!530996 (= res!326703 (or (= lt!244834 (MissingZero!4635 i!1153)) (= lt!244834 (MissingVacant!4635 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-datatypes ((array!33661 0))(
  ( (array!33662 (arr!16177 (Array (_ BitVec 32) (_ BitVec 64))) (size!16541 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33661)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33661 (_ BitVec 32)) SeekEntryResult!4635)

(assert (=> b!530996 (= lt!244834 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!530997 () Bool)

(declare-fun res!326708 () Bool)

(assert (=> b!530997 (=> (not res!326708) (not e!309286))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33661 (_ BitVec 32)) Bool)

(assert (=> b!530997 (= res!326708 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!530998 () Bool)

(declare-fun res!326704 () Bool)

(assert (=> b!530998 (=> (not res!326704) (not e!309287))))

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!530998 (= res!326704 (validKeyInArray!0 (select (arr!16177 a!3154) j!147)))))

(declare-fun b!530999 () Bool)

(assert (=> b!530999 (= e!309286 (and (bvsle #b00000000000000000000000000000000 (size!16541 a!3154)) (bvsge (size!16541 a!3154) #b01111111111111111111111111111111)))))

(declare-fun b!531000 () Bool)

(declare-fun res!326707 () Bool)

(assert (=> b!531000 (=> (not res!326707) (not e!309287))))

(assert (=> b!531000 (= res!326707 (validKeyInArray!0 k0!1998))))

(declare-fun b!531002 () Bool)

(declare-fun res!326706 () Bool)

(assert (=> b!531002 (=> (not res!326706) (not e!309287))))

(assert (=> b!531002 (= res!326706 (and (= (size!16541 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16541 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16541 a!3154)) (not (= i!1153 j!147))))))

(declare-fun res!326702 () Bool)

(assert (=> start!48236 (=> (not res!326702) (not e!309287))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48236 (= res!326702 (validMask!0 mask!3216))))

(assert (=> start!48236 e!309287))

(assert (=> start!48236 true))

(declare-fun array_inv!11973 (array!33661) Bool)

(assert (=> start!48236 (array_inv!11973 a!3154)))

(declare-fun b!531001 () Bool)

(declare-fun res!326705 () Bool)

(assert (=> b!531001 (=> (not res!326705) (not e!309287))))

(declare-fun arrayContainsKey!0 (array!33661 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531001 (= res!326705 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(assert (= (and start!48236 res!326702) b!531002))

(assert (= (and b!531002 res!326706) b!530998))

(assert (= (and b!530998 res!326704) b!531000))

(assert (= (and b!531000 res!326707) b!531001))

(assert (= (and b!531001 res!326705) b!530996))

(assert (= (and b!530996 res!326703) b!530997))

(assert (= (and b!530997 res!326708) b!530999))

(declare-fun m!511513 () Bool)

(assert (=> b!530998 m!511513))

(assert (=> b!530998 m!511513))

(declare-fun m!511515 () Bool)

(assert (=> b!530998 m!511515))

(declare-fun m!511517 () Bool)

(assert (=> b!530997 m!511517))

(declare-fun m!511519 () Bool)

(assert (=> b!530996 m!511519))

(declare-fun m!511521 () Bool)

(assert (=> b!531000 m!511521))

(declare-fun m!511523 () Bool)

(assert (=> b!531001 m!511523))

(declare-fun m!511525 () Bool)

(assert (=> start!48236 m!511525))

(declare-fun m!511527 () Bool)

(assert (=> start!48236 m!511527))

(check-sat (not b!530997) (not start!48236) (not b!531000) (not b!530996) (not b!530998) (not b!531001))
(check-sat)
(get-model)

(declare-fun b!531032 () Bool)

(declare-fun e!309305 () Bool)

(declare-fun call!31937 () Bool)

(assert (=> b!531032 (= e!309305 call!31937)))

(declare-fun b!531033 () Bool)

(declare-fun e!309306 () Bool)

(assert (=> b!531033 (= e!309306 call!31937)))

(declare-fun d!81165 () Bool)

(declare-fun res!326735 () Bool)

(declare-fun e!309304 () Bool)

(assert (=> d!81165 (=> res!326735 e!309304)))

(assert (=> d!81165 (= res!326735 (bvsge #b00000000000000000000000000000000 (size!16541 a!3154)))))

(assert (=> d!81165 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309304)))

(declare-fun bm!31934 () Bool)

(assert (=> bm!31934 (= call!31937 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!531034 () Bool)

(assert (=> b!531034 (= e!309304 e!309306)))

(declare-fun c!62459 () Bool)

(assert (=> b!531034 (= c!62459 (validKeyInArray!0 (select (arr!16177 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!531035 () Bool)

(assert (=> b!531035 (= e!309306 e!309305)))

(declare-fun lt!244844 () (_ BitVec 64))

(assert (=> b!531035 (= lt!244844 (select (arr!16177 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16826 0))(
  ( (Unit!16827) )
))
(declare-fun lt!244845 () Unit!16826)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33661 (_ BitVec 64) (_ BitVec 32)) Unit!16826)

(assert (=> b!531035 (= lt!244845 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!244844 #b00000000000000000000000000000000))))

(assert (=> b!531035 (arrayContainsKey!0 a!3154 lt!244844 #b00000000000000000000000000000000)))

(declare-fun lt!244846 () Unit!16826)

(assert (=> b!531035 (= lt!244846 lt!244845)))

(declare-fun res!326734 () Bool)

(assert (=> b!531035 (= res!326734 (= (seekEntryOrOpen!0 (select (arr!16177 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4635 #b00000000000000000000000000000000)))))

(assert (=> b!531035 (=> (not res!326734) (not e!309305))))

(assert (= (and d!81165 (not res!326735)) b!531034))

(assert (= (and b!531034 c!62459) b!531035))

(assert (= (and b!531034 (not c!62459)) b!531033))

(assert (= (and b!531035 res!326734) b!531032))

(assert (= (or b!531032 b!531033) bm!31934))

(declare-fun m!511545 () Bool)

(assert (=> bm!31934 m!511545))

(declare-fun m!511547 () Bool)

(assert (=> b!531034 m!511547))

(assert (=> b!531034 m!511547))

(declare-fun m!511549 () Bool)

(assert (=> b!531034 m!511549))

(assert (=> b!531035 m!511547))

(declare-fun m!511551 () Bool)

(assert (=> b!531035 m!511551))

(declare-fun m!511553 () Bool)

(assert (=> b!531035 m!511553))

(assert (=> b!531035 m!511547))

(declare-fun m!511555 () Bool)

(assert (=> b!531035 m!511555))

(assert (=> b!530997 d!81165))

(declare-fun d!81173 () Bool)

(assert (=> d!81173 (= (validKeyInArray!0 (select (arr!16177 a!3154) j!147)) (and (not (= (select (arr!16177 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16177 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!530998 d!81173))

(declare-fun d!81175 () Bool)

(assert (=> d!81175 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531000 d!81175))

(declare-fun d!81177 () Bool)

(declare-fun lt!244872 () SeekEntryResult!4635)

(get-info :version)

(assert (=> d!81177 (and (or ((_ is Undefined!4635) lt!244872) (not ((_ is Found!4635) lt!244872)) (and (bvsge (index!20765 lt!244872) #b00000000000000000000000000000000) (bvslt (index!20765 lt!244872) (size!16541 a!3154)))) (or ((_ is Undefined!4635) lt!244872) ((_ is Found!4635) lt!244872) (not ((_ is MissingZero!4635) lt!244872)) (and (bvsge (index!20764 lt!244872) #b00000000000000000000000000000000) (bvslt (index!20764 lt!244872) (size!16541 a!3154)))) (or ((_ is Undefined!4635) lt!244872) ((_ is Found!4635) lt!244872) ((_ is MissingZero!4635) lt!244872) (not ((_ is MissingVacant!4635) lt!244872)) (and (bvsge (index!20767 lt!244872) #b00000000000000000000000000000000) (bvslt (index!20767 lt!244872) (size!16541 a!3154)))) (or ((_ is Undefined!4635) lt!244872) (ite ((_ is Found!4635) lt!244872) (= (select (arr!16177 a!3154) (index!20765 lt!244872)) k0!1998) (ite ((_ is MissingZero!4635) lt!244872) (= (select (arr!16177 a!3154) (index!20764 lt!244872)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4635) lt!244872) (= (select (arr!16177 a!3154) (index!20767 lt!244872)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!309337 () SeekEntryResult!4635)

(assert (=> d!81177 (= lt!244872 e!309337)))

(declare-fun c!62480 () Bool)

(declare-fun lt!244873 () SeekEntryResult!4635)

(assert (=> d!81177 (= c!62480 (and ((_ is Intermediate!4635) lt!244873) (undefined!5447 lt!244873)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33661 (_ BitVec 32)) SeekEntryResult!4635)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81177 (= lt!244873 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81177 (validMask!0 mask!3216)))

(assert (=> d!81177 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!244872)))

(declare-fun b!531084 () Bool)

(declare-fun c!62478 () Bool)

(declare-fun lt!244871 () (_ BitVec 64))

(assert (=> b!531084 (= c!62478 (= lt!244871 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!309339 () SeekEntryResult!4635)

(declare-fun e!309338 () SeekEntryResult!4635)

(assert (=> b!531084 (= e!309339 e!309338)))

(declare-fun b!531085 () Bool)

(assert (=> b!531085 (= e!309337 Undefined!4635)))

(declare-fun b!531086 () Bool)

(assert (=> b!531086 (= e!309339 (Found!4635 (index!20766 lt!244873)))))

(declare-fun b!531087 () Bool)

(assert (=> b!531087 (= e!309337 e!309339)))

(assert (=> b!531087 (= lt!244871 (select (arr!16177 a!3154) (index!20766 lt!244873)))))

(declare-fun c!62479 () Bool)

(assert (=> b!531087 (= c!62479 (= lt!244871 k0!1998))))

(declare-fun b!531088 () Bool)

(assert (=> b!531088 (= e!309338 (MissingZero!4635 (index!20766 lt!244873)))))

(declare-fun b!531089 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33661 (_ BitVec 32)) SeekEntryResult!4635)

(assert (=> b!531089 (= e!309338 (seekKeyOrZeroReturnVacant!0 (x!49745 lt!244873) (index!20766 lt!244873) (index!20766 lt!244873) k0!1998 a!3154 mask!3216))))

(assert (= (and d!81177 c!62480) b!531085))

(assert (= (and d!81177 (not c!62480)) b!531087))

(assert (= (and b!531087 c!62479) b!531086))

(assert (= (and b!531087 (not c!62479)) b!531084))

(assert (= (and b!531084 c!62478) b!531088))

(assert (= (and b!531084 (not c!62478)) b!531089))

(assert (=> d!81177 m!511525))

(declare-fun m!511585 () Bool)

(assert (=> d!81177 m!511585))

(declare-fun m!511587 () Bool)

(assert (=> d!81177 m!511587))

(declare-fun m!511589 () Bool)

(assert (=> d!81177 m!511589))

(declare-fun m!511591 () Bool)

(assert (=> d!81177 m!511591))

(assert (=> d!81177 m!511587))

(declare-fun m!511593 () Bool)

(assert (=> d!81177 m!511593))

(declare-fun m!511595 () Bool)

(assert (=> b!531087 m!511595))

(declare-fun m!511597 () Bool)

(assert (=> b!531089 m!511597))

(assert (=> b!530996 d!81177))

(declare-fun d!81193 () Bool)

(assert (=> d!81193 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48236 d!81193))

(declare-fun d!81199 () Bool)

(assert (=> d!81199 (= (array_inv!11973 a!3154) (bvsge (size!16541 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48236 d!81199))

(declare-fun d!81201 () Bool)

(declare-fun res!326758 () Bool)

(declare-fun e!309350 () Bool)

(assert (=> d!81201 (=> res!326758 e!309350)))

(assert (=> d!81201 (= res!326758 (= (select (arr!16177 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81201 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309350)))

(declare-fun b!531100 () Bool)

(declare-fun e!309351 () Bool)

(assert (=> b!531100 (= e!309350 e!309351)))

(declare-fun res!326759 () Bool)

(assert (=> b!531100 (=> (not res!326759) (not e!309351))))

(assert (=> b!531100 (= res!326759 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16541 a!3154)))))

(declare-fun b!531101 () Bool)

(assert (=> b!531101 (= e!309351 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81201 (not res!326758)) b!531100))

(assert (= (and b!531100 res!326759) b!531101))

(assert (=> d!81201 m!511547))

(declare-fun m!511603 () Bool)

(assert (=> b!531101 m!511603))

(assert (=> b!531001 d!81201))

(check-sat (not b!531089) (not d!81177) (not bm!31934) (not b!531034) (not b!531035) (not b!531101))
(check-sat)
