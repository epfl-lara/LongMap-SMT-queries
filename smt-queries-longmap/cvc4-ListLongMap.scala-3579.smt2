; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!49210 () Bool)

(assert start!49210)

(declare-fun b!541962 () Bool)

(declare-fun res!336693 () Bool)

(declare-fun e!313721 () Bool)

(assert (=> b!541962 (=> (not res!336693) (not e!313721))))

(declare-fun index!1177 () (_ BitVec 32))

(declare-fun resIndex!32 () (_ BitVec 32))

(declare-fun j!147 () (_ BitVec 32))

(declare-datatypes ((array!34269 0))(
  ( (array!34270 (arr!16469 (Array (_ BitVec 32) (_ BitVec 64))) (size!16833 (_ BitVec 32))) )
))
(declare-fun a!3154 () array!34269)

(assert (=> b!541962 (= res!336693 (and (not (= (select (arr!16469 a!3154) index!1177) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16469 a!3154) index!1177) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (select (arr!16469 a!3154) index!1177) (select (arr!16469 a!3154) j!147)) (= index!1177 resIndex!32)))))

(declare-fun b!541963 () Bool)

(declare-fun e!313719 () Bool)

(assert (=> b!541963 (= e!313719 e!313721)))

(declare-fun res!336700 () Bool)

(assert (=> b!541963 (=> (not res!336700) (not e!313721))))

(declare-datatypes ((SeekEntryResult!4927 0))(
  ( (MissingZero!4927 (index!21932 (_ BitVec 32))) (Found!4927 (index!21933 (_ BitVec 32))) (Intermediate!4927 (undefined!5739 Bool) (index!21934 (_ BitVec 32)) (x!50840 (_ BitVec 32))) (Undefined!4927) (MissingVacant!4927 (index!21935 (_ BitVec 32))) )
))
(declare-fun lt!247774 () SeekEntryResult!4927)

(declare-fun lt!247773 () SeekEntryResult!4927)

(assert (=> b!541963 (= res!336700 (= lt!247774 lt!247773))))

(declare-fun resX!32 () (_ BitVec 32))

(assert (=> b!541963 (= lt!247773 (Intermediate!4927 false resIndex!32 resX!32))))

(declare-fun x!1030 () (_ BitVec 32))

(declare-fun mask!3216 () (_ BitVec 32))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34269 (_ BitVec 32)) SeekEntryResult!4927)

(assert (=> b!541963 (= lt!247774 (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16469 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!541964 () Bool)

(declare-fun res!336690 () Bool)

(assert (=> b!541964 (=> (not res!336690) (not e!313719))))

(assert (=> b!541964 (= res!336690 (and (bvsle resX!32 #b01111111111111111111111111111110) (bvsle x!1030 resX!32) (bvsge x!1030 #b00000000000000000000000000000000) (bvsge index!1177 #b00000000000000000000000000000000) (bvslt index!1177 (size!16833 a!3154)) (bvsge resIndex!32 #b00000000000000000000000000000000) (bvslt resIndex!32 (size!16833 a!3154)) (= (select (arr!16469 a!3154) resIndex!32) (select (arr!16469 a!3154) j!147))))))

(declare-fun k!1998 () (_ BitVec 64))

(declare-fun b!541965 () Bool)

(declare-fun i!1153 () (_ BitVec 32))

(assert (=> b!541965 (= e!313721 (not (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16469 a!3154) i!1153 k!1998) j!147) (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154)) mask!3216) lt!247773)))))

(declare-fun b!541966 () Bool)

(declare-fun res!336698 () Bool)

(declare-fun e!313720 () Bool)

(assert (=> b!541966 (=> (not res!336698) (not e!313720))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!541966 (= res!336698 (validKeyInArray!0 k!1998))))

(declare-fun b!541967 () Bool)

(declare-fun res!336697 () Bool)

(assert (=> b!541967 (=> (not res!336697) (not e!313719))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!34269 (_ BitVec 32)) Bool)

(assert (=> b!541967 (= res!336697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216))))

(declare-fun b!541968 () Bool)

(declare-fun res!336691 () Bool)

(assert (=> b!541968 (=> (not res!336691) (not e!313720))))

(declare-fun arrayContainsKey!0 (array!34269 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!541968 (= res!336691 (not (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000)))))

(declare-fun b!541969 () Bool)

(declare-fun res!336694 () Bool)

(assert (=> b!541969 (=> (not res!336694) (not e!313719))))

(declare-datatypes ((List!10588 0))(
  ( (Nil!10585) (Cons!10584 (h!11536 (_ BitVec 64)) (t!16816 List!10588)) )
))
(declare-fun arrayNoDuplicates!0 (array!34269 (_ BitVec 32) List!10588) Bool)

(assert (=> b!541969 (= res!336694 (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10585))))

(declare-fun b!541970 () Bool)

(assert (=> b!541970 (= e!313720 e!313719)))

(declare-fun res!336701 () Bool)

(assert (=> b!541970 (=> (not res!336701) (not e!313719))))

(declare-fun lt!247772 () SeekEntryResult!4927)

(assert (=> b!541970 (= res!336701 (or (= lt!247772 (MissingZero!4927 i!1153)) (= lt!247772 (MissingVacant!4927 i!1153))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!34269 (_ BitVec 32)) SeekEntryResult!4927)

(assert (=> b!541970 (= lt!247772 (seekEntryOrOpen!0 k!1998 a!3154 mask!3216))))

(declare-fun b!541971 () Bool)

(declare-fun res!336692 () Bool)

(assert (=> b!541971 (=> (not res!336692) (not e!313721))))

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!541971 (= res!336692 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16469 a!3154) j!147) mask!3216) (select (arr!16469 a!3154) j!147) a!3154 mask!3216) lt!247774))))

(declare-fun res!336699 () Bool)

(assert (=> start!49210 (=> (not res!336699) (not e!313720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!49210 (= res!336699 (validMask!0 mask!3216))))

(assert (=> start!49210 e!313720))

(assert (=> start!49210 true))

(declare-fun array_inv!12265 (array!34269) Bool)

(assert (=> start!49210 (array_inv!12265 a!3154)))

(declare-fun b!541972 () Bool)

(declare-fun res!336695 () Bool)

(assert (=> b!541972 (=> (not res!336695) (not e!313720))))

(assert (=> b!541972 (= res!336695 (and (= (size!16833 a!3154) (bvadd #b00000000000000000000000000000001 mask!3216)) (bvsge i!1153 #b00000000000000000000000000000000) (bvslt i!1153 (size!16833 a!3154)) (bvsge j!147 #b00000000000000000000000000000000) (bvslt j!147 (size!16833 a!3154)) (not (= i!1153 j!147))))))

(declare-fun b!541973 () Bool)

(declare-fun res!336696 () Bool)

(assert (=> b!541973 (=> (not res!336696) (not e!313720))))

(assert (=> b!541973 (= res!336696 (validKeyInArray!0 (select (arr!16469 a!3154) j!147)))))

(assert (= (and start!49210 res!336699) b!541972))

(assert (= (and b!541972 res!336695) b!541973))

(assert (= (and b!541973 res!336696) b!541966))

(assert (= (and b!541966 res!336698) b!541968))

(assert (= (and b!541968 res!336691) b!541970))

(assert (= (and b!541970 res!336701) b!541967))

(assert (= (and b!541967 res!336697) b!541969))

(assert (= (and b!541969 res!336694) b!541964))

(assert (= (and b!541964 res!336690) b!541963))

(assert (= (and b!541963 res!336700) b!541971))

(assert (= (and b!541971 res!336692) b!541962))

(assert (= (and b!541962 res!336693) b!541965))

(declare-fun m!520379 () Bool)

(assert (=> b!541965 m!520379))

(declare-fun m!520381 () Bool)

(assert (=> b!541965 m!520381))

(assert (=> b!541965 m!520381))

(declare-fun m!520383 () Bool)

(assert (=> b!541965 m!520383))

(declare-fun m!520385 () Bool)

(assert (=> b!541971 m!520385))

(assert (=> b!541971 m!520385))

(declare-fun m!520387 () Bool)

(assert (=> b!541971 m!520387))

(assert (=> b!541971 m!520387))

(assert (=> b!541971 m!520385))

(declare-fun m!520389 () Bool)

(assert (=> b!541971 m!520389))

(assert (=> b!541973 m!520385))

(assert (=> b!541973 m!520385))

(declare-fun m!520391 () Bool)

(assert (=> b!541973 m!520391))

(declare-fun m!520393 () Bool)

(assert (=> b!541964 m!520393))

(assert (=> b!541964 m!520385))

(assert (=> b!541963 m!520385))

(assert (=> b!541963 m!520385))

(declare-fun m!520395 () Bool)

(assert (=> b!541963 m!520395))

(declare-fun m!520397 () Bool)

(assert (=> b!541966 m!520397))

(declare-fun m!520399 () Bool)

(assert (=> b!541969 m!520399))

(declare-fun m!520401 () Bool)

(assert (=> b!541967 m!520401))

(declare-fun m!520403 () Bool)

(assert (=> b!541970 m!520403))

(declare-fun m!520405 () Bool)

(assert (=> start!49210 m!520405))

(declare-fun m!520407 () Bool)

(assert (=> start!49210 m!520407))

(declare-fun m!520409 () Bool)

(assert (=> b!541968 m!520409))

(declare-fun m!520411 () Bool)

(assert (=> b!541962 m!520411))

(assert (=> b!541962 m!520385))

(push 1)

(assert (not b!541963))

(assert (not b!541969))

(assert (not start!49210))

(assert (not b!541971))

(assert (not b!541967))

(assert (not b!541973))

(assert (not b!541965))

(assert (not b!541968))

(assert (not b!541966))

(assert (not b!541970))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!81841 () Bool)

(assert (=> d!81841 (= (validKeyInArray!0 k!1998) (and (not (= k!1998 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1998 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541966 d!81841))

(declare-fun b!542090 () Bool)

(declare-fun e!313800 () Bool)

(declare-fun call!32063 () Bool)

(assert (=> b!542090 (= e!313800 call!32063)))

(declare-fun b!542091 () Bool)

(declare-fun e!313799 () Bool)

(assert (=> b!542091 (= e!313799 e!313800)))

(declare-fun lt!247825 () (_ BitVec 64))

(assert (=> b!542091 (= lt!247825 (select (arr!16469 a!3154) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!16902 0))(
  ( (Unit!16903) )
))
(declare-fun lt!247824 () Unit!16902)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!34269 (_ BitVec 64) (_ BitVec 32)) Unit!16902)

(assert (=> b!542091 (= lt!247824 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3154 lt!247825 #b00000000000000000000000000000000))))

(assert (=> b!542091 (arrayContainsKey!0 a!3154 lt!247825 #b00000000000000000000000000000000)))

(declare-fun lt!247826 () Unit!16902)

(assert (=> b!542091 (= lt!247826 lt!247824)))

(declare-fun res!336750 () Bool)

(assert (=> b!542091 (= res!336750 (= (seekEntryOrOpen!0 (select (arr!16469 a!3154) #b00000000000000000000000000000000) a!3154 mask!3216) (Found!4927 #b00000000000000000000000000000000)))))

(assert (=> b!542091 (=> (not res!336750) (not e!313800))))

(declare-fun bm!32060 () Bool)

(assert (=> bm!32060 (= call!32063 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3154 mask!3216))))

(declare-fun b!542092 () Bool)

(assert (=> b!542092 (= e!313799 call!32063)))

(declare-fun b!542093 () Bool)

(declare-fun e!313801 () Bool)

(assert (=> b!542093 (= e!313801 e!313799)))

(declare-fun c!62987 () Bool)

(assert (=> b!542093 (= c!62987 (validKeyInArray!0 (select (arr!16469 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81843 () Bool)

(declare-fun res!336749 () Bool)

(assert (=> d!81843 (=> res!336749 e!313801)))

(assert (=> d!81843 (= res!336749 (bvsge #b00000000000000000000000000000000 (size!16833 a!3154)))))

(assert (=> d!81843 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3154 mask!3216) e!313801)))

(assert (= (and d!81843 (not res!336749)) b!542093))

(assert (= (and b!542093 c!62987) b!542091))

(assert (= (and b!542093 (not c!62987)) b!542092))

(assert (= (and b!542091 res!336750) b!542090))

(assert (= (or b!542090 b!542092) bm!32060))

(declare-fun m!520477 () Bool)

(assert (=> b!542091 m!520477))

(declare-fun m!520479 () Bool)

(assert (=> b!542091 m!520479))

(declare-fun m!520481 () Bool)

(assert (=> b!542091 m!520481))

(assert (=> b!542091 m!520477))

(declare-fun m!520483 () Bool)

(assert (=> b!542091 m!520483))

(declare-fun m!520485 () Bool)

(assert (=> bm!32060 m!520485))

(assert (=> b!542093 m!520477))

(assert (=> b!542093 m!520477))

(declare-fun m!520487 () Bool)

(assert (=> b!542093 m!520487))

(assert (=> b!541967 d!81843))

(declare-fun d!81853 () Bool)

(assert (=> d!81853 (= (validKeyInArray!0 (select (arr!16469 a!3154) j!147)) (and (not (= (select (arr!16469 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!16469 a!3154) j!147) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!541973 d!81853))

(declare-fun d!81855 () Bool)

(declare-fun e!313837 () Bool)

(assert (=> d!81855 e!313837))

(declare-fun c!63005 () Bool)

(declare-fun lt!247838 () SeekEntryResult!4927)

(assert (=> d!81855 (= c!63005 (and (is-Intermediate!4927 lt!247838) (undefined!5739 lt!247838)))))

(declare-fun e!313835 () SeekEntryResult!4927)

(assert (=> d!81855 (= lt!247838 e!313835)))

(declare-fun c!63003 () Bool)

(assert (=> d!81855 (= c!63003 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!247837 () (_ BitVec 64))

(assert (=> d!81855 (= lt!247837 (select (arr!16469 a!3154) index!1177))))

(assert (=> d!81855 (validMask!0 mask!3216)))

(assert (=> d!81855 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (arr!16469 a!3154) j!147) a!3154 mask!3216) lt!247838)))

(declare-fun b!542145 () Bool)

(assert (=> b!542145 (and (bvsge (index!21934 lt!247838) #b00000000000000000000000000000000) (bvslt (index!21934 lt!247838) (size!16833 a!3154)))))

(declare-fun res!336774 () Bool)

(assert (=> b!542145 (= res!336774 (= (select (arr!16469 a!3154) (index!21934 lt!247838)) (select (arr!16469 a!3154) j!147)))))

(declare-fun e!313834 () Bool)

(assert (=> b!542145 (=> res!336774 e!313834)))

(declare-fun e!313836 () Bool)

(assert (=> b!542145 (= e!313836 e!313834)))

(declare-fun b!542146 () Bool)

(assert (=> b!542146 (= e!313837 e!313836)))

(declare-fun res!336773 () Bool)

(assert (=> b!542146 (= res!336773 (and (is-Intermediate!4927 lt!247838) (not (undefined!5739 lt!247838)) (bvslt (x!50840 lt!247838) #b01111111111111111111111111111110) (bvsge (x!50840 lt!247838) #b00000000000000000000000000000000) (bvsge (x!50840 lt!247838) x!1030)))))

(assert (=> b!542146 (=> (not res!336773) (not e!313836))))

(declare-fun e!313833 () SeekEntryResult!4927)

(declare-fun b!542147 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!542147 (= e!313833 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (arr!16469 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542148 () Bool)

(assert (=> b!542148 (= e!313835 e!313833)))

(declare-fun c!63004 () Bool)

(assert (=> b!542148 (= c!63004 (or (= lt!247837 (select (arr!16469 a!3154) j!147)) (= (bvadd lt!247837 lt!247837) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542149 () Bool)

(assert (=> b!542149 (and (bvsge (index!21934 lt!247838) #b00000000000000000000000000000000) (bvslt (index!21934 lt!247838) (size!16833 a!3154)))))

(assert (=> b!542149 (= e!313834 (= (select (arr!16469 a!3154) (index!21934 lt!247838)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!542150 () Bool)

(assert (=> b!542150 (= e!313835 (Intermediate!4927 true index!1177 x!1030))))

(declare-fun b!542151 () Bool)

(assert (=> b!542151 (= e!313833 (Intermediate!4927 false index!1177 x!1030))))

(declare-fun b!542152 () Bool)

(assert (=> b!542152 (and (bvsge (index!21934 lt!247838) #b00000000000000000000000000000000) (bvslt (index!21934 lt!247838) (size!16833 a!3154)))))

(declare-fun res!336772 () Bool)

(assert (=> b!542152 (= res!336772 (= (select (arr!16469 a!3154) (index!21934 lt!247838)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!542152 (=> res!336772 e!313834)))

(declare-fun b!542153 () Bool)

(assert (=> b!542153 (= e!313837 (bvsge (x!50840 lt!247838) #b01111111111111111111111111111110))))

(assert (= (and d!81855 c!63003) b!542150))

(assert (= (and d!81855 (not c!63003)) b!542148))

(assert (= (and b!542148 c!63004) b!542151))

(assert (= (and b!542148 (not c!63004)) b!542147))

(assert (= (and d!81855 c!63005) b!542153))

(assert (= (and d!81855 (not c!63005)) b!542146))

(assert (= (and b!542146 res!336773) b!542145))

(assert (= (and b!542145 (not res!336774)) b!542152))

(assert (= (and b!542152 (not res!336772)) b!542149))

(declare-fun m!520497 () Bool)

(assert (=> b!542149 m!520497))

(assert (=> b!542145 m!520497))

(assert (=> d!81855 m!520411))

(assert (=> d!81855 m!520405))

(declare-fun m!520499 () Bool)

(assert (=> b!542147 m!520499))

(assert (=> b!542147 m!520499))

(assert (=> b!542147 m!520385))

(declare-fun m!520501 () Bool)

(assert (=> b!542147 m!520501))

(assert (=> b!542152 m!520497))

(assert (=> b!541963 d!81855))

(declare-fun d!81861 () Bool)

(declare-fun res!336779 () Bool)

(declare-fun e!313842 () Bool)

(assert (=> d!81861 (=> res!336779 e!313842)))

(assert (=> d!81861 (= res!336779 (= (select (arr!16469 a!3154) #b00000000000000000000000000000000) k!1998))))

(assert (=> d!81861 (= (arrayContainsKey!0 a!3154 k!1998 #b00000000000000000000000000000000) e!313842)))

(declare-fun b!542158 () Bool)

(declare-fun e!313843 () Bool)

(assert (=> b!542158 (= e!313842 e!313843)))

(declare-fun res!336780 () Bool)

(assert (=> b!542158 (=> (not res!336780) (not e!313843))))

(assert (=> b!542158 (= res!336780 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!16833 a!3154)))))

(declare-fun b!542159 () Bool)

(assert (=> b!542159 (= e!313843 (arrayContainsKey!0 a!3154 k!1998 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!81861 (not res!336779)) b!542158))

(assert (= (and b!542158 res!336780) b!542159))

(assert (=> d!81861 m!520477))

(declare-fun m!520503 () Bool)

(assert (=> b!542159 m!520503))

(assert (=> b!541968 d!81861))

(declare-fun b!542170 () Bool)

(declare-fun e!313853 () Bool)

(declare-fun contains!2803 (List!10588 (_ BitVec 64)) Bool)

(assert (=> b!542170 (= e!313853 (contains!2803 Nil!10585 (select (arr!16469 a!3154) #b00000000000000000000000000000000)))))

(declare-fun bm!32063 () Bool)

(declare-fun call!32066 () Bool)

(declare-fun c!63008 () Bool)

(assert (=> bm!32063 (= call!32066 (arrayNoDuplicates!0 a!3154 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!63008 (Cons!10584 (select (arr!16469 a!3154) #b00000000000000000000000000000000) Nil!10585) Nil!10585)))))

(declare-fun b!542172 () Bool)

(declare-fun e!313852 () Bool)

(declare-fun e!313855 () Bool)

(assert (=> b!542172 (= e!313852 e!313855)))

(declare-fun res!336787 () Bool)

(assert (=> b!542172 (=> (not res!336787) (not e!313855))))

(assert (=> b!542172 (= res!336787 (not e!313853))))

(declare-fun res!336789 () Bool)

(assert (=> b!542172 (=> (not res!336789) (not e!313853))))

(assert (=> b!542172 (= res!336789 (validKeyInArray!0 (select (arr!16469 a!3154) #b00000000000000000000000000000000)))))

(declare-fun d!81863 () Bool)

(declare-fun res!336788 () Bool)

(assert (=> d!81863 (=> res!336788 e!313852)))

(assert (=> d!81863 (= res!336788 (bvsge #b00000000000000000000000000000000 (size!16833 a!3154)))))

(assert (=> d!81863 (= (arrayNoDuplicates!0 a!3154 #b00000000000000000000000000000000 Nil!10585) e!313852)))

(declare-fun b!542171 () Bool)

(declare-fun e!313854 () Bool)

(assert (=> b!542171 (= e!313855 e!313854)))

(assert (=> b!542171 (= c!63008 (validKeyInArray!0 (select (arr!16469 a!3154) #b00000000000000000000000000000000)))))

(declare-fun b!542173 () Bool)

(assert (=> b!542173 (= e!313854 call!32066)))

(declare-fun b!542174 () Bool)

(assert (=> b!542174 (= e!313854 call!32066)))

(assert (= (and d!81863 (not res!336788)) b!542172))

(assert (= (and b!542172 res!336789) b!542170))

(assert (= (and b!542172 res!336787) b!542171))

(assert (= (and b!542171 c!63008) b!542173))

(assert (= (and b!542171 (not c!63008)) b!542174))

(assert (= (or b!542173 b!542174) bm!32063))

(assert (=> b!542170 m!520477))

(assert (=> b!542170 m!520477))

(declare-fun m!520505 () Bool)

(assert (=> b!542170 m!520505))

(assert (=> bm!32063 m!520477))

(declare-fun m!520507 () Bool)

(assert (=> bm!32063 m!520507))

(assert (=> b!542172 m!520477))

(assert (=> b!542172 m!520477))

(assert (=> b!542172 m!520487))

(assert (=> b!542171 m!520477))

(assert (=> b!542171 m!520477))

(assert (=> b!542171 m!520487))

(assert (=> b!541969 d!81863))

(declare-fun d!81869 () Bool)

(declare-fun e!313860 () Bool)

(assert (=> d!81869 e!313860))

(declare-fun c!63011 () Bool)

(declare-fun lt!247840 () SeekEntryResult!4927)

(assert (=> d!81869 (= c!63011 (and (is-Intermediate!4927 lt!247840) (undefined!5739 lt!247840)))))

(declare-fun e!313858 () SeekEntryResult!4927)

(assert (=> d!81869 (= lt!247840 e!313858)))

(declare-fun c!63009 () Bool)

(assert (=> d!81869 (= c!63009 (bvsge x!1030 #b01111111111111111111111111111110))))

(declare-fun lt!247839 () (_ BitVec 64))

(assert (=> d!81869 (= lt!247839 (select (arr!16469 (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154))) index!1177))))

(assert (=> d!81869 (validMask!0 mask!3216)))

(assert (=> d!81869 (= (seekKeyOrZeroOrLongMinValue!0 x!1030 index!1177 (select (store (arr!16469 a!3154) i!1153 k!1998) j!147) (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154)) mask!3216) lt!247840)))

(declare-fun b!542175 () Bool)

(assert (=> b!542175 (and (bvsge (index!21934 lt!247840) #b00000000000000000000000000000000) (bvslt (index!21934 lt!247840) (size!16833 (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154)))))))

(declare-fun res!336792 () Bool)

(assert (=> b!542175 (= res!336792 (= (select (arr!16469 (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154))) (index!21934 lt!247840)) (select (store (arr!16469 a!3154) i!1153 k!1998) j!147)))))

(declare-fun e!313857 () Bool)

(assert (=> b!542175 (=> res!336792 e!313857)))

(declare-fun e!313859 () Bool)

(assert (=> b!542175 (= e!313859 e!313857)))

(declare-fun b!542176 () Bool)

(assert (=> b!542176 (= e!313860 e!313859)))

(declare-fun res!336791 () Bool)

(assert (=> b!542176 (= res!336791 (and (is-Intermediate!4927 lt!247840) (not (undefined!5739 lt!247840)) (bvslt (x!50840 lt!247840) #b01111111111111111111111111111110) (bvsge (x!50840 lt!247840) #b00000000000000000000000000000000) (bvsge (x!50840 lt!247840) x!1030)))))

(assert (=> b!542176 (=> (not res!336791) (not e!313859))))

(declare-fun e!313856 () SeekEntryResult!4927)

(declare-fun b!542177 () Bool)

(assert (=> b!542177 (= e!313856 (seekKeyOrZeroOrLongMinValue!0 (bvadd x!1030 #b00000000000000000000000000000001) (nextIndex!0 index!1177 x!1030 mask!3216) (select (store (arr!16469 a!3154) i!1153 k!1998) j!147) (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154)) mask!3216))))

(declare-fun b!542178 () Bool)

(assert (=> b!542178 (= e!313858 e!313856)))

(declare-fun c!63010 () Bool)

(assert (=> b!542178 (= c!63010 (or (= lt!247839 (select (store (arr!16469 a!3154) i!1153 k!1998) j!147)) (= (bvadd lt!247839 lt!247839) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542179 () Bool)

(assert (=> b!542179 (and (bvsge (index!21934 lt!247840) #b00000000000000000000000000000000) (bvslt (index!21934 lt!247840) (size!16833 (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154)))))))

(assert (=> b!542179 (= e!313857 (= (select (arr!16469 (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154))) (index!21934 lt!247840)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!542180 () Bool)

(assert (=> b!542180 (= e!313858 (Intermediate!4927 true index!1177 x!1030))))

(declare-fun b!542181 () Bool)

(assert (=> b!542181 (= e!313856 (Intermediate!4927 false index!1177 x!1030))))

(declare-fun b!542182 () Bool)

(assert (=> b!542182 (and (bvsge (index!21934 lt!247840) #b00000000000000000000000000000000) (bvslt (index!21934 lt!247840) (size!16833 (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154)))))))

(declare-fun res!336790 () Bool)

(assert (=> b!542182 (= res!336790 (= (select (arr!16469 (array!34270 (store (arr!16469 a!3154) i!1153 k!1998) (size!16833 a!3154))) (index!21934 lt!247840)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!542182 (=> res!336790 e!313857)))

(declare-fun b!542183 () Bool)

(assert (=> b!542183 (= e!313860 (bvsge (x!50840 lt!247840) #b01111111111111111111111111111110))))

(assert (= (and d!81869 c!63009) b!542180))

(assert (= (and d!81869 (not c!63009)) b!542178))

(assert (= (and b!542178 c!63010) b!542181))

(assert (= (and b!542178 (not c!63010)) b!542177))

(assert (= (and d!81869 c!63011) b!542183))

(assert (= (and d!81869 (not c!63011)) b!542176))

(assert (= (and b!542176 res!336791) b!542175))

(assert (= (and b!542175 (not res!336792)) b!542182))

(assert (= (and b!542182 (not res!336790)) b!542179))

(declare-fun m!520509 () Bool)

(assert (=> b!542179 m!520509))

(assert (=> b!542175 m!520509))

(declare-fun m!520511 () Bool)

(assert (=> d!81869 m!520511))

(assert (=> d!81869 m!520405))

(assert (=> b!542177 m!520499))

(assert (=> b!542177 m!520499))

(assert (=> b!542177 m!520381))

(declare-fun m!520513 () Bool)

(assert (=> b!542177 m!520513))

(assert (=> b!542182 m!520509))

(assert (=> b!541965 d!81869))

(declare-fun d!81871 () Bool)

(declare-fun lt!247859 () SeekEntryResult!4927)

(assert (=> d!81871 (and (or (is-Undefined!4927 lt!247859) (not (is-Found!4927 lt!247859)) (and (bvsge (index!21933 lt!247859) #b00000000000000000000000000000000) (bvslt (index!21933 lt!247859) (size!16833 a!3154)))) (or (is-Undefined!4927 lt!247859) (is-Found!4927 lt!247859) (not (is-MissingZero!4927 lt!247859)) (and (bvsge (index!21932 lt!247859) #b00000000000000000000000000000000) (bvslt (index!21932 lt!247859) (size!16833 a!3154)))) (or (is-Undefined!4927 lt!247859) (is-Found!4927 lt!247859) (is-MissingZero!4927 lt!247859) (not (is-MissingVacant!4927 lt!247859)) (and (bvsge (index!21935 lt!247859) #b00000000000000000000000000000000) (bvslt (index!21935 lt!247859) (size!16833 a!3154)))) (or (is-Undefined!4927 lt!247859) (ite (is-Found!4927 lt!247859) (= (select (arr!16469 a!3154) (index!21933 lt!247859)) k!1998) (ite (is-MissingZero!4927 lt!247859) (= (select (arr!16469 a!3154) (index!21932 lt!247859)) #b0000000000000000000000000000000000000000000000000000000000000000) (and (is-MissingVacant!4927 lt!247859) (= (select (arr!16469 a!3154) (index!21935 lt!247859)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!313882 () SeekEntryResult!4927)

(assert (=> d!81871 (= lt!247859 e!313882)))

(declare-fun c!63032 () Bool)

(declare-fun lt!247858 () SeekEntryResult!4927)

(assert (=> d!81871 (= c!63032 (and (is-Intermediate!4927 lt!247858) (undefined!5739 lt!247858)))))

(assert (=> d!81871 (= lt!247858 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k!1998 mask!3216) k!1998 a!3154 mask!3216))))

(assert (=> d!81871 (validMask!0 mask!3216)))

(assert (=> d!81871 (= (seekEntryOrOpen!0 k!1998 a!3154 mask!3216) lt!247859)))

(declare-fun b!542223 () Bool)

(declare-fun e!313881 () SeekEntryResult!4927)

(assert (=> b!542223 (= e!313881 (Found!4927 (index!21934 lt!247858)))))

(declare-fun b!542224 () Bool)

(declare-fun e!313883 () SeekEntryResult!4927)

(assert (=> b!542224 (= e!313883 (MissingZero!4927 (index!21934 lt!247858)))))

(declare-fun b!542225 () Bool)

(declare-fun c!63030 () Bool)

(declare-fun lt!247860 () (_ BitVec 64))

(assert (=> b!542225 (= c!63030 (= lt!247860 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!542225 (= e!313881 e!313883)))

(declare-fun b!542226 () Bool)

(assert (=> b!542226 (= e!313882 e!313881)))

(assert (=> b!542226 (= lt!247860 (select (arr!16469 a!3154) (index!21934 lt!247858)))))

(declare-fun c!63031 () Bool)

(assert (=> b!542226 (= c!63031 (= lt!247860 k!1998))))

(declare-fun b!542227 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!34269 (_ BitVec 32)) SeekEntryResult!4927)

(assert (=> b!542227 (= e!313883 (seekKeyOrZeroReturnVacant!0 (x!50840 lt!247858) (index!21934 lt!247858) (index!21934 lt!247858) k!1998 a!3154 mask!3216))))

(declare-fun b!542228 () Bool)

(assert (=> b!542228 (= e!313882 Undefined!4927)))

(assert (= (and d!81871 c!63032) b!542228))

(assert (= (and d!81871 (not c!63032)) b!542226))

(assert (= (and b!542226 c!63031) b!542223))

(assert (= (and b!542226 (not c!63031)) b!542225))

(assert (= (and b!542225 c!63030) b!542224))

(assert (= (and b!542225 (not c!63030)) b!542227))

(declare-fun m!520537 () Bool)

(assert (=> d!81871 m!520537))

(assert (=> d!81871 m!520537))

(declare-fun m!520539 () Bool)

(assert (=> d!81871 m!520539))

(declare-fun m!520541 () Bool)

(assert (=> d!81871 m!520541))

(declare-fun m!520543 () Bool)

(assert (=> d!81871 m!520543))

(declare-fun m!520545 () Bool)

(assert (=> d!81871 m!520545))

(assert (=> d!81871 m!520405))

(declare-fun m!520547 () Bool)

(assert (=> b!542226 m!520547))

(declare-fun m!520549 () Bool)

(assert (=> b!542227 m!520549))

(assert (=> b!541970 d!81871))

(declare-fun d!81877 () Bool)

(declare-fun e!313888 () Bool)

(assert (=> d!81877 e!313888))

(declare-fun c!63035 () Bool)

(declare-fun lt!247862 () SeekEntryResult!4927)

(assert (=> d!81877 (= c!63035 (and (is-Intermediate!4927 lt!247862) (undefined!5739 lt!247862)))))

(declare-fun e!313886 () SeekEntryResult!4927)

(assert (=> d!81877 (= lt!247862 e!313886)))

(declare-fun c!63033 () Bool)

(assert (=> d!81877 (= c!63033 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(declare-fun lt!247861 () (_ BitVec 64))

(assert (=> d!81877 (= lt!247861 (select (arr!16469 a!3154) (toIndex!0 (select (arr!16469 a!3154) j!147) mask!3216)))))

(assert (=> d!81877 (validMask!0 mask!3216)))

(assert (=> d!81877 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!16469 a!3154) j!147) mask!3216) (select (arr!16469 a!3154) j!147) a!3154 mask!3216) lt!247862)))

(declare-fun b!542229 () Bool)

(assert (=> b!542229 (and (bvsge (index!21934 lt!247862) #b00000000000000000000000000000000) (bvslt (index!21934 lt!247862) (size!16833 a!3154)))))

(declare-fun res!336799 () Bool)

(assert (=> b!542229 (= res!336799 (= (select (arr!16469 a!3154) (index!21934 lt!247862)) (select (arr!16469 a!3154) j!147)))))

(declare-fun e!313885 () Bool)

(assert (=> b!542229 (=> res!336799 e!313885)))

(declare-fun e!313887 () Bool)

(assert (=> b!542229 (= e!313887 e!313885)))

(declare-fun b!542230 () Bool)

(assert (=> b!542230 (= e!313888 e!313887)))

(declare-fun res!336798 () Bool)

(assert (=> b!542230 (= res!336798 (and (is-Intermediate!4927 lt!247862) (not (undefined!5739 lt!247862)) (bvslt (x!50840 lt!247862) #b01111111111111111111111111111110) (bvsge (x!50840 lt!247862) #b00000000000000000000000000000000) (bvsge (x!50840 lt!247862) #b00000000000000000000000000000000)))))

(assert (=> b!542230 (=> (not res!336798) (not e!313887))))

(declare-fun b!542231 () Bool)

(declare-fun e!313884 () SeekEntryResult!4927)

(assert (=> b!542231 (= e!313884 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 (select (arr!16469 a!3154) j!147) mask!3216) #b00000000000000000000000000000000 mask!3216) (select (arr!16469 a!3154) j!147) a!3154 mask!3216))))

(declare-fun b!542232 () Bool)

(assert (=> b!542232 (= e!313886 e!313884)))

(declare-fun c!63034 () Bool)

(assert (=> b!542232 (= c!63034 (or (= lt!247861 (select (arr!16469 a!3154) j!147)) (= (bvadd lt!247861 lt!247861) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!542233 () Bool)

(assert (=> b!542233 (and (bvsge (index!21934 lt!247862) #b00000000000000000000000000000000) (bvslt (index!21934 lt!247862) (size!16833 a!3154)))))

(assert (=> b!542233 (= e!313885 (= (select (arr!16469 a!3154) (index!21934 lt!247862)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!542234 () Bool)

(assert (=> b!542234 (= e!313886 (Intermediate!4927 true (toIndex!0 (select (arr!16469 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!542235 () Bool)

(assert (=> b!542235 (= e!313884 (Intermediate!4927 false (toIndex!0 (select (arr!16469 a!3154) j!147) mask!3216) #b00000000000000000000000000000000))))

(declare-fun b!542236 () Bool)

(assert (=> b!542236 (and (bvsge (index!21934 lt!247862) #b00000000000000000000000000000000) (bvslt (index!21934 lt!247862) (size!16833 a!3154)))))

(declare-fun res!336797 () Bool)

(assert (=> b!542236 (= res!336797 (= (select (arr!16469 a!3154) (index!21934 lt!247862)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!542236 (=> res!336797 e!313885)))

(declare-fun b!542237 () Bool)

(assert (=> b!542237 (= e!313888 (bvsge (x!50840 lt!247862) #b01111111111111111111111111111110))))

(assert (= (and d!81877 c!63033) b!542234))

(assert (= (and d!81877 (not c!63033)) b!542232))

(assert (= (and b!542232 c!63034) b!542235))

(assert (= (and b!542232 (not c!63034)) b!542231))

(assert (= (and d!81877 c!63035) b!542237))

(assert (= (and d!81877 (not c!63035)) b!542230))

(assert (= (and b!542230 res!336798) b!542229))

(assert (= (and b!542229 (not res!336799)) b!542236))

(assert (= (and b!542236 (not res!336797)) b!542233))

(declare-fun m!520551 () Bool)

(assert (=> b!542233 m!520551))

(assert (=> b!542229 m!520551))

(assert (=> d!81877 m!520387))

(declare-fun m!520553 () Bool)

(assert (=> d!81877 m!520553))

(assert (=> d!81877 m!520405))

(assert (=> b!542231 m!520387))

(declare-fun m!520555 () Bool)

(assert (=> b!542231 m!520555))

(assert (=> b!542231 m!520555))

(assert (=> b!542231 m!520385))

(declare-fun m!520557 () Bool)

(assert (=> b!542231 m!520557))

(assert (=> b!542236 m!520551))

(assert (=> b!541971 d!81877))

(declare-fun d!81879 () Bool)

(declare-fun lt!247876 () (_ BitVec 32))

(declare-fun lt!247875 () (_ BitVec 32))

(assert (=> d!81879 (= lt!247876 (bvmul (bvxor lt!247875 (bvlshr lt!247875 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!81879 (= lt!247875 ((_ extract 31 0) (bvand (bvxor (select (arr!16469 a!3154) j!147) (bvlshr (select (arr!16469 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!81879 (and (bvsge mask!3216 #b00000000000000000000000000000000) (let ((res!336800 (let ((h!11539 ((_ extract 31 0) (bvand (bvxor (select (arr!16469 a!3154) j!147) (bvlshr (select (arr!16469 a!3154) j!147) #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!50846 (bvmul (bvxor h!11539 (bvlshr h!11539 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!50846 (bvlshr x!50846 #b00000000000000000000000000001101)) mask!3216))))) (and (bvslt res!336800 (bvadd mask!3216 #b00000000000000000000000000000001)) (bvsge res!336800 #b00000000000000000000000000000000))))))

(assert (=> d!81879 (= (toIndex!0 (select (arr!16469 a!3154) j!147) mask!3216) (bvand (bvxor lt!247876 (bvlshr lt!247876 #b00000000000000000000000000001101)) mask!3216))))

