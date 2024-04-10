; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5350 () Bool)

(assert start!5350)

(declare-fun res!23193 () Bool)

(declare-fun e!24420 () Bool)

(assert (=> start!5350 (=> (not res!23193) (not e!24420))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5350 (= res!23193 (validMask!0 mask!853))))

(assert (=> start!5350 e!24420))

(assert (=> start!5350 true))

(declare-fun b!38440 () Bool)

(declare-fun e!24421 () Bool)

(assert (=> b!38440 (= e!24420 (not e!24421))))

(declare-fun res!23190 () Bool)

(assert (=> b!38440 (=> res!23190 e!24421)))

(assert (=> b!38440 (= res!23190 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2555 0))(
  ( (array!2556 (arr!1221 (Array (_ BitVec 32) (_ BitVec 64))) (size!1328 (_ BitVec 32))) )
))
(declare-fun lt!14332 () array!2555)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2555 (_ BitVec 32)) Bool)

(assert (=> b!38440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14332 mask!853)))

(declare-datatypes ((Unit!947 0))(
  ( (Unit!948) )
))
(declare-fun lt!14333 () Unit!947)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2555 (_ BitVec 32) (_ BitVec 32)) Unit!947)

(assert (=> b!38440 (= lt!14333 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14332 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2555 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38440 (= (arrayCountValidKeys!0 lt!14332 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14331 () Unit!947)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2555 (_ BitVec 32) (_ BitVec 32)) Unit!947)

(assert (=> b!38440 (= lt!14331 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14332 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38440 (= lt!14332 (array!2556 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38442 () Bool)

(declare-fun res!23191 () Bool)

(assert (=> b!38442 (=> res!23191 e!24421)))

(declare-datatypes ((List!1037 0))(
  ( (Nil!1034) (Cons!1033 (h!1601 (_ BitVec 64)) (t!3870 List!1037)) )
))
(declare-fun contains!494 (List!1037 (_ BitVec 64)) Bool)

(assert (=> b!38442 (= res!23191 (contains!494 Nil!1034 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38443 () Bool)

(assert (=> b!38443 (= e!24421 true)))

(declare-fun lt!14330 () Bool)

(declare-fun noDuplicate!28 (List!1037) Bool)

(assert (=> b!38443 (= lt!14330 (noDuplicate!28 Nil!1034))))

(declare-fun b!38441 () Bool)

(declare-fun res!23192 () Bool)

(assert (=> b!38441 (=> res!23192 e!24421)))

(assert (=> b!38441 (= res!23192 (contains!494 Nil!1034 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5350 res!23193) b!38440))

(assert (= (and b!38440 (not res!23190)) b!38441))

(assert (= (and b!38441 (not res!23192)) b!38442))

(assert (= (and b!38442 (not res!23191)) b!38443))

(declare-fun m!31105 () Bool)

(assert (=> b!38442 m!31105))

(declare-fun m!31107 () Bool)

(assert (=> b!38440 m!31107))

(declare-fun m!31109 () Bool)

(assert (=> b!38440 m!31109))

(declare-fun m!31111 () Bool)

(assert (=> b!38440 m!31111))

(declare-fun m!31113 () Bool)

(assert (=> b!38440 m!31113))

(declare-fun m!31115 () Bool)

(assert (=> b!38441 m!31115))

(declare-fun m!31117 () Bool)

(assert (=> b!38443 m!31117))

(declare-fun m!31119 () Bool)

(assert (=> start!5350 m!31119))

(push 1)

(assert (not b!38443))

(assert (not b!38441))

(assert (not start!5350))

(assert (not b!38442))

(assert (not b!38440))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

