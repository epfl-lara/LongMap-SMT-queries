; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!118322 () Bool)

(assert start!118322)

(declare-fun res!924859 () Bool)

(declare-fun e!784558 () Bool)

(assert (=> start!118322 (=> (not res!924859) (not e!784558))))

(declare-fun mask!2987 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!118322 (= res!924859 (validMask!0 mask!2987))))

(assert (=> start!118322 e!784558))

(assert (=> start!118322 true))

(declare-datatypes ((array!94582 0))(
  ( (array!94583 (arr!45670 (Array (_ BitVec 32) (_ BitVec 64))) (size!46221 (_ BitVec 32))) )
))
(declare-fun a!2938 () array!94582)

(declare-fun array_inv!34951 (array!94582) Bool)

(assert (=> start!118322 (array_inv!34951 a!2938)))

(declare-fun b!1384054 () Bool)

(declare-fun res!924857 () Bool)

(assert (=> b!1384054 (=> (not res!924857) (not e!784558))))

(declare-fun i!1065 () (_ BitVec 32))

(declare-fun startIndex!16 () (_ BitVec 32))

(assert (=> b!1384054 (= res!924857 (and (= (size!46221 a!2938) (bvadd #b00000000000000000000000000000001 mask!2987)) (bvsge i!1065 #b00000000000000000000000000000000) (bvslt i!1065 (size!46221 a!2938)) (bvsge startIndex!16 #b00000000000000000000000000000000) (bvslt startIndex!16 (size!46221 a!2938))))))

(declare-fun b!1384055 () Bool)

(declare-fun res!924858 () Bool)

(assert (=> b!1384055 (=> (not res!924858) (not e!784558))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1384055 (= res!924858 (validKeyInArray!0 (select (arr!45670 a!2938) i!1065)))))

(declare-fun b!1384056 () Bool)

(assert (=> b!1384056 (= e!784558 (and (bvsle #b00000000000000000000000000000000 (size!46221 a!2938)) (bvsge (size!46221 a!2938) #b01111111111111111111111111111111)))))

(assert (= (and start!118322 res!924859) b!1384054))

(assert (= (and b!1384054 res!924857) b!1384055))

(assert (= (and b!1384055 res!924858) b!1384056))

(declare-fun m!1269507 () Bool)

(assert (=> start!118322 m!1269507))

(declare-fun m!1269509 () Bool)

(assert (=> start!118322 m!1269509))

(declare-fun m!1269511 () Bool)

(assert (=> b!1384055 m!1269511))

(assert (=> b!1384055 m!1269511))

(declare-fun m!1269513 () Bool)

(assert (=> b!1384055 m!1269513))

(check-sat (not b!1384055) (not start!118322))
(check-sat)
(get-model)

(declare-fun d!149643 () Bool)

(assert (=> d!149643 (= (validKeyInArray!0 (select (arr!45670 a!2938) i!1065)) (and (not (= (select (arr!45670 a!2938) i!1065) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!45670 a!2938) i!1065) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1384055 d!149643))

(declare-fun d!149645 () Bool)

(assert (=> d!149645 (= (validMask!0 mask!2987) (and (or (= mask!2987 #b00000000000000000000000000000111) (= mask!2987 #b00000000000000000000000000001111) (= mask!2987 #b00000000000000000000000000011111) (= mask!2987 #b00000000000000000000000000111111) (= mask!2987 #b00000000000000000000000001111111) (= mask!2987 #b00000000000000000000000011111111) (= mask!2987 #b00000000000000000000000111111111) (= mask!2987 #b00000000000000000000001111111111) (= mask!2987 #b00000000000000000000011111111111) (= mask!2987 #b00000000000000000000111111111111) (= mask!2987 #b00000000000000000001111111111111) (= mask!2987 #b00000000000000000011111111111111) (= mask!2987 #b00000000000000000111111111111111) (= mask!2987 #b00000000000000001111111111111111) (= mask!2987 #b00000000000000011111111111111111) (= mask!2987 #b00000000000000111111111111111111) (= mask!2987 #b00000000000001111111111111111111) (= mask!2987 #b00000000000011111111111111111111) (= mask!2987 #b00000000000111111111111111111111) (= mask!2987 #b00000000001111111111111111111111) (= mask!2987 #b00000000011111111111111111111111) (= mask!2987 #b00000000111111111111111111111111) (= mask!2987 #b00000001111111111111111111111111) (= mask!2987 #b00000011111111111111111111111111) (= mask!2987 #b00000111111111111111111111111111) (= mask!2987 #b00001111111111111111111111111111) (= mask!2987 #b00011111111111111111111111111111) (= mask!2987 #b00111111111111111111111111111111)) (bvsle mask!2987 #b00111111111111111111111111111111)))))

(assert (=> start!118322 d!149645))

(declare-fun d!149653 () Bool)

(assert (=> d!149653 (= (array_inv!34951 a!2938) (bvsge (size!46221 a!2938) #b00000000000000000000000000000000))))

(assert (=> start!118322 d!149653))

(check-sat)
