; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5338 () Bool)

(assert start!5338)

(declare-fun b!38288 () Bool)

(declare-fun res!23071 () Bool)

(declare-fun e!24335 () Bool)

(assert (=> b!38288 (=> res!23071 e!24335)))

(declare-datatypes ((List!1015 0))(
  ( (Nil!1012) (Cons!1011 (h!1579 (_ BitVec 64)) (t!3848 List!1015)) )
))
(declare-fun contains!476 (List!1015 (_ BitVec 64)) Bool)

(assert (=> b!38288 (= res!23071 (contains!476 Nil!1012 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!23070 () Bool)

(declare-fun e!24336 () Bool)

(assert (=> start!5338 (=> (not res!23070) (not e!24336))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!5338 (= res!23070 (validMask!0 mask!853))))

(assert (=> start!5338 e!24336))

(assert (=> start!5338 true))

(declare-fun b!38289 () Bool)

(declare-fun res!23069 () Bool)

(assert (=> b!38289 (=> res!23069 e!24335)))

(assert (=> b!38289 (= res!23069 (contains!476 Nil!1012 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!38290 () Bool)

(assert (=> b!38290 (= e!24335 true)))

(declare-fun lt!14192 () Bool)

(declare-fun noDuplicate!16 (List!1015) Bool)

(assert (=> b!38290 (= lt!14192 (noDuplicate!16 Nil!1012))))

(declare-fun b!38287 () Bool)

(assert (=> b!38287 (= e!24336 (not e!24335))))

(declare-fun res!23072 () Bool)

(assert (=> b!38287 (=> res!23072 e!24335)))

(assert (=> b!38287 (= res!23072 (or (bvsge (bvadd #b00000000000000000000000000000001 mask!853) #b01111111111111111111111111111111) (bvsgt #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853))))))

(declare-datatypes ((array!2525 0))(
  ( (array!2526 (arr!1206 (Array (_ BitVec 32) (_ BitVec 64))) (size!1313 (_ BitVec 32))) )
))
(declare-fun lt!14194 () array!2525)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2525 (_ BitVec 32)) Bool)

(assert (=> b!38287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!14194 mask!853)))

(declare-datatypes ((Unit!937 0))(
  ( (Unit!938) )
))
(declare-fun lt!14193 () Unit!937)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2525 (_ BitVec 32) (_ BitVec 32)) Unit!937)

(assert (=> b!38287 (= lt!14193 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!14194 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2525 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!38287 (= (arrayCountValidKeys!0 lt!14194 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!14191 () Unit!937)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2525 (_ BitVec 32) (_ BitVec 32)) Unit!937)

(assert (=> b!38287 (= lt!14191 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!14194 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!38287 (= lt!14194 (array!2526 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (= (and start!5338 res!23070) b!38287))

(assert (= (and b!38287 (not res!23072)) b!38288))

(assert (= (and b!38288 (not res!23071)) b!38289))

(assert (= (and b!38289 (not res!23069)) b!38290))

(declare-fun m!30851 () Bool)

(assert (=> start!5338 m!30851))

(declare-fun m!30853 () Bool)

(assert (=> b!38287 m!30853))

(declare-fun m!30855 () Bool)

(assert (=> b!38287 m!30855))

(declare-fun m!30857 () Bool)

(assert (=> b!38287 m!30857))

(declare-fun m!30859 () Bool)

(assert (=> b!38287 m!30859))

(declare-fun m!30861 () Bool)

(assert (=> b!38288 m!30861))

(declare-fun m!30863 () Bool)

(assert (=> b!38290 m!30863))

(declare-fun m!30865 () Bool)

(assert (=> b!38289 m!30865))

(push 1)

(assert (not b!38287))

(assert (not b!38289))

(assert (not b!38290))

(assert (not start!5338))

(assert (not b!38288))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

