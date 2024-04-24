; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118340 () Bool)

(assert start!118340)

(declare-fun b!1384086 () Bool)

(declare-fun e!784575 () Bool)

(declare-datatypes ((List!32188 0))(
  ( (Nil!32185) (Cons!32184 (h!33402 (_ BitVec 64)) (t!46874 List!32188)) )
))
(declare-fun noDuplicate!2611 (List!32188) Bool)

(assert (=> b!1384086 (= e!784575 (not (noDuplicate!2611 Nil!32185)))))

(declare-fun b!1384084 () Bool)

(declare-fun res!924886 () Bool)

(assert (=> b!1384084 (=> (not res!924886) (not e!784575))))

(declare-datatypes ((array!94589 0))(
  ( (array!94590 (arr!45673 (Array (_ BitVec 32) (_ BitVec 64))) (size!46224 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94589)

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384084 (= res!924886 (validKeyInArray!0 (select (arr!45673 a!2938) i!1065)))))

(declare-fun b!1384083 () Bool)

(declare-fun res!924889 () Bool)

(assert (=> b!1384083 (=> (not res!924889) (not e!784575))))

(declare-fun startIndex!16 () (_ BitVec 32))

(declare-fun mask!2987 () (_ BitVec 32))

(assert (=> b!1384083 (= res!924889 (and (= (size!46224 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46224 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46224 a!2938))))))

(declare-fun b!1384085 () Bool)

(declare-fun res!924887 () Bool)

(assert (=> b!1384085 (=> (not res!924887) (not e!784575))))

(assert (=> b!1384085 (= res!924887 (and (bvsle #b00000000000000000000000000000000 (size!46224 a!2938)) (bvslt (size!46224 a!2938) #b01111111111111111111111111111111)))))

(declare-fun res!924888 () Bool)

(assert (=> start!118340 (=> (not res!924888) (not e!784575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118340 (= res!924888 (validMask!0 mask!2987))))

(assert (=> start!118340 e!784575))

(assert (=> start!118340 true))

(declare-fun array_inv!34954 (array!94589) Bool)

(assert (=> start!118340 (array_inv!34954 a!2938)))

(assert (= (and start!118340 res!924888) b!1384083))

(assert (= (and b!1384083 res!924889) b!1384084))

(assert (= (and b!1384084 res!924886) b!1384085))

(assert (= (and b!1384085 res!924887) b!1384086))

(declare-fun m!1269531 () Bool)

(assert (=> b!1384086 m!1269531))

(declare-fun m!1269533 () Bool)

(assert (=> b!1384084 m!1269533))

(assert (=> b!1384084 m!1269533))

(declare-fun m!1269535 () Bool)

(assert (=> b!1384084 m!1269535))

(declare-fun m!1269537 () Bool)

(assert (=> start!118340 m!1269537))

(declare-fun m!1269539 () Bool)

(assert (=> start!118340 m!1269539))

(check-sat (not b!1384084) (not start!118340) (not b!1384086))
(check-sat)
(get-model)

(declare-fun d!149657 () Bool)

(assert (=> d!149657 (= (validKeyInArray!0 (select (arr!45673 a!2938) i!1065)) (and (not (= (select (arr!45673 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45673 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1384084 d!149657))

(declare-fun d!149659 () Bool)

(assert (=> d!149659 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118340 d!149659))

(declare-fun d!149669 () Bool)

(assert (=> d!149669 (= (array_inv!34954 a!2938) (bvsge (size!46224 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118340 d!149669))

(declare-fun d!149671 () Bool)

(declare-fun res!924918 () Bool)

(declare-fun e!784593 () Bool)

(assert (=> d!149671 (=> res!924918 e!784593)))

(get-info :version)

(assert (=> d!149671 (= res!924918 ((_ is Nil!32185) Nil!32185))))

(assert (=> d!149671 (= (noDuplicate!2611 Nil!32185) e!784593)))

(declare-fun b!1384115 () Bool)

(declare-fun e!784594 () Bool)

(assert (=> b!1384115 (= e!784593 e!784594)))

(declare-fun res!924919 () Bool)

(assert (=> b!1384115 (=> (not res!924919) (not e!784594))))

(declare-fun contains!9781 (List!32188 (_ BitVec 64)) Bool)

(assert (=> b!1384115 (= res!924919 (not (contains!9781 (t!46874 Nil!32185) (h!33402 Nil!32185))))))

(declare-fun b!1384116 () Bool)

(assert (=> b!1384116 (= e!784594 (noDuplicate!2611 (t!46874 Nil!32185)))))

(assert (= (and d!149671 (not res!924918)) b!1384115))

(assert (= (and b!1384115 res!924919) b!1384116))

(declare-fun m!1269561 () Bool)

(assert (=> b!1384115 m!1269561))

(declare-fun m!1269563 () Bool)

(assert (=> b!1384116 m!1269563))

(assert (=> b!1384086 d!149671))

(check-sat (not b!1384116) (not b!1384115))
(check-sat)
