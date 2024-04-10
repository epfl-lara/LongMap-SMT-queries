; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116466 () Bool)

(assert start!116466)

(declare-fun b!1373978 () Bool)

(declare-fun res!917161 () Bool)

(declare-fun e!778369 () Bool)

(assert (=> b!1373978 (=> (not res!917161) (not e!778369))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373978 (= res!917161 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1373979 () Bool)

(declare-fun res!917164 () Bool)

(assert (=> b!1373979 (=> (not res!917164) (not e!778369))))

(declare-datatypes ((array!93166 0))(
  ( (array!93167 (arr!44989 (Array (_ BitVec 32) (_ BitVec 64))) (size!45539 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93166)

(declare-fun i!1457 () (_ BitVec 32))

(assert (=> b!1373979 (= res!917164 (and (bvslt (size!45539 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45539 a!4142))))))

(declare-fun b!1373980 () Bool)

(assert (=> b!1373980 (= e!778369 false)))

(declare-fun lt!603178 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93166 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373980 (= lt!603178 (arrayCountValidKeys!0 (array!93167 (store (arr!44989 a!4142) i!1457 k!2959) (size!45539 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603177 () (_ BitVec 32))

(assert (=> b!1373980 (= lt!603177 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373977 () Bool)

(declare-fun res!917162 () Bool)

(assert (=> b!1373977 (=> (not res!917162) (not e!778369))))

(assert (=> b!1373977 (= res!917162 (validKeyInArray!0 (select (arr!44989 a!4142) i!1457)))))

(declare-fun res!917163 () Bool)

(assert (=> start!116466 (=> (not res!917163) (not e!778369))))

(assert (=> start!116466 (= res!917163 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45539 a!4142))))))

(assert (=> start!116466 e!778369))

(assert (=> start!116466 true))

(declare-fun array_inv!34017 (array!93166) Bool)

(assert (=> start!116466 (array_inv!34017 a!4142)))

(assert (= (and start!116466 res!917163) b!1373977))

(assert (= (and b!1373977 res!917162) b!1373978))

(assert (= (and b!1373978 res!917161) b!1373979))

(assert (= (and b!1373979 res!917164) b!1373980))

(declare-fun m!1257173 () Bool)

(assert (=> b!1373978 m!1257173))

(declare-fun m!1257175 () Bool)

(assert (=> b!1373980 m!1257175))

(declare-fun m!1257177 () Bool)

(assert (=> b!1373980 m!1257177))

(declare-fun m!1257179 () Bool)

(assert (=> b!1373980 m!1257179))

(declare-fun m!1257181 () Bool)

(assert (=> b!1373977 m!1257181))

(assert (=> b!1373977 m!1257181))

(declare-fun m!1257183 () Bool)

(assert (=> b!1373977 m!1257183))

(declare-fun m!1257185 () Bool)

(assert (=> start!116466 m!1257185))

(push 1)

(assert (not b!1373980))

(assert (not b!1373978))

(assert (not b!1373977))

(assert (not start!116466))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

