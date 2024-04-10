; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113102 () Bool)

(assert start!113102)

(declare-fun b_free!31153 () Bool)

(declare-fun b_next!31153 () Bool)

(assert (=> start!113102 (= b_free!31153 (not b_next!31153))))

(declare-fun tp!109263 () Bool)

(declare-fun b_and!50213 () Bool)

(assert (=> start!113102 (= tp!109263 b_and!50213)))

(declare-fun mapIsEmpty!57436 () Bool)

(declare-fun mapRes!57436 () Bool)

(assert (=> mapIsEmpty!57436 mapRes!57436))

(declare-fun b!1340801 () Bool)

(declare-fun res!889465 () Bool)

(declare-fun e!763625 () Bool)

(assert (=> b!1340801 (=> (not res!889465) (not e!763625))))

(declare-datatypes ((V!54641 0))(
  ( (V!54642 (val!18651 Int)) )
))
(declare-fun minValue!1245 () V!54641)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91158 0))(
  ( (array!91159 (arr!44035 (Array (_ BitVec 32) (_ BitVec 64))) (size!44585 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91158)

(declare-fun zeroValue!1245 () V!54641)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17678 0))(
  ( (ValueCellFull!17678 (v!21299 V!54641)) (EmptyCell!17678) )
))
(declare-datatypes ((array!91160 0))(
  ( (array!91161 (arr!44036 (Array (_ BitVec 32) ValueCell!17678)) (size!44586 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91160)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24010 0))(
  ( (tuple2!24011 (_1!12016 (_ BitVec 64)) (_2!12016 V!54641)) )
))
(declare-datatypes ((List!31172 0))(
  ( (Nil!31169) (Cons!31168 (h!32377 tuple2!24010) (t!45536 List!31172)) )
))
(declare-datatypes ((ListLongMap!21667 0))(
  ( (ListLongMap!21668 (toList!10849 List!31172)) )
))
(declare-fun contains!9025 (ListLongMap!21667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5816 (array!91158 array!91160 (_ BitVec 32) (_ BitVec 32) V!54641 V!54641 (_ BitVec 32) Int) ListLongMap!21667)

(assert (=> b!1340801 (= res!889465 (contains!9025 (getCurrentListMap!5816 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1340802 () Bool)

(declare-fun res!889468 () Bool)

(assert (=> b!1340802 (=> (not res!889468) (not e!763625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91158 (_ BitVec 32)) Bool)

(assert (=> b!1340802 (= res!889468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1340803 () Bool)

(declare-fun e!763626 () Bool)

(declare-fun tp_is_empty!37153 () Bool)

(assert (=> b!1340803 (= e!763626 tp_is_empty!37153)))

(declare-fun b!1340805 () Bool)

(declare-fun res!889464 () Bool)

(assert (=> b!1340805 (=> (not res!889464) (not e!763625))))

(assert (=> b!1340805 (= res!889464 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340806 () Bool)

(declare-fun res!889467 () Bool)

(assert (=> b!1340806 (=> (not res!889467) (not e!763625))))

(assert (=> b!1340806 (= res!889467 (and (= (size!44586 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44585 _keys!1571) (size!44586 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57436 () Bool)

(declare-fun tp!109264 () Bool)

(declare-fun e!763624 () Bool)

(assert (=> mapNonEmpty!57436 (= mapRes!57436 (and tp!109264 e!763624))))

(declare-fun mapValue!57436 () ValueCell!17678)

(declare-fun mapRest!57436 () (Array (_ BitVec 32) ValueCell!17678))

(declare-fun mapKey!57436 () (_ BitVec 32))

(assert (=> mapNonEmpty!57436 (= (arr!44036 _values!1303) (store mapRest!57436 mapKey!57436 mapValue!57436))))

(declare-fun b!1340807 () Bool)

(declare-fun res!889466 () Bool)

(assert (=> b!1340807 (=> (not res!889466) (not e!763625))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340807 (= res!889466 (validKeyInArray!0 (select (arr!44035 _keys!1571) from!1960)))))

(declare-fun b!1340808 () Bool)

(assert (=> b!1340808 (= e!763624 tp_is_empty!37153)))

(declare-fun b!1340809 () Bool)

(declare-fun res!889463 () Bool)

(assert (=> b!1340809 (=> (not res!889463) (not e!763625))))

(assert (=> b!1340809 (= res!889463 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44585 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340810 () Bool)

(declare-fun res!889469 () Bool)

(assert (=> b!1340810 (=> (not res!889469) (not e!763625))))

(assert (=> b!1340810 (= res!889469 (not (= (select (arr!44035 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1340804 () Bool)

(assert (=> b!1340804 (= e!763625 (not true))))

(declare-fun lt!594045 () ListLongMap!21667)

(assert (=> b!1340804 (contains!9025 lt!594045 k!1142)))

(declare-datatypes ((Unit!44005 0))(
  ( (Unit!44006) )
))
(declare-fun lt!594044 () Unit!44005)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!333 ((_ BitVec 64) (_ BitVec 64) V!54641 ListLongMap!21667) Unit!44005)

(assert (=> b!1340804 (= lt!594044 (lemmaInListMapAfterAddingDiffThenInBefore!333 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594045))))

(declare-fun +!4764 (ListLongMap!21667 tuple2!24010) ListLongMap!21667)

(declare-fun getCurrentListMapNoExtraKeys!6406 (array!91158 array!91160 (_ BitVec 32) (_ BitVec 32) V!54641 V!54641 (_ BitVec 32) Int) ListLongMap!21667)

(declare-fun get!22221 (ValueCell!17678 V!54641) V!54641)

(declare-fun dynLambda!3703 (Int (_ BitVec 64)) V!54641)

(assert (=> b!1340804 (= lt!594045 (+!4764 (getCurrentListMapNoExtraKeys!6406 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24011 (select (arr!44035 _keys!1571) from!1960) (get!22221 (select (arr!44036 _values!1303) from!1960) (dynLambda!3703 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!889470 () Bool)

(assert (=> start!113102 (=> (not res!889470) (not e!763625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113102 (= res!889470 (validMask!0 mask!1977))))

(assert (=> start!113102 e!763625))

(assert (=> start!113102 tp_is_empty!37153))

(assert (=> start!113102 true))

(declare-fun array_inv!33201 (array!91158) Bool)

(assert (=> start!113102 (array_inv!33201 _keys!1571)))

(declare-fun e!763628 () Bool)

(declare-fun array_inv!33202 (array!91160) Bool)

(assert (=> start!113102 (and (array_inv!33202 _values!1303) e!763628)))

(assert (=> start!113102 tp!109263))

(declare-fun b!1340811 () Bool)

(declare-fun res!889462 () Bool)

(assert (=> b!1340811 (=> (not res!889462) (not e!763625))))

(declare-datatypes ((List!31173 0))(
  ( (Nil!31170) (Cons!31169 (h!32378 (_ BitVec 64)) (t!45537 List!31173)) )
))
(declare-fun arrayNoDuplicates!0 (array!91158 (_ BitVec 32) List!31173) Bool)

(assert (=> b!1340811 (= res!889462 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31170))))

(declare-fun b!1340812 () Bool)

(assert (=> b!1340812 (= e!763628 (and e!763626 mapRes!57436))))

(declare-fun condMapEmpty!57436 () Bool)

(declare-fun mapDefault!57436 () ValueCell!17678)

