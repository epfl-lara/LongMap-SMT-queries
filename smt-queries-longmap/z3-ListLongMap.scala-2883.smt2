; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41414 () Bool)

(assert start!41414)

(declare-fun b_free!11107 () Bool)

(declare-fun b_next!11107 () Bool)

(assert (=> start!41414 (= b_free!11107 (not b_next!11107))))

(declare-fun tp!39316 () Bool)

(declare-fun b_and!19417 () Bool)

(assert (=> start!41414 (= tp!39316 b_and!19417)))

(declare-fun b!462626 () Bool)

(declare-fun e!270030 () Bool)

(declare-fun tp_is_empty!12535 () Bool)

(assert (=> b!462626 (= e!270030 tp_is_empty!12535)))

(declare-fun mapIsEmpty!20476 () Bool)

(declare-fun mapRes!20476 () Bool)

(assert (=> mapIsEmpty!20476 mapRes!20476))

(declare-fun mapNonEmpty!20476 () Bool)

(declare-fun tp!39315 () Bool)

(assert (=> mapNonEmpty!20476 (= mapRes!20476 (and tp!39315 e!270030))))

(declare-datatypes ((V!17819 0))(
  ( (V!17820 (val!6312 Int)) )
))
(declare-datatypes ((ValueCell!5924 0))(
  ( (ValueCellFull!5924 (v!8593 V!17819)) (EmptyCell!5924) )
))
(declare-datatypes ((array!28865 0))(
  ( (array!28866 (arr!13865 (Array (_ BitVec 32) ValueCell!5924)) (size!14218 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28865)

(declare-fun mapValue!20476 () ValueCell!5924)

(declare-fun mapRest!20476 () (Array (_ BitVec 32) ValueCell!5924))

(declare-fun mapKey!20476 () (_ BitVec 32))

(assert (=> mapNonEmpty!20476 (= (arr!13865 _values!833) (store mapRest!20476 mapKey!20476 mapValue!20476))))

(declare-fun b!462627 () Bool)

(declare-fun e!270029 () Bool)

(assert (=> b!462627 (= e!270029 false)))

(declare-fun minValueBefore!38 () V!17819)

(declare-fun zeroValue!794 () V!17819)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((tuple2!8300 0))(
  ( (tuple2!8301 (_1!4161 (_ BitVec 64)) (_2!4161 V!17819)) )
))
(declare-datatypes ((List!8387 0))(
  ( (Nil!8384) (Cons!8383 (h!9239 tuple2!8300) (t!14322 List!8387)) )
))
(declare-datatypes ((ListLongMap!7203 0))(
  ( (ListLongMap!7204 (toList!3617 List!8387)) )
))
(declare-fun lt!209042 () ListLongMap!7203)

(declare-datatypes ((array!28867 0))(
  ( (array!28868 (arr!13866 (Array (_ BitVec 32) (_ BitVec 64))) (size!14219 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28867)

(declare-fun getCurrentListMapNoExtraKeys!1809 (array!28867 array!28865 (_ BitVec 32) (_ BitVec 32) V!17819 V!17819 (_ BitVec 32) Int) ListLongMap!7203)

(assert (=> b!462627 (= lt!209042 (getCurrentListMapNoExtraKeys!1809 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!276679 () Bool)

(assert (=> start!41414 (=> (not res!276679) (not e!270029))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41414 (= res!276679 (validMask!0 mask!1365))))

(assert (=> start!41414 e!270029))

(assert (=> start!41414 tp_is_empty!12535))

(assert (=> start!41414 tp!39316))

(assert (=> start!41414 true))

(declare-fun array_inv!10094 (array!28867) Bool)

(assert (=> start!41414 (array_inv!10094 _keys!1025)))

(declare-fun e!270026 () Bool)

(declare-fun array_inv!10095 (array!28865) Bool)

(assert (=> start!41414 (and (array_inv!10095 _values!833) e!270026)))

(declare-fun b!462628 () Bool)

(declare-fun e!270028 () Bool)

(assert (=> b!462628 (= e!270026 (and e!270028 mapRes!20476))))

(declare-fun condMapEmpty!20476 () Bool)

(declare-fun mapDefault!20476 () ValueCell!5924)

(assert (=> b!462628 (= condMapEmpty!20476 (= (arr!13865 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5924)) mapDefault!20476)))))

(declare-fun b!462629 () Bool)

(declare-fun res!276677 () Bool)

(assert (=> b!462629 (=> (not res!276677) (not e!270029))))

(declare-datatypes ((List!8388 0))(
  ( (Nil!8385) (Cons!8384 (h!9240 (_ BitVec 64)) (t!14323 List!8388)) )
))
(declare-fun arrayNoDuplicates!0 (array!28867 (_ BitVec 32) List!8388) Bool)

(assert (=> b!462629 (= res!276677 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8385))))

(declare-fun b!462630 () Bool)

(assert (=> b!462630 (= e!270028 tp_is_empty!12535)))

(declare-fun b!462631 () Bool)

(declare-fun res!276680 () Bool)

(assert (=> b!462631 (=> (not res!276680) (not e!270029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28867 (_ BitVec 32)) Bool)

(assert (=> b!462631 (= res!276680 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462632 () Bool)

(declare-fun res!276678 () Bool)

(assert (=> b!462632 (=> (not res!276678) (not e!270029))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462632 (= res!276678 (and (= (size!14218 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14219 _keys!1025) (size!14218 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41414 res!276679) b!462632))

(assert (= (and b!462632 res!276678) b!462631))

(assert (= (and b!462631 res!276680) b!462629))

(assert (= (and b!462629 res!276677) b!462627))

(assert (= (and b!462628 condMapEmpty!20476) mapIsEmpty!20476))

(assert (= (and b!462628 (not condMapEmpty!20476)) mapNonEmpty!20476))

(get-info :version)

(assert (= (and mapNonEmpty!20476 ((_ is ValueCellFull!5924) mapValue!20476)) b!462626))

(assert (= (and b!462628 ((_ is ValueCellFull!5924) mapDefault!20476)) b!462630))

(assert (= start!41414 b!462628))

(declare-fun m!444937 () Bool)

(assert (=> start!41414 m!444937))

(declare-fun m!444939 () Bool)

(assert (=> start!41414 m!444939))

(declare-fun m!444941 () Bool)

(assert (=> start!41414 m!444941))

(declare-fun m!444943 () Bool)

(assert (=> b!462627 m!444943))

(declare-fun m!444945 () Bool)

(assert (=> mapNonEmpty!20476 m!444945))

(declare-fun m!444947 () Bool)

(assert (=> b!462629 m!444947))

(declare-fun m!444949 () Bool)

(assert (=> b!462631 m!444949))

(check-sat (not mapNonEmpty!20476) (not b!462627) (not b!462629) (not b_next!11107) (not b!462631) b_and!19417 (not start!41414) tp_is_empty!12535)
(check-sat b_and!19417 (not b_next!11107))
