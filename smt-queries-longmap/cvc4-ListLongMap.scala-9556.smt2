; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113202 () Bool)

(assert start!113202)

(declare-fun b_free!31253 () Bool)

(declare-fun b_next!31253 () Bool)

(assert (=> start!113202 (= b_free!31253 (not b_next!31253))))

(declare-fun tp!109564 () Bool)

(declare-fun b_and!50413 () Bool)

(assert (=> start!113202 (= tp!109564 b_and!50413)))

(declare-fun b!1342701 () Bool)

(declare-fun res!890813 () Bool)

(declare-fun e!764376 () Bool)

(assert (=> b!1342701 (=> (not res!890813) (not e!764376))))

(declare-datatypes ((array!91354 0))(
  ( (array!91355 (arr!44133 (Array (_ BitVec 32) (_ BitVec 64))) (size!44683 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91354)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91354 (_ BitVec 32)) Bool)

(assert (=> b!1342701 (= res!890813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1342702 () Bool)

(declare-fun e!764374 () Bool)

(declare-fun tp_is_empty!37253 () Bool)

(assert (=> b!1342702 (= e!764374 tp_is_empty!37253)))

(declare-fun res!890812 () Bool)

(assert (=> start!113202 (=> (not res!890812) (not e!764376))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113202 (= res!890812 (validMask!0 mask!1977))))

(assert (=> start!113202 e!764376))

(assert (=> start!113202 tp_is_empty!37253))

(assert (=> start!113202 true))

(declare-fun array_inv!33265 (array!91354) Bool)

(assert (=> start!113202 (array_inv!33265 _keys!1571)))

(declare-datatypes ((V!54773 0))(
  ( (V!54774 (val!18701 Int)) )
))
(declare-datatypes ((ValueCell!17728 0))(
  ( (ValueCellFull!17728 (v!21349 V!54773)) (EmptyCell!17728) )
))
(declare-datatypes ((array!91356 0))(
  ( (array!91357 (arr!44134 (Array (_ BitVec 32) ValueCell!17728)) (size!44684 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91356)

(declare-fun e!764377 () Bool)

(declare-fun array_inv!33266 (array!91356) Bool)

(assert (=> start!113202 (and (array_inv!33266 _values!1303) e!764377)))

(assert (=> start!113202 tp!109564))

(declare-fun b!1342703 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1342703 (= e!764376 (not (bvsge (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!24088 0))(
  ( (tuple2!24089 (_1!12055 (_ BitVec 64)) (_2!12055 V!54773)) )
))
(declare-datatypes ((List!31245 0))(
  ( (Nil!31242) (Cons!31241 (h!32450 tuple2!24088) (t!45709 List!31245)) )
))
(declare-datatypes ((ListLongMap!21745 0))(
  ( (ListLongMap!21746 (toList!10888 List!31245)) )
))
(declare-fun lt!594585 () ListLongMap!21745)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9064 (ListLongMap!21745 (_ BitVec 64)) Bool)

(assert (=> b!1342703 (contains!9064 lt!594585 k!1142)))

(declare-datatypes ((Unit!44071 0))(
  ( (Unit!44072) )
))
(declare-fun lt!594588 () Unit!44071)

(declare-fun lt!594586 () V!54773)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!366 ((_ BitVec 64) (_ BitVec 64) V!54773 ListLongMap!21745) Unit!44071)

(assert (=> b!1342703 (= lt!594588 (lemmaInListMapAfterAddingDiffThenInBefore!366 k!1142 (select (arr!44133 _keys!1571) from!1960) lt!594586 lt!594585))))

(declare-fun lt!594584 () ListLongMap!21745)

(assert (=> b!1342703 (contains!9064 lt!594584 k!1142)))

(declare-fun zeroValue!1245 () V!54773)

(declare-fun lt!594587 () Unit!44071)

(assert (=> b!1342703 (= lt!594587 (lemmaInListMapAfterAddingDiffThenInBefore!366 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594584))))

(declare-fun +!4797 (ListLongMap!21745 tuple2!24088) ListLongMap!21745)

(assert (=> b!1342703 (= lt!594584 (+!4797 lt!594585 (tuple2!24089 (select (arr!44133 _keys!1571) from!1960) lt!594586)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22286 (ValueCell!17728 V!54773) V!54773)

(declare-fun dynLambda!3736 (Int (_ BitVec 64)) V!54773)

(assert (=> b!1342703 (= lt!594586 (get!22286 (select (arr!44134 _values!1303) from!1960) (dynLambda!3736 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54773)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6439 (array!91354 array!91356 (_ BitVec 32) (_ BitVec 32) V!54773 V!54773 (_ BitVec 32) Int) ListLongMap!21745)

(assert (=> b!1342703 (= lt!594585 (getCurrentListMapNoExtraKeys!6439 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342704 () Bool)

(declare-fun res!890820 () Bool)

(assert (=> b!1342704 (=> (not res!890820) (not e!764376))))

(assert (=> b!1342704 (= res!890820 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44683 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342705 () Bool)

(declare-fun res!890815 () Bool)

(assert (=> b!1342705 (=> (not res!890815) (not e!764376))))

(declare-fun getCurrentListMap!5851 (array!91354 array!91356 (_ BitVec 32) (_ BitVec 32) V!54773 V!54773 (_ BitVec 32) Int) ListLongMap!21745)

(assert (=> b!1342705 (= res!890815 (contains!9064 (getCurrentListMap!5851 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1342706 () Bool)

(declare-fun e!764375 () Bool)

(assert (=> b!1342706 (= e!764375 tp_is_empty!37253)))

(declare-fun b!1342707 () Bool)

(declare-fun res!890814 () Bool)

(assert (=> b!1342707 (=> (not res!890814) (not e!764376))))

(declare-datatypes ((List!31246 0))(
  ( (Nil!31243) (Cons!31242 (h!32451 (_ BitVec 64)) (t!45710 List!31246)) )
))
(declare-fun arrayNoDuplicates!0 (array!91354 (_ BitVec 32) List!31246) Bool)

(assert (=> b!1342707 (= res!890814 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31243))))

(declare-fun b!1342708 () Bool)

(declare-fun res!890817 () Bool)

(assert (=> b!1342708 (=> (not res!890817) (not e!764376))))

(assert (=> b!1342708 (= res!890817 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1342709 () Bool)

(declare-fun res!890818 () Bool)

(assert (=> b!1342709 (=> (not res!890818) (not e!764376))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342709 (= res!890818 (validKeyInArray!0 (select (arr!44133 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57586 () Bool)

(declare-fun mapRes!57586 () Bool)

(assert (=> mapIsEmpty!57586 mapRes!57586))

(declare-fun b!1342710 () Bool)

(declare-fun res!890819 () Bool)

(assert (=> b!1342710 (=> (not res!890819) (not e!764376))))

(assert (=> b!1342710 (= res!890819 (not (= (select (arr!44133 _keys!1571) from!1960) k!1142)))))

(declare-fun b!1342711 () Bool)

(declare-fun res!890816 () Bool)

(assert (=> b!1342711 (=> (not res!890816) (not e!764376))))

(assert (=> b!1342711 (= res!890816 (and (= (size!44684 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44683 _keys!1571) (size!44684 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57586 () Bool)

(declare-fun tp!109563 () Bool)

(assert (=> mapNonEmpty!57586 (= mapRes!57586 (and tp!109563 e!764374))))

(declare-fun mapRest!57586 () (Array (_ BitVec 32) ValueCell!17728))

(declare-fun mapKey!57586 () (_ BitVec 32))

(declare-fun mapValue!57586 () ValueCell!17728)

(assert (=> mapNonEmpty!57586 (= (arr!44134 _values!1303) (store mapRest!57586 mapKey!57586 mapValue!57586))))

(declare-fun b!1342712 () Bool)

(assert (=> b!1342712 (= e!764377 (and e!764375 mapRes!57586))))

(declare-fun condMapEmpty!57586 () Bool)

(declare-fun mapDefault!57586 () ValueCell!17728)

