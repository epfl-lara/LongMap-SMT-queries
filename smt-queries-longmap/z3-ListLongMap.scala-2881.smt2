; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41418 () Bool)

(assert start!41418)

(declare-fun b_free!11097 () Bool)

(declare-fun b_next!11097 () Bool)

(assert (=> start!41418 (= b_free!11097 (not b_next!11097))))

(declare-fun tp!39285 () Bool)

(declare-fun b_and!19433 () Bool)

(assert (=> start!41418 (= tp!39285 b_and!19433)))

(declare-fun b!462792 () Bool)

(declare-fun e!270128 () Bool)

(declare-fun tp_is_empty!12525 () Bool)

(assert (=> b!462792 (= e!270128 tp_is_empty!12525)))

(declare-fun res!276747 () Bool)

(declare-fun e!270125 () Bool)

(assert (=> start!41418 (=> (not res!276747) (not e!270125))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41418 (= res!276747 (validMask!0 mask!1365))))

(assert (=> start!41418 e!270125))

(assert (=> start!41418 tp_is_empty!12525))

(assert (=> start!41418 tp!39285))

(assert (=> start!41418 true))

(declare-datatypes ((array!28851 0))(
  ( (array!28852 (arr!13858 (Array (_ BitVec 32) (_ BitVec 64))) (size!14210 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28851)

(declare-fun array_inv!10020 (array!28851) Bool)

(assert (=> start!41418 (array_inv!10020 _keys!1025)))

(declare-datatypes ((V!17805 0))(
  ( (V!17806 (val!6307 Int)) )
))
(declare-datatypes ((ValueCell!5919 0))(
  ( (ValueCellFull!5919 (v!8594 V!17805)) (EmptyCell!5919) )
))
(declare-datatypes ((array!28853 0))(
  ( (array!28854 (arr!13859 (Array (_ BitVec 32) ValueCell!5919)) (size!14211 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28853)

(declare-fun e!270126 () Bool)

(declare-fun array_inv!10021 (array!28853) Bool)

(assert (=> start!41418 (and (array_inv!10021 _values!833) e!270126)))

(declare-fun mapNonEmpty!20461 () Bool)

(declare-fun mapRes!20461 () Bool)

(declare-fun tp!39286 () Bool)

(declare-fun e!270129 () Bool)

(assert (=> mapNonEmpty!20461 (= mapRes!20461 (and tp!39286 e!270129))))

(declare-fun mapValue!20461 () ValueCell!5919)

(declare-fun mapKey!20461 () (_ BitVec 32))

(declare-fun mapRest!20461 () (Array (_ BitVec 32) ValueCell!5919))

(assert (=> mapNonEmpty!20461 (= (arr!13859 _values!833) (store mapRest!20461 mapKey!20461 mapValue!20461))))

(declare-fun b!462793 () Bool)

(assert (=> b!462793 (= e!270125 false)))

(declare-fun minValueBefore!38 () V!17805)

(declare-fun zeroValue!794 () V!17805)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8262 0))(
  ( (tuple2!8263 (_1!4142 (_ BitVec 64)) (_2!4142 V!17805)) )
))
(declare-datatypes ((List!8355 0))(
  ( (Nil!8352) (Cons!8351 (h!9207 tuple2!8262) (t!14299 List!8355)) )
))
(declare-datatypes ((ListLongMap!7175 0))(
  ( (ListLongMap!7176 (toList!3603 List!8355)) )
))
(declare-fun lt!209261 () ListLongMap!7175)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1783 (array!28851 array!28853 (_ BitVec 32) (_ BitVec 32) V!17805 V!17805 (_ BitVec 32) Int) ListLongMap!7175)

(assert (=> b!462793 (= lt!209261 (getCurrentListMapNoExtraKeys!1783 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20461 () Bool)

(assert (=> mapIsEmpty!20461 mapRes!20461))

(declare-fun b!462794 () Bool)

(declare-fun res!276746 () Bool)

(assert (=> b!462794 (=> (not res!276746) (not e!270125))))

(declare-datatypes ((List!8356 0))(
  ( (Nil!8353) (Cons!8352 (h!9208 (_ BitVec 64)) (t!14300 List!8356)) )
))
(declare-fun arrayNoDuplicates!0 (array!28851 (_ BitVec 32) List!8356) Bool)

(assert (=> b!462794 (= res!276746 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8353))))

(declare-fun b!462795 () Bool)

(declare-fun res!276749 () Bool)

(assert (=> b!462795 (=> (not res!276749) (not e!270125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28851 (_ BitVec 32)) Bool)

(assert (=> b!462795 (= res!276749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462796 () Bool)

(declare-fun res!276748 () Bool)

(assert (=> b!462796 (=> (not res!276748) (not e!270125))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462796 (= res!276748 (and (= (size!14211 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14210 _keys!1025) (size!14211 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462797 () Bool)

(assert (=> b!462797 (= e!270129 tp_is_empty!12525)))

(declare-fun b!462798 () Bool)

(assert (=> b!462798 (= e!270126 (and e!270128 mapRes!20461))))

(declare-fun condMapEmpty!20461 () Bool)

(declare-fun mapDefault!20461 () ValueCell!5919)

(assert (=> b!462798 (= condMapEmpty!20461 (= (arr!13859 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5919)) mapDefault!20461)))))

(assert (= (and start!41418 res!276747) b!462796))

(assert (= (and b!462796 res!276748) b!462795))

(assert (= (and b!462795 res!276749) b!462794))

(assert (= (and b!462794 res!276746) b!462793))

(assert (= (and b!462798 condMapEmpty!20461) mapIsEmpty!20461))

(assert (= (and b!462798 (not condMapEmpty!20461)) mapNonEmpty!20461))

(get-info :version)

(assert (= (and mapNonEmpty!20461 ((_ is ValueCellFull!5919) mapValue!20461)) b!462797))

(assert (= (and b!462798 ((_ is ValueCellFull!5919) mapDefault!20461)) b!462792))

(assert (= start!41418 b!462798))

(declare-fun m!445601 () Bool)

(assert (=> b!462794 m!445601))

(declare-fun m!445603 () Bool)

(assert (=> mapNonEmpty!20461 m!445603))

(declare-fun m!445605 () Bool)

(assert (=> b!462793 m!445605))

(declare-fun m!445607 () Bool)

(assert (=> start!41418 m!445607))

(declare-fun m!445609 () Bool)

(assert (=> start!41418 m!445609))

(declare-fun m!445611 () Bool)

(assert (=> start!41418 m!445611))

(declare-fun m!445613 () Bool)

(assert (=> b!462795 m!445613))

(check-sat (not mapNonEmpty!20461) (not b!462795) tp_is_empty!12525 b_and!19433 (not b!462794) (not b!462793) (not start!41418) (not b_next!11097))
(check-sat b_and!19433 (not b_next!11097))
