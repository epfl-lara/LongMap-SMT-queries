; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!85900 () Bool)

(assert start!85900)

(declare-fun res!665932 () Bool)

(declare-fun e!561819 () Bool)

(assert (=> start!85900 (=> (not res!665932) (not e!561819))))

(declare-fun mask!3464 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!85900 (= res!665932 (validMask!0 mask!3464))))

(assert (=> start!85900 e!561819))

(declare-datatypes ((array!62989 0))(
  ( (array!62990 (arr!30329 (Array (_ BitVec 32) (_ BitVec 64))) (size!30831 (_ BitVec 32))) )
))
(declare-fun a!3219 () array!62989)

(declare-fun array_inv!23453 (array!62989) Bool)

(assert (=> start!85900 (array_inv!23453 a!3219)))

(assert (=> start!85900 true))

(declare-fun b!995636 () Bool)

(declare-fun res!665928 () Bool)

(assert (=> b!995636 (=> (not res!665928) (not e!561819))))

(declare-fun j!170 () (_ BitVec 32))

(declare-fun i!1194 () (_ BitVec 32))

(assert (=> b!995636 (= res!665928 (and (= (size!30831 a!3219) (bvadd #b00000000000000000000000000000001 mask!3464)) (bvsge i!1194 #b00000000000000000000000000000000) (bvslt i!1194 (size!30831 a!3219)) (bvsge j!170 #b00000000000000000000000000000000) (bvslt j!170 (size!30831 a!3219)) (not (= i!1194 j!170))))))

(declare-fun b!995637 () Bool)

(declare-fun res!665931 () Bool)

(declare-fun e!561820 () Bool)

(assert (=> b!995637 (=> (not res!665931) (not e!561820))))

(declare-datatypes ((List!21005 0))(
  ( (Nil!21002) (Cons!21001 (h!22163 (_ BitVec 64)) (t!30006 List!21005)) )
))
(declare-fun arrayNoDuplicates!0 (array!62989 (_ BitVec 32) List!21005) Bool)

(assert (=> b!995637 (= res!665931 (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21002))))

(declare-fun index!1507 () (_ BitVec 32))

(declare-fun b!995638 () Bool)

(declare-fun resIndex!38 () (_ BitVec 32))

(declare-fun resX!38 () (_ BitVec 32))

(declare-fun x!1245 () (_ BitVec 32))

(assert (=> b!995638 (= e!561820 (and (bvsle x!1245 resX!38) (bvsge x!1245 #b00000000000000000000000000000000) (bvsle resX!38 #b01111111111111111111111111111110) (bvsge index!1507 #b00000000000000000000000000000000) (bvslt index!1507 (size!30831 a!3219)) (bvsge resIndex!38 #b00000000000000000000000000000000) (bvslt resIndex!38 (size!30831 a!3219)) (bvsge mask!3464 #b00000000000000000000000000000000) (bvsgt mask!3464 #b00111111111111111111111111111111)))))

(declare-fun b!995639 () Bool)

(declare-fun res!665930 () Bool)

(assert (=> b!995639 (=> (not res!665930) (not e!561819))))

(declare-fun k0!2224 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!62989 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!995639 (= res!665930 (not (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000)))))

(declare-fun b!995640 () Bool)

(assert (=> b!995640 (= e!561819 e!561820)))

(declare-fun res!665933 () Bool)

(assert (=> b!995640 (=> (not res!665933) (not e!561820))))

(declare-datatypes ((SeekEntryResult!9261 0))(
  ( (MissingZero!9261 (index!39415 (_ BitVec 32))) (Found!9261 (index!39416 (_ BitVec 32))) (Intermediate!9261 (undefined!10073 Bool) (index!39417 (_ BitVec 32)) (x!86854 (_ BitVec 32))) (Undefined!9261) (MissingVacant!9261 (index!39418 (_ BitVec 32))) )
))
(declare-fun lt!441002 () SeekEntryResult!9261)

(assert (=> b!995640 (= res!665933 (or (= lt!441002 (MissingVacant!9261 i!1194)) (= lt!441002 (MissingZero!9261 i!1194))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!62989 (_ BitVec 32)) SeekEntryResult!9261)

(assert (=> b!995640 (= lt!441002 (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464))))

(declare-fun b!995641 () Bool)

(declare-fun res!665927 () Bool)

(assert (=> b!995641 (=> (not res!665927) (not e!561820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62989 (_ BitVec 32)) Bool)

(assert (=> b!995641 (= res!665927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464))))

(declare-fun b!995642 () Bool)

(declare-fun res!665934 () Bool)

(assert (=> b!995642 (=> (not res!665934) (not e!561819))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!995642 (= res!665934 (validKeyInArray!0 (select (arr!30329 a!3219) j!170)))))

(declare-fun b!995643 () Bool)

(declare-fun res!665929 () Bool)

(assert (=> b!995643 (=> (not res!665929) (not e!561819))))

(assert (=> b!995643 (= res!665929 (validKeyInArray!0 k0!2224))))

(assert (= (and start!85900 res!665932) b!995636))

(assert (= (and b!995636 res!665928) b!995642))

(assert (= (and b!995642 res!665934) b!995643))

(assert (= (and b!995643 res!665929) b!995639))

(assert (= (and b!995639 res!665930) b!995640))

(assert (= (and b!995640 res!665933) b!995641))

(assert (= (and b!995641 res!665927) b!995637))

(assert (= (and b!995637 res!665931) b!995638))

(declare-fun m!922997 () Bool)

(assert (=> b!995642 m!922997))

(assert (=> b!995642 m!922997))

(declare-fun m!922999 () Bool)

(assert (=> b!995642 m!922999))

(declare-fun m!923001 () Bool)

(assert (=> start!85900 m!923001))

(declare-fun m!923003 () Bool)

(assert (=> start!85900 m!923003))

(declare-fun m!923005 () Bool)

(assert (=> b!995637 m!923005))

(declare-fun m!923007 () Bool)

(assert (=> b!995640 m!923007))

(declare-fun m!923009 () Bool)

(assert (=> b!995643 m!923009))

(declare-fun m!923011 () Bool)

(assert (=> b!995639 m!923011))

(declare-fun m!923013 () Bool)

(assert (=> b!995641 m!923013))

(check-sat (not b!995643) (not b!995637) (not b!995641) (not b!995640) (not start!85900) (not b!995642) (not b!995639))
(check-sat)
(get-model)

(declare-fun bm!42203 () Bool)

(declare-fun call!42206 () Bool)

(assert (=> bm!42203 (= call!42206 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!3219 mask!3464))))

(declare-fun b!995676 () Bool)

(declare-fun e!561837 () Bool)

(assert (=> b!995676 (= e!561837 call!42206)))

(declare-fun d!118901 () Bool)

(declare-fun res!665963 () Bool)

(declare-fun e!561838 () Bool)

(assert (=> d!118901 (=> res!665963 e!561838)))

(assert (=> d!118901 (= res!665963 (bvsge #b00000000000000000000000000000000 (size!30831 a!3219)))))

(assert (=> d!118901 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!3219 mask!3464) e!561838)))

(declare-fun b!995677 () Bool)

(declare-fun e!561836 () Bool)

(assert (=> b!995677 (= e!561836 call!42206)))

(declare-fun b!995678 () Bool)

(assert (=> b!995678 (= e!561838 e!561837)))

(declare-fun c!100997 () Bool)

(assert (=> b!995678 (= c!100997 (validKeyInArray!0 (select (arr!30329 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995679 () Bool)

(assert (=> b!995679 (= e!561837 e!561836)))

(declare-fun lt!441014 () (_ BitVec 64))

(assert (=> b!995679 (= lt!441014 (select (arr!30329 a!3219) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32962 0))(
  ( (Unit!32963) )
))
(declare-fun lt!441012 () Unit!32962)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!62989 (_ BitVec 64) (_ BitVec 32)) Unit!32962)

(assert (=> b!995679 (= lt!441012 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!3219 lt!441014 #b00000000000000000000000000000000))))

(assert (=> b!995679 (arrayContainsKey!0 a!3219 lt!441014 #b00000000000000000000000000000000)))

(declare-fun lt!441013 () Unit!32962)

(assert (=> b!995679 (= lt!441013 lt!441012)))

(declare-fun res!665964 () Bool)

(assert (=> b!995679 (= res!665964 (= (seekEntryOrOpen!0 (select (arr!30329 a!3219) #b00000000000000000000000000000000) a!3219 mask!3464) (Found!9261 #b00000000000000000000000000000000)))))

(assert (=> b!995679 (=> (not res!665964) (not e!561836))))

(assert (= (and d!118901 (not res!665963)) b!995678))

(assert (= (and b!995678 c!100997) b!995679))

(assert (= (and b!995678 (not c!100997)) b!995676))

(assert (= (and b!995679 res!665964) b!995677))

(assert (= (or b!995677 b!995676) bm!42203))

(declare-fun m!923033 () Bool)

(assert (=> bm!42203 m!923033))

(declare-fun m!923035 () Bool)

(assert (=> b!995678 m!923035))

(assert (=> b!995678 m!923035))

(declare-fun m!923037 () Bool)

(assert (=> b!995678 m!923037))

(assert (=> b!995679 m!923035))

(declare-fun m!923039 () Bool)

(assert (=> b!995679 m!923039))

(declare-fun m!923041 () Bool)

(assert (=> b!995679 m!923041))

(assert (=> b!995679 m!923035))

(declare-fun m!923043 () Bool)

(assert (=> b!995679 m!923043))

(assert (=> b!995641 d!118901))

(declare-fun d!118907 () Bool)

(assert (=> d!118907 (= (validMask!0 mask!3464) (and (or (= mask!3464 #b00000000000000000000000000000111) (= mask!3464 #b00000000000000000000000000001111) (= mask!3464 #b00000000000000000000000000011111) (= mask!3464 #b00000000000000000000000000111111) (= mask!3464 #b00000000000000000000000001111111) (= mask!3464 #b00000000000000000000000011111111) (= mask!3464 #b00000000000000000000000111111111) (= mask!3464 #b00000000000000000000001111111111) (= mask!3464 #b00000000000000000000011111111111) (= mask!3464 #b00000000000000000000111111111111) (= mask!3464 #b00000000000000000001111111111111) (= mask!3464 #b00000000000000000011111111111111) (= mask!3464 #b00000000000000000111111111111111) (= mask!3464 #b00000000000000001111111111111111) (= mask!3464 #b00000000000000011111111111111111) (= mask!3464 #b00000000000000111111111111111111) (= mask!3464 #b00000000000001111111111111111111) (= mask!3464 #b00000000000011111111111111111111) (= mask!3464 #b00000000000111111111111111111111) (= mask!3464 #b00000000001111111111111111111111) (= mask!3464 #b00000000011111111111111111111111) (= mask!3464 #b00000000111111111111111111111111) (= mask!3464 #b00000001111111111111111111111111) (= mask!3464 #b00000011111111111111111111111111) (= mask!3464 #b00000111111111111111111111111111) (= mask!3464 #b00001111111111111111111111111111) (= mask!3464 #b00011111111111111111111111111111) (= mask!3464 #b00111111111111111111111111111111)) (bvsle mask!3464 #b00111111111111111111111111111111)))))

(assert (=> start!85900 d!118907))

(declare-fun d!118911 () Bool)

(assert (=> d!118911 (= (array_inv!23453 a!3219) (bvsge (size!30831 a!3219) #b00000000000000000000000000000000))))

(assert (=> start!85900 d!118911))

(declare-fun b!995749 () Bool)

(declare-fun e!561885 () SeekEntryResult!9261)

(declare-fun lt!441050 () SeekEntryResult!9261)

(assert (=> b!995749 (= e!561885 (MissingZero!9261 (index!39417 lt!441050)))))

(declare-fun b!995750 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62989 (_ BitVec 32)) SeekEntryResult!9261)

(assert (=> b!995750 (= e!561885 (seekKeyOrZeroReturnVacant!0 (x!86854 lt!441050) (index!39417 lt!441050) (index!39417 lt!441050) k0!2224 a!3219 mask!3464))))

(declare-fun d!118913 () Bool)

(declare-fun lt!441048 () SeekEntryResult!9261)

(get-info :version)

(assert (=> d!118913 (and (or ((_ is Undefined!9261) lt!441048) (not ((_ is Found!9261) lt!441048)) (and (bvsge (index!39416 lt!441048) #b00000000000000000000000000000000) (bvslt (index!39416 lt!441048) (size!30831 a!3219)))) (or ((_ is Undefined!9261) lt!441048) ((_ is Found!9261) lt!441048) (not ((_ is MissingZero!9261) lt!441048)) (and (bvsge (index!39415 lt!441048) #b00000000000000000000000000000000) (bvslt (index!39415 lt!441048) (size!30831 a!3219)))) (or ((_ is Undefined!9261) lt!441048) ((_ is Found!9261) lt!441048) ((_ is MissingZero!9261) lt!441048) (not ((_ is MissingVacant!9261) lt!441048)) (and (bvsge (index!39418 lt!441048) #b00000000000000000000000000000000) (bvslt (index!39418 lt!441048) (size!30831 a!3219)))) (or ((_ is Undefined!9261) lt!441048) (ite ((_ is Found!9261) lt!441048) (= (select (arr!30329 a!3219) (index!39416 lt!441048)) k0!2224) (ite ((_ is MissingZero!9261) lt!441048) (= (select (arr!30329 a!3219) (index!39415 lt!441048)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!9261) lt!441048) (= (select (arr!30329 a!3219) (index!39418 lt!441048)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!561886 () SeekEntryResult!9261)

(assert (=> d!118913 (= lt!441048 e!561886)))

(declare-fun c!101023 () Bool)

(assert (=> d!118913 (= c!101023 (and ((_ is Intermediate!9261) lt!441050) (undefined!10073 lt!441050)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!62989 (_ BitVec 32)) SeekEntryResult!9261)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!118913 (= lt!441050 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 k0!2224 mask!3464) k0!2224 a!3219 mask!3464))))

(assert (=> d!118913 (validMask!0 mask!3464)))

(assert (=> d!118913 (= (seekEntryOrOpen!0 k0!2224 a!3219 mask!3464) lt!441048)))

(declare-fun b!995751 () Bool)

(declare-fun e!561884 () SeekEntryResult!9261)

(assert (=> b!995751 (= e!561884 (Found!9261 (index!39417 lt!441050)))))

(declare-fun b!995752 () Bool)

(assert (=> b!995752 (= e!561886 Undefined!9261)))

(declare-fun b!995753 () Bool)

(declare-fun c!101022 () Bool)

(declare-fun lt!441049 () (_ BitVec 64))

(assert (=> b!995753 (= c!101022 (= lt!441049 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!995753 (= e!561884 e!561885)))

(declare-fun b!995754 () Bool)

(assert (=> b!995754 (= e!561886 e!561884)))

(assert (=> b!995754 (= lt!441049 (select (arr!30329 a!3219) (index!39417 lt!441050)))))

(declare-fun c!101024 () Bool)

(assert (=> b!995754 (= c!101024 (= lt!441049 k0!2224))))

(assert (= (and d!118913 c!101023) b!995752))

(assert (= (and d!118913 (not c!101023)) b!995754))

(assert (= (and b!995754 c!101024) b!995751))

(assert (= (and b!995754 (not c!101024)) b!995753))

(assert (= (and b!995753 c!101022) b!995749))

(assert (= (and b!995753 (not c!101022)) b!995750))

(declare-fun m!923087 () Bool)

(assert (=> b!995750 m!923087))

(declare-fun m!923089 () Bool)

(assert (=> d!118913 m!923089))

(declare-fun m!923091 () Bool)

(assert (=> d!118913 m!923091))

(declare-fun m!923093 () Bool)

(assert (=> d!118913 m!923093))

(declare-fun m!923095 () Bool)

(assert (=> d!118913 m!923095))

(assert (=> d!118913 m!923001))

(assert (=> d!118913 m!923091))

(declare-fun m!923097 () Bool)

(assert (=> d!118913 m!923097))

(declare-fun m!923099 () Bool)

(assert (=> b!995754 m!923099))

(assert (=> b!995640 d!118913))

(declare-fun d!118927 () Bool)

(declare-fun res!665990 () Bool)

(declare-fun e!561891 () Bool)

(assert (=> d!118927 (=> res!665990 e!561891)))

(assert (=> d!118927 (= res!665990 (= (select (arr!30329 a!3219) #b00000000000000000000000000000000) k0!2224))))

(assert (=> d!118927 (= (arrayContainsKey!0 a!3219 k0!2224 #b00000000000000000000000000000000) e!561891)))

(declare-fun b!995759 () Bool)

(declare-fun e!561892 () Bool)

(assert (=> b!995759 (= e!561891 e!561892)))

(declare-fun res!665991 () Bool)

(assert (=> b!995759 (=> (not res!665991) (not e!561892))))

(assert (=> b!995759 (= res!665991 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!30831 a!3219)))))

(declare-fun b!995760 () Bool)

(assert (=> b!995760 (= e!561892 (arrayContainsKey!0 a!3219 k0!2224 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!118927 (not res!665990)) b!995759))

(assert (= (and b!995759 res!665991) b!995760))

(assert (=> d!118927 m!923035))

(declare-fun m!923101 () Bool)

(assert (=> b!995760 m!923101))

(assert (=> b!995639 d!118927))

(declare-fun b!995787 () Bool)

(declare-fun e!561918 () Bool)

(declare-fun e!561915 () Bool)

(assert (=> b!995787 (= e!561918 e!561915)))

(declare-fun res!666011 () Bool)

(assert (=> b!995787 (=> (not res!666011) (not e!561915))))

(declare-fun e!561917 () Bool)

(assert (=> b!995787 (= res!666011 (not e!561917))))

(declare-fun res!666010 () Bool)

(assert (=> b!995787 (=> (not res!666010) (not e!561917))))

(assert (=> b!995787 (= res!666010 (validKeyInArray!0 (select (arr!30329 a!3219) #b00000000000000000000000000000000)))))

(declare-fun b!995788 () Bool)

(declare-fun e!561916 () Bool)

(declare-fun call!42220 () Bool)

(assert (=> b!995788 (= e!561916 call!42220)))

(declare-fun bm!42217 () Bool)

(declare-fun c!101029 () Bool)

(assert (=> bm!42217 (= call!42220 (arrayNoDuplicates!0 a!3219 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!101029 (Cons!21001 (select (arr!30329 a!3219) #b00000000000000000000000000000000) Nil!21002) Nil!21002)))))

(declare-fun b!995789 () Bool)

(assert (=> b!995789 (= e!561915 e!561916)))

(assert (=> b!995789 (= c!101029 (validKeyInArray!0 (select (arr!30329 a!3219) #b00000000000000000000000000000000)))))

(declare-fun d!118933 () Bool)

(declare-fun res!666012 () Bool)

(assert (=> d!118933 (=> res!666012 e!561918)))

(assert (=> d!118933 (= res!666012 (bvsge #b00000000000000000000000000000000 (size!30831 a!3219)))))

(assert (=> d!118933 (= (arrayNoDuplicates!0 a!3219 #b00000000000000000000000000000000 Nil!21002) e!561918)))

(declare-fun b!995790 () Bool)

(assert (=> b!995790 (= e!561916 call!42220)))

(declare-fun b!995791 () Bool)

(declare-fun contains!5862 (List!21005 (_ BitVec 64)) Bool)

(assert (=> b!995791 (= e!561917 (contains!5862 Nil!21002 (select (arr!30329 a!3219) #b00000000000000000000000000000000)))))

(assert (= (and d!118933 (not res!666012)) b!995787))

(assert (= (and b!995787 res!666010) b!995791))

(assert (= (and b!995787 res!666011) b!995789))

(assert (= (and b!995789 c!101029) b!995790))

(assert (= (and b!995789 (not c!101029)) b!995788))

(assert (= (or b!995790 b!995788) bm!42217))

(assert (=> b!995787 m!923035))

(assert (=> b!995787 m!923035))

(assert (=> b!995787 m!923037))

(assert (=> bm!42217 m!923035))

(declare-fun m!923105 () Bool)

(assert (=> bm!42217 m!923105))

(assert (=> b!995789 m!923035))

(assert (=> b!995789 m!923035))

(assert (=> b!995789 m!923037))

(assert (=> b!995791 m!923035))

(assert (=> b!995791 m!923035))

(declare-fun m!923107 () Bool)

(assert (=> b!995791 m!923107))

(assert (=> b!995637 d!118933))

(declare-fun d!118941 () Bool)

(assert (=> d!118941 (= (validKeyInArray!0 (select (arr!30329 a!3219) j!170)) (and (not (= (select (arr!30329 a!3219) j!170) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!30329 a!3219) j!170) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995642 d!118941))

(declare-fun d!118945 () Bool)

(assert (=> d!118945 (= (validKeyInArray!0 k0!2224) (and (not (= k0!2224 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2224 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!995643 d!118945))

(check-sat (not d!118913) (not b!995678) (not b!995760) (not b!995789) (not b!995750) (not bm!42217) (not b!995791) (not b!995679) (not b!995787) (not bm!42203))
(check-sat)
