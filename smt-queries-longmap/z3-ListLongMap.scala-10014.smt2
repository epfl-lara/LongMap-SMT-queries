; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118154 () Bool)

(assert start!118154)

(declare-fun b!1382764 () Bool)

(declare-fun res!924401 () Bool)

(declare-fun e!783734 () Bool)

(assert (=> b!1382764 (=> (not res!924401) (not e!783734))))

(declare-datatypes ((array!94437 0))(
  ( (array!94438 (arr!45598 (Array (_ BitVec 32) (_ BitVec 64))) (size!46150 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94437)

(assert (=> b!1382764 (= res!924401 (and (bvsle #b00000000000000000000000000000000 (size!46150 a!2938)) (bvslt (size!46150 a!2938) #b01111111111111111111111111111111)))))

(declare-fun res!924403 () Bool)

(assert (=> start!118154 (=> (not res!924403) (not e!783734))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118154 (= res!924403 (validMask!0 mask!2987))))

(assert (=> start!118154 e!783734))

(assert (=> start!118154 true))

(declare-fun array_inv!34831 (array!94437) Bool)

(assert (=> start!118154 (array_inv!34831 a!2938)))

(declare-fun b!1382765 () Bool)

(declare-fun res!924400 () Bool)

(assert (=> b!1382765 (=> (not res!924400) (not e!783734))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382765 (= res!924400 (and (= (size!46150 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46150 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46150 a!2938))))))

(declare-fun b!1382766 () Bool)

(declare-fun res!924399 () Bool)

(assert (=> b!1382766 (=> (not res!924399) (not e!783734))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382766 (= res!924399 (validKeyInArray!0 (select (arr!45598 a!2938) i!1065)))))

(declare-fun b!1382767 () Bool)

(declare-fun res!924404 () Bool)

(assert (=> b!1382767 (=> (not res!924404) (not e!783734))))

(declare-datatypes ((List!32204 0))(
  ( (Nil!32201) (Cons!32200 (h!33409 (_ BitVec 64)) (t!46890 List!32204)) )
))
(declare-fun noDuplicate!2619 (List!32204) Bool)

(assert (=> b!1382767 (= res!924404 (noDuplicate!2619 Nil!32201))))

(declare-fun b!1382768 () Bool)

(declare-fun e!783735 () Bool)

(assert (=> b!1382768 (= e!783734 e!783735)))

(declare-fun res!924402 () Bool)

(assert (=> b!1382768 (=> res!924402 e!783735)))

(declare-fun contains!9702 (List!32204 (_ BitVec 64)) Bool)

(assert (=> b!1382768 (= res!924402 (contains!9702 Nil!32201 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382769 () Bool)

(assert (=> b!1382769 (= e!783735 (contains!9702 Nil!32201 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!118154 res!924403) b!1382765))

(assert (= (and b!1382765 res!924400) b!1382766))

(assert (= (and b!1382766 res!924399) b!1382764))

(assert (= (and b!1382764 res!924401) b!1382767))

(assert (= (and b!1382767 res!924404) b!1382768))

(assert (= (and b!1382768 (not res!924402)) b!1382769))

(declare-fun m!1267437 () Bool)

(assert (=> b!1382767 m!1267437))

(declare-fun m!1267439 () Bool)

(assert (=> b!1382769 m!1267439))

(declare-fun m!1267441 () Bool)

(assert (=> b!1382768 m!1267441))

(declare-fun m!1267443 () Bool)

(assert (=> b!1382766 m!1267443))

(assert (=> b!1382766 m!1267443))

(declare-fun m!1267445 () Bool)

(assert (=> b!1382766 m!1267445))

(declare-fun m!1267447 () Bool)

(assert (=> start!118154 m!1267447))

(declare-fun m!1267449 () Bool)

(assert (=> start!118154 m!1267449))

(check-sat (not b!1382769) (not b!1382767) (not b!1382766) (not b!1382768) (not start!118154))
(check-sat)
(get-model)

(declare-fun d!149125 () Bool)

(assert (=> d!149125 (= (validKeyInArray!0 (select (arr!45598 a!2938) i!1065)) (and (not (= (select (arr!45598 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45598 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382766 d!149125))

(declare-fun d!149127 () Bool)

(assert (=> d!149127 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118154 d!149127))

(declare-fun d!149135 () Bool)

(assert (=> d!149135 (= (array_inv!34831 a!2938) (bvsge (size!46150 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118154 d!149135))

(declare-fun d!149139 () Bool)

(declare-fun lt!608298 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!755 (List!32204) (InoxSet (_ BitVec 64)))

(assert (=> d!149139 (= lt!608298 (select (content!755 Nil!32201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!783774 () Bool)

(assert (=> d!149139 (= lt!608298 e!783774)))

(declare-fun res!924460 () Bool)

(assert (=> d!149139 (=> (not res!924460) (not e!783774))))

(get-info :version)

(assert (=> d!149139 (= res!924460 ((_ is Cons!32200) Nil!32201))))

(assert (=> d!149139 (= (contains!9702 Nil!32201 #b1000000000000000000000000000000000000000000000000000000000000000) lt!608298)))

(declare-fun b!1382824 () Bool)

(declare-fun e!783773 () Bool)

(assert (=> b!1382824 (= e!783774 e!783773)))

(declare-fun res!924459 () Bool)

(assert (=> b!1382824 (=> res!924459 e!783773)))

(assert (=> b!1382824 (= res!924459 (= (h!33409 Nil!32201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382825 () Bool)

(assert (=> b!1382825 (= e!783773 (contains!9702 (t!46890 Nil!32201) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149139 res!924460) b!1382824))

(assert (= (and b!1382824 (not res!924459)) b!1382825))

(declare-fun m!1267493 () Bool)

(assert (=> d!149139 m!1267493))

(declare-fun m!1267495 () Bool)

(assert (=> d!149139 m!1267495))

(declare-fun m!1267497 () Bool)

(assert (=> b!1382825 m!1267497))

(assert (=> b!1382769 d!149139))

(declare-fun d!149147 () Bool)

(declare-fun res!924465 () Bool)

(declare-fun e!783779 () Bool)

(assert (=> d!149147 (=> res!924465 e!783779)))

(assert (=> d!149147 (= res!924465 ((_ is Nil!32201) Nil!32201))))

(assert (=> d!149147 (= (noDuplicate!2619 Nil!32201) e!783779)))

(declare-fun b!1382830 () Bool)

(declare-fun e!783780 () Bool)

(assert (=> b!1382830 (= e!783779 e!783780)))

(declare-fun res!924466 () Bool)

(assert (=> b!1382830 (=> (not res!924466) (not e!783780))))

(assert (=> b!1382830 (= res!924466 (not (contains!9702 (t!46890 Nil!32201) (h!33409 Nil!32201))))))

(declare-fun b!1382831 () Bool)

(assert (=> b!1382831 (= e!783780 (noDuplicate!2619 (t!46890 Nil!32201)))))

(assert (= (and d!149147 (not res!924465)) b!1382830))

(assert (= (and b!1382830 res!924466) b!1382831))

(declare-fun m!1267499 () Bool)

(assert (=> b!1382830 m!1267499))

(declare-fun m!1267501 () Bool)

(assert (=> b!1382831 m!1267501))

(assert (=> b!1382767 d!149147))

(declare-fun d!149149 () Bool)

(declare-fun lt!608299 () Bool)

(assert (=> d!149149 (= lt!608299 (select (content!755 Nil!32201) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!783782 () Bool)

(assert (=> d!149149 (= lt!608299 e!783782)))

(declare-fun res!924468 () Bool)

(assert (=> d!149149 (=> (not res!924468) (not e!783782))))

(assert (=> d!149149 (= res!924468 ((_ is Cons!32200) Nil!32201))))

(assert (=> d!149149 (= (contains!9702 Nil!32201 #b0000000000000000000000000000000000000000000000000000000000000000) lt!608299)))

(declare-fun b!1382832 () Bool)

(declare-fun e!783781 () Bool)

(assert (=> b!1382832 (= e!783782 e!783781)))

(declare-fun res!924467 () Bool)

(assert (=> b!1382832 (=> res!924467 e!783781)))

(assert (=> b!1382832 (= res!924467 (= (h!33409 Nil!32201) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1382833 () Bool)

(assert (=> b!1382833 (= e!783781 (contains!9702 (t!46890 Nil!32201) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149149 res!924468) b!1382832))

(assert (= (and b!1382832 (not res!924467)) b!1382833))

(assert (=> d!149149 m!1267493))

(declare-fun m!1267503 () Bool)

(assert (=> d!149149 m!1267503))

(declare-fun m!1267505 () Bool)

(assert (=> b!1382833 m!1267505))

(assert (=> b!1382768 d!149149))

(check-sat (not b!1382833) (not d!149139) (not b!1382825) (not d!149149) (not b!1382831) (not b!1382830))
(check-sat)
