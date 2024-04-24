; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71120 () Bool)

(assert start!71120)

(declare-fun b_free!13171 () Bool)

(declare-fun b_next!13171 () Bool)

(assert (=> start!71120 (= b_free!13171 (not b_next!13171))))

(declare-fun tp!46264 () Bool)

(declare-fun b_and!22077 () Bool)

(assert (=> start!71120 (= tp!46264 b_and!22077)))

(declare-fun b!824926 () Bool)

(declare-fun e!458974 () Bool)

(declare-fun tp_is_empty!14881 () Bool)

(assert (=> b!824926 (= e!458974 tp_is_empty!14881)))

(declare-fun mapIsEmpty!23938 () Bool)

(declare-fun mapRes!23938 () Bool)

(assert (=> mapIsEmpty!23938 mapRes!23938))

(declare-fun b!824927 () Bool)

(declare-fun e!458975 () Bool)

(assert (=> b!824927 (= e!458975 (not true))))

(declare-datatypes ((V!24843 0))(
  ( (V!24844 (val!7488 Int)) )
))
(declare-datatypes ((tuple2!9824 0))(
  ( (tuple2!9825 (_1!4923 (_ BitVec 64)) (_2!4923 V!24843)) )
))
(declare-datatypes ((List!15608 0))(
  ( (Nil!15605) (Cons!15604 (h!16739 tuple2!9824) (t!21941 List!15608)) )
))
(declare-datatypes ((ListLongMap!8649 0))(
  ( (ListLongMap!8650 (toList!4340 List!15608)) )
))
(declare-fun lt!371992 () ListLongMap!8649)

(declare-fun lt!371991 () ListLongMap!8649)

(assert (=> b!824927 (= lt!371992 lt!371991)))

(declare-fun zeroValueBefore!34 () V!24843)

(declare-datatypes ((array!45955 0))(
  ( (array!45956 (arr!22021 (Array (_ BitVec 32) (_ BitVec 64))) (size!22441 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45955)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24843)

(declare-datatypes ((ValueCell!7025 0))(
  ( (ValueCellFull!7025 (v!9921 V!24843)) (EmptyCell!7025) )
))
(declare-datatypes ((array!45957 0))(
  ( (array!45958 (arr!22022 (Array (_ BitVec 32) ValueCell!7025)) (size!22442 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45957)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28233 0))(
  ( (Unit!28234) )
))
(declare-fun lt!371990 () Unit!28233)

(declare-fun minValue!754 () V!24843)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!511 (array!45955 array!45957 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24843 V!24843 V!24843 V!24843 (_ BitVec 32) Int) Unit!28233)

(assert (=> b!824927 (= lt!371990 (lemmaNoChangeToArrayThenSameMapNoExtras!511 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2423 (array!45955 array!45957 (_ BitVec 32) (_ BitVec 32) V!24843 V!24843 (_ BitVec 32) Int) ListLongMap!8649)

(assert (=> b!824927 (= lt!371991 (getCurrentListMapNoExtraKeys!2423 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!824927 (= lt!371992 (getCurrentListMapNoExtraKeys!2423 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!824928 () Bool)

(declare-fun e!458972 () Bool)

(assert (=> b!824928 (= e!458972 tp_is_empty!14881)))

(declare-fun res!562203 () Bool)

(assert (=> start!71120 (=> (not res!562203) (not e!458975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71120 (= res!562203 (validMask!0 mask!1312))))

(assert (=> start!71120 e!458975))

(assert (=> start!71120 tp_is_empty!14881))

(declare-fun array_inv!17611 (array!45955) Bool)

(assert (=> start!71120 (array_inv!17611 _keys!976)))

(assert (=> start!71120 true))

(declare-fun e!458976 () Bool)

(declare-fun array_inv!17612 (array!45957) Bool)

(assert (=> start!71120 (and (array_inv!17612 _values!788) e!458976)))

(assert (=> start!71120 tp!46264))

(declare-fun b!824929 () Bool)

(declare-fun res!562204 () Bool)

(assert (=> b!824929 (=> (not res!562204) (not e!458975))))

(declare-datatypes ((List!15609 0))(
  ( (Nil!15606) (Cons!15605 (h!16740 (_ BitVec 64)) (t!21942 List!15609)) )
))
(declare-fun arrayNoDuplicates!0 (array!45955 (_ BitVec 32) List!15609) Bool)

(assert (=> b!824929 (= res!562204 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15606))))

(declare-fun b!824930 () Bool)

(declare-fun res!562206 () Bool)

(assert (=> b!824930 (=> (not res!562206) (not e!458975))))

(assert (=> b!824930 (= res!562206 (and (= (size!22442 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22441 _keys!976) (size!22442 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!824931 () Bool)

(assert (=> b!824931 (= e!458976 (and e!458974 mapRes!23938))))

(declare-fun condMapEmpty!23938 () Bool)

(declare-fun mapDefault!23938 () ValueCell!7025)

(assert (=> b!824931 (= condMapEmpty!23938 (= (arr!22022 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7025)) mapDefault!23938)))))

(declare-fun mapNonEmpty!23938 () Bool)

(declare-fun tp!46263 () Bool)

(assert (=> mapNonEmpty!23938 (= mapRes!23938 (and tp!46263 e!458972))))

(declare-fun mapValue!23938 () ValueCell!7025)

(declare-fun mapRest!23938 () (Array (_ BitVec 32) ValueCell!7025))

(declare-fun mapKey!23938 () (_ BitVec 32))

(assert (=> mapNonEmpty!23938 (= (arr!22022 _values!788) (store mapRest!23938 mapKey!23938 mapValue!23938))))

(declare-fun b!824932 () Bool)

(declare-fun res!562205 () Bool)

(assert (=> b!824932 (=> (not res!562205) (not e!458975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45955 (_ BitVec 32)) Bool)

(assert (=> b!824932 (= res!562205 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71120 res!562203) b!824930))

(assert (= (and b!824930 res!562206) b!824932))

(assert (= (and b!824932 res!562205) b!824929))

(assert (= (and b!824929 res!562204) b!824927))

(assert (= (and b!824931 condMapEmpty!23938) mapIsEmpty!23938))

(assert (= (and b!824931 (not condMapEmpty!23938)) mapNonEmpty!23938))

(get-info :version)

(assert (= (and mapNonEmpty!23938 ((_ is ValueCellFull!7025) mapValue!23938)) b!824928))

(assert (= (and b!824931 ((_ is ValueCellFull!7025) mapDefault!23938)) b!824926))

(assert (= start!71120 b!824931))

(declare-fun m!767471 () Bool)

(assert (=> b!824927 m!767471))

(declare-fun m!767473 () Bool)

(assert (=> b!824927 m!767473))

(declare-fun m!767475 () Bool)

(assert (=> b!824927 m!767475))

(declare-fun m!767477 () Bool)

(assert (=> b!824929 m!767477))

(declare-fun m!767479 () Bool)

(assert (=> b!824932 m!767479))

(declare-fun m!767481 () Bool)

(assert (=> start!71120 m!767481))

(declare-fun m!767483 () Bool)

(assert (=> start!71120 m!767483))

(declare-fun m!767485 () Bool)

(assert (=> start!71120 m!767485))

(declare-fun m!767487 () Bool)

(assert (=> mapNonEmpty!23938 m!767487))

(check-sat (not b!824932) tp_is_empty!14881 (not mapNonEmpty!23938) (not b!824927) (not start!71120) (not b_next!13171) (not b!824929) b_and!22077)
(check-sat b_and!22077 (not b_next!13171))
