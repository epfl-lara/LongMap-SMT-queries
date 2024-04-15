; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41522 () Bool)

(assert start!41522)

(declare-fun b_free!11203 () Bool)

(declare-fun b_next!11203 () Bool)

(assert (=> start!41522 (= b_free!11203 (not b_next!11203))))

(declare-fun tp!39606 () Bool)

(declare-fun b_and!19517 () Bool)

(assert (=> start!41522 (= tp!39606 b_and!19517)))

(declare-fun mapNonEmpty!20623 () Bool)

(declare-fun mapRes!20623 () Bool)

(declare-fun tp!39607 () Bool)

(declare-fun e!270798 () Bool)

(assert (=> mapNonEmpty!20623 (= mapRes!20623 (and tp!39607 e!270798))))

(declare-datatypes ((V!17947 0))(
  ( (V!17948 (val!6360 Int)) )
))
(declare-datatypes ((ValueCell!5972 0))(
  ( (ValueCellFull!5972 (v!8641 V!17947)) (EmptyCell!5972) )
))
(declare-fun mapValue!20623 () ValueCell!5972)

(declare-datatypes ((array!29053 0))(
  ( (array!29054 (arr!13958 (Array (_ BitVec 32) ValueCell!5972)) (size!14311 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29053)

(declare-fun mapRest!20623 () (Array (_ BitVec 32) ValueCell!5972))

(declare-fun mapKey!20623 () (_ BitVec 32))

(assert (=> mapNonEmpty!20623 (= (arr!13958 _values!833) (store mapRest!20623 mapKey!20623 mapValue!20623))))

(declare-fun res!277282 () Bool)

(declare-fun e!270795 () Bool)

(assert (=> start!41522 (=> (not res!277282) (not e!270795))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41522 (= res!277282 (validMask!0 mask!1365))))

(assert (=> start!41522 e!270795))

(declare-fun tp_is_empty!12631 () Bool)

(assert (=> start!41522 tp_is_empty!12631))

(assert (=> start!41522 tp!39606))

(assert (=> start!41522 true))

(declare-datatypes ((array!29055 0))(
  ( (array!29056 (arr!13959 (Array (_ BitVec 32) (_ BitVec 64))) (size!14312 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29055)

(declare-fun array_inv!10158 (array!29055) Bool)

(assert (=> start!41522 (array_inv!10158 _keys!1025)))

(declare-fun e!270794 () Bool)

(declare-fun array_inv!10159 (array!29053) Bool)

(assert (=> start!41522 (and (array_inv!10159 _values!833) e!270794)))

(declare-fun b!463707 () Bool)

(assert (=> b!463707 (= e!270795 false)))

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8364 0))(
  ( (tuple2!8365 (_1!4193 (_ BitVec 64)) (_2!4193 V!17947)) )
))
(declare-datatypes ((List!8451 0))(
  ( (Nil!8448) (Cons!8447 (h!9303 tuple2!8364) (t!14388 List!8451)) )
))
(declare-datatypes ((ListLongMap!7267 0))(
  ( (ListLongMap!7268 (toList!3649 List!8451)) )
))
(declare-fun lt!209299 () ListLongMap!7267)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun zeroValue!794 () V!17947)

(declare-fun minValueAfter!38 () V!17947)

(declare-fun getCurrentListMapNoExtraKeys!1841 (array!29055 array!29053 (_ BitVec 32) (_ BitVec 32) V!17947 V!17947 (_ BitVec 32) Int) ListLongMap!7267)

(assert (=> b!463707 (= lt!209299 (getCurrentListMapNoExtraKeys!1841 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!17947)

(declare-fun lt!209300 () ListLongMap!7267)

(assert (=> b!463707 (= lt!209300 (getCurrentListMapNoExtraKeys!1841 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463708 () Bool)

(declare-fun res!277283 () Bool)

(assert (=> b!463708 (=> (not res!277283) (not e!270795))))

(assert (=> b!463708 (= res!277283 (and (= (size!14311 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14312 _keys!1025) (size!14311 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463709 () Bool)

(declare-fun res!277281 () Bool)

(assert (=> b!463709 (=> (not res!277281) (not e!270795))))

(declare-datatypes ((List!8452 0))(
  ( (Nil!8449) (Cons!8448 (h!9304 (_ BitVec 64)) (t!14389 List!8452)) )
))
(declare-fun arrayNoDuplicates!0 (array!29055 (_ BitVec 32) List!8452) Bool)

(assert (=> b!463709 (= res!277281 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8449))))

(declare-fun mapIsEmpty!20623 () Bool)

(assert (=> mapIsEmpty!20623 mapRes!20623))

(declare-fun b!463710 () Bool)

(declare-fun e!270796 () Bool)

(assert (=> b!463710 (= e!270796 tp_is_empty!12631)))

(declare-fun b!463711 () Bool)

(assert (=> b!463711 (= e!270794 (and e!270796 mapRes!20623))))

(declare-fun condMapEmpty!20623 () Bool)

(declare-fun mapDefault!20623 () ValueCell!5972)

(assert (=> b!463711 (= condMapEmpty!20623 (= (arr!13958 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5972)) mapDefault!20623)))))

(declare-fun b!463712 () Bool)

(declare-fun res!277280 () Bool)

(assert (=> b!463712 (=> (not res!277280) (not e!270795))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29055 (_ BitVec 32)) Bool)

(assert (=> b!463712 (= res!277280 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463713 () Bool)

(assert (=> b!463713 (= e!270798 tp_is_empty!12631)))

(assert (= (and start!41522 res!277282) b!463708))

(assert (= (and b!463708 res!277283) b!463712))

(assert (= (and b!463712 res!277280) b!463709))

(assert (= (and b!463709 res!277281) b!463707))

(assert (= (and b!463711 condMapEmpty!20623) mapIsEmpty!20623))

(assert (= (and b!463711 (not condMapEmpty!20623)) mapNonEmpty!20623))

(get-info :version)

(assert (= (and mapNonEmpty!20623 ((_ is ValueCellFull!5972) mapValue!20623)) b!463713))

(assert (= (and b!463711 ((_ is ValueCellFull!5972) mapDefault!20623)) b!463710))

(assert (= start!41522 b!463711))

(declare-fun m!445707 () Bool)

(assert (=> b!463707 m!445707))

(declare-fun m!445709 () Bool)

(assert (=> b!463707 m!445709))

(declare-fun m!445711 () Bool)

(assert (=> mapNonEmpty!20623 m!445711))

(declare-fun m!445713 () Bool)

(assert (=> b!463712 m!445713))

(declare-fun m!445715 () Bool)

(assert (=> start!41522 m!445715))

(declare-fun m!445717 () Bool)

(assert (=> start!41522 m!445717))

(declare-fun m!445719 () Bool)

(assert (=> start!41522 m!445719))

(declare-fun m!445721 () Bool)

(assert (=> b!463709 m!445721))

(check-sat (not b_next!11203) tp_is_empty!12631 (not b!463707) (not start!41522) b_and!19517 (not b!463712) (not mapNonEmpty!20623) (not b!463709))
(check-sat b_and!19517 (not b_next!11203))
