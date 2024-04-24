; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118370 () Bool)

(assert start!118370)

(declare-fun b!1384141 () Bool)

(declare-fun e!784615 () Bool)

(declare-datatypes ((List!32191 0))(
  ( (Nil!32188) (Cons!32187 (h!33405 (_ BitVec 64)) (t!46877 List!32191)) )
))
(declare-fun contains!9782 (List!32191 (_ BitVec 64)) Bool)

(assert (=> b!1384141 (= e!784615 (contains!9782 Nil!32188 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1384142 () Bool)

(declare-fun e!784613 () Bool)

(assert (=> b!1384142 (= e!784613 e!784615)))

(declare-fun res!924947 () Bool)

(assert (=> b!1384142 (=> res!924947 e!784615)))

(assert (=> b!1384142 (= res!924947 (contains!9782 Nil!32188 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1384143 () Bool)

(declare-fun res!924944 () Bool)

(assert (=> b!1384143 (=> (not res!924944) (not e!784613))))

(declare-datatypes ((array!94598 0))(
  ( (array!94599 (arr!45676 (Array (_ BitVec 32) (_ BitVec 64))) (size!46227 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94598)

(assert (=> b!1384143 (= res!924944 (and (bvsle #b00000000000000000000000000000000 (size!46227 a!2938)) (bvslt (size!46227 a!2938) #b01111111111111111111111111111111)))))

(declare-fun b!1384144 () Bool)

(declare-fun res!924945 () Bool)

(assert (=> b!1384144 (=> (not res!924945) (not e!784613))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384144 (= res!924945 (and (= (size!46227 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46227 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46227 a!2938))))))

(declare-fun b!1384145 () Bool)

(declare-fun res!924949 () Bool)

(assert (=> b!1384145 (=> (not res!924949) (not e!784613))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384145 (= res!924949 (validKeyInArray!0 (select (arr!45676 a!2938) i!1065)))))

(declare-fun b!1384146 () Bool)

(declare-fun res!924946 () Bool)

(assert (=> b!1384146 (=> (not res!924946) (not e!784613))))

(declare-fun noDuplicate!2614 (List!32191) Bool)

(assert (=> b!1384146 (= res!924946 (noDuplicate!2614 Nil!32188))))

(declare-fun res!924948 () Bool)

(assert (=> start!118370 (=> (not res!924948) (not e!784613))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118370 (= res!924948 (validMask!0 mask!2987))))

(assert (=> start!118370 e!784613))

(assert (=> start!118370 true))

(declare-fun array_inv!34957 (array!94598) Bool)

(assert (=> start!118370 (array_inv!34957 a!2938)))

(assert (= (and start!118370 res!924948) b!1384144))

(assert (= (and b!1384144 res!924945) b!1384145))

(assert (= (and b!1384145 res!924949) b!1384143))

(assert (= (and b!1384143 res!924944) b!1384146))

(assert (= (and b!1384146 res!924946) b!1384142))

(assert (= (and b!1384142 (not res!924947)) b!1384141))

(declare-fun m!1269573 () Bool)

(assert (=> b!1384146 m!1269573))

(declare-fun m!1269575 () Bool)

(assert (=> b!1384142 m!1269575))

(declare-fun m!1269577 () Bool)

(assert (=> start!118370 m!1269577))

(declare-fun m!1269579 () Bool)

(assert (=> start!118370 m!1269579))

(declare-fun m!1269581 () Bool)

(assert (=> b!1384145 m!1269581))

(assert (=> b!1384145 m!1269581))

(declare-fun m!1269583 () Bool)

(assert (=> b!1384145 m!1269583))

(declare-fun m!1269585 () Bool)

(assert (=> b!1384141 m!1269585))

(check-sat (not b!1384141) (not start!118370) (not b!1384142) (not b!1384146) (not b!1384145))
(check-sat)
(get-model)

(declare-fun d!149683 () Bool)

(declare-fun lt!608958 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!753 (List!32191) (InoxSet (_ BitVec 64)))

(assert (=> d!149683 (= lt!608958 (select (content!753 Nil!32188) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!784639 () Bool)

(assert (=> d!149683 (= lt!608958 e!784639)))

(declare-fun res!924990 () Bool)

(assert (=> d!149683 (=> (not res!924990) (not e!784639))))

(get-info :version)

(assert (=> d!149683 (= res!924990 ((_ is Cons!32187) Nil!32188))))

(assert (=> d!149683 (= (contains!9782 Nil!32188 #b0000000000000000000000000000000000000000000000000000000000000000) lt!608958)))

(declare-fun b!1384187 () Bool)

(declare-fun e!784638 () Bool)

(assert (=> b!1384187 (= e!784639 e!784638)))

(declare-fun res!924991 () Bool)

(assert (=> b!1384187 (=> res!924991 e!784638)))

(assert (=> b!1384187 (= res!924991 (= (h!33405 Nil!32188) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1384188 () Bool)

(assert (=> b!1384188 (= e!784638 (contains!9782 (t!46877 Nil!32188) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149683 res!924990) b!1384187))

(assert (= (and b!1384187 (not res!924991)) b!1384188))

(declare-fun m!1269615 () Bool)

(assert (=> d!149683 m!1269615))

(declare-fun m!1269617 () Bool)

(assert (=> d!149683 m!1269617))

(declare-fun m!1269619 () Bool)

(assert (=> b!1384188 m!1269619))

(assert (=> b!1384142 d!149683))

(declare-fun d!149685 () Bool)

(declare-fun res!924996 () Bool)

(declare-fun e!784644 () Bool)

(assert (=> d!149685 (=> res!924996 e!784644)))

(assert (=> d!149685 (= res!924996 ((_ is Nil!32188) Nil!32188))))

(assert (=> d!149685 (= (noDuplicate!2614 Nil!32188) e!784644)))

(declare-fun b!1384193 () Bool)

(declare-fun e!784645 () Bool)

(assert (=> b!1384193 (= e!784644 e!784645)))

(declare-fun res!924997 () Bool)

(assert (=> b!1384193 (=> (not res!924997) (not e!784645))))

(assert (=> b!1384193 (= res!924997 (not (contains!9782 (t!46877 Nil!32188) (h!33405 Nil!32188))))))

(declare-fun b!1384194 () Bool)

(assert (=> b!1384194 (= e!784645 (noDuplicate!2614 (t!46877 Nil!32188)))))

(assert (= (and d!149685 (not res!924996)) b!1384193))

(assert (= (and b!1384193 res!924997) b!1384194))

(declare-fun m!1269621 () Bool)

(assert (=> b!1384193 m!1269621))

(declare-fun m!1269623 () Bool)

(assert (=> b!1384194 m!1269623))

(assert (=> b!1384146 d!149685))

(declare-fun d!149687 () Bool)

(declare-fun lt!608959 () Bool)

(assert (=> d!149687 (= lt!608959 (select (content!753 Nil!32188) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!784647 () Bool)

(assert (=> d!149687 (= lt!608959 e!784647)))

(declare-fun res!924998 () Bool)

(assert (=> d!149687 (=> (not res!924998) (not e!784647))))

(assert (=> d!149687 (= res!924998 ((_ is Cons!32187) Nil!32188))))

(assert (=> d!149687 (= (contains!9782 Nil!32188 #b1000000000000000000000000000000000000000000000000000000000000000) lt!608959)))

(declare-fun b!1384195 () Bool)

(declare-fun e!784646 () Bool)

(assert (=> b!1384195 (= e!784647 e!784646)))

(declare-fun res!924999 () Bool)

(assert (=> b!1384195 (=> res!924999 e!784646)))

(assert (=> b!1384195 (= res!924999 (= (h!33405 Nil!32188) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1384196 () Bool)

(assert (=> b!1384196 (= e!784646 (contains!9782 (t!46877 Nil!32188) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!149687 res!924998) b!1384195))

(assert (= (and b!1384195 (not res!924999)) b!1384196))

(assert (=> d!149687 m!1269615))

(declare-fun m!1269625 () Bool)

(assert (=> d!149687 m!1269625))

(declare-fun m!1269627 () Bool)

(assert (=> b!1384196 m!1269627))

(assert (=> b!1384141 d!149687))

(declare-fun d!149689 () Bool)

(assert (=> d!149689 (= (validKeyInArray!0 (select (arr!45676 a!2938) i!1065)) (and (not (= (select (arr!45676 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45676 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1384145 d!149689))

(declare-fun d!149691 () Bool)

(assert (=> d!149691 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118370 d!149691))

(declare-fun d!149701 () Bool)

(assert (=> d!149701 (= (array_inv!34957 a!2938) (bvsge (size!46227 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118370 d!149701))

(check-sat (not b!1384194) (not b!1384188) (not d!149683) (not b!1384196) (not d!149687) (not b!1384193))
(check-sat)
