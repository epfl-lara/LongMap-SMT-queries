; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42260 () Bool)

(assert start!42260)

(declare-fun b_free!11779 () Bool)

(declare-fun b_next!11779 () Bool)

(assert (=> start!42260 (= b_free!11779 (not b_next!11779))))

(declare-fun tp!41365 () Bool)

(declare-fun b_and!20191 () Bool)

(assert (=> start!42260 (= tp!41365 b_and!20191)))

(declare-fun mapIsEmpty!21517 () Bool)

(declare-fun mapRes!21517 () Bool)

(assert (=> mapIsEmpty!21517 mapRes!21517))

(declare-fun b!471460 () Bool)

(declare-fun res!281675 () Bool)

(declare-fun e!276336 () Bool)

(assert (=> b!471460 (=> (not res!281675) (not e!276336))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30159 0))(
  ( (array!30160 (arr!14501 (Array (_ BitVec 32) (_ BitVec 64))) (size!14854 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30159)

(declare-datatypes ((V!18715 0))(
  ( (V!18716 (val!6648 Int)) )
))
(declare-datatypes ((ValueCell!6260 0))(
  ( (ValueCellFull!6260 (v!8933 V!18715)) (EmptyCell!6260) )
))
(declare-datatypes ((array!30161 0))(
  ( (array!30162 (arr!14502 (Array (_ BitVec 32) ValueCell!6260)) (size!14855 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30161)

(assert (=> b!471460 (= res!281675 (and (= (size!14855 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14854 _keys!1025) (size!14855 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471461 () Bool)

(declare-fun e!276332 () Bool)

(declare-fun tp_is_empty!13207 () Bool)

(assert (=> b!471461 (= e!276332 tp_is_empty!13207)))

(declare-fun b!471462 () Bool)

(assert (=> b!471462 (= e!276336 (not true))))

(declare-datatypes ((tuple2!8790 0))(
  ( (tuple2!8791 (_1!4406 (_ BitVec 64)) (_2!4406 V!18715)) )
))
(declare-datatypes ((List!8861 0))(
  ( (Nil!8858) (Cons!8857 (h!9713 tuple2!8790) (t!14818 List!8861)) )
))
(declare-datatypes ((ListLongMap!7693 0))(
  ( (ListLongMap!7694 (toList!3862 List!8861)) )
))
(declare-fun lt!213782 () ListLongMap!7693)

(declare-fun lt!213780 () ListLongMap!7693)

(assert (=> b!471462 (= lt!213782 lt!213780)))

(declare-fun minValueBefore!38 () V!18715)

(declare-datatypes ((Unit!13825 0))(
  ( (Unit!13826) )
))
(declare-fun lt!213781 () Unit!13825)

(declare-fun zeroValue!794 () V!18715)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18715)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!194 (array!30159 array!30161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18715 V!18715 V!18715 V!18715 (_ BitVec 32) Int) Unit!13825)

(assert (=> b!471462 (= lt!213781 (lemmaNoChangeToArrayThenSameMapNoExtras!194 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2037 (array!30159 array!30161 (_ BitVec 32) (_ BitVec 32) V!18715 V!18715 (_ BitVec 32) Int) ListLongMap!7693)

(assert (=> b!471462 (= lt!213780 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471462 (= lt!213782 (getCurrentListMapNoExtraKeys!2037 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21517 () Bool)

(declare-fun tp!41364 () Bool)

(declare-fun e!276335 () Bool)

(assert (=> mapNonEmpty!21517 (= mapRes!21517 (and tp!41364 e!276335))))

(declare-fun mapRest!21517 () (Array (_ BitVec 32) ValueCell!6260))

(declare-fun mapValue!21517 () ValueCell!6260)

(declare-fun mapKey!21517 () (_ BitVec 32))

(assert (=> mapNonEmpty!21517 (= (arr!14502 _values!833) (store mapRest!21517 mapKey!21517 mapValue!21517))))

(declare-fun b!471463 () Bool)

(declare-fun res!281673 () Bool)

(assert (=> b!471463 (=> (not res!281673) (not e!276336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30159 (_ BitVec 32)) Bool)

(assert (=> b!471463 (= res!281673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471459 () Bool)

(declare-fun res!281674 () Bool)

(assert (=> b!471459 (=> (not res!281674) (not e!276336))))

(declare-datatypes ((List!8862 0))(
  ( (Nil!8859) (Cons!8858 (h!9714 (_ BitVec 64)) (t!14819 List!8862)) )
))
(declare-fun arrayNoDuplicates!0 (array!30159 (_ BitVec 32) List!8862) Bool)

(assert (=> b!471459 (= res!281674 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8859))))

(declare-fun res!281672 () Bool)

(assert (=> start!42260 (=> (not res!281672) (not e!276336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42260 (= res!281672 (validMask!0 mask!1365))))

(assert (=> start!42260 e!276336))

(assert (=> start!42260 tp_is_empty!13207))

(assert (=> start!42260 tp!41365))

(assert (=> start!42260 true))

(declare-fun array_inv!10546 (array!30159) Bool)

(assert (=> start!42260 (array_inv!10546 _keys!1025)))

(declare-fun e!276334 () Bool)

(declare-fun array_inv!10547 (array!30161) Bool)

(assert (=> start!42260 (and (array_inv!10547 _values!833) e!276334)))

(declare-fun b!471464 () Bool)

(assert (=> b!471464 (= e!276335 tp_is_empty!13207)))

(declare-fun b!471465 () Bool)

(assert (=> b!471465 (= e!276334 (and e!276332 mapRes!21517))))

(declare-fun condMapEmpty!21517 () Bool)

(declare-fun mapDefault!21517 () ValueCell!6260)

(assert (=> b!471465 (= condMapEmpty!21517 (= (arr!14502 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6260)) mapDefault!21517)))))

(assert (= (and start!42260 res!281672) b!471460))

(assert (= (and b!471460 res!281675) b!471463))

(assert (= (and b!471463 res!281673) b!471459))

(assert (= (and b!471459 res!281674) b!471462))

(assert (= (and b!471465 condMapEmpty!21517) mapIsEmpty!21517))

(assert (= (and b!471465 (not condMapEmpty!21517)) mapNonEmpty!21517))

(get-info :version)

(assert (= (and mapNonEmpty!21517 ((_ is ValueCellFull!6260) mapValue!21517)) b!471464))

(assert (= (and b!471465 ((_ is ValueCellFull!6260) mapDefault!21517)) b!471461))

(assert (= start!42260 b!471465))

(declare-fun m!453087 () Bool)

(assert (=> start!42260 m!453087))

(declare-fun m!453089 () Bool)

(assert (=> start!42260 m!453089))

(declare-fun m!453091 () Bool)

(assert (=> start!42260 m!453091))

(declare-fun m!453093 () Bool)

(assert (=> mapNonEmpty!21517 m!453093))

(declare-fun m!453095 () Bool)

(assert (=> b!471462 m!453095))

(declare-fun m!453097 () Bool)

(assert (=> b!471462 m!453097))

(declare-fun m!453099 () Bool)

(assert (=> b!471462 m!453099))

(declare-fun m!453101 () Bool)

(assert (=> b!471459 m!453101))

(declare-fun m!453103 () Bool)

(assert (=> b!471463 m!453103))

(check-sat (not start!42260) b_and!20191 (not b!471459) tp_is_empty!13207 (not b!471462) (not mapNonEmpty!21517) (not b_next!11779) (not b!471463))
(check-sat b_and!20191 (not b_next!11779))
