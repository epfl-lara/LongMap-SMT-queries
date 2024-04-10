; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!5358 () Bool)

(assert start!5358)

(declare-fun b!38490 () Bool)

(declare-fun res!23240 () Bool)

(declare-fun e!24445 () Bool)

(assert (=> b!38490 (=> res!23240 e!24445)))

(declare-datatypes ((List!1041 0))(
  ( (Nil!1038) (Cons!1037 (h!1605 (_ BitVec 64)) (t!3874 List!1041)) )
))
(declare-fun contains!498 (List!1041 (_ BitVec 64)) Bool)

(assert (=> b!38490 (= res!23240 (contains!498 Nil!1038 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38491 () Bool)

(assert (=> b!38491 (= e!24445 true)))

(declare-fun lt!14381 () Bool)

(declare-fun noDuplicate!32 (List!1041) Bool)

(assert (=> b!38491 (= lt!14381 (noDuplicate!32 Nil!1038))))

(declare-fun b!38489 () Bool)

(declare-fun res!23238 () Bool)

(assert (=> b!38489 (=> res!23238 e!24445)))

(assert (=> b!38489 (= res!23238 (contains!498 Nil!1038 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23241 () Bool)

(declare-fun e!24444 () Bool)

(assert (=> start!5358 (=> (not res!23241) (not e!24444))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5358 (= res!23241 (validMask!0 mask!853))))

(assert (=> start!5358 e!24444))

(assert (=> start!5358 true))

(declare-fun b!38488 () Bool)

(assert (=> b!38488 (= e!24444 (not e!24445))))

(declare-fun res!23239 () Bool)

(assert (=> b!38488 (=> res!23239 e!24445)))

(assert (=> b!38488 (= res!23239 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2563 0))(
  ( (array!2564 (arr!1225 (Array (_ BitVec 32) (_ BitVec 64))) (size!1332 (_ BitVec 32))) )
))
(declare-fun lt!14379 () array!2563)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2563 (_ BitVec 32)) Bool)

(assert (=> b!38488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14379 mask!853)))

(declare-datatypes ((Unit!955 0))(
  ( (Unit!956) )
))
(declare-fun lt!14380 () Unit!955)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2563 (_ BitVec 32) (_ BitVec 32)) Unit!955)

(assert (=> b!38488 (= lt!14380 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14379 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2563 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38488 (= (arrayCountValidKeys!0 lt!14379 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14378 () Unit!955)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2563 (_ BitVec 32) (_ BitVec 32)) Unit!955)

(assert (=> b!38488 (= lt!14378 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14379 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38488 (= lt!14379 (array!2564 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5358 res!23241) b!38488))

(assert (= (and b!38488 (not res!23239)) b!38489))

(assert (= (and b!38489 (not res!23238)) b!38490))

(assert (= (and b!38490 (not res!23240)) b!38491))

(declare-fun m!31169 () Bool)

(assert (=> b!38490 m!31169))

(declare-fun m!31171 () Bool)

(assert (=> b!38489 m!31171))

(declare-fun m!31173 () Bool)

(assert (=> b!38491 m!31173))

(declare-fun m!31175 () Bool)

(assert (=> b!38488 m!31175))

(declare-fun m!31177 () Bool)

(assert (=> b!38488 m!31177))

(declare-fun m!31179 () Bool)

(assert (=> b!38488 m!31179))

(declare-fun m!31181 () Bool)

(assert (=> b!38488 m!31181))

(declare-fun m!31183 () Bool)

(assert (=> start!5358 m!31183))

(check-sat (not b!38488) (not b!38490) (not b!38491) (not start!5358) (not b!38489))
(check-sat)
