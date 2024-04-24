; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71840 () Bool)

(assert start!71840)

(declare-fun b_free!13507 () Bool)

(declare-fun b_next!13507 () Bool)

(assert (=> start!71840 (= b_free!13507 (not b_next!13507))))

(declare-fun tp!47318 () Bool)

(declare-fun b_and!22603 () Bool)

(assert (=> start!71840 (= tp!47318 b_and!22603)))

(declare-fun mapIsEmpty!24488 () Bool)

(declare-fun mapRes!24488 () Bool)

(assert (=> mapIsEmpty!24488 mapRes!24488))

(declare-fun b!834389 () Bool)

(declare-fun res!567096 () Bool)

(declare-fun e!465514 () Bool)

(assert (=> b!834389 (=> (not res!567096) (not e!465514))))

(declare-datatypes ((array!46613 0))(
  ( (array!46614 (arr!22336 (Array (_ BitVec 32) (_ BitVec 64))) (size!22756 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46613)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46613 (_ BitVec 32)) Bool)

(assert (=> b!834389 (= res!567096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!834390 () Bool)

(declare-fun e!465510 () Bool)

(declare-fun e!465508 () Bool)

(assert (=> b!834390 (= e!465510 (and e!465508 mapRes!24488))))

(declare-fun condMapEmpty!24488 () Bool)

(declare-datatypes ((V!25291 0))(
  ( (V!25292 (val!7656 Int)) )
))
(declare-datatypes ((ValueCell!7193 0))(
  ( (ValueCellFull!7193 (v!10104 V!25291)) (EmptyCell!7193) )
))
(declare-datatypes ((array!46615 0))(
  ( (array!46616 (arr!22337 (Array (_ BitVec 32) ValueCell!7193)) (size!22757 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46615)

(declare-fun mapDefault!24488 () ValueCell!7193)

(assert (=> b!834390 (= condMapEmpty!24488 (= (arr!22337 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7193)) mapDefault!24488)))))

(declare-fun b!834391 () Bool)

(declare-fun tp_is_empty!15217 () Bool)

(assert (=> b!834391 (= e!465508 tp_is_empty!15217)))

(declare-fun res!567099 () Bool)

(assert (=> start!71840 (=> (not res!567099) (not e!465514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71840 (= res!567099 (validMask!0 mask!1312))))

(assert (=> start!71840 e!465514))

(assert (=> start!71840 tp_is_empty!15217))

(declare-fun array_inv!17831 (array!46613) Bool)

(assert (=> start!71840 (array_inv!17831 _keys!976)))

(assert (=> start!71840 true))

(declare-fun array_inv!17832 (array!46615) Bool)

(assert (=> start!71840 (and (array_inv!17832 _values!788) e!465510)))

(assert (=> start!71840 tp!47318))

(declare-fun b!834392 () Bool)

(declare-fun e!465512 () Bool)

(assert (=> b!834392 (= e!465512 tp_is_empty!15217)))

(declare-fun b!834393 () Bool)

(declare-fun res!567100 () Bool)

(assert (=> b!834393 (=> (not res!567100) (not e!465514))))

(declare-datatypes ((List!15857 0))(
  ( (Nil!15854) (Cons!15853 (h!16990 (_ BitVec 64)) (t!22220 List!15857)) )
))
(declare-fun arrayNoDuplicates!0 (array!46613 (_ BitVec 32) List!15857) Bool)

(assert (=> b!834393 (= res!567100 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15854))))

(declare-fun mapNonEmpty!24488 () Bool)

(declare-fun tp!47317 () Bool)

(assert (=> mapNonEmpty!24488 (= mapRes!24488 (and tp!47317 e!465512))))

(declare-fun mapValue!24488 () ValueCell!7193)

(declare-fun mapRest!24488 () (Array (_ BitVec 32) ValueCell!7193))

(declare-fun mapKey!24488 () (_ BitVec 32))

(assert (=> mapNonEmpty!24488 (= (arr!22337 _values!788) (store mapRest!24488 mapKey!24488 mapValue!24488))))

(declare-fun b!834394 () Bool)

(declare-fun e!465513 () Bool)

(declare-datatypes ((tuple2!10088 0))(
  ( (tuple2!10089 (_1!5055 (_ BitVec 64)) (_2!5055 V!25291)) )
))
(declare-datatypes ((List!15858 0))(
  ( (Nil!15855) (Cons!15854 (h!16991 tuple2!10088) (t!22221 List!15858)) )
))
(declare-datatypes ((ListLongMap!8913 0))(
  ( (ListLongMap!8914 (toList!4472 List!15858)) )
))
(declare-fun lt!378544 () ListLongMap!8913)

(declare-fun lt!378545 () ListLongMap!8913)

(assert (=> b!834394 (= e!465513 (= lt!378544 lt!378545))))

(declare-fun lt!378546 () ListLongMap!8913)

(assert (=> b!834394 (= lt!378546 lt!378545)))

(declare-fun lt!378549 () ListLongMap!8913)

(declare-fun lt!378548 () tuple2!10088)

(declare-fun +!1994 (ListLongMap!8913 tuple2!10088) ListLongMap!8913)

(assert (=> b!834394 (= lt!378545 (+!1994 lt!378549 lt!378548))))

(declare-fun lt!378554 () ListLongMap!8913)

(assert (=> b!834394 (= lt!378546 (+!1994 lt!378554 lt!378548))))

(declare-fun zeroValueBefore!34 () V!25291)

(declare-fun zeroValueAfter!34 () V!25291)

(declare-datatypes ((Unit!28574 0))(
  ( (Unit!28575) )
))
(declare-fun lt!378556 () Unit!28574)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!247 (ListLongMap!8913 (_ BitVec 64) V!25291 V!25291) Unit!28574)

(assert (=> b!834394 (= lt!378556 (addSameAsAddTwiceSameKeyDiffValues!247 lt!378554 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!465509 () Bool)

(assert (=> b!834394 e!465509))

(declare-fun res!567097 () Bool)

(assert (=> b!834394 (=> (not res!567097) (not e!465509))))

(declare-fun lt!378547 () ListLongMap!8913)

(assert (=> b!834394 (= res!567097 (= lt!378547 lt!378549))))

(declare-fun lt!378552 () tuple2!10088)

(assert (=> b!834394 (= lt!378549 (+!1994 lt!378554 lt!378552))))

(declare-fun lt!378555 () ListLongMap!8913)

(declare-fun lt!378553 () tuple2!10088)

(assert (=> b!834394 (= lt!378554 (+!1994 lt!378555 lt!378553))))

(assert (=> b!834394 (= lt!378548 (tuple2!10089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465515 () Bool)

(assert (=> b!834394 e!465515))

(declare-fun res!567102 () Bool)

(assert (=> b!834394 (=> (not res!567102) (not e!465515))))

(assert (=> b!834394 (= res!567102 (= lt!378547 (+!1994 (+!1994 lt!378555 lt!378552) lt!378553)))))

(declare-fun minValue!754 () V!25291)

(assert (=> b!834394 (= lt!378553 (tuple2!10089 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!834394 (= lt!378552 (tuple2!10089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2562 (array!46613 array!46615 (_ BitVec 32) (_ BitVec 32) V!25291 V!25291 (_ BitVec 32) Int) ListLongMap!8913)

(assert (=> b!834394 (= lt!378544 (getCurrentListMap!2562 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!834394 (= lt!378547 (getCurrentListMap!2562 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!834395 () Bool)

(declare-fun lt!378550 () ListLongMap!8913)

(assert (=> b!834395 (= e!465509 (= lt!378544 (+!1994 (+!1994 lt!378550 lt!378553) lt!378548)))))

(declare-fun b!834396 () Bool)

(assert (=> b!834396 (= e!465515 (= lt!378544 (+!1994 (+!1994 lt!378550 (tuple2!10089 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378553)))))

(declare-fun b!834397 () Bool)

(declare-fun res!567101 () Bool)

(assert (=> b!834397 (=> (not res!567101) (not e!465514))))

(assert (=> b!834397 (= res!567101 (and (= (size!22757 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22756 _keys!976) (size!22757 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!834398 () Bool)

(assert (=> b!834398 (= e!465514 (not e!465513))))

(declare-fun res!567098 () Bool)

(assert (=> b!834398 (=> res!567098 e!465513)))

(assert (=> b!834398 (= res!567098 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!834398 (= lt!378555 lt!378550)))

(declare-fun lt!378551 () Unit!28574)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!608 (array!46613 array!46615 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25291 V!25291 V!25291 V!25291 (_ BitVec 32) Int) Unit!28574)

(assert (=> b!834398 (= lt!378551 (lemmaNoChangeToArrayThenSameMapNoExtras!608 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2541 (array!46613 array!46615 (_ BitVec 32) (_ BitVec 32) V!25291 V!25291 (_ BitVec 32) Int) ListLongMap!8913)

(assert (=> b!834398 (= lt!378550 (getCurrentListMapNoExtraKeys!2541 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!834398 (= lt!378555 (getCurrentListMapNoExtraKeys!2541 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71840 res!567099) b!834397))

(assert (= (and b!834397 res!567101) b!834389))

(assert (= (and b!834389 res!567096) b!834393))

(assert (= (and b!834393 res!567100) b!834398))

(assert (= (and b!834398 (not res!567098)) b!834394))

(assert (= (and b!834394 res!567102) b!834396))

(assert (= (and b!834394 res!567097) b!834395))

(assert (= (and b!834390 condMapEmpty!24488) mapIsEmpty!24488))

(assert (= (and b!834390 (not condMapEmpty!24488)) mapNonEmpty!24488))

(get-info :version)

(assert (= (and mapNonEmpty!24488 ((_ is ValueCellFull!7193) mapValue!24488)) b!834392))

(assert (= (and b!834390 ((_ is ValueCellFull!7193) mapDefault!24488)) b!834391))

(assert (= start!71840 b!834390))

(declare-fun m!779561 () Bool)

(assert (=> b!834398 m!779561))

(declare-fun m!779563 () Bool)

(assert (=> b!834398 m!779563))

(declare-fun m!779565 () Bool)

(assert (=> b!834398 m!779565))

(declare-fun m!779567 () Bool)

(assert (=> b!834389 m!779567))

(declare-fun m!779569 () Bool)

(assert (=> start!71840 m!779569))

(declare-fun m!779571 () Bool)

(assert (=> start!71840 m!779571))

(declare-fun m!779573 () Bool)

(assert (=> start!71840 m!779573))

(declare-fun m!779575 () Bool)

(assert (=> mapNonEmpty!24488 m!779575))

(declare-fun m!779577 () Bool)

(assert (=> b!834394 m!779577))

(declare-fun m!779579 () Bool)

(assert (=> b!834394 m!779579))

(declare-fun m!779581 () Bool)

(assert (=> b!834394 m!779581))

(declare-fun m!779583 () Bool)

(assert (=> b!834394 m!779583))

(declare-fun m!779585 () Bool)

(assert (=> b!834394 m!779585))

(declare-fun m!779587 () Bool)

(assert (=> b!834394 m!779587))

(assert (=> b!834394 m!779579))

(declare-fun m!779589 () Bool)

(assert (=> b!834394 m!779589))

(declare-fun m!779591 () Bool)

(assert (=> b!834394 m!779591))

(declare-fun m!779593 () Bool)

(assert (=> b!834394 m!779593))

(declare-fun m!779595 () Bool)

(assert (=> b!834396 m!779595))

(assert (=> b!834396 m!779595))

(declare-fun m!779597 () Bool)

(assert (=> b!834396 m!779597))

(declare-fun m!779599 () Bool)

(assert (=> b!834393 m!779599))

(declare-fun m!779601 () Bool)

(assert (=> b!834395 m!779601))

(assert (=> b!834395 m!779601))

(declare-fun m!779603 () Bool)

(assert (=> b!834395 m!779603))

(check-sat (not b_next!13507) tp_is_empty!15217 (not b!834396) (not b!834395) (not start!71840) b_and!22603 (not mapNonEmpty!24488) (not b!834389) (not b!834393) (not b!834394) (not b!834398))
(check-sat b_and!22603 (not b_next!13507))
