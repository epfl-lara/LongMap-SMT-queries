; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70938 () Bool)

(assert start!70938)

(declare-fun b_free!13155 () Bool)

(declare-fun b_next!13155 () Bool)

(assert (=> start!70938 (= b_free!13155 (not b_next!13155))))

(declare-fun tp!46215 () Bool)

(declare-fun b_and!22051 () Bool)

(assert (=> start!70938 (= tp!46215 b_and!22051)))

(declare-fun b!823864 () Bool)

(declare-fun res!561764 () Bool)

(declare-fun e!458276 () Bool)

(assert (=> b!823864 (=> (not res!561764) (not e!458276))))

(declare-datatypes ((array!45920 0))(
  ( (array!45921 (arr!22008 (Array (_ BitVec 32) (_ BitVec 64))) (size!22429 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45920)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24821 0))(
  ( (V!24822 (val!7480 Int)) )
))
(declare-datatypes ((ValueCell!7017 0))(
  ( (ValueCellFull!7017 (v!9913 V!24821)) (EmptyCell!7017) )
))
(declare-datatypes ((array!45922 0))(
  ( (array!45923 (arr!22009 (Array (_ BitVec 32) ValueCell!7017)) (size!22430 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45922)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!823864 (= res!561764 (and (= (size!22430 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22429 _keys!976) (size!22430 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!823865 () Bool)

(declare-fun e!458275 () Bool)

(declare-fun e!458278 () Bool)

(declare-fun mapRes!23914 () Bool)

(assert (=> b!823865 (= e!458275 (and e!458278 mapRes!23914))))

(declare-fun condMapEmpty!23914 () Bool)

(declare-fun mapDefault!23914 () ValueCell!7017)

(assert (=> b!823865 (= condMapEmpty!23914 (= (arr!22009 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7017)) mapDefault!23914)))))

(declare-fun b!823866 () Bool)

(assert (=> b!823866 (= e!458276 (not true))))

(declare-datatypes ((tuple2!9894 0))(
  ( (tuple2!9895 (_1!4958 (_ BitVec 64)) (_2!4958 V!24821)) )
))
(declare-datatypes ((List!15705 0))(
  ( (Nil!15702) (Cons!15701 (h!16830 tuple2!9894) (t!22046 List!15705)) )
))
(declare-datatypes ((ListLongMap!8717 0))(
  ( (ListLongMap!8718 (toList!4374 List!15705)) )
))
(declare-fun lt!371566 () ListLongMap!8717)

(declare-fun lt!371564 () ListLongMap!8717)

(assert (=> b!823866 (= lt!371566 lt!371564)))

(declare-fun zeroValueBefore!34 () V!24821)

(declare-datatypes ((Unit!28216 0))(
  ( (Unit!28217) )
))
(declare-fun lt!371565 () Unit!28216)

(declare-fun zeroValueAfter!34 () V!24821)

(declare-fun minValue!754 () V!24821)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!499 (array!45920 array!45922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24821 V!24821 V!24821 V!24821 (_ BitVec 32) Int) Unit!28216)

(assert (=> b!823866 (= lt!371565 (lemmaNoChangeToArrayThenSameMapNoExtras!499 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2389 (array!45920 array!45922 (_ BitVec 32) (_ BitVec 32) V!24821 V!24821 (_ BitVec 32) Int) ListLongMap!8717)

(assert (=> b!823866 (= lt!371564 (getCurrentListMapNoExtraKeys!2389 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823866 (= lt!371566 (getCurrentListMapNoExtraKeys!2389 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823867 () Bool)

(declare-fun res!561762 () Bool)

(assert (=> b!823867 (=> (not res!561762) (not e!458276))))

(declare-datatypes ((List!15706 0))(
  ( (Nil!15703) (Cons!15702 (h!16831 (_ BitVec 64)) (t!22047 List!15706)) )
))
(declare-fun arrayNoDuplicates!0 (array!45920 (_ BitVec 32) List!15706) Bool)

(assert (=> b!823867 (= res!561762 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15703))))

(declare-fun b!823868 () Bool)

(declare-fun res!561761 () Bool)

(assert (=> b!823868 (=> (not res!561761) (not e!458276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45920 (_ BitVec 32)) Bool)

(assert (=> b!823868 (= res!561761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23914 () Bool)

(declare-fun tp!46216 () Bool)

(declare-fun e!458277 () Bool)

(assert (=> mapNonEmpty!23914 (= mapRes!23914 (and tp!46216 e!458277))))

(declare-fun mapRest!23914 () (Array (_ BitVec 32) ValueCell!7017))

(declare-fun mapValue!23914 () ValueCell!7017)

(declare-fun mapKey!23914 () (_ BitVec 32))

(assert (=> mapNonEmpty!23914 (= (arr!22009 _values!788) (store mapRest!23914 mapKey!23914 mapValue!23914))))

(declare-fun b!823869 () Bool)

(declare-fun tp_is_empty!14865 () Bool)

(assert (=> b!823869 (= e!458277 tp_is_empty!14865)))

(declare-fun res!561763 () Bool)

(assert (=> start!70938 (=> (not res!561763) (not e!458276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70938 (= res!561763 (validMask!0 mask!1312))))

(assert (=> start!70938 e!458276))

(assert (=> start!70938 tp_is_empty!14865))

(declare-fun array_inv!17563 (array!45920) Bool)

(assert (=> start!70938 (array_inv!17563 _keys!976)))

(assert (=> start!70938 true))

(declare-fun array_inv!17564 (array!45922) Bool)

(assert (=> start!70938 (and (array_inv!17564 _values!788) e!458275)))

(assert (=> start!70938 tp!46215))

(declare-fun mapIsEmpty!23914 () Bool)

(assert (=> mapIsEmpty!23914 mapRes!23914))

(declare-fun b!823870 () Bool)

(assert (=> b!823870 (= e!458278 tp_is_empty!14865)))

(assert (= (and start!70938 res!561763) b!823864))

(assert (= (and b!823864 res!561764) b!823868))

(assert (= (and b!823868 res!561761) b!823867))

(assert (= (and b!823867 res!561762) b!823866))

(assert (= (and b!823865 condMapEmpty!23914) mapIsEmpty!23914))

(assert (= (and b!823865 (not condMapEmpty!23914)) mapNonEmpty!23914))

(get-info :version)

(assert (= (and mapNonEmpty!23914 ((_ is ValueCellFull!7017) mapValue!23914)) b!823869))

(assert (= (and b!823865 ((_ is ValueCellFull!7017) mapDefault!23914)) b!823870))

(assert (= start!70938 b!823865))

(declare-fun m!766045 () Bool)

(assert (=> mapNonEmpty!23914 m!766045))

(declare-fun m!766047 () Bool)

(assert (=> b!823866 m!766047))

(declare-fun m!766049 () Bool)

(assert (=> b!823866 m!766049))

(declare-fun m!766051 () Bool)

(assert (=> b!823866 m!766051))

(declare-fun m!766053 () Bool)

(assert (=> b!823868 m!766053))

(declare-fun m!766055 () Bool)

(assert (=> b!823867 m!766055))

(declare-fun m!766057 () Bool)

(assert (=> start!70938 m!766057))

(declare-fun m!766059 () Bool)

(assert (=> start!70938 m!766059))

(declare-fun m!766061 () Bool)

(assert (=> start!70938 m!766061))

(check-sat (not b!823866) (not b_next!13155) tp_is_empty!14865 (not b!823867) (not mapNonEmpty!23914) b_and!22051 (not start!70938) (not b!823868))
(check-sat b_and!22051 (not b_next!13155))
