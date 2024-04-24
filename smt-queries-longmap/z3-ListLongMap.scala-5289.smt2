; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71090 () Bool)

(assert start!71090)

(declare-fun b_free!13141 () Bool)

(declare-fun b_next!13141 () Bool)

(assert (=> start!71090 (= b_free!13141 (not b_next!13141))))

(declare-fun tp!46174 () Bool)

(declare-fun b_and!22047 () Bool)

(assert (=> start!71090 (= tp!46174 b_and!22047)))

(declare-fun b!824611 () Bool)

(declare-fun e!458751 () Bool)

(assert (=> b!824611 (= e!458751 (not true))))

(declare-datatypes ((V!24803 0))(
  ( (V!24804 (val!7473 Int)) )
))
(declare-datatypes ((tuple2!9800 0))(
  ( (tuple2!9801 (_1!4911 (_ BitVec 64)) (_2!4911 V!24803)) )
))
(declare-datatypes ((List!15586 0))(
  ( (Nil!15583) (Cons!15582 (h!16717 tuple2!9800) (t!21919 List!15586)) )
))
(declare-datatypes ((ListLongMap!8625 0))(
  ( (ListLongMap!8626 (toList!4328 List!15586)) )
))
(declare-fun lt!371856 () ListLongMap!8625)

(declare-fun lt!371855 () ListLongMap!8625)

(assert (=> b!824611 (= lt!371856 lt!371855)))

(declare-fun zeroValueBefore!34 () V!24803)

(declare-datatypes ((array!45897 0))(
  ( (array!45898 (arr!21992 (Array (_ BitVec 32) (_ BitVec 64))) (size!22412 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45897)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24803)

(declare-fun minValue!754 () V!24803)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!7010 0))(
  ( (ValueCellFull!7010 (v!9906 V!24803)) (EmptyCell!7010) )
))
(declare-datatypes ((array!45899 0))(
  ( (array!45900 (arr!21993 (Array (_ BitVec 32) ValueCell!7010)) (size!22413 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45899)

(declare-datatypes ((Unit!28209 0))(
  ( (Unit!28210) )
))
(declare-fun lt!371857 () Unit!28209)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!499 (array!45897 array!45899 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24803 V!24803 V!24803 V!24803 (_ BitVec 32) Int) Unit!28209)

(assert (=> b!824611 (= lt!371857 (lemmaNoChangeToArrayThenSameMapNoExtras!499 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2411 (array!45897 array!45899 (_ BitVec 32) (_ BitVec 32) V!24803 V!24803 (_ BitVec 32) Int) ListLongMap!8625)

(assert (=> b!824611 (= lt!371855 (getCurrentListMapNoExtraKeys!2411 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824611 (= lt!371856 (getCurrentListMapNoExtraKeys!2411 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824612 () Bool)

(declare-fun res!562023 () Bool)

(assert (=> b!824612 (=> (not res!562023) (not e!458751))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45897 (_ BitVec 32)) Bool)

(assert (=> b!824612 (= res!562023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824613 () Bool)

(declare-fun res!562025 () Bool)

(assert (=> b!824613 (=> (not res!562025) (not e!458751))))

(declare-datatypes ((List!15587 0))(
  ( (Nil!15584) (Cons!15583 (h!16718 (_ BitVec 64)) (t!21920 List!15587)) )
))
(declare-fun arrayNoDuplicates!0 (array!45897 (_ BitVec 32) List!15587) Bool)

(assert (=> b!824613 (= res!562025 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15584))))

(declare-fun mapIsEmpty!23893 () Bool)

(declare-fun mapRes!23893 () Bool)

(assert (=> mapIsEmpty!23893 mapRes!23893))

(declare-fun b!824615 () Bool)

(declare-fun e!458749 () Bool)

(declare-fun tp_is_empty!14851 () Bool)

(assert (=> b!824615 (= e!458749 tp_is_empty!14851)))

(declare-fun b!824616 () Bool)

(declare-fun e!458748 () Bool)

(assert (=> b!824616 (= e!458748 tp_is_empty!14851)))

(declare-fun mapNonEmpty!23893 () Bool)

(declare-fun tp!46173 () Bool)

(assert (=> mapNonEmpty!23893 (= mapRes!23893 (and tp!46173 e!458748))))

(declare-fun mapRest!23893 () (Array (_ BitVec 32) ValueCell!7010))

(declare-fun mapValue!23893 () ValueCell!7010)

(declare-fun mapKey!23893 () (_ BitVec 32))

(assert (=> mapNonEmpty!23893 (= (arr!21993 _values!788) (store mapRest!23893 mapKey!23893 mapValue!23893))))

(declare-fun b!824617 () Bool)

(declare-fun e!458747 () Bool)

(assert (=> b!824617 (= e!458747 (and e!458749 mapRes!23893))))

(declare-fun condMapEmpty!23893 () Bool)

(declare-fun mapDefault!23893 () ValueCell!7010)

(assert (=> b!824617 (= condMapEmpty!23893 (= (arr!21993 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7010)) mapDefault!23893)))))

(declare-fun b!824614 () Bool)

(declare-fun res!562024 () Bool)

(assert (=> b!824614 (=> (not res!562024) (not e!458751))))

(assert (=> b!824614 (= res!562024 (and (= (size!22413 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22412 _keys!976) (size!22413 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!562026 () Bool)

(assert (=> start!71090 (=> (not res!562026) (not e!458751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71090 (= res!562026 (validMask!0 mask!1312))))

(assert (=> start!71090 e!458751))

(assert (=> start!71090 tp_is_empty!14851))

(declare-fun array_inv!17589 (array!45897) Bool)

(assert (=> start!71090 (array_inv!17589 _keys!976)))

(assert (=> start!71090 true))

(declare-fun array_inv!17590 (array!45899) Bool)

(assert (=> start!71090 (and (array_inv!17590 _values!788) e!458747)))

(assert (=> start!71090 tp!46174))

(assert (= (and start!71090 res!562026) b!824614))

(assert (= (and b!824614 res!562024) b!824612))

(assert (= (and b!824612 res!562023) b!824613))

(assert (= (and b!824613 res!562025) b!824611))

(assert (= (and b!824617 condMapEmpty!23893) mapIsEmpty!23893))

(assert (= (and b!824617 (not condMapEmpty!23893)) mapNonEmpty!23893))

(get-info :version)

(assert (= (and mapNonEmpty!23893 ((_ is ValueCellFull!7010) mapValue!23893)) b!824616))

(assert (= (and b!824617 ((_ is ValueCellFull!7010) mapDefault!23893)) b!824615))

(assert (= start!71090 b!824617))

(declare-fun m!767201 () Bool)

(assert (=> b!824613 m!767201))

(declare-fun m!767203 () Bool)

(assert (=> mapNonEmpty!23893 m!767203))

(declare-fun m!767205 () Bool)

(assert (=> b!824612 m!767205))

(declare-fun m!767207 () Bool)

(assert (=> start!71090 m!767207))

(declare-fun m!767209 () Bool)

(assert (=> start!71090 m!767209))

(declare-fun m!767211 () Bool)

(assert (=> start!71090 m!767211))

(declare-fun m!767213 () Bool)

(assert (=> b!824611 m!767213))

(declare-fun m!767215 () Bool)

(assert (=> b!824611 m!767215))

(declare-fun m!767217 () Bool)

(assert (=> b!824611 m!767217))

(check-sat b_and!22047 (not b!824613) (not b_next!13141) (not b!824611) (not mapNonEmpty!23893) (not start!71090) (not b!824612) tp_is_empty!14851)
(check-sat b_and!22047 (not b_next!13141))
