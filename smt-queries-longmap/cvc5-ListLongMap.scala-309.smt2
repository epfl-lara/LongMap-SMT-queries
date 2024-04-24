; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5334 () Bool)

(assert start!5334)

(declare-fun res!23046 () Bool)

(declare-fun e!24324 () Bool)

(assert (=> start!5334 (=> (not res!23046) (not e!24324))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5334 (= res!23046 (validMask!0 mask!853))))

(assert (=> start!5334 e!24324))

(assert (=> start!5334 true))

(declare-fun b!38266 () Bool)

(declare-fun e!24323 () Bool)

(assert (=> b!38266 (= e!24323 true)))

(declare-fun lt!14170 () Bool)

(declare-datatypes ((List!1013 0))(
  ( (Nil!1010) (Cons!1009 (h!1577 (_ BitVec 64)) (t!3846 List!1013)) )
))
(declare-fun noDuplicate!14 (List!1013) Bool)

(assert (=> b!38266 (= lt!14170 (noDuplicate!14 Nil!1010))))

(declare-fun b!38264 () Bool)

(declare-fun res!23048 () Bool)

(assert (=> b!38264 (=> res!23048 e!24323)))

(declare-fun contains!474 (List!1013 (_ BitVec 64)) Bool)

(assert (=> b!38264 (= res!23048 (contains!474 Nil!1010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38263 () Bool)

(assert (=> b!38263 (= e!24324 (not e!24323))))

(declare-fun res!23045 () Bool)

(assert (=> b!38263 (=> res!23045 e!24323)))

(assert (=> b!38263 (= res!23045 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2521 0))(
  ( (array!2522 (arr!1204 (Array (_ BitVec 32) (_ BitVec 64))) (size!1311 (_ BitVec 32))) )
))
(declare-fun lt!14167 () array!2521)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2521 (_ BitVec 32)) Bool)

(assert (=> b!38263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14167 mask!853)))

(declare-datatypes ((Unit!933 0))(
  ( (Unit!934) )
))
(declare-fun lt!14168 () Unit!933)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2521 (_ BitVec 32) (_ BitVec 32)) Unit!933)

(assert (=> b!38263 (= lt!14168 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14167 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2521 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38263 (= (arrayCountValidKeys!0 lt!14167 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14169 () Unit!933)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2521 (_ BitVec 32) (_ BitVec 32)) Unit!933)

(assert (=> b!38263 (= lt!14169 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14167 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38263 (= lt!14167 (array!2522 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun b!38265 () Bool)

(declare-fun res!23047 () Bool)

(assert (=> b!38265 (=> res!23047 e!24323)))

(assert (=> b!38265 (= res!23047 (contains!474 Nil!1010 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!5334 res!23046) b!38263))

(assert (= (and b!38263 (not res!23045)) b!38264))

(assert (= (and b!38264 (not res!23048)) b!38265))

(assert (= (and b!38265 (not res!23047)) b!38266))

(declare-fun m!30819 () Bool)

(assert (=> b!38265 m!30819))

(declare-fun m!30821 () Bool)

(assert (=> start!5334 m!30821))

(declare-fun m!30823 () Bool)

(assert (=> b!38263 m!30823))

(declare-fun m!30825 () Bool)

(assert (=> b!38263 m!30825))

(declare-fun m!30827 () Bool)

(assert (=> b!38263 m!30827))

(declare-fun m!30829 () Bool)

(assert (=> b!38263 m!30829))

(declare-fun m!30831 () Bool)

(assert (=> b!38266 m!30831))

(declare-fun m!30833 () Bool)

(assert (=> b!38264 m!30833))

(push 1)

(assert (not b!38266))

(assert (not b!38263))

(assert (not start!5334))

(assert (not b!38265))

(assert (not b!38264))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

