; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42142 () Bool)

(assert start!42142)

(declare-fun b_free!11689 () Bool)

(declare-fun b_next!11689 () Bool)

(assert (=> start!42142 (= b_free!11689 (not b_next!11689))))

(declare-fun tp!41088 () Bool)

(declare-fun b_and!20121 () Bool)

(assert (=> start!42142 (= tp!41088 b_and!20121)))

(declare-fun b!470554 () Bool)

(declare-fun e!275685 () Bool)

(declare-fun e!275686 () Bool)

(declare-fun mapRes!21376 () Bool)

(assert (=> b!470554 (= e!275685 (and e!275686 mapRes!21376))))

(declare-fun condMapEmpty!21376 () Bool)

(declare-datatypes ((V!18595 0))(
  ( (V!18596 (val!6603 Int)) )
))
(declare-datatypes ((ValueCell!6215 0))(
  ( (ValueCellFull!6215 (v!8895 V!18595)) (EmptyCell!6215) )
))
(declare-datatypes ((array!29988 0))(
  ( (array!29989 (arr!14417 (Array (_ BitVec 32) ValueCell!6215)) (size!14769 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29988)

(declare-fun mapDefault!21376 () ValueCell!6215)

(assert (=> b!470554 (= condMapEmpty!21376 (= (arr!14417 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6215)) mapDefault!21376)))))

(declare-fun res!281193 () Bool)

(declare-fun e!275683 () Bool)

(assert (=> start!42142 (=> (not res!281193) (not e!275683))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42142 (= res!281193 (validMask!0 mask!1365))))

(assert (=> start!42142 e!275683))

(declare-fun tp_is_empty!13117 () Bool)

(assert (=> start!42142 tp_is_empty!13117))

(assert (=> start!42142 tp!41088))

(assert (=> start!42142 true))

(declare-datatypes ((array!29990 0))(
  ( (array!29991 (arr!14418 (Array (_ BitVec 32) (_ BitVec 64))) (size!14770 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29990)

(declare-fun array_inv!10494 (array!29990) Bool)

(assert (=> start!42142 (array_inv!10494 _keys!1025)))

(declare-fun array_inv!10495 (array!29988) Bool)

(assert (=> start!42142 (and (array_inv!10495 _values!833) e!275685)))

(declare-fun mapIsEmpty!21376 () Bool)

(assert (=> mapIsEmpty!21376 mapRes!21376))

(declare-fun b!470555 () Bool)

(assert (=> b!470555 (= e!275686 tp_is_empty!13117)))

(declare-fun b!470556 () Bool)

(declare-fun e!275684 () Bool)

(assert (=> b!470556 (= e!275684 tp_is_empty!13117)))

(declare-fun b!470557 () Bool)

(declare-fun res!281192 () Bool)

(assert (=> b!470557 (=> (not res!281192) (not e!275683))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470557 (= res!281192 (and (= (size!14769 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14770 _keys!1025) (size!14769 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470558 () Bool)

(declare-fun res!281194 () Bool)

(assert (=> b!470558 (=> (not res!281194) (not e!275683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29990 (_ BitVec 32)) Bool)

(assert (=> b!470558 (= res!281194 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470559 () Bool)

(declare-fun res!281195 () Bool)

(assert (=> b!470559 (=> (not res!281195) (not e!275683))))

(declare-datatypes ((List!8691 0))(
  ( (Nil!8688) (Cons!8687 (h!9543 (_ BitVec 64)) (t!14645 List!8691)) )
))
(declare-fun arrayNoDuplicates!0 (array!29990 (_ BitVec 32) List!8691) Bool)

(assert (=> b!470559 (= res!281195 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8688))))

(declare-fun b!470560 () Bool)

(assert (=> b!470560 (= e!275683 (not true))))

(declare-datatypes ((tuple2!8616 0))(
  ( (tuple2!8617 (_1!4319 (_ BitVec 64)) (_2!4319 V!18595)) )
))
(declare-datatypes ((List!8692 0))(
  ( (Nil!8689) (Cons!8688 (h!9544 tuple2!8616) (t!14646 List!8692)) )
))
(declare-datatypes ((ListLongMap!7531 0))(
  ( (ListLongMap!7532 (toList!3781 List!8692)) )
))
(declare-fun lt!213542 () ListLongMap!7531)

(declare-fun lt!213541 () ListLongMap!7531)

(assert (=> b!470560 (= lt!213542 lt!213541)))

(declare-datatypes ((Unit!13775 0))(
  ( (Unit!13776) )
))
(declare-fun lt!213543 () Unit!13775)

(declare-fun minValueBefore!38 () V!18595)

(declare-fun zeroValue!794 () V!18595)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18595)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!156 (array!29990 array!29988 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18595 V!18595 V!18595 V!18595 (_ BitVec 32) Int) Unit!13775)

(assert (=> b!470560 (= lt!213543 (lemmaNoChangeToArrayThenSameMapNoExtras!156 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1996 (array!29990 array!29988 (_ BitVec 32) (_ BitVec 32) V!18595 V!18595 (_ BitVec 32) Int) ListLongMap!7531)

(assert (=> b!470560 (= lt!213541 (getCurrentListMapNoExtraKeys!1996 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470560 (= lt!213542 (getCurrentListMapNoExtraKeys!1996 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21376 () Bool)

(declare-fun tp!41089 () Bool)

(assert (=> mapNonEmpty!21376 (= mapRes!21376 (and tp!41089 e!275684))))

(declare-fun mapKey!21376 () (_ BitVec 32))

(declare-fun mapValue!21376 () ValueCell!6215)

(declare-fun mapRest!21376 () (Array (_ BitVec 32) ValueCell!6215))

(assert (=> mapNonEmpty!21376 (= (arr!14417 _values!833) (store mapRest!21376 mapKey!21376 mapValue!21376))))

(assert (= (and start!42142 res!281193) b!470557))

(assert (= (and b!470557 res!281192) b!470558))

(assert (= (and b!470558 res!281194) b!470559))

(assert (= (and b!470559 res!281195) b!470560))

(assert (= (and b!470554 condMapEmpty!21376) mapIsEmpty!21376))

(assert (= (and b!470554 (not condMapEmpty!21376)) mapNonEmpty!21376))

(get-info :version)

(assert (= (and mapNonEmpty!21376 ((_ is ValueCellFull!6215) mapValue!21376)) b!470556))

(assert (= (and b!470554 ((_ is ValueCellFull!6215) mapDefault!21376)) b!470555))

(assert (= start!42142 b!470554))

(declare-fun m!453061 () Bool)

(assert (=> b!470559 m!453061))

(declare-fun m!453063 () Bool)

(assert (=> b!470560 m!453063))

(declare-fun m!453065 () Bool)

(assert (=> b!470560 m!453065))

(declare-fun m!453067 () Bool)

(assert (=> b!470560 m!453067))

(declare-fun m!453069 () Bool)

(assert (=> b!470558 m!453069))

(declare-fun m!453071 () Bool)

(assert (=> start!42142 m!453071))

(declare-fun m!453073 () Bool)

(assert (=> start!42142 m!453073))

(declare-fun m!453075 () Bool)

(assert (=> start!42142 m!453075))

(declare-fun m!453077 () Bool)

(assert (=> mapNonEmpty!21376 m!453077))

(check-sat (not b!470558) (not b!470559) (not start!42142) b_and!20121 (not b!470560) (not b_next!11689) tp_is_empty!13117 (not mapNonEmpty!21376))
(check-sat b_and!20121 (not b_next!11689))
