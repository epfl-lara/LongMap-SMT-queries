; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111894 () Bool)

(assert start!111894)

(declare-fun b_free!30493 () Bool)

(declare-fun b_next!30493 () Bool)

(assert (=> start!111894 (= b_free!30493 (not b_next!30493))))

(declare-fun tp!106958 () Bool)

(declare-fun b_and!49081 () Bool)

(assert (=> start!111894 (= tp!106958 b_and!49081)))

(declare-fun b!1325908 () Bool)

(declare-fun res!879996 () Bool)

(declare-fun e!755796 () Bool)

(assert (=> b!1325908 (=> (not res!879996) (not e!755796))))

(declare-datatypes ((array!89532 0))(
  ( (array!89533 (arr!43239 (Array (_ BitVec 32) (_ BitVec 64))) (size!43789 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89532)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k!1164 () (_ BitVec 64))

(assert (=> b!1325908 (= res!879996 (not (= (select (arr!43239 _keys!1609) from!2000) k!1164)))))

(declare-fun b!1325909 () Bool)

(declare-fun res!880000 () Bool)

(assert (=> b!1325909 (=> (not res!880000) (not e!755796))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1325909 (= res!880000 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43789 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325910 () Bool)

(declare-fun e!755793 () Bool)

(declare-fun tp_is_empty!36313 () Bool)

(assert (=> b!1325910 (= e!755793 tp_is_empty!36313)))

(declare-fun mapIsEmpty!56121 () Bool)

(declare-fun mapRes!56121 () Bool)

(assert (=> mapIsEmpty!56121 mapRes!56121))

(declare-fun b!1325911 () Bool)

(declare-fun res!879994 () Bool)

(assert (=> b!1325911 (=> (not res!879994) (not e!755796))))

(declare-datatypes ((V!53521 0))(
  ( (V!53522 (val!18231 Int)) )
))
(declare-fun zeroValue!1279 () V!53521)

(declare-datatypes ((ValueCell!17258 0))(
  ( (ValueCellFull!17258 (v!20864 V!53521)) (EmptyCell!17258) )
))
(declare-datatypes ((array!89534 0))(
  ( (array!89535 (arr!43240 (Array (_ BitVec 32) ValueCell!17258)) (size!43790 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89534)

(declare-fun minValue!1279 () V!53521)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23516 0))(
  ( (tuple2!23517 (_1!11769 (_ BitVec 64)) (_2!11769 V!53521)) )
))
(declare-datatypes ((List!30655 0))(
  ( (Nil!30652) (Cons!30651 (h!31860 tuple2!23516) (t!44619 List!30655)) )
))
(declare-datatypes ((ListLongMap!21173 0))(
  ( (ListLongMap!21174 (toList!10602 List!30655)) )
))
(declare-fun contains!8759 (ListLongMap!21173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5594 (array!89532 array!89534 (_ BitVec 32) (_ BitVec 32) V!53521 V!53521 (_ BitVec 32) Int) ListLongMap!21173)

(assert (=> b!1325911 (= res!879994 (contains!8759 (getCurrentListMap!5594 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun b!1325912 () Bool)

(declare-fun res!879993 () Bool)

(assert (=> b!1325912 (=> (not res!879993) (not e!755796))))

(assert (=> b!1325912 (= res!879993 (and (= (size!43790 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43789 _keys!1609) (size!43790 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!56121 () Bool)

(declare-fun tp!106959 () Bool)

(assert (=> mapNonEmpty!56121 (= mapRes!56121 (and tp!106959 e!755793))))

(declare-fun mapRest!56121 () (Array (_ BitVec 32) ValueCell!17258))

(declare-fun mapValue!56121 () ValueCell!17258)

(declare-fun mapKey!56121 () (_ BitVec 32))

(assert (=> mapNonEmpty!56121 (= (arr!43240 _values!1337) (store mapRest!56121 mapKey!56121 mapValue!56121))))

(declare-fun b!1325914 () Bool)

(declare-fun res!879998 () Bool)

(assert (=> b!1325914 (=> (not res!879998) (not e!755796))))

(declare-datatypes ((List!30656 0))(
  ( (Nil!30653) (Cons!30652 (h!31861 (_ BitVec 64)) (t!44620 List!30656)) )
))
(declare-fun arrayNoDuplicates!0 (array!89532 (_ BitVec 32) List!30656) Bool)

(assert (=> b!1325914 (= res!879998 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30653))))

(declare-fun b!1325915 () Bool)

(declare-fun res!879997 () Bool)

(assert (=> b!1325915 (=> (not res!879997) (not e!755796))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89532 (_ BitVec 32)) Bool)

(assert (=> b!1325915 (= res!879997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1325916 () Bool)

(declare-fun e!755795 () Bool)

(assert (=> b!1325916 (= e!755795 tp_is_empty!36313)))

(declare-fun b!1325917 () Bool)

(assert (=> b!1325917 (= e!755796 (not true))))

(declare-fun lt!589869 () ListLongMap!21173)

(assert (=> b!1325917 (contains!8759 lt!589869 k!1164)))

(declare-datatypes ((Unit!43678 0))(
  ( (Unit!43679) )
))
(declare-fun lt!589866 () Unit!43678)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!217 ((_ BitVec 64) (_ BitVec 64) V!53521 ListLongMap!21173) Unit!43678)

(assert (=> b!1325917 (= lt!589866 (lemmaInListMapAfterAddingDiffThenInBefore!217 k!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589869))))

(declare-fun lt!589867 () ListLongMap!21173)

(assert (=> b!1325917 (contains!8759 lt!589867 k!1164)))

(declare-fun lt!589868 () Unit!43678)

(assert (=> b!1325917 (= lt!589868 (lemmaInListMapAfterAddingDiffThenInBefore!217 k!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589867))))

(declare-fun +!4625 (ListLongMap!21173 tuple2!23516) ListLongMap!21173)

(assert (=> b!1325917 (= lt!589867 (+!4625 lt!589869 (tuple2!23517 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun getCurrentListMapNoExtraKeys!6263 (array!89532 array!89534 (_ BitVec 32) (_ BitVec 32) V!53521 V!53521 (_ BitVec 32) Int) ListLongMap!21173)

(declare-fun get!21784 (ValueCell!17258 V!53521) V!53521)

(declare-fun dynLambda!3564 (Int (_ BitVec 64)) V!53521)

(assert (=> b!1325917 (= lt!589869 (+!4625 (getCurrentListMapNoExtraKeys!6263 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23517 (select (arr!43239 _keys!1609) from!2000) (get!21784 (select (arr!43240 _values!1337) from!2000) (dynLambda!3564 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1325918 () Bool)

(declare-fun e!755794 () Bool)

(assert (=> b!1325918 (= e!755794 (and e!755795 mapRes!56121))))

(declare-fun condMapEmpty!56121 () Bool)

(declare-fun mapDefault!56121 () ValueCell!17258)

