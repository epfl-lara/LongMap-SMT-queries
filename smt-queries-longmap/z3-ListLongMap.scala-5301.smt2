; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71012 () Bool)

(assert start!71012)

(declare-fun b_free!13215 () Bool)

(declare-fun b_next!13215 () Bool)

(assert (=> start!71012 (= b_free!13215 (not b_next!13215))))

(declare-fun tp!46398 () Bool)

(declare-fun b_and!22119 () Bool)

(assert (=> start!71012 (= tp!46398 b_and!22119)))

(declare-fun b!824620 () Bool)

(declare-fun res!562197 () Bool)

(declare-fun e!458820 () Bool)

(assert (=> b!824620 (=> (not res!562197) (not e!458820))))

(declare-datatypes ((array!46038 0))(
  ( (array!46039 (arr!22066 (Array (_ BitVec 32) (_ BitVec 64))) (size!22487 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46038)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24901 0))(
  ( (V!24902 (val!7510 Int)) )
))
(declare-datatypes ((ValueCell!7047 0))(
  ( (ValueCellFull!7047 (v!9943 V!24901)) (EmptyCell!7047) )
))
(declare-datatypes ((array!46040 0))(
  ( (array!46041 (arr!22067 (Array (_ BitVec 32) ValueCell!7047)) (size!22488 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46040)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824620 (= res!562197 (and (= (size!22488 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22487 _keys!976) (size!22488 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!24007 () Bool)

(declare-fun mapRes!24007 () Bool)

(assert (=> mapIsEmpty!24007 mapRes!24007))

(declare-fun b!824621 () Bool)

(declare-fun e!458824 () Bool)

(assert (=> b!824621 (= e!458820 (not e!458824))))

(declare-fun res!562195 () Bool)

(assert (=> b!824621 (=> res!562195 e!458824)))

(assert (=> b!824621 (= res!562195 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9940 0))(
  ( (tuple2!9941 (_1!4981 (_ BitVec 64)) (_2!4981 V!24901)) )
))
(declare-datatypes ((List!15750 0))(
  ( (Nil!15747) (Cons!15746 (h!16875 tuple2!9940) (t!22093 List!15750)) )
))
(declare-datatypes ((ListLongMap!8763 0))(
  ( (ListLongMap!8764 (toList!4397 List!15750)) )
))
(declare-fun lt!371918 () ListLongMap!8763)

(declare-fun lt!371915 () ListLongMap!8763)

(assert (=> b!824621 (= lt!371918 lt!371915)))

(declare-fun zeroValueBefore!34 () V!24901)

(declare-fun zeroValueAfter!34 () V!24901)

(declare-fun minValue!754 () V!24901)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28260 0))(
  ( (Unit!28261) )
))
(declare-fun lt!371917 () Unit!28260)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!521 (array!46038 array!46040 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24901 V!24901 V!24901 V!24901 (_ BitVec 32) Int) Unit!28260)

(assert (=> b!824621 (= lt!371917 (lemmaNoChangeToArrayThenSameMapNoExtras!521 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2411 (array!46038 array!46040 (_ BitVec 32) (_ BitVec 32) V!24901 V!24901 (_ BitVec 32) Int) ListLongMap!8763)

(assert (=> b!824621 (= lt!371915 (getCurrentListMapNoExtraKeys!2411 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824621 (= lt!371918 (getCurrentListMapNoExtraKeys!2411 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562196 () Bool)

(assert (=> start!71012 (=> (not res!562196) (not e!458820))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71012 (= res!562196 (validMask!0 mask!1312))))

(assert (=> start!71012 e!458820))

(declare-fun tp_is_empty!14925 () Bool)

(assert (=> start!71012 tp_is_empty!14925))

(declare-fun array_inv!17605 (array!46038) Bool)

(assert (=> start!71012 (array_inv!17605 _keys!976)))

(assert (=> start!71012 true))

(declare-fun e!458825 () Bool)

(declare-fun array_inv!17606 (array!46040) Bool)

(assert (=> start!71012 (and (array_inv!17606 _values!788) e!458825)))

(assert (=> start!71012 tp!46398))

(declare-fun b!824622 () Bool)

(declare-fun e!458822 () Bool)

(assert (=> b!824622 (= e!458822 tp_is_empty!14925)))

(declare-fun b!824623 () Bool)

(assert (=> b!824623 (= e!458825 (and e!458822 mapRes!24007))))

(declare-fun condMapEmpty!24007 () Bool)

(declare-fun mapDefault!24007 () ValueCell!7047)

(assert (=> b!824623 (= condMapEmpty!24007 (= (arr!22067 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7047)) mapDefault!24007)))))

(declare-fun b!824624 () Bool)

(declare-fun res!562193 () Bool)

(assert (=> b!824624 (=> (not res!562193) (not e!458820))))

(declare-datatypes ((List!15751 0))(
  ( (Nil!15748) (Cons!15747 (h!16876 (_ BitVec 64)) (t!22094 List!15751)) )
))
(declare-fun arrayNoDuplicates!0 (array!46038 (_ BitVec 32) List!15751) Bool)

(assert (=> b!824624 (= res!562193 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15748))))

(declare-fun b!824625 () Bool)

(declare-fun res!562194 () Bool)

(assert (=> b!824625 (=> (not res!562194) (not e!458820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46038 (_ BitVec 32)) Bool)

(assert (=> b!824625 (= res!562194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824626 () Bool)

(declare-fun e!458823 () Bool)

(assert (=> b!824626 (= e!458823 tp_is_empty!14925)))

(declare-fun mapNonEmpty!24007 () Bool)

(declare-fun tp!46399 () Bool)

(assert (=> mapNonEmpty!24007 (= mapRes!24007 (and tp!46399 e!458823))))

(declare-fun mapRest!24007 () (Array (_ BitVec 32) ValueCell!7047))

(declare-fun mapKey!24007 () (_ BitVec 32))

(declare-fun mapValue!24007 () ValueCell!7047)

(assert (=> mapNonEmpty!24007 (= (arr!22067 _values!788) (store mapRest!24007 mapKey!24007 mapValue!24007))))

(declare-fun b!824627 () Bool)

(assert (=> b!824627 (= e!458824 true)))

(declare-fun lt!371916 () ListLongMap!8763)

(declare-fun getCurrentListMap!2536 (array!46038 array!46040 (_ BitVec 32) (_ BitVec 32) V!24901 V!24901 (_ BitVec 32) Int) ListLongMap!8763)

(assert (=> b!824627 (= lt!371916 (getCurrentListMap!2536 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71012 res!562196) b!824620))

(assert (= (and b!824620 res!562197) b!824625))

(assert (= (and b!824625 res!562194) b!824624))

(assert (= (and b!824624 res!562193) b!824621))

(assert (= (and b!824621 (not res!562195)) b!824627))

(assert (= (and b!824623 condMapEmpty!24007) mapIsEmpty!24007))

(assert (= (and b!824623 (not condMapEmpty!24007)) mapNonEmpty!24007))

(get-info :version)

(assert (= (and mapNonEmpty!24007 ((_ is ValueCellFull!7047) mapValue!24007)) b!824626))

(assert (= (and b!824623 ((_ is ValueCellFull!7047) mapDefault!24007)) b!824622))

(assert (= start!71012 b!824623))

(declare-fun m!766677 () Bool)

(assert (=> b!824624 m!766677))

(declare-fun m!766679 () Bool)

(assert (=> b!824621 m!766679))

(declare-fun m!766681 () Bool)

(assert (=> b!824621 m!766681))

(declare-fun m!766683 () Bool)

(assert (=> b!824621 m!766683))

(declare-fun m!766685 () Bool)

(assert (=> b!824627 m!766685))

(declare-fun m!766687 () Bool)

(assert (=> b!824625 m!766687))

(declare-fun m!766689 () Bool)

(assert (=> start!71012 m!766689))

(declare-fun m!766691 () Bool)

(assert (=> start!71012 m!766691))

(declare-fun m!766693 () Bool)

(assert (=> start!71012 m!766693))

(declare-fun m!766695 () Bool)

(assert (=> mapNonEmpty!24007 m!766695))

(check-sat (not mapNonEmpty!24007) tp_is_empty!14925 (not b!824621) (not b!824624) (not b!824625) (not start!71012) (not b!824627) (not b_next!13215) b_and!22119)
(check-sat b_and!22119 (not b_next!13215))
