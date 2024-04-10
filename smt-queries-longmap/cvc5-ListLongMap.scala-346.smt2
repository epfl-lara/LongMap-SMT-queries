; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6364 () Bool)

(assert start!6364)

(declare-fun b_free!1453 () Bool)

(declare-fun b_next!1453 () Bool)

(assert (=> start!6364 (= b_free!1453 (not b_next!1453))))

(declare-fun tp!5867 () Bool)

(declare-fun b_and!2555 () Bool)

(assert (=> start!6364 (= tp!5867 b_and!2555)))

(declare-fun res!25401 () Bool)

(declare-fun e!27082 () Bool)

(assert (=> start!6364 (=> (not res!25401) (not e!27082))))

(declare-fun mask!853 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!6364 (= res!25401 (validMask!0 mask!853))))

(assert (=> start!6364 e!27082))

(assert (=> start!6364 true))

(assert (=> start!6364 tp!5867))

(declare-fun b!42727 () Bool)

(assert (=> b!42727 (= e!27082 (not true))))

(declare-fun defaultEntry!470 () Int)

(declare-datatypes ((array!2831 0))(
  ( (array!2832 (arr!1359 (Array (_ BitVec 32) (_ BitVec 64))) (size!1538 (_ BitVec 32))) )
))
(declare-fun lt!17858 () array!2831)

(declare-datatypes ((V!2245 0))(
  ( (V!2246 (val!960 Int)) )
))
(declare-fun lt!17860 () V!2245)

(declare-datatypes ((tuple2!1574 0))(
  ( (tuple2!1575 (_1!798 (_ BitVec 64)) (_2!798 V!2245)) )
))
(declare-datatypes ((List!1148 0))(
  ( (Nil!1145) (Cons!1144 (h!1721 tuple2!1574) (t!4097 List!1148)) )
))
(declare-datatypes ((ListLongMap!1151 0))(
  ( (ListLongMap!1152 (toList!591 List!1148)) )
))
(declare-fun lt!17861 () ListLongMap!1151)

(declare-datatypes ((ValueCell!674 0))(
  ( (ValueCellFull!674 (v!2050 V!2245)) (EmptyCell!674) )
))
(declare-datatypes ((array!2833 0))(
  ( (array!2834 (arr!1360 (Array (_ BitVec 32) ValueCell!674)) (size!1539 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!328 0))(
  ( (LongMapFixedSize!329 (defaultEntry!1857 Int) (mask!5381 (_ BitVec 32)) (extraKeys!1748 (_ BitVec 32)) (zeroValue!1775 V!2245) (minValue!1775 V!2245) (_size!213 (_ BitVec 32)) (_keys!3400 array!2831) (_values!1840 array!2833) (_vacant!213 (_ BitVec 32))) )
))
(declare-fun map!792 (LongMapFixedSize!328) ListLongMap!1151)

(assert (=> b!42727 (= lt!17861 (map!792 (LongMapFixedSize!329 defaultEntry!470 mask!853 #b00000000000000000000000000000000 lt!17860 lt!17860 #b00000000000000000000000000000000 lt!17858 (array!2834 ((as const (Array (_ BitVec 32) ValueCell!674)) EmptyCell!674) (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))))

(declare-datatypes ((List!1149 0))(
  ( (Nil!1146) (Cons!1145 (h!1722 (_ BitVec 64)) (t!4098 List!1149)) )
))
(declare-fun arrayNoDuplicates!0 (array!2831 (_ BitVec 32) List!1149) Bool)

(assert (=> b!42727 (arrayNoDuplicates!0 lt!17858 #b00000000000000000000000000000000 Nil!1146)))

(declare-datatypes ((Unit!1149 0))(
  ( (Unit!1150) )
))
(declare-fun lt!17859 () Unit!1149)

(declare-fun lemmaArrayNoDuplicatesInAll0Array!0 (array!2831 (_ BitVec 32) (_ BitVec 32) List!1149) Unit!1149)

(assert (=> b!42727 (= lt!17859 (lemmaArrayNoDuplicatesInAll0Array!0 lt!17858 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853) Nil!1146))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2831 (_ BitVec 32)) Bool)

(assert (=> b!42727 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!17858 mask!853)))

(declare-fun lt!17856 () Unit!1149)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 (array!2831 (_ BitVec 32) (_ BitVec 32)) Unit!1149)

(assert (=> b!42727 (= lt!17856 (lemmaArrayForallSeekEntryOrOpenFoundAlwaysTrueFor0Array!0 lt!17858 mask!853 #b00000000000000000000000000000000))))

(declare-fun arrayCountValidKeys!0 (array!2831 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!42727 (= (arrayCountValidKeys!0 lt!17858 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)) #b00000000000000000000000000000000)))

(declare-fun lt!17857 () Unit!1149)

(declare-fun lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 (array!2831 (_ BitVec 32) (_ BitVec 32)) Unit!1149)

(assert (=> b!42727 (= lt!17857 (lemmaArrayCountValidKeysOfFilled0ArrayIs0!0 lt!17858 #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 mask!853)))))

(assert (=> b!42727 (= lt!17858 (array!2832 ((as const (Array (_ BitVec 32) (_ BitVec 64))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvadd #b00000000000000000000000000000001 mask!853)))))

(declare-fun dynLambda!235 (Int (_ BitVec 64)) V!2245)

(assert (=> b!42727 (= lt!17860 (dynLambda!235 defaultEntry!470 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!6364 res!25401) b!42727))

(declare-fun b_lambda!2189 () Bool)

(assert (=> (not b_lambda!2189) (not b!42727)))

(declare-fun t!4096 () Bool)

(declare-fun tb!935 () Bool)

(assert (=> (and start!6364 (= defaultEntry!470 defaultEntry!470) t!4096) tb!935))

(declare-fun result!1621 () Bool)

(declare-fun tp_is_empty!1843 () Bool)

(assert (=> tb!935 (= result!1621 tp_is_empty!1843)))

(assert (=> b!42727 t!4096))

(declare-fun b_and!2557 () Bool)

(assert (= b_and!2555 (and (=> t!4096 result!1621) b_and!2557)))

(declare-fun m!36371 () Bool)

(assert (=> start!6364 m!36371))

(declare-fun m!36373 () Bool)

(assert (=> b!42727 m!36373))

(declare-fun m!36375 () Bool)

(assert (=> b!42727 m!36375))

(declare-fun m!36377 () Bool)

(assert (=> b!42727 m!36377))

(declare-fun m!36379 () Bool)

(assert (=> b!42727 m!36379))

(declare-fun m!36381 () Bool)

(assert (=> b!42727 m!36381))

(declare-fun m!36383 () Bool)

(assert (=> b!42727 m!36383))

(declare-fun m!36385 () Bool)

(assert (=> b!42727 m!36385))

(declare-fun m!36387 () Bool)

(assert (=> b!42727 m!36387))

(push 1)

(assert b_and!2557)

(assert (not start!6364))

(assert (not b!42727))

(assert (not b_next!1453))

(assert tp_is_empty!1843)

(assert (not b_lambda!2189))

(check-sat)

(pop 1)

(push 1)

(assert b_and!2557)

(assert (not b_next!1453))

(check-sat)

(pop 1)

