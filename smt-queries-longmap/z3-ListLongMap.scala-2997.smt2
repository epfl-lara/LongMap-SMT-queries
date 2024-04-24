; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42272 () Bool)

(assert start!42272)

(declare-fun b_free!11791 () Bool)

(declare-fun b_next!11791 () Bool)

(assert (=> start!42272 (= b_free!11791 (not b_next!11791))))

(declare-fun tp!41401 () Bool)

(declare-fun b_and!20239 () Bool)

(assert (=> start!42272 (= tp!41401 b_and!20239)))

(declare-fun b!471795 () Bool)

(declare-fun res!281867 () Bool)

(declare-fun e!276561 () Bool)

(assert (=> b!471795 (=> (not res!281867) (not e!276561))))

(declare-datatypes ((array!30186 0))(
  ( (array!30187 (arr!14514 (Array (_ BitVec 32) (_ BitVec 64))) (size!14866 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30186)

(declare-datatypes ((List!8751 0))(
  ( (Nil!8748) (Cons!8747 (h!9603 (_ BitVec 64)) (t!14709 List!8751)) )
))
(declare-fun arrayNoDuplicates!0 (array!30186 (_ BitVec 32) List!8751) Bool)

(assert (=> b!471795 (= res!281867 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8748))))

(declare-fun b!471796 () Bool)

(declare-fun e!276559 () Bool)

(declare-fun tp_is_empty!13219 () Bool)

(assert (=> b!471796 (= e!276559 tp_is_empty!13219)))

(declare-fun res!281869 () Bool)

(assert (=> start!42272 (=> (not res!281869) (not e!276561))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42272 (= res!281869 (validMask!0 mask!1365))))

(assert (=> start!42272 e!276561))

(assert (=> start!42272 tp_is_empty!13219))

(assert (=> start!42272 tp!41401))

(assert (=> start!42272 true))

(declare-fun array_inv!10558 (array!30186) Bool)

(assert (=> start!42272 (array_inv!10558 _keys!1025)))

(declare-datatypes ((V!18731 0))(
  ( (V!18732 (val!6654 Int)) )
))
(declare-datatypes ((ValueCell!6266 0))(
  ( (ValueCellFull!6266 (v!8946 V!18731)) (EmptyCell!6266) )
))
(declare-datatypes ((array!30188 0))(
  ( (array!30189 (arr!14515 (Array (_ BitVec 32) ValueCell!6266)) (size!14867 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30188)

(declare-fun e!276558 () Bool)

(declare-fun array_inv!10559 (array!30188) Bool)

(assert (=> start!42272 (and (array_inv!10559 _values!833) e!276558)))

(declare-fun mapNonEmpty!21535 () Bool)

(declare-fun mapRes!21535 () Bool)

(declare-fun tp!41400 () Bool)

(declare-fun e!276560 () Bool)

(assert (=> mapNonEmpty!21535 (= mapRes!21535 (and tp!41400 e!276560))))

(declare-fun mapRest!21535 () (Array (_ BitVec 32) ValueCell!6266))

(declare-fun mapKey!21535 () (_ BitVec 32))

(declare-fun mapValue!21535 () ValueCell!6266)

(assert (=> mapNonEmpty!21535 (= (arr!14515 _values!833) (store mapRest!21535 mapKey!21535 mapValue!21535))))

(declare-fun b!471797 () Bool)

(assert (=> b!471797 (= e!276560 tp_is_empty!13219)))

(declare-fun b!471798 () Bool)

(declare-fun res!281868 () Bool)

(assert (=> b!471798 (=> (not res!281868) (not e!276561))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!471798 (= res!281868 (and (= (size!14867 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14866 _keys!1025) (size!14867 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!21535 () Bool)

(assert (=> mapIsEmpty!21535 mapRes!21535))

(declare-fun b!471799 () Bool)

(assert (=> b!471799 (= e!276558 (and e!276559 mapRes!21535))))

(declare-fun condMapEmpty!21535 () Bool)

(declare-fun mapDefault!21535 () ValueCell!6266)

(assert (=> b!471799 (= condMapEmpty!21535 (= (arr!14515 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6266)) mapDefault!21535)))))

(declare-fun b!471800 () Bool)

(assert (=> b!471800 (= e!276561 (not true))))

(declare-datatypes ((tuple2!8686 0))(
  ( (tuple2!8687 (_1!4354 (_ BitVec 64)) (_2!4354 V!18731)) )
))
(declare-datatypes ((List!8752 0))(
  ( (Nil!8749) (Cons!8748 (h!9604 tuple2!8686) (t!14710 List!8752)) )
))
(declare-datatypes ((ListLongMap!7601 0))(
  ( (ListLongMap!7602 (toList!3816 List!8752)) )
))
(declare-fun lt!214082 () ListLongMap!7601)

(declare-fun lt!214080 () ListLongMap!7601)

(assert (=> b!471800 (= lt!214082 lt!214080)))

(declare-fun minValueBefore!38 () V!18731)

(declare-fun zeroValue!794 () V!18731)

(declare-datatypes ((Unit!13845 0))(
  ( (Unit!13846) )
))
(declare-fun lt!214081 () Unit!13845)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18731)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!191 (array!30186 array!30188 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18731 V!18731 V!18731 V!18731 (_ BitVec 32) Int) Unit!13845)

(assert (=> b!471800 (= lt!214081 (lemmaNoChangeToArrayThenSameMapNoExtras!191 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2031 (array!30186 array!30188 (_ BitVec 32) (_ BitVec 32) V!18731 V!18731 (_ BitVec 32) Int) ListLongMap!7601)

(assert (=> b!471800 (= lt!214080 (getCurrentListMapNoExtraKeys!2031 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471800 (= lt!214082 (getCurrentListMapNoExtraKeys!2031 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471801 () Bool)

(declare-fun res!281866 () Bool)

(assert (=> b!471801 (=> (not res!281866) (not e!276561))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30186 (_ BitVec 32)) Bool)

(assert (=> b!471801 (= res!281866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!42272 res!281869) b!471798))

(assert (= (and b!471798 res!281868) b!471801))

(assert (= (and b!471801 res!281866) b!471795))

(assert (= (and b!471795 res!281867) b!471800))

(assert (= (and b!471799 condMapEmpty!21535) mapIsEmpty!21535))

(assert (= (and b!471799 (not condMapEmpty!21535)) mapNonEmpty!21535))

(get-info :version)

(assert (= (and mapNonEmpty!21535 ((_ is ValueCellFull!6266) mapValue!21535)) b!471797))

(assert (= (and b!471799 ((_ is ValueCellFull!6266) mapDefault!21535)) b!471796))

(assert (= start!42272 b!471799))

(declare-fun m!454111 () Bool)

(assert (=> b!471801 m!454111))

(declare-fun m!454113 () Bool)

(assert (=> b!471795 m!454113))

(declare-fun m!454115 () Bool)

(assert (=> start!42272 m!454115))

(declare-fun m!454117 () Bool)

(assert (=> start!42272 m!454117))

(declare-fun m!454119 () Bool)

(assert (=> start!42272 m!454119))

(declare-fun m!454121 () Bool)

(assert (=> b!471800 m!454121))

(declare-fun m!454123 () Bool)

(assert (=> b!471800 m!454123))

(declare-fun m!454125 () Bool)

(assert (=> b!471800 m!454125))

(declare-fun m!454127 () Bool)

(assert (=> mapNonEmpty!21535 m!454127))

(check-sat (not b_next!11791) (not mapNonEmpty!21535) tp_is_empty!13219 (not b!471800) b_and!20239 (not b!471795) (not start!42272) (not b!471801))
(check-sat b_and!20239 (not b_next!11791))
