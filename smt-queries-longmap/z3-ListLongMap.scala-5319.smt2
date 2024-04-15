; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71134 () Bool)

(assert start!71134)

(declare-fun b_free!13321 () Bool)

(declare-fun b_next!13321 () Bool)

(assert (=> start!71134 (= b_free!13321 (not b_next!13321))))

(declare-fun tp!46722 () Bool)

(declare-fun b_and!22221 () Bool)

(assert (=> start!71134 (= tp!46722 b_and!22221)))

(declare-fun b!826238 () Bool)

(declare-fun res!563284 () Bool)

(declare-fun e!460089 () Bool)

(assert (=> b!826238 (=> (not res!563284) (not e!460089))))

(declare-datatypes ((array!46207 0))(
  ( (array!46208 (arr!22149 (Array (_ BitVec 32) (_ BitVec 64))) (size!22570 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46207)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46207 (_ BitVec 32)) Bool)

(assert (=> b!826238 (= res!563284 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826239 () Bool)

(declare-fun e!460088 () Bool)

(declare-datatypes ((V!25043 0))(
  ( (V!25044 (val!7563 Int)) )
))
(declare-datatypes ((tuple2!10030 0))(
  ( (tuple2!10031 (_1!5026 (_ BitVec 64)) (_2!5026 V!25043)) )
))
(declare-datatypes ((List!15821 0))(
  ( (Nil!15818) (Cons!15817 (h!16946 tuple2!10030) (t!22159 List!15821)) )
))
(declare-datatypes ((ListLongMap!8843 0))(
  ( (ListLongMap!8844 (toList!4437 List!15821)) )
))
(declare-fun lt!373783 () ListLongMap!8843)

(declare-fun zeroValueAfter!34 () V!25043)

(declare-fun lt!373782 () tuple2!10030)

(declare-fun lt!373784 () ListLongMap!8843)

(declare-fun +!1972 (ListLongMap!8843 tuple2!10030) ListLongMap!8843)

(assert (=> b!826239 (= e!460088 (= lt!373783 (+!1972 (+!1972 lt!373784 (tuple2!10031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373782)))))

(declare-fun b!826240 () Bool)

(declare-fun res!563282 () Bool)

(assert (=> b!826240 (=> (not res!563282) (not e!460089))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7100 0))(
  ( (ValueCellFull!7100 (v!9991 V!25043)) (EmptyCell!7100) )
))
(declare-datatypes ((array!46209 0))(
  ( (array!46210 (arr!22150 (Array (_ BitVec 32) ValueCell!7100)) (size!22571 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46209)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826240 (= res!563282 (and (= (size!22571 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22570 _keys!976) (size!22571 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!373789 () tuple2!10030)

(declare-fun b!826241 () Bool)

(declare-fun e!460087 () Bool)

(assert (=> b!826241 (= e!460087 (= lt!373783 (+!1972 (+!1972 lt!373784 lt!373782) lt!373789)))))

(declare-fun b!826242 () Bool)

(declare-fun e!460093 () Bool)

(assert (=> b!826242 (= e!460093 true)))

(declare-fun lt!373795 () ListLongMap!8843)

(declare-fun lt!373785 () ListLongMap!8843)

(assert (=> b!826242 (= lt!373785 (+!1972 (+!1972 lt!373795 lt!373789) lt!373782))))

(declare-fun lt!373793 () ListLongMap!8843)

(declare-fun lt!373786 () ListLongMap!8843)

(assert (=> b!826242 (and (= lt!373793 lt!373786) (= lt!373783 lt!373786) (= lt!373783 lt!373793))))

(declare-fun lt!373787 () ListLongMap!8843)

(assert (=> b!826242 (= lt!373786 (+!1972 lt!373787 lt!373789))))

(declare-fun lt!373792 () ListLongMap!8843)

(assert (=> b!826242 (= lt!373793 (+!1972 lt!373792 lt!373789))))

(declare-fun zeroValueBefore!34 () V!25043)

(declare-datatypes ((Unit!28287 0))(
  ( (Unit!28288) )
))
(declare-fun lt!373790 () Unit!28287)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!236 (ListLongMap!8843 (_ BitVec 64) V!25043 V!25043) Unit!28287)

(assert (=> b!826242 (= lt!373790 (addSameAsAddTwiceSameKeyDiffValues!236 lt!373792 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826242 e!460087))

(declare-fun res!563285 () Bool)

(assert (=> b!826242 (=> (not res!563285) (not e!460087))))

(declare-fun lt!373791 () ListLongMap!8843)

(assert (=> b!826242 (= res!563285 (= lt!373791 lt!373787))))

(declare-fun lt!373788 () tuple2!10030)

(assert (=> b!826242 (= lt!373787 (+!1972 lt!373792 lt!373788))))

(assert (=> b!826242 (= lt!373792 (+!1972 lt!373795 lt!373782))))

(assert (=> b!826242 (= lt!373789 (tuple2!10031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826242 e!460088))

(declare-fun res!563283 () Bool)

(assert (=> b!826242 (=> (not res!563283) (not e!460088))))

(assert (=> b!826242 (= res!563283 (= lt!373791 (+!1972 (+!1972 lt!373795 lt!373788) lt!373782)))))

(declare-fun minValue!754 () V!25043)

(assert (=> b!826242 (= lt!373782 (tuple2!10031 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826242 (= lt!373788 (tuple2!10031 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2519 (array!46207 array!46209 (_ BitVec 32) (_ BitVec 32) V!25043 V!25043 (_ BitVec 32) Int) ListLongMap!8843)

(assert (=> b!826242 (= lt!373783 (getCurrentListMap!2519 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826242 (= lt!373791 (getCurrentListMap!2519 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826243 () Bool)

(assert (=> b!826243 (= e!460089 (not e!460093))))

(declare-fun res!563286 () Bool)

(assert (=> b!826243 (=> res!563286 e!460093)))

(assert (=> b!826243 (= res!563286 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826243 (= lt!373795 lt!373784)))

(declare-fun lt!373794 () Unit!28287)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!564 (array!46207 array!46209 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25043 V!25043 V!25043 V!25043 (_ BitVec 32) Int) Unit!28287)

(assert (=> b!826243 (= lt!373794 (lemmaNoChangeToArrayThenSameMapNoExtras!564 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2471 (array!46207 array!46209 (_ BitVec 32) (_ BitVec 32) V!25043 V!25043 (_ BitVec 32) Int) ListLongMap!8843)

(assert (=> b!826243 (= lt!373784 (getCurrentListMapNoExtraKeys!2471 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826243 (= lt!373795 (getCurrentListMapNoExtraKeys!2471 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!563288 () Bool)

(assert (=> start!71134 (=> (not res!563288) (not e!460089))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71134 (= res!563288 (validMask!0 mask!1312))))

(assert (=> start!71134 e!460089))

(declare-fun tp_is_empty!15031 () Bool)

(assert (=> start!71134 tp_is_empty!15031))

(declare-fun array_inv!17725 (array!46207) Bool)

(assert (=> start!71134 (array_inv!17725 _keys!976)))

(assert (=> start!71134 true))

(declare-fun e!460091 () Bool)

(declare-fun array_inv!17726 (array!46209) Bool)

(assert (=> start!71134 (and (array_inv!17726 _values!788) e!460091)))

(assert (=> start!71134 tp!46722))

(declare-fun b!826244 () Bool)

(declare-fun e!460086 () Bool)

(assert (=> b!826244 (= e!460086 tp_is_empty!15031)))

(declare-fun b!826245 () Bool)

(declare-fun e!460090 () Bool)

(declare-fun mapRes!24172 () Bool)

(assert (=> b!826245 (= e!460091 (and e!460090 mapRes!24172))))

(declare-fun condMapEmpty!24172 () Bool)

(declare-fun mapDefault!24172 () ValueCell!7100)

(assert (=> b!826245 (= condMapEmpty!24172 (= (arr!22150 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7100)) mapDefault!24172)))))

(declare-fun mapNonEmpty!24172 () Bool)

(declare-fun tp!46723 () Bool)

(assert (=> mapNonEmpty!24172 (= mapRes!24172 (and tp!46723 e!460086))))

(declare-fun mapKey!24172 () (_ BitVec 32))

(declare-fun mapValue!24172 () ValueCell!7100)

(declare-fun mapRest!24172 () (Array (_ BitVec 32) ValueCell!7100))

(assert (=> mapNonEmpty!24172 (= (arr!22150 _values!788) (store mapRest!24172 mapKey!24172 mapValue!24172))))

(declare-fun b!826246 () Bool)

(declare-fun res!563287 () Bool)

(assert (=> b!826246 (=> (not res!563287) (not e!460089))))

(declare-datatypes ((List!15822 0))(
  ( (Nil!15819) (Cons!15818 (h!16947 (_ BitVec 64)) (t!22160 List!15822)) )
))
(declare-fun arrayNoDuplicates!0 (array!46207 (_ BitVec 32) List!15822) Bool)

(assert (=> b!826246 (= res!563287 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15819))))

(declare-fun b!826247 () Bool)

(assert (=> b!826247 (= e!460090 tp_is_empty!15031)))

(declare-fun mapIsEmpty!24172 () Bool)

(assert (=> mapIsEmpty!24172 mapRes!24172))

(assert (= (and start!71134 res!563288) b!826240))

(assert (= (and b!826240 res!563282) b!826238))

(assert (= (and b!826238 res!563284) b!826246))

(assert (= (and b!826246 res!563287) b!826243))

(assert (= (and b!826243 (not res!563286)) b!826242))

(assert (= (and b!826242 res!563283) b!826239))

(assert (= (and b!826242 res!563285) b!826241))

(assert (= (and b!826245 condMapEmpty!24172) mapIsEmpty!24172))

(assert (= (and b!826245 (not condMapEmpty!24172)) mapNonEmpty!24172))

(get-info :version)

(assert (= (and mapNonEmpty!24172 ((_ is ValueCellFull!7100) mapValue!24172)) b!826244))

(assert (= (and b!826245 ((_ is ValueCellFull!7100) mapDefault!24172)) b!826247))

(assert (= start!71134 b!826245))

(declare-fun m!768499 () Bool)

(assert (=> start!71134 m!768499))

(declare-fun m!768501 () Bool)

(assert (=> start!71134 m!768501))

(declare-fun m!768503 () Bool)

(assert (=> start!71134 m!768503))

(declare-fun m!768505 () Bool)

(assert (=> b!826238 m!768505))

(declare-fun m!768507 () Bool)

(assert (=> b!826246 m!768507))

(declare-fun m!768509 () Bool)

(assert (=> mapNonEmpty!24172 m!768509))

(declare-fun m!768511 () Bool)

(assert (=> b!826242 m!768511))

(declare-fun m!768513 () Bool)

(assert (=> b!826242 m!768513))

(declare-fun m!768515 () Bool)

(assert (=> b!826242 m!768515))

(declare-fun m!768517 () Bool)

(assert (=> b!826242 m!768517))

(declare-fun m!768519 () Bool)

(assert (=> b!826242 m!768519))

(declare-fun m!768521 () Bool)

(assert (=> b!826242 m!768521))

(declare-fun m!768523 () Bool)

(assert (=> b!826242 m!768523))

(declare-fun m!768525 () Bool)

(assert (=> b!826242 m!768525))

(declare-fun m!768527 () Bool)

(assert (=> b!826242 m!768527))

(declare-fun m!768529 () Bool)

(assert (=> b!826242 m!768529))

(assert (=> b!826242 m!768517))

(assert (=> b!826242 m!768513))

(declare-fun m!768531 () Bool)

(assert (=> b!826242 m!768531))

(declare-fun m!768533 () Bool)

(assert (=> b!826241 m!768533))

(assert (=> b!826241 m!768533))

(declare-fun m!768535 () Bool)

(assert (=> b!826241 m!768535))

(declare-fun m!768537 () Bool)

(assert (=> b!826239 m!768537))

(assert (=> b!826239 m!768537))

(declare-fun m!768539 () Bool)

(assert (=> b!826239 m!768539))

(declare-fun m!768541 () Bool)

(assert (=> b!826243 m!768541))

(declare-fun m!768543 () Bool)

(assert (=> b!826243 m!768543))

(declare-fun m!768545 () Bool)

(assert (=> b!826243 m!768545))

(check-sat (not start!71134) (not b!826238) (not b!826239) (not b!826241) (not b_next!13321) (not b!826242) (not b!826243) b_and!22221 (not mapNonEmpty!24172) (not b!826246) tp_is_empty!15031)
(check-sat b_and!22221 (not b_next!13321))
