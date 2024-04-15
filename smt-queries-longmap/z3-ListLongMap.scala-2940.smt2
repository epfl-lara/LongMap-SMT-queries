; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41832 () Bool)

(assert start!41832)

(declare-fun b_free!11449 () Bool)

(declare-fun b_next!11449 () Bool)

(assert (=> start!41832 (= b_free!11449 (not b_next!11449))))

(declare-fun tp!40357 () Bool)

(declare-fun b_and!19803 () Bool)

(assert (=> start!41832 (= tp!40357 b_and!19803)))

(declare-fun b!466990 () Bool)

(declare-fun e!273133 () Bool)

(declare-fun tp_is_empty!12877 () Bool)

(assert (=> b!466990 (= e!273133 tp_is_empty!12877)))

(declare-fun mapIsEmpty!21004 () Bool)

(declare-fun mapRes!21004 () Bool)

(assert (=> mapIsEmpty!21004 mapRes!21004))

(declare-fun b!466991 () Bool)

(declare-fun e!273134 () Bool)

(assert (=> b!466991 (= e!273134 (not true))))

(declare-datatypes ((V!18275 0))(
  ( (V!18276 (val!6483 Int)) )
))
(declare-datatypes ((tuple2!8550 0))(
  ( (tuple2!8551 (_1!4286 (_ BitVec 64)) (_2!4286 V!18275)) )
))
(declare-datatypes ((List!8631 0))(
  ( (Nil!8628) (Cons!8627 (h!9483 tuple2!8550) (t!14576 List!8631)) )
))
(declare-datatypes ((ListLongMap!7453 0))(
  ( (ListLongMap!7454 (toList!3742 List!8631)) )
))
(declare-fun lt!211040 () ListLongMap!7453)

(declare-fun lt!211038 () ListLongMap!7453)

(assert (=> b!466991 (= lt!211040 lt!211038)))

(declare-fun minValueBefore!38 () V!18275)

(declare-fun zeroValue!794 () V!18275)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13588 0))(
  ( (Unit!13589) )
))
(declare-fun lt!211039 () Unit!13588)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29529 0))(
  ( (array!29530 (arr!14192 (Array (_ BitVec 32) (_ BitVec 64))) (size!14545 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29529)

(declare-datatypes ((ValueCell!6095 0))(
  ( (ValueCellFull!6095 (v!8766 V!18275)) (EmptyCell!6095) )
))
(declare-datatypes ((array!29531 0))(
  ( (array!29532 (arr!14193 (Array (_ BitVec 32) ValueCell!6095)) (size!14546 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29531)

(declare-fun minValueAfter!38 () V!18275)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!83 (array!29529 array!29531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18275 V!18275 V!18275 V!18275 (_ BitVec 32) Int) Unit!13588)

(assert (=> b!466991 (= lt!211039 (lemmaNoChangeToArrayThenSameMapNoExtras!83 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1926 (array!29529 array!29531 (_ BitVec 32) (_ BitVec 32) V!18275 V!18275 (_ BitVec 32) Int) ListLongMap!7453)

(assert (=> b!466991 (= lt!211038 (getCurrentListMapNoExtraKeys!1926 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466991 (= lt!211040 (getCurrentListMapNoExtraKeys!1926 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!279145 () Bool)

(assert (=> start!41832 (=> (not res!279145) (not e!273134))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41832 (= res!279145 (validMask!0 mask!1365))))

(assert (=> start!41832 e!273134))

(assert (=> start!41832 tp_is_empty!12877))

(assert (=> start!41832 tp!40357))

(assert (=> start!41832 true))

(declare-fun array_inv!10330 (array!29529) Bool)

(assert (=> start!41832 (array_inv!10330 _keys!1025)))

(declare-fun e!273132 () Bool)

(declare-fun array_inv!10331 (array!29531) Bool)

(assert (=> start!41832 (and (array_inv!10331 _values!833) e!273132)))

(declare-fun b!466992 () Bool)

(declare-fun res!279147 () Bool)

(assert (=> b!466992 (=> (not res!279147) (not e!273134))))

(assert (=> b!466992 (= res!279147 (and (= (size!14546 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14545 _keys!1025) (size!14546 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!466993 () Bool)

(declare-fun e!273131 () Bool)

(assert (=> b!466993 (= e!273131 tp_is_empty!12877)))

(declare-fun b!466994 () Bool)

(assert (=> b!466994 (= e!273132 (and e!273131 mapRes!21004))))

(declare-fun condMapEmpty!21004 () Bool)

(declare-fun mapDefault!21004 () ValueCell!6095)

(assert (=> b!466994 (= condMapEmpty!21004 (= (arr!14193 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6095)) mapDefault!21004)))))

(declare-fun mapNonEmpty!21004 () Bool)

(declare-fun tp!40356 () Bool)

(assert (=> mapNonEmpty!21004 (= mapRes!21004 (and tp!40356 e!273133))))

(declare-fun mapKey!21004 () (_ BitVec 32))

(declare-fun mapValue!21004 () ValueCell!6095)

(declare-fun mapRest!21004 () (Array (_ BitVec 32) ValueCell!6095))

(assert (=> mapNonEmpty!21004 (= (arr!14193 _values!833) (store mapRest!21004 mapKey!21004 mapValue!21004))))

(declare-fun b!466995 () Bool)

(declare-fun res!279144 () Bool)

(assert (=> b!466995 (=> (not res!279144) (not e!273134))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29529 (_ BitVec 32)) Bool)

(assert (=> b!466995 (= res!279144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466996 () Bool)

(declare-fun res!279146 () Bool)

(assert (=> b!466996 (=> (not res!279146) (not e!273134))))

(declare-datatypes ((List!8632 0))(
  ( (Nil!8629) (Cons!8628 (h!9484 (_ BitVec 64)) (t!14577 List!8632)) )
))
(declare-fun arrayNoDuplicates!0 (array!29529 (_ BitVec 32) List!8632) Bool)

(assert (=> b!466996 (= res!279146 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8629))))

(assert (= (and start!41832 res!279145) b!466992))

(assert (= (and b!466992 res!279147) b!466995))

(assert (= (and b!466995 res!279144) b!466996))

(assert (= (and b!466996 res!279146) b!466991))

(assert (= (and b!466994 condMapEmpty!21004) mapIsEmpty!21004))

(assert (= (and b!466994 (not condMapEmpty!21004)) mapNonEmpty!21004))

(get-info :version)

(assert (= (and mapNonEmpty!21004 ((_ is ValueCellFull!6095) mapValue!21004)) b!466990))

(assert (= (and b!466994 ((_ is ValueCellFull!6095) mapDefault!21004)) b!466993))

(assert (= start!41832 b!466994))

(declare-fun m!448705 () Bool)

(assert (=> b!466996 m!448705))

(declare-fun m!448707 () Bool)

(assert (=> mapNonEmpty!21004 m!448707))

(declare-fun m!448709 () Bool)

(assert (=> b!466995 m!448709))

(declare-fun m!448711 () Bool)

(assert (=> start!41832 m!448711))

(declare-fun m!448713 () Bool)

(assert (=> start!41832 m!448713))

(declare-fun m!448715 () Bool)

(assert (=> start!41832 m!448715))

(declare-fun m!448717 () Bool)

(assert (=> b!466991 m!448717))

(declare-fun m!448719 () Bool)

(assert (=> b!466991 m!448719))

(declare-fun m!448721 () Bool)

(assert (=> b!466991 m!448721))

(check-sat (not b!466995) (not b!466991) (not b_next!11449) tp_is_empty!12877 (not mapNonEmpty!21004) (not start!41832) b_and!19803 (not b!466996))
(check-sat b_and!19803 (not b_next!11449))
