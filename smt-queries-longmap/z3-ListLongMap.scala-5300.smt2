; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71006 () Bool)

(assert start!71006)

(declare-fun b_free!13209 () Bool)

(declare-fun b_next!13209 () Bool)

(assert (=> start!71006 (= b_free!13209 (not b_next!13209))))

(declare-fun tp!46381 () Bool)

(declare-fun b_and!22113 () Bool)

(assert (=> start!71006 (= tp!46381 b_and!22113)))

(declare-fun res!562150 () Bool)

(declare-fun e!458766 () Bool)

(assert (=> start!71006 (=> (not res!562150) (not e!458766))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71006 (= res!562150 (validMask!0 mask!1312))))

(assert (=> start!71006 e!458766))

(declare-fun tp_is_empty!14919 () Bool)

(assert (=> start!71006 tp_is_empty!14919))

(declare-datatypes ((array!46026 0))(
  ( (array!46027 (arr!22060 (Array (_ BitVec 32) (_ BitVec 64))) (size!22481 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46026)

(declare-fun array_inv!17599 (array!46026) Bool)

(assert (=> start!71006 (array_inv!17599 _keys!976)))

(assert (=> start!71006 true))

(declare-datatypes ((V!24893 0))(
  ( (V!24894 (val!7507 Int)) )
))
(declare-datatypes ((ValueCell!7044 0))(
  ( (ValueCellFull!7044 (v!9940 V!24893)) (EmptyCell!7044) )
))
(declare-datatypes ((array!46028 0))(
  ( (array!46029 (arr!22061 (Array (_ BitVec 32) ValueCell!7044)) (size!22482 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46028)

(declare-fun e!458769 () Bool)

(declare-fun array_inv!17600 (array!46028) Bool)

(assert (=> start!71006 (and (array_inv!17600 _values!788) e!458769)))

(assert (=> start!71006 tp!46381))

(declare-fun b!824548 () Bool)

(declare-fun res!562152 () Bool)

(assert (=> b!824548 (=> (not res!562152) (not e!458766))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!824548 (= res!562152 (and (= (size!22482 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22481 _keys!976) (size!22482 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824549 () Bool)

(declare-fun res!562148 () Bool)

(assert (=> b!824549 (=> (not res!562148) (not e!458766))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46026 (_ BitVec 32)) Bool)

(assert (=> b!824549 (= res!562148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824550 () Bool)

(declare-fun e!458770 () Bool)

(assert (=> b!824550 (= e!458770 true)))

(declare-fun zeroValueBefore!34 () V!24893)

(declare-datatypes ((tuple2!9936 0))(
  ( (tuple2!9937 (_1!4979 (_ BitVec 64)) (_2!4979 V!24893)) )
))
(declare-datatypes ((List!15746 0))(
  ( (Nil!15743) (Cons!15742 (h!16871 tuple2!9936) (t!22089 List!15746)) )
))
(declare-datatypes ((ListLongMap!8759 0))(
  ( (ListLongMap!8760 (toList!4395 List!15746)) )
))
(declare-fun lt!371882 () ListLongMap!8759)

(declare-fun minValue!754 () V!24893)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2534 (array!46026 array!46028 (_ BitVec 32) (_ BitVec 32) V!24893 V!24893 (_ BitVec 32) Int) ListLongMap!8759)

(assert (=> b!824550 (= lt!371882 (getCurrentListMap!2534 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824551 () Bool)

(assert (=> b!824551 (= e!458766 (not e!458770))))

(declare-fun res!562149 () Bool)

(assert (=> b!824551 (=> res!562149 e!458770)))

(assert (=> b!824551 (= res!562149 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!371879 () ListLongMap!8759)

(declare-fun lt!371881 () ListLongMap!8759)

(assert (=> b!824551 (= lt!371879 lt!371881)))

(declare-fun zeroValueAfter!34 () V!24893)

(declare-datatypes ((Unit!28258 0))(
  ( (Unit!28259) )
))
(declare-fun lt!371880 () Unit!28258)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!520 (array!46026 array!46028 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24893 V!24893 V!24893 V!24893 (_ BitVec 32) Int) Unit!28258)

(assert (=> b!824551 (= lt!371880 (lemmaNoChangeToArrayThenSameMapNoExtras!520 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2410 (array!46026 array!46028 (_ BitVec 32) (_ BitVec 32) V!24893 V!24893 (_ BitVec 32) Int) ListLongMap!8759)

(assert (=> b!824551 (= lt!371881 (getCurrentListMapNoExtraKeys!2410 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824551 (= lt!371879 (getCurrentListMapNoExtraKeys!2410 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824552 () Bool)

(declare-fun e!458767 () Bool)

(declare-fun mapRes!23998 () Bool)

(assert (=> b!824552 (= e!458769 (and e!458767 mapRes!23998))))

(declare-fun condMapEmpty!23998 () Bool)

(declare-fun mapDefault!23998 () ValueCell!7044)

(assert (=> b!824552 (= condMapEmpty!23998 (= (arr!22061 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7044)) mapDefault!23998)))))

(declare-fun b!824553 () Bool)

(declare-fun res!562151 () Bool)

(assert (=> b!824553 (=> (not res!562151) (not e!458766))))

(declare-datatypes ((List!15747 0))(
  ( (Nil!15744) (Cons!15743 (h!16872 (_ BitVec 64)) (t!22090 List!15747)) )
))
(declare-fun arrayNoDuplicates!0 (array!46026 (_ BitVec 32) List!15747) Bool)

(assert (=> b!824553 (= res!562151 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15744))))

(declare-fun mapIsEmpty!23998 () Bool)

(assert (=> mapIsEmpty!23998 mapRes!23998))

(declare-fun b!824554 () Bool)

(declare-fun e!458768 () Bool)

(assert (=> b!824554 (= e!458768 tp_is_empty!14919)))

(declare-fun b!824555 () Bool)

(assert (=> b!824555 (= e!458767 tp_is_empty!14919)))

(declare-fun mapNonEmpty!23998 () Bool)

(declare-fun tp!46380 () Bool)

(assert (=> mapNonEmpty!23998 (= mapRes!23998 (and tp!46380 e!458768))))

(declare-fun mapValue!23998 () ValueCell!7044)

(declare-fun mapRest!23998 () (Array (_ BitVec 32) ValueCell!7044))

(declare-fun mapKey!23998 () (_ BitVec 32))

(assert (=> mapNonEmpty!23998 (= (arr!22061 _values!788) (store mapRest!23998 mapKey!23998 mapValue!23998))))

(assert (= (and start!71006 res!562150) b!824548))

(assert (= (and b!824548 res!562152) b!824549))

(assert (= (and b!824549 res!562148) b!824553))

(assert (= (and b!824553 res!562151) b!824551))

(assert (= (and b!824551 (not res!562149)) b!824550))

(assert (= (and b!824552 condMapEmpty!23998) mapIsEmpty!23998))

(assert (= (and b!824552 (not condMapEmpty!23998)) mapNonEmpty!23998))

(get-info :version)

(assert (= (and mapNonEmpty!23998 ((_ is ValueCellFull!7044) mapValue!23998)) b!824554))

(assert (= (and b!824552 ((_ is ValueCellFull!7044) mapDefault!23998)) b!824555))

(assert (= start!71006 b!824552))

(declare-fun m!766617 () Bool)

(assert (=> b!824550 m!766617))

(declare-fun m!766619 () Bool)

(assert (=> start!71006 m!766619))

(declare-fun m!766621 () Bool)

(assert (=> start!71006 m!766621))

(declare-fun m!766623 () Bool)

(assert (=> start!71006 m!766623))

(declare-fun m!766625 () Bool)

(assert (=> b!824551 m!766625))

(declare-fun m!766627 () Bool)

(assert (=> b!824551 m!766627))

(declare-fun m!766629 () Bool)

(assert (=> b!824551 m!766629))

(declare-fun m!766631 () Bool)

(assert (=> b!824549 m!766631))

(declare-fun m!766633 () Bool)

(assert (=> b!824553 m!766633))

(declare-fun m!766635 () Bool)

(assert (=> mapNonEmpty!23998 m!766635))

(check-sat (not b_next!13209) (not b!824549) (not b!824550) b_and!22113 (not mapNonEmpty!23998) (not start!71006) (not b!824551) tp_is_empty!14919 (not b!824553))
(check-sat b_and!22113 (not b_next!13209))
