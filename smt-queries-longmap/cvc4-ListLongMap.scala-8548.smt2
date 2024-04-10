; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104312 () Bool)

(assert start!104312)

(declare-fun b!1245808 () Bool)

(declare-fun res!831241 () Bool)

(declare-fun e!706472 () Bool)

(assert (=> b!1245808 (=> (not res!831241) (not e!706472))))

(declare-datatypes ((array!80203 0))(
  ( (array!80204 (arr!38683 (Array (_ BitVec 32) (_ BitVec 64))) (size!39219 (_ BitVec 32))) )
))
(declare-fun a!3892 () array!80203)

(declare-fun from!3270 () (_ BitVec 32))

(declare-datatypes ((List!27486 0))(
  ( (Nil!27483) (Cons!27482 (h!28691 (_ BitVec 64)) (t!40955 List!27486)) )
))
(declare-fun arrayNoDuplicates!0 (array!80203 (_ BitVec 32) List!27486) Bool)

(assert (=> b!1245808 (= res!831241 (arrayNoDuplicates!0 a!3892 from!3270 Nil!27483))))

(declare-fun b!1245809 () Bool)

(declare-fun res!831233 () Bool)

(declare-fun e!706471 () Bool)

(assert (=> b!1245809 (=> (not res!831233) (not e!706471))))

(declare-fun lt!562974 () List!27486)

(declare-fun contains!7452 (List!27486 (_ BitVec 64)) Bool)

(assert (=> b!1245809 (= res!831233 (not (contains!7452 lt!562974 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245810 () Bool)

(declare-fun e!706470 () Bool)

(assert (=> b!1245810 (= e!706471 e!706470)))

(declare-fun res!831238 () Bool)

(assert (=> b!1245810 (=> res!831238 e!706470)))

(assert (=> b!1245810 (= res!831238 (contains!7452 Nil!27483 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245811 () Bool)

(declare-fun res!831234 () Bool)

(assert (=> b!1245811 (=> (not res!831234) (not e!706471))))

(declare-fun noDuplicate!2031 (List!27486) Bool)

(assert (=> b!1245811 (= res!831234 (noDuplicate!2031 lt!562974))))

(declare-fun res!831239 () Bool)

(assert (=> start!104312 (=> (not res!831239) (not e!706472))))

(declare-fun newFrom!287 () (_ BitVec 32))

(assert (=> start!104312 (= res!831239 (and (bvslt (size!39219 a!3892) #b01111111111111111111111111111111) (bvsge from!3270 #b00000000000000000000000000000000) (bvsle from!3270 (size!39219 a!3892)) (bvsge newFrom!287 from!3270) (bvsle newFrom!287 (size!39219 a!3892))))))

(assert (=> start!104312 e!706472))

(declare-fun array_inv!29531 (array!80203) Bool)

(assert (=> start!104312 (array_inv!29531 a!3892)))

(assert (=> start!104312 true))

(declare-fun b!1245812 () Bool)

(assert (=> b!1245812 (= e!706472 e!706471)))

(declare-fun res!831235 () Bool)

(assert (=> b!1245812 (=> (not res!831235) (not e!706471))))

(assert (=> b!1245812 (= res!831235 (bvsge (bvadd #b00000000000000000000000000000001 from!3270) #b00000000000000000000000000000000))))

(assert (=> b!1245812 (= lt!562974 (Cons!27482 (select (arr!38683 a!3892) from!3270) Nil!27483))))

(declare-fun b!1245813 () Bool)

(declare-fun res!831236 () Bool)

(assert (=> b!1245813 (=> (not res!831236) (not e!706471))))

(assert (=> b!1245813 (= res!831236 (not (contains!7452 lt!562974 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1245814 () Bool)

(declare-fun res!831237 () Bool)

(assert (=> b!1245814 (=> (not res!831237) (not e!706472))))

(assert (=> b!1245814 (= res!831237 (and (not (= from!3270 newFrom!287)) (bvslt from!3270 (size!39219 a!3892)) (not (= newFrom!287 (size!39219 a!3892)))))))

(declare-fun b!1245815 () Bool)

(assert (=> b!1245815 (= e!706470 (contains!7452 Nil!27483 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245816 () Bool)

(declare-fun res!831240 () Bool)

(assert (=> b!1245816 (=> (not res!831240) (not e!706472))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1245816 (= res!831240 (validKeyInArray!0 (select (arr!38683 a!3892) from!3270)))))

(assert (= (and start!104312 res!831239) b!1245808))

(assert (= (and b!1245808 res!831241) b!1245814))

(assert (= (and b!1245814 res!831237) b!1245816))

(assert (= (and b!1245816 res!831240) b!1245812))

(assert (= (and b!1245812 res!831235) b!1245811))

(assert (= (and b!1245811 res!831234) b!1245809))

(assert (= (and b!1245809 res!831233) b!1245813))

(assert (= (and b!1245813 res!831236) b!1245810))

(assert (= (and b!1245810 (not res!831238)) b!1245815))

(declare-fun m!1147787 () Bool)

(assert (=> b!1245816 m!1147787))

(assert (=> b!1245816 m!1147787))

(declare-fun m!1147789 () Bool)

(assert (=> b!1245816 m!1147789))

(declare-fun m!1147791 () Bool)

(assert (=> b!1245815 m!1147791))

(declare-fun m!1147793 () Bool)

(assert (=> b!1245811 m!1147793))

(declare-fun m!1147795 () Bool)

(assert (=> b!1245813 m!1147795))

(declare-fun m!1147797 () Bool)

(assert (=> b!1245809 m!1147797))

(declare-fun m!1147799 () Bool)

(assert (=> b!1245808 m!1147799))

(declare-fun m!1147801 () Bool)

(assert (=> b!1245810 m!1147801))

(declare-fun m!1147803 () Bool)

(assert (=> start!104312 m!1147803))

(assert (=> b!1245812 m!1147787))

(push 1)

(assert (not b!1245810))

(assert (not b!1245811))

(assert (not b!1245809))

(assert (not b!1245815))

(assert (not start!104312))

(assert (not b!1245816))

(assert (not b!1245808))

(assert (not b!1245813))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!137475 () Bool)

(declare-fun lt!562977 () Bool)

(declare-fun content!624 (List!27486) (Set (_ BitVec 64)))

(assert (=> d!137475 (= lt!562977 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!624 lt!562974)))))

(declare-fun e!706486 () Bool)

(assert (=> d!137475 (= lt!562977 e!706486)))

(declare-fun res!831253 () Bool)

(assert (=> d!137475 (=> (not res!831253) (not e!706486))))

(assert (=> d!137475 (= res!831253 (is-Cons!27482 lt!562974))))

(assert (=> d!137475 (= (contains!7452 lt!562974 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562977)))

(declare-fun b!1245831 () Bool)

(declare-fun e!706485 () Bool)

(assert (=> b!1245831 (= e!706486 e!706485)))

(declare-fun res!831252 () Bool)

(assert (=> b!1245831 (=> res!831252 e!706485)))

(assert (=> b!1245831 (= res!831252 (= (h!28691 lt!562974) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245832 () Bool)

(assert (=> b!1245832 (= e!706485 (contains!7452 (t!40955 lt!562974) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137475 res!831253) b!1245831))

(assert (= (and b!1245831 (not res!831252)) b!1245832))

(declare-fun m!1147805 () Bool)

(assert (=> d!137475 m!1147805))

(declare-fun m!1147807 () Bool)

(assert (=> d!137475 m!1147807))

(declare-fun m!1147809 () Bool)

(assert (=> b!1245832 m!1147809))

(assert (=> b!1245813 d!137475))

(declare-fun call!61503 () Bool)

(declare-fun c!121977 () Bool)

(declare-fun bm!61500 () Bool)

(assert (=> bm!61500 (= call!61503 (arrayNoDuplicates!0 a!3892 (bvadd from!3270 #b00000000000000000000000000000001) (ite c!121977 (Cons!27482 (select (arr!38683 a!3892) from!3270) Nil!27483) Nil!27483)))))

(declare-fun d!137479 () Bool)

(declare-fun res!831279 () Bool)

(declare-fun e!706515 () Bool)

(assert (=> d!137479 (=> res!831279 e!706515)))

(assert (=> d!137479 (= res!831279 (bvsge from!3270 (size!39219 a!3892)))))

(assert (=> d!137479 (= (arrayNoDuplicates!0 a!3892 from!3270 Nil!27483) e!706515)))

(declare-fun b!1245862 () Bool)

(declare-fun e!706514 () Bool)

(assert (=> b!1245862 (= e!706514 call!61503)))

(declare-fun b!1245863 () Bool)

(declare-fun e!706516 () Bool)

(assert (=> b!1245863 (= e!706516 e!706514)))

(assert (=> b!1245863 (= c!121977 (validKeyInArray!0 (select (arr!38683 a!3892) from!3270)))))

(declare-fun b!1245864 () Bool)

(assert (=> b!1245864 (= e!706514 call!61503)))

(declare-fun b!1245865 () Bool)

(assert (=> b!1245865 (= e!706515 e!706516)))

(declare-fun res!831277 () Bool)

(assert (=> b!1245865 (=> (not res!831277) (not e!706516))))

(declare-fun e!706513 () Bool)

(assert (=> b!1245865 (= res!831277 (not e!706513))))

(declare-fun res!831278 () Bool)

(assert (=> b!1245865 (=> (not res!831278) (not e!706513))))

(assert (=> b!1245865 (= res!831278 (validKeyInArray!0 (select (arr!38683 a!3892) from!3270)))))

(declare-fun b!1245866 () Bool)

(assert (=> b!1245866 (= e!706513 (contains!7452 Nil!27483 (select (arr!38683 a!3892) from!3270)))))

(assert (= (and d!137479 (not res!831279)) b!1245865))

(assert (= (and b!1245865 res!831278) b!1245866))

(assert (= (and b!1245865 res!831277) b!1245863))

(assert (= (and b!1245863 c!121977) b!1245864))

(assert (= (and b!1245863 (not c!121977)) b!1245862))

(assert (= (or b!1245864 b!1245862) bm!61500))

(assert (=> bm!61500 m!1147787))

(declare-fun m!1147833 () Bool)

(assert (=> bm!61500 m!1147833))

(assert (=> b!1245863 m!1147787))

(assert (=> b!1245863 m!1147787))

(assert (=> b!1245863 m!1147789))

(assert (=> b!1245865 m!1147787))

(assert (=> b!1245865 m!1147787))

(assert (=> b!1245865 m!1147789))

(assert (=> b!1245866 m!1147787))

(assert (=> b!1245866 m!1147787))

(declare-fun m!1147835 () Bool)

(assert (=> b!1245866 m!1147835))

(assert (=> b!1245808 d!137479))

(declare-fun d!137491 () Bool)

(assert (=> d!137491 (= (array_inv!29531 a!3892) (bvsge (size!39219 a!3892) #b00000000000000000000000000000000))))

(assert (=> start!104312 d!137491))

(declare-fun d!137493 () Bool)

(declare-fun res!831298 () Bool)

(declare-fun e!706535 () Bool)

(assert (=> d!137493 (=> res!831298 e!706535)))

(assert (=> d!137493 (= res!831298 (is-Nil!27483 lt!562974))))

(assert (=> d!137493 (= (noDuplicate!2031 lt!562974) e!706535)))

(declare-fun b!1245885 () Bool)

(declare-fun e!706536 () Bool)

(assert (=> b!1245885 (= e!706535 e!706536)))

(declare-fun res!831299 () Bool)

(assert (=> b!1245885 (=> (not res!831299) (not e!706536))))

(assert (=> b!1245885 (= res!831299 (not (contains!7452 (t!40955 lt!562974) (h!28691 lt!562974))))))

(declare-fun b!1245886 () Bool)

(assert (=> b!1245886 (= e!706536 (noDuplicate!2031 (t!40955 lt!562974)))))

(assert (= (and d!137493 (not res!831298)) b!1245885))

(assert (= (and b!1245885 res!831299) b!1245886))

(declare-fun m!1147849 () Bool)

(assert (=> b!1245885 m!1147849))

(declare-fun m!1147851 () Bool)

(assert (=> b!1245886 m!1147851))

(assert (=> b!1245811 d!137493))

(declare-fun d!137501 () Bool)

(declare-fun lt!562987 () Bool)

(assert (=> d!137501 (= lt!562987 (member #b1000000000000000000000000000000000000000000000000000000000000000 (content!624 Nil!27483)))))

(declare-fun e!706538 () Bool)

(assert (=> d!137501 (= lt!562987 e!706538)))

(declare-fun res!831301 () Bool)

(assert (=> d!137501 (=> (not res!831301) (not e!706538))))

(assert (=> d!137501 (= res!831301 (is-Cons!27482 Nil!27483))))

(assert (=> d!137501 (= (contains!7452 Nil!27483 #b1000000000000000000000000000000000000000000000000000000000000000) lt!562987)))

(declare-fun b!1245887 () Bool)

(declare-fun e!706537 () Bool)

(assert (=> b!1245887 (= e!706538 e!706537)))

(declare-fun res!831300 () Bool)

(assert (=> b!1245887 (=> res!831300 e!706537)))

(assert (=> b!1245887 (= res!831300 (= (h!28691 Nil!27483) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245888 () Bool)

(assert (=> b!1245888 (= e!706537 (contains!7452 (t!40955 Nil!27483) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137501 res!831301) b!1245887))

(assert (= (and b!1245887 (not res!831300)) b!1245888))

(declare-fun m!1147853 () Bool)

(assert (=> d!137501 m!1147853))

(declare-fun m!1147855 () Bool)

(assert (=> d!137501 m!1147855))

(declare-fun m!1147857 () Bool)

(assert (=> b!1245888 m!1147857))

(assert (=> b!1245815 d!137501))

(declare-fun d!137503 () Bool)

(declare-fun lt!562988 () Bool)

(assert (=> d!137503 (= lt!562988 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!624 Nil!27483)))))

(declare-fun e!706540 () Bool)

(assert (=> d!137503 (= lt!562988 e!706540)))

(declare-fun res!831303 () Bool)

(assert (=> d!137503 (=> (not res!831303) (not e!706540))))

(assert (=> d!137503 (= res!831303 (is-Cons!27482 Nil!27483))))

(assert (=> d!137503 (= (contains!7452 Nil!27483 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562988)))

(declare-fun b!1245889 () Bool)

(declare-fun e!706539 () Bool)

(assert (=> b!1245889 (= e!706540 e!706539)))

(declare-fun res!831302 () Bool)

(assert (=> b!1245889 (=> res!831302 e!706539)))

(assert (=> b!1245889 (= res!831302 (= (h!28691 Nil!27483) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245890 () Bool)

(assert (=> b!1245890 (= e!706539 (contains!7452 (t!40955 Nil!27483) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!137503 res!831303) b!1245889))

(assert (= (and b!1245889 (not res!831302)) b!1245890))

(assert (=> d!137503 m!1147853))

(declare-fun m!1147859 () Bool)

(assert (=> d!137503 m!1147859))

(declare-fun m!1147861 () Bool)

(assert (=> b!1245890 m!1147861))

(assert (=> b!1245810 d!137503))

(declare-fun d!137505 () Bool)

(assert (=> d!137505 (= (validKeyInArray!0 (select (arr!38683 a!3892) from!3270)) (and (not (= (select (arr!38683 a!3892) from!3270) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!38683 a!3892) from!3270) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1245816 d!137505))

(declare-fun d!137507 () Bool)

(declare-fun lt!562989 () Bool)

(assert (=> d!137507 (= lt!562989 (member #b0000000000000000000000000000000000000000000000000000000000000000 (content!624 lt!562974)))))

(declare-fun e!706544 () Bool)

(assert (=> d!137507 (= lt!562989 e!706544)))

(declare-fun res!831307 () Bool)

(assert (=> d!137507 (=> (not res!831307) (not e!706544))))

(assert (=> d!137507 (= res!831307 (is-Cons!27482 lt!562974))))

(assert (=> d!137507 (= (contains!7452 lt!562974 #b0000000000000000000000000000000000000000000000000000000000000000) lt!562989)))

(declare-fun b!1245893 () Bool)

(declare-fun e!706543 () Bool)

(assert (=> b!1245893 (= e!706544 e!706543)))

(declare-fun res!831306 () Bool)

(assert (=> b!1245893 (=> res!831306 e!706543)))

(assert (=> b!1245893 (= res!831306 (= (h!28691 lt!562974) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1245894 () Bool)

(assert (=> b!1245894 (= e!706543 (contains!7452 (t!40955 lt!562974) #b0000000000000000000000000000000000000000000000000000000000000000))))

