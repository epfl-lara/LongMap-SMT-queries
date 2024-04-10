; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!122224 () Bool)

(assert start!122224)

(declare-fun b!1417805 () Bool)

(declare-fun e!802367 () Bool)

(declare-datatypes ((array!96808 0))(
  ( (array!96809 (arr!46732 (Array (_ BitVec 32) (_ BitVec 64))) (size!47282 (_ BitVec 32))) )
))
(declare-fun a!2831 () array!96808)

(assert (=> b!1417805 (= e!802367 (and (bvsle #b00000000000000000000000000000000 (size!47282 a!2831)) (bvsge (size!47282 a!2831) #b01111111111111111111111111111111)))))

(declare-fun b!1417806 () Bool)

(declare-fun res!953539 () Bool)

(assert (=> b!1417806 (=> (not res!953539) (not e!802367))))

(declare-fun j!81 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1417806 (= res!953539 (validKeyInArray!0 (select (arr!46732 a!2831) j!81)))))

(declare-fun b!1417807 () Bool)

(declare-fun res!953535 () Bool)

(assert (=> b!1417807 (=> (not res!953535) (not e!802367))))

(declare-fun i!982 () (_ BitVec 32))

(assert (=> b!1417807 (= res!953535 (validKeyInArray!0 (select (arr!46732 a!2831) i!982)))))

(declare-fun b!1417808 () Bool)

(declare-fun res!953538 () Bool)

(assert (=> b!1417808 (=> (not res!953538) (not e!802367))))

(declare-fun mask!2608 () (_ BitVec 32))

(assert (=> b!1417808 (= res!953538 (and (= (size!47282 a!2831) (bvadd #b00000000000000000000000000000001 mask!2608)) (bvsge i!982 #b00000000000000000000000000000000) (bvslt i!982 (size!47282 a!2831)) (bvsge j!81 #b00000000000000000000000000000000) (bvslt j!81 (size!47282 a!2831)) (not (= i!982 j!81))))))

(declare-fun b!1417809 () Bool)

(declare-fun res!953536 () Bool)

(assert (=> b!1417809 (=> (not res!953536) (not e!802367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!96808 (_ BitVec 32)) Bool)

(assert (=> b!1417809 (= res!953536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608))))

(declare-fun res!953537 () Bool)

(assert (=> start!122224 (=> (not res!953537) (not e!802367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!122224 (= res!953537 (validMask!0 mask!2608))))

(assert (=> start!122224 e!802367))

(assert (=> start!122224 true))

(declare-fun array_inv!35760 (array!96808) Bool)

(assert (=> start!122224 (array_inv!35760 a!2831)))

(assert (= (and start!122224 res!953537) b!1417808))

(assert (= (and b!1417808 res!953538) b!1417807))

(assert (= (and b!1417807 res!953535) b!1417806))

(assert (= (and b!1417806 res!953539) b!1417809))

(assert (= (and b!1417809 res!953536) b!1417805))

(declare-fun m!1308583 () Bool)

(assert (=> b!1417806 m!1308583))

(assert (=> b!1417806 m!1308583))

(declare-fun m!1308585 () Bool)

(assert (=> b!1417806 m!1308585))

(declare-fun m!1308587 () Bool)

(assert (=> b!1417807 m!1308587))

(assert (=> b!1417807 m!1308587))

(declare-fun m!1308589 () Bool)

(assert (=> b!1417807 m!1308589))

(declare-fun m!1308591 () Bool)

(assert (=> b!1417809 m!1308591))

(declare-fun m!1308593 () Bool)

(assert (=> start!122224 m!1308593))

(declare-fun m!1308595 () Bool)

(assert (=> start!122224 m!1308595))

(push 1)

(assert (not start!122224))

(assert (not b!1417809))

(assert (not b!1417807))

(assert (not b!1417806))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!152717 () Bool)

(assert (=> d!152717 (= (validMask!0 mask!2608) (and (or (= mask!2608 #b00000000000000000000000000000111) (= mask!2608 #b00000000000000000000000000001111) (= mask!2608 #b00000000000000000000000000011111) (= mask!2608 #b00000000000000000000000000111111) (= mask!2608 #b00000000000000000000000001111111) (= mask!2608 #b00000000000000000000000011111111) (= mask!2608 #b00000000000000000000000111111111) (= mask!2608 #b00000000000000000000001111111111) (= mask!2608 #b00000000000000000000011111111111) (= mask!2608 #b00000000000000000000111111111111) (= mask!2608 #b00000000000000000001111111111111) (= mask!2608 #b00000000000000000011111111111111) (= mask!2608 #b00000000000000000111111111111111) (= mask!2608 #b00000000000000001111111111111111) (= mask!2608 #b00000000000000011111111111111111) (= mask!2608 #b00000000000000111111111111111111) (= mask!2608 #b00000000000001111111111111111111) (= mask!2608 #b00000000000011111111111111111111) (= mask!2608 #b00000000000111111111111111111111) (= mask!2608 #b00000000001111111111111111111111) (= mask!2608 #b00000000011111111111111111111111) (= mask!2608 #b00000000111111111111111111111111) (= mask!2608 #b00000001111111111111111111111111) (= mask!2608 #b00000011111111111111111111111111) (= mask!2608 #b00000111111111111111111111111111) (= mask!2608 #b00001111111111111111111111111111) (= mask!2608 #b00011111111111111111111111111111) (= mask!2608 #b00111111111111111111111111111111)) (bvsle mask!2608 #b00111111111111111111111111111111)))))

(assert (=> start!122224 d!152717))

(declare-fun d!152725 () Bool)

(assert (=> d!152725 (= (array_inv!35760 a!2831) (bvsge (size!47282 a!2831) #b00000000000000000000000000000000))))

(assert (=> start!122224 d!152725))

(declare-fun b!1417842 () Bool)

(declare-fun e!802393 () Bool)

(declare-fun call!67231 () Bool)

(assert (=> b!1417842 (= e!802393 call!67231)))

(declare-fun d!152727 () Bool)

(declare-fun res!953556 () Bool)

(declare-fun e!802392 () Bool)

(assert (=> d!152727 (=> res!953556 e!802392)))

(assert (=> d!152727 (= res!953556 (bvsge #b00000000000000000000000000000000 (size!47282 a!2831)))))

(assert (=> d!152727 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 a!2831 mask!2608) e!802392)))

