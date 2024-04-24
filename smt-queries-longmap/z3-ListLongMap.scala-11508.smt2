; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134344 () Bool)

(assert start!134344)

(declare-fun b_free!32155 () Bool)

(declare-fun b_next!32155 () Bool)

(assert (=> start!134344 (= b_free!32155 (not b_next!32155))))

(declare-fun tp!113766 () Bool)

(declare-fun b_and!51753 () Bool)

(assert (=> start!134344 (= tp!113766 b_and!51753)))

(declare-fun b!1568044 () Bool)

(declare-fun res!1071069 () Bool)

(declare-fun e!874164 () Bool)

(assert (=> b!1568044 (=> (not res!1071069) (not e!874164))))

(declare-datatypes ((array!104668 0))(
  ( (array!104669 (arr!50514 (Array (_ BitVec 32) (_ BitVec 64))) (size!51065 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104668)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104668 (_ BitVec 32)) Bool)

(assert (=> b!1568044 (= res!1071069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1568045 () Bool)

(declare-fun e!874165 () Bool)

(declare-fun tp_is_empty!38929 () Bool)

(assert (=> b!1568045 (= e!874165 tp_is_empty!38929)))

(declare-fun b!1568046 () Bool)

(declare-fun res!1071065 () Bool)

(assert (=> b!1568046 (=> (not res!1071065) (not e!874164))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1568046 (= res!1071065 (validKeyInArray!0 (select (arr!50514 _keys!637) from!782)))))

(declare-fun mapIsEmpty!59785 () Bool)

(declare-fun mapRes!59785 () Bool)

(assert (=> mapIsEmpty!59785 mapRes!59785))

(declare-fun b!1568047 () Bool)

(declare-fun res!1071068 () Bool)

(assert (=> b!1568047 (=> (not res!1071068) (not e!874164))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60113 0))(
  ( (V!60114 (val!19548 Int)) )
))
(declare-datatypes ((ValueCell!18434 0))(
  ( (ValueCellFull!18434 (v!22296 V!60113)) (EmptyCell!18434) )
))
(declare-datatypes ((array!104670 0))(
  ( (array!104671 (arr!50515 (Array (_ BitVec 32) ValueCell!18434)) (size!51066 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104670)

(assert (=> b!1568047 (= res!1071068 (and (= (size!51066 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51065 _keys!637) (size!51066 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1071067 () Bool)

(assert (=> start!134344 (=> (not res!1071067) (not e!874164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134344 (= res!1071067 (validMask!0 mask!947))))

(assert (=> start!134344 e!874164))

(assert (=> start!134344 tp!113766))

(assert (=> start!134344 tp_is_empty!38929))

(assert (=> start!134344 true))

(declare-fun array_inv!39495 (array!104668) Bool)

(assert (=> start!134344 (array_inv!39495 _keys!637)))

(declare-fun e!874162 () Bool)

(declare-fun array_inv!39496 (array!104670) Bool)

(assert (=> start!134344 (and (array_inv!39496 _values!487) e!874162)))

(declare-fun b!1568048 () Bool)

(declare-fun e!874163 () Bool)

(assert (=> b!1568048 (= e!874163 tp_is_empty!38929)))

(declare-fun b!1568049 () Bool)

(declare-fun res!1071066 () Bool)

(assert (=> b!1568049 (=> (not res!1071066) (not e!874164))))

(declare-datatypes ((List!36639 0))(
  ( (Nil!36636) (Cons!36635 (h!38099 (_ BitVec 64)) (t!51500 List!36639)) )
))
(declare-fun arrayNoDuplicates!0 (array!104668 (_ BitVec 32) List!36639) Bool)

(assert (=> b!1568049 (= res!1071066 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36636))))

(declare-fun b!1568050 () Bool)

(declare-fun res!1071064 () Bool)

(assert (=> b!1568050 (=> (not res!1071064) (not e!874164))))

(assert (=> b!1568050 (= res!1071064 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51065 _keys!637)) (bvslt from!782 (size!51065 _keys!637))))))

(declare-fun b!1568051 () Bool)

(assert (=> b!1568051 (= e!874162 (and e!874165 mapRes!59785))))

(declare-fun condMapEmpty!59785 () Bool)

(declare-fun mapDefault!59785 () ValueCell!18434)

(assert (=> b!1568051 (= condMapEmpty!59785 (= (arr!50515 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18434)) mapDefault!59785)))))

(declare-fun b!1568052 () Bool)

(assert (=> b!1568052 (= e!874164 (not true))))

(declare-fun lt!673236 () Bool)

(declare-datatypes ((tuple2!25274 0))(
  ( (tuple2!25275 (_1!12648 (_ BitVec 64)) (_2!12648 V!60113)) )
))
(declare-datatypes ((List!36640 0))(
  ( (Nil!36637) (Cons!36636 (h!38100 tuple2!25274) (t!51501 List!36640)) )
))
(declare-datatypes ((ListLongMap!22717 0))(
  ( (ListLongMap!22718 (toList!11374 List!36640)) )
))
(declare-fun lt!673235 () ListLongMap!22717)

(declare-fun contains!10377 (ListLongMap!22717 (_ BitVec 64)) Bool)

(assert (=> b!1568052 (= lt!673236 (contains!10377 lt!673235 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1568052 (not (contains!10377 lt!673235 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!673234 () ListLongMap!22717)

(declare-fun lt!673233 () V!60113)

(declare-fun +!5112 (ListLongMap!22717 tuple2!25274) ListLongMap!22717)

(assert (=> b!1568052 (= lt!673235 (+!5112 lt!673234 (tuple2!25275 (select (arr!50514 _keys!637) from!782) lt!673233)))))

(declare-datatypes ((Unit!51919 0))(
  ( (Unit!51920) )
))
(declare-fun lt!673237 () Unit!51919)

(declare-fun addStillNotContains!563 (ListLongMap!22717 (_ BitVec 64) V!60113 (_ BitVec 64)) Unit!51919)

(assert (=> b!1568052 (= lt!673237 (addStillNotContains!563 lt!673234 (select (arr!50514 _keys!637) from!782) lt!673233 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26380 (ValueCell!18434 V!60113) V!60113)

(declare-fun dynLambda!3910 (Int (_ BitVec 64)) V!60113)

(assert (=> b!1568052 (= lt!673233 (get!26380 (select (arr!50515 _values!487) from!782) (dynLambda!3910 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60113)

(declare-fun minValue!453 () V!60113)

(declare-fun getCurrentListMapNoExtraKeys!6757 (array!104668 array!104670 (_ BitVec 32) (_ BitVec 32) V!60113 V!60113 (_ BitVec 32) Int) ListLongMap!22717)

(assert (=> b!1568052 (= lt!673234 (getCurrentListMapNoExtraKeys!6757 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59785 () Bool)

(declare-fun tp!113767 () Bool)

(assert (=> mapNonEmpty!59785 (= mapRes!59785 (and tp!113767 e!874163))))

(declare-fun mapValue!59785 () ValueCell!18434)

(declare-fun mapKey!59785 () (_ BitVec 32))

(declare-fun mapRest!59785 () (Array (_ BitVec 32) ValueCell!18434))

(assert (=> mapNonEmpty!59785 (= (arr!50515 _values!487) (store mapRest!59785 mapKey!59785 mapValue!59785))))

(assert (= (and start!134344 res!1071067) b!1568047))

(assert (= (and b!1568047 res!1071068) b!1568044))

(assert (= (and b!1568044 res!1071069) b!1568049))

(assert (= (and b!1568049 res!1071066) b!1568050))

(assert (= (and b!1568050 res!1071064) b!1568046))

(assert (= (and b!1568046 res!1071065) b!1568052))

(assert (= (and b!1568051 condMapEmpty!59785) mapIsEmpty!59785))

(assert (= (and b!1568051 (not condMapEmpty!59785)) mapNonEmpty!59785))

(get-info :version)

(assert (= (and mapNonEmpty!59785 ((_ is ValueCellFull!18434) mapValue!59785)) b!1568048))

(assert (= (and b!1568051 ((_ is ValueCellFull!18434) mapDefault!59785)) b!1568045))

(assert (= start!134344 b!1568051))

(declare-fun b_lambda!24963 () Bool)

(assert (=> (not b_lambda!24963) (not b!1568052)))

(declare-fun t!51499 () Bool)

(declare-fun tb!12615 () Bool)

(assert (=> (and start!134344 (= defaultEntry!495 defaultEntry!495) t!51499) tb!12615))

(declare-fun result!26529 () Bool)

(assert (=> tb!12615 (= result!26529 tp_is_empty!38929)))

(assert (=> b!1568052 t!51499))

(declare-fun b_and!51755 () Bool)

(assert (= b_and!51753 (and (=> t!51499 result!26529) b_and!51755)))

(declare-fun m!1442773 () Bool)

(assert (=> mapNonEmpty!59785 m!1442773))

(declare-fun m!1442775 () Bool)

(assert (=> b!1568052 m!1442775))

(declare-fun m!1442777 () Bool)

(assert (=> b!1568052 m!1442777))

(declare-fun m!1442779 () Bool)

(assert (=> b!1568052 m!1442779))

(declare-fun m!1442781 () Bool)

(assert (=> b!1568052 m!1442781))

(declare-fun m!1442783 () Bool)

(assert (=> b!1568052 m!1442783))

(declare-fun m!1442785 () Bool)

(assert (=> b!1568052 m!1442785))

(assert (=> b!1568052 m!1442777))

(declare-fun m!1442787 () Bool)

(assert (=> b!1568052 m!1442787))

(assert (=> b!1568052 m!1442781))

(declare-fun m!1442789 () Bool)

(assert (=> b!1568052 m!1442789))

(assert (=> b!1568052 m!1442775))

(declare-fun m!1442791 () Bool)

(assert (=> b!1568052 m!1442791))

(declare-fun m!1442793 () Bool)

(assert (=> start!134344 m!1442793))

(declare-fun m!1442795 () Bool)

(assert (=> start!134344 m!1442795))

(declare-fun m!1442797 () Bool)

(assert (=> start!134344 m!1442797))

(declare-fun m!1442799 () Bool)

(assert (=> b!1568044 m!1442799))

(declare-fun m!1442801 () Bool)

(assert (=> b!1568049 m!1442801))

(assert (=> b!1568046 m!1442781))

(assert (=> b!1568046 m!1442781))

(declare-fun m!1442803 () Bool)

(assert (=> b!1568046 m!1442803))

(check-sat (not b_lambda!24963) (not b!1568044) (not b!1568046) (not b!1568049) (not b!1568052) (not mapNonEmpty!59785) b_and!51755 (not b_next!32155) tp_is_empty!38929 (not start!134344))
(check-sat b_and!51755 (not b_next!32155))
