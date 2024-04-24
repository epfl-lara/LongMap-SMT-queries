; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70536 () Bool)

(assert start!70536)

(declare-fun b_free!12727 () Bool)

(declare-fun b_next!12727 () Bool)

(assert (=> start!70536 (= b_free!12727 (not b_next!12727))))

(declare-fun tp!44907 () Bool)

(declare-fun b_and!21549 () Bool)

(assert (=> start!70536 (= tp!44907 b_and!21549)))

(declare-fun b!818382 () Bool)

(declare-fun res!558354 () Bool)

(declare-fun e!454206 () Bool)

(assert (=> b!818382 (=> (not res!558354) (not e!454206))))

(declare-datatypes ((array!45073 0))(
  ( (array!45074 (arr!21588 (Array (_ BitVec 32) (_ BitVec 64))) (size!22008 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45073)

(declare-datatypes ((List!15268 0))(
  ( (Nil!15265) (Cons!15264 (h!16399 (_ BitVec 64)) (t!21585 List!15268)) )
))
(declare-fun arrayNoDuplicates!0 (array!45073 (_ BitVec 32) List!15268) Bool)

(assert (=> b!818382 (= res!558354 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15265))))

(declare-fun b!818383 () Bool)

(declare-fun e!454205 () Bool)

(declare-fun tp_is_empty!14437 () Bool)

(assert (=> b!818383 (= e!454205 tp_is_empty!14437)))

(declare-fun b!818384 () Bool)

(declare-fun res!558355 () Bool)

(assert (=> b!818384 (=> (not res!558355) (not e!454206))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45073 (_ BitVec 32)) Bool)

(assert (=> b!818384 (= res!558355 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!558353 () Bool)

(assert (=> start!70536 (=> (not res!558353) (not e!454206))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70536 (= res!558353 (validMask!0 mask!1312))))

(assert (=> start!70536 e!454206))

(assert (=> start!70536 tp_is_empty!14437))

(declare-fun array_inv!17295 (array!45073) Bool)

(assert (=> start!70536 (array_inv!17295 _keys!976)))

(assert (=> start!70536 true))

(declare-datatypes ((V!24251 0))(
  ( (V!24252 (val!7266 Int)) )
))
(declare-datatypes ((ValueCell!6803 0))(
  ( (ValueCellFull!6803 (v!9695 V!24251)) (EmptyCell!6803) )
))
(declare-datatypes ((array!45075 0))(
  ( (array!45076 (arr!21589 (Array (_ BitVec 32) ValueCell!6803)) (size!22009 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45075)

(declare-fun e!454208 () Bool)

(declare-fun array_inv!17296 (array!45075) Bool)

(assert (=> start!70536 (and (array_inv!17296 _values!788) e!454208)))

(assert (=> start!70536 tp!44907))

(declare-fun b!818385 () Bool)

(declare-fun e!454204 () Bool)

(assert (=> b!818385 (= e!454204 tp_is_empty!14437)))

(declare-fun mapIsEmpty!23248 () Bool)

(declare-fun mapRes!23248 () Bool)

(assert (=> mapIsEmpty!23248 mapRes!23248))

(declare-fun b!818386 () Bool)

(declare-fun res!558356 () Bool)

(assert (=> b!818386 (=> (not res!558356) (not e!454206))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818386 (= res!558356 (and (= (size!22009 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22008 _keys!976) (size!22009 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818387 () Bool)

(assert (=> b!818387 (= e!454208 (and e!454205 mapRes!23248))))

(declare-fun condMapEmpty!23248 () Bool)

(declare-fun mapDefault!23248 () ValueCell!6803)

(assert (=> b!818387 (= condMapEmpty!23248 (= (arr!21589 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6803)) mapDefault!23248)))))

(declare-fun mapNonEmpty!23248 () Bool)

(declare-fun tp!44908 () Bool)

(assert (=> mapNonEmpty!23248 (= mapRes!23248 (and tp!44908 e!454204))))

(declare-fun mapRest!23248 () (Array (_ BitVec 32) ValueCell!6803))

(declare-fun mapValue!23248 () ValueCell!6803)

(declare-fun mapKey!23248 () (_ BitVec 32))

(assert (=> mapNonEmpty!23248 (= (arr!21589 _values!788) (store mapRest!23248 mapKey!23248 mapValue!23248))))

(declare-fun b!818388 () Bool)

(assert (=> b!818388 (= e!454206 (not true))))

(declare-datatypes ((tuple2!9456 0))(
  ( (tuple2!9457 (_1!4739 (_ BitVec 64)) (_2!4739 V!24251)) )
))
(declare-datatypes ((List!15269 0))(
  ( (Nil!15266) (Cons!15265 (h!16400 tuple2!9456) (t!21586 List!15269)) )
))
(declare-datatypes ((ListLongMap!8281 0))(
  ( (ListLongMap!8282 (toList!4156 List!15269)) )
))
(declare-fun lt!366626 () ListLongMap!8281)

(declare-fun lt!366625 () ListLongMap!8281)

(assert (=> b!818388 (= lt!366626 lt!366625)))

(declare-fun zeroValueBefore!34 () V!24251)

(declare-fun minValue!754 () V!24251)

(declare-fun zeroValueAfter!34 () V!24251)

(declare-datatypes ((Unit!27867 0))(
  ( (Unit!27868) )
))
(declare-fun lt!366627 () Unit!27867)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!343 (array!45073 array!45075 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24251 V!24251 V!24251 V!24251 (_ BitVec 32) Int) Unit!27867)

(assert (=> b!818388 (= lt!366627 (lemmaNoChangeToArrayThenSameMapNoExtras!343 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2255 (array!45073 array!45075 (_ BitVec 32) (_ BitVec 32) V!24251 V!24251 (_ BitVec 32) Int) ListLongMap!8281)

(assert (=> b!818388 (= lt!366625 (getCurrentListMapNoExtraKeys!2255 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818388 (= lt!366626 (getCurrentListMapNoExtraKeys!2255 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70536 res!558353) b!818386))

(assert (= (and b!818386 res!558356) b!818384))

(assert (= (and b!818384 res!558355) b!818382))

(assert (= (and b!818382 res!558354) b!818388))

(assert (= (and b!818387 condMapEmpty!23248) mapIsEmpty!23248))

(assert (= (and b!818387 (not condMapEmpty!23248)) mapNonEmpty!23248))

(get-info :version)

(assert (= (and mapNonEmpty!23248 ((_ is ValueCellFull!6803) mapValue!23248)) b!818385))

(assert (= (and b!818387 ((_ is ValueCellFull!6803) mapDefault!23248)) b!818383))

(assert (= start!70536 b!818387))

(declare-fun m!760345 () Bool)

(assert (=> b!818382 m!760345))

(declare-fun m!760347 () Bool)

(assert (=> start!70536 m!760347))

(declare-fun m!760349 () Bool)

(assert (=> start!70536 m!760349))

(declare-fun m!760351 () Bool)

(assert (=> start!70536 m!760351))

(declare-fun m!760353 () Bool)

(assert (=> b!818384 m!760353))

(declare-fun m!760355 () Bool)

(assert (=> mapNonEmpty!23248 m!760355))

(declare-fun m!760357 () Bool)

(assert (=> b!818388 m!760357))

(declare-fun m!760359 () Bool)

(assert (=> b!818388 m!760359))

(declare-fun m!760361 () Bool)

(assert (=> b!818388 m!760361))

(check-sat (not start!70536) (not mapNonEmpty!23248) (not b_next!12727) (not b!818388) tp_is_empty!14437 b_and!21549 (not b!818384) (not b!818382))
(check-sat b_and!21549 (not b_next!12727))
