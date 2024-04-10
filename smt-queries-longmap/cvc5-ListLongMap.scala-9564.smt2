; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113246 () Bool)

(assert start!113246)

(declare-fun b_free!31297 () Bool)

(declare-fun b_next!31297 () Bool)

(assert (=> start!113246 (= b_free!31297 (not b_next!31297))))

(declare-fun tp!109696 () Bool)

(declare-fun b_and!50501 () Bool)

(assert (=> start!113246 (= tp!109696 b_and!50501)))

(declare-fun b!1343537 () Bool)

(declare-fun res!891411 () Bool)

(declare-fun e!764706 () Bool)

(assert (=> b!1343537 (=> (not res!891411) (not e!764706))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91438 0))(
  ( (array!91439 (arr!44175 (Array (_ BitVec 32) (_ BitVec 64))) (size!44725 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91438)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54833 0))(
  ( (V!54834 (val!18723 Int)) )
))
(declare-datatypes ((ValueCell!17750 0))(
  ( (ValueCellFull!17750 (v!21371 V!54833)) (EmptyCell!17750) )
))
(declare-datatypes ((array!91440 0))(
  ( (array!91441 (arr!44176 (Array (_ BitVec 32) ValueCell!17750)) (size!44726 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91440)

(assert (=> b!1343537 (= res!891411 (and (= (size!44726 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44725 _keys!1571) (size!44726 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343538 () Bool)

(declare-fun res!891412 () Bool)

(assert (=> b!1343538 (=> (not res!891412) (not e!764706))))

(declare-datatypes ((List!31277 0))(
  ( (Nil!31274) (Cons!31273 (h!32482 (_ BitVec 64)) (t!45785 List!31277)) )
))
(declare-fun arrayNoDuplicates!0 (array!91438 (_ BitVec 32) List!31277) Bool)

(assert (=> b!1343538 (= res!891412 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31274))))

(declare-fun res!891410 () Bool)

(assert (=> start!113246 (=> (not res!891410) (not e!764706))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113246 (= res!891410 (validMask!0 mask!1977))))

(assert (=> start!113246 e!764706))

(declare-fun tp_is_empty!37297 () Bool)

(assert (=> start!113246 tp_is_empty!37297))

(assert (=> start!113246 true))

(declare-fun array_inv!33297 (array!91438) Bool)

(assert (=> start!113246 (array_inv!33297 _keys!1571)))

(declare-fun e!764705 () Bool)

(declare-fun array_inv!33298 (array!91440) Bool)

(assert (=> start!113246 (and (array_inv!33298 _values!1303) e!764705)))

(assert (=> start!113246 tp!109696))

(declare-fun b!1343539 () Bool)

(declare-fun res!891407 () Bool)

(assert (=> b!1343539 (=> (not res!891407) (not e!764706))))

(declare-fun minValue!1245 () V!54833)

(declare-fun zeroValue!1245 () V!54833)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24120 0))(
  ( (tuple2!24121 (_1!12071 (_ BitVec 64)) (_2!12071 V!54833)) )
))
(declare-datatypes ((List!31278 0))(
  ( (Nil!31275) (Cons!31274 (h!32483 tuple2!24120) (t!45786 List!31278)) )
))
(declare-datatypes ((ListLongMap!21777 0))(
  ( (ListLongMap!21778 (toList!10904 List!31278)) )
))
(declare-fun contains!9080 (ListLongMap!21777 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5863 (array!91438 array!91440 (_ BitVec 32) (_ BitVec 32) V!54833 V!54833 (_ BitVec 32) Int) ListLongMap!21777)

(assert (=> b!1343539 (= res!891407 (contains!9080 (getCurrentListMap!5863 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun mapNonEmpty!57652 () Bool)

(declare-fun mapRes!57652 () Bool)

(declare-fun tp!109695 () Bool)

(declare-fun e!764707 () Bool)

(assert (=> mapNonEmpty!57652 (= mapRes!57652 (and tp!109695 e!764707))))

(declare-fun mapValue!57652 () ValueCell!17750)

(declare-fun mapKey!57652 () (_ BitVec 32))

(declare-fun mapRest!57652 () (Array (_ BitVec 32) ValueCell!17750))

(assert (=> mapNonEmpty!57652 (= (arr!44176 _values!1303) (store mapRest!57652 mapKey!57652 mapValue!57652))))

(declare-fun b!1343540 () Bool)

(assert (=> b!1343540 (= e!764707 tp_is_empty!37297)))

(declare-fun mapIsEmpty!57652 () Bool)

(assert (=> mapIsEmpty!57652 mapRes!57652))

(declare-fun b!1343541 () Bool)

(declare-fun e!764704 () Bool)

(assert (=> b!1343541 (= e!764704 tp_is_empty!37297)))

(declare-fun b!1343542 () Bool)

(declare-fun res!891408 () Bool)

(assert (=> b!1343542 (=> (not res!891408) (not e!764706))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91438 (_ BitVec 32)) Bool)

(assert (=> b!1343542 (= res!891408 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343543 () Bool)

(assert (=> b!1343543 (= e!764706 (not true))))

(declare-fun lt!594975 () ListLongMap!21777)

(declare-fun +!4812 (ListLongMap!21777 tuple2!24120) ListLongMap!21777)

(assert (=> b!1343543 (contains!9080 (+!4812 lt!594975 (tuple2!24121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k!1142)))

(declare-datatypes ((Unit!44101 0))(
  ( (Unit!44102) )
))
(declare-fun lt!594970 () Unit!44101)

(declare-fun addStillContains!1205 (ListLongMap!21777 (_ BitVec 64) V!54833 (_ BitVec 64)) Unit!44101)

(assert (=> b!1343543 (= lt!594970 (addStillContains!1205 lt!594975 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k!1142))))

(assert (=> b!1343543 (contains!9080 lt!594975 k!1142)))

(declare-fun lt!594971 () Unit!44101)

(declare-fun lt!594974 () V!54833)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!381 ((_ BitVec 64) (_ BitVec 64) V!54833 ListLongMap!21777) Unit!44101)

(assert (=> b!1343543 (= lt!594971 (lemmaInListMapAfterAddingDiffThenInBefore!381 k!1142 (select (arr!44175 _keys!1571) from!1960) lt!594974 lt!594975))))

(declare-fun lt!594972 () ListLongMap!21777)

(assert (=> b!1343543 (contains!9080 lt!594972 k!1142)))

(declare-fun lt!594973 () Unit!44101)

(assert (=> b!1343543 (= lt!594973 (lemmaInListMapAfterAddingDiffThenInBefore!381 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594972))))

(assert (=> b!1343543 (= lt!594972 (+!4812 lt!594975 (tuple2!24121 (select (arr!44175 _keys!1571) from!1960) lt!594974)))))

(declare-fun get!22317 (ValueCell!17750 V!54833) V!54833)

(declare-fun dynLambda!3751 (Int (_ BitVec 64)) V!54833)

(assert (=> b!1343543 (= lt!594974 (get!22317 (select (arr!44176 _values!1303) from!1960) (dynLambda!3751 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6454 (array!91438 array!91440 (_ BitVec 32) (_ BitVec 32) V!54833 V!54833 (_ BitVec 32) Int) ListLongMap!21777)

(assert (=> b!1343543 (= lt!594975 (getCurrentListMapNoExtraKeys!6454 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343544 () Bool)

(assert (=> b!1343544 (= e!764705 (and e!764704 mapRes!57652))))

(declare-fun condMapEmpty!57652 () Bool)

(declare-fun mapDefault!57652 () ValueCell!17750)

