; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70222 () Bool)

(assert start!70222)

(declare-fun b_free!12615 () Bool)

(declare-fun b_next!12615 () Bool)

(assert (=> start!70222 (= b_free!12615 (not b_next!12615))))

(declare-fun tp!44565 () Bool)

(declare-fun b_and!21403 () Bool)

(assert (=> start!70222 (= tp!44565 b_and!21403)))

(declare-fun b!815823 () Bool)

(declare-fun res!557053 () Bool)

(declare-fun e!452450 () Bool)

(assert (=> b!815823 (=> (not res!557053) (not e!452450))))

(declare-datatypes ((array!44850 0))(
  ( (array!44851 (arr!21483 (Array (_ BitVec 32) (_ BitVec 64))) (size!21904 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44850)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44850 (_ BitVec 32)) Bool)

(assert (=> b!815823 (= res!557053 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!815824 () Bool)

(declare-fun e!452445 () Bool)

(declare-fun e!452448 () Bool)

(declare-fun mapRes!23074 () Bool)

(assert (=> b!815824 (= e!452445 (and e!452448 mapRes!23074))))

(declare-fun condMapEmpty!23074 () Bool)

(declare-datatypes ((V!24101 0))(
  ( (V!24102 (val!7210 Int)) )
))
(declare-datatypes ((ValueCell!6747 0))(
  ( (ValueCellFull!6747 (v!9637 V!24101)) (EmptyCell!6747) )
))
(declare-datatypes ((array!44852 0))(
  ( (array!44853 (arr!21484 (Array (_ BitVec 32) ValueCell!6747)) (size!21905 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44852)

(declare-fun mapDefault!23074 () ValueCell!6747)

(assert (=> b!815824 (= condMapEmpty!23074 (= (arr!21484 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6747)) mapDefault!23074)))))

(declare-fun b!815825 () Bool)

(declare-fun tp_is_empty!14325 () Bool)

(assert (=> b!815825 (= e!452448 tp_is_empty!14325)))

(declare-fun b!815826 () Bool)

(declare-fun res!557051 () Bool)

(assert (=> b!815826 (=> (not res!557051) (not e!452450))))

(declare-datatypes ((List!15293 0))(
  ( (Nil!15290) (Cons!15289 (h!16418 (_ BitVec 64)) (t!21614 List!15293)) )
))
(declare-fun arrayNoDuplicates!0 (array!44850 (_ BitVec 32) List!15293) Bool)

(assert (=> b!815826 (= res!557051 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15290))))

(declare-fun b!815827 () Bool)

(declare-fun e!452447 () Bool)

(assert (=> b!815827 (= e!452447 true)))

(declare-datatypes ((tuple2!9462 0))(
  ( (tuple2!9463 (_1!4742 (_ BitVec 64)) (_2!4742 V!24101)) )
))
(declare-datatypes ((List!15294 0))(
  ( (Nil!15291) (Cons!15290 (h!16419 tuple2!9462) (t!21615 List!15294)) )
))
(declare-datatypes ((ListLongMap!8285 0))(
  ( (ListLongMap!8286 (toList!4158 List!15294)) )
))
(declare-fun lt!365285 () ListLongMap!8285)

(declare-fun zeroValueAfter!34 () V!24101)

(declare-fun minValue!754 () V!24101)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2386 (array!44850 array!44852 (_ BitVec 32) (_ BitVec 32) V!24101 V!24101 (_ BitVec 32) Int) ListLongMap!8285)

(assert (=> b!815827 (= lt!365285 (getCurrentListMap!2386 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24101)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!365282 () ListLongMap!8285)

(declare-fun +!1792 (ListLongMap!8285 tuple2!9462) ListLongMap!8285)

(assert (=> b!815827 (= lt!365282 (+!1792 (getCurrentListMap!2386 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9463 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun mapIsEmpty!23074 () Bool)

(assert (=> mapIsEmpty!23074 mapRes!23074))

(declare-fun b!815828 () Bool)

(declare-fun e!452446 () Bool)

(assert (=> b!815828 (= e!452446 tp_is_empty!14325)))

(declare-fun b!815829 () Bool)

(assert (=> b!815829 (= e!452450 (not e!452447))))

(declare-fun res!557054 () Bool)

(assert (=> b!815829 (=> res!557054 e!452447)))

(assert (=> b!815829 (= res!557054 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!365281 () ListLongMap!8285)

(declare-fun lt!365283 () ListLongMap!8285)

(assert (=> b!815829 (= lt!365281 lt!365283)))

(declare-datatypes ((Unit!27810 0))(
  ( (Unit!27811) )
))
(declare-fun lt!365284 () Unit!27810)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!316 (array!44850 array!44852 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24101 V!24101 V!24101 V!24101 (_ BitVec 32) Int) Unit!27810)

(assert (=> b!815829 (= lt!365284 (lemmaNoChangeToArrayThenSameMapNoExtras!316 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2206 (array!44850 array!44852 (_ BitVec 32) (_ BitVec 32) V!24101 V!24101 (_ BitVec 32) Int) ListLongMap!8285)

(assert (=> b!815829 (= lt!365283 (getCurrentListMapNoExtraKeys!2206 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815829 (= lt!365281 (getCurrentListMapNoExtraKeys!2206 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!557052 () Bool)

(assert (=> start!70222 (=> (not res!557052) (not e!452450))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70222 (= res!557052 (validMask!0 mask!1312))))

(assert (=> start!70222 e!452450))

(assert (=> start!70222 tp_is_empty!14325))

(declare-fun array_inv!17191 (array!44850) Bool)

(assert (=> start!70222 (array_inv!17191 _keys!976)))

(assert (=> start!70222 true))

(declare-fun array_inv!17192 (array!44852) Bool)

(assert (=> start!70222 (and (array_inv!17192 _values!788) e!452445)))

(assert (=> start!70222 tp!44565))

(declare-fun b!815830 () Bool)

(declare-fun res!557050 () Bool)

(assert (=> b!815830 (=> (not res!557050) (not e!452450))))

(assert (=> b!815830 (= res!557050 (and (= (size!21905 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21904 _keys!976) (size!21905 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23074 () Bool)

(declare-fun tp!44566 () Bool)

(assert (=> mapNonEmpty!23074 (= mapRes!23074 (and tp!44566 e!452446))))

(declare-fun mapValue!23074 () ValueCell!6747)

(declare-fun mapKey!23074 () (_ BitVec 32))

(declare-fun mapRest!23074 () (Array (_ BitVec 32) ValueCell!6747))

(assert (=> mapNonEmpty!23074 (= (arr!21484 _values!788) (store mapRest!23074 mapKey!23074 mapValue!23074))))

(assert (= (and start!70222 res!557052) b!815830))

(assert (= (and b!815830 res!557050) b!815823))

(assert (= (and b!815823 res!557053) b!815826))

(assert (= (and b!815826 res!557051) b!815829))

(assert (= (and b!815829 (not res!557054)) b!815827))

(assert (= (and b!815824 condMapEmpty!23074) mapIsEmpty!23074))

(assert (= (and b!815824 (not condMapEmpty!23074)) mapNonEmpty!23074))

(get-info :version)

(assert (= (and mapNonEmpty!23074 ((_ is ValueCellFull!6747) mapValue!23074)) b!815828))

(assert (= (and b!815824 ((_ is ValueCellFull!6747) mapDefault!23074)) b!815825))

(assert (= start!70222 b!815824))

(declare-fun m!757469 () Bool)

(assert (=> start!70222 m!757469))

(declare-fun m!757471 () Bool)

(assert (=> start!70222 m!757471))

(declare-fun m!757473 () Bool)

(assert (=> start!70222 m!757473))

(declare-fun m!757475 () Bool)

(assert (=> b!815823 m!757475))

(declare-fun m!757477 () Bool)

(assert (=> b!815827 m!757477))

(declare-fun m!757479 () Bool)

(assert (=> b!815827 m!757479))

(assert (=> b!815827 m!757479))

(declare-fun m!757481 () Bool)

(assert (=> b!815827 m!757481))

(declare-fun m!757483 () Bool)

(assert (=> b!815829 m!757483))

(declare-fun m!757485 () Bool)

(assert (=> b!815829 m!757485))

(declare-fun m!757487 () Bool)

(assert (=> b!815829 m!757487))

(declare-fun m!757489 () Bool)

(assert (=> b!815826 m!757489))

(declare-fun m!757491 () Bool)

(assert (=> mapNonEmpty!23074 m!757491))

(check-sat (not b!815823) (not b!815826) (not start!70222) b_and!21403 tp_is_empty!14325 (not b!815827) (not b_next!12615) (not mapNonEmpty!23074) (not b!815829))
(check-sat b_and!21403 (not b_next!12615))
