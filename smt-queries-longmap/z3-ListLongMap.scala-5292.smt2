; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71108 () Bool)

(assert start!71108)

(declare-fun b_free!13159 () Bool)

(declare-fun b_next!13159 () Bool)

(assert (=> start!71108 (= b_free!13159 (not b_next!13159))))

(declare-fun tp!46227 () Bool)

(declare-fun b_and!22065 () Bool)

(assert (=> start!71108 (= tp!46227 b_and!22065)))

(declare-fun b!824800 () Bool)

(declare-fun res!562134 () Bool)

(declare-fun e!458885 () Bool)

(assert (=> b!824800 (=> (not res!562134) (not e!458885))))

(declare-datatypes ((array!45931 0))(
  ( (array!45932 (arr!22009 (Array (_ BitVec 32) (_ BitVec 64))) (size!22429 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45931)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24827 0))(
  ( (V!24828 (val!7482 Int)) )
))
(declare-datatypes ((ValueCell!7019 0))(
  ( (ValueCellFull!7019 (v!9915 V!24827)) (EmptyCell!7019) )
))
(declare-datatypes ((array!45933 0))(
  ( (array!45934 (arr!22010 (Array (_ BitVec 32) ValueCell!7019)) (size!22430 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45933)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!824800 (= res!562134 (and (= (size!22430 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22429 _keys!976) (size!22430 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824802 () Bool)

(declare-fun e!458883 () Bool)

(declare-fun tp_is_empty!14869 () Bool)

(assert (=> b!824802 (= e!458883 tp_is_empty!14869)))

(declare-fun mapNonEmpty!23920 () Bool)

(declare-fun mapRes!23920 () Bool)

(declare-fun tp!46228 () Bool)

(assert (=> mapNonEmpty!23920 (= mapRes!23920 (and tp!46228 e!458883))))

(declare-fun mapValue!23920 () ValueCell!7019)

(declare-fun mapRest!23920 () (Array (_ BitVec 32) ValueCell!7019))

(declare-fun mapKey!23920 () (_ BitVec 32))

(assert (=> mapNonEmpty!23920 (= (arr!22010 _values!788) (store mapRest!23920 mapKey!23920 mapValue!23920))))

(declare-fun mapIsEmpty!23920 () Bool)

(assert (=> mapIsEmpty!23920 mapRes!23920))

(declare-fun b!824803 () Bool)

(declare-fun e!458886 () Bool)

(assert (=> b!824803 (= e!458886 tp_is_empty!14869)))

(declare-fun b!824804 () Bool)

(assert (=> b!824804 (= e!458885 (not true))))

(declare-datatypes ((tuple2!9814 0))(
  ( (tuple2!9815 (_1!4918 (_ BitVec 64)) (_2!4918 V!24827)) )
))
(declare-datatypes ((List!15600 0))(
  ( (Nil!15597) (Cons!15596 (h!16731 tuple2!9814) (t!21933 List!15600)) )
))
(declare-datatypes ((ListLongMap!8639 0))(
  ( (ListLongMap!8640 (toList!4335 List!15600)) )
))
(declare-fun lt!371937 () ListLongMap!8639)

(declare-fun lt!371938 () ListLongMap!8639)

(assert (=> b!824804 (= lt!371937 lt!371938)))

(declare-fun zeroValueBefore!34 () V!24827)

(declare-fun minValue!754 () V!24827)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!24827)

(declare-datatypes ((Unit!28223 0))(
  ( (Unit!28224) )
))
(declare-fun lt!371936 () Unit!28223)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!506 (array!45931 array!45933 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24827 V!24827 V!24827 V!24827 (_ BitVec 32) Int) Unit!28223)

(assert (=> b!824804 (= lt!371936 (lemmaNoChangeToArrayThenSameMapNoExtras!506 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2418 (array!45931 array!45933 (_ BitVec 32) (_ BitVec 32) V!24827 V!24827 (_ BitVec 32) Int) ListLongMap!8639)

(assert (=> b!824804 (= lt!371938 (getCurrentListMapNoExtraKeys!2418 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824804 (= lt!371937 (getCurrentListMapNoExtraKeys!2418 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!562131 () Bool)

(assert (=> start!71108 (=> (not res!562131) (not e!458885))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71108 (= res!562131 (validMask!0 mask!1312))))

(assert (=> start!71108 e!458885))

(assert (=> start!71108 tp_is_empty!14869))

(declare-fun array_inv!17601 (array!45931) Bool)

(assert (=> start!71108 (array_inv!17601 _keys!976)))

(assert (=> start!71108 true))

(declare-fun e!458884 () Bool)

(declare-fun array_inv!17602 (array!45933) Bool)

(assert (=> start!71108 (and (array_inv!17602 _values!788) e!458884)))

(assert (=> start!71108 tp!46227))

(declare-fun b!824801 () Bool)

(assert (=> b!824801 (= e!458884 (and e!458886 mapRes!23920))))

(declare-fun condMapEmpty!23920 () Bool)

(declare-fun mapDefault!23920 () ValueCell!7019)

(assert (=> b!824801 (= condMapEmpty!23920 (= (arr!22010 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7019)) mapDefault!23920)))))

(declare-fun b!824805 () Bool)

(declare-fun res!562133 () Bool)

(assert (=> b!824805 (=> (not res!562133) (not e!458885))))

(declare-datatypes ((List!15601 0))(
  ( (Nil!15598) (Cons!15597 (h!16732 (_ BitVec 64)) (t!21934 List!15601)) )
))
(declare-fun arrayNoDuplicates!0 (array!45931 (_ BitVec 32) List!15601) Bool)

(assert (=> b!824805 (= res!562133 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15598))))

(declare-fun b!824806 () Bool)

(declare-fun res!562132 () Bool)

(assert (=> b!824806 (=> (not res!562132) (not e!458885))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45931 (_ BitVec 32)) Bool)

(assert (=> b!824806 (= res!562132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71108 res!562131) b!824800))

(assert (= (and b!824800 res!562134) b!824806))

(assert (= (and b!824806 res!562132) b!824805))

(assert (= (and b!824805 res!562133) b!824804))

(assert (= (and b!824801 condMapEmpty!23920) mapIsEmpty!23920))

(assert (= (and b!824801 (not condMapEmpty!23920)) mapNonEmpty!23920))

(get-info :version)

(assert (= (and mapNonEmpty!23920 ((_ is ValueCellFull!7019) mapValue!23920)) b!824802))

(assert (= (and b!824801 ((_ is ValueCellFull!7019) mapDefault!23920)) b!824803))

(assert (= start!71108 b!824801))

(declare-fun m!767363 () Bool)

(assert (=> start!71108 m!767363))

(declare-fun m!767365 () Bool)

(assert (=> start!71108 m!767365))

(declare-fun m!767367 () Bool)

(assert (=> start!71108 m!767367))

(declare-fun m!767369 () Bool)

(assert (=> mapNonEmpty!23920 m!767369))

(declare-fun m!767371 () Bool)

(assert (=> b!824806 m!767371))

(declare-fun m!767373 () Bool)

(assert (=> b!824805 m!767373))

(declare-fun m!767375 () Bool)

(assert (=> b!824804 m!767375))

(declare-fun m!767377 () Bool)

(assert (=> b!824804 m!767377))

(declare-fun m!767379 () Bool)

(assert (=> b!824804 m!767379))

(check-sat (not b!824806) (not b!824804) (not b!824805) b_and!22065 (not mapNonEmpty!23920) tp_is_empty!14869 (not b_next!13159) (not start!71108))
(check-sat b_and!22065 (not b_next!13159))
