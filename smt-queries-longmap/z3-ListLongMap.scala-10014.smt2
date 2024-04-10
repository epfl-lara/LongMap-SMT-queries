; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118160 () Bool)

(assert start!118160)

(declare-fun res!924443 () Bool)

(declare-fun e!783774 () Bool)

(assert (=> start!118160 (=> (not res!924443) (not e!783774))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118160 (= res!924443 (validMask!0 mask!2987))))

(assert (=> start!118160 e!783774))

(assert (=> start!118160 true))

(declare-datatypes ((array!94490 0))(
  ( (array!94491 (arr!45624 (Array (_ BitVec 32) (_ BitVec 64))) (size!46174 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94490)

(declare-fun array_inv!34652 (array!94490) Bool)

(assert (=> start!118160 (array_inv!34652 a!2938)))

(declare-fun b!1382851 () Bool)

(declare-fun res!924444 () Bool)

(assert (=> b!1382851 (=> (not res!924444) (not e!783774))))

(assert (=> b!1382851 (= res!924444 (and (bvsle #b00000000000000000000000000000000 (size!46174 a!2938)) (bvslt (size!46174 a!2938) #b01111111111111111111111111111111)))))

(declare-fun b!1382852 () Bool)

(declare-fun res!924446 () Bool)

(assert (=> b!1382852 (=> (not res!924446) (not e!783774))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382852 (= res!924446 (and (= (size!46174 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46174 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46174 a!2938))))))

(declare-fun b!1382853 () Bool)

(declare-fun e!783775 () Bool)

(declare-datatypes ((List!32152 0))(
  ( (Nil!32149) (Cons!32148 (h!33357 (_ BitVec 64)) (t!46846 List!32152)) )
))
(declare-fun contains!9740 (List!32152 (_ BitVec 64)) Bool)

(assert (=> b!1382853 (= e!783775 (contains!9740 Nil!32149 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382854 () Bool)

(declare-fun res!924445 () Bool)

(assert (=> b!1382854 (=> (not res!924445) (not e!783774))))

(declare-fun noDuplicate!2598 (List!32152) Bool)

(assert (=> b!1382854 (= res!924445 (noDuplicate!2598 Nil!32149))))

(declare-fun b!1382855 () Bool)

(declare-fun res!924447 () Bool)

(assert (=> b!1382855 (=> (not res!924447) (not e!783774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382855 (= res!924447 (validKeyInArray!0 (select (arr!45624 a!2938) i!1065)))))

(declare-fun b!1382856 () Bool)

(assert (=> b!1382856 (= e!783774 e!783775)))

(declare-fun res!924448 () Bool)

(assert (=> b!1382856 (=> res!924448 e!783775)))

(assert (=> b!1382856 (= res!924448 (contains!9740 Nil!32149 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!118160 res!924443) b!1382852))

(assert (= (and b!1382852 res!924446) b!1382855))

(assert (= (and b!1382855 res!924447) b!1382851))

(assert (= (and b!1382851 res!924444) b!1382854))

(assert (= (and b!1382854 res!924445) b!1382856))

(assert (= (and b!1382856 (not res!924448)) b!1382853))

(declare-fun m!1267955 () Bool)

(assert (=> b!1382854 m!1267955))

(declare-fun m!1267957 () Bool)

(assert (=> b!1382855 m!1267957))

(assert (=> b!1382855 m!1267957))

(declare-fun m!1267959 () Bool)

(assert (=> b!1382855 m!1267959))

(declare-fun m!1267961 () Bool)

(assert (=> b!1382856 m!1267961))

(declare-fun m!1267963 () Bool)

(assert (=> start!118160 m!1267963))

(declare-fun m!1267965 () Bool)

(assert (=> start!118160 m!1267965))

(declare-fun m!1267967 () Bool)

(assert (=> b!1382853 m!1267967))

(check-sat (not b!1382854) (not b!1382853) (not b!1382856) (not start!118160) (not b!1382855))
(check-sat)
(get-model)

(declare-fun d!149245 () Bool)

(declare-fun lt!608478 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!758 (List!32152) (InoxSet (_ BitVec 64)))

(assert (=> d!149245 (= lt!608478 (select (content!758 Nil!32149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!783791 () Bool)

(assert (=> d!149245 (= lt!608478 e!783791)))

(declare-fun res!924471 () Bool)

(assert (=> d!149245 (=> (not res!924471) (not e!783791))))

(get-info :version)

(assert (=> d!149245 (= res!924471 ((_ is Cons!32148) Nil!32149))))

(assert (=> d!149245 (= (contains!9740 Nil!32149 #b0000000000000000000000000000000000000000000000000000000000000000) lt!608478)))

(declare-fun b!1382879 () Bool)

(declare-fun e!783790 () Bool)

(assert (=> b!1382879 (= e!783791 e!783790)))

(declare-fun res!924472 () Bool)

(assert (=> b!1382879 (=> res!924472 e!783790)))

(assert (=> b!1382879 (= res!924472 (= (h!33357 Nil!32149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382880 () Bool)

(assert (=> b!1382880 (= e!783790 (contains!9740 (t!46846 Nil!32149) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149245 res!924471) b!1382879))

(assert (= (and b!1382879 (not res!924472)) b!1382880))

(declare-fun m!1267983 () Bool)

(assert (=> d!149245 m!1267983))

(declare-fun m!1267985 () Bool)

(assert (=> d!149245 m!1267985))

(declare-fun m!1267987 () Bool)

(assert (=> b!1382880 m!1267987))

(assert (=> b!1382856 d!149245))

(declare-fun d!149247 () Bool)

(declare-fun res!924477 () Bool)

(declare-fun e!783796 () Bool)

(assert (=> d!149247 (=> res!924477 e!783796)))

(assert (=> d!149247 (= res!924477 ((_ is Nil!32149) Nil!32149))))

(assert (=> d!149247 (= (noDuplicate!2598 Nil!32149) e!783796)))

(declare-fun b!1382885 () Bool)

(declare-fun e!783797 () Bool)

(assert (=> b!1382885 (= e!783796 e!783797)))

(declare-fun res!924478 () Bool)

(assert (=> b!1382885 (=> (not res!924478) (not e!783797))))

(assert (=> b!1382885 (= res!924478 (not (contains!9740 (t!46846 Nil!32149) (h!33357 Nil!32149))))))

(declare-fun b!1382886 () Bool)

(assert (=> b!1382886 (= e!783797 (noDuplicate!2598 (t!46846 Nil!32149)))))

(assert (= (and d!149247 (not res!924477)) b!1382885))

(assert (= (and b!1382885 res!924478) b!1382886))

(declare-fun m!1267989 () Bool)

(assert (=> b!1382885 m!1267989))

(declare-fun m!1267991 () Bool)

(assert (=> b!1382886 m!1267991))

(assert (=> b!1382854 d!149247))

(declare-fun d!149249 () Bool)

(assert (=> d!149249 (= (validKeyInArray!0 (select (arr!45624 a!2938) i!1065)) (and (not (= (select (arr!45624 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45624 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382855 d!149249))

(declare-fun d!149251 () Bool)

(declare-fun lt!608479 () Bool)

(assert (=> d!149251 (= lt!608479 (select (content!758 Nil!32149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!783799 () Bool)

(assert (=> d!149251 (= lt!608479 e!783799)))

(declare-fun res!924479 () Bool)

(assert (=> d!149251 (=> (not res!924479) (not e!783799))))

(assert (=> d!149251 (= res!924479 ((_ is Cons!32148) Nil!32149))))

(assert (=> d!149251 (= (contains!9740 Nil!32149 #b1000000000000000000000000000000000000000000000000000000000000000) lt!608479)))

(declare-fun b!1382887 () Bool)

(declare-fun e!783798 () Bool)

(assert (=> b!1382887 (= e!783799 e!783798)))

(declare-fun res!924480 () Bool)

(assert (=> b!1382887 (=> res!924480 e!783798)))

(assert (=> b!1382887 (= res!924480 (= (h!33357 Nil!32149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382888 () Bool)

(assert (=> b!1382888 (= e!783798 (contains!9740 (t!46846 Nil!32149) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149251 res!924479) b!1382887))

(assert (= (and b!1382887 (not res!924480)) b!1382888))

(assert (=> d!149251 m!1267983))

(declare-fun m!1267993 () Bool)

(assert (=> d!149251 m!1267993))

(declare-fun m!1267995 () Bool)

(assert (=> b!1382888 m!1267995))

(assert (=> b!1382853 d!149251))

(declare-fun d!149253 () Bool)

(assert (=> d!149253 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118160 d!149253))

(declare-fun d!149263 () Bool)

(assert (=> d!149263 (= (array_inv!34652 a!2938) (bvsge (size!46174 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118160 d!149263))

(check-sat (not b!1382888) (not b!1382885) (not d!149251) (not b!1382880) (not d!149245) (not b!1382886))
(check-sat)
