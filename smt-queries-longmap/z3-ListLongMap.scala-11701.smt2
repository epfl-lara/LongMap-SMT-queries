; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137252 () Bool)

(assert start!137252)

(declare-fun res!1079658 () Bool)

(declare-fun e!882176 () Bool)

(assert (=> start!137252 (=> (not res!1079658) (not e!882176))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105941 0))(
  ( (array!105942 (arr!51070 (Array (_ BitVec 32) (_ BitVec 64))) (size!51621 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105941)

(assert (=> start!137252 (= res!1079658 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51621 a!3559)) (bvslt (size!51621 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!137252 e!882176))

(assert (=> start!137252 true))

(declare-fun array_inv!40025 (array!105941) Bool)

(assert (=> start!137252 (array_inv!40025 a!3559)))

(declare-fun b!1581295 () Bool)

(declare-fun res!1079659 () Bool)

(assert (=> b!1581295 (=> (not res!1079659) (not e!882176))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1581295 (= res!1079659 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1581296 () Bool)

(declare-fun res!1079660 () Bool)

(assert (=> b!1581296 (=> (not res!1079660) (not e!882176))))

(assert (=> b!1581296 (= res!1079660 (bvsle from!2937 #b00000000000000000000000000000000))))

(declare-fun b!1581297 () Bool)

(assert (=> b!1581297 (= e!882176 (not (arrayContainsKey!0 a!3559 k0!2792 #b00000000000000000000000000000000)))))

(assert (= (and start!137252 res!1079658) b!1581295))

(assert (= (and b!1581295 res!1079659) b!1581296))

(assert (= (and b!1581296 res!1079660) b!1581297))

(declare-fun m!1453137 () Bool)

(assert (=> start!137252 m!1453137))

(declare-fun m!1453139 () Bool)

(assert (=> b!1581295 m!1453139))

(declare-fun m!1453141 () Bool)

(assert (=> b!1581297 m!1453141))

(check-sat (not b!1581297) (not b!1581295) (not start!137252))
(check-sat)
