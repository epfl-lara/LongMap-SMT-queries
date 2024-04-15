; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42272 () Bool)

(assert start!42272)

(declare-fun b_free!11791 () Bool)

(declare-fun b_next!11791 () Bool)

(assert (=> start!42272 (= b_free!11791 (not b_next!11791))))

(declare-fun tp!41401 () Bool)

(declare-fun b_and!20203 () Bool)

(assert (=> start!42272 (= tp!41401 b_and!20203)))

(declare-fun b!471585 () Bool)

(declare-fun e!276426 () Bool)

(declare-fun tp_is_empty!13219 () Bool)

(assert (=> b!471585 (= e!276426 tp_is_empty!13219)))

(declare-fun b!471586 () Bool)

(declare-fun res!281747 () Bool)

(declare-fun e!276425 () Bool)

(assert (=> b!471586 (=> (not res!281747) (not e!276425))))

(declare-datatypes ((array!30183 0))(
  ( (array!30184 (arr!14513 (Array (_ BitVec 32) (_ BitVec 64))) (size!14866 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30183)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30183 (_ BitVec 32)) Bool)

(assert (=> b!471586 (= res!281747 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471587 () Bool)

(declare-fun e!276424 () Bool)

(declare-fun mapRes!21535 () Bool)

(assert (=> b!471587 (= e!276424 (and e!276426 mapRes!21535))))

(declare-fun condMapEmpty!21535 () Bool)

(declare-datatypes ((V!18731 0))(
  ( (V!18732 (val!6654 Int)) )
))
(declare-datatypes ((ValueCell!6266 0))(
  ( (ValueCellFull!6266 (v!8939 V!18731)) (EmptyCell!6266) )
))
(declare-datatypes ((array!30185 0))(
  ( (array!30186 (arr!14514 (Array (_ BitVec 32) ValueCell!6266)) (size!14867 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30185)

(declare-fun mapDefault!21535 () ValueCell!6266)

(assert (=> b!471587 (= condMapEmpty!21535 (= (arr!14514 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6266)) mapDefault!21535)))))

(declare-fun b!471588 () Bool)

(declare-fun res!281745 () Bool)

(assert (=> b!471588 (=> (not res!281745) (not e!276425))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!471588 (= res!281745 (and (= (size!14867 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14866 _keys!1025) (size!14867 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471589 () Bool)

(assert (=> b!471589 (= e!276425 (not true))))

(declare-datatypes ((tuple2!8796 0))(
  ( (tuple2!8797 (_1!4409 (_ BitVec 64)) (_2!4409 V!18731)) )
))
(declare-datatypes ((List!8870 0))(
  ( (Nil!8867) (Cons!8866 (h!9722 tuple2!8796) (t!14827 List!8870)) )
))
(declare-datatypes ((ListLongMap!7699 0))(
  ( (ListLongMap!7700 (toList!3865 List!8870)) )
))
(declare-fun lt!213834 () ListLongMap!7699)

(declare-fun lt!213836 () ListLongMap!7699)

(assert (=> b!471589 (= lt!213834 lt!213836)))

(declare-fun minValueBefore!38 () V!18731)

(declare-datatypes ((Unit!13831 0))(
  ( (Unit!13832) )
))
(declare-fun lt!213835 () Unit!13831)

(declare-fun zeroValue!794 () V!18731)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18731)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!197 (array!30183 array!30185 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18731 V!18731 V!18731 V!18731 (_ BitVec 32) Int) Unit!13831)

(assert (=> b!471589 (= lt!213835 (lemmaNoChangeToArrayThenSameMapNoExtras!197 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2040 (array!30183 array!30185 (_ BitVec 32) (_ BitVec 32) V!18731 V!18731 (_ BitVec 32) Int) ListLongMap!7699)

(assert (=> b!471589 (= lt!213836 (getCurrentListMapNoExtraKeys!2040 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471589 (= lt!213834 (getCurrentListMapNoExtraKeys!2040 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21535 () Bool)

(assert (=> mapIsEmpty!21535 mapRes!21535))

(declare-fun b!471590 () Bool)

(declare-fun res!281746 () Bool)

(assert (=> b!471590 (=> (not res!281746) (not e!276425))))

(declare-datatypes ((List!8871 0))(
  ( (Nil!8868) (Cons!8867 (h!9723 (_ BitVec 64)) (t!14828 List!8871)) )
))
(declare-fun arrayNoDuplicates!0 (array!30183 (_ BitVec 32) List!8871) Bool)

(assert (=> b!471590 (= res!281746 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8868))))

(declare-fun b!471591 () Bool)

(declare-fun e!276422 () Bool)

(assert (=> b!471591 (= e!276422 tp_is_empty!13219)))

(declare-fun mapNonEmpty!21535 () Bool)

(declare-fun tp!41400 () Bool)

(assert (=> mapNonEmpty!21535 (= mapRes!21535 (and tp!41400 e!276422))))

(declare-fun mapKey!21535 () (_ BitVec 32))

(declare-fun mapRest!21535 () (Array (_ BitVec 32) ValueCell!6266))

(declare-fun mapValue!21535 () ValueCell!6266)

(assert (=> mapNonEmpty!21535 (= (arr!14514 _values!833) (store mapRest!21535 mapKey!21535 mapValue!21535))))

(declare-fun res!281744 () Bool)

(assert (=> start!42272 (=> (not res!281744) (not e!276425))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42272 (= res!281744 (validMask!0 mask!1365))))

(assert (=> start!42272 e!276425))

(assert (=> start!42272 tp_is_empty!13219))

(assert (=> start!42272 tp!41401))

(assert (=> start!42272 true))

(declare-fun array_inv!10558 (array!30183) Bool)

(assert (=> start!42272 (array_inv!10558 _keys!1025)))

(declare-fun array_inv!10559 (array!30185) Bool)

(assert (=> start!42272 (and (array_inv!10559 _values!833) e!276424)))

(assert (= (and start!42272 res!281744) b!471588))

(assert (= (and b!471588 res!281745) b!471586))

(assert (= (and b!471586 res!281747) b!471590))

(assert (= (and b!471590 res!281746) b!471589))

(assert (= (and b!471587 condMapEmpty!21535) mapIsEmpty!21535))

(assert (= (and b!471587 (not condMapEmpty!21535)) mapNonEmpty!21535))

(get-info :version)

(assert (= (and mapNonEmpty!21535 ((_ is ValueCellFull!6266) mapValue!21535)) b!471591))

(assert (= (and b!471587 ((_ is ValueCellFull!6266) mapDefault!21535)) b!471585))

(assert (= start!42272 b!471587))

(declare-fun m!453195 () Bool)

(assert (=> mapNonEmpty!21535 m!453195))

(declare-fun m!453197 () Bool)

(assert (=> b!471586 m!453197))

(declare-fun m!453199 () Bool)

(assert (=> b!471589 m!453199))

(declare-fun m!453201 () Bool)

(assert (=> b!471589 m!453201))

(declare-fun m!453203 () Bool)

(assert (=> b!471589 m!453203))

(declare-fun m!453205 () Bool)

(assert (=> b!471590 m!453205))

(declare-fun m!453207 () Bool)

(assert (=> start!42272 m!453207))

(declare-fun m!453209 () Bool)

(assert (=> start!42272 m!453209))

(declare-fun m!453211 () Bool)

(assert (=> start!42272 m!453211))

(check-sat (not b_next!11791) (not mapNonEmpty!21535) (not b!471586) (not start!42272) b_and!20203 (not b!471590) (not b!471589) tp_is_empty!13219)
(check-sat b_and!20203 (not b_next!11791))
