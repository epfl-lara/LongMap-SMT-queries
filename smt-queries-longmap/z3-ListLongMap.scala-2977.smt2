; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42140 () Bool)

(assert start!42140)

(declare-fun b_free!11673 () Bool)

(declare-fun b_next!11673 () Bool)

(assert (=> start!42140 (= b_free!11673 (not b_next!11673))))

(declare-fun tp!41041 () Bool)

(declare-fun b_and!20095 () Bool)

(assert (=> start!42140 (= tp!41041 b_and!20095)))

(declare-fun b!470447 () Bool)

(declare-fun e!275604 () Bool)

(declare-fun tp_is_empty!13101 () Bool)

(assert (=> b!470447 (= e!275604 tp_is_empty!13101)))

(declare-fun b!470448 () Bool)

(declare-fun e!275601 () Bool)

(assert (=> b!470448 (= e!275601 tp_is_empty!13101)))

(declare-fun b!470449 () Bool)

(declare-fun res!281103 () Bool)

(declare-fun e!275603 () Bool)

(assert (=> b!470449 (=> (not res!281103) (not e!275603))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29973 0))(
  ( (array!29974 (arr!14410 (Array (_ BitVec 32) (_ BitVec 64))) (size!14762 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29973)

(declare-datatypes ((V!18573 0))(
  ( (V!18574 (val!6595 Int)) )
))
(declare-datatypes ((ValueCell!6207 0))(
  ( (ValueCellFull!6207 (v!8886 V!18573)) (EmptyCell!6207) )
))
(declare-datatypes ((array!29975 0))(
  ( (array!29976 (arr!14411 (Array (_ BitVec 32) ValueCell!6207)) (size!14763 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29975)

(assert (=> b!470449 (= res!281103 (and (= (size!14763 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14762 _keys!1025) (size!14763 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470450 () Bool)

(declare-fun e!275605 () Bool)

(declare-fun mapRes!21352 () Bool)

(assert (=> b!470450 (= e!275605 (and e!275601 mapRes!21352))))

(declare-fun condMapEmpty!21352 () Bool)

(declare-fun mapDefault!21352 () ValueCell!6207)

(assert (=> b!470450 (= condMapEmpty!21352 (= (arr!14411 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6207)) mapDefault!21352)))))

(declare-fun mapIsEmpty!21352 () Bool)

(assert (=> mapIsEmpty!21352 mapRes!21352))

(declare-fun b!470452 () Bool)

(declare-fun res!281106 () Bool)

(assert (=> b!470452 (=> (not res!281106) (not e!275603))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29973 (_ BitVec 32)) Bool)

(assert (=> b!470452 (= res!281106 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470453 () Bool)

(assert (=> b!470453 (= e!275603 (not true))))

(declare-datatypes ((tuple2!8688 0))(
  ( (tuple2!8689 (_1!4355 (_ BitVec 64)) (_2!4355 V!18573)) )
))
(declare-datatypes ((List!8767 0))(
  ( (Nil!8764) (Cons!8763 (h!9619 tuple2!8688) (t!14729 List!8767)) )
))
(declare-datatypes ((ListLongMap!7601 0))(
  ( (ListLongMap!7602 (toList!3816 List!8767)) )
))
(declare-fun lt!213457 () ListLongMap!7601)

(declare-fun lt!213458 () ListLongMap!7601)

(assert (=> b!470453 (= lt!213457 lt!213458)))

(declare-fun minValueBefore!38 () V!18573)

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!18573)

(declare-datatypes ((Unit!13791 0))(
  ( (Unit!13792) )
))
(declare-fun lt!213459 () Unit!13791)

(declare-fun minValueAfter!38 () V!18573)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!159 (array!29973 array!29975 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18573 V!18573 V!18573 V!18573 (_ BitVec 32) Int) Unit!13791)

(assert (=> b!470453 (= lt!213459 (lemmaNoChangeToArrayThenSameMapNoExtras!159 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1979 (array!29973 array!29975 (_ BitVec 32) (_ BitVec 32) V!18573 V!18573 (_ BitVec 32) Int) ListLongMap!7601)

(assert (=> b!470453 (= lt!213458 (getCurrentListMapNoExtraKeys!1979 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470453 (= lt!213457 (getCurrentListMapNoExtraKeys!1979 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21352 () Bool)

(declare-fun tp!41040 () Bool)

(assert (=> mapNonEmpty!21352 (= mapRes!21352 (and tp!41040 e!275604))))

(declare-fun mapValue!21352 () ValueCell!6207)

(declare-fun mapRest!21352 () (Array (_ BitVec 32) ValueCell!6207))

(declare-fun mapKey!21352 () (_ BitVec 32))

(assert (=> mapNonEmpty!21352 (= (arr!14411 _values!833) (store mapRest!21352 mapKey!21352 mapValue!21352))))

(declare-fun res!281104 () Bool)

(assert (=> start!42140 (=> (not res!281104) (not e!275603))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42140 (= res!281104 (validMask!0 mask!1365))))

(assert (=> start!42140 e!275603))

(assert (=> start!42140 tp_is_empty!13101))

(assert (=> start!42140 tp!41041))

(assert (=> start!42140 true))

(declare-fun array_inv!10398 (array!29973) Bool)

(assert (=> start!42140 (array_inv!10398 _keys!1025)))

(declare-fun array_inv!10399 (array!29975) Bool)

(assert (=> start!42140 (and (array_inv!10399 _values!833) e!275605)))

(declare-fun b!470451 () Bool)

(declare-fun res!281105 () Bool)

(assert (=> b!470451 (=> (not res!281105) (not e!275603))))

(declare-datatypes ((List!8768 0))(
  ( (Nil!8765) (Cons!8764 (h!9620 (_ BitVec 64)) (t!14730 List!8768)) )
))
(declare-fun arrayNoDuplicates!0 (array!29973 (_ BitVec 32) List!8768) Bool)

(assert (=> b!470451 (= res!281105 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8765))))

(assert (= (and start!42140 res!281104) b!470449))

(assert (= (and b!470449 res!281103) b!470452))

(assert (= (and b!470452 res!281106) b!470451))

(assert (= (and b!470451 res!281105) b!470453))

(assert (= (and b!470450 condMapEmpty!21352) mapIsEmpty!21352))

(assert (= (and b!470450 (not condMapEmpty!21352)) mapNonEmpty!21352))

(get-info :version)

(assert (= (and mapNonEmpty!21352 ((_ is ValueCellFull!6207) mapValue!21352)) b!470447))

(assert (= (and b!470450 ((_ is ValueCellFull!6207) mapDefault!21352)) b!470448))

(assert (= start!42140 b!470450))

(declare-fun m!452735 () Bool)

(assert (=> b!470452 m!452735))

(declare-fun m!452737 () Bool)

(assert (=> start!42140 m!452737))

(declare-fun m!452739 () Bool)

(assert (=> start!42140 m!452739))

(declare-fun m!452741 () Bool)

(assert (=> start!42140 m!452741))

(declare-fun m!452743 () Bool)

(assert (=> b!470453 m!452743))

(declare-fun m!452745 () Bool)

(assert (=> b!470453 m!452745))

(declare-fun m!452747 () Bool)

(assert (=> b!470453 m!452747))

(declare-fun m!452749 () Bool)

(assert (=> mapNonEmpty!21352 m!452749))

(declare-fun m!452751 () Bool)

(assert (=> b!470451 m!452751))

(check-sat (not b!470451) (not start!42140) b_and!20095 (not b!470453) (not mapNonEmpty!21352) (not b!470452) tp_is_empty!13101 (not b_next!11673))
(check-sat b_and!20095 (not b_next!11673))
