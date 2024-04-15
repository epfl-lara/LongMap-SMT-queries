; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70612 () Bool)

(assert start!70612)

(declare-fun b_free!12919 () Bool)

(declare-fun b_next!12919 () Bool)

(assert (=> start!70612 (= b_free!12919 (not b_next!12919))))

(declare-fun tp!45496 () Bool)

(declare-fun b_and!21747 () Bool)

(assert (=> start!70612 (= tp!45496 b_and!21747)))

(declare-fun res!559734 () Bool)

(declare-fun e!455721 () Bool)

(assert (=> start!70612 (=> (not res!559734) (not e!455721))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70612 (= res!559734 (validMask!0 mask!1312))))

(assert (=> start!70612 e!455721))

(declare-fun tp_is_empty!14629 () Bool)

(assert (=> start!70612 tp_is_empty!14629))

(declare-datatypes ((array!45429 0))(
  ( (array!45430 (arr!21767 (Array (_ BitVec 32) (_ BitVec 64))) (size!22188 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45429)

(declare-fun array_inv!17465 (array!45429) Bool)

(assert (=> start!70612 (array_inv!17465 _keys!976)))

(assert (=> start!70612 true))

(declare-datatypes ((V!24507 0))(
  ( (V!24508 (val!7362 Int)) )
))
(declare-datatypes ((ValueCell!6899 0))(
  ( (ValueCellFull!6899 (v!9787 V!24507)) (EmptyCell!6899) )
))
(declare-datatypes ((array!45431 0))(
  ( (array!45432 (arr!21768 (Array (_ BitVec 32) ValueCell!6899)) (size!22189 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45431)

(declare-fun e!455720 () Bool)

(declare-fun array_inv!17466 (array!45431) Bool)

(assert (=> start!70612 (and (array_inv!17466 _values!788) e!455720)))

(assert (=> start!70612 tp!45496))

(declare-fun b!820284 () Bool)

(assert (=> b!820284 (= e!455721 (not true))))

(declare-datatypes ((tuple2!9714 0))(
  ( (tuple2!9715 (_1!4868 (_ BitVec 64)) (_2!4868 V!24507)) )
))
(declare-datatypes ((List!15530 0))(
  ( (Nil!15527) (Cons!15526 (h!16655 tuple2!9714) (t!21854 List!15530)) )
))
(declare-datatypes ((ListLongMap!8527 0))(
  ( (ListLongMap!8528 (toList!4279 List!15530)) )
))
(declare-fun lt!368562 () ListLongMap!8527)

(declare-fun lt!368561 () ListLongMap!8527)

(assert (=> b!820284 (= lt!368562 lt!368561)))

(declare-fun zeroValueBefore!34 () V!24507)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24507)

(declare-fun minValue!754 () V!24507)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27987 0))(
  ( (Unit!27988) )
))
(declare-fun lt!368563 () Unit!27987)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!424 (array!45429 array!45431 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24507 V!24507 V!24507 V!24507 (_ BitVec 32) Int) Unit!27987)

(assert (=> b!820284 (= lt!368563 (lemmaNoChangeToArrayThenSameMapNoExtras!424 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2331 (array!45429 array!45431 (_ BitVec 32) (_ BitVec 32) V!24507 V!24507 (_ BitVec 32) Int) ListLongMap!8527)

(assert (=> b!820284 (= lt!368561 (getCurrentListMapNoExtraKeys!2331 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820284 (= lt!368562 (getCurrentListMapNoExtraKeys!2331 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820285 () Bool)

(declare-fun e!455722 () Bool)

(assert (=> b!820285 (= e!455722 tp_is_empty!14629)))

(declare-fun mapNonEmpty!23548 () Bool)

(declare-fun mapRes!23548 () Bool)

(declare-fun tp!45495 () Bool)

(assert (=> mapNonEmpty!23548 (= mapRes!23548 (and tp!45495 e!455722))))

(declare-fun mapValue!23548 () ValueCell!6899)

(declare-fun mapKey!23548 () (_ BitVec 32))

(declare-fun mapRest!23548 () (Array (_ BitVec 32) ValueCell!6899))

(assert (=> mapNonEmpty!23548 (= (arr!21768 _values!788) (store mapRest!23548 mapKey!23548 mapValue!23548))))

(declare-fun mapIsEmpty!23548 () Bool)

(assert (=> mapIsEmpty!23548 mapRes!23548))

(declare-fun b!820286 () Bool)

(declare-fun res!559731 () Bool)

(assert (=> b!820286 (=> (not res!559731) (not e!455721))))

(declare-datatypes ((List!15531 0))(
  ( (Nil!15528) (Cons!15527 (h!16656 (_ BitVec 64)) (t!21855 List!15531)) )
))
(declare-fun arrayNoDuplicates!0 (array!45429 (_ BitVec 32) List!15531) Bool)

(assert (=> b!820286 (= res!559731 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15528))))

(declare-fun b!820287 () Bool)

(declare-fun res!559732 () Bool)

(assert (=> b!820287 (=> (not res!559732) (not e!455721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45429 (_ BitVec 32)) Bool)

(assert (=> b!820287 (= res!559732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820288 () Bool)

(declare-fun res!559733 () Bool)

(assert (=> b!820288 (=> (not res!559733) (not e!455721))))

(assert (=> b!820288 (= res!559733 (and (= (size!22189 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22188 _keys!976) (size!22189 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820289 () Bool)

(declare-fun e!455719 () Bool)

(assert (=> b!820289 (= e!455719 tp_is_empty!14629)))

(declare-fun b!820290 () Bool)

(assert (=> b!820290 (= e!455720 (and e!455719 mapRes!23548))))

(declare-fun condMapEmpty!23548 () Bool)

(declare-fun mapDefault!23548 () ValueCell!6899)

(assert (=> b!820290 (= condMapEmpty!23548 (= (arr!21768 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6899)) mapDefault!23548)))))

(assert (= (and start!70612 res!559734) b!820288))

(assert (= (and b!820288 res!559733) b!820287))

(assert (= (and b!820287 res!559732) b!820286))

(assert (= (and b!820286 res!559731) b!820284))

(assert (= (and b!820290 condMapEmpty!23548) mapIsEmpty!23548))

(assert (= (and b!820290 (not condMapEmpty!23548)) mapNonEmpty!23548))

(get-info :version)

(assert (= (and mapNonEmpty!23548 ((_ is ValueCellFull!6899) mapValue!23548)) b!820285))

(assert (= (and b!820290 ((_ is ValueCellFull!6899) mapDefault!23548)) b!820289))

(assert (= start!70612 b!820290))

(declare-fun m!761719 () Bool)

(assert (=> b!820286 m!761719))

(declare-fun m!761721 () Bool)

(assert (=> start!70612 m!761721))

(declare-fun m!761723 () Bool)

(assert (=> start!70612 m!761723))

(declare-fun m!761725 () Bool)

(assert (=> start!70612 m!761725))

(declare-fun m!761727 () Bool)

(assert (=> mapNonEmpty!23548 m!761727))

(declare-fun m!761729 () Bool)

(assert (=> b!820284 m!761729))

(declare-fun m!761731 () Bool)

(assert (=> b!820284 m!761731))

(declare-fun m!761733 () Bool)

(assert (=> b!820284 m!761733))

(declare-fun m!761735 () Bool)

(assert (=> b!820287 m!761735))

(check-sat (not b!820287) (not b!820284) (not mapNonEmpty!23548) (not b_next!12919) b_and!21747 (not b!820286) (not start!70612) tp_is_empty!14629)
(check-sat b_and!21747 (not b_next!12919))
