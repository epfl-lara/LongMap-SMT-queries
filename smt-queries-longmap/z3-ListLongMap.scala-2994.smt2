; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42254 () Bool)

(assert start!42254)

(declare-fun b_free!11773 () Bool)

(declare-fun b_next!11773 () Bool)

(assert (=> start!42254 (= b_free!11773 (not b_next!11773))))

(declare-fun tp!41346 () Bool)

(declare-fun b_and!20185 () Bool)

(assert (=> start!42254 (= tp!41346 b_and!20185)))

(declare-fun mapIsEmpty!21508 () Bool)

(declare-fun mapRes!21508 () Bool)

(assert (=> mapIsEmpty!21508 mapRes!21508))

(declare-fun b!471396 () Bool)

(declare-fun e!276289 () Bool)

(declare-fun e!276287 () Bool)

(assert (=> b!471396 (= e!276289 (and e!276287 mapRes!21508))))

(declare-fun condMapEmpty!21508 () Bool)

(declare-datatypes ((V!18707 0))(
  ( (V!18708 (val!6645 Int)) )
))
(declare-datatypes ((ValueCell!6257 0))(
  ( (ValueCellFull!6257 (v!8930 V!18707)) (EmptyCell!6257) )
))
(declare-datatypes ((array!30147 0))(
  ( (array!30148 (arr!14495 (Array (_ BitVec 32) ValueCell!6257)) (size!14848 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30147)

(declare-fun mapDefault!21508 () ValueCell!6257)

(assert (=> b!471396 (= condMapEmpty!21508 (= (arr!14495 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6257)) mapDefault!21508)))))

(declare-fun b!471397 () Bool)

(declare-fun e!276291 () Bool)

(assert (=> b!471397 (= e!276291 (not true))))

(declare-datatypes ((tuple2!8786 0))(
  ( (tuple2!8787 (_1!4404 (_ BitVec 64)) (_2!4404 V!18707)) )
))
(declare-datatypes ((List!8856 0))(
  ( (Nil!8853) (Cons!8852 (h!9708 tuple2!8786) (t!14813 List!8856)) )
))
(declare-datatypes ((ListLongMap!7689 0))(
  ( (ListLongMap!7690 (toList!3860 List!8856)) )
))
(declare-fun lt!213755 () ListLongMap!7689)

(declare-fun lt!213754 () ListLongMap!7689)

(assert (=> b!471397 (= lt!213755 lt!213754)))

(declare-fun minValueBefore!38 () V!18707)

(declare-fun zeroValue!794 () V!18707)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13821 0))(
  ( (Unit!13822) )
))
(declare-fun lt!213753 () Unit!13821)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30149 0))(
  ( (array!30150 (arr!14496 (Array (_ BitVec 32) (_ BitVec 64))) (size!14849 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30149)

(declare-fun minValueAfter!38 () V!18707)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!192 (array!30149 array!30147 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18707 V!18707 V!18707 V!18707 (_ BitVec 32) Int) Unit!13821)

(assert (=> b!471397 (= lt!213753 (lemmaNoChangeToArrayThenSameMapNoExtras!192 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2035 (array!30149 array!30147 (_ BitVec 32) (_ BitVec 32) V!18707 V!18707 (_ BitVec 32) Int) ListLongMap!7689)

(assert (=> b!471397 (= lt!213754 (getCurrentListMapNoExtraKeys!2035 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471397 (= lt!213755 (getCurrentListMapNoExtraKeys!2035 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21508 () Bool)

(declare-fun tp!41347 () Bool)

(declare-fun e!276288 () Bool)

(assert (=> mapNonEmpty!21508 (= mapRes!21508 (and tp!41347 e!276288))))

(declare-fun mapValue!21508 () ValueCell!6257)

(declare-fun mapRest!21508 () (Array (_ BitVec 32) ValueCell!6257))

(declare-fun mapKey!21508 () (_ BitVec 32))

(assert (=> mapNonEmpty!21508 (= (arr!14495 _values!833) (store mapRest!21508 mapKey!21508 mapValue!21508))))

(declare-fun b!471398 () Bool)

(declare-fun res!281638 () Bool)

(assert (=> b!471398 (=> (not res!281638) (not e!276291))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30149 (_ BitVec 32)) Bool)

(assert (=> b!471398 (= res!281638 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!281636 () Bool)

(assert (=> start!42254 (=> (not res!281636) (not e!276291))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42254 (= res!281636 (validMask!0 mask!1365))))

(assert (=> start!42254 e!276291))

(declare-fun tp_is_empty!13201 () Bool)

(assert (=> start!42254 tp_is_empty!13201))

(assert (=> start!42254 tp!41346))

(assert (=> start!42254 true))

(declare-fun array_inv!10542 (array!30149) Bool)

(assert (=> start!42254 (array_inv!10542 _keys!1025)))

(declare-fun array_inv!10543 (array!30147) Bool)

(assert (=> start!42254 (and (array_inv!10543 _values!833) e!276289)))

(declare-fun b!471399 () Bool)

(assert (=> b!471399 (= e!276287 tp_is_empty!13201)))

(declare-fun b!471400 () Bool)

(declare-fun res!281637 () Bool)

(assert (=> b!471400 (=> (not res!281637) (not e!276291))))

(declare-datatypes ((List!8857 0))(
  ( (Nil!8854) (Cons!8853 (h!9709 (_ BitVec 64)) (t!14814 List!8857)) )
))
(declare-fun arrayNoDuplicates!0 (array!30149 (_ BitVec 32) List!8857) Bool)

(assert (=> b!471400 (= res!281637 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8854))))

(declare-fun b!471401 () Bool)

(assert (=> b!471401 (= e!276288 tp_is_empty!13201)))

(declare-fun b!471402 () Bool)

(declare-fun res!281639 () Bool)

(assert (=> b!471402 (=> (not res!281639) (not e!276291))))

(assert (=> b!471402 (= res!281639 (and (= (size!14848 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14849 _keys!1025) (size!14848 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42254 res!281636) b!471402))

(assert (= (and b!471402 res!281639) b!471398))

(assert (= (and b!471398 res!281638) b!471400))

(assert (= (and b!471400 res!281637) b!471397))

(assert (= (and b!471396 condMapEmpty!21508) mapIsEmpty!21508))

(assert (= (and b!471396 (not condMapEmpty!21508)) mapNonEmpty!21508))

(get-info :version)

(assert (= (and mapNonEmpty!21508 ((_ is ValueCellFull!6257) mapValue!21508)) b!471401))

(assert (= (and b!471396 ((_ is ValueCellFull!6257) mapDefault!21508)) b!471399))

(assert (= start!42254 b!471396))

(declare-fun m!453033 () Bool)

(assert (=> b!471397 m!453033))

(declare-fun m!453035 () Bool)

(assert (=> b!471397 m!453035))

(declare-fun m!453037 () Bool)

(assert (=> b!471397 m!453037))

(declare-fun m!453039 () Bool)

(assert (=> start!42254 m!453039))

(declare-fun m!453041 () Bool)

(assert (=> start!42254 m!453041))

(declare-fun m!453043 () Bool)

(assert (=> start!42254 m!453043))

(declare-fun m!453045 () Bool)

(assert (=> b!471400 m!453045))

(declare-fun m!453047 () Bool)

(assert (=> b!471398 m!453047))

(declare-fun m!453049 () Bool)

(assert (=> mapNonEmpty!21508 m!453049))

(check-sat tp_is_empty!13201 (not start!42254) (not b!471398) b_and!20185 (not b!471397) (not b_next!11773) (not mapNonEmpty!21508) (not b!471400))
(check-sat b_and!20185 (not b_next!11773))
