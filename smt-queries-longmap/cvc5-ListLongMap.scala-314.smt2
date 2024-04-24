; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5364 () Bool)

(assert start!5364)

(declare-fun b!38443 () Bool)

(declare-fun e!24414 () Bool)

(declare-fun e!24413 () Bool)

(assert (=> b!38443 (= e!24414 (not e!24413))))

(declare-fun res!23225 () Bool)

(assert (=> b!38443 (=> res!23225 e!24413)))

(declare-fun mask!853 () (_ BitVec 32))

(assert (=> b!38443 (= res!23225 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2551 0))(
  ( (array!2552 (arr!1219 (Array (_ BitVec 32) (_ BitVec 64))) (size!1326 (_ BitVec 32))) )
))
(declare-fun lt!14348 () array!2551)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2551 (_ BitVec 32)) Bool)

(assert (=> b!38443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14348 mask!853)))

(declare-datatypes ((Unit!963 0))(
  ( (Unit!964) )
))
(declare-fun lt!14350 () Unit!963)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2551 (_ BitVec 32) (_ BitVec 32)) Unit!963)

(assert (=> b!38443 (= lt!14350 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14348 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2551 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38443 (= (arrayCountValidKeys!0 lt!14348 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14349 () Unit!963)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2551 (_ BitVec 32) (_ BitVec 32)) Unit!963)

(assert (=> b!38443 (= lt!14349 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14348 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38443 (= lt!14348 (array!2552 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun res!23227 () Bool)

(assert (=> start!5364 (=> (not res!23227) (not e!24414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5364 (= res!23227 (validMask!0 mask!853))))

(assert (=> start!5364 e!24414))

(assert (=> start!5364 true))

(declare-fun b!38446 () Bool)

(assert (=> b!38446 (= e!24413 true)))

(declare-fun lt!14347 () Bool)

(declare-datatypes ((List!1028 0))(
  ( (Nil!1025) (Cons!1024 (h!1592 (_ BitVec 64)) (t!3861 List!1028)) )
))
(declare-fun noDuplicate!29 (List!1028) Bool)

(assert (=> b!38446 (= lt!14347 (noDuplicate!29 Nil!1025))))

(declare-fun b!38445 () Bool)

(declare-fun res!23226 () Bool)

(assert (=> b!38445 (=> res!23226 e!24413)))

(declare-fun contains!489 (List!1028 (_ BitVec 64)) Bool)

(assert (=> b!38445 (= res!23226 (contains!489 Nil!1025 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38444 () Bool)

(declare-fun res!23228 () Bool)

(assert (=> b!38444 (=> res!23228 e!24413)))

(assert (=> b!38444 (= res!23228 (contains!489 Nil!1025 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5364 res!23227) b!38443))

(assert (= (and b!38443 (not res!23225)) b!38444))

(assert (= (and b!38444 (not res!23228)) b!38445))

(assert (= (and b!38445 (not res!23226)) b!38446))

(declare-fun m!31059 () Bool)

(assert (=> b!38445 m!31059))

(declare-fun m!31061 () Bool)

(assert (=> b!38443 m!31061))

(declare-fun m!31063 () Bool)

(assert (=> b!38443 m!31063))

(declare-fun m!31065 () Bool)

(assert (=> b!38443 m!31065))

(declare-fun m!31067 () Bool)

(assert (=> b!38443 m!31067))

(declare-fun m!31069 () Bool)

(assert (=> b!38446 m!31069))

(declare-fun m!31071 () Bool)

(assert (=> b!38444 m!31071))

(declare-fun m!31073 () Bool)

(assert (=> start!5364 m!31073))

(push 1)

(assert (not b!38445))

(assert (not b!38444))

(assert (not b!38443))

(assert (not b!38446))

(assert (not start!5364))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

