; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!137210 () Bool)

(assert start!137210)

(declare-fun res!1079497 () Bool)

(declare-fun e!882061 () Bool)

(assert (=> start!137210 (=> (not res!1079497) (not e!882061))))

(declare-fun from!2937 () (_ BitVec 32))

(declare-datatypes ((array!105908 0))(
  ( (array!105909 (arr!51055 (Array (_ BitVec 32) (_ BitVec 64))) (size!51606 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105908)

(assert (=> start!137210 (= res!1079497 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51606 a!3559)) (bvslt (size!51606 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!137210 e!882061))

(assert (=> start!137210 true))

(declare-fun array_inv!40010 (array!105908) Bool)

(assert (=> start!137210 (array_inv!40010 a!3559)))

(declare-fun b!1581134 () Bool)

(declare-fun res!1079498 () Bool)

(assert (=> b!1581134 (=> (not res!1079498) (not e!882061))))

(declare-fun k0!2792 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!105908 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1581134 (= res!1079498 (arrayContainsKey!0 a!3559 k0!2792 from!2937))))

(declare-fun b!1581135 () Bool)

(assert (=> b!1581135 (= e!882061 (and (bvsle from!2937 #b00000000000000000000000000000000) (bvsge #b00000000000000000000000000000000 (size!51606 a!3559))))))

(assert (= (and start!137210 res!1079497) b!1581134))

(assert (= (and b!1581134 res!1079498) b!1581135))

(declare-fun m!1453023 () Bool)

(assert (=> start!137210 m!1453023))

(declare-fun m!1453025 () Bool)

(assert (=> b!1581134 m!1453025))

(check-sat (not start!137210) (not b!1581134))
(check-sat)
