; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!137244 () Bool)

(assert start!137244)

(declare-fun b!1581252 () Bool)

(declare-fun e!882151 () Bool)

(declare-fun from!2937 () (_ BitVec 32))

(assert (=> b!1581252 (= e!882151 (bvsge (bvsub from!2937 #b00000000000000000000000000000001) from!2937))))

(declare-fun b!1581251 () Bool)

(declare-fun res!1079614 () Bool)

(assert (=> b!1581251 (=> (not res!1079614) (not e!882151))))

(declare-fun k!2792 () (_ BitVec 64))

(declare-datatypes ((array!105933 0))(
  ( (array!105934 (arr!51066 (Array (_ BitVec 32) (_ BitVec 64))) (size!51617 (_ BitVec 32))) )
))
(declare-fun a!3559 () array!105933)

(declare-fun arrayContainsKey!0 (array!105933 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1581251 (= res!1079614 (arrayContainsKey!0 a!3559 k!2792 (bvsub from!2937 #b00000000000000000000000000000001)))))

(declare-fun res!1079612 () Bool)

(assert (=> start!137244 (=> (not res!1079612) (not e!882151))))

(assert (=> start!137244 (= res!1079612 (and (bvsge from!2937 #b00000000000000000000000000000000) (bvslt from!2937 (size!51617 a!3559)) (bvslt (size!51617 a!3559) #b01111111111111111111111111111111)))))

(assert (=> start!137244 e!882151))

(assert (=> start!137244 true))

(declare-fun array_inv!40021 (array!105933) Bool)

(assert (=> start!137244 (array_inv!40021 a!3559)))

(declare-fun b!1581250 () Bool)

(declare-fun res!1079613 () Bool)

(assert (=> b!1581250 (=> (not res!1079613) (not e!882151))))

(assert (=> b!1581250 (= res!1079613 (and (bvsgt from!2937 #b00000000000000000000000000000000) (bvslt (bvsub from!2937 #b00000000000000000000000000000001) (size!51617 a!3559))))))

(declare-fun b!1581249 () Bool)

(declare-fun res!1079615 () Bool)

(assert (=> b!1581249 (=> (not res!1079615) (not e!882151))))

(assert (=> b!1581249 (= res!1079615 (arrayContainsKey!0 a!3559 k!2792 from!2937))))

(assert (= (and start!137244 res!1079612) b!1581249))

(assert (= (and b!1581249 res!1079615) b!1581250))

(assert (= (and b!1581250 res!1079613) b!1581251))

(assert (= (and b!1581251 res!1079614) b!1581252))

(declare-fun m!1453101 () Bool)

(assert (=> b!1581251 m!1453101))

(declare-fun m!1453103 () Bool)

(assert (=> start!137244 m!1453103))

(declare-fun m!1453105 () Bool)

(assert (=> b!1581249 m!1453105))

(push 1)

(assert (not b!1581251))

(assert (not b!1581249))

(assert (not start!137244))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

