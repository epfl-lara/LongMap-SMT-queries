; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5360 () Bool)

(assert start!5360)

(declare-fun res!23250 () Bool)

(declare-fun e!24451 () Bool)

(assert (=> start!5360 (=> (not res!23250) (not e!24451))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5360 (= res!23250 (validMask!0 mask!853))))

(assert (=> start!5360 e!24451))

(assert (=> start!5360 true))

(declare-fun b!38503 () Bool)

(declare-fun e!24450 () Bool)

(assert (=> b!38503 (= e!24450 true)))

(declare-fun lt!14392 () Bool)

(declare-datatypes ((List!1042 0))(
  ( (Nil!1039) (Cons!1038 (h!1606 (_ BitVec 64)) (t!3875 List!1042)) )
))
(declare-fun noDuplicate!33 (List!1042) Bool)

(assert (=> b!38503 (= lt!14392 (noDuplicate!33 Nil!1039))))

(declare-fun b!38502 () Bool)

(declare-fun res!23251 () Bool)

(assert (=> b!38502 (=> res!23251 e!24450)))

(declare-fun contains!499 (List!1042 (_ BitVec 64)) Bool)

(assert (=> b!38502 (= res!23251 (contains!499 Nil!1039 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38501 () Bool)

(declare-fun res!23252 () Bool)

(assert (=> b!38501 (=> res!23252 e!24450)))

(assert (=> b!38501 (= res!23252 (contains!499 Nil!1039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38500 () Bool)

(assert (=> b!38500 (= e!24451 (not e!24450))))

(declare-fun res!23253 () Bool)

(assert (=> b!38500 (=> res!23253 e!24450)))

(assert (=> b!38500 (= res!23253 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2565 0))(
  ( (array!2566 (arr!1226 (Array (_ BitVec 32) (_ BitVec 64))) (size!1333 (_ BitVec 32))) )
))
(declare-fun lt!14390 () array!2565)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2565 (_ BitVec 32)) Bool)

(assert (=> b!38500 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14390 mask!853)))

(declare-datatypes ((Unit!957 0))(
  ( (Unit!958) )
))
(declare-fun lt!14391 () Unit!957)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!957)

(assert (=> b!38500 (= lt!14391 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14390 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2565 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38500 (= (arrayCountValidKeys!0 lt!14390 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14393 () Unit!957)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2565 (_ BitVec 32) (_ BitVec 32)) Unit!957)

(assert (=> b!38500 (= lt!14393 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14390 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38500 (= lt!14390 (array!2566 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5360 res!23250) b!38500))

(assert (= (and b!38500 (not res!23253)) b!38501))

(assert (= (and b!38501 (not res!23252)) b!38502))

(assert (= (and b!38502 (not res!23251)) b!38503))

(declare-fun m!31185 () Bool)

(assert (=> b!38500 m!31185))

(declare-fun m!31187 () Bool)

(assert (=> b!38500 m!31187))

(declare-fun m!31189 () Bool)

(assert (=> b!38500 m!31189))

(declare-fun m!31191 () Bool)

(assert (=> b!38500 m!31191))

(declare-fun m!31193 () Bool)

(assert (=> b!38501 m!31193))

(declare-fun m!31195 () Bool)

(assert (=> b!38502 m!31195))

(declare-fun m!31197 () Bool)

(assert (=> start!5360 m!31197))

(declare-fun m!31199 () Bool)

(assert (=> b!38503 m!31199))

(push 1)

(assert (not b!38501))

(assert (not b!38502))

(assert (not b!38503))

(assert (not b!38500))

(assert (not start!5360))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

