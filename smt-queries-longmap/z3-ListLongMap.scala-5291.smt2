; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71102 () Bool)

(assert start!71102)

(declare-fun b_free!13153 () Bool)

(declare-fun b_next!13153 () Bool)

(assert (=> start!71102 (= b_free!13153 (not b_next!13153))))

(declare-fun tp!46209 () Bool)

(declare-fun b_and!22059 () Bool)

(assert (=> start!71102 (= tp!46209 b_and!22059)))

(declare-fun res!562097 () Bool)

(declare-fun e!458839 () Bool)

(assert (=> start!71102 (=> (not res!562097) (not e!458839))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71102 (= res!562097 (validMask!0 mask!1312))))

(assert (=> start!71102 e!458839))

(declare-fun tp_is_empty!14863 () Bool)

(assert (=> start!71102 tp_is_empty!14863))

(declare-datatypes ((array!45919 0))(
  ( (array!45920 (arr!22003 (Array (_ BitVec 32) (_ BitVec 64))) (size!22423 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45919)

(declare-fun array_inv!17599 (array!45919) Bool)

(assert (=> start!71102 (array_inv!17599 _keys!976)))

(assert (=> start!71102 true))

(declare-datatypes ((V!24819 0))(
  ( (V!24820 (val!7479 Int)) )
))
(declare-datatypes ((ValueCell!7016 0))(
  ( (ValueCellFull!7016 (v!9912 V!24819)) (EmptyCell!7016) )
))
(declare-datatypes ((array!45921 0))(
  ( (array!45922 (arr!22004 (Array (_ BitVec 32) ValueCell!7016)) (size!22424 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45921)

(declare-fun e!458841 () Bool)

(declare-fun array_inv!17600 (array!45921) Bool)

(assert (=> start!71102 (and (array_inv!17600 _values!788) e!458841)))

(assert (=> start!71102 tp!46209))

(declare-fun b!824737 () Bool)

(assert (=> b!824737 (= e!458839 (not true))))

(declare-datatypes ((tuple2!9808 0))(
  ( (tuple2!9809 (_1!4915 (_ BitVec 64)) (_2!4915 V!24819)) )
))
(declare-datatypes ((List!15594 0))(
  ( (Nil!15591) (Cons!15590 (h!16725 tuple2!9808) (t!21927 List!15594)) )
))
(declare-datatypes ((ListLongMap!8633 0))(
  ( (ListLongMap!8634 (toList!4332 List!15594)) )
))
(declare-fun lt!371910 () ListLongMap!8633)

(declare-fun lt!371909 () ListLongMap!8633)

(assert (=> b!824737 (= lt!371910 lt!371909)))

(declare-fun zeroValueBefore!34 () V!24819)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24819)

(declare-fun minValue!754 () V!24819)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28217 0))(
  ( (Unit!28218) )
))
(declare-fun lt!371911 () Unit!28217)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!503 (array!45919 array!45921 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24819 V!24819 V!24819 V!24819 (_ BitVec 32) Int) Unit!28217)

(assert (=> b!824737 (= lt!371911 (lemmaNoChangeToArrayThenSameMapNoExtras!503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2415 (array!45919 array!45921 (_ BitVec 32) (_ BitVec 32) V!24819 V!24819 (_ BitVec 32) Int) ListLongMap!8633)

(assert (=> b!824737 (= lt!371909 (getCurrentListMapNoExtraKeys!2415 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824737 (= lt!371910 (getCurrentListMapNoExtraKeys!2415 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824738 () Bool)

(declare-fun e!458838 () Bool)

(assert (=> b!824738 (= e!458838 tp_is_empty!14863)))

(declare-fun mapIsEmpty!23911 () Bool)

(declare-fun mapRes!23911 () Bool)

(assert (=> mapIsEmpty!23911 mapRes!23911))

(declare-fun b!824739 () Bool)

(declare-fun e!458840 () Bool)

(assert (=> b!824739 (= e!458840 tp_is_empty!14863)))

(declare-fun b!824740 () Bool)

(declare-fun res!562098 () Bool)

(assert (=> b!824740 (=> (not res!562098) (not e!458839))))

(declare-datatypes ((List!15595 0))(
  ( (Nil!15592) (Cons!15591 (h!16726 (_ BitVec 64)) (t!21928 List!15595)) )
))
(declare-fun arrayNoDuplicates!0 (array!45919 (_ BitVec 32) List!15595) Bool)

(assert (=> b!824740 (= res!562098 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15592))))

(declare-fun b!824741 () Bool)

(assert (=> b!824741 (= e!458841 (and e!458840 mapRes!23911))))

(declare-fun condMapEmpty!23911 () Bool)

(declare-fun mapDefault!23911 () ValueCell!7016)

(assert (=> b!824741 (= condMapEmpty!23911 (= (arr!22004 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7016)) mapDefault!23911)))))

(declare-fun b!824742 () Bool)

(declare-fun res!562096 () Bool)

(assert (=> b!824742 (=> (not res!562096) (not e!458839))))

(assert (=> b!824742 (= res!562096 (and (= (size!22424 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22423 _keys!976) (size!22424 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23911 () Bool)

(declare-fun tp!46210 () Bool)

(assert (=> mapNonEmpty!23911 (= mapRes!23911 (and tp!46210 e!458838))))

(declare-fun mapKey!23911 () (_ BitVec 32))

(declare-fun mapValue!23911 () ValueCell!7016)

(declare-fun mapRest!23911 () (Array (_ BitVec 32) ValueCell!7016))

(assert (=> mapNonEmpty!23911 (= (arr!22004 _values!788) (store mapRest!23911 mapKey!23911 mapValue!23911))))

(declare-fun b!824743 () Bool)

(declare-fun res!562095 () Bool)

(assert (=> b!824743 (=> (not res!562095) (not e!458839))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45919 (_ BitVec 32)) Bool)

(assert (=> b!824743 (= res!562095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71102 res!562097) b!824742))

(assert (= (and b!824742 res!562096) b!824743))

(assert (= (and b!824743 res!562095) b!824740))

(assert (= (and b!824740 res!562098) b!824737))

(assert (= (and b!824741 condMapEmpty!23911) mapIsEmpty!23911))

(assert (= (and b!824741 (not condMapEmpty!23911)) mapNonEmpty!23911))

(get-info :version)

(assert (= (and mapNonEmpty!23911 ((_ is ValueCellFull!7016) mapValue!23911)) b!824738))

(assert (= (and b!824741 ((_ is ValueCellFull!7016) mapDefault!23911)) b!824739))

(assert (= start!71102 b!824741))

(declare-fun m!767309 () Bool)

(assert (=> b!824740 m!767309))

(declare-fun m!767311 () Bool)

(assert (=> b!824737 m!767311))

(declare-fun m!767313 () Bool)

(assert (=> b!824737 m!767313))

(declare-fun m!767315 () Bool)

(assert (=> b!824737 m!767315))

(declare-fun m!767317 () Bool)

(assert (=> start!71102 m!767317))

(declare-fun m!767319 () Bool)

(assert (=> start!71102 m!767319))

(declare-fun m!767321 () Bool)

(assert (=> start!71102 m!767321))

(declare-fun m!767323 () Bool)

(assert (=> b!824743 m!767323))

(declare-fun m!767325 () Bool)

(assert (=> mapNonEmpty!23911 m!767325))

(check-sat (not start!71102) (not b!824737) tp_is_empty!14863 (not b!824740) (not b!824743) (not b_next!13153) (not mapNonEmpty!23911) b_and!22059)
(check-sat b_and!22059 (not b_next!13153))
