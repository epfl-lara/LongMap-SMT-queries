; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113208 () Bool)

(assert start!113208)

(declare-fun b_free!31259 () Bool)

(declare-fun b_next!31259 () Bool)

(assert (=> start!113208 (= b_free!31259 (not b_next!31259))))

(declare-fun tp!109582 () Bool)

(declare-fun b_and!50425 () Bool)

(assert (=> start!113208 (= tp!109582 b_and!50425)))

(declare-fun b!1342815 () Bool)

(declare-fun res!890896 () Bool)

(declare-fun e!764423 () Bool)

(assert (=> b!1342815 (=> (not res!890896) (not e!764423))))

(declare-datatypes ((array!91366 0))(
  ( (array!91367 (arr!44139 (Array (_ BitVec 32) (_ BitVec 64))) (size!44689 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91366)

(declare-datatypes ((List!31251 0))(
  ( (Nil!31248) (Cons!31247 (h!32456 (_ BitVec 64)) (t!45721 List!31251)) )
))
(declare-fun arrayNoDuplicates!0 (array!91366 (_ BitVec 32) List!31251) Bool)

(assert (=> b!1342815 (= res!890896 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31248))))

(declare-fun b!1342816 () Bool)

(declare-fun e!764422 () Bool)

(declare-fun tp_is_empty!37259 () Bool)

(assert (=> b!1342816 (= e!764422 tp_is_empty!37259)))

(declare-fun b!1342817 () Bool)

(assert (=> b!1342817 (= e!764423 (not true))))

(declare-datatypes ((V!54781 0))(
  ( (V!54782 (val!18704 Int)) )
))
(declare-datatypes ((tuple2!24094 0))(
  ( (tuple2!24095 (_1!12058 (_ BitVec 64)) (_2!12058 V!54781)) )
))
(declare-datatypes ((List!31252 0))(
  ( (Nil!31249) (Cons!31248 (h!32457 tuple2!24094) (t!45722 List!31252)) )
))
(declare-datatypes ((ListLongMap!21751 0))(
  ( (ListLongMap!21752 (toList!10891 List!31252)) )
))
(declare-fun lt!594630 () ListLongMap!21751)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun contains!9067 (ListLongMap!21751 (_ BitVec 64)) Bool)

(assert (=> b!1342817 (contains!9067 lt!594630 k!1142)))

(declare-fun lt!594633 () V!54781)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((Unit!44075 0))(
  ( (Unit!44076) )
))
(declare-fun lt!594631 () Unit!44075)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!368 ((_ BitVec 64) (_ BitVec 64) V!54781 ListLongMap!21751) Unit!44075)

(assert (=> b!1342817 (= lt!594631 (lemmaInListMapAfterAddingDiffThenInBefore!368 k!1142 (select (arr!44139 _keys!1571) from!1960) lt!594633 lt!594630))))

(declare-fun lt!594629 () ListLongMap!21751)

(assert (=> b!1342817 (contains!9067 lt!594629 k!1142)))

(declare-fun zeroValue!1245 () V!54781)

(declare-fun lt!594632 () Unit!44075)

(assert (=> b!1342817 (= lt!594632 (lemmaInListMapAfterAddingDiffThenInBefore!368 k!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594629))))

(declare-fun +!4799 (ListLongMap!21751 tuple2!24094) ListLongMap!21751)

(assert (=> b!1342817 (= lt!594629 (+!4799 lt!594630 (tuple2!24095 (select (arr!44139 _keys!1571) from!1960) lt!594633)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17731 0))(
  ( (ValueCellFull!17731 (v!21352 V!54781)) (EmptyCell!17731) )
))
(declare-datatypes ((array!91368 0))(
  ( (array!91369 (arr!44140 (Array (_ BitVec 32) ValueCell!17731)) (size!44690 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91368)

(declare-fun get!22290 (ValueCell!17731 V!54781) V!54781)

(declare-fun dynLambda!3738 (Int (_ BitVec 64)) V!54781)

(assert (=> b!1342817 (= lt!594633 (get!22290 (select (arr!44140 _values!1303) from!1960) (dynLambda!3738 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54781)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6441 (array!91366 array!91368 (_ BitVec 32) (_ BitVec 32) V!54781 V!54781 (_ BitVec 32) Int) ListLongMap!21751)

(assert (=> b!1342817 (= lt!594630 (getCurrentListMapNoExtraKeys!6441 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1342818 () Bool)

(declare-fun res!890899 () Bool)

(assert (=> b!1342818 (=> (not res!890899) (not e!764423))))

(assert (=> b!1342818 (= res!890899 (and (= (size!44690 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44689 _keys!1571) (size!44690 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57595 () Bool)

(declare-fun mapRes!57595 () Bool)

(assert (=> mapIsEmpty!57595 mapRes!57595))

(declare-fun b!1342819 () Bool)

(declare-fun res!890894 () Bool)

(assert (=> b!1342819 (=> (not res!890894) (not e!764423))))

(assert (=> b!1342819 (= res!890894 (not (= (select (arr!44139 _keys!1571) from!1960) k!1142)))))

(declare-fun mapNonEmpty!57595 () Bool)

(declare-fun tp!109581 () Bool)

(assert (=> mapNonEmpty!57595 (= mapRes!57595 (and tp!109581 e!764422))))

(declare-fun mapValue!57595 () ValueCell!17731)

(declare-fun mapKey!57595 () (_ BitVec 32))

(declare-fun mapRest!57595 () (Array (_ BitVec 32) ValueCell!17731))

(assert (=> mapNonEmpty!57595 (= (arr!44140 _values!1303) (store mapRest!57595 mapKey!57595 mapValue!57595))))

(declare-fun b!1342820 () Bool)

(declare-fun res!890898 () Bool)

(assert (=> b!1342820 (=> (not res!890898) (not e!764423))))

(assert (=> b!1342820 (= res!890898 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!890901 () Bool)

(assert (=> start!113208 (=> (not res!890901) (not e!764423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113208 (= res!890901 (validMask!0 mask!1977))))

(assert (=> start!113208 e!764423))

(assert (=> start!113208 tp_is_empty!37259))

(assert (=> start!113208 true))

(declare-fun array_inv!33271 (array!91366) Bool)

(assert (=> start!113208 (array_inv!33271 _keys!1571)))

(declare-fun e!764419 () Bool)

(declare-fun array_inv!33272 (array!91368) Bool)

(assert (=> start!113208 (and (array_inv!33272 _values!1303) e!764419)))

(assert (=> start!113208 tp!109582))

(declare-fun b!1342821 () Bool)

(declare-fun res!890900 () Bool)

(assert (=> b!1342821 (=> (not res!890900) (not e!764423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1342821 (= res!890900 (validKeyInArray!0 (select (arr!44139 _keys!1571) from!1960)))))

(declare-fun b!1342822 () Bool)

(declare-fun e!764420 () Bool)

(assert (=> b!1342822 (= e!764420 tp_is_empty!37259)))

(declare-fun b!1342823 () Bool)

(declare-fun res!890895 () Bool)

(assert (=> b!1342823 (=> (not res!890895) (not e!764423))))

(declare-fun getCurrentListMap!5854 (array!91366 array!91368 (_ BitVec 32) (_ BitVec 32) V!54781 V!54781 (_ BitVec 32) Int) ListLongMap!21751)

(assert (=> b!1342823 (= res!890895 (contains!9067 (getCurrentListMap!5854 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1342824 () Bool)

(declare-fun res!890893 () Bool)

(assert (=> b!1342824 (=> (not res!890893) (not e!764423))))

(assert (=> b!1342824 (= res!890893 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44689 _keys!1571)) (not (= k!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1342825 () Bool)

(assert (=> b!1342825 (= e!764419 (and e!764420 mapRes!57595))))

(declare-fun condMapEmpty!57595 () Bool)

(declare-fun mapDefault!57595 () ValueCell!17731)

