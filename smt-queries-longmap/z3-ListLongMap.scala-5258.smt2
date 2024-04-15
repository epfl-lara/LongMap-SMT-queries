; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70648 () Bool)

(assert start!70648)

(declare-fun b_free!12955 () Bool)

(declare-fun b_next!12955 () Bool)

(assert (=> start!70648 (= b_free!12955 (not b_next!12955))))

(declare-fun tp!45603 () Bool)

(declare-fun b_and!21783 () Bool)

(assert (=> start!70648 (= tp!45603 b_and!21783)))

(declare-fun mapIsEmpty!23602 () Bool)

(declare-fun mapRes!23602 () Bool)

(assert (=> mapIsEmpty!23602 mapRes!23602))

(declare-fun b!820662 () Bool)

(declare-fun e!455989 () Bool)

(declare-fun tp_is_empty!14665 () Bool)

(assert (=> b!820662 (= e!455989 tp_is_empty!14665)))

(declare-fun b!820663 () Bool)

(declare-fun res!559949 () Bool)

(declare-fun e!455991 () Bool)

(assert (=> b!820663 (=> (not res!559949) (not e!455991))))

(declare-datatypes ((array!45497 0))(
  ( (array!45498 (arr!21801 (Array (_ BitVec 32) (_ BitVec 64))) (size!22222 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45497)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45497 (_ BitVec 32)) Bool)

(assert (=> b!820663 (= res!559949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820664 () Bool)

(declare-fun e!455988 () Bool)

(assert (=> b!820664 (= e!455988 tp_is_empty!14665)))

(declare-fun b!820665 () Bool)

(declare-fun res!559948 () Bool)

(assert (=> b!820665 (=> (not res!559948) (not e!455991))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24555 0))(
  ( (V!24556 (val!7380 Int)) )
))
(declare-datatypes ((ValueCell!6917 0))(
  ( (ValueCellFull!6917 (v!9805 V!24555)) (EmptyCell!6917) )
))
(declare-datatypes ((array!45499 0))(
  ( (array!45500 (arr!21802 (Array (_ BitVec 32) ValueCell!6917)) (size!22223 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45499)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!820665 (= res!559948 (and (= (size!22223 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22222 _keys!976) (size!22223 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820666 () Bool)

(assert (=> b!820666 (= e!455991 (not true))))

(declare-datatypes ((tuple2!9740 0))(
  ( (tuple2!9741 (_1!4881 (_ BitVec 64)) (_2!4881 V!24555)) )
))
(declare-datatypes ((List!15553 0))(
  ( (Nil!15550) (Cons!15549 (h!16678 tuple2!9740) (t!21877 List!15553)) )
))
(declare-datatypes ((ListLongMap!8553 0))(
  ( (ListLongMap!8554 (toList!4292 List!15553)) )
))
(declare-fun lt!368723 () ListLongMap!8553)

(declare-fun lt!368724 () ListLongMap!8553)

(assert (=> b!820666 (= lt!368723 lt!368724)))

(declare-fun zeroValueBefore!34 () V!24555)

(declare-fun zeroValueAfter!34 () V!24555)

(declare-fun minValue!754 () V!24555)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28013 0))(
  ( (Unit!28014) )
))
(declare-fun lt!368725 () Unit!28013)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!437 (array!45497 array!45499 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24555 V!24555 V!24555 V!24555 (_ BitVec 32) Int) Unit!28013)

(assert (=> b!820666 (= lt!368725 (lemmaNoChangeToArrayThenSameMapNoExtras!437 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2344 (array!45497 array!45499 (_ BitVec 32) (_ BitVec 32) V!24555 V!24555 (_ BitVec 32) Int) ListLongMap!8553)

(assert (=> b!820666 (= lt!368724 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820666 (= lt!368723 (getCurrentListMapNoExtraKeys!2344 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820667 () Bool)

(declare-fun e!455990 () Bool)

(assert (=> b!820667 (= e!455990 (and e!455989 mapRes!23602))))

(declare-fun condMapEmpty!23602 () Bool)

(declare-fun mapDefault!23602 () ValueCell!6917)

(assert (=> b!820667 (= condMapEmpty!23602 (= (arr!21802 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6917)) mapDefault!23602)))))

(declare-fun b!820668 () Bool)

(declare-fun res!559950 () Bool)

(assert (=> b!820668 (=> (not res!559950) (not e!455991))))

(declare-datatypes ((List!15554 0))(
  ( (Nil!15551) (Cons!15550 (h!16679 (_ BitVec 64)) (t!21878 List!15554)) )
))
(declare-fun arrayNoDuplicates!0 (array!45497 (_ BitVec 32) List!15554) Bool)

(assert (=> b!820668 (= res!559950 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15551))))

(declare-fun mapNonEmpty!23602 () Bool)

(declare-fun tp!45604 () Bool)

(assert (=> mapNonEmpty!23602 (= mapRes!23602 (and tp!45604 e!455988))))

(declare-fun mapValue!23602 () ValueCell!6917)

(declare-fun mapRest!23602 () (Array (_ BitVec 32) ValueCell!6917))

(declare-fun mapKey!23602 () (_ BitVec 32))

(assert (=> mapNonEmpty!23602 (= (arr!21802 _values!788) (store mapRest!23602 mapKey!23602 mapValue!23602))))

(declare-fun res!559947 () Bool)

(assert (=> start!70648 (=> (not res!559947) (not e!455991))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70648 (= res!559947 (validMask!0 mask!1312))))

(assert (=> start!70648 e!455991))

(assert (=> start!70648 tp_is_empty!14665))

(declare-fun array_inv!17489 (array!45497) Bool)

(assert (=> start!70648 (array_inv!17489 _keys!976)))

(assert (=> start!70648 true))

(declare-fun array_inv!17490 (array!45499) Bool)

(assert (=> start!70648 (and (array_inv!17490 _values!788) e!455990)))

(assert (=> start!70648 tp!45603))

(assert (= (and start!70648 res!559947) b!820665))

(assert (= (and b!820665 res!559948) b!820663))

(assert (= (and b!820663 res!559949) b!820668))

(assert (= (and b!820668 res!559950) b!820666))

(assert (= (and b!820667 condMapEmpty!23602) mapIsEmpty!23602))

(assert (= (and b!820667 (not condMapEmpty!23602)) mapNonEmpty!23602))

(get-info :version)

(assert (= (and mapNonEmpty!23602 ((_ is ValueCellFull!6917) mapValue!23602)) b!820664))

(assert (= (and b!820667 ((_ is ValueCellFull!6917) mapDefault!23602)) b!820662))

(assert (= start!70648 b!820667))

(declare-fun m!762043 () Bool)

(assert (=> b!820666 m!762043))

(declare-fun m!762045 () Bool)

(assert (=> b!820666 m!762045))

(declare-fun m!762047 () Bool)

(assert (=> b!820666 m!762047))

(declare-fun m!762049 () Bool)

(assert (=> start!70648 m!762049))

(declare-fun m!762051 () Bool)

(assert (=> start!70648 m!762051))

(declare-fun m!762053 () Bool)

(assert (=> start!70648 m!762053))

(declare-fun m!762055 () Bool)

(assert (=> mapNonEmpty!23602 m!762055))

(declare-fun m!762057 () Bool)

(assert (=> b!820663 m!762057))

(declare-fun m!762059 () Bool)

(assert (=> b!820668 m!762059))

(check-sat (not start!70648) tp_is_empty!14665 (not b!820668) (not b!820663) (not mapNonEmpty!23602) b_and!21783 (not b_next!12955) (not b!820666))
(check-sat b_and!21783 (not b_next!12955))
