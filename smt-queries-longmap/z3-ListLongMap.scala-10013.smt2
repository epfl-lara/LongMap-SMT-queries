; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118126 () Bool)

(assert start!118126)

(declare-fun b!1382707 () Bool)

(declare-fun res!924344 () Bool)

(declare-fun e!783696 () Bool)

(assert (=> b!1382707 (=> (not res!924344) (not e!783696))))

(declare-datatypes ((array!94429 0))(
  ( (array!94430 (arr!45595 (Array (_ BitVec 32) (_ BitVec 64))) (size!46147 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94429)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1382707 (= res!924344 (validKeyInArray!0 (select (arr!45595 a!2938) i!1065)))))

(declare-fun b!1382708 () Bool)

(declare-fun res!924343 () Bool)

(assert (=> b!1382708 (=> (not res!924343) (not e!783696))))

(assert (=> b!1382708 (= res!924343 (and (bvsle #b00000000000000000000000000000000 (size!46147 a!2938)) (bvslt (size!46147 a!2938) #b01111111111111111111111111111111)))))

(declare-fun res!924341 () Bool)

(assert (=> start!118126 (=> (not res!924341) (not e!783696))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118126 (= res!924341 (validMask!0 mask!2987))))

(assert (=> start!118126 e!783696))

(assert (=> start!118126 true))

(declare-fun array_inv!34828 (array!94429) Bool)

(assert (=> start!118126 (array_inv!34828 a!2938)))

(declare-fun b!1382706 () Bool)

(declare-fun res!924342 () Bool)

(assert (=> b!1382706 (=> (not res!924342) (not e!783696))))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1382706 (= res!924342 (and (= (size!46147 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46147 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46147 a!2938))))))

(declare-fun b!1382709 () Bool)

(declare-datatypes ((List!32201 0))(
  ( (Nil!32198) (Cons!32197 (h!33406 (_ BitVec 64)) (t!46887 List!32201)) )
))
(declare-fun noDuplicate!2616 (List!32201) Bool)

(assert (=> b!1382709 (= e!783696 (not (noDuplicate!2616 Nil!32198)))))

(assert (= (and start!118126 res!924341) b!1382706))

(assert (= (and b!1382706 res!924342) b!1382707))

(assert (= (and b!1382707 res!924344) b!1382708))

(assert (= (and b!1382708 res!924343) b!1382709))

(declare-fun m!1267395 () Bool)

(assert (=> b!1382707 m!1267395))

(assert (=> b!1382707 m!1267395))

(declare-fun m!1267397 () Bool)

(assert (=> b!1382707 m!1267397))

(declare-fun m!1267399 () Bool)

(assert (=> start!118126 m!1267399))

(declare-fun m!1267401 () Bool)

(assert (=> start!118126 m!1267401))

(declare-fun m!1267403 () Bool)

(assert (=> b!1382709 m!1267403))

(check-sat (not b!1382707) (not start!118126) (not b!1382709))
(check-sat)
(get-model)

(declare-fun d!149101 () Bool)

(assert (=> d!149101 (= (validKeyInArray!0 (select (arr!45595 a!2938) i!1065)) (and (not (= (select (arr!45595 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45595 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1382707 d!149101))

(declare-fun d!149103 () Bool)

(assert (=> d!149103 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118126 d!149103))

(declare-fun d!149111 () Bool)

(assert (=> d!149111 (= (array_inv!34828 a!2938) (bvsge (size!46147 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118126 d!149111))

(declare-fun d!149115 () Bool)

(declare-fun res!924385 () Bool)

(declare-fun e!783726 () Bool)

(assert (=> d!149115 (=> res!924385 e!783726)))

(get-info :version)

(assert (=> d!149115 (= res!924385 ((_ is Nil!32198) Nil!32198))))

(assert (=> d!149115 (= (noDuplicate!2616 Nil!32198) e!783726)))

(declare-fun b!1382750 () Bool)

(declare-fun e!783727 () Bool)

(assert (=> b!1382750 (= e!783726 e!783727)))

(declare-fun res!924386 () Bool)

(assert (=> b!1382750 (=> (not res!924386) (not e!783727))))

(declare-fun contains!9701 (List!32201 (_ BitVec 64)) Bool)

(assert (=> b!1382750 (= res!924386 (not (contains!9701 (t!46887 Nil!32198) (h!33406 Nil!32198))))))

(declare-fun b!1382751 () Bool)

(assert (=> b!1382751 (= e!783727 (noDuplicate!2616 (t!46887 Nil!32198)))))

(assert (= (and d!149115 (not res!924385)) b!1382750))

(assert (= (and b!1382750 res!924386) b!1382751))

(declare-fun m!1267433 () Bool)

(assert (=> b!1382750 m!1267433))

(declare-fun m!1267435 () Bool)

(assert (=> b!1382751 m!1267435))

(assert (=> b!1382709 d!149115))

(check-sat (not b!1382750) (not b!1382751))
(check-sat)
