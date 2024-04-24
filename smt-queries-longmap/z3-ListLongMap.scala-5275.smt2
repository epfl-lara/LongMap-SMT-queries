; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70966 () Bool)

(assert start!70966)

(declare-fun b_free!13057 () Bool)

(declare-fun b_next!13057 () Bool)

(assert (=> start!70966 (= b_free!13057 (not b_next!13057))))

(declare-fun tp!45915 () Bool)

(declare-fun b_and!21939 () Bool)

(assert (=> start!70966 (= tp!45915 b_and!21939)))

(declare-fun mapIsEmpty!23761 () Bool)

(declare-fun mapRes!23761 () Bool)

(assert (=> mapIsEmpty!23761 mapRes!23761))

(declare-fun b!823252 () Bool)

(declare-fun e!457779 () Bool)

(assert (=> b!823252 (= e!457779 true)))

(declare-datatypes ((V!24691 0))(
  ( (V!24692 (val!7431 Int)) )
))
(declare-datatypes ((tuple2!9734 0))(
  ( (tuple2!9735 (_1!4878 (_ BitVec 64)) (_2!4878 V!24691)) )
))
(declare-datatypes ((List!15521 0))(
  ( (Nil!15518) (Cons!15517 (h!16652 tuple2!9734) (t!21850 List!15521)) )
))
(declare-datatypes ((ListLongMap!8559 0))(
  ( (ListLongMap!8560 (toList!4295 List!15521)) )
))
(declare-fun lt!370363 () ListLongMap!8559)

(declare-fun lt!370368 () ListLongMap!8559)

(declare-fun lt!370362 () tuple2!9734)

(declare-fun +!1885 (ListLongMap!8559 tuple2!9734) ListLongMap!8559)

(assert (=> b!823252 (= lt!370363 (+!1885 lt!370368 lt!370362))))

(declare-fun zeroValueAfter!34 () V!24691)

(declare-fun minValue!754 () V!24691)

(declare-fun lt!370367 () ListLongMap!8559)

(declare-datatypes ((Unit!28139 0))(
  ( (Unit!28140) )
))
(declare-fun lt!370370 () Unit!28139)

(declare-fun addCommutativeForDiffKeys!443 (ListLongMap!8559 (_ BitVec 64) V!24691 (_ BitVec 64) V!24691) Unit!28139)

(assert (=> b!823252 (= lt!370370 (addCommutativeForDiffKeys!443 lt!370367 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370371 () ListLongMap!8559)

(assert (=> b!823252 (= lt!370371 lt!370363)))

(declare-fun lt!370364 () tuple2!9734)

(assert (=> b!823252 (= lt!370363 (+!1885 (+!1885 lt!370367 lt!370362) lt!370364))))

(assert (=> b!823252 (= lt!370362 (tuple2!9735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370365 () ListLongMap!8559)

(assert (=> b!823252 (= lt!370365 lt!370368)))

(assert (=> b!823252 (= lt!370368 (+!1885 lt!370367 lt!370364))))

(assert (=> b!823252 (= lt!370364 (tuple2!9735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45729 0))(
  ( (array!45730 (arr!21910 (Array (_ BitVec 32) (_ BitVec 64))) (size!22330 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45729)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((ValueCell!6968 0))(
  ( (ValueCellFull!6968 (v!9862 V!24691)) (EmptyCell!6968) )
))
(declare-datatypes ((array!45731 0))(
  ( (array!45732 (arr!21911 (Array (_ BitVec 32) ValueCell!6968)) (size!22331 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45731)

(declare-fun getCurrentListMap!2449 (array!45729 array!45731 (_ BitVec 32) (_ BitVec 32) V!24691 V!24691 (_ BitVec 32) Int) ListLongMap!8559)

(assert (=> b!823252 (= lt!370371 (getCurrentListMap!2449 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24691)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!823252 (= lt!370365 (getCurrentListMap!2449 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823253 () Bool)

(declare-fun e!457780 () Bool)

(declare-fun tp_is_empty!14767 () Bool)

(assert (=> b!823253 (= e!457780 tp_is_empty!14767)))

(declare-fun b!823255 () Bool)

(declare-fun e!457776 () Bool)

(assert (=> b!823255 (= e!457776 tp_is_empty!14767)))

(declare-fun b!823256 () Bool)

(declare-fun e!457781 () Bool)

(assert (=> b!823256 (= e!457781 (not e!457779))))

(declare-fun res!561249 () Bool)

(assert (=> b!823256 (=> res!561249 e!457779)))

(assert (=> b!823256 (= res!561249 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370369 () ListLongMap!8559)

(assert (=> b!823256 (= lt!370367 lt!370369)))

(declare-fun lt!370366 () Unit!28139)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!470 (array!45729 array!45731 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24691 V!24691 V!24691 V!24691 (_ BitVec 32) Int) Unit!28139)

(assert (=> b!823256 (= lt!370366 (lemmaNoChangeToArrayThenSameMapNoExtras!470 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2382 (array!45729 array!45731 (_ BitVec 32) (_ BitVec 32) V!24691 V!24691 (_ BitVec 32) Int) ListLongMap!8559)

(assert (=> b!823256 (= lt!370369 (getCurrentListMapNoExtraKeys!2382 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!823256 (= lt!370367 (getCurrentListMapNoExtraKeys!2382 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!823257 () Bool)

(declare-fun res!561250 () Bool)

(assert (=> b!823257 (=> (not res!561250) (not e!457781))))

(assert (=> b!823257 (= res!561250 (and (= (size!22331 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22330 _keys!976) (size!22331 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23761 () Bool)

(declare-fun tp!45916 () Bool)

(assert (=> mapNonEmpty!23761 (= mapRes!23761 (and tp!45916 e!457780))))

(declare-fun mapValue!23761 () ValueCell!6968)

(declare-fun mapKey!23761 () (_ BitVec 32))

(declare-fun mapRest!23761 () (Array (_ BitVec 32) ValueCell!6968))

(assert (=> mapNonEmpty!23761 (= (arr!21911 _values!788) (store mapRest!23761 mapKey!23761 mapValue!23761))))

(declare-fun res!561247 () Bool)

(assert (=> start!70966 (=> (not res!561247) (not e!457781))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70966 (= res!561247 (validMask!0 mask!1312))))

(assert (=> start!70966 e!457781))

(assert (=> start!70966 tp_is_empty!14767))

(declare-fun array_inv!17531 (array!45729) Bool)

(assert (=> start!70966 (array_inv!17531 _keys!976)))

(assert (=> start!70966 true))

(declare-fun e!457777 () Bool)

(declare-fun array_inv!17532 (array!45731) Bool)

(assert (=> start!70966 (and (array_inv!17532 _values!788) e!457777)))

(assert (=> start!70966 tp!45915))

(declare-fun b!823254 () Bool)

(assert (=> b!823254 (= e!457777 (and e!457776 mapRes!23761))))

(declare-fun condMapEmpty!23761 () Bool)

(declare-fun mapDefault!23761 () ValueCell!6968)

(assert (=> b!823254 (= condMapEmpty!23761 (= (arr!21911 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6968)) mapDefault!23761)))))

(declare-fun b!823258 () Bool)

(declare-fun res!561248 () Bool)

(assert (=> b!823258 (=> (not res!561248) (not e!457781))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45729 (_ BitVec 32)) Bool)

(assert (=> b!823258 (= res!561248 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!823259 () Bool)

(declare-fun res!561246 () Bool)

(assert (=> b!823259 (=> (not res!561246) (not e!457781))))

(declare-datatypes ((List!15522 0))(
  ( (Nil!15519) (Cons!15518 (h!16653 (_ BitVec 64)) (t!21851 List!15522)) )
))
(declare-fun arrayNoDuplicates!0 (array!45729 (_ BitVec 32) List!15522) Bool)

(assert (=> b!823259 (= res!561246 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15519))))

(assert (= (and start!70966 res!561247) b!823257))

(assert (= (and b!823257 res!561250) b!823258))

(assert (= (and b!823258 res!561248) b!823259))

(assert (= (and b!823259 res!561246) b!823256))

(assert (= (and b!823256 (not res!561249)) b!823252))

(assert (= (and b!823254 condMapEmpty!23761) mapIsEmpty!23761))

(assert (= (and b!823254 (not condMapEmpty!23761)) mapNonEmpty!23761))

(get-info :version)

(assert (= (and mapNonEmpty!23761 ((_ is ValueCellFull!6968) mapValue!23761)) b!823253))

(assert (= (and b!823254 ((_ is ValueCellFull!6968) mapDefault!23761)) b!823255))

(assert (= start!70966 b!823254))

(declare-fun m!765467 () Bool)

(assert (=> start!70966 m!765467))

(declare-fun m!765469 () Bool)

(assert (=> start!70966 m!765469))

(declare-fun m!765471 () Bool)

(assert (=> start!70966 m!765471))

(declare-fun m!765473 () Bool)

(assert (=> b!823256 m!765473))

(declare-fun m!765475 () Bool)

(assert (=> b!823256 m!765475))

(declare-fun m!765477 () Bool)

(assert (=> b!823256 m!765477))

(declare-fun m!765479 () Bool)

(assert (=> b!823259 m!765479))

(declare-fun m!765481 () Bool)

(assert (=> b!823258 m!765481))

(declare-fun m!765483 () Bool)

(assert (=> mapNonEmpty!23761 m!765483))

(declare-fun m!765485 () Bool)

(assert (=> b!823252 m!765485))

(declare-fun m!765487 () Bool)

(assert (=> b!823252 m!765487))

(declare-fun m!765489 () Bool)

(assert (=> b!823252 m!765489))

(declare-fun m!765491 () Bool)

(assert (=> b!823252 m!765491))

(declare-fun m!765493 () Bool)

(assert (=> b!823252 m!765493))

(declare-fun m!765495 () Bool)

(assert (=> b!823252 m!765495))

(assert (=> b!823252 m!765491))

(declare-fun m!765497 () Bool)

(assert (=> b!823252 m!765497))

(check-sat (not b!823256) (not b!823259) (not b!823258) (not start!70966) (not b!823252) b_and!21939 (not mapNonEmpty!23761) (not b_next!13057) tp_is_empty!14767)
(check-sat b_and!21939 (not b_next!13057))
