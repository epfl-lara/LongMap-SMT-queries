; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!128270 () Bool)

(assert start!128270)

(declare-fun b!1505370 () Bool)

(declare-fun res!1025989 () Bool)

(declare-fun e!841350 () Bool)

(assert (=> b!1505370 (=> (not res!1025989) (not e!841350))))

(declare-datatypes ((List!34997 0))(
  ( (Nil!34994) (Cons!34993 (h!36391 (_ BitVec 64)) (t!49683 List!34997)) )
))
(declare-fun noDuplicate!2649 (List!34997) Bool)

(assert (=> b!1505370 (= res!1025989 (noDuplicate!2649 Nil!34994))))

(declare-fun b!1505371 () Bool)

(declare-fun res!1025988 () Bool)

(assert (=> b!1505371 (=> (not res!1025988) (not e!841350))))

(declare-datatypes ((array!100375 0))(
  ( (array!100376 (arr!48436 (Array (_ BitVec 32) (_ BitVec 64))) (size!48988 (_ BitVec 32))) )
))
(declare-fun a!2804 () array!100375)

(declare-fun i!961 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1505371 (= res!1025988 (validKeyInArray!0 (select (arr!48436 a!2804) i!961)))))

(declare-fun res!1025992 () Bool)

(assert (=> start!128270 (=> (not res!1025992) (not e!841350))))

(declare-fun mask!2512 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!128270 (= res!1025992 (validMask!0 mask!2512))))

(assert (=> start!128270 e!841350))

(assert (=> start!128270 true))

(declare-fun array_inv!37669 (array!100375) Bool)

(assert (=> start!128270 (array_inv!37669 a!2804)))

(declare-fun b!1505372 () Bool)

(declare-fun res!1025993 () Bool)

(assert (=> b!1505372 (=> (not res!1025993) (not e!841350))))

(assert (=> b!1505372 (= res!1025993 (and (bvsle #b00000000000000000000000000000000 (size!48988 a!2804)) (bvslt (size!48988 a!2804) #b01111111111111111111111111111111)))))

(declare-fun b!1505373 () Bool)

(declare-fun res!1025986 () Bool)

(assert (=> b!1505373 (=> (not res!1025986) (not e!841350))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!100375 (_ BitVec 32)) Bool)

(assert (=> b!1505373 (= res!1025986 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512))))

(declare-fun b!1505374 () Bool)

(declare-fun res!1025987 () Bool)

(assert (=> b!1505374 (=> (not res!1025987) (not e!841350))))

(declare-fun j!70 () (_ BitVec 32))

(assert (=> b!1505374 (= res!1025987 (validKeyInArray!0 (select (arr!48436 a!2804) j!70)))))

(declare-fun b!1505375 () Bool)

(declare-fun res!1025991 () Bool)

(assert (=> b!1505375 (=> (not res!1025991) (not e!841350))))

(assert (=> b!1505375 (= res!1025991 (and (= (size!48988 a!2804) (bvadd #b00000000000000000000000000000001 mask!2512)) (bvsge i!961 #b00000000000000000000000000000000) (bvslt i!961 (size!48988 a!2804)) (bvsge j!70 #b00000000000000000000000000000000) (bvslt j!70 (size!48988 a!2804)) (not (= i!961 j!70))))))

(declare-fun b!1505376 () Bool)

(declare-fun e!841348 () Bool)

(assert (=> b!1505376 (= e!841350 e!841348)))

(declare-fun res!1025990 () Bool)

(assert (=> b!1505376 (=> res!1025990 e!841348)))

(declare-fun contains!9923 (List!34997 (_ BitVec 64)) Bool)

(assert (=> b!1505376 (= res!1025990 (contains!9923 Nil!34994 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505377 () Bool)

(assert (=> b!1505377 (= e!841348 (contains!9923 Nil!34994 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!128270 res!1025992) b!1505375))

(assert (= (and b!1505375 res!1025991) b!1505371))

(assert (= (and b!1505371 res!1025988) b!1505374))

(assert (= (and b!1505374 res!1025987) b!1505373))

(assert (= (and b!1505373 res!1025986) b!1505372))

(assert (= (and b!1505372 res!1025993) b!1505370))

(assert (= (and b!1505370 res!1025989) b!1505376))

(assert (= (and b!1505376 (not res!1025990)) b!1505377))

(declare-fun m!1387877 () Bool)

(assert (=> b!1505371 m!1387877))

(assert (=> b!1505371 m!1387877))

(declare-fun m!1387879 () Bool)

(assert (=> b!1505371 m!1387879))

(declare-fun m!1387881 () Bool)

(assert (=> b!1505377 m!1387881))

(declare-fun m!1387883 () Bool)

(assert (=> b!1505374 m!1387883))

(assert (=> b!1505374 m!1387883))

(declare-fun m!1387885 () Bool)

(assert (=> b!1505374 m!1387885))

(declare-fun m!1387887 () Bool)

(assert (=> b!1505370 m!1387887))

(declare-fun m!1387889 () Bool)

(assert (=> b!1505373 m!1387889))

(declare-fun m!1387891 () Bool)

(assert (=> start!128270 m!1387891))

(declare-fun m!1387893 () Bool)

(assert (=> start!128270 m!1387893))

(declare-fun m!1387895 () Bool)

(assert (=> b!1505376 m!1387895))

(check-sat (not b!1505373) (not b!1505370) (not b!1505377) (not b!1505371) (not start!128270) (not b!1505374) (not b!1505376))
(check-sat)
(get-model)

(declare-fun d!157839 () Bool)

(declare-fun lt!653784 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!774 (List!34997) (InoxSet (_ BitVec 64)))

(assert (=> d!157839 (= lt!653784 (select (content!774 Nil!34994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841373 () Bool)

(assert (=> d!157839 (= lt!653784 e!841373)))

(declare-fun res!1026046 () Bool)

(assert (=> d!157839 (=> (not res!1026046) (not e!841373))))

(get-info :version)

(assert (=> d!157839 (= res!1026046 ((_ is Cons!34993) Nil!34994))))

(assert (=> d!157839 (= (contains!9923 Nil!34994 #b1000000000000000000000000000000000000000000000000000000000000000) lt!653784)))

(declare-fun b!1505430 () Bool)

(declare-fun e!841374 () Bool)

(assert (=> b!1505430 (= e!841373 e!841374)))

(declare-fun res!1026047 () Bool)

(assert (=> b!1505430 (=> res!1026047 e!841374)))

(assert (=> b!1505430 (= res!1026047 (= (h!36391 Nil!34994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505431 () Bool)

(assert (=> b!1505431 (= e!841374 (contains!9923 (t!49683 Nil!34994) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157839 res!1026046) b!1505430))

(assert (= (and b!1505430 (not res!1026047)) b!1505431))

(declare-fun m!1387937 () Bool)

(assert (=> d!157839 m!1387937))

(declare-fun m!1387939 () Bool)

(assert (=> d!157839 m!1387939))

(declare-fun m!1387941 () Bool)

(assert (=> b!1505431 m!1387941))

(assert (=> b!1505377 d!157839))

(declare-fun d!157843 () Bool)

(assert (=> d!157843 (= (validKeyInArray!0 (select (arr!48436 a!2804) i!961)) (and (not (= (select (arr!48436 a!2804) i!961) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48436 a!2804) i!961) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505371 d!157843))

(declare-fun d!157847 () Bool)

(declare-fun lt!653785 () Bool)

(assert (=> d!157847 (= lt!653785 (select (content!774 Nil!34994) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!841375 () Bool)

(assert (=> d!157847 (= lt!653785 e!841375)))

(declare-fun res!1026048 () Bool)

(assert (=> d!157847 (=> (not res!1026048) (not e!841375))))

(assert (=> d!157847 (= res!1026048 ((_ is Cons!34993) Nil!34994))))

(assert (=> d!157847 (= (contains!9923 Nil!34994 #b0000000000000000000000000000000000000000000000000000000000000000) lt!653785)))

(declare-fun b!1505432 () Bool)

(declare-fun e!841376 () Bool)

(assert (=> b!1505432 (= e!841375 e!841376)))

(declare-fun res!1026049 () Bool)

(assert (=> b!1505432 (=> res!1026049 e!841376)))

(assert (=> b!1505432 (= res!1026049 (= (h!36391 Nil!34994) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1505433 () Bool)

(assert (=> b!1505433 (= e!841376 (contains!9923 (t!49683 Nil!34994) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!157847 res!1026048) b!1505432))

(assert (= (and b!1505432 (not res!1026049)) b!1505433))

(assert (=> d!157847 m!1387937))

(declare-fun m!1387943 () Bool)

(assert (=> d!157847 m!1387943))

(declare-fun m!1387945 () Bool)

(assert (=> b!1505433 m!1387945))

(assert (=> b!1505376 d!157847))

(declare-fun d!157849 () Bool)

(declare-fun res!1026054 () Bool)

(declare-fun e!841381 () Bool)

(assert (=> d!157849 (=> res!1026054 e!841381)))

(assert (=> d!157849 (= res!1026054 ((_ is Nil!34994) Nil!34994))))

(assert (=> d!157849 (= (noDuplicate!2649 Nil!34994) e!841381)))

(declare-fun b!1505438 () Bool)

(declare-fun e!841382 () Bool)

(assert (=> b!1505438 (= e!841381 e!841382)))

(declare-fun res!1026055 () Bool)

(assert (=> b!1505438 (=> (not res!1026055) (not e!841382))))

(assert (=> b!1505438 (= res!1026055 (not (contains!9923 (t!49683 Nil!34994) (h!36391 Nil!34994))))))

(declare-fun b!1505439 () Bool)

(assert (=> b!1505439 (= e!841382 (noDuplicate!2649 (t!49683 Nil!34994)))))

(assert (= (and d!157849 (not res!1026054)) b!1505438))

(assert (= (and b!1505438 res!1026055) b!1505439))

(declare-fun m!1387947 () Bool)

(assert (=> b!1505438 m!1387947))

(declare-fun m!1387949 () Bool)

(assert (=> b!1505439 m!1387949))

(assert (=> b!1505370 d!157849))

(declare-fun d!157851 () Bool)

(assert (=> d!157851 (= (validKeyInArray!0 (select (arr!48436 a!2804) j!70)) (and (not (= (select (arr!48436 a!2804) j!70) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!48436 a!2804) j!70) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1505374 d!157851))

(declare-fun d!157853 () Bool)

(assert (=> d!157853 (= (validMask!0 mask!2512) (and (or (= mask!2512 #b00000000000000000000000000000111) (= mask!2512 #b00000000000000000000000000001111) (= mask!2512 #b00000000000000000000000000011111) (= mask!2512 #b00000000000000000000000000111111) (= mask!2512 #b00000000000000000000000001111111) (= mask!2512 #b00000000000000000000000011111111) (= mask!2512 #b00000000000000000000000111111111) (= mask!2512 #b00000000000000000000001111111111) (= mask!2512 #b00000000000000000000011111111111) (= mask!2512 #b00000000000000000000111111111111) (= mask!2512 #b00000000000000000001111111111111) (= mask!2512 #b00000000000000000011111111111111) (= mask!2512 #b00000000000000000111111111111111) (= mask!2512 #b00000000000000001111111111111111) (= mask!2512 #b00000000000000011111111111111111) (= mask!2512 #b00000000000000111111111111111111) (= mask!2512 #b00000000000001111111111111111111) (= mask!2512 #b00000000000011111111111111111111) (= mask!2512 #b00000000000111111111111111111111) (= mask!2512 #b00000000001111111111111111111111) (= mask!2512 #b00000000011111111111111111111111) (= mask!2512 #b00000000111111111111111111111111) (= mask!2512 #b00000001111111111111111111111111) (= mask!2512 #b00000011111111111111111111111111) (= mask!2512 #b00000111111111111111111111111111) (= mask!2512 #b00001111111111111111111111111111) (= mask!2512 #b00011111111111111111111111111111) (= mask!2512 #b00111111111111111111111111111111)) (bvsle mask!2512 #b00111111111111111111111111111111)))))

(assert (=> start!128270 d!157853))

(declare-fun d!157863 () Bool)

(assert (=> d!157863 (= (array_inv!37669 a!2804) (bvsge (size!48988 a!2804) #b00000000000000000000000000000000))))

(assert (=> start!128270 d!157863))

(declare-fun b!1505496 () Bool)

(declare-fun e!841432 () Bool)

(declare-fun e!841431 () Bool)

(assert (=> b!1505496 (= e!841432 e!841431)))

(declare-fun lt!653816 () (_ BitVec 64))

(assert (=> b!1505496 (= lt!653816 (select (arr!48436 a!2804) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!50145 0))(
  ( (Unit!50146) )
))
(declare-fun lt!653818 () Unit!50145)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!100375 (_ BitVec 64) (_ BitVec 32)) Unit!50145)

(assert (=> b!1505496 (= lt!653818 (lemmaArrayContainsFromImpliesContainsFromZero!0 a!2804 lt!653816 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!100375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1505496 (arrayContainsKey!0 a!2804 lt!653816 #b00000000000000000000000000000000)))

(declare-fun lt!653817 () Unit!50145)

(assert (=> b!1505496 (= lt!653817 lt!653818)))

(declare-fun res!1026097 () Bool)

(declare-datatypes ((SeekEntryResult!12649 0))(
  ( (MissingZero!12649 (index!52991 (_ BitVec 32))) (Found!12649 (index!52992 (_ BitVec 32))) (Intermediate!12649 (undefined!13461 Bool) (index!52993 (_ BitVec 32)) (x!134702 (_ BitVec 32))) (Undefined!12649) (MissingVacant!12649 (index!52994 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!100375 (_ BitVec 32)) SeekEntryResult!12649)

(assert (=> b!1505496 (= res!1026097 (= (seekEntryOrOpen!0 (select (arr!48436 a!2804) #b00000000000000000000000000000000) a!2804 mask!2512) (Found!12649 #b00000000000000000000000000000000)))))

(assert (=> b!1505496 (=> (not res!1026097) (not e!841431))))

(declare-fun bm!68162 () Bool)

(declare-fun call!68165 () Bool)

(assert (=> bm!68162 (= call!68165 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) a!2804 mask!2512))))

(declare-fun b!1505497 () Bool)

(assert (=> b!1505497 (= e!841431 call!68165)))

(declare-fun b!1505498 () Bool)

(assert (=> b!1505498 (= e!841432 call!68165)))

(declare-fun b!1505499 () Bool)

(declare-fun e!841433 () Bool)

(assert (=> b!1505499 (= e!841433 e!841432)))

(declare-fun c!139237 () Bool)

(assert (=> b!1505499 (= c!139237 (validKeyInArray!0 (select (arr!48436 a!2804) #b00000000000000000000000000000000)))))

(declare-fun d!157865 () Bool)

(declare-fun res!1026096 () Bool)

(assert (=> d!157865 (=> res!1026096 e!841433)))

(assert (=> d!157865 (= res!1026096 (bvsge #b00000000000000000000000000000000 (size!48988 a!2804)))))

(assert (=> d!157865 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2804 mask!2512) e!841433)))

(assert (= (and d!157865 (not res!1026096)) b!1505499))

(assert (= (and b!1505499 c!139237) b!1505496))

(assert (= (and b!1505499 (not c!139237)) b!1505498))

(assert (= (and b!1505496 res!1026097) b!1505497))

(assert (= (or b!1505497 b!1505498) bm!68162))

(declare-fun m!1387995 () Bool)

(assert (=> b!1505496 m!1387995))

(declare-fun m!1387997 () Bool)

(assert (=> b!1505496 m!1387997))

(declare-fun m!1387999 () Bool)

(assert (=> b!1505496 m!1387999))

(assert (=> b!1505496 m!1387995))

(declare-fun m!1388001 () Bool)

(assert (=> b!1505496 m!1388001))

(declare-fun m!1388003 () Bool)

(assert (=> bm!68162 m!1388003))

(assert (=> b!1505499 m!1387995))

(assert (=> b!1505499 m!1387995))

(declare-fun m!1388005 () Bool)

(assert (=> b!1505499 m!1388005))

(assert (=> b!1505373 d!157865))

(check-sat (not b!1505439) (not b!1505431) (not d!157839) (not b!1505499) (not b!1505496) (not bm!68162) (not d!157847) (not b!1505438) (not b!1505433))
(check-sat)
