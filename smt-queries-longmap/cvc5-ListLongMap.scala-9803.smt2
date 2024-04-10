; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116468 () Bool)

(assert start!116468)

(declare-fun b!1373992 () Bool)

(declare-fun e!778375 () Bool)

(assert (=> b!1373992 (= e!778375 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93168 0))(
  ( (array!93169 (arr!44990 (Array (_ BitVec 32) (_ BitVec 64))) (size!45540 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93168)

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun lt!603184 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93168 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373992 (= lt!603184 (arrayCountValidKeys!0 (array!93169 (store (arr!44990 a!4142) i!1457 k!2959) (size!45540 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603183 () (_ BitVec 32))

(assert (=> b!1373992 (= lt!603183 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373991 () Bool)

(declare-fun res!917175 () Bool)

(assert (=> b!1373991 (=> (not res!917175) (not e!778375))))

(assert (=> b!1373991 (= res!917175 (and (bvslt (size!45540 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45540 a!4142))))))

(declare-fun b!1373989 () Bool)

(declare-fun res!917174 () Bool)

(assert (=> b!1373989 (=> (not res!917174) (not e!778375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373989 (= res!917174 (validKeyInArray!0 (select (arr!44990 a!4142) i!1457)))))

(declare-fun b!1373990 () Bool)

(declare-fun res!917176 () Bool)

(assert (=> b!1373990 (=> (not res!917176) (not e!778375))))

(assert (=> b!1373990 (= res!917176 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917173 () Bool)

(assert (=> start!116468 (=> (not res!917173) (not e!778375))))

(assert (=> start!116468 (= res!917173 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45540 a!4142))))))

(assert (=> start!116468 e!778375))

(assert (=> start!116468 true))

(declare-fun array_inv!34018 (array!93168) Bool)

(assert (=> start!116468 (array_inv!34018 a!4142)))

(assert (= (and start!116468 res!917173) b!1373989))

(assert (= (and b!1373989 res!917174) b!1373990))

(assert (= (and b!1373990 res!917176) b!1373991))

(assert (= (and b!1373991 res!917175) b!1373992))

(declare-fun m!1257187 () Bool)

(assert (=> b!1373992 m!1257187))

(declare-fun m!1257189 () Bool)

(assert (=> b!1373992 m!1257189))

(declare-fun m!1257191 () Bool)

(assert (=> b!1373992 m!1257191))

(declare-fun m!1257193 () Bool)

(assert (=> b!1373989 m!1257193))

(assert (=> b!1373989 m!1257193))

(declare-fun m!1257195 () Bool)

(assert (=> b!1373989 m!1257195))

(declare-fun m!1257197 () Bool)

(assert (=> b!1373990 m!1257197))

(declare-fun m!1257199 () Bool)

(assert (=> start!116468 m!1257199))

(push 1)

(assert (not b!1373992))

(assert (not b!1373990))

(assert (not b!1373989))

(assert (not start!116468))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

