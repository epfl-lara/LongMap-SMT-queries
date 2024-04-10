; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5326 () Bool)

(assert start!5326)

(declare-fun b!38298 () Bool)

(declare-fun res!23048 () Bool)

(declare-fun e!24349 () Bool)

(assert (=> b!38298 (=> res!23048 e!24349)))

(declare-datatypes ((List!1025 0))(
  ( (Nil!1022) (Cons!1021 (h!1589 (_ BitVec 64)) (t!3858 List!1025)) )
))
(declare-fun contains!482 (List!1025 (_ BitVec 64)) Bool)

(assert (=> b!38298 (= res!23048 (contains!482 Nil!1022 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23049 () Bool)

(declare-fun e!24348 () Bool)

(assert (=> start!5326 (=> (not res!23049) (not e!24348))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5326 (= res!23049 (validMask!0 mask!853))))

(assert (=> start!5326 e!24348))

(assert (=> start!5326 true))

(declare-fun b!38299 () Bool)

(assert (=> b!38299 (= e!24349 true)))

(declare-fun lt!14186 () Bool)

(declare-fun noDuplicate!16 (List!1025) Bool)

(assert (=> b!38299 (= lt!14186 (noDuplicate!16 Nil!1022))))

(declare-fun b!38296 () Bool)

(assert (=> b!38296 (= e!24348 (not e!24349))))

(declare-fun res!23046 () Bool)

(assert (=> b!38296 (=> res!23046 e!24349)))

(assert (=> b!38296 (= res!23046 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2531 0))(
  ( (array!2532 (arr!1209 (Array (_ BitVec 32) (_ BitVec 64))) (size!1316 (_ BitVec 32))) )
))
(declare-fun lt!14189 () array!2531)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2531 (_ BitVec 32)) Bool)

(assert (=> b!38296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14189 mask!853)))

(declare-datatypes ((Unit!923 0))(
  ( (Unit!924) )
))
(declare-fun lt!14188 () Unit!923)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2531 (_ BitVec 32) (_ BitVec 32)) Unit!923)

(assert (=> b!38296 (= lt!14188 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14189 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2531 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38296 (= (arrayCountValidKeys!0 lt!14189 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14187 () Unit!923)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2531 (_ BitVec 32) (_ BitVec 32)) Unit!923)

(assert (=> b!38296 (= lt!14187 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14189 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38296 (= lt!14189 (array!2532 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38297 () Bool)

(declare-fun res!23047 () Bool)

(assert (=> b!38297 (=> res!23047 e!24349)))

(assert (=> b!38297 (= res!23047 (contains!482 Nil!1022 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5326 res!23049) b!38296))

(assert (= (and b!38296 (not res!23046)) b!38297))

(assert (= (and b!38297 (not res!23047)) b!38298))

(assert (= (and b!38298 (not res!23048)) b!38299))

(declare-fun m!30913 () Bool)

(assert (=> b!38296 m!30913))

(declare-fun m!30915 () Bool)

(assert (=> b!38296 m!30915))

(declare-fun m!30917 () Bool)

(assert (=> b!38296 m!30917))

(declare-fun m!30919 () Bool)

(assert (=> b!38296 m!30919))

(declare-fun m!30921 () Bool)

(assert (=> b!38297 m!30921))

(declare-fun m!30923 () Bool)

(assert (=> b!38299 m!30923))

(declare-fun m!30925 () Bool)

(assert (=> b!38298 m!30925))

(declare-fun m!30927 () Bool)

(assert (=> start!5326 m!30927))

(push 1)

(assert (not start!5326))

(assert (not b!38297))

(assert (not b!38296))

(assert (not b!38299))

(assert (not b!38298))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

