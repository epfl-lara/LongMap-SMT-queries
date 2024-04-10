; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71682 () Bool)

(assert start!71682)

(declare-fun b_free!13515 () Bool)

(declare-fun b_next!13515 () Bool)

(assert (=> start!71682 (= b_free!13515 (not b_next!13515))))

(declare-fun tp!47341 () Bool)

(declare-fun b_and!22601 () Bool)

(assert (=> start!71682 (= tp!47341 b_and!22601)))

(declare-fun b!833615 () Bool)

(declare-fun res!566835 () Bool)

(declare-fun e!465031 () Bool)

(assert (=> b!833615 (=> (not res!566835) (not e!465031))))

(declare-datatypes ((array!46624 0))(
  ( (array!46625 (arr!22346 (Array (_ BitVec 32) (_ BitVec 64))) (size!22767 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46624)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!25301 0))(
  ( (V!25302 (val!7660 Int)) )
))
(declare-datatypes ((ValueCell!7197 0))(
  ( (ValueCellFull!7197 (v!10108 V!25301)) (EmptyCell!7197) )
))
(declare-datatypes ((array!46626 0))(
  ( (array!46627 (arr!22347 (Array (_ BitVec 32) ValueCell!7197)) (size!22768 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46626)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!833615 (= res!566835 (and (= (size!22768 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22767 _keys!976) (size!22768 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!833616 () Bool)

(declare-fun res!566838 () Bool)

(assert (=> b!833616 (=> (not res!566838) (not e!465031))))

(declare-datatypes ((List!15960 0))(
  ( (Nil!15957) (Cons!15956 (h!17087 (_ BitVec 64)) (t!22331 List!15960)) )
))
(declare-fun arrayNoDuplicates!0 (array!46624 (_ BitVec 32) List!15960) Bool)

(assert (=> b!833616 (= res!566838 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15957))))

(declare-fun res!566839 () Bool)

(assert (=> start!71682 (=> (not res!566839) (not e!465031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71682 (= res!566839 (validMask!0 mask!1312))))

(assert (=> start!71682 e!465031))

(declare-fun tp_is_empty!15225 () Bool)

(assert (=> start!71682 tp_is_empty!15225))

(declare-fun array_inv!17799 (array!46624) Bool)

(assert (=> start!71682 (array_inv!17799 _keys!976)))

(assert (=> start!71682 true))

(declare-fun e!465028 () Bool)

(declare-fun array_inv!17800 (array!46626) Bool)

(assert (=> start!71682 (and (array_inv!17800 _values!788) e!465028)))

(assert (=> start!71682 tp!47341))

(declare-fun b!833617 () Bool)

(declare-fun e!465032 () Bool)

(declare-fun mapRes!24500 () Bool)

(assert (=> b!833617 (= e!465028 (and e!465032 mapRes!24500))))

(declare-fun condMapEmpty!24500 () Bool)

(declare-fun mapDefault!24500 () ValueCell!7197)

(assert (=> b!833617 (= condMapEmpty!24500 (= (arr!22347 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7197)) mapDefault!24500)))))

(declare-fun mapIsEmpty!24500 () Bool)

(assert (=> mapIsEmpty!24500 mapRes!24500))

(declare-fun mapNonEmpty!24500 () Bool)

(declare-fun tp!47342 () Bool)

(declare-fun e!465026 () Bool)

(assert (=> mapNonEmpty!24500 (= mapRes!24500 (and tp!47342 e!465026))))

(declare-fun mapKey!24500 () (_ BitVec 32))

(declare-fun mapRest!24500 () (Array (_ BitVec 32) ValueCell!7197))

(declare-fun mapValue!24500 () ValueCell!7197)

(assert (=> mapNonEmpty!24500 (= (arr!22347 _values!788) (store mapRest!24500 mapKey!24500 mapValue!24500))))

(declare-fun b!833618 () Bool)

(declare-fun e!465027 () Bool)

(assert (=> b!833618 (= e!465031 (not e!465027))))

(declare-fun res!566836 () Bool)

(assert (=> b!833618 (=> res!566836 e!465027)))

(assert (=> b!833618 (= res!566836 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!10168 0))(
  ( (tuple2!10169 (_1!5095 (_ BitVec 64)) (_2!5095 V!25301)) )
))
(declare-datatypes ((List!15961 0))(
  ( (Nil!15958) (Cons!15957 (h!17088 tuple2!10168) (t!22332 List!15961)) )
))
(declare-datatypes ((ListLongMap!8991 0))(
  ( (ListLongMap!8992 (toList!4511 List!15961)) )
))
(declare-fun lt!378351 () ListLongMap!8991)

(declare-fun lt!378355 () ListLongMap!8991)

(assert (=> b!833618 (= lt!378351 lt!378355)))

(declare-fun zeroValueBefore!34 () V!25301)

(declare-fun zeroValueAfter!34 () V!25301)

(declare-fun minValue!754 () V!25301)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28565 0))(
  ( (Unit!28566) )
))
(declare-fun lt!378350 () Unit!28565)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!598 (array!46624 array!46626 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25301 V!25301 V!25301 V!25301 (_ BitVec 32) Int) Unit!28565)

(assert (=> b!833618 (= lt!378350 (lemmaNoChangeToArrayThenSameMapNoExtras!598 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2510 (array!46624 array!46626 (_ BitVec 32) (_ BitVec 32) V!25301 V!25301 (_ BitVec 32) Int) ListLongMap!8991)

(assert (=> b!833618 (= lt!378355 (getCurrentListMapNoExtraKeys!2510 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833618 (= lt!378351 (getCurrentListMapNoExtraKeys!2510 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833619 () Bool)

(assert (=> b!833619 (= e!465026 tp_is_empty!15225)))

(declare-fun b!833620 () Bool)

(assert (=> b!833620 (= e!465032 tp_is_empty!15225)))

(declare-fun b!833621 () Bool)

(declare-fun lt!378353 () ListLongMap!8991)

(declare-fun lt!378354 () ListLongMap!8991)

(assert (=> b!833621 (= e!465027 (= lt!378353 lt!378354))))

(declare-fun lt!378348 () ListLongMap!8991)

(assert (=> b!833621 (and (= lt!378354 lt!378348) (= lt!378353 lt!378348))))

(declare-fun lt!378356 () ListLongMap!8991)

(declare-fun lt!378357 () tuple2!10168)

(declare-fun +!1989 (ListLongMap!8991 tuple2!10168) ListLongMap!8991)

(assert (=> b!833621 (= lt!378348 (+!1989 lt!378356 lt!378357))))

(declare-fun lt!378352 () ListLongMap!8991)

(assert (=> b!833621 (= lt!378354 (+!1989 lt!378352 lt!378357))))

(declare-fun lt!378347 () Unit!28565)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!242 (ListLongMap!8991 (_ BitVec 64) V!25301 V!25301) Unit!28565)

(assert (=> b!833621 (= lt!378347 (addSameAsAddTwiceSameKeyDiffValues!242 lt!378352 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!465033 () Bool)

(assert (=> b!833621 e!465033))

(declare-fun res!566837 () Bool)

(assert (=> b!833621 (=> (not res!566837) (not e!465033))))

(declare-fun lt!378358 () ListLongMap!8991)

(assert (=> b!833621 (= res!566837 (= lt!378358 lt!378356))))

(declare-fun lt!378349 () tuple2!10168)

(assert (=> b!833621 (= lt!378356 (+!1989 lt!378352 lt!378349))))

(declare-fun lt!378346 () tuple2!10168)

(assert (=> b!833621 (= lt!378352 (+!1989 lt!378351 lt!378346))))

(assert (=> b!833621 (= lt!378357 (tuple2!10169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!465029 () Bool)

(assert (=> b!833621 e!465029))

(declare-fun res!566834 () Bool)

(assert (=> b!833621 (=> (not res!566834) (not e!465029))))

(assert (=> b!833621 (= res!566834 (= lt!378358 (+!1989 (+!1989 lt!378351 lt!378349) lt!378346)))))

(assert (=> b!833621 (= lt!378346 (tuple2!10169 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!833621 (= lt!378349 (tuple2!10169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2605 (array!46624 array!46626 (_ BitVec 32) (_ BitVec 32) V!25301 V!25301 (_ BitVec 32) Int) ListLongMap!8991)

(assert (=> b!833621 (= lt!378353 (getCurrentListMap!2605 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!833621 (= lt!378358 (getCurrentListMap!2605 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!833622 () Bool)

(assert (=> b!833622 (= e!465029 (= lt!378353 (+!1989 (+!1989 lt!378355 (tuple2!10169 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!378346)))))

(declare-fun b!833623 () Bool)

(declare-fun res!566840 () Bool)

(assert (=> b!833623 (=> (not res!566840) (not e!465031))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46624 (_ BitVec 32)) Bool)

(assert (=> b!833623 (= res!566840 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!833624 () Bool)

(assert (=> b!833624 (= e!465033 (= lt!378353 (+!1989 (+!1989 lt!378355 lt!378346) lt!378357)))))

(assert (= (and start!71682 res!566839) b!833615))

(assert (= (and b!833615 res!566835) b!833623))

(assert (= (and b!833623 res!566840) b!833616))

(assert (= (and b!833616 res!566838) b!833618))

(assert (= (and b!833618 (not res!566836)) b!833621))

(assert (= (and b!833621 res!566834) b!833622))

(assert (= (and b!833621 res!566837) b!833624))

(assert (= (and b!833617 condMapEmpty!24500) mapIsEmpty!24500))

(assert (= (and b!833617 (not condMapEmpty!24500)) mapNonEmpty!24500))

(get-info :version)

(assert (= (and mapNonEmpty!24500 ((_ is ValueCellFull!7197) mapValue!24500)) b!833619))

(assert (= (and b!833617 ((_ is ValueCellFull!7197) mapDefault!24500)) b!833620))

(assert (= start!71682 b!833617))

(declare-fun m!778455 () Bool)

(assert (=> start!71682 m!778455))

(declare-fun m!778457 () Bool)

(assert (=> start!71682 m!778457))

(declare-fun m!778459 () Bool)

(assert (=> start!71682 m!778459))

(declare-fun m!778461 () Bool)

(assert (=> b!833618 m!778461))

(declare-fun m!778463 () Bool)

(assert (=> b!833618 m!778463))

(declare-fun m!778465 () Bool)

(assert (=> b!833618 m!778465))

(declare-fun m!778467 () Bool)

(assert (=> b!833623 m!778467))

(declare-fun m!778469 () Bool)

(assert (=> b!833621 m!778469))

(declare-fun m!778471 () Bool)

(assert (=> b!833621 m!778471))

(declare-fun m!778473 () Bool)

(assert (=> b!833621 m!778473))

(declare-fun m!778475 () Bool)

(assert (=> b!833621 m!778475))

(declare-fun m!778477 () Bool)

(assert (=> b!833621 m!778477))

(declare-fun m!778479 () Bool)

(assert (=> b!833621 m!778479))

(declare-fun m!778481 () Bool)

(assert (=> b!833621 m!778481))

(declare-fun m!778483 () Bool)

(assert (=> b!833621 m!778483))

(declare-fun m!778485 () Bool)

(assert (=> b!833621 m!778485))

(assert (=> b!833621 m!778473))

(declare-fun m!778487 () Bool)

(assert (=> mapNonEmpty!24500 m!778487))

(declare-fun m!778489 () Bool)

(assert (=> b!833622 m!778489))

(assert (=> b!833622 m!778489))

(declare-fun m!778491 () Bool)

(assert (=> b!833622 m!778491))

(declare-fun m!778493 () Bool)

(assert (=> b!833616 m!778493))

(declare-fun m!778495 () Bool)

(assert (=> b!833624 m!778495))

(assert (=> b!833624 m!778495))

(declare-fun m!778497 () Bool)

(assert (=> b!833624 m!778497))

(check-sat (not b!833616) (not b!833624) (not mapNonEmpty!24500) b_and!22601 (not start!71682) (not b_next!13515) (not b!833618) (not b!833623) tp_is_empty!15225 (not b!833622) (not b!833621))
(check-sat b_and!22601 (not b_next!13515))
