; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6372 () Bool)

(assert start!6372)

(declare-fun b_free!1461 () Bool)

(declare-fun b_next!1461 () Bool)

(assert (=> start!6372 (= b_free!1461 (not b_next!1461))))

(declare-fun tp!5879 () Bool)

(declare-fun b_and!2571 () Bool)

(assert (=> start!6372 (= tp!5879 b_and!2571)))

(declare-fun res!25413 () Bool)

(declare-fun e!27094 () Bool)

(assert (=> start!6372 (=> (not res!25413) (not e!27094))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6372 (= res!25413 (validMask!0 mask!853))))

(assert (=> start!6372 e!27094))

(assert (=> start!6372 true))

(assert (=> start!6372 tp!5879))

(declare-fun b!42747 () Bool)

(assert (=> b!42747 (= e!27094 (not true))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((V!2255 0))(
  ( (V!2256 (val!964 Int)) )
))
(declare-fun lt!17928 () V!2255)

(declare-datatypes ((array!2847 0))(
  ( (array!2848 (arr!1367 (Array (_ BitVec 32) (_ BitVec 64))) (size!1546 (_ BitVec 32))) )
))
(declare-fun lt!17930 () array!2847)

(declare-datatypes ((tuple2!1582 0))(
  ( (tuple2!1583 (_1!802 (_ BitVec 64)) (_2!802 V!2255)) )
))
(declare-datatypes ((List!1156 0))(
  ( (Nil!1153) (Cons!1152 (h!1729 tuple2!1582) (t!4113 List!1156)) )
))
(declare-datatypes ((ListLongMap!1159 0))(
  ( (ListLongMap!1160 (toList!595 List!1156)) )
))
(declare-fun lt!17929 () ListLongMap!1159)

(declare-datatypes ((ValueCell!678 0))(
  ( (ValueCellFull!678 (v!2054 V!2255)) (EmptyCell!678) )
))
(declare-datatypes ((array!2849 0))(
  ( (array!2850 (arr!1368 (Array (_ BitVec 32) ValueCell!678)) (size!1547 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!336 0))(
  ( (LongMapFixedSize!337 (defaultEntry!1861 Int) (mask!5387 (_ BitVec 32)) (extraKeys!1752 (_ BitVec 32)) (zeroValue!1779 V!2255) (minValue!1779 V!2255) (_size!217 (_ BitVec 32)) (_keys!3404 array!2847) (_values!1844 array!2849) (_vacant!217 (_ BitVec 32))) )
))
(declare-fun map!798 (LongMapFixedSize!336) ListLongMap!1159)

(assert (=> b!42747 (= lt!17929 (map!798 (LongMapFixedSize!337 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17928 lt!17928 #b00000000000000000000000000000000 lt!17930 (array!2850 ((as const (Array (_ BitVec 32) ValueCell!678)) EmptyCell!678) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1157 0))(
  ( (Nil!1154) (Cons!1153 (h!1730 (_ BitVec 64)) (t!4114 List!1157)) )
))
(declare-fun arrayNoDuplicates!0 (array!2847 (_ BitVec 32) List!1157) Bool)

(assert (=> b!42747 (arrayNoDuplicates!0 lt!17930 #b00000000000000000000000000000000 Nil!1154)))

(declare-datatypes ((Unit!1157 0))(
  ( (Unit!1158) )
))
(declare-fun lt!17933 () Unit!1157)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2847 (_ BitVec 32) (_ BitVec 32) List!1157) Unit!1157)

(assert (=> b!42747 (= lt!17933 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17930 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2847 (_ BitVec 32)) Bool)

(assert (=> b!42747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17930 mask!853)))

(declare-fun lt!17932 () Unit!1157)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2847 (_ BitVec 32) (_ BitVec 32)) Unit!1157)

(assert (=> b!42747 (= lt!17932 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17930 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2847 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42747 (= (arrayCountValidKeys!0 lt!17930 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17931 () Unit!1157)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2847 (_ BitVec 32) (_ BitVec 32)) Unit!1157)

(assert (=> b!42747 (= lt!17931 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17930 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42747 (= lt!17930 (array!2848 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!239 (Int (_ BitVec 64)) V!2255)

(assert (=> b!42747 (= lt!17928 (dynLambda!239 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6372 res!25413) b!42747))

(declare-fun b_lambda!2197 () Bool)

(assert (=> (not b_lambda!2197) (not b!42747)))

(declare-fun t!4112 () Bool)

(declare-fun tb!943 () Bool)

(assert (=> (and start!6372 (= defaultEntry!470 defaultEntry!470) t!4112) tb!943))

(declare-fun result!1637 () Bool)

(declare-fun tp_is_empty!1851 () Bool)

(assert (=> tb!943 (= result!1637 tp_is_empty!1851)))

(assert (=> b!42747 t!4112))

(declare-fun b_and!2573 () Bool)

(assert (= b_and!2571 (and (=> t!4112 result!1637) b_and!2573)))

(declare-fun m!36443 () Bool)

(assert (=> start!6372 m!36443))

(declare-fun m!36445 () Bool)

(assert (=> b!42747 m!36445))

(declare-fun m!36447 () Bool)

(assert (=> b!42747 m!36447))

(declare-fun m!36449 () Bool)

(assert (=> b!42747 m!36449))

(declare-fun m!36451 () Bool)

(assert (=> b!42747 m!36451))

(declare-fun m!36453 () Bool)

(assert (=> b!42747 m!36453))

(declare-fun m!36455 () Bool)

(assert (=> b!42747 m!36455))

(declare-fun m!36457 () Bool)

(assert (=> b!42747 m!36457))

(declare-fun m!36459 () Bool)

(assert (=> b!42747 m!36459))

(check-sat (not start!6372) b_and!2573 (not b_next!1461) (not b!42747) (not b_lambda!2197) tp_is_empty!1851)
(check-sat b_and!2573 (not b_next!1461))
