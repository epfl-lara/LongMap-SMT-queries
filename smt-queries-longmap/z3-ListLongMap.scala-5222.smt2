; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70384 () Bool)

(assert start!70384)

(declare-fun b_free!12741 () Bool)

(declare-fun b_next!12741 () Bool)

(assert (=> start!70384 (= b_free!12741 (not b_next!12741))))

(declare-fun tp!44950 () Bool)

(declare-fun b_and!21553 () Bool)

(assert (=> start!70384 (= tp!44950 b_and!21553)))

(declare-fun b!817635 () Bool)

(declare-fun res!558093 () Bool)

(declare-fun e!453735 () Bool)

(assert (=> b!817635 (=> (not res!558093) (not e!453735))))

(declare-datatypes ((array!45100 0))(
  ( (array!45101 (arr!21606 (Array (_ BitVec 32) (_ BitVec 64))) (size!22027 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45100)

(declare-datatypes ((List!15387 0))(
  ( (Nil!15384) (Cons!15383 (h!16512 (_ BitVec 64)) (t!21712 List!15387)) )
))
(declare-fun arrayNoDuplicates!0 (array!45100 (_ BitVec 32) List!15387) Bool)

(assert (=> b!817635 (= res!558093 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15384))))

(declare-fun mapIsEmpty!23269 () Bool)

(declare-fun mapRes!23269 () Bool)

(assert (=> mapIsEmpty!23269 mapRes!23269))

(declare-fun b!817636 () Bool)

(declare-fun res!558091 () Bool)

(assert (=> b!817636 (=> (not res!558091) (not e!453735))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45100 (_ BitVec 32)) Bool)

(assert (=> b!817636 (= res!558091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817637 () Bool)

(declare-fun res!558092 () Bool)

(assert (=> b!817637 (=> (not res!558092) (not e!453735))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24269 0))(
  ( (V!24270 (val!7273 Int)) )
))
(declare-datatypes ((ValueCell!6810 0))(
  ( (ValueCellFull!6810 (v!9702 V!24269)) (EmptyCell!6810) )
))
(declare-datatypes ((array!45102 0))(
  ( (array!45103 (arr!21607 (Array (_ BitVec 32) ValueCell!6810)) (size!22028 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45102)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817637 (= res!558092 (and (= (size!22028 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22027 _keys!976) (size!22028 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817638 () Bool)

(declare-fun e!453731 () Bool)

(declare-fun e!453733 () Bool)

(assert (=> b!817638 (= e!453731 (and e!453733 mapRes!23269))))

(declare-fun condMapEmpty!23269 () Bool)

(declare-fun mapDefault!23269 () ValueCell!6810)

(assert (=> b!817638 (= condMapEmpty!23269 (= (arr!21607 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6810)) mapDefault!23269)))))

(declare-fun b!817639 () Bool)

(declare-fun e!453732 () Bool)

(declare-fun tp_is_empty!14451 () Bool)

(assert (=> b!817639 (= e!453732 tp_is_empty!14451)))

(declare-fun b!817640 () Bool)

(assert (=> b!817640 (= e!453735 (not true))))

(declare-datatypes ((tuple2!9558 0))(
  ( (tuple2!9559 (_1!4790 (_ BitVec 64)) (_2!4790 V!24269)) )
))
(declare-datatypes ((List!15388 0))(
  ( (Nil!15385) (Cons!15384 (h!16513 tuple2!9558) (t!21713 List!15388)) )
))
(declare-datatypes ((ListLongMap!8381 0))(
  ( (ListLongMap!8382 (toList!4206 List!15388)) )
))
(declare-fun lt!366335 () ListLongMap!8381)

(declare-fun lt!366334 () ListLongMap!8381)

(assert (=> b!817640 (= lt!366335 lt!366334)))

(declare-fun zeroValueBefore!34 () V!24269)

(declare-fun zeroValueAfter!34 () V!24269)

(declare-fun minValue!754 () V!24269)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27896 0))(
  ( (Unit!27897) )
))
(declare-fun lt!366336 () Unit!27896)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!357 (array!45100 array!45102 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24269 V!24269 V!24269 V!24269 (_ BitVec 32) Int) Unit!27896)

(assert (=> b!817640 (= lt!366336 (lemmaNoChangeToArrayThenSameMapNoExtras!357 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2247 (array!45100 array!45102 (_ BitVec 32) (_ BitVec 32) V!24269 V!24269 (_ BitVec 32) Int) ListLongMap!8381)

(assert (=> b!817640 (= lt!366334 (getCurrentListMapNoExtraKeys!2247 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817640 (= lt!366335 (getCurrentListMapNoExtraKeys!2247 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558094 () Bool)

(assert (=> start!70384 (=> (not res!558094) (not e!453735))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70384 (= res!558094 (validMask!0 mask!1312))))

(assert (=> start!70384 e!453735))

(assert (=> start!70384 tp_is_empty!14451))

(declare-fun array_inv!17281 (array!45100) Bool)

(assert (=> start!70384 (array_inv!17281 _keys!976)))

(assert (=> start!70384 true))

(declare-fun array_inv!17282 (array!45102) Bool)

(assert (=> start!70384 (and (array_inv!17282 _values!788) e!453731)))

(assert (=> start!70384 tp!44950))

(declare-fun b!817641 () Bool)

(assert (=> b!817641 (= e!453733 tp_is_empty!14451)))

(declare-fun mapNonEmpty!23269 () Bool)

(declare-fun tp!44949 () Bool)

(assert (=> mapNonEmpty!23269 (= mapRes!23269 (and tp!44949 e!453732))))

(declare-fun mapKey!23269 () (_ BitVec 32))

(declare-fun mapRest!23269 () (Array (_ BitVec 32) ValueCell!6810))

(declare-fun mapValue!23269 () ValueCell!6810)

(assert (=> mapNonEmpty!23269 (= (arr!21607 _values!788) (store mapRest!23269 mapKey!23269 mapValue!23269))))

(assert (= (and start!70384 res!558094) b!817637))

(assert (= (and b!817637 res!558092) b!817636))

(assert (= (and b!817636 res!558091) b!817635))

(assert (= (and b!817635 res!558093) b!817640))

(assert (= (and b!817638 condMapEmpty!23269) mapIsEmpty!23269))

(assert (= (and b!817638 (not condMapEmpty!23269)) mapNonEmpty!23269))

(get-info :version)

(assert (= (and mapNonEmpty!23269 ((_ is ValueCellFull!6810) mapValue!23269)) b!817639))

(assert (= (and b!817638 ((_ is ValueCellFull!6810) mapDefault!23269)) b!817641))

(assert (= start!70384 b!817638))

(declare-fun m!759189 () Bool)

(assert (=> b!817635 m!759189))

(declare-fun m!759191 () Bool)

(assert (=> start!70384 m!759191))

(declare-fun m!759193 () Bool)

(assert (=> start!70384 m!759193))

(declare-fun m!759195 () Bool)

(assert (=> start!70384 m!759195))

(declare-fun m!759197 () Bool)

(assert (=> b!817636 m!759197))

(declare-fun m!759199 () Bool)

(assert (=> mapNonEmpty!23269 m!759199))

(declare-fun m!759201 () Bool)

(assert (=> b!817640 m!759201))

(declare-fun m!759203 () Bool)

(assert (=> b!817640 m!759203))

(declare-fun m!759205 () Bool)

(assert (=> b!817640 m!759205))

(check-sat (not b!817636) (not b!817635) (not b!817640) (not mapNonEmpty!23269) b_and!21553 (not start!70384) (not b_next!12741) tp_is_empty!14451)
(check-sat b_and!21553 (not b_next!12741))
