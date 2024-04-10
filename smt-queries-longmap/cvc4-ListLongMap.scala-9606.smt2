; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113560 () Bool)

(assert start!113560)

(declare-fun b_free!31553 () Bool)

(declare-fun b_next!31553 () Bool)

(assert (=> start!113560 (= b_free!31553 (not b_next!31553))))

(declare-fun tp!110467 () Bool)

(declare-fun b_and!50895 () Bool)

(assert (=> start!113560 (= tp!110467 b_and!50895)))

(declare-fun b!1348149 () Bool)

(declare-fun e!766950 () Bool)

(declare-fun tp_is_empty!37553 () Bool)

(assert (=> b!1348149 (= e!766950 tp_is_empty!37553)))

(declare-fun b!1348150 () Bool)

(declare-fun e!766952 () Bool)

(assert (=> b!1348150 (= e!766952 tp_is_empty!37553)))

(declare-fun b!1348151 () Bool)

(declare-fun res!894520 () Bool)

(declare-fun e!766951 () Bool)

(assert (=> b!1348151 (=> (not res!894520) (not e!766951))))

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((array!91936 0))(
  ( (array!91937 (arr!44423 (Array (_ BitVec 32) (_ BitVec 64))) (size!44973 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91936)

(assert (=> b!1348151 (= res!894520 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44973 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348152 () Bool)

(declare-fun res!894526 () Bool)

(assert (=> b!1348152 (=> (not res!894526) (not e!766951))))

(assert (=> b!1348152 (= res!894526 (not (= (select (arr!44423 _keys!1571) from!1960) k!1142)))))

(declare-fun mapNonEmpty!58040 () Bool)

(declare-fun mapRes!58040 () Bool)

(declare-fun tp!110468 () Bool)

(assert (=> mapNonEmpty!58040 (= mapRes!58040 (and tp!110468 e!766952))))

(declare-fun mapKey!58040 () (_ BitVec 32))

(declare-datatypes ((V!55173 0))(
  ( (V!55174 (val!18851 Int)) )
))
(declare-datatypes ((ValueCell!17878 0))(
  ( (ValueCellFull!17878 (v!21502 V!55173)) (EmptyCell!17878) )
))
(declare-fun mapValue!58040 () ValueCell!17878)

(declare-fun mapRest!58040 () (Array (_ BitVec 32) ValueCell!17878))

(declare-datatypes ((array!91938 0))(
  ( (array!91939 (arr!44424 (Array (_ BitVec 32) ValueCell!17878)) (size!44974 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91938)

(assert (=> mapNonEmpty!58040 (= (arr!44424 _values!1303) (store mapRest!58040 mapKey!58040 mapValue!58040))))

(declare-fun b!1348153 () Bool)

(declare-fun res!894527 () Bool)

(assert (=> b!1348153 (=> (not res!894527) (not e!766951))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91936 (_ BitVec 32)) Bool)

(assert (=> b!1348153 (= res!894527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1348154 () Bool)

(declare-fun res!894523 () Bool)

(assert (=> b!1348154 (=> (not res!894523) (not e!766951))))

(assert (=> b!1348154 (= res!894523 (and (= (size!44974 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44973 _keys!1571) (size!44974 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348155 () Bool)

(assert (=> b!1348155 (= e!766951 (not true))))

(declare-datatypes ((tuple2!24306 0))(
  ( (tuple2!24307 (_1!12164 (_ BitVec 64)) (_2!12164 V!55173)) )
))
(declare-datatypes ((List!31459 0))(
  ( (Nil!31456) (Cons!31455 (h!32664 tuple2!24306) (t!46091 List!31459)) )
))
(declare-datatypes ((ListLongMap!21963 0))(
  ( (ListLongMap!21964 (toList!10997 List!31459)) )
))
(declare-fun lt!595941 () ListLongMap!21963)

(declare-fun contains!9175 (ListLongMap!21963 (_ BitVec 64)) Bool)

(assert (=> b!1348155 (contains!9175 lt!595941 k!1142)))

(declare-datatypes ((Unit!44170 0))(
  ( (Unit!44171) )
))
(declare-fun lt!595943 () Unit!44170)

(declare-fun lt!595944 () V!55173)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!408 ((_ BitVec 64) (_ BitVec 64) V!55173 ListLongMap!21963) Unit!44170)

(assert (=> b!1348155 (= lt!595943 (lemmaInListMapAfterAddingDiffThenInBefore!408 k!1142 (select (arr!44423 _keys!1571) from!1960) lt!595944 lt!595941))))

(declare-fun lt!595942 () ListLongMap!21963)

(assert (=> b!1348155 (contains!9175 lt!595942 k!1142)))

(declare-fun lt!595945 () Unit!44170)

(declare-fun zeroValue!1245 () V!55173)

(assert (=> b!1348155 (= lt!595945 (lemmaInListMapAfterAddingDiffThenInBefore!408 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595942))))

(declare-fun +!4847 (ListLongMap!21963 tuple2!24306) ListLongMap!21963)

(assert (=> b!1348155 (= lt!595942 (+!4847 lt!595941 (tuple2!24307 (select (arr!44423 _keys!1571) from!1960) lt!595944)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22439 (ValueCell!17878 V!55173) V!55173)

(declare-fun dynLambda!3786 (Int (_ BitVec 64)) V!55173)

(assert (=> b!1348155 (= lt!595944 (get!22439 (select (arr!44424 _values!1303) from!1960) (dynLambda!3786 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!55173)

(declare-fun getCurrentListMapNoExtraKeys!6493 (array!91936 array!91938 (_ BitVec 32) (_ BitVec 32) V!55173 V!55173 (_ BitVec 32) Int) ListLongMap!21963)

(assert (=> b!1348155 (= lt!595941 (getCurrentListMapNoExtraKeys!6493 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1348156 () Bool)

(declare-fun res!894525 () Bool)

(assert (=> b!1348156 (=> (not res!894525) (not e!766951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348156 (= res!894525 (validKeyInArray!0 (select (arr!44423 _keys!1571) from!1960)))))

(declare-fun b!1348157 () Bool)

(declare-fun e!766948 () Bool)

(assert (=> b!1348157 (= e!766948 (and e!766950 mapRes!58040))))

(declare-fun condMapEmpty!58040 () Bool)

(declare-fun mapDefault!58040 () ValueCell!17878)

