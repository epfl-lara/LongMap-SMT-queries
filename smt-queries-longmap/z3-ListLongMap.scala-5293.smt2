; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71114 () Bool)

(assert start!71114)

(declare-fun b_free!13165 () Bool)

(declare-fun b_next!13165 () Bool)

(assert (=> start!71114 (= b_free!13165 (not b_next!13165))))

(declare-fun tp!46246 () Bool)

(declare-fun b_and!22071 () Bool)

(assert (=> start!71114 (= tp!46246 b_and!22071)))

(declare-fun b!824863 () Bool)

(declare-fun e!458930 () Bool)

(declare-fun e!458928 () Bool)

(declare-fun mapRes!23929 () Bool)

(assert (=> b!824863 (= e!458930 (and e!458928 mapRes!23929))))

(declare-fun condMapEmpty!23929 () Bool)

(declare-datatypes ((V!24835 0))(
  ( (V!24836 (val!7485 Int)) )
))
(declare-datatypes ((ValueCell!7022 0))(
  ( (ValueCellFull!7022 (v!9918 V!24835)) (EmptyCell!7022) )
))
(declare-datatypes ((array!45943 0))(
  ( (array!45944 (arr!22015 (Array (_ BitVec 32) ValueCell!7022)) (size!22435 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45943)

(declare-fun mapDefault!23929 () ValueCell!7022)

(assert (=> b!824863 (= condMapEmpty!23929 (= (arr!22015 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7022)) mapDefault!23929)))))

(declare-fun res!562167 () Bool)

(declare-fun e!458929 () Bool)

(assert (=> start!71114 (=> (not res!562167) (not e!458929))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71114 (= res!562167 (validMask!0 mask!1312))))

(assert (=> start!71114 e!458929))

(declare-fun tp_is_empty!14875 () Bool)

(assert (=> start!71114 tp_is_empty!14875))

(declare-datatypes ((array!45945 0))(
  ( (array!45946 (arr!22016 (Array (_ BitVec 32) (_ BitVec 64))) (size!22436 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45945)

(declare-fun array_inv!17605 (array!45945) Bool)

(assert (=> start!71114 (array_inv!17605 _keys!976)))

(assert (=> start!71114 true))

(declare-fun array_inv!17606 (array!45943) Bool)

(assert (=> start!71114 (and (array_inv!17606 _values!788) e!458930)))

(assert (=> start!71114 tp!46246))

(declare-fun b!824864 () Bool)

(declare-fun res!562169 () Bool)

(assert (=> b!824864 (=> (not res!562169) (not e!458929))))

(declare-datatypes ((List!15605 0))(
  ( (Nil!15602) (Cons!15601 (h!16736 (_ BitVec 64)) (t!21938 List!15605)) )
))
(declare-fun arrayNoDuplicates!0 (array!45945 (_ BitVec 32) List!15605) Bool)

(assert (=> b!824864 (= res!562169 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15602))))

(declare-fun mapNonEmpty!23929 () Bool)

(declare-fun tp!46245 () Bool)

(declare-fun e!458927 () Bool)

(assert (=> mapNonEmpty!23929 (= mapRes!23929 (and tp!46245 e!458927))))

(declare-fun mapRest!23929 () (Array (_ BitVec 32) ValueCell!7022))

(declare-fun mapKey!23929 () (_ BitVec 32))

(declare-fun mapValue!23929 () ValueCell!7022)

(assert (=> mapNonEmpty!23929 (= (arr!22015 _values!788) (store mapRest!23929 mapKey!23929 mapValue!23929))))

(declare-fun b!824865 () Bool)

(assert (=> b!824865 (= e!458929 (not true))))

(declare-datatypes ((tuple2!9820 0))(
  ( (tuple2!9821 (_1!4921 (_ BitVec 64)) (_2!4921 V!24835)) )
))
(declare-datatypes ((List!15606 0))(
  ( (Nil!15603) (Cons!15602 (h!16737 tuple2!9820) (t!21939 List!15606)) )
))
(declare-datatypes ((ListLongMap!8645 0))(
  ( (ListLongMap!8646 (toList!4338 List!15606)) )
))
(declare-fun lt!371965 () ListLongMap!8645)

(declare-fun lt!371963 () ListLongMap!8645)

(assert (=> b!824865 (= lt!371965 lt!371963)))

(declare-fun zeroValueBefore!34 () V!24835)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24835)

(declare-fun minValue!754 () V!24835)

(declare-datatypes ((Unit!28229 0))(
  ( (Unit!28230) )
))
(declare-fun lt!371964 () Unit!28229)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!509 (array!45945 array!45943 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24835 V!24835 V!24835 V!24835 (_ BitVec 32) Int) Unit!28229)

(assert (=> b!824865 (= lt!371964 (lemmaNoChangeToArrayThenSameMapNoExtras!509 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2421 (array!45945 array!45943 (_ BitVec 32) (_ BitVec 32) V!24835 V!24835 (_ BitVec 32) Int) ListLongMap!8645)

(assert (=> b!824865 (= lt!371963 (getCurrentListMapNoExtraKeys!2421 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824865 (= lt!371965 (getCurrentListMapNoExtraKeys!2421 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23929 () Bool)

(assert (=> mapIsEmpty!23929 mapRes!23929))

(declare-fun b!824866 () Bool)

(assert (=> b!824866 (= e!458928 tp_is_empty!14875)))

(declare-fun b!824867 () Bool)

(assert (=> b!824867 (= e!458927 tp_is_empty!14875)))

(declare-fun b!824868 () Bool)

(declare-fun res!562170 () Bool)

(assert (=> b!824868 (=> (not res!562170) (not e!458929))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45945 (_ BitVec 32)) Bool)

(assert (=> b!824868 (= res!562170 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!824869 () Bool)

(declare-fun res!562168 () Bool)

(assert (=> b!824869 (=> (not res!562168) (not e!458929))))

(assert (=> b!824869 (= res!562168 (and (= (size!22435 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22436 _keys!976) (size!22435 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71114 res!562167) b!824869))

(assert (= (and b!824869 res!562168) b!824868))

(assert (= (and b!824868 res!562170) b!824864))

(assert (= (and b!824864 res!562169) b!824865))

(assert (= (and b!824863 condMapEmpty!23929) mapIsEmpty!23929))

(assert (= (and b!824863 (not condMapEmpty!23929)) mapNonEmpty!23929))

(get-info :version)

(assert (= (and mapNonEmpty!23929 ((_ is ValueCellFull!7022) mapValue!23929)) b!824867))

(assert (= (and b!824863 ((_ is ValueCellFull!7022) mapDefault!23929)) b!824866))

(assert (= start!71114 b!824863))

(declare-fun m!767417 () Bool)

(assert (=> b!824868 m!767417))

(declare-fun m!767419 () Bool)

(assert (=> b!824864 m!767419))

(declare-fun m!767421 () Bool)

(assert (=> start!71114 m!767421))

(declare-fun m!767423 () Bool)

(assert (=> start!71114 m!767423))

(declare-fun m!767425 () Bool)

(assert (=> start!71114 m!767425))

(declare-fun m!767427 () Bool)

(assert (=> b!824865 m!767427))

(declare-fun m!767429 () Bool)

(assert (=> b!824865 m!767429))

(declare-fun m!767431 () Bool)

(assert (=> b!824865 m!767431))

(declare-fun m!767433 () Bool)

(assert (=> mapNonEmpty!23929 m!767433))

(check-sat (not b!824865) (not b!824868) (not start!71114) (not b!824864) tp_is_empty!14875 b_and!22071 (not b_next!13165) (not mapNonEmpty!23929))
(check-sat b_and!22071 (not b_next!13165))
