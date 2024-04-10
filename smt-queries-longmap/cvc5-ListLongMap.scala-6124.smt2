; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78852 () Bool)

(assert start!78852)

(declare-fun b_free!17065 () Bool)

(declare-fun b_next!17065 () Bool)

(assert (=> start!78852 (= b_free!17065 (not b_next!17065))))

(declare-fun tp!59635 () Bool)

(declare-fun b_and!27867 () Bool)

(assert (=> start!78852 (= tp!59635 b_and!27867)))

(declare-fun b!921147 () Bool)

(declare-fun res!621191 () Bool)

(declare-fun e!516937 () Bool)

(assert (=> b!921147 (=> (not res!621191) (not e!516937))))

(declare-datatypes ((array!55126 0))(
  ( (array!55127 (arr!26508 (Array (_ BitVec 32) (_ BitVec 64))) (size!26967 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55126)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55126 (_ BitVec 32)) Bool)

(assert (=> b!921147 (= res!621191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!921148 () Bool)

(declare-fun res!621187 () Bool)

(declare-fun e!516942 () Bool)

(assert (=> b!921148 (=> (not res!621187) (not e!516942))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!921148 (= res!621187 (validKeyInArray!0 k!1099))))

(declare-fun b!921149 () Bool)

(declare-fun res!621186 () Bool)

(assert (=> b!921149 (=> (not res!621186) (not e!516937))))

(declare-datatypes ((List!18595 0))(
  ( (Nil!18592) (Cons!18591 (h!19737 (_ BitVec 64)) (t!26390 List!18595)) )
))
(declare-fun arrayNoDuplicates!0 (array!55126 (_ BitVec 32) List!18595) Bool)

(assert (=> b!921149 (= res!621186 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18592))))

(declare-fun b!921150 () Bool)

(declare-fun e!516938 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!921150 (= e!516938 (ite (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!921151 () Bool)

(declare-fun e!516940 () Bool)

(declare-fun e!516941 () Bool)

(assert (=> b!921151 (= e!516940 (not e!516941))))

(declare-fun res!621188 () Bool)

(assert (=> b!921151 (=> res!621188 e!516941)))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!921151 (= res!621188 (or (bvsge (size!26967 _keys!1487) #b01111111111111111111111111111111) (bvsge (bvsub from!1844 #b00000000000000000000000000000001) (size!26967 _keys!1487))))))

(assert (=> b!921151 e!516938))

(declare-fun c!96099 () Bool)

(assert (=> b!921151 (= c!96099 (and (not (= k!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((V!31063 0))(
  ( (V!31064 (val!9837 Int)) )
))
(declare-datatypes ((ValueCell!9305 0))(
  ( (ValueCellFull!9305 (v!12355 V!31063)) (EmptyCell!9305) )
))
(declare-datatypes ((array!55128 0))(
  ( (array!55129 (arr!26509 (Array (_ BitVec 32) ValueCell!9305)) (size!26968 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55128)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((Unit!31082 0))(
  ( (Unit!31083) )
))
(declare-fun lt!413552 () Unit!31082)

(declare-fun zeroValue!1173 () V!31063)

(declare-fun minValue!1173 () V!31063)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!174 (array!55126 array!55128 (_ BitVec 32) (_ BitVec 32) V!31063 V!31063 (_ BitVec 64) (_ BitVec 32) Int) Unit!31082)

(assert (=> b!921151 (= lt!413552 (lemmaListMapContainsThenArrayContainsFrom!174 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k!1099 from!1844 defaultEntry!1235))))

(assert (=> b!921151 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18592)))

(declare-fun lt!413558 () Unit!31082)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55126 (_ BitVec 32) (_ BitVec 32)) Unit!31082)

(assert (=> b!921151 (= lt!413558 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!12792 0))(
  ( (tuple2!12793 (_1!6407 (_ BitVec 64)) (_2!6407 V!31063)) )
))
(declare-datatypes ((List!18596 0))(
  ( (Nil!18593) (Cons!18592 (h!19738 tuple2!12792) (t!26391 List!18596)) )
))
(declare-datatypes ((ListLongMap!11489 0))(
  ( (ListLongMap!11490 (toList!5760 List!18596)) )
))
(declare-fun lt!413555 () ListLongMap!11489)

(declare-fun lt!413560 () tuple2!12792)

(declare-fun contains!4815 (ListLongMap!11489 (_ BitVec 64)) Bool)

(declare-fun +!2667 (ListLongMap!11489 tuple2!12792) ListLongMap!11489)

(assert (=> b!921151 (contains!4815 (+!2667 lt!413555 lt!413560) k!1099)))

(declare-fun lt!413559 () Unit!31082)

(declare-fun lt!413557 () V!31063)

(declare-fun lt!413553 () (_ BitVec 64))

(declare-fun addStillContains!391 (ListLongMap!11489 (_ BitVec 64) V!31063 (_ BitVec 64)) Unit!31082)

(assert (=> b!921151 (= lt!413559 (addStillContains!391 lt!413555 lt!413553 lt!413557 k!1099))))

(declare-fun getCurrentListMap!3014 (array!55126 array!55128 (_ BitVec 32) (_ BitVec 32) V!31063 V!31063 (_ BitVec 32) Int) ListLongMap!11489)

(assert (=> b!921151 (= (getCurrentListMap!3014 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2667 (getCurrentListMap!3014 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!413560))))

(assert (=> b!921151 (= lt!413560 (tuple2!12793 lt!413553 lt!413557))))

(declare-fun get!13912 (ValueCell!9305 V!31063) V!31063)

(declare-fun dynLambda!1456 (Int (_ BitVec 64)) V!31063)

(assert (=> b!921151 (= lt!413557 (get!13912 (select (arr!26509 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1456 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!413554 () Unit!31082)

(declare-fun lemmaListMapRecursiveValidKeyArray!57 (array!55126 array!55128 (_ BitVec 32) (_ BitVec 32) V!31063 V!31063 (_ BitVec 32) Int) Unit!31082)

(assert (=> b!921151 (= lt!413554 (lemmaListMapRecursiveValidKeyArray!57 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!921152 () Bool)

(assert (=> b!921152 (= e!516941 true)))

(declare-fun lt!413556 () Bool)

(declare-fun contains!4816 (List!18595 (_ BitVec 64)) Bool)

(assert (=> b!921152 (= lt!413556 (contains!4816 Nil!18592 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921153 () Bool)

(declare-fun res!621192 () Bool)

(assert (=> b!921153 (=> res!621192 e!516941)))

(assert (=> b!921153 (= res!621192 (contains!4816 Nil!18592 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!921154 () Bool)

(declare-fun res!621183 () Bool)

(assert (=> b!921154 (=> (not res!621183) (not e!516942))))

(declare-fun v!791 () V!31063)

(declare-fun apply!600 (ListLongMap!11489 (_ BitVec 64)) V!31063)

(assert (=> b!921154 (= res!621183 (= (apply!600 lt!413555 k!1099) v!791))))

(declare-fun b!921155 () Bool)

(declare-fun arrayContainsKey!0 (array!55126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!921155 (= e!516938 (arrayContainsKey!0 _keys!1487 k!1099 from!1844))))

(declare-fun mapNonEmpty!31116 () Bool)

(declare-fun mapRes!31116 () Bool)

(declare-fun tp!59636 () Bool)

(declare-fun e!516935 () Bool)

(assert (=> mapNonEmpty!31116 (= mapRes!31116 (and tp!59636 e!516935))))

(declare-fun mapValue!31116 () ValueCell!9305)

(declare-fun mapRest!31116 () (Array (_ BitVec 32) ValueCell!9305))

(declare-fun mapKey!31116 () (_ BitVec 32))

(assert (=> mapNonEmpty!31116 (= (arr!26509 _values!1231) (store mapRest!31116 mapKey!31116 mapValue!31116))))

(declare-fun b!921156 () Bool)

(declare-fun e!516936 () Bool)

(declare-fun tp_is_empty!19573 () Bool)

(assert (=> b!921156 (= e!516936 tp_is_empty!19573)))

(declare-fun b!921157 () Bool)

(declare-fun res!621193 () Bool)

(assert (=> b!921157 (=> (not res!621193) (not e!516937))))

(assert (=> b!921157 (= res!621193 (and (= (size!26968 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26967 _keys!1487) (size!26968 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!621181 () Bool)

(assert (=> start!78852 (=> (not res!621181) (not e!516937))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78852 (= res!621181 (validMask!0 mask!1881))))

(assert (=> start!78852 e!516937))

(assert (=> start!78852 true))

(assert (=> start!78852 tp_is_empty!19573))

(declare-fun e!516943 () Bool)

(declare-fun array_inv!20656 (array!55128) Bool)

(assert (=> start!78852 (and (array_inv!20656 _values!1231) e!516943)))

(assert (=> start!78852 tp!59635))

(declare-fun array_inv!20657 (array!55126) Bool)

(assert (=> start!78852 (array_inv!20657 _keys!1487)))

(declare-fun b!921158 () Bool)

(assert (=> b!921158 (= e!516935 tp_is_empty!19573)))

(declare-fun b!921159 () Bool)

(declare-fun res!621189 () Bool)

(assert (=> b!921159 (=> (not res!621189) (not e!516937))))

(assert (=> b!921159 (= res!621189 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26967 _keys!1487))))))

(declare-fun b!921160 () Bool)

(declare-fun res!621184 () Bool)

(assert (=> b!921160 (=> res!621184 e!516941)))

(declare-fun noDuplicate!1341 (List!18595) Bool)

(assert (=> b!921160 (= res!621184 (not (noDuplicate!1341 Nil!18592)))))

(declare-fun b!921161 () Bool)

(assert (=> b!921161 (= e!516943 (and e!516936 mapRes!31116))))

(declare-fun condMapEmpty!31116 () Bool)

(declare-fun mapDefault!31116 () ValueCell!9305)

