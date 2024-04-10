; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70136 () Bool)

(assert start!70136)

(declare-fun b_free!12543 () Bool)

(declare-fun b_next!12543 () Bool)

(assert (=> start!70136 (= b_free!12543 (not b_next!12543))))

(declare-fun tp!44347 () Bool)

(declare-fun b_and!21323 () Bool)

(assert (=> start!70136 (= tp!44347 b_and!21323)))

(declare-fun mapIsEmpty!22963 () Bool)

(declare-fun mapRes!22963 () Bool)

(assert (=> mapIsEmpty!22963 mapRes!22963))

(declare-fun b!814941 () Bool)

(declare-fun res!556548 () Bool)

(declare-fun e!451811 () Bool)

(assert (=> b!814941 (=> (not res!556548) (not e!451811))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24005 0))(
  ( (V!24006 (val!7174 Int)) )
))
(declare-datatypes ((ValueCell!6711 0))(
  ( (ValueCellFull!6711 (v!9601 V!24005)) (EmptyCell!6711) )
))
(declare-datatypes ((array!44710 0))(
  ( (array!44711 (arr!21414 (Array (_ BitVec 32) ValueCell!6711)) (size!21835 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44710)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!44712 0))(
  ( (array!44713 (arr!21415 (Array (_ BitVec 32) (_ BitVec 64))) (size!21836 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44712)

(assert (=> b!814941 (= res!556548 (and (= (size!21835 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21836 _keys!976) (size!21835 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22963 () Bool)

(declare-fun tp!44346 () Bool)

(declare-fun e!451809 () Bool)

(assert (=> mapNonEmpty!22963 (= mapRes!22963 (and tp!44346 e!451809))))

(declare-fun mapRest!22963 () (Array (_ BitVec 32) ValueCell!6711))

(declare-fun mapValue!22963 () ValueCell!6711)

(declare-fun mapKey!22963 () (_ BitVec 32))

(assert (=> mapNonEmpty!22963 (= (arr!21414 _values!788) (store mapRest!22963 mapKey!22963 mapValue!22963))))

(declare-fun b!814942 () Bool)

(declare-fun res!556549 () Bool)

(assert (=> b!814942 (=> (not res!556549) (not e!451811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44712 (_ BitVec 32)) Bool)

(assert (=> b!814942 (= res!556549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814943 () Bool)

(declare-fun res!556547 () Bool)

(assert (=> b!814943 (=> (not res!556547) (not e!451811))))

(declare-datatypes ((List!15236 0))(
  ( (Nil!15233) (Cons!15232 (h!16361 (_ BitVec 64)) (t!21555 List!15236)) )
))
(declare-fun arrayNoDuplicates!0 (array!44712 (_ BitVec 32) List!15236) Bool)

(assert (=> b!814943 (= res!556547 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15233))))

(declare-fun b!814945 () Bool)

(declare-fun e!451813 () Bool)

(declare-fun tp_is_empty!14253 () Bool)

(assert (=> b!814945 (= e!451813 tp_is_empty!14253)))

(declare-fun b!814944 () Bool)

(declare-fun e!451810 () Bool)

(assert (=> b!814944 (= e!451810 (and e!451813 mapRes!22963))))

(declare-fun condMapEmpty!22963 () Bool)

(declare-fun mapDefault!22963 () ValueCell!6711)

(assert (=> b!814944 (= condMapEmpty!22963 (= (arr!21414 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6711)) mapDefault!22963)))))

(declare-fun res!556546 () Bool)

(assert (=> start!70136 (=> (not res!556546) (not e!451811))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70136 (= res!556546 (validMask!0 mask!1312))))

(assert (=> start!70136 e!451811))

(assert (=> start!70136 tp_is_empty!14253))

(declare-fun array_inv!17133 (array!44712) Bool)

(assert (=> start!70136 (array_inv!17133 _keys!976)))

(assert (=> start!70136 true))

(declare-fun array_inv!17134 (array!44710) Bool)

(assert (=> start!70136 (and (array_inv!17134 _values!788) e!451810)))

(assert (=> start!70136 tp!44347))

(declare-fun b!814946 () Bool)

(assert (=> b!814946 (= e!451809 tp_is_empty!14253)))

(declare-fun b!814947 () Bool)

(assert (=> b!814947 (= e!451811 (not true))))

(declare-datatypes ((tuple2!9404 0))(
  ( (tuple2!9405 (_1!4713 (_ BitVec 64)) (_2!4713 V!24005)) )
))
(declare-datatypes ((List!15237 0))(
  ( (Nil!15234) (Cons!15233 (h!16362 tuple2!9404) (t!21556 List!15237)) )
))
(declare-datatypes ((ListLongMap!8227 0))(
  ( (ListLongMap!8228 (toList!4129 List!15237)) )
))
(declare-fun lt!364837 () ListLongMap!8227)

(declare-fun lt!364836 () ListLongMap!8227)

(assert (=> b!814947 (= lt!364837 lt!364836)))

(declare-fun zeroValueBefore!34 () V!24005)

(declare-fun zeroValueAfter!34 () V!24005)

(declare-fun minValue!754 () V!24005)

(declare-datatypes ((Unit!27756 0))(
  ( (Unit!27757) )
))
(declare-fun lt!364835 () Unit!27756)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!289 (array!44712 array!44710 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24005 V!24005 V!24005 V!24005 (_ BitVec 32) Int) Unit!27756)

(assert (=> b!814947 (= lt!364835 (lemmaNoChangeToArrayThenSameMapNoExtras!289 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2179 (array!44712 array!44710 (_ BitVec 32) (_ BitVec 32) V!24005 V!24005 (_ BitVec 32) Int) ListLongMap!8227)

(assert (=> b!814947 (= lt!364836 (getCurrentListMapNoExtraKeys!2179 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814947 (= lt!364837 (getCurrentListMapNoExtraKeys!2179 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70136 res!556546) b!814941))

(assert (= (and b!814941 res!556548) b!814942))

(assert (= (and b!814942 res!556549) b!814943))

(assert (= (and b!814943 res!556547) b!814947))

(assert (= (and b!814944 condMapEmpty!22963) mapIsEmpty!22963))

(assert (= (and b!814944 (not condMapEmpty!22963)) mapNonEmpty!22963))

(get-info :version)

(assert (= (and mapNonEmpty!22963 ((_ is ValueCellFull!6711) mapValue!22963)) b!814946))

(assert (= (and b!814944 ((_ is ValueCellFull!6711) mapDefault!22963)) b!814945))

(assert (= start!70136 b!814944))

(declare-fun m!756677 () Bool)

(assert (=> b!814942 m!756677))

(declare-fun m!756679 () Bool)

(assert (=> b!814943 m!756679))

(declare-fun m!756681 () Bool)

(assert (=> b!814947 m!756681))

(declare-fun m!756683 () Bool)

(assert (=> b!814947 m!756683))

(declare-fun m!756685 () Bool)

(assert (=> b!814947 m!756685))

(declare-fun m!756687 () Bool)

(assert (=> mapNonEmpty!22963 m!756687))

(declare-fun m!756689 () Bool)

(assert (=> start!70136 m!756689))

(declare-fun m!756691 () Bool)

(assert (=> start!70136 m!756691))

(declare-fun m!756693 () Bool)

(assert (=> start!70136 m!756693))

(check-sat b_and!21323 (not start!70136) (not b!814943) tp_is_empty!14253 (not b!814942) (not b_next!12543) (not b!814947) (not mapNonEmpty!22963))
(check-sat b_and!21323 (not b_next!12543))
