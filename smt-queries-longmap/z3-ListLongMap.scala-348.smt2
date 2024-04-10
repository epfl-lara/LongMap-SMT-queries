; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6378 () Bool)

(assert start!6378)

(declare-fun b_free!1467 () Bool)

(declare-fun b_next!1467 () Bool)

(assert (=> start!6378 (= b_free!1467 (not b_next!1467))))

(declare-fun tp!5888 () Bool)

(declare-fun b_and!2583 () Bool)

(assert (=> start!6378 (= tp!5888 b_and!2583)))

(declare-fun res!25422 () Bool)

(declare-fun e!27103 () Bool)

(assert (=> start!6378 (=> (not res!25422) (not e!27103))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6378 (= res!25422 (validMask!0 mask!853))))

(assert (=> start!6378 e!27103))

(assert (=> start!6378 true))

(assert (=> start!6378 tp!5888))

(declare-fun b!42762 () Bool)

(assert (=> b!42762 (= e!27103 (not true))))

(declare-datatypes ((V!2263 0))(
  ( (V!2264 (val!967 Int)) )
))
(declare-datatypes ((tuple2!1588 0))(
  ( (tuple2!1589 (_1!805 (_ BitVec 64)) (_2!805 V!2263)) )
))
(declare-datatypes ((List!1162 0))(
  ( (Nil!1159) (Cons!1158 (h!1735 tuple2!1588) (t!4125 List!1162)) )
))
(declare-datatypes ((ListLongMap!1165 0))(
  ( (ListLongMap!1166 (toList!598 List!1162)) )
))
(declare-fun lt!17984 () ListLongMap!1165)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2859 0))(
  ( (array!2860 (arr!1373 (Array (_ BitVec 32) (_ BitVec 64))) (size!1552 (_ BitVec 32))) )
))
(declare-fun lt!17982 () array!2859)

(declare-fun lt!17985 () V!2263)

(declare-datatypes ((ValueCell!681 0))(
  ( (ValueCellFull!681 (v!2057 V!2263)) (EmptyCell!681) )
))
(declare-datatypes ((array!2861 0))(
  ( (array!2862 (arr!1374 (Array (_ BitVec 32) ValueCell!681)) (size!1553 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!342 0))(
  ( (LongMapFixedSize!343 (defaultEntry!1864 Int) (mask!5392 (_ BitVec 32)) (extraKeys!1755 (_ BitVec 32)) (zeroValue!1782 V!2263) (minValue!1782 V!2263) (_size!220 (_ BitVec 32)) (_keys!3407 array!2859) (_values!1847 array!2861) (_vacant!220 (_ BitVec 32))) )
))
(declare-fun map!803 (LongMapFixedSize!342) ListLongMap!1165)

(assert (=> b!42762 (= lt!17984 (map!803 (LongMapFixedSize!343 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17985 lt!17985 #b00000000000000000000000000000000 lt!17982 (array!2862 ((as const (Array (_ BitVec 32) ValueCell!681)) EmptyCell!681) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1163 0))(
  ( (Nil!1160) (Cons!1159 (h!1736 (_ BitVec 64)) (t!4126 List!1163)) )
))
(declare-fun arrayNoDuplicates!0 (array!2859 (_ BitVec 32) List!1163) Bool)

(assert (=> b!42762 (arrayNoDuplicates!0 lt!17982 #b00000000000000000000000000000000 Nil!1160)))

(declare-datatypes ((Unit!1163 0))(
  ( (Unit!1164) )
))
(declare-fun lt!17983 () Unit!1163)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2859 (_ BitVec 32) (_ BitVec 32) List!1163) Unit!1163)

(assert (=> b!42762 (= lt!17983 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17982 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1160))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2859 (_ BitVec 32)) Bool)

(assert (=> b!42762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17982 mask!853)))

(declare-fun lt!17987 () Unit!1163)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2859 (_ BitVec 32) (_ BitVec 32)) Unit!1163)

(assert (=> b!42762 (= lt!17987 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17982 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2859 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42762 (= (arrayCountValidKeys!0 lt!17982 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17986 () Unit!1163)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2859 (_ BitVec 32) (_ BitVec 32)) Unit!1163)

(assert (=> b!42762 (= lt!17986 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17982 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42762 (= lt!17982 (array!2860 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!242 (Int (_ BitVec 64)) V!2263)

(assert (=> b!42762 (= lt!17985 (dynLambda!242 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6378 res!25422) b!42762))

(declare-fun b_lambda!2203 () Bool)

(assert (=> (not b_lambda!2203) (not b!42762)))

(declare-fun t!4124 () Bool)

(declare-fun tb!949 () Bool)

(assert (=> (and start!6378 (= defaultEntry!470 defaultEntry!470) t!4124) tb!949))

(declare-fun result!1649 () Bool)

(declare-fun tp_is_empty!1857 () Bool)

(assert (=> tb!949 (= result!1649 tp_is_empty!1857)))

(assert (=> b!42762 t!4124))

(declare-fun b_and!2585 () Bool)

(assert (= b_and!2583 (and (=> t!4124 result!1649) b_and!2585)))

(declare-fun m!36497 () Bool)

(assert (=> start!6378 m!36497))

(declare-fun m!36499 () Bool)

(assert (=> b!42762 m!36499))

(declare-fun m!36501 () Bool)

(assert (=> b!42762 m!36501))

(declare-fun m!36503 () Bool)

(assert (=> b!42762 m!36503))

(declare-fun m!36505 () Bool)

(assert (=> b!42762 m!36505))

(declare-fun m!36507 () Bool)

(assert (=> b!42762 m!36507))

(declare-fun m!36509 () Bool)

(assert (=> b!42762 m!36509))

(declare-fun m!36511 () Bool)

(assert (=> b!42762 m!36511))

(declare-fun m!36513 () Bool)

(assert (=> b!42762 m!36513))

(check-sat (not b_lambda!2203) b_and!2585 (not start!6378) tp_is_empty!1857 (not b_next!1467) (not b!42762))
