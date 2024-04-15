; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70854 () Bool)

(assert start!70854)

(declare-fun b_free!13111 () Bool)

(declare-fun b_next!13111 () Bool)

(assert (=> start!70854 (= b_free!13111 (not b_next!13111))))

(declare-fun tp!46081 () Bool)

(declare-fun b_and!21969 () Bool)

(assert (=> start!70854 (= tp!46081 b_and!21969)))

(declare-fun b!822941 () Bool)

(declare-fun e!457649 () Bool)

(declare-fun e!457652 () Bool)

(declare-fun mapRes!23845 () Bool)

(assert (=> b!822941 (= e!457649 (and e!457652 mapRes!23845))))

(declare-fun condMapEmpty!23845 () Bool)

(declare-datatypes ((V!24763 0))(
  ( (V!24764 (val!7458 Int)) )
))
(declare-datatypes ((ValueCell!6995 0))(
  ( (ValueCellFull!6995 (v!9884 V!24763)) (EmptyCell!6995) )
))
(declare-datatypes ((array!45803 0))(
  ( (array!45804 (arr!21951 (Array (_ BitVec 32) ValueCell!6995)) (size!22372 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45803)

(declare-fun mapDefault!23845 () ValueCell!6995)

(assert (=> b!822941 (= condMapEmpty!23845 (= (arr!21951 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6995)) mapDefault!23845)))))

(declare-fun b!822942 () Bool)

(declare-fun e!457647 () Bool)

(assert (=> b!822942 (= e!457647 true)))

(declare-datatypes ((tuple2!9862 0))(
  ( (tuple2!9863 (_1!4942 (_ BitVec 64)) (_2!4942 V!24763)) )
))
(declare-datatypes ((List!15669 0))(
  ( (Nil!15666) (Cons!15665 (h!16794 tuple2!9862) (t!21999 List!15669)) )
))
(declare-datatypes ((ListLongMap!8675 0))(
  ( (ListLongMap!8676 (toList!4353 List!15669)) )
))
(declare-fun lt!370733 () ListLongMap!8675)

(declare-fun lt!370732 () ListLongMap!8675)

(declare-fun lt!370739 () tuple2!9862)

(declare-fun +!1929 (ListLongMap!8675 tuple2!9862) ListLongMap!8675)

(assert (=> b!822942 (= lt!370733 (+!1929 lt!370732 lt!370739))))

(declare-fun lt!370731 () ListLongMap!8675)

(declare-fun zeroValueAfter!34 () V!24763)

(declare-fun minValue!754 () V!24763)

(declare-datatypes ((Unit!28128 0))(
  ( (Unit!28129) )
))
(declare-fun lt!370734 () Unit!28128)

(declare-fun addCommutativeForDiffKeys!460 (ListLongMap!8675 (_ BitVec 64) V!24763 (_ BitVec 64) V!24763) Unit!28128)

(assert (=> b!822942 (= lt!370734 (addCommutativeForDiffKeys!460 lt!370731 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-fun lt!370736 () ListLongMap!8675)

(assert (=> b!822942 (= lt!370736 lt!370733)))

(declare-fun lt!370738 () tuple2!9862)

(assert (=> b!822942 (= lt!370733 (+!1929 (+!1929 lt!370731 lt!370739) lt!370738))))

(assert (=> b!822942 (= lt!370739 (tuple2!9863 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun lt!370737 () ListLongMap!8675)

(assert (=> b!822942 (= lt!370737 lt!370732)))

(assert (=> b!822942 (= lt!370732 (+!1929 lt!370731 lt!370738))))

(assert (=> b!822942 (= lt!370738 (tuple2!9863 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(declare-datatypes ((array!45805 0))(
  ( (array!45806 (arr!21952 (Array (_ BitVec 32) (_ BitVec 64))) (size!22373 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45805)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2471 (array!45805 array!45803 (_ BitVec 32) (_ BitVec 32) V!24763 V!24763 (_ BitVec 32) Int) ListLongMap!8675)

(assert (=> b!822942 (= lt!370736 (getCurrentListMap!2471 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!24763)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!822942 (= lt!370737 (getCurrentListMap!2471 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!822943 () Bool)

(declare-fun res!561279 () Bool)

(declare-fun e!457650 () Bool)

(assert (=> b!822943 (=> (not res!561279) (not e!457650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45805 (_ BitVec 32)) Bool)

(assert (=> b!822943 (= res!561279 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23845 () Bool)

(declare-fun tp!46080 () Bool)

(declare-fun e!457648 () Bool)

(assert (=> mapNonEmpty!23845 (= mapRes!23845 (and tp!46080 e!457648))))

(declare-fun mapValue!23845 () ValueCell!6995)

(declare-fun mapKey!23845 () (_ BitVec 32))

(declare-fun mapRest!23845 () (Array (_ BitVec 32) ValueCell!6995))

(assert (=> mapNonEmpty!23845 (= (arr!21951 _values!788) (store mapRest!23845 mapKey!23845 mapValue!23845))))

(declare-fun b!822944 () Bool)

(declare-fun res!561281 () Bool)

(assert (=> b!822944 (=> (not res!561281) (not e!457650))))

(assert (=> b!822944 (= res!561281 (and (= (size!22372 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22373 _keys!976) (size!22372 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!822945 () Bool)

(assert (=> b!822945 (= e!457650 (not e!457647))))

(declare-fun res!561282 () Bool)

(assert (=> b!822945 (=> res!561282 e!457647)))

(assert (=> b!822945 (= res!561282 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!370735 () ListLongMap!8675)

(assert (=> b!822945 (= lt!370731 lt!370735)))

(declare-fun lt!370730 () Unit!28128)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!491 (array!45805 array!45803 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24763 V!24763 V!24763 V!24763 (_ BitVec 32) Int) Unit!28128)

(assert (=> b!822945 (= lt!370730 (lemmaNoChangeToArrayThenSameMapNoExtras!491 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2398 (array!45805 array!45803 (_ BitVec 32) (_ BitVec 32) V!24763 V!24763 (_ BitVec 32) Int) ListLongMap!8675)

(assert (=> b!822945 (= lt!370735 (getCurrentListMapNoExtraKeys!2398 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!822945 (= lt!370731 (getCurrentListMapNoExtraKeys!2398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!561280 () Bool)

(assert (=> start!70854 (=> (not res!561280) (not e!457650))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70854 (= res!561280 (validMask!0 mask!1312))))

(assert (=> start!70854 e!457650))

(declare-fun tp_is_empty!14821 () Bool)

(assert (=> start!70854 tp_is_empty!14821))

(declare-fun array_inv!17591 (array!45805) Bool)

(assert (=> start!70854 (array_inv!17591 _keys!976)))

(assert (=> start!70854 true))

(declare-fun array_inv!17592 (array!45803) Bool)

(assert (=> start!70854 (and (array_inv!17592 _values!788) e!457649)))

(assert (=> start!70854 tp!46081))

(declare-fun mapIsEmpty!23845 () Bool)

(assert (=> mapIsEmpty!23845 mapRes!23845))

(declare-fun b!822946 () Bool)

(assert (=> b!822946 (= e!457648 tp_is_empty!14821)))

(declare-fun b!822947 () Bool)

(assert (=> b!822947 (= e!457652 tp_is_empty!14821)))

(declare-fun b!822948 () Bool)

(declare-fun res!561278 () Bool)

(assert (=> b!822948 (=> (not res!561278) (not e!457650))))

(declare-datatypes ((List!15670 0))(
  ( (Nil!15667) (Cons!15666 (h!16795 (_ BitVec 64)) (t!22000 List!15670)) )
))
(declare-fun arrayNoDuplicates!0 (array!45805 (_ BitVec 32) List!15670) Bool)

(assert (=> b!822948 (= res!561278 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15667))))

(assert (= (and start!70854 res!561280) b!822944))

(assert (= (and b!822944 res!561281) b!822943))

(assert (= (and b!822943 res!561279) b!822948))

(assert (= (and b!822948 res!561278) b!822945))

(assert (= (and b!822945 (not res!561282)) b!822942))

(assert (= (and b!822941 condMapEmpty!23845) mapIsEmpty!23845))

(assert (= (and b!822941 (not condMapEmpty!23845)) mapNonEmpty!23845))

(get-info :version)

(assert (= (and mapNonEmpty!23845 ((_ is ValueCellFull!6995) mapValue!23845)) b!822946))

(assert (= (and b!822941 ((_ is ValueCellFull!6995) mapDefault!23845)) b!822947))

(assert (= start!70854 b!822941))

(declare-fun m!764513 () Bool)

(assert (=> mapNonEmpty!23845 m!764513))

(declare-fun m!764515 () Bool)

(assert (=> b!822943 m!764515))

(declare-fun m!764517 () Bool)

(assert (=> b!822948 m!764517))

(declare-fun m!764519 () Bool)

(assert (=> start!70854 m!764519))

(declare-fun m!764521 () Bool)

(assert (=> start!70854 m!764521))

(declare-fun m!764523 () Bool)

(assert (=> start!70854 m!764523))

(declare-fun m!764525 () Bool)

(assert (=> b!822945 m!764525))

(declare-fun m!764527 () Bool)

(assert (=> b!822945 m!764527))

(declare-fun m!764529 () Bool)

(assert (=> b!822945 m!764529))

(declare-fun m!764531 () Bool)

(assert (=> b!822942 m!764531))

(declare-fun m!764533 () Bool)

(assert (=> b!822942 m!764533))

(declare-fun m!764535 () Bool)

(assert (=> b!822942 m!764535))

(assert (=> b!822942 m!764531))

(declare-fun m!764537 () Bool)

(assert (=> b!822942 m!764537))

(declare-fun m!764539 () Bool)

(assert (=> b!822942 m!764539))

(declare-fun m!764541 () Bool)

(assert (=> b!822942 m!764541))

(declare-fun m!764543 () Bool)

(assert (=> b!822942 m!764543))

(check-sat (not b!822942) (not b!822948) (not b_next!13111) (not mapNonEmpty!23845) tp_is_empty!14821 b_and!21969 (not start!70854) (not b!822945) (not b!822943))
(check-sat b_and!21969 (not b_next!13111))
