; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42260 () Bool)

(assert start!42260)

(declare-fun b_free!11779 () Bool)

(declare-fun b_next!11779 () Bool)

(assert (=> start!42260 (= b_free!11779 (not b_next!11779))))

(declare-fun tp!41364 () Bool)

(declare-fun b_and!20227 () Bool)

(assert (=> start!42260 (= tp!41364 b_and!20227)))

(declare-fun b!471669 () Bool)

(declare-fun e!276467 () Bool)

(declare-fun tp_is_empty!13207 () Bool)

(assert (=> b!471669 (= e!276467 tp_is_empty!13207)))

(declare-fun b!471670 () Bool)

(declare-fun e!276469 () Bool)

(assert (=> b!471670 (= e!276469 (not true))))

(declare-datatypes ((V!18715 0))(
  ( (V!18716 (val!6648 Int)) )
))
(declare-datatypes ((tuple2!8674 0))(
  ( (tuple2!8675 (_1!4348 (_ BitVec 64)) (_2!4348 V!18715)) )
))
(declare-datatypes ((List!8743 0))(
  ( (Nil!8740) (Cons!8739 (h!9595 tuple2!8674) (t!14701 List!8743)) )
))
(declare-datatypes ((ListLongMap!7589 0))(
  ( (ListLongMap!7590 (toList!3810 List!8743)) )
))
(declare-fun lt!214028 () ListLongMap!7589)

(declare-fun lt!214026 () ListLongMap!7589)

(assert (=> b!471670 (= lt!214028 lt!214026)))

(declare-fun minValueBefore!38 () V!18715)

(declare-fun zeroValue!794 () V!18715)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13833 0))(
  ( (Unit!13834) )
))
(declare-fun lt!214027 () Unit!13833)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30162 0))(
  ( (array!30163 (arr!14502 (Array (_ BitVec 32) (_ BitVec 64))) (size!14854 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30162)

(declare-datatypes ((ValueCell!6260 0))(
  ( (ValueCellFull!6260 (v!8940 V!18715)) (EmptyCell!6260) )
))
(declare-datatypes ((array!30164 0))(
  ( (array!30165 (arr!14503 (Array (_ BitVec 32) ValueCell!6260)) (size!14855 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30164)

(declare-fun minValueAfter!38 () V!18715)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!185 (array!30162 array!30164 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18715 V!18715 V!18715 V!18715 (_ BitVec 32) Int) Unit!13833)

(assert (=> b!471670 (= lt!214027 (lemmaNoChangeToArrayThenSameMapNoExtras!185 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2025 (array!30162 array!30164 (_ BitVec 32) (_ BitVec 32) V!18715 V!18715 (_ BitVec 32) Int) ListLongMap!7589)

(assert (=> b!471670 (= lt!214026 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471670 (= lt!214028 (getCurrentListMapNoExtraKeys!2025 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471671 () Bool)

(declare-fun res!281797 () Bool)

(assert (=> b!471671 (=> (not res!281797) (not e!276469))))

(declare-datatypes ((List!8744 0))(
  ( (Nil!8741) (Cons!8740 (h!9596 (_ BitVec 64)) (t!14702 List!8744)) )
))
(declare-fun arrayNoDuplicates!0 (array!30162 (_ BitVec 32) List!8744) Bool)

(assert (=> b!471671 (= res!281797 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8741))))

(declare-fun res!281796 () Bool)

(assert (=> start!42260 (=> (not res!281796) (not e!276469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42260 (= res!281796 (validMask!0 mask!1365))))

(assert (=> start!42260 e!276469))

(assert (=> start!42260 tp_is_empty!13207))

(assert (=> start!42260 tp!41364))

(assert (=> start!42260 true))

(declare-fun array_inv!10550 (array!30162) Bool)

(assert (=> start!42260 (array_inv!10550 _keys!1025)))

(declare-fun e!276470 () Bool)

(declare-fun array_inv!10551 (array!30164) Bool)

(assert (=> start!42260 (and (array_inv!10551 _values!833) e!276470)))

(declare-fun mapIsEmpty!21517 () Bool)

(declare-fun mapRes!21517 () Bool)

(assert (=> mapIsEmpty!21517 mapRes!21517))

(declare-fun b!471672 () Bool)

(declare-fun e!276468 () Bool)

(assert (=> b!471672 (= e!276468 tp_is_empty!13207)))

(declare-fun b!471673 () Bool)

(assert (=> b!471673 (= e!276470 (and e!276468 mapRes!21517))))

(declare-fun condMapEmpty!21517 () Bool)

(declare-fun mapDefault!21517 () ValueCell!6260)

(assert (=> b!471673 (= condMapEmpty!21517 (= (arr!14503 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6260)) mapDefault!21517)))))

(declare-fun b!471674 () Bool)

(declare-fun res!281795 () Bool)

(assert (=> b!471674 (=> (not res!281795) (not e!276469))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30162 (_ BitVec 32)) Bool)

(assert (=> b!471674 (= res!281795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471675 () Bool)

(declare-fun res!281794 () Bool)

(assert (=> b!471675 (=> (not res!281794) (not e!276469))))

(assert (=> b!471675 (= res!281794 (and (= (size!14855 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14854 _keys!1025) (size!14855 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21517 () Bool)

(declare-fun tp!41365 () Bool)

(assert (=> mapNonEmpty!21517 (= mapRes!21517 (and tp!41365 e!276467))))

(declare-fun mapKey!21517 () (_ BitVec 32))

(declare-fun mapValue!21517 () ValueCell!6260)

(declare-fun mapRest!21517 () (Array (_ BitVec 32) ValueCell!6260))

(assert (=> mapNonEmpty!21517 (= (arr!14503 _values!833) (store mapRest!21517 mapKey!21517 mapValue!21517))))

(assert (= (and start!42260 res!281796) b!471675))

(assert (= (and b!471675 res!281794) b!471674))

(assert (= (and b!471674 res!281795) b!471671))

(assert (= (and b!471671 res!281797) b!471670))

(assert (= (and b!471673 condMapEmpty!21517) mapIsEmpty!21517))

(assert (= (and b!471673 (not condMapEmpty!21517)) mapNonEmpty!21517))

(get-info :version)

(assert (= (and mapNonEmpty!21517 ((_ is ValueCellFull!6260) mapValue!21517)) b!471669))

(assert (= (and b!471673 ((_ is ValueCellFull!6260) mapDefault!21517)) b!471672))

(assert (= start!42260 b!471673))

(declare-fun m!454003 () Bool)

(assert (=> b!471671 m!454003))

(declare-fun m!454005 () Bool)

(assert (=> b!471674 m!454005))

(declare-fun m!454007 () Bool)

(assert (=> mapNonEmpty!21517 m!454007))

(declare-fun m!454009 () Bool)

(assert (=> b!471670 m!454009))

(declare-fun m!454011 () Bool)

(assert (=> b!471670 m!454011))

(declare-fun m!454013 () Bool)

(assert (=> b!471670 m!454013))

(declare-fun m!454015 () Bool)

(assert (=> start!42260 m!454015))

(declare-fun m!454017 () Bool)

(assert (=> start!42260 m!454017))

(declare-fun m!454019 () Bool)

(assert (=> start!42260 m!454019))

(check-sat (not start!42260) (not b!471671) (not b!471674) (not mapNonEmpty!21517) (not b_next!11779) tp_is_empty!13207 (not b!471670) b_and!20227)
(check-sat b_and!20227 (not b_next!11779))
