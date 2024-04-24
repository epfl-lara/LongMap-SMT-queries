; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!48268 () Bool)

(assert start!48268)

(declare-fun b!531087 () Bool)

(declare-fun e!309337 () Bool)

(declare-datatypes ((List!10200 0))(
  ( (Nil!10197) (Cons!10196 (h!11136 (_ BitVec 64)) (t!16420 List!10200)) )
))
(declare-fun noDuplicate!217 (List!10200) Bool)

(assert (=> b!531087 (= e!309337 (not (noDuplicate!217 Nil!10197)))))

(declare-fun b!531088 () Bool)

(declare-fun res!326782 () Bool)

(declare-fun e!309339 () Bool)

(assert (=> b!531088 (=> (not res!326782) (not e!309339))))

(declare-datatypes ((array!33659 0))(
  ( (array!33660 (arr!16174 (Array (_ BitVec 32) (_ BitVec 64))) (size!16538 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!33659)

(declare-fun j!147 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!531088 (= res!326782 (validKeyInArray!0 (select (arr!16174 a!3154) j!147)))))

(declare-fun b!531089 () Bool)

(declare-fun res!326781 () Bool)

(assert (=> b!531089 (=> (not res!326781) (not e!309339))))

(declare-fun k0!1998 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!33659 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!531089 (= res!326781 (not (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000)))))

(declare-fun b!531090 () Bool)

(assert (=> b!531090 (= e!309339 e!309337)))

(declare-fun res!326780 () Bool)

(assert (=> b!531090 (=> (not res!326780) (not e!309337))))

(declare-datatypes ((SeekEntryResult!4588 0))(
  ( (MissingZero!4588 (index!20576 (_ BitVec 32))) (Found!4588 (index!20577 (_ BitVec 32))) (Intermediate!4588 (undefined!5400 Bool) (index!20578 (_ BitVec 32)) (x!49703 (_ BitVec 32))) (Undefined!4588) (MissingVacant!4588 (index!20579 (_ BitVec 32))) )
))
(declare-fun lt!244906 () SeekEntryResult!4588)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!531090 (= res!326780 (or (= lt!244906 (MissingZero!4588 i!1153)) (= lt!244906 (MissingVacant!4588 i!1153))))))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!33659 (_ BitVec 32)) SeekEntryResult!4588)

(assert (=> b!531090 (= lt!244906 (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216))))

(declare-fun b!531091 () Bool)

(declare-fun res!326775 () Bool)

(assert (=> b!531091 (=> (not res!326775) (not e!309339))))

(assert (=> b!531091 (= res!326775 (and (= (size!16538 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16538 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16538 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!531092 () Bool)

(declare-fun res!326777 () Bool)

(assert (=> b!531092 (=> (not res!326777) (not e!309337))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!33659 (_ BitVec 32)) Bool)

(assert (=> b!531092 (= res!326777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!531093 () Bool)

(declare-fun res!326776 () Bool)

(assert (=> b!531093 (=> (not res!326776) (not e!309339))))

(assert (=> b!531093 (= res!326776 (validKeyInArray!0 k0!1998))))

(declare-fun res!326779 () Bool)

(assert (=> start!48268 (=> (not res!326779) (not e!309339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!48268 (= res!326779 (validMask!0 mask!3216))))

(assert (=> start!48268 e!309339))

(assert (=> start!48268 true))

(declare-fun array_inv!12033 (array!33659) Bool)

(assert (=> start!48268 (array_inv!12033 a!3154)))

(declare-fun b!531094 () Bool)

(declare-fun res!326778 () Bool)

(assert (=> b!531094 (=> (not res!326778) (not e!309337))))

(assert (=> b!531094 (= res!326778 (and (bvsle #b00000000000000000000000000000000 (size!16538 a!3154)) (bvslt (size!16538 a!3154) #b01111111111111111111111111111111)))))

(assert (= (and start!48268 res!326779) b!531091))

(assert (= (and b!531091 res!326775) b!531088))

(assert (= (and b!531088 res!326782) b!531093))

(assert (= (and b!531093 res!326776) b!531089))

(assert (= (and b!531089 res!326781) b!531090))

(assert (= (and b!531090 res!326780) b!531092))

(assert (= (and b!531092 res!326777) b!531094))

(assert (= (and b!531094 res!326778) b!531087))

(declare-fun m!511813 () Bool)

(assert (=> b!531087 m!511813))

(declare-fun m!511815 () Bool)

(assert (=> b!531093 m!511815))

(declare-fun m!511817 () Bool)

(assert (=> b!531089 m!511817))

(declare-fun m!511819 () Bool)

(assert (=> b!531092 m!511819))

(declare-fun m!511821 () Bool)

(assert (=> b!531088 m!511821))

(assert (=> b!531088 m!511821))

(declare-fun m!511823 () Bool)

(assert (=> b!531088 m!511823))

(declare-fun m!511825 () Bool)

(assert (=> b!531090 m!511825))

(declare-fun m!511827 () Bool)

(assert (=> start!48268 m!511827))

(declare-fun m!511829 () Bool)

(assert (=> start!48268 m!511829))

(check-sat (not start!48268) (not b!531087) (not b!531092) (not b!531089) (not b!531093) (not b!531090) (not b!531088))
(check-sat)
(get-model)

(declare-fun d!81245 () Bool)

(declare-fun res!326835 () Bool)

(declare-fun e!309362 () Bool)

(assert (=> d!81245 (=> res!326835 e!309362)))

(assert (=> d!81245 (= res!326835 (= (select (arr!16174 a!3154) #b00000000000000000000000000000000) k0!1998))))

(assert (=> d!81245 (= (arrayContainsKey!0 a!3154 k0!1998 #b00000000000000000000000000000000) e!309362)))

(declare-fun b!531147 () Bool)

(declare-fun e!309363 () Bool)

(assert (=> b!531147 (= e!309362 e!309363)))

(declare-fun res!326836 () Bool)

(assert (=> b!531147 (=> (not res!326836) (not e!309363))))

(assert (=> b!531147 (= res!326836 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16538 a!3154)))))

(declare-fun b!531148 () Bool)

(assert (=> b!531148 (= e!309363 (arrayContainsKey!0 a!3154 k0!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81245 (not res!326835)) b!531147))

(assert (= (and b!531147 res!326836) b!531148))

(declare-fun m!511867 () Bool)

(assert (=> d!81245 m!511867))

(declare-fun m!511869 () Bool)

(assert (=> b!531148 m!511869))

(assert (=> b!531089 d!81245))

(declare-fun e!309384 () SeekEntryResult!4588)

(declare-fun b!531179 () Bool)

(declare-fun lt!244927 () SeekEntryResult!4588)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33659 (_ BitVec 32)) SeekEntryResult!4588)

(assert (=> b!531179 (= e!309384 (seekKeyOrZeroReturnVacant!0 (x!49703 lt!244927) (index!20578 lt!244927) (index!20578 lt!244927) k0!1998 a!3154 mask!3216))))

(declare-fun b!531180 () Bool)

(declare-fun e!309382 () SeekEntryResult!4588)

(declare-fun e!309383 () SeekEntryResult!4588)

(assert (=> b!531180 (= e!309382 e!309383)))

(declare-fun lt!244926 () (_ BitVec 64))

(assert (=> b!531180 (= lt!244926 (select (arr!16174 a!3154) (index!20578 lt!244927)))))

(declare-fun c!62478 () Bool)

(assert (=> b!531180 (= c!62478 (= lt!244926 k0!1998))))

(declare-fun b!531181 () Bool)

(assert (=> b!531181 (= e!309383 (Found!4588 (index!20578 lt!244927)))))

(declare-fun b!531182 () Bool)

(declare-fun c!62480 () Bool)

(assert (=> b!531182 (= c!62480 (= lt!244926 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!531182 (= e!309383 e!309384)))

(declare-fun b!531183 () Bool)

(assert (=> b!531183 (= e!309382 Undefined!4588)))

(declare-fun d!81247 () Bool)

(declare-fun lt!244925 () SeekEntryResult!4588)

(get-info :version)

(assert (=> d!81247 (and (or ((_ is Undefined!4588) lt!244925) (not ((_ is Found!4588) lt!244925)) (and (bvsge (index!20577 lt!244925) #b00000000000000000000000000000000) (bvslt (index!20577 lt!244925) (size!16538 a!3154)))) (or ((_ is Undefined!4588) lt!244925) ((_ is Found!4588) lt!244925) (not ((_ is MissingZero!4588) lt!244925)) (and (bvsge (index!20576 lt!244925) #b00000000000000000000000000000000) (bvslt (index!20576 lt!244925) (size!16538 a!3154)))) (or ((_ is Undefined!4588) lt!244925) ((_ is Found!4588) lt!244925) ((_ is MissingZero!4588) lt!244925) (not ((_ is MissingVacant!4588) lt!244925)) (and (bvsge (index!20579 lt!244925) #b00000000000000000000000000000000) (bvslt (index!20579 lt!244925) (size!16538 a!3154)))) (or ((_ is Undefined!4588) lt!244925) (ite ((_ is Found!4588) lt!244925) (= (select (arr!16174 a!3154) (index!20577 lt!244925)) k0!1998) (ite ((_ is MissingZero!4588) lt!244925) (= (select (arr!16174 a!3154) (index!20576 lt!244925)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!4588) lt!244925) (= (select (arr!16174 a!3154) (index!20579 lt!244925)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!81247 (= lt!244925 e!309382)))

(declare-fun c!62479 () Bool)

(assert (=> d!81247 (= c!62479 (and ((_ is Intermediate!4588) lt!244927) (undefined!5400 lt!244927)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!33659 (_ BitVec 32)) SeekEntryResult!4588)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!81247 (= lt!244927 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!1998 mask!3216) k0!1998 a!3154 mask!3216))))

(assert (=> d!81247 (validMask!0 mask!3216)))

(assert (=> d!81247 (= (seekEntryOrOpen!0 k0!1998 a!3154 mask!3216) lt!244925)))

(declare-fun b!531184 () Bool)

(assert (=> b!531184 (= e!309384 (MissingZero!4588 (index!20578 lt!244927)))))

(assert (= (and d!81247 c!62479) b!531183))

(assert (= (and d!81247 (not c!62479)) b!531180))

(assert (= (and b!531180 c!62478) b!531181))

(assert (= (and b!531180 (not c!62478)) b!531182))

(assert (= (and b!531182 c!62480) b!531184))

(assert (= (and b!531182 (not c!62480)) b!531179))

(declare-fun m!511875 () Bool)

(assert (=> b!531179 m!511875))

(declare-fun m!511877 () Bool)

(assert (=> b!531180 m!511877))

(assert (=> d!81247 m!511827))

(declare-fun m!511879 () Bool)

(assert (=> d!81247 m!511879))

(declare-fun m!511881 () Bool)

(assert (=> d!81247 m!511881))

(declare-fun m!511883 () Bool)

(assert (=> d!81247 m!511883))

(assert (=> d!81247 m!511881))

(declare-fun m!511885 () Bool)

(assert (=> d!81247 m!511885))

(declare-fun m!511887 () Bool)

(assert (=> d!81247 m!511887))

(assert (=> b!531090 d!81247))

(declare-fun b!531211 () Bool)

(declare-fun e!309405 () Bool)

(declare-fun e!309403 () Bool)

(assert (=> b!531211 (= e!309405 e!309403)))

(declare-fun c!62489 () Bool)

(assert (=> b!531211 (= c!62489 (validKeyInArray!0 (select (arr!16174 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81261 () Bool)

(declare-fun res!326853 () Bool)

(assert (=> d!81261 (=> res!326853 e!309405)))

(assert (=> d!81261 (= res!326853 (bvsge #b00000000000000000000000000000000 (size!16538 a!3154)))))

(assert (=> d!81261 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!309405)))

(declare-fun b!531212 () Bool)

(declare-fun e!309404 () Bool)

(assert (=> b!531212 (= e!309403 e!309404)))

(declare-fun lt!244947 () (_ BitVec 64))

(assert (=> b!531212 (= lt!244947 (select (arr!16174 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16795 0))(
  ( (Unit!16796) )
))
(declare-fun lt!244948 () Unit!16795)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!33659 (_ BitVec 64) (_ BitVec 32)) Unit!16795)

(assert (=> b!531212 (= lt!244948 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!244947 #b00000000000000000000000000000000))))

(assert (=> b!531212 (arrayContainsKey!0 a!3154 lt!244947 #b00000000000000000000000000000000)))

(declare-fun lt!244946 () Unit!16795)

(assert (=> b!531212 (= lt!244946 lt!244948)))

(declare-fun res!326854 () Bool)

(assert (=> b!531212 (= res!326854 (= (seekEntryOrOpen!0 (select (arr!16174 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4588 #b00000000000000000000000000000000)))))

(assert (=> b!531212 (=> (not res!326854) (not e!309404))))

(declare-fun b!531213 () Bool)

(declare-fun call!31935 () Bool)

(assert (=> b!531213 (= e!309404 call!31935)))

(declare-fun b!531214 () Bool)

(assert (=> b!531214 (= e!309403 call!31935)))

(declare-fun bm!31932 () Bool)

(assert (=> bm!31932 (= call!31935 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(assert (= (and d!81261 (not res!326853)) b!531211))

(assert (= (and b!531211 c!62489) b!531212))

(assert (= (and b!531211 (not c!62489)) b!531214))

(assert (= (and b!531212 res!326854) b!531213))

(assert (= (or b!531213 b!531214) bm!31932))

(assert (=> b!531211 m!511867))

(assert (=> b!531211 m!511867))

(declare-fun m!511913 () Bool)

(assert (=> b!531211 m!511913))

(assert (=> b!531212 m!511867))

(declare-fun m!511915 () Bool)

(assert (=> b!531212 m!511915))

(declare-fun m!511917 () Bool)

(assert (=> b!531212 m!511917))

(assert (=> b!531212 m!511867))

(declare-fun m!511919 () Bool)

(assert (=> b!531212 m!511919))

(declare-fun m!511921 () Bool)

(assert (=> bm!31932 m!511921))

(assert (=> b!531092 d!81261))

(declare-fun d!81267 () Bool)

(assert (=> d!81267 (= (validMask!0 mask!3216) (and (or (= mask!3216 #b00000000000000000000000000000111) (= mask!3216 #b00000000000000000000000000001111) (= mask!3216 #b00000000000000000000000000011111) (= mask!3216 #b00000000000000000000000000111111) (= mask!3216 #b00000000000000000000000001111111) (= mask!3216 #b00000000000000000000000011111111) (= mask!3216 #b00000000000000000000000111111111) (= mask!3216 #b00000000000000000000001111111111) (= mask!3216 #b00000000000000000000011111111111) (= mask!3216 #b00000000000000000000111111111111) (= mask!3216 #b00000000000000000001111111111111) (= mask!3216 #b00000000000000000011111111111111) (= mask!3216 #b00000000000000000111111111111111) (= mask!3216 #b00000000000000001111111111111111) (= mask!3216 #b00000000000000011111111111111111) (= mask!3216 #b00000000000000111111111111111111) (= mask!3216 #b00000000000001111111111111111111) (= mask!3216 #b00000000000011111111111111111111) (= mask!3216 #b00000000000111111111111111111111) (= mask!3216 #b00000000001111111111111111111111) (= mask!3216 #b00000000011111111111111111111111) (= mask!3216 #b00000000111111111111111111111111) (= mask!3216 #b00000001111111111111111111111111) (= mask!3216 #b00000011111111111111111111111111) (= mask!3216 #b00000111111111111111111111111111) (= mask!3216 #b00001111111111111111111111111111) (= mask!3216 #b00011111111111111111111111111111) (= mask!3216 #b00111111111111111111111111111111)) (bvsle mask!3216 #b00111111111111111111111111111111)))))

(assert (=> start!48268 d!81267))

(declare-fun d!81273 () Bool)

(assert (=> d!81273 (= (array_inv!12033 a!3154) (bvsge (size!16538 a!3154) #b00000000000000000000000000000000))))

(assert (=> start!48268 d!81273))

(declare-fun d!81275 () Bool)

(declare-fun res!326863 () Bool)

(declare-fun e!309416 () Bool)

(assert (=> d!81275 (=> res!326863 e!309416)))

(assert (=> d!81275 (= res!326863 ((_ is Nil!10197) Nil!10197))))

(assert (=> d!81275 (= (noDuplicate!217 Nil!10197) e!309416)))

(declare-fun b!531227 () Bool)

(declare-fun e!309417 () Bool)

(assert (=> b!531227 (= e!309416 e!309417)))

(declare-fun res!326864 () Bool)

(assert (=> b!531227 (=> (not res!326864) (not e!309417))))

(declare-fun contains!2759 (List!10200 (_ BitVec 64)) Bool)

(assert (=> b!531227 (= res!326864 (not (contains!2759 (t!16420 Nil!10197) (h!11136 Nil!10197))))))

(declare-fun b!531228 () Bool)

(assert (=> b!531228 (= e!309417 (noDuplicate!217 (t!16420 Nil!10197)))))

(assert (= (and d!81275 (not res!326863)) b!531227))

(assert (= (and b!531227 res!326864) b!531228))

(declare-fun m!511923 () Bool)

(assert (=> b!531227 m!511923))

(declare-fun m!511925 () Bool)

(assert (=> b!531228 m!511925))

(assert (=> b!531087 d!81275))

(declare-fun d!81277 () Bool)

(assert (=> d!81277 (= (validKeyInArray!0 (select (arr!16174 a!3154) j!147)) (and (not (= (select (arr!16174 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16174 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531088 d!81277))

(declare-fun d!81281 () Bool)

(assert (=> d!81281 (= (validKeyInArray!0 k0!1998) (and (not (= k0!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!531093 d!81281))

(check-sat (not b!531211) (not b!531179) (not b!531212) (not bm!31932) (not b!531148) (not d!81247) (not b!531227) (not b!531228))
(check-sat)
