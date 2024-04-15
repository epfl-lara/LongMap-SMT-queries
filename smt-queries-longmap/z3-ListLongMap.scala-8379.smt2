; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101908 () Bool)

(assert start!101908)

(declare-fun res!815668 () Bool)

(declare-fun e!696741 () Bool)

(assert (=> start!101908 (=> (not res!815668) (not e!696741))))

(declare-datatypes ((array!79141 0))(
  ( (array!79142 (arr!38195 (Array (_ BitVec 32) (_ BitVec 64))) (size!38733 (_ BitVec 32))) )
))
(declare-fun a!3806 () array!79141)

(assert (=> start!101908 (= res!815668 (bvslt (size!38733 a!3806) #b01111111111111111111111111111111))))

(assert (=> start!101908 e!696741))

(declare-fun array_inv!29178 (array!79141) Bool)

(assert (=> start!101908 (array_inv!29178 a!3806)))

(assert (=> start!101908 true))

(declare-fun b!1226983 () Bool)

(declare-fun res!815669 () Bool)

(assert (=> b!1226983 (=> (not res!815669) (not e!696741))))

(declare-fun k0!2913 () (_ BitVec 64))

(declare-fun from!3184 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!79141 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226983 (= res!815669 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)))))

(declare-fun b!1226984 () Bool)

(declare-fun res!815663 () Bool)

(assert (=> b!1226984 (=> (not res!815663) (not e!696741))))

(declare-datatypes ((List!27069 0))(
  ( (Nil!27066) (Cons!27065 (h!28274 (_ BitVec 64)) (t!40523 List!27069)) )
))
(declare-fun acc!823 () List!27069)

(declare-fun arrayNoDuplicates!0 (array!79141 (_ BitVec 32) List!27069) Bool)

(assert (=> b!1226984 (= res!815663 (arrayNoDuplicates!0 a!3806 from!3184 acc!823))))

(declare-fun b!1226985 () Bool)

(declare-fun res!815666 () Bool)

(assert (=> b!1226985 (=> (not res!815666) (not e!696741))))

(declare-fun noDuplicate!1684 (List!27069) Bool)

(assert (=> b!1226985 (= res!815666 (noDuplicate!1684 acc!823))))

(declare-fun b!1226986 () Bool)

(declare-fun e!696740 () Bool)

(declare-fun e!696743 () Bool)

(assert (=> b!1226986 (= e!696740 e!696743)))

(declare-fun res!815671 () Bool)

(assert (=> b!1226986 (=> res!815671 e!696743)))

(declare-fun lt!558698 () List!27069)

(declare-fun contains!7041 (List!27069 (_ BitVec 64)) Bool)

(assert (=> b!1226986 (= res!815671 (contains!7041 lt!558698 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226987 () Bool)

(assert (=> b!1226987 (= e!696741 e!696740)))

(declare-fun res!815672 () Bool)

(assert (=> b!1226987 (=> (not res!815672) (not e!696740))))

(assert (=> b!1226987 (= res!815672 (bvsge (bvadd #b00000000000000000000000000000001 from!3184) #b00000000000000000000000000000000))))

(assert (=> b!1226987 (= lt!558698 (Cons!27065 (select (arr!38195 a!3806) from!3184) acc!823))))

(declare-fun b!1226988 () Bool)

(declare-fun res!815664 () Bool)

(assert (=> b!1226988 (=> (not res!815664) (not e!696741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226988 (= res!815664 (validKeyInArray!0 (select (arr!38195 a!3806) from!3184)))))

(declare-fun b!1226989 () Bool)

(declare-fun res!815661 () Bool)

(assert (=> b!1226989 (=> (not res!815661) (not e!696741))))

(assert (=> b!1226989 (= res!815661 (not (contains!7041 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1226990 () Bool)

(declare-fun res!815670 () Bool)

(assert (=> b!1226990 (=> (not res!815670) (not e!696741))))

(assert (=> b!1226990 (= res!815670 (validKeyInArray!0 k0!2913))))

(declare-fun b!1226991 () Bool)

(assert (=> b!1226991 (= e!696743 (contains!7041 lt!558698 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1226992 () Bool)

(declare-fun res!815667 () Bool)

(assert (=> b!1226992 (=> (not res!815667) (not e!696740))))

(assert (=> b!1226992 (= res!815667 (noDuplicate!1684 lt!558698))))

(declare-fun b!1226993 () Bool)

(declare-fun res!815665 () Bool)

(assert (=> b!1226993 (=> (not res!815665) (not e!696741))))

(assert (=> b!1226993 (= res!815665 (and (bvsge from!3184 #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!3184) (size!38733 a!3806)) (bvslt from!3184 (size!38733 a!3806))))))

(declare-fun b!1226994 () Bool)

(declare-fun res!815662 () Bool)

(assert (=> b!1226994 (=> (not res!815662) (not e!696741))))

(assert (=> b!1226994 (= res!815662 (not (contains!7041 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!101908 res!815668) b!1226990))

(assert (= (and b!1226990 res!815670) b!1226993))

(assert (= (and b!1226993 res!815665) b!1226985))

(assert (= (and b!1226985 res!815666) b!1226989))

(assert (= (and b!1226989 res!815661) b!1226994))

(assert (= (and b!1226994 res!815662) b!1226983))

(assert (= (and b!1226983 res!815669) b!1226984))

(assert (= (and b!1226984 res!815663) b!1226988))

(assert (= (and b!1226988 res!815664) b!1226987))

(assert (= (and b!1226987 res!815672) b!1226992))

(assert (= (and b!1226992 res!815667) b!1226986))

(assert (= (and b!1226986 (not res!815671)) b!1226991))

(declare-fun m!1131399 () Bool)

(assert (=> b!1226983 m!1131399))

(declare-fun m!1131401 () Bool)

(assert (=> b!1226985 m!1131401))

(declare-fun m!1131403 () Bool)

(assert (=> start!101908 m!1131403))

(declare-fun m!1131405 () Bool)

(assert (=> b!1226986 m!1131405))

(declare-fun m!1131407 () Bool)

(assert (=> b!1226992 m!1131407))

(declare-fun m!1131409 () Bool)

(assert (=> b!1226988 m!1131409))

(assert (=> b!1226988 m!1131409))

(declare-fun m!1131411 () Bool)

(assert (=> b!1226988 m!1131411))

(declare-fun m!1131413 () Bool)

(assert (=> b!1226994 m!1131413))

(declare-fun m!1131415 () Bool)

(assert (=> b!1226991 m!1131415))

(declare-fun m!1131417 () Bool)

(assert (=> b!1226989 m!1131417))

(declare-fun m!1131419 () Bool)

(assert (=> b!1226990 m!1131419))

(assert (=> b!1226987 m!1131409))

(declare-fun m!1131421 () Bool)

(assert (=> b!1226984 m!1131421))

(check-sat (not b!1226983) (not b!1226991) (not b!1226986) (not b!1226984) (not b!1226994) (not b!1226988) (not b!1226985) (not start!101908) (not b!1226990) (not b!1226989) (not b!1226992))
(check-sat)
(get-model)

(declare-fun d!133967 () Bool)

(declare-fun res!815749 () Bool)

(declare-fun e!696772 () Bool)

(assert (=> d!133967 (=> res!815749 e!696772)))

(get-info :version)

(assert (=> d!133967 (= res!815749 ((_ is Nil!27066) lt!558698))))

(assert (=> d!133967 (= (noDuplicate!1684 lt!558698) e!696772)))

(declare-fun b!1227071 () Bool)

(declare-fun e!696773 () Bool)

(assert (=> b!1227071 (= e!696772 e!696773)))

(declare-fun res!815750 () Bool)

(assert (=> b!1227071 (=> (not res!815750) (not e!696773))))

(assert (=> b!1227071 (= res!815750 (not (contains!7041 (t!40523 lt!558698) (h!28274 lt!558698))))))

(declare-fun b!1227072 () Bool)

(assert (=> b!1227072 (= e!696773 (noDuplicate!1684 (t!40523 lt!558698)))))

(assert (= (and d!133967 (not res!815749)) b!1227071))

(assert (= (and b!1227071 res!815750) b!1227072))

(declare-fun m!1131471 () Bool)

(assert (=> b!1227071 m!1131471))

(declare-fun m!1131473 () Bool)

(assert (=> b!1227072 m!1131473))

(assert (=> b!1226992 d!133967))

(declare-fun d!133969 () Bool)

(assert (=> d!133969 (= (array_inv!29178 a!3806) (bvsge (size!38733 a!3806) #b00000000000000000000000000000000))))

(assert (=> start!101908 d!133969))

(declare-fun d!133971 () Bool)

(declare-fun lt!558707 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!549 (List!27069) (InoxSet (_ BitVec 64)))

(assert (=> d!133971 (= lt!558707 (select (content!549 lt!558698) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696778 () Bool)

(assert (=> d!133971 (= lt!558707 e!696778)))

(declare-fun res!815755 () Bool)

(assert (=> d!133971 (=> (not res!815755) (not e!696778))))

(assert (=> d!133971 (= res!815755 ((_ is Cons!27065) lt!558698))))

(assert (=> d!133971 (= (contains!7041 lt!558698 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558707)))

(declare-fun b!1227077 () Bool)

(declare-fun e!696779 () Bool)

(assert (=> b!1227077 (= e!696778 e!696779)))

(declare-fun res!815756 () Bool)

(assert (=> b!1227077 (=> res!815756 e!696779)))

(assert (=> b!1227077 (= res!815756 (= (h!28274 lt!558698) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227078 () Bool)

(assert (=> b!1227078 (= e!696779 (contains!7041 (t!40523 lt!558698) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133971 res!815755) b!1227077))

(assert (= (and b!1227077 (not res!815756)) b!1227078))

(declare-fun m!1131475 () Bool)

(assert (=> d!133971 m!1131475))

(declare-fun m!1131477 () Bool)

(assert (=> d!133971 m!1131477))

(declare-fun m!1131479 () Bool)

(assert (=> b!1227078 m!1131479))

(assert (=> b!1226986 d!133971))

(declare-fun d!133975 () Bool)

(declare-fun lt!558708 () Bool)

(assert (=> d!133975 (= lt!558708 (select (content!549 lt!558698) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696780 () Bool)

(assert (=> d!133975 (= lt!558708 e!696780)))

(declare-fun res!815757 () Bool)

(assert (=> d!133975 (=> (not res!815757) (not e!696780))))

(assert (=> d!133975 (= res!815757 ((_ is Cons!27065) lt!558698))))

(assert (=> d!133975 (= (contains!7041 lt!558698 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558708)))

(declare-fun b!1227079 () Bool)

(declare-fun e!696781 () Bool)

(assert (=> b!1227079 (= e!696780 e!696781)))

(declare-fun res!815758 () Bool)

(assert (=> b!1227079 (=> res!815758 e!696781)))

(assert (=> b!1227079 (= res!815758 (= (h!28274 lt!558698) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227080 () Bool)

(assert (=> b!1227080 (= e!696781 (contains!7041 (t!40523 lt!558698) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133975 res!815757) b!1227079))

(assert (= (and b!1227079 (not res!815758)) b!1227080))

(assert (=> d!133975 m!1131475))

(declare-fun m!1131481 () Bool)

(assert (=> d!133975 m!1131481))

(declare-fun m!1131483 () Bool)

(assert (=> b!1227080 m!1131483))

(assert (=> b!1226991 d!133975))

(declare-fun d!133977 () Bool)

(assert (=> d!133977 (= (validKeyInArray!0 k0!2913) (and (not (= k0!2913 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!2913 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226990 d!133977))

(declare-fun d!133979 () Bool)

(declare-fun res!815759 () Bool)

(declare-fun e!696782 () Bool)

(assert (=> d!133979 (=> res!815759 e!696782)))

(assert (=> d!133979 (= res!815759 ((_ is Nil!27066) acc!823))))

(assert (=> d!133979 (= (noDuplicate!1684 acc!823) e!696782)))

(declare-fun b!1227081 () Bool)

(declare-fun e!696783 () Bool)

(assert (=> b!1227081 (= e!696782 e!696783)))

(declare-fun res!815760 () Bool)

(assert (=> b!1227081 (=> (not res!815760) (not e!696783))))

(assert (=> b!1227081 (= res!815760 (not (contains!7041 (t!40523 acc!823) (h!28274 acc!823))))))

(declare-fun b!1227082 () Bool)

(assert (=> b!1227082 (= e!696783 (noDuplicate!1684 (t!40523 acc!823)))))

(assert (= (and d!133979 (not res!815759)) b!1227081))

(assert (= (and b!1227081 res!815760) b!1227082))

(declare-fun m!1131485 () Bool)

(assert (=> b!1227081 m!1131485))

(declare-fun m!1131487 () Bool)

(assert (=> b!1227082 m!1131487))

(assert (=> b!1226985 d!133979))

(declare-fun b!1227120 () Bool)

(declare-fun e!696818 () Bool)

(declare-fun e!696819 () Bool)

(assert (=> b!1227120 (= e!696818 e!696819)))

(declare-fun c!120529 () Bool)

(assert (=> b!1227120 (= c!120529 (validKeyInArray!0 (select (arr!38195 a!3806) from!3184)))))

(declare-fun call!60783 () Bool)

(declare-fun bm!60780 () Bool)

(assert (=> bm!60780 (= call!60783 (arrayNoDuplicates!0 a!3806 (bvadd from!3184 #b00000000000000000000000000000001) (ite c!120529 (Cons!27065 (select (arr!38195 a!3806) from!3184) acc!823) acc!823)))))

(declare-fun b!1227121 () Bool)

(declare-fun e!696817 () Bool)

(assert (=> b!1227121 (= e!696817 e!696818)))

(declare-fun res!815790 () Bool)

(assert (=> b!1227121 (=> (not res!815790) (not e!696818))))

(declare-fun e!696816 () Bool)

(assert (=> b!1227121 (= res!815790 (not e!696816))))

(declare-fun res!815789 () Bool)

(assert (=> b!1227121 (=> (not res!815789) (not e!696816))))

(assert (=> b!1227121 (= res!815789 (validKeyInArray!0 (select (arr!38195 a!3806) from!3184)))))

(declare-fun b!1227123 () Bool)

(assert (=> b!1227123 (= e!696819 call!60783)))

(declare-fun b!1227124 () Bool)

(assert (=> b!1227124 (= e!696816 (contains!7041 acc!823 (select (arr!38195 a!3806) from!3184)))))

(declare-fun d!133983 () Bool)

(declare-fun res!815788 () Bool)

(assert (=> d!133983 (=> res!815788 e!696817)))

(assert (=> d!133983 (= res!815788 (bvsge from!3184 (size!38733 a!3806)))))

(assert (=> d!133983 (= (arrayNoDuplicates!0 a!3806 from!3184 acc!823) e!696817)))

(declare-fun b!1227122 () Bool)

(assert (=> b!1227122 (= e!696819 call!60783)))

(assert (= (and d!133983 (not res!815788)) b!1227121))

(assert (= (and b!1227121 res!815789) b!1227124))

(assert (= (and b!1227121 res!815790) b!1227120))

(assert (= (and b!1227120 c!120529) b!1227123))

(assert (= (and b!1227120 (not c!120529)) b!1227122))

(assert (= (or b!1227123 b!1227122) bm!60780))

(assert (=> b!1227120 m!1131409))

(assert (=> b!1227120 m!1131409))

(assert (=> b!1227120 m!1131411))

(assert (=> bm!60780 m!1131409))

(declare-fun m!1131501 () Bool)

(assert (=> bm!60780 m!1131501))

(assert (=> b!1227121 m!1131409))

(assert (=> b!1227121 m!1131409))

(assert (=> b!1227121 m!1131411))

(assert (=> b!1227124 m!1131409))

(assert (=> b!1227124 m!1131409))

(declare-fun m!1131503 () Bool)

(assert (=> b!1227124 m!1131503))

(assert (=> b!1226984 d!133983))

(declare-fun d!133993 () Bool)

(declare-fun lt!558709 () Bool)

(assert (=> d!133993 (= lt!558709 (select (content!549 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696822 () Bool)

(assert (=> d!133993 (= lt!558709 e!696822)))

(declare-fun res!815793 () Bool)

(assert (=> d!133993 (=> (not res!815793) (not e!696822))))

(assert (=> d!133993 (= res!815793 ((_ is Cons!27065) acc!823))))

(assert (=> d!133993 (= (contains!7041 acc!823 #b1000000000000000000000000000000000000000000000000000000000000000) lt!558709)))

(declare-fun b!1227127 () Bool)

(declare-fun e!696823 () Bool)

(assert (=> b!1227127 (= e!696822 e!696823)))

(declare-fun res!815794 () Bool)

(assert (=> b!1227127 (=> res!815794 e!696823)))

(assert (=> b!1227127 (= res!815794 (= (h!28274 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227128 () Bool)

(assert (=> b!1227128 (= e!696823 (contains!7041 (t!40523 acc!823) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133993 res!815793) b!1227127))

(assert (= (and b!1227127 (not res!815794)) b!1227128))

(declare-fun m!1131509 () Bool)

(assert (=> d!133993 m!1131509))

(declare-fun m!1131511 () Bool)

(assert (=> d!133993 m!1131511))

(declare-fun m!1131513 () Bool)

(assert (=> b!1227128 m!1131513))

(assert (=> b!1226994 d!133993))

(declare-fun d!133997 () Bool)

(declare-fun lt!558712 () Bool)

(assert (=> d!133997 (= lt!558712 (select (content!549 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!696828 () Bool)

(assert (=> d!133997 (= lt!558712 e!696828)))

(declare-fun res!815799 () Bool)

(assert (=> d!133997 (=> (not res!815799) (not e!696828))))

(assert (=> d!133997 (= res!815799 ((_ is Cons!27065) acc!823))))

(assert (=> d!133997 (= (contains!7041 acc!823 #b0000000000000000000000000000000000000000000000000000000000000000) lt!558712)))

(declare-fun b!1227133 () Bool)

(declare-fun e!696829 () Bool)

(assert (=> b!1227133 (= e!696828 e!696829)))

(declare-fun res!815800 () Bool)

(assert (=> b!1227133 (=> res!815800 e!696829)))

(assert (=> b!1227133 (= res!815800 (= (h!28274 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1227134 () Bool)

(assert (=> b!1227134 (= e!696829 (contains!7041 (t!40523 acc!823) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!133997 res!815799) b!1227133))

(assert (= (and b!1227133 (not res!815800)) b!1227134))

(assert (=> d!133997 m!1131509))

(declare-fun m!1131515 () Bool)

(assert (=> d!133997 m!1131515))

(declare-fun m!1131517 () Bool)

(assert (=> b!1227134 m!1131517))

(assert (=> b!1226989 d!133997))

(declare-fun d!133999 () Bool)

(assert (=> d!133999 (= (validKeyInArray!0 (select (arr!38195 a!3806) from!3184)) (and (not (= (select (arr!38195 a!3806) from!3184) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38195 a!3806) from!3184) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1226988 d!133999))

(declare-fun d!134001 () Bool)

(declare-fun res!815811 () Bool)

(declare-fun e!696840 () Bool)

(assert (=> d!134001 (=> res!815811 e!696840)))

(assert (=> d!134001 (= res!815811 (= (select (arr!38195 a!3806) (bvadd #b00000000000000000000000000000001 from!3184)) k0!2913))))

(assert (=> d!134001 (= (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184)) e!696840)))

(declare-fun b!1227145 () Bool)

(declare-fun e!696841 () Bool)

(assert (=> b!1227145 (= e!696840 e!696841)))

(declare-fun res!815812 () Bool)

(assert (=> b!1227145 (=> (not res!815812) (not e!696841))))

(assert (=> b!1227145 (= res!815812 (bvslt (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001) (size!38733 a!3806)))))

(declare-fun b!1227146 () Bool)

(assert (=> b!1227146 (= e!696841 (arrayContainsKey!0 a!3806 k0!2913 (bvadd #b00000000000000000000000000000001 from!3184 #b00000000000000000000000000000001)))))

(assert (= (and d!134001 (not res!815811)) b!1227145))

(assert (= (and b!1227145 res!815812) b!1227146))

(declare-fun m!1131525 () Bool)

(assert (=> d!134001 m!1131525))

(declare-fun m!1131527 () Bool)

(assert (=> b!1227146 m!1131527))

(assert (=> b!1226983 d!134001))

(check-sat (not b!1227120) (not b!1227128) (not d!133971) (not b!1227072) (not b!1227121) (not b!1227146) (not b!1227071) (not b!1227078) (not b!1227134) (not b!1227082) (not d!133997) (not d!133993) (not d!133975) (not b!1227081) (not b!1227080) (not bm!60780) (not b!1227124))
(check-sat)
