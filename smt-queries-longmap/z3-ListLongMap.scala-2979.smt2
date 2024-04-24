; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42136 () Bool)

(assert start!42136)

(declare-fun b_free!11683 () Bool)

(declare-fun b_next!11683 () Bool)

(assert (=> start!42136 (= b_free!11683 (not b_next!11683))))

(declare-fun tp!41070 () Bool)

(declare-fun b_and!20115 () Bool)

(assert (=> start!42136 (= tp!41070 b_and!20115)))

(declare-fun b!470491 () Bool)

(declare-fun e!275639 () Bool)

(declare-fun tp_is_empty!13111 () Bool)

(assert (=> b!470491 (= e!275639 tp_is_empty!13111)))

(declare-fun b!470492 () Bool)

(declare-fun e!275640 () Bool)

(declare-fun mapRes!21367 () Bool)

(assert (=> b!470492 (= e!275640 (and e!275639 mapRes!21367))))

(declare-fun condMapEmpty!21367 () Bool)

(declare-datatypes ((V!18587 0))(
  ( (V!18588 (val!6600 Int)) )
))
(declare-datatypes ((ValueCell!6212 0))(
  ( (ValueCellFull!6212 (v!8892 V!18587)) (EmptyCell!6212) )
))
(declare-datatypes ((array!29976 0))(
  ( (array!29977 (arr!14411 (Array (_ BitVec 32) ValueCell!6212)) (size!14763 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29976)

(declare-fun mapDefault!21367 () ValueCell!6212)

(assert (=> b!470492 (= condMapEmpty!21367 (= (arr!14411 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6212)) mapDefault!21367)))))

(declare-fun mapNonEmpty!21367 () Bool)

(declare-fun tp!41071 () Bool)

(declare-fun e!275638 () Bool)

(assert (=> mapNonEmpty!21367 (= mapRes!21367 (and tp!41071 e!275638))))

(declare-fun mapRest!21367 () (Array (_ BitVec 32) ValueCell!6212))

(declare-fun mapValue!21367 () ValueCell!6212)

(declare-fun mapKey!21367 () (_ BitVec 32))

(assert (=> mapNonEmpty!21367 (= (arr!14411 _values!833) (store mapRest!21367 mapKey!21367 mapValue!21367))))

(declare-fun b!470493 () Bool)

(assert (=> b!470493 (= e!275638 tp_is_empty!13111)))

(declare-fun b!470494 () Bool)

(declare-fun res!281157 () Bool)

(declare-fun e!275641 () Bool)

(assert (=> b!470494 (=> (not res!281157) (not e!275641))))

(declare-datatypes ((array!29978 0))(
  ( (array!29979 (arr!14412 (Array (_ BitVec 32) (_ BitVec 64))) (size!14764 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29978)

(declare-datatypes ((List!8686 0))(
  ( (Nil!8683) (Cons!8682 (h!9538 (_ BitVec 64)) (t!14640 List!8686)) )
))
(declare-fun arrayNoDuplicates!0 (array!29978 (_ BitVec 32) List!8686) Bool)

(assert (=> b!470494 (= res!281157 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8683))))

(declare-fun mapIsEmpty!21367 () Bool)

(assert (=> mapIsEmpty!21367 mapRes!21367))

(declare-fun b!470495 () Bool)

(assert (=> b!470495 (= e!275641 (not true))))

(declare-datatypes ((tuple2!8612 0))(
  ( (tuple2!8613 (_1!4317 (_ BitVec 64)) (_2!4317 V!18587)) )
))
(declare-datatypes ((List!8687 0))(
  ( (Nil!8684) (Cons!8683 (h!9539 tuple2!8612) (t!14641 List!8687)) )
))
(declare-datatypes ((ListLongMap!7527 0))(
  ( (ListLongMap!7528 (toList!3779 List!8687)) )
))
(declare-fun lt!213516 () ListLongMap!7527)

(declare-fun lt!213514 () ListLongMap!7527)

(assert (=> b!470495 (= lt!213516 lt!213514)))

(declare-datatypes ((Unit!13771 0))(
  ( (Unit!13772) )
))
(declare-fun lt!213515 () Unit!13771)

(declare-fun minValueBefore!38 () V!18587)

(declare-fun zeroValue!794 () V!18587)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18587)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!154 (array!29978 array!29976 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18587 V!18587 V!18587 V!18587 (_ BitVec 32) Int) Unit!13771)

(assert (=> b!470495 (= lt!213515 (lemmaNoChangeToArrayThenSameMapNoExtras!154 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1994 (array!29978 array!29976 (_ BitVec 32) (_ BitVec 32) V!18587 V!18587 (_ BitVec 32) Int) ListLongMap!7527)

(assert (=> b!470495 (= lt!213514 (getCurrentListMapNoExtraKeys!1994 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470495 (= lt!213516 (getCurrentListMapNoExtraKeys!1994 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!281159 () Bool)

(assert (=> start!42136 (=> (not res!281159) (not e!275641))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42136 (= res!281159 (validMask!0 mask!1365))))

(assert (=> start!42136 e!275641))

(assert (=> start!42136 tp_is_empty!13111))

(assert (=> start!42136 tp!41070))

(assert (=> start!42136 true))

(declare-fun array_inv!10488 (array!29978) Bool)

(assert (=> start!42136 (array_inv!10488 _keys!1025)))

(declare-fun array_inv!10489 (array!29976) Bool)

(assert (=> start!42136 (and (array_inv!10489 _values!833) e!275640)))

(declare-fun b!470496 () Bool)

(declare-fun res!281156 () Bool)

(assert (=> b!470496 (=> (not res!281156) (not e!275641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29978 (_ BitVec 32)) Bool)

(assert (=> b!470496 (= res!281156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470497 () Bool)

(declare-fun res!281158 () Bool)

(assert (=> b!470497 (=> (not res!281158) (not e!275641))))

(assert (=> b!470497 (= res!281158 (and (= (size!14763 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14764 _keys!1025) (size!14763 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42136 res!281159) b!470497))

(assert (= (and b!470497 res!281158) b!470496))

(assert (= (and b!470496 res!281156) b!470494))

(assert (= (and b!470494 res!281157) b!470495))

(assert (= (and b!470492 condMapEmpty!21367) mapIsEmpty!21367))

(assert (= (and b!470492 (not condMapEmpty!21367)) mapNonEmpty!21367))

(get-info :version)

(assert (= (and mapNonEmpty!21367 ((_ is ValueCellFull!6212) mapValue!21367)) b!470493))

(assert (= (and b!470492 ((_ is ValueCellFull!6212) mapDefault!21367)) b!470491))

(assert (= start!42136 b!470492))

(declare-fun m!453007 () Bool)

(assert (=> b!470496 m!453007))

(declare-fun m!453009 () Bool)

(assert (=> mapNonEmpty!21367 m!453009))

(declare-fun m!453011 () Bool)

(assert (=> start!42136 m!453011))

(declare-fun m!453013 () Bool)

(assert (=> start!42136 m!453013))

(declare-fun m!453015 () Bool)

(assert (=> start!42136 m!453015))

(declare-fun m!453017 () Bool)

(assert (=> b!470495 m!453017))

(declare-fun m!453019 () Bool)

(assert (=> b!470495 m!453019))

(declare-fun m!453021 () Bool)

(assert (=> b!470495 m!453021))

(declare-fun m!453023 () Bool)

(assert (=> b!470494 m!453023))

(check-sat (not b!470495) (not b!470494) (not b_next!11683) (not b!470496) tp_is_empty!13111 (not start!42136) (not mapNonEmpty!21367) b_and!20115)
(check-sat b_and!20115 (not b_next!11683))
