; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6384 () Bool)

(assert start!6384)

(declare-fun b_free!1469 () Bool)

(declare-fun b_next!1469 () Bool)

(assert (=> start!6384 (= b_free!1469 (not b_next!1469))))

(declare-fun tp!5891 () Bool)

(declare-fun b_and!2585 () Bool)

(assert (=> start!6384 (= tp!5891 b_and!2585)))

(declare-fun res!25400 () Bool)

(declare-fun e!27069 () Bool)

(assert (=> start!6384 (=> (not res!25400) (not e!27069))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6384 (= res!25400 (validMask!0 mask!853))))

(assert (=> start!6384 e!27069))

(assert (=> start!6384 true))

(assert (=> start!6384 tp!5891))

(declare-fun b!42710 () Bool)

(assert (=> b!42710 (= e!27069 (not true))))

(declare-datatypes ((V!2265 0))(
  ( (V!2266 (val!968 Int)) )
))
(declare-fun lt!17959 () V!2265)

(declare-datatypes ((array!2849 0))(
  ( (array!2850 (arr!1368 (Array (_ BitVec 32) (_ BitVec 64))) (size!1547 (_ BitVec 32))) )
))
(declare-fun lt!17957 () array!2849)

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((tuple2!1572 0))(
  ( (tuple2!1573 (_1!797 (_ BitVec 64)) (_2!797 V!2265)) )
))
(declare-datatypes ((List!1150 0))(
  ( (Nil!1147) (Cons!1146 (h!1723 tuple2!1572) (t!4115 List!1150)) )
))
(declare-datatypes ((ListLongMap!1143 0))(
  ( (ListLongMap!1144 (toList!587 List!1150)) )
))
(declare-fun lt!17961 () ListLongMap!1143)

(declare-datatypes ((ValueCell!682 0))(
  ( (ValueCellFull!682 (v!2059 V!2265)) (EmptyCell!682) )
))
(declare-datatypes ((array!2851 0))(
  ( (array!2852 (arr!1369 (Array (_ BitVec 32) ValueCell!682)) (size!1548 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!344 0))(
  ( (LongMapFixedSize!345 (defaultEntry!1865 Int) (mask!5393 (_ BitVec 32)) (extraKeys!1756 (_ BitVec 32)) (zeroValue!1783 V!2265) (minValue!1783 V!2265) (_size!221 (_ BitVec 32)) (_keys!3408 array!2849) (_values!1848 array!2851) (_vacant!221 (_ BitVec 32))) )
))
(declare-fun map!804 (LongMapFixedSize!344) ListLongMap!1143)

(assert (=> b!42710 (= lt!17961 (map!804 (LongMapFixedSize!345 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17959 lt!17959 #b00000000000000000000000000000000 lt!17957 (array!2852 ((as const (Array (_ BitVec 32) ValueCell!682)) EmptyCell!682) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1151 0))(
  ( (Nil!1148) (Cons!1147 (h!1724 (_ BitVec 64)) (t!4116 List!1151)) )
))
(declare-fun arrayNoDuplicates!0 (array!2849 (_ BitVec 32) List!1151) Bool)

(assert (=> b!42710 (arrayNoDuplicates!0 lt!17957 #b00000000000000000000000000000000 Nil!1148)))

(declare-datatypes ((Unit!1177 0))(
  ( (Unit!1178) )
))
(declare-fun lt!17958 () Unit!1177)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2849 (_ BitVec 32) (_ BitVec 32) List!1151) Unit!1177)

(assert (=> b!42710 (= lt!17958 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17957 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2849 (_ BitVec 32)) Bool)

(assert (=> b!42710 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17957 mask!853)))

(declare-fun lt!17960 () Unit!1177)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2849 (_ BitVec 32) (_ BitVec 32)) Unit!1177)

(assert (=> b!42710 (= lt!17960 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17957 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2849 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42710 (= (arrayCountValidKeys!0 lt!17957 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17962 () Unit!1177)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2849 (_ BitVec 32) (_ BitVec 32)) Unit!1177)

(assert (=> b!42710 (= lt!17962 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17957 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42710 (= lt!17957 (array!2850 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!239 (Int (_ BitVec 64)) V!2265)

(assert (=> b!42710 (= lt!17959 (dynLambda!239 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6384 res!25400) b!42710))

(declare-fun b_lambda!2205 () Bool)

(assert (=> (not b_lambda!2205) (not b!42710)))

(declare-fun t!4114 () Bool)

(declare-fun tb!951 () Bool)

(assert (=> (and start!6384 (= defaultEntry!470 defaultEntry!470) t!4114) tb!951))

(declare-fun result!1653 () Bool)

(declare-fun tp_is_empty!1859 () Bool)

(assert (=> tb!951 (= result!1653 tp_is_empty!1859)))

(assert (=> b!42710 t!4114))

(declare-fun b_and!2587 () Bool)

(assert (= b_and!2585 (and (=> t!4114 result!1653) b_and!2587)))

(declare-fun m!36391 () Bool)

(assert (=> start!6384 m!36391))

(declare-fun m!36393 () Bool)

(assert (=> b!42710 m!36393))

(declare-fun m!36395 () Bool)

(assert (=> b!42710 m!36395))

(declare-fun m!36397 () Bool)

(assert (=> b!42710 m!36397))

(declare-fun m!36399 () Bool)

(assert (=> b!42710 m!36399))

(declare-fun m!36401 () Bool)

(assert (=> b!42710 m!36401))

(declare-fun m!36403 () Bool)

(assert (=> b!42710 m!36403))

(declare-fun m!36405 () Bool)

(assert (=> b!42710 m!36405))

(declare-fun m!36407 () Bool)

(assert (=> b!42710 m!36407))

(push 1)

(assert tp_is_empty!1859)

(assert (not b_next!1469))

(assert (not b_lambda!2205))

(assert b_and!2587)

(assert (not start!6384))

(assert (not b!42710))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2587)

(assert (not b_next!1469))

(check-sat)

(pop 1)

