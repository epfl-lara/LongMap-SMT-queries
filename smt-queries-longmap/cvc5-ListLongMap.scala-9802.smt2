; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!116462 () Bool)

(assert start!116462)

(declare-fun b!1373954 () Bool)

(declare-fun res!917139 () Bool)

(declare-fun e!778357 () Bool)

(assert (=> b!1373954 (=> (not res!917139) (not e!778357))))

(declare-fun k!2959 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1373954 (= res!917139 (not (validKeyInArray!0 k!2959)))))

(declare-fun b!1373956 () Bool)

(assert (=> b!1373956 (= e!778357 false)))

(declare-fun i!1457 () (_ BitVec 32))

(declare-datatypes ((array!93162 0))(
  ( (array!93163 (arr!44987 (Array (_ BitVec 32) (_ BitVec 64))) (size!45537 (_ BitVec 32))) )
))
(declare-fun a!4142 () array!93162)

(declare-fun lt!603165 () (_ BitVec 32))

(declare-fun arrayCountValidKeys!0 (array!93162 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1373956 (= lt!603165 (arrayCountValidKeys!0 (array!93163 (store (arr!44987 a!4142) i!1457 k!2959) (size!45537 a!4142)) i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun lt!603166 () (_ BitVec 32))

(assert (=> b!1373956 (= lt!603166 (arrayCountValidKeys!0 a!4142 i!1457 (bvadd #b00000000000000000000000000000001 i!1457)))))

(declare-fun b!1373955 () Bool)

(declare-fun res!917140 () Bool)

(assert (=> b!1373955 (=> (not res!917140) (not e!778357))))

(assert (=> b!1373955 (= res!917140 (and (bvslt (size!45537 a!4142) #b01111111111111111111111111111111) (bvsle i!1457 (size!45537 a!4142))))))

(declare-fun b!1373953 () Bool)

(declare-fun res!917137 () Bool)

(assert (=> b!1373953 (=> (not res!917137) (not e!778357))))

(assert (=> b!1373953 (= res!917137 (validKeyInArray!0 (select (arr!44987 a!4142) i!1457)))))

(declare-fun res!917138 () Bool)

(assert (=> start!116462 (=> (not res!917138) (not e!778357))))

(assert (=> start!116462 (= res!917138 (and (bvsge i!1457 #b00000000000000000000000000000000) (bvslt i!1457 (size!45537 a!4142))))))

(assert (=> start!116462 e!778357))

(assert (=> start!116462 true))

(declare-fun array_inv!34015 (array!93162) Bool)

(assert (=> start!116462 (array_inv!34015 a!4142)))

(assert (= (and start!116462 res!917138) b!1373953))

(assert (= (and b!1373953 res!917137) b!1373954))

(assert (= (and b!1373954 res!917139) b!1373955))

(assert (= (and b!1373955 res!917140) b!1373956))

(declare-fun m!1257145 () Bool)

(assert (=> b!1373954 m!1257145))

(declare-fun m!1257147 () Bool)

(assert (=> b!1373956 m!1257147))

(declare-fun m!1257149 () Bool)

(assert (=> b!1373956 m!1257149))

(declare-fun m!1257151 () Bool)

(assert (=> b!1373956 m!1257151))

(declare-fun m!1257153 () Bool)

(assert (=> b!1373953 m!1257153))

(assert (=> b!1373953 m!1257153))

(declare-fun m!1257155 () Bool)

(assert (=> b!1373953 m!1257155))

(declare-fun m!1257157 () Bool)

(assert (=> start!116462 m!1257157))

(push 1)

(assert (not start!116462))

(assert (not b!1373956))

(assert (not b!1373953))

(assert (not b!1373954))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

