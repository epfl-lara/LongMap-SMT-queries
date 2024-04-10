; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108410 () Bool)

(assert start!108410)

(declare-fun b_free!27957 () Bool)

(declare-fun b_next!27957 () Bool)

(assert (=> start!108410 (= b_free!27957 (not b_next!27957))))

(declare-fun tp!98980 () Bool)

(declare-fun b_and!46017 () Bool)

(assert (=> start!108410 (= tp!98980 b_and!46017)))

(declare-fun b!1279488 () Bool)

(declare-fun res!849941 () Bool)

(declare-fun e!731042 () Bool)

(assert (=> b!1279488 (=> (not res!849941) (not e!731042))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84280 0))(
  ( (array!84281 (arr!40644 (Array (_ BitVec 32) (_ BitVec 64))) (size!41194 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84280)

(assert (=> b!1279488 (= res!849941 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41194 _keys!1741))))))

(declare-fun b!1279489 () Bool)

(assert (=> b!1279489 (= e!731042 false)))

(declare-datatypes ((V!49899 0))(
  ( (V!49900 (val!16873 Int)) )
))
(declare-fun minValue!1387 () V!49899)

(declare-fun zeroValue!1387 () V!49899)

(declare-fun lt!576017 () Bool)

(declare-datatypes ((ValueCell!15900 0))(
  ( (ValueCellFull!15900 (v!19473 V!49899)) (EmptyCell!15900) )
))
(declare-datatypes ((array!84282 0))(
  ( (array!84283 (arr!40645 (Array (_ BitVec 32) ValueCell!15900)) (size!41195 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84282)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21588 0))(
  ( (tuple2!21589 (_1!10805 (_ BitVec 64)) (_2!10805 V!49899)) )
))
(declare-datatypes ((List!28787 0))(
  ( (Nil!28784) (Cons!28783 (h!29992 tuple2!21588) (t!42327 List!28787)) )
))
(declare-datatypes ((ListLongMap!19245 0))(
  ( (ListLongMap!19246 (toList!9638 List!28787)) )
))
(declare-fun contains!7753 (ListLongMap!19245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4722 (array!84280 array!84282 (_ BitVec 32) (_ BitVec 32) V!49899 V!49899 (_ BitVec 32) Int) ListLongMap!19245)

(assert (=> b!1279489 (= lt!576017 (contains!7753 (getCurrentListMap!4722 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1279490 () Bool)

(declare-fun e!731045 () Bool)

(declare-fun tp_is_empty!33597 () Bool)

(assert (=> b!1279490 (= e!731045 tp_is_empty!33597)))

(declare-fun b!1279491 () Bool)

(declare-fun res!849940 () Bool)

(assert (=> b!1279491 (=> (not res!849940) (not e!731042))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84280 (_ BitVec 32)) Bool)

(assert (=> b!1279491 (= res!849940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279492 () Bool)

(declare-fun res!849939 () Bool)

(assert (=> b!1279492 (=> (not res!849939) (not e!731042))))

(assert (=> b!1279492 (= res!849939 (and (= (size!41195 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41194 _keys!1741) (size!41195 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51947 () Bool)

(declare-fun mapRes!51947 () Bool)

(assert (=> mapIsEmpty!51947 mapRes!51947))

(declare-fun b!1279493 () Bool)

(declare-fun e!731041 () Bool)

(assert (=> b!1279493 (= e!731041 tp_is_empty!33597)))

(declare-fun b!1279494 () Bool)

(declare-fun e!731044 () Bool)

(assert (=> b!1279494 (= e!731044 (and e!731041 mapRes!51947))))

(declare-fun condMapEmpty!51947 () Bool)

(declare-fun mapDefault!51947 () ValueCell!15900)

(assert (=> b!1279494 (= condMapEmpty!51947 (= (arr!40645 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15900)) mapDefault!51947)))))

(declare-fun mapNonEmpty!51947 () Bool)

(declare-fun tp!98981 () Bool)

(assert (=> mapNonEmpty!51947 (= mapRes!51947 (and tp!98981 e!731045))))

(declare-fun mapValue!51947 () ValueCell!15900)

(declare-fun mapKey!51947 () (_ BitVec 32))

(declare-fun mapRest!51947 () (Array (_ BitVec 32) ValueCell!15900))

(assert (=> mapNonEmpty!51947 (= (arr!40645 _values!1445) (store mapRest!51947 mapKey!51947 mapValue!51947))))

(declare-fun res!849938 () Bool)

(assert (=> start!108410 (=> (not res!849938) (not e!731042))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108410 (= res!849938 (validMask!0 mask!2175))))

(assert (=> start!108410 e!731042))

(assert (=> start!108410 tp_is_empty!33597))

(assert (=> start!108410 true))

(declare-fun array_inv!30855 (array!84282) Bool)

(assert (=> start!108410 (and (array_inv!30855 _values!1445) e!731044)))

(declare-fun array_inv!30856 (array!84280) Bool)

(assert (=> start!108410 (array_inv!30856 _keys!1741)))

(assert (=> start!108410 tp!98980))

(declare-fun b!1279495 () Bool)

(declare-fun res!849937 () Bool)

(assert (=> b!1279495 (=> (not res!849937) (not e!731042))))

(declare-datatypes ((List!28788 0))(
  ( (Nil!28785) (Cons!28784 (h!29993 (_ BitVec 64)) (t!42328 List!28788)) )
))
(declare-fun arrayNoDuplicates!0 (array!84280 (_ BitVec 32) List!28788) Bool)

(assert (=> b!1279495 (= res!849937 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28785))))

(assert (= (and start!108410 res!849938) b!1279492))

(assert (= (and b!1279492 res!849939) b!1279491))

(assert (= (and b!1279491 res!849940) b!1279495))

(assert (= (and b!1279495 res!849937) b!1279488))

(assert (= (and b!1279488 res!849941) b!1279489))

(assert (= (and b!1279494 condMapEmpty!51947) mapIsEmpty!51947))

(assert (= (and b!1279494 (not condMapEmpty!51947)) mapNonEmpty!51947))

(get-info :version)

(assert (= (and mapNonEmpty!51947 ((_ is ValueCellFull!15900) mapValue!51947)) b!1279490))

(assert (= (and b!1279494 ((_ is ValueCellFull!15900) mapDefault!51947)) b!1279493))

(assert (= start!108410 b!1279494))

(declare-fun m!1174437 () Bool)

(assert (=> start!108410 m!1174437))

(declare-fun m!1174439 () Bool)

(assert (=> start!108410 m!1174439))

(declare-fun m!1174441 () Bool)

(assert (=> start!108410 m!1174441))

(declare-fun m!1174443 () Bool)

(assert (=> b!1279489 m!1174443))

(assert (=> b!1279489 m!1174443))

(declare-fun m!1174445 () Bool)

(assert (=> b!1279489 m!1174445))

(declare-fun m!1174447 () Bool)

(assert (=> mapNonEmpty!51947 m!1174447))

(declare-fun m!1174449 () Bool)

(assert (=> b!1279495 m!1174449))

(declare-fun m!1174451 () Bool)

(assert (=> b!1279491 m!1174451))

(check-sat (not start!108410) (not b!1279489) (not b!1279495) tp_is_empty!33597 (not mapNonEmpty!51947) (not b!1279491) b_and!46017 (not b_next!27957))
(check-sat b_and!46017 (not b_next!27957))
