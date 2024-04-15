; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!117818 () Bool)

(assert start!117818)

(declare-fun b!1381207 () Bool)

(declare-fun res!922878 () Bool)

(declare-fun e!782935 () Bool)

(assert (=> b!1381207 (=> (not res!922878) (not e!782935))))

(declare-datatypes ((array!94209 0))(
  ( (array!94210 (arr!45490 (Array (_ BitVec 32) (_ BitVec 64))) (size!46042 (_ BitVec 32))) )
))
(declare-fun a!2971 () array!94209)

(declare-fun i!1094 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1381207 (= res!922878 (validKeyInArray!0 (select (arr!45490 a!2971) i!1094)))))

(declare-fun b!1381209 () Bool)

(declare-datatypes ((List!32102 0))(
  ( (Nil!32099) (Cons!32098 (h!33307 (_ BitVec 64)) (t!46788 List!32102)) )
))
(declare-fun noDuplicate!2610 (List!32102) Bool)

(assert (=> b!1381209 (= e!782935 (not (noDuplicate!2610 Nil!32099)))))

(declare-fun b!1381206 () Bool)

(declare-fun res!922877 () Bool)

(assert (=> b!1381206 (=> (not res!922877) (not e!782935))))

(declare-fun mask!3034 () (_ BitVec 32))

(assert (=> b!1381206 (= res!922877 (and (= (size!46042 a!2971) (bvadd #b00000000000000000000000000000001 mask!3034)) (bvsge i!1094 #b00000000000000000000000000000000) (bvslt i!1094 (size!46042 a!2971))))))

(declare-fun b!1381208 () Bool)

(declare-fun res!922879 () Bool)

(assert (=> b!1381208 (=> (not res!922879) (not e!782935))))

(assert (=> b!1381208 (= res!922879 (and (bvsle #b00000000000000000000000000000000 (size!46042 a!2971)) (bvslt (size!46042 a!2971) #b01111111111111111111111111111111)))))

(declare-fun res!922880 () Bool)

(assert (=> start!117818 (=> (not res!922880) (not e!782935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!117818 (= res!922880 (validMask!0 mask!3034))))

(assert (=> start!117818 e!782935))

(assert (=> start!117818 true))

(declare-fun array_inv!34723 (array!94209) Bool)

(assert (=> start!117818 (array_inv!34723 a!2971)))

(assert (= (and start!117818 res!922880) b!1381206))

(assert (= (and b!1381206 res!922877) b!1381207))

(assert (= (and b!1381207 res!922878) b!1381208))

(assert (= (and b!1381208 res!922879) b!1381209))

(declare-fun m!1265973 () Bool)

(assert (=> b!1381207 m!1265973))

(assert (=> b!1381207 m!1265973))

(declare-fun m!1265975 () Bool)

(assert (=> b!1381207 m!1265975))

(declare-fun m!1265977 () Bool)

(assert (=> b!1381209 m!1265977))

(declare-fun m!1265979 () Bool)

(assert (=> start!117818 m!1265979))

(declare-fun m!1265981 () Bool)

(assert (=> start!117818 m!1265981))

(check-sat (not start!117818) (not b!1381207) (not b!1381209))
(check-sat)
(get-model)

(declare-fun d!148927 () Bool)

(assert (=> d!148927 (= (validMask!0 mask!3034) (and (or (= mask!3034 #b00000000000000000000000000000111) (= mask!3034 #b00000000000000000000000000001111) (= mask!3034 #b00000000000000000000000000011111) (= mask!3034 #b00000000000000000000000000111111) (= mask!3034 #b00000000000000000000000001111111) (= mask!3034 #b00000000000000000000000011111111) (= mask!3034 #b00000000000000000000000111111111) (= mask!3034 #b00000000000000000000001111111111) (= mask!3034 #b00000000000000000000011111111111) (= mask!3034 #b00000000000000000000111111111111) (= mask!3034 #b00000000000000000001111111111111) (= mask!3034 #b00000000000000000011111111111111) (= mask!3034 #b00000000000000000111111111111111) (= mask!3034 #b00000000000000001111111111111111) (= mask!3034 #b00000000000000011111111111111111) (= mask!3034 #b00000000000000111111111111111111) (= mask!3034 #b00000000000001111111111111111111) (= mask!3034 #b00000000000011111111111111111111) (= mask!3034 #b00000000000111111111111111111111) (= mask!3034 #b00000000001111111111111111111111) (= mask!3034 #b00000000011111111111111111111111) (= mask!3034 #b00000000111111111111111111111111) (= mask!3034 #b00000001111111111111111111111111) (= mask!3034 #b00000011111111111111111111111111) (= mask!3034 #b00000111111111111111111111111111) (= mask!3034 #b00001111111111111111111111111111) (= mask!3034 #b00011111111111111111111111111111) (= mask!3034 #b00111111111111111111111111111111)) (bvsle mask!3034 #b00111111111111111111111111111111)))))

(assert (=> start!117818 d!148927))

(declare-fun d!148933 () Bool)

(assert (=> d!148933 (= (array_inv!34723 a!2971) (bvsge (size!46042 a!2971) #b00000000000000000000000000000000))))

(assert (=> start!117818 d!148933))

(declare-fun d!148935 () Bool)

(assert (=> d!148935 (= (validKeyInArray!0 (select (arr!45490 a!2971) i!1094)) (and (not (= (select (arr!45490 a!2971) i!1094) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45490 a!2971) i!1094) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1381207 d!148935))

(declare-fun d!148937 () Bool)

(declare-fun res!922909 () Bool)

(declare-fun e!782952 () Bool)

(assert (=> d!148937 (=> res!922909 e!782952)))

(get-info :version)

(assert (=> d!148937 (= res!922909 ((_ is Nil!32099) Nil!32099))))

(assert (=> d!148937 (= (noDuplicate!2610 Nil!32099) e!782952)))

(declare-fun b!1381238 () Bool)

(declare-fun e!782953 () Bool)

(assert (=> b!1381238 (= e!782952 e!782953)))

(declare-fun res!922910 () Bool)

(assert (=> b!1381238 (=> (not res!922910) (not e!782953))))

(declare-fun contains!9695 (List!32102 (_ BitVec 64)) Bool)

(assert (=> b!1381238 (= res!922910 (not (contains!9695 (t!46788 Nil!32099) (h!33307 Nil!32099))))))

(declare-fun b!1381239 () Bool)

(assert (=> b!1381239 (= e!782953 (noDuplicate!2610 (t!46788 Nil!32099)))))

(assert (= (and d!148937 (not res!922909)) b!1381238))

(assert (= (and b!1381238 res!922910) b!1381239))

(declare-fun m!1266003 () Bool)

(assert (=> b!1381238 m!1266003))

(declare-fun m!1266005 () Bool)

(assert (=> b!1381239 m!1266005))

(assert (=> b!1381209 d!148937))

(check-sat (not b!1381239) (not b!1381238))
(check-sat)
