; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70470 () Bool)

(assert start!70470)

(declare-fun b_free!12817 () Bool)

(declare-fun b_next!12817 () Bool)

(assert (=> start!70470 (= b_free!12817 (not b_next!12817))))

(declare-fun tp!45184 () Bool)

(declare-fun b_and!21621 () Bool)

(assert (=> start!70470 (= tp!45184 b_and!21621)))

(declare-fun mapIsEmpty!23389 () Bool)

(declare-fun mapRes!23389 () Bool)

(assert (=> mapIsEmpty!23389 mapRes!23389))

(declare-fun b!818541 () Bool)

(declare-fun e!454426 () Bool)

(declare-fun tp_is_empty!14527 () Bool)

(assert (=> b!818541 (= e!454426 tp_is_empty!14527)))

(declare-fun mapNonEmpty!23389 () Bool)

(declare-fun tp!45183 () Bool)

(declare-fun e!454424 () Bool)

(assert (=> mapNonEmpty!23389 (= mapRes!23389 (and tp!45183 e!454424))))

(declare-fun mapKey!23389 () (_ BitVec 32))

(declare-datatypes ((V!24371 0))(
  ( (V!24372 (val!7311 Int)) )
))
(declare-datatypes ((ValueCell!6848 0))(
  ( (ValueCellFull!6848 (v!9734 V!24371)) (EmptyCell!6848) )
))
(declare-datatypes ((array!45229 0))(
  ( (array!45230 (arr!21669 (Array (_ BitVec 32) ValueCell!6848)) (size!22090 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45229)

(declare-fun mapRest!23389 () (Array (_ BitVec 32) ValueCell!6848))

(declare-fun mapValue!23389 () ValueCell!6848)

(assert (=> mapNonEmpty!23389 (= (arr!21669 _values!788) (store mapRest!23389 mapKey!23389 mapValue!23389))))

(declare-fun b!818542 () Bool)

(assert (=> b!818542 (= e!454424 tp_is_empty!14527)))

(declare-fun e!454421 () Bool)

(declare-fun zeroValueAfter!34 () V!24371)

(declare-fun b!818543 () Bool)

(declare-datatypes ((tuple2!9636 0))(
  ( (tuple2!9637 (_1!4829 (_ BitVec 64)) (_2!4829 V!24371)) )
))
(declare-datatypes ((List!15457 0))(
  ( (Nil!15454) (Cons!15453 (h!16582 tuple2!9636) (t!21777 List!15457)) )
))
(declare-datatypes ((ListLongMap!8449 0))(
  ( (ListLongMap!8450 (toList!4240 List!15457)) )
))
(declare-fun lt!366800 () ListLongMap!8449)

(declare-fun lt!366808 () ListLongMap!8449)

(declare-fun +!1862 (ListLongMap!8449 tuple2!9636) ListLongMap!8449)

(assert (=> b!818543 (= e!454421 (= lt!366800 (+!1862 lt!366808 (tuple2!9637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun res!558651 () Bool)

(declare-fun e!454425 () Bool)

(assert (=> start!70470 (=> (not res!558651) (not e!454425))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70470 (= res!558651 (validMask!0 mask!1312))))

(assert (=> start!70470 e!454425))

(assert (=> start!70470 tp_is_empty!14527))

(declare-datatypes ((array!45231 0))(
  ( (array!45232 (arr!21670 (Array (_ BitVec 32) (_ BitVec 64))) (size!22091 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45231)

(declare-fun array_inv!17393 (array!45231) Bool)

(assert (=> start!70470 (array_inv!17393 _keys!976)))

(assert (=> start!70470 true))

(declare-fun e!454422 () Bool)

(declare-fun array_inv!17394 (array!45229) Bool)

(assert (=> start!70470 (and (array_inv!17394 _values!788) e!454422)))

(assert (=> start!70470 tp!45184))

(declare-fun b!818544 () Bool)

(declare-fun res!558653 () Bool)

(assert (=> b!818544 (=> (not res!558653) (not e!454425))))

(declare-datatypes ((List!15458 0))(
  ( (Nil!15455) (Cons!15454 (h!16583 (_ BitVec 64)) (t!21778 List!15458)) )
))
(declare-fun arrayNoDuplicates!0 (array!45231 (_ BitVec 32) List!15458) Bool)

(assert (=> b!818544 (= res!558653 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15455))))

(declare-fun b!818545 () Bool)

(assert (=> b!818545 (= e!454422 (and e!454426 mapRes!23389))))

(declare-fun condMapEmpty!23389 () Bool)

(declare-fun mapDefault!23389 () ValueCell!6848)

(assert (=> b!818545 (= condMapEmpty!23389 (= (arr!21669 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6848)) mapDefault!23389)))))

(declare-fun b!818546 () Bool)

(declare-fun res!558655 () Bool)

(assert (=> b!818546 (=> (not res!558655) (not e!454425))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818546 (= res!558655 (and (= (size!22090 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22091 _keys!976) (size!22090 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818547 () Bool)

(declare-fun e!454423 () Bool)

(assert (=> b!818547 (= e!454425 (not e!454423))))

(declare-fun res!558656 () Bool)

(assert (=> b!818547 (=> res!558656 e!454423)))

(assert (=> b!818547 (= res!558656 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366802 () ListLongMap!8449)

(assert (=> b!818547 (= lt!366802 lt!366808)))

(declare-fun zeroValueBefore!34 () V!24371)

(declare-fun minValue!754 () V!24371)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27905 0))(
  ( (Unit!27906) )
))
(declare-fun lt!366805 () Unit!27905)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!391 (array!45231 array!45229 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24371 V!24371 V!24371 V!24371 (_ BitVec 32) Int) Unit!27905)

(assert (=> b!818547 (= lt!366805 (lemmaNoChangeToArrayThenSameMapNoExtras!391 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2298 (array!45231 array!45229 (_ BitVec 32) (_ BitVec 32) V!24371 V!24371 (_ BitVec 32) Int) ListLongMap!8449)

(assert (=> b!818547 (= lt!366808 (getCurrentListMapNoExtraKeys!2298 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818547 (= lt!366802 (getCurrentListMapNoExtraKeys!2298 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818548 () Bool)

(declare-fun res!558654 () Bool)

(assert (=> b!818548 (=> (not res!558654) (not e!454425))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45231 (_ BitVec 32)) Bool)

(assert (=> b!818548 (= res!558654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818549 () Bool)

(assert (=> b!818549 (= e!454423 true)))

(declare-fun lt!366809 () ListLongMap!8449)

(declare-fun lt!366803 () tuple2!9636)

(declare-fun lt!366804 () tuple2!9636)

(assert (=> b!818549 (= lt!366809 (+!1862 (+!1862 lt!366808 lt!366803) lt!366804))))

(declare-fun lt!366807 () ListLongMap!8449)

(assert (=> b!818549 (= (+!1862 lt!366802 lt!366804) (+!1862 lt!366807 lt!366804))))

(declare-fun lt!366801 () Unit!27905)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!177 (ListLongMap!8449 (_ BitVec 64) V!24371 V!24371) Unit!27905)

(assert (=> b!818549 (= lt!366801 (addSameAsAddTwiceSameKeyDiffValues!177 lt!366802 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818549 (= lt!366804 (tuple2!9637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!818549 e!454421))

(declare-fun res!558652 () Bool)

(assert (=> b!818549 (=> (not res!558652) (not e!454421))))

(declare-fun lt!366806 () ListLongMap!8449)

(assert (=> b!818549 (= res!558652 (= lt!366806 lt!366807))))

(assert (=> b!818549 (= lt!366807 (+!1862 lt!366802 lt!366803))))

(assert (=> b!818549 (= lt!366803 (tuple2!9637 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2390 (array!45231 array!45229 (_ BitVec 32) (_ BitVec 32) V!24371 V!24371 (_ BitVec 32) Int) ListLongMap!8449)

(assert (=> b!818549 (= lt!366800 (getCurrentListMap!2390 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818549 (= lt!366806 (getCurrentListMap!2390 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70470 res!558651) b!818546))

(assert (= (and b!818546 res!558655) b!818548))

(assert (= (and b!818548 res!558654) b!818544))

(assert (= (and b!818544 res!558653) b!818547))

(assert (= (and b!818547 (not res!558656)) b!818549))

(assert (= (and b!818549 res!558652) b!818543))

(assert (= (and b!818545 condMapEmpty!23389) mapIsEmpty!23389))

(assert (= (and b!818545 (not condMapEmpty!23389)) mapNonEmpty!23389))

(get-info :version)

(assert (= (and mapNonEmpty!23389 ((_ is ValueCellFull!6848) mapValue!23389)) b!818542))

(assert (= (and b!818545 ((_ is ValueCellFull!6848) mapDefault!23389)) b!818541))

(assert (= start!70470 b!818545))

(declare-fun m!759461 () Bool)

(assert (=> b!818547 m!759461))

(declare-fun m!759463 () Bool)

(assert (=> b!818547 m!759463))

(declare-fun m!759465 () Bool)

(assert (=> b!818547 m!759465))

(declare-fun m!759467 () Bool)

(assert (=> start!70470 m!759467))

(declare-fun m!759469 () Bool)

(assert (=> start!70470 m!759469))

(declare-fun m!759471 () Bool)

(assert (=> start!70470 m!759471))

(declare-fun m!759473 () Bool)

(assert (=> b!818548 m!759473))

(declare-fun m!759475 () Bool)

(assert (=> b!818543 m!759475))

(declare-fun m!759477 () Bool)

(assert (=> mapNonEmpty!23389 m!759477))

(declare-fun m!759479 () Bool)

(assert (=> b!818544 m!759479))

(declare-fun m!759481 () Bool)

(assert (=> b!818549 m!759481))

(declare-fun m!759483 () Bool)

(assert (=> b!818549 m!759483))

(declare-fun m!759485 () Bool)

(assert (=> b!818549 m!759485))

(declare-fun m!759487 () Bool)

(assert (=> b!818549 m!759487))

(declare-fun m!759489 () Bool)

(assert (=> b!818549 m!759489))

(declare-fun m!759491 () Bool)

(assert (=> b!818549 m!759491))

(declare-fun m!759493 () Bool)

(assert (=> b!818549 m!759493))

(assert (=> b!818549 m!759493))

(declare-fun m!759495 () Bool)

(assert (=> b!818549 m!759495))

(check-sat tp_is_empty!14527 (not start!70470) (not b_next!12817) (not b!818544) (not b!818547) (not b!818543) (not b!818548) (not mapNonEmpty!23389) b_and!21621 (not b!818549))
(check-sat b_and!21621 (not b_next!12817))
