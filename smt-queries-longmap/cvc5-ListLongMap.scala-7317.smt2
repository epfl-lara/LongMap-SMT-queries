; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93762 () Bool)

(assert start!93762)

(declare-fun res!707944 () Bool)

(declare-fun e!603343 () Bool)

(assert (=> start!93762 (=> (not res!707944) (not e!603343))))

(declare-fun from!2850 () (_ BitVec 32))

(declare-datatypes ((array!66864 0))(
  ( (array!66865 (arr!32142 (Array (_ BitVec 32) (_ BitVec 64))) (size!32679 (_ BitVec 32))) )
))
(declare-fun a!3475 () array!66864)

(assert (=> start!93762 (= res!707944 (and (bvsge from!2850 #b00000000000000000000000000000000) (bvslt from!2850 (size!32679 a!3475)) (bvslt (size!32679 a!3475) #b01111111111111111111111111111111)))))

(assert (=> start!93762 e!603343))

(assert (=> start!93762 true))

(declare-fun array_inv!24924 (array!66864) Bool)

(assert (=> start!93762 (array_inv!24924 a!3475)))

(declare-fun b!1060174 () Bool)

(declare-fun res!707945 () Bool)

(assert (=> b!1060174 (=> (not res!707945) (not e!603343))))

(declare-fun k!2741 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!66864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1060174 (= res!707945 (arrayContainsKey!0 a!3475 k!2741 from!2850))))

(declare-fun b!1060175 () Bool)

(declare-fun res!707943 () Bool)

(assert (=> b!1060175 (=> (not res!707943) (not e!603343))))

(assert (=> b!1060175 (= res!707943 (not (= (select (arr!32142 a!3475) from!2850) k!2741)))))

(declare-fun b!1060176 () Bool)

(assert (=> b!1060176 (= e!603343 false)))

(declare-fun lt!467564 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!66864 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1060176 (= lt!467564 (arrayScanForKey!0 a!3475 k!2741 (bvadd #b00000000000000000000000000000001 from!2850)))))

(assert (= (and start!93762 res!707944) b!1060174))

(assert (= (and b!1060174 res!707945) b!1060175))

(assert (= (and b!1060175 res!707943) b!1060176))

(declare-fun m!980153 () Bool)

(assert (=> start!93762 m!980153))

(declare-fun m!980155 () Bool)

(assert (=> b!1060174 m!980155))

(declare-fun m!980157 () Bool)

(assert (=> b!1060175 m!980157))

(declare-fun m!980159 () Bool)

(assert (=> b!1060176 m!980159))

(push 1)

(assert (not b!1060174))

(assert (not b!1060176))

(assert (not start!93762))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

