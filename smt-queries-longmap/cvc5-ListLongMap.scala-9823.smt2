; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116600 () Bool)

(assert start!116600)

(declare-fun b!1374798 () Bool)

(declare-fun res!917972 () Bool)

(declare-fun e!778831 () Bool)

(assert (=> b!1374798 (=> (not res!917972) (not e!778831))))

(declare-datatypes ((array!93244 0))(
  ( (array!93245 (arr!45027 (Array (_ BitVec 32) (_ BitVec 64))) (size!45579 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93244)

(declare-fun i!1457 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1374798 (= res!917972 (validKeyInArray!0 (select (arr!45027 a!4142) i!1457)))))

(declare-fun b!1374800 () Bool)

(declare-fun res!917969 () Bool)

(assert (=> b!1374800 (=> (not res!917969) (not e!778831))))

(assert (=> b!1374800 (= res!917969 (bvslt (size!45579 a!4142) #b01111111111111111111111111111111))))

(declare-fun b!1374801 () Bool)

(assert (=> b!1374801 (= e!778831 (not true))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun arrayCountValidKeys!0 (array!93244 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1374801 (= (arrayCountValidKeys!0 (array!93245 (store (arr!45027 a!4142) i!1457 k!2959) (size!45579 a!4142)) #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) (bvsub (arrayCountValidKeys!0 a!4142 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!1457)) #b00000000000000000000000000000001))))

(declare-datatypes ((Unit!45334 0))(
  ( (Unit!45335) )
))
(declare-fun lt!603725 () Unit!45334)

(declare-fun lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 (array!93244 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32)) Unit!45334)

(assert (=> b!1374801 (= lt!603725 (lemmaRemoveValidKeyAndNumKeysFromImpliesFromZero!0 a!4142 i!1457 k!2959 i!1457))))

(declare-fun b!1374799 () Bool)

(declare-fun res!917971 () Bool)

(assert (=> b!1374799 (=> (not res!917971) (not e!778831))))

(assert (=> b!1374799 (= res!917971 (not (validKeyInArray!0 k!2959)))))

(declare-fun res!917970 () Bool)

(assert (=> start!116600 (=> (not res!917970) (not e!778831))))

(assert (=> start!116600 (= res!917970 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45579 a!4142))))))

(assert (=> start!116600 e!778831))

(assert (=> start!116600 true))

(declare-fun array_inv!34260 (array!93244) Bool)

(assert (=> start!116600 (array_inv!34260 a!4142)))

(assert (= (and start!116600 res!917970) b!1374798))

(assert (= (and b!1374798 res!917972) b!1374799))

(assert (= (and b!1374799 res!917971) b!1374800))

(assert (= (and b!1374800 res!917969) b!1374801))

(declare-fun m!1257929 () Bool)

(assert (=> b!1374798 m!1257929))

(assert (=> b!1374798 m!1257929))

(declare-fun m!1257931 () Bool)

(assert (=> b!1374798 m!1257931))

(declare-fun m!1257933 () Bool)

(assert (=> b!1374801 m!1257933))

(declare-fun m!1257935 () Bool)

(assert (=> b!1374801 m!1257935))

(declare-fun m!1257937 () Bool)

(assert (=> b!1374801 m!1257937))

(declare-fun m!1257939 () Bool)

(assert (=> b!1374801 m!1257939))

(declare-fun m!1257941 () Bool)

(assert (=> b!1374799 m!1257941))

(declare-fun m!1257943 () Bool)

(assert (=> start!116600 m!1257943))

(push 1)

(assert (not b!1374799))

(assert (not b!1374798))

(assert (not b!1374801))

(assert (not start!116600))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

