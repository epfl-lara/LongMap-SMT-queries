; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70922 () Bool)

(assert start!70922)

(declare-fun b_free!13159 () Bool)

(declare-fun b_next!13159 () Bool)

(assert (=> start!70922 (= b_free!13159 (not b_next!13159))))

(declare-fun tp!46228 () Bool)

(declare-fun b_and!22029 () Bool)

(assert (=> start!70922 (= tp!46228 b_and!22029)))

(declare-fun b!823660 () Bool)

(declare-fun res!561679 () Bool)

(declare-fun e!458154 () Bool)

(assert (=> b!823660 (=> (not res!561679) (not e!458154))))

(declare-datatypes ((array!45899 0))(
  ( (array!45900 (arr!21998 (Array (_ BitVec 32) (_ BitVec 64))) (size!22419 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45899)

(declare-datatypes ((List!15703 0))(
  ( (Nil!15700) (Cons!15699 (h!16828 (_ BitVec 64)) (t!22035 List!15703)) )
))
(declare-fun arrayNoDuplicates!0 (array!45899 (_ BitVec 32) List!15703) Bool)

(assert (=> b!823660 (= res!561679 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15700))))

(declare-fun mapNonEmpty!23920 () Bool)

(declare-fun mapRes!23920 () Bool)

(declare-fun tp!46227 () Bool)

(declare-fun e!458158 () Bool)

(assert (=> mapNonEmpty!23920 (= mapRes!23920 (and tp!46227 e!458158))))

(declare-datatypes ((V!24827 0))(
  ( (V!24828 (val!7482 Int)) )
))
(declare-datatypes ((ValueCell!7019 0))(
  ( (ValueCellFull!7019 (v!9909 V!24827)) (EmptyCell!7019) )
))
(declare-fun mapRest!23920 () (Array (_ BitVec 32) ValueCell!7019))

(declare-datatypes ((array!45901 0))(
  ( (array!45902 (arr!21999 (Array (_ BitVec 32) ValueCell!7019)) (size!22420 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45901)

(declare-fun mapKey!23920 () (_ BitVec 32))

(declare-fun mapValue!23920 () ValueCell!7019)

(assert (=> mapNonEmpty!23920 (= (arr!21999 _values!788) (store mapRest!23920 mapKey!23920 mapValue!23920))))

(declare-fun mapIsEmpty!23920 () Bool)

(assert (=> mapIsEmpty!23920 mapRes!23920))

(declare-fun b!823661 () Bool)

(declare-fun res!561681 () Bool)

(assert (=> b!823661 (=> (not res!561681) (not e!458154))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!823661 (= res!561681 (and (= (size!22420 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22419 _keys!976) (size!22420 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823662 () Bool)

(declare-fun e!458155 () Bool)

(declare-fun tp_is_empty!14869 () Bool)

(assert (=> b!823662 (= e!458155 tp_is_empty!14869)))

(declare-fun res!561682 () Bool)

(assert (=> start!70922 (=> (not res!561682) (not e!458154))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70922 (= res!561682 (validMask!0 mask!1312))))

(assert (=> start!70922 e!458154))

(assert (=> start!70922 tp_is_empty!14869))

(declare-fun array_inv!17623 (array!45899) Bool)

(assert (=> start!70922 (array_inv!17623 _keys!976)))

(assert (=> start!70922 true))

(declare-fun e!458156 () Bool)

(declare-fun array_inv!17624 (array!45901) Bool)

(assert (=> start!70922 (and (array_inv!17624 _values!788) e!458156)))

(assert (=> start!70922 tp!46228))

(declare-fun b!823663 () Bool)

(assert (=> b!823663 (= e!458156 (and e!458155 mapRes!23920))))

(declare-fun condMapEmpty!23920 () Bool)

(declare-fun mapDefault!23920 () ValueCell!7019)

(assert (=> b!823663 (= condMapEmpty!23920 (= (arr!21999 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7019)) mapDefault!23920)))))

(declare-fun b!823664 () Bool)

(assert (=> b!823664 (= e!458158 tp_is_empty!14869)))

(declare-fun b!823665 () Bool)

(declare-fun res!561680 () Bool)

(assert (=> b!823665 (=> (not res!561680) (not e!458154))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45899 (_ BitVec 32)) Bool)

(assert (=> b!823665 (= res!561680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823666 () Bool)

(assert (=> b!823666 (= e!458154 (not true))))

(declare-datatypes ((tuple2!9904 0))(
  ( (tuple2!9905 (_1!4963 (_ BitVec 64)) (_2!4963 V!24827)) )
))
(declare-datatypes ((List!15704 0))(
  ( (Nil!15701) (Cons!15700 (h!16829 tuple2!9904) (t!22036 List!15704)) )
))
(declare-datatypes ((ListLongMap!8717 0))(
  ( (ListLongMap!8718 (toList!4374 List!15704)) )
))
(declare-fun lt!371340 () ListLongMap!8717)

(declare-fun lt!371341 () ListLongMap!8717)

(assert (=> b!823666 (= lt!371340 lt!371341)))

(declare-fun zeroValueBefore!34 () V!24827)

(declare-datatypes ((Unit!28172 0))(
  ( (Unit!28173) )
))
(declare-fun lt!371339 () Unit!28172)

(declare-fun zeroValueAfter!34 () V!24827)

(declare-fun minValue!754 () V!24827)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!511 (array!45899 array!45901 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24827 V!24827 V!24827 V!24827 (_ BitVec 32) Int) Unit!28172)

(assert (=> b!823666 (= lt!371339 (lemmaNoChangeToArrayThenSameMapNoExtras!511 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2418 (array!45899 array!45901 (_ BitVec 32) (_ BitVec 32) V!24827 V!24827 (_ BitVec 32) Int) ListLongMap!8717)

(assert (=> b!823666 (= lt!371341 (getCurrentListMapNoExtraKeys!2418 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823666 (= lt!371340 (getCurrentListMapNoExtraKeys!2418 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70922 res!561682) b!823661))

(assert (= (and b!823661 res!561681) b!823665))

(assert (= (and b!823665 res!561680) b!823660))

(assert (= (and b!823660 res!561679) b!823666))

(assert (= (and b!823663 condMapEmpty!23920) mapIsEmpty!23920))

(assert (= (and b!823663 (not condMapEmpty!23920)) mapNonEmpty!23920))

(get-info :version)

(assert (= (and mapNonEmpty!23920 ((_ is ValueCellFull!7019) mapValue!23920)) b!823664))

(assert (= (and b!823663 ((_ is ValueCellFull!7019) mapDefault!23920)) b!823662))

(assert (= start!70922 b!823663))

(declare-fun m!765329 () Bool)

(assert (=> b!823665 m!765329))

(declare-fun m!765331 () Bool)

(assert (=> mapNonEmpty!23920 m!765331))

(declare-fun m!765333 () Bool)

(assert (=> start!70922 m!765333))

(declare-fun m!765335 () Bool)

(assert (=> start!70922 m!765335))

(declare-fun m!765337 () Bool)

(assert (=> start!70922 m!765337))

(declare-fun m!765339 () Bool)

(assert (=> b!823660 m!765339))

(declare-fun m!765341 () Bool)

(assert (=> b!823666 m!765341))

(declare-fun m!765343 () Bool)

(assert (=> b!823666 m!765343))

(declare-fun m!765345 () Bool)

(assert (=> b!823666 m!765345))

(check-sat (not b!823665) (not start!70922) (not b_next!13159) (not mapNonEmpty!23920) (not b!823666) (not b!823660) b_and!22029 tp_is_empty!14869)
(check-sat b_and!22029 (not b_next!13159))
