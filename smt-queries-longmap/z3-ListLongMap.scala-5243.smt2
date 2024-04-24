; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70724 () Bool)

(assert start!70724)

(declare-fun b_free!12865 () Bool)

(declare-fun b_next!12865 () Bool)

(assert (=> start!70724 (= b_free!12865 (not b_next!12865))))

(declare-fun tp!45330 () Bool)

(declare-fun b_and!21717 () Bool)

(assert (=> start!70724 (= tp!45330 b_and!21717)))

(declare-fun b!820523 () Bool)

(declare-fun res!559632 () Bool)

(declare-fun e!455777 () Bool)

(assert (=> b!820523 (=> (not res!559632) (not e!455777))))

(declare-datatypes ((array!45351 0))(
  ( (array!45352 (arr!21724 (Array (_ BitVec 32) (_ BitVec 64))) (size!22144 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45351)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45351 (_ BitVec 32)) Bool)

(assert (=> b!820523 (= res!559632 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820524 () Bool)

(declare-fun e!455783 () Bool)

(declare-fun tp_is_empty!14575 () Bool)

(assert (=> b!820524 (= e!455783 tp_is_empty!14575)))

(declare-fun res!559628 () Bool)

(assert (=> start!70724 (=> (not res!559628) (not e!455777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70724 (= res!559628 (validMask!0 mask!1312))))

(assert (=> start!70724 e!455777))

(assert (=> start!70724 tp_is_empty!14575))

(declare-fun array_inv!17395 (array!45351) Bool)

(assert (=> start!70724 (array_inv!17395 _keys!976)))

(assert (=> start!70724 true))

(declare-datatypes ((V!24435 0))(
  ( (V!24436 (val!7335 Int)) )
))
(declare-datatypes ((ValueCell!6872 0))(
  ( (ValueCellFull!6872 (v!9765 V!24435)) (EmptyCell!6872) )
))
(declare-datatypes ((array!45353 0))(
  ( (array!45354 (arr!21725 (Array (_ BitVec 32) ValueCell!6872)) (size!22145 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45353)

(declare-fun e!455782 () Bool)

(declare-fun array_inv!17396 (array!45353) Bool)

(assert (=> start!70724 (and (array_inv!17396 _values!788) e!455782)))

(assert (=> start!70724 tp!45330))

(declare-fun b!820525 () Bool)

(declare-fun e!455780 () Bool)

(assert (=> b!820525 (= e!455777 (not e!455780))))

(declare-fun res!559627 () Bool)

(assert (=> b!820525 (=> res!559627 e!455780)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820525 (= res!559627 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9566 0))(
  ( (tuple2!9567 (_1!4794 (_ BitVec 64)) (_2!4794 V!24435)) )
))
(declare-datatypes ((List!15370 0))(
  ( (Nil!15367) (Cons!15366 (h!16501 tuple2!9566) (t!21693 List!15370)) )
))
(declare-datatypes ((ListLongMap!8391 0))(
  ( (ListLongMap!8392 (toList!4211 List!15370)) )
))
(declare-fun lt!368280 () ListLongMap!8391)

(declare-fun lt!368271 () ListLongMap!8391)

(assert (=> b!820525 (= lt!368280 lt!368271)))

(declare-fun zeroValueBefore!34 () V!24435)

(declare-datatypes ((Unit!27972 0))(
  ( (Unit!27973) )
))
(declare-fun lt!368275 () Unit!27972)

(declare-fun zeroValueAfter!34 () V!24435)

(declare-fun minValue!754 () V!24435)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!393 (array!45351 array!45353 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24435 V!24435 V!24435 V!24435 (_ BitVec 32) Int) Unit!27972)

(assert (=> b!820525 (= lt!368275 (lemmaNoChangeToArrayThenSameMapNoExtras!393 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2305 (array!45351 array!45353 (_ BitVec 32) (_ BitVec 32) V!24435 V!24435 (_ BitVec 32) Int) ListLongMap!8391)

(assert (=> b!820525 (= lt!368271 (getCurrentListMapNoExtraKeys!2305 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820525 (= lt!368280 (getCurrentListMapNoExtraKeys!2305 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820526 () Bool)

(declare-fun e!455781 () Bool)

(declare-fun lt!368277 () ListLongMap!8391)

(declare-fun +!1847 (ListLongMap!8391 tuple2!9566) ListLongMap!8391)

(assert (=> b!820526 (= e!455781 (= lt!368277 (+!1847 lt!368271 (tuple2!9567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820527 () Bool)

(assert (=> b!820527 (= e!455780 true)))

(declare-fun lt!368279 () tuple2!9566)

(declare-fun lt!368273 () ListLongMap!8391)

(declare-fun lt!368278 () tuple2!9566)

(assert (=> b!820527 (= lt!368273 (+!1847 (+!1847 lt!368271 lt!368279) lt!368278))))

(declare-fun lt!368272 () ListLongMap!8391)

(assert (=> b!820527 (= (+!1847 lt!368280 lt!368278) (+!1847 lt!368272 lt!368278))))

(declare-fun lt!368276 () Unit!27972)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!185 (ListLongMap!8391 (_ BitVec 64) V!24435 V!24435) Unit!27972)

(assert (=> b!820527 (= lt!368276 (addSameAsAddTwiceSameKeyDiffValues!185 lt!368280 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820527 (= lt!368278 (tuple2!9567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820527 e!455781))

(declare-fun res!559629 () Bool)

(assert (=> b!820527 (=> (not res!559629) (not e!455781))))

(declare-fun lt!368274 () ListLongMap!8391)

(assert (=> b!820527 (= res!559629 (= lt!368274 lt!368272))))

(assert (=> b!820527 (= lt!368272 (+!1847 lt!368280 lt!368279))))

(assert (=> b!820527 (= lt!368279 (tuple2!9567 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2398 (array!45351 array!45353 (_ BitVec 32) (_ BitVec 32) V!24435 V!24435 (_ BitVec 32) Int) ListLongMap!8391)

(assert (=> b!820527 (= lt!368277 (getCurrentListMap!2398 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820527 (= lt!368274 (getCurrentListMap!2398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820528 () Bool)

(declare-fun res!559631 () Bool)

(assert (=> b!820528 (=> (not res!559631) (not e!455777))))

(assert (=> b!820528 (= res!559631 (and (= (size!22145 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22144 _keys!976) (size!22145 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23464 () Bool)

(declare-fun mapRes!23464 () Bool)

(assert (=> mapIsEmpty!23464 mapRes!23464))

(declare-fun b!820529 () Bool)

(declare-fun res!559630 () Bool)

(assert (=> b!820529 (=> (not res!559630) (not e!455777))))

(declare-datatypes ((List!15371 0))(
  ( (Nil!15368) (Cons!15367 (h!16502 (_ BitVec 64)) (t!21694 List!15371)) )
))
(declare-fun arrayNoDuplicates!0 (array!45351 (_ BitVec 32) List!15371) Bool)

(assert (=> b!820529 (= res!559630 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15368))))

(declare-fun b!820530 () Bool)

(assert (=> b!820530 (= e!455782 (and e!455783 mapRes!23464))))

(declare-fun condMapEmpty!23464 () Bool)

(declare-fun mapDefault!23464 () ValueCell!6872)

(assert (=> b!820530 (= condMapEmpty!23464 (= (arr!21725 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6872)) mapDefault!23464)))))

(declare-fun b!820531 () Bool)

(declare-fun e!455778 () Bool)

(assert (=> b!820531 (= e!455778 tp_is_empty!14575)))

(declare-fun mapNonEmpty!23464 () Bool)

(declare-fun tp!45331 () Bool)

(assert (=> mapNonEmpty!23464 (= mapRes!23464 (and tp!45331 e!455778))))

(declare-fun mapValue!23464 () ValueCell!6872)

(declare-fun mapRest!23464 () (Array (_ BitVec 32) ValueCell!6872))

(declare-fun mapKey!23464 () (_ BitVec 32))

(assert (=> mapNonEmpty!23464 (= (arr!21725 _values!788) (store mapRest!23464 mapKey!23464 mapValue!23464))))

(assert (= (and start!70724 res!559628) b!820528))

(assert (= (and b!820528 res!559631) b!820523))

(assert (= (and b!820523 res!559632) b!820529))

(assert (= (and b!820529 res!559630) b!820525))

(assert (= (and b!820525 (not res!559627)) b!820527))

(assert (= (and b!820527 res!559629) b!820526))

(assert (= (and b!820530 condMapEmpty!23464) mapIsEmpty!23464))

(assert (= (and b!820530 (not condMapEmpty!23464)) mapNonEmpty!23464))

(get-info :version)

(assert (= (and mapNonEmpty!23464 ((_ is ValueCellFull!6872) mapValue!23464)) b!820531))

(assert (= (and b!820530 ((_ is ValueCellFull!6872) mapDefault!23464)) b!820524))

(assert (= start!70724 b!820530))

(declare-fun m!762597 () Bool)

(assert (=> mapNonEmpty!23464 m!762597))

(declare-fun m!762599 () Bool)

(assert (=> start!70724 m!762599))

(declare-fun m!762601 () Bool)

(assert (=> start!70724 m!762601))

(declare-fun m!762603 () Bool)

(assert (=> start!70724 m!762603))

(declare-fun m!762605 () Bool)

(assert (=> b!820523 m!762605))

(declare-fun m!762607 () Bool)

(assert (=> b!820525 m!762607))

(declare-fun m!762609 () Bool)

(assert (=> b!820525 m!762609))

(declare-fun m!762611 () Bool)

(assert (=> b!820525 m!762611))

(declare-fun m!762613 () Bool)

(assert (=> b!820529 m!762613))

(declare-fun m!762615 () Bool)

(assert (=> b!820526 m!762615))

(declare-fun m!762617 () Bool)

(assert (=> b!820527 m!762617))

(declare-fun m!762619 () Bool)

(assert (=> b!820527 m!762619))

(declare-fun m!762621 () Bool)

(assert (=> b!820527 m!762621))

(declare-fun m!762623 () Bool)

(assert (=> b!820527 m!762623))

(declare-fun m!762625 () Bool)

(assert (=> b!820527 m!762625))

(declare-fun m!762627 () Bool)

(assert (=> b!820527 m!762627))

(declare-fun m!762629 () Bool)

(assert (=> b!820527 m!762629))

(declare-fun m!762631 () Bool)

(assert (=> b!820527 m!762631))

(assert (=> b!820527 m!762625))

(check-sat (not mapNonEmpty!23464) (not start!70724) (not b!820525) b_and!21717 (not b!820526) (not b!820527) (not b!820523) (not b!820529) tp_is_empty!14575 (not b_next!12865))
(check-sat b_and!21717 (not b_next!12865))
