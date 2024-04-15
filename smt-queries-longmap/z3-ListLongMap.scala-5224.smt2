; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70388 () Bool)

(assert start!70388)

(declare-fun b_free!12751 () Bool)

(declare-fun b_next!12751 () Bool)

(assert (=> start!70388 (= b_free!12751 (not b_next!12751))))

(declare-fun tp!44983 () Bool)

(declare-fun b_and!21545 () Bool)

(assert (=> start!70388 (= tp!44983 b_and!21545)))

(declare-fun b!817581 () Bool)

(declare-fun e!453715 () Bool)

(declare-fun tp_is_empty!14461 () Bool)

(assert (=> b!817581 (= e!453715 tp_is_empty!14461)))

(declare-fun mapNonEmpty!23287 () Bool)

(declare-fun mapRes!23287 () Bool)

(declare-fun tp!44982 () Bool)

(assert (=> mapNonEmpty!23287 (= mapRes!23287 (and tp!44982 e!453715))))

(declare-fun mapKey!23287 () (_ BitVec 32))

(declare-datatypes ((V!24283 0))(
  ( (V!24284 (val!7278 Int)) )
))
(declare-datatypes ((ValueCell!6815 0))(
  ( (ValueCellFull!6815 (v!9701 V!24283)) (EmptyCell!6815) )
))
(declare-datatypes ((array!45099 0))(
  ( (array!45100 (arr!21605 (Array (_ BitVec 32) ValueCell!6815)) (size!22026 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45099)

(declare-fun mapValue!23287 () ValueCell!6815)

(declare-fun mapRest!23287 () (Array (_ BitVec 32) ValueCell!6815))

(assert (=> mapNonEmpty!23287 (= (arr!21605 _values!788) (store mapRest!23287 mapKey!23287 mapValue!23287))))

(declare-fun res!558082 () Bool)

(declare-fun e!453714 () Bool)

(assert (=> start!70388 (=> (not res!558082) (not e!453714))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70388 (= res!558082 (validMask!0 mask!1312))))

(assert (=> start!70388 e!453714))

(assert (=> start!70388 tp_is_empty!14461))

(declare-datatypes ((array!45101 0))(
  ( (array!45102 (arr!21606 (Array (_ BitVec 32) (_ BitVec 64))) (size!22027 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45101)

(declare-fun array_inv!17347 (array!45101) Bool)

(assert (=> start!70388 (array_inv!17347 _keys!976)))

(assert (=> start!70388 true))

(declare-fun e!453718 () Bool)

(declare-fun array_inv!17348 (array!45099) Bool)

(assert (=> start!70388 (and (array_inv!17348 _values!788) e!453718)))

(assert (=> start!70388 tp!44983))

(declare-fun b!817582 () Bool)

(declare-fun e!453713 () Bool)

(assert (=> b!817582 (= e!453718 (and e!453713 mapRes!23287))))

(declare-fun condMapEmpty!23287 () Bool)

(declare-fun mapDefault!23287 () ValueCell!6815)

(assert (=> b!817582 (= condMapEmpty!23287 (= (arr!21605 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6815)) mapDefault!23287)))))

(declare-fun b!817583 () Bool)

(declare-fun res!558080 () Bool)

(assert (=> b!817583 (=> (not res!558080) (not e!453714))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817583 (= res!558080 (and (= (size!22026 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22027 _keys!976) (size!22026 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817584 () Bool)

(declare-fun res!558079 () Bool)

(assert (=> b!817584 (=> (not res!558079) (not e!453714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45101 (_ BitVec 32)) Bool)

(assert (=> b!817584 (= res!558079 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapIsEmpty!23287 () Bool)

(assert (=> mapIsEmpty!23287 mapRes!23287))

(declare-fun b!817585 () Bool)

(assert (=> b!817585 (= e!453713 tp_is_empty!14461)))

(declare-fun b!817586 () Bool)

(declare-fun res!558078 () Bool)

(assert (=> b!817586 (=> (not res!558078) (not e!453714))))

(declare-datatypes ((List!15405 0))(
  ( (Nil!15402) (Cons!15401 (h!16530 (_ BitVec 64)) (t!21723 List!15405)) )
))
(declare-fun arrayNoDuplicates!0 (array!45101 (_ BitVec 32) List!15405) Bool)

(assert (=> b!817586 (= res!558078 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15402))))

(declare-fun b!817587 () Bool)

(declare-fun e!453717 () Bool)

(assert (=> b!817587 (= e!453717 true)))

(declare-fun zeroValueBefore!34 () V!24283)

(declare-fun minValue!754 () V!24283)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9582 0))(
  ( (tuple2!9583 (_1!4802 (_ BitVec 64)) (_2!4802 V!24283)) )
))
(declare-datatypes ((List!15406 0))(
  ( (Nil!15403) (Cons!15402 (h!16531 tuple2!9582) (t!21724 List!15406)) )
))
(declare-datatypes ((ListLongMap!8395 0))(
  ( (ListLongMap!8396 (toList!4213 List!15406)) )
))
(declare-fun lt!366180 () ListLongMap!8395)

(declare-fun getCurrentListMap!2366 (array!45101 array!45099 (_ BitVec 32) (_ BitVec 32) V!24283 V!24283 (_ BitVec 32) Int) ListLongMap!8395)

(assert (=> b!817587 (= lt!366180 (getCurrentListMap!2366 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817588 () Bool)

(assert (=> b!817588 (= e!453714 (not e!453717))))

(declare-fun res!558081 () Bool)

(assert (=> b!817588 (=> res!558081 e!453717)))

(assert (=> b!817588 (= res!558081 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366179 () ListLongMap!8395)

(declare-fun lt!366178 () ListLongMap!8395)

(assert (=> b!817588 (= lt!366179 lt!366178)))

(declare-fun zeroValueAfter!34 () V!24283)

(declare-datatypes ((Unit!27854 0))(
  ( (Unit!27855) )
))
(declare-fun lt!366181 () Unit!27854)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!366 (array!45101 array!45099 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24283 V!24283 V!24283 V!24283 (_ BitVec 32) Int) Unit!27854)

(assert (=> b!817588 (= lt!366181 (lemmaNoChangeToArrayThenSameMapNoExtras!366 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2273 (array!45101 array!45099 (_ BitVec 32) (_ BitVec 32) V!24283 V!24283 (_ BitVec 32) Int) ListLongMap!8395)

(assert (=> b!817588 (= lt!366178 (getCurrentListMapNoExtraKeys!2273 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817588 (= lt!366179 (getCurrentListMapNoExtraKeys!2273 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70388 res!558082) b!817583))

(assert (= (and b!817583 res!558080) b!817584))

(assert (= (and b!817584 res!558079) b!817586))

(assert (= (and b!817586 res!558078) b!817588))

(assert (= (and b!817588 (not res!558081)) b!817587))

(assert (= (and b!817582 condMapEmpty!23287) mapIsEmpty!23287))

(assert (= (and b!817582 (not condMapEmpty!23287)) mapNonEmpty!23287))

(get-info :version)

(assert (= (and mapNonEmpty!23287 ((_ is ValueCellFull!6815) mapValue!23287)) b!817581))

(assert (= (and b!817582 ((_ is ValueCellFull!6815) mapDefault!23287)) b!817585))

(assert (= start!70388 b!817582))

(declare-fun m!758593 () Bool)

(assert (=> mapNonEmpty!23287 m!758593))

(declare-fun m!758595 () Bool)

(assert (=> b!817584 m!758595))

(declare-fun m!758597 () Bool)

(assert (=> b!817586 m!758597))

(declare-fun m!758599 () Bool)

(assert (=> start!70388 m!758599))

(declare-fun m!758601 () Bool)

(assert (=> start!70388 m!758601))

(declare-fun m!758603 () Bool)

(assert (=> start!70388 m!758603))

(declare-fun m!758605 () Bool)

(assert (=> b!817588 m!758605))

(declare-fun m!758607 () Bool)

(assert (=> b!817588 m!758607))

(declare-fun m!758609 () Bool)

(assert (=> b!817588 m!758609))

(declare-fun m!758611 () Bool)

(assert (=> b!817587 m!758611))

(check-sat b_and!21545 tp_is_empty!14461 (not mapNonEmpty!23287) (not b!817587) (not b_next!12751) (not b!817586) (not b!817588) (not b!817584) (not start!70388))
(check-sat b_and!21545 (not b_next!12751))
