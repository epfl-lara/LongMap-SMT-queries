; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41414 () Bool)

(assert start!41414)

(declare-fun b_free!11107 () Bool)

(declare-fun b_next!11107 () Bool)

(assert (=> start!41414 (= b_free!11107 (not b_next!11107))))

(declare-fun tp!39316 () Bool)

(declare-fun b_and!19453 () Bool)

(assert (=> start!41414 (= tp!39316 b_and!19453)))

(declare-fun mapNonEmpty!20476 () Bool)

(declare-fun mapRes!20476 () Bool)

(declare-fun tp!39315 () Bool)

(declare-fun e!270164 () Bool)

(assert (=> mapNonEmpty!20476 (= mapRes!20476 (and tp!39315 e!270164))))

(declare-datatypes ((V!17819 0))(
  ( (V!17820 (val!6312 Int)) )
))
(declare-datatypes ((ValueCell!5924 0))(
  ( (ValueCellFull!5924 (v!8600 V!17819)) (EmptyCell!5924) )
))
(declare-datatypes ((array!28866 0))(
  ( (array!28867 (arr!13865 (Array (_ BitVec 32) ValueCell!5924)) (size!14217 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28866)

(declare-fun mapKey!20476 () (_ BitVec 32))

(declare-fun mapRest!20476 () (Array (_ BitVec 32) ValueCell!5924))

(declare-fun mapValue!20476 () ValueCell!5924)

(assert (=> mapNonEmpty!20476 (= (arr!13865 _values!833) (store mapRest!20476 mapKey!20476 mapValue!20476))))

(declare-fun mapIsEmpty!20476 () Bool)

(assert (=> mapIsEmpty!20476 mapRes!20476))

(declare-fun b!462836 () Bool)

(declare-fun res!276802 () Bool)

(declare-fun e!270161 () Bool)

(assert (=> b!462836 (=> (not res!276802) (not e!270161))))

(declare-datatypes ((array!28868 0))(
  ( (array!28869 (arr!13866 (Array (_ BitVec 32) (_ BitVec 64))) (size!14218 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28868)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28868 (_ BitVec 32)) Bool)

(assert (=> b!462836 (= res!276802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462837 () Bool)

(declare-fun e!270162 () Bool)

(declare-fun tp_is_empty!12535 () Bool)

(assert (=> b!462837 (= e!270162 tp_is_empty!12535)))

(declare-fun b!462838 () Bool)

(assert (=> b!462838 (= e!270164 tp_is_empty!12535)))

(declare-fun res!276799 () Bool)

(assert (=> start!41414 (=> (not res!276799) (not e!270161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41414 (= res!276799 (validMask!0 mask!1365))))

(assert (=> start!41414 e!270161))

(assert (=> start!41414 tp_is_empty!12535))

(assert (=> start!41414 tp!39316))

(assert (=> start!41414 true))

(declare-fun array_inv!10104 (array!28868) Bool)

(assert (=> start!41414 (array_inv!10104 _keys!1025)))

(declare-fun e!270163 () Bool)

(declare-fun array_inv!10105 (array!28866) Bool)

(assert (=> start!41414 (and (array_inv!10105 _values!833) e!270163)))

(declare-fun b!462839 () Bool)

(assert (=> b!462839 (= e!270163 (and e!270162 mapRes!20476))))

(declare-fun condMapEmpty!20476 () Bool)

(declare-fun mapDefault!20476 () ValueCell!5924)

(assert (=> b!462839 (= condMapEmpty!20476 (= (arr!13865 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5924)) mapDefault!20476)))))

(declare-fun b!462840 () Bool)

(declare-fun res!276800 () Bool)

(assert (=> b!462840 (=> (not res!276800) (not e!270161))))

(declare-datatypes ((List!8284 0))(
  ( (Nil!8281) (Cons!8280 (h!9136 (_ BitVec 64)) (t!14220 List!8284)) )
))
(declare-fun arrayNoDuplicates!0 (array!28868 (_ BitVec 32) List!8284) Bool)

(assert (=> b!462840 (= res!276800 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8281))))

(declare-fun b!462841 () Bool)

(assert (=> b!462841 (= e!270161 false)))

(declare-fun minValueBefore!38 () V!17819)

(declare-fun zeroValue!794 () V!17819)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8202 0))(
  ( (tuple2!8203 (_1!4112 (_ BitVec 64)) (_2!4112 V!17819)) )
))
(declare-datatypes ((List!8285 0))(
  ( (Nil!8282) (Cons!8281 (h!9137 tuple2!8202) (t!14221 List!8285)) )
))
(declare-datatypes ((ListLongMap!7117 0))(
  ( (ListLongMap!7118 (toList!3574 List!8285)) )
))
(declare-fun lt!209288 () ListLongMap!7117)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1801 (array!28868 array!28866 (_ BitVec 32) (_ BitVec 32) V!17819 V!17819 (_ BitVec 32) Int) ListLongMap!7117)

(assert (=> b!462841 (= lt!209288 (getCurrentListMapNoExtraKeys!1801 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462842 () Bool)

(declare-fun res!276801 () Bool)

(assert (=> b!462842 (=> (not res!276801) (not e!270161))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462842 (= res!276801 (and (= (size!14217 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14218 _keys!1025) (size!14217 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41414 res!276799) b!462842))

(assert (= (and b!462842 res!276801) b!462836))

(assert (= (and b!462836 res!276802) b!462840))

(assert (= (and b!462840 res!276800) b!462841))

(assert (= (and b!462839 condMapEmpty!20476) mapIsEmpty!20476))

(assert (= (and b!462839 (not condMapEmpty!20476)) mapNonEmpty!20476))

(get-info :version)

(assert (= (and mapNonEmpty!20476 ((_ is ValueCellFull!5924) mapValue!20476)) b!462838))

(assert (= (and b!462839 ((_ is ValueCellFull!5924) mapDefault!20476)) b!462837))

(assert (= start!41414 b!462839))

(declare-fun m!445853 () Bool)

(assert (=> b!462840 m!445853))

(declare-fun m!445855 () Bool)

(assert (=> b!462836 m!445855))

(declare-fun m!445857 () Bool)

(assert (=> b!462841 m!445857))

(declare-fun m!445859 () Bool)

(assert (=> mapNonEmpty!20476 m!445859))

(declare-fun m!445861 () Bool)

(assert (=> start!41414 m!445861))

(declare-fun m!445863 () Bool)

(assert (=> start!41414 m!445863))

(declare-fun m!445865 () Bool)

(assert (=> start!41414 m!445865))

(check-sat (not start!41414) (not b!462841) tp_is_empty!12535 (not mapNonEmpty!20476) b_and!19453 (not b!462836) (not b!462840) (not b_next!11107))
(check-sat b_and!19453 (not b_next!11107))
