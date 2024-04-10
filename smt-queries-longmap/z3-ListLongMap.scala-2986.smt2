; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42208 () Bool)

(assert start!42208)

(declare-fun b_free!11727 () Bool)

(declare-fun b_next!11727 () Bool)

(assert (=> start!42208 (= b_free!11727 (not b_next!11727))))

(declare-fun tp!41206 () Bool)

(declare-fun b_and!20157 () Bool)

(assert (=> start!42208 (= tp!41206 b_and!20157)))

(declare-fun b!471099 () Bool)

(declare-fun e!276065 () Bool)

(assert (=> b!471099 (= e!276065 (not true))))

(declare-datatypes ((V!18645 0))(
  ( (V!18646 (val!6622 Int)) )
))
(declare-datatypes ((tuple2!8720 0))(
  ( (tuple2!8721 (_1!4371 (_ BitVec 64)) (_2!4371 V!18645)) )
))
(declare-datatypes ((List!8799 0))(
  ( (Nil!8796) (Cons!8795 (h!9651 tuple2!8720) (t!14763 List!8799)) )
))
(declare-datatypes ((ListLongMap!7633 0))(
  ( (ListLongMap!7634 (toList!3832 List!8799)) )
))
(declare-fun lt!213742 () ListLongMap!7633)

(declare-fun lt!213740 () ListLongMap!7633)

(assert (=> b!471099 (= lt!213742 lt!213740)))

(declare-fun minValueBefore!38 () V!18645)

(declare-fun zeroValue!794 () V!18645)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13823 0))(
  ( (Unit!13824) )
))
(declare-fun lt!213741 () Unit!13823)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30075 0))(
  ( (array!30076 (arr!14460 (Array (_ BitVec 32) (_ BitVec 64))) (size!14812 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30075)

(declare-datatypes ((ValueCell!6234 0))(
  ( (ValueCellFull!6234 (v!8913 V!18645)) (EmptyCell!6234) )
))
(declare-datatypes ((array!30077 0))(
  ( (array!30078 (arr!14461 (Array (_ BitVec 32) ValueCell!6234)) (size!14813 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30077)

(declare-fun minValueAfter!38 () V!18645)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!175 (array!30075 array!30077 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18645 V!18645 V!18645 V!18645 (_ BitVec 32) Int) Unit!13823)

(assert (=> b!471099 (= lt!213741 (lemmaNoChangeToArrayThenSameMapNoExtras!175 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1995 (array!30075 array!30077 (_ BitVec 32) (_ BitVec 32) V!18645 V!18645 (_ BitVec 32) Int) ListLongMap!7633)

(assert (=> b!471099 (= lt!213740 (getCurrentListMapNoExtraKeys!1995 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471099 (= lt!213742 (getCurrentListMapNoExtraKeys!1995 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471100 () Bool)

(declare-fun res!281460 () Bool)

(assert (=> b!471100 (=> (not res!281460) (not e!276065))))

(assert (=> b!471100 (= res!281460 (and (= (size!14813 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14812 _keys!1025) (size!14813 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471101 () Bool)

(declare-fun res!281459 () Bool)

(assert (=> b!471101 (=> (not res!281459) (not e!276065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30075 (_ BitVec 32)) Bool)

(assert (=> b!471101 (= res!281459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471103 () Bool)

(declare-fun res!281458 () Bool)

(assert (=> b!471103 (=> (not res!281458) (not e!276065))))

(declare-datatypes ((List!8800 0))(
  ( (Nil!8797) (Cons!8796 (h!9652 (_ BitVec 64)) (t!14764 List!8800)) )
))
(declare-fun arrayNoDuplicates!0 (array!30075 (_ BitVec 32) List!8800) Bool)

(assert (=> b!471103 (= res!281458 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8797))))

(declare-fun b!471104 () Bool)

(declare-fun e!276062 () Bool)

(declare-fun e!276061 () Bool)

(declare-fun mapRes!21436 () Bool)

(assert (=> b!471104 (= e!276062 (and e!276061 mapRes!21436))))

(declare-fun condMapEmpty!21436 () Bool)

(declare-fun mapDefault!21436 () ValueCell!6234)

(assert (=> b!471104 (= condMapEmpty!21436 (= (arr!14461 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6234)) mapDefault!21436)))))

(declare-fun b!471105 () Bool)

(declare-fun tp_is_empty!13155 () Bool)

(assert (=> b!471105 (= e!276061 tp_is_empty!13155)))

(declare-fun res!281461 () Bool)

(assert (=> start!42208 (=> (not res!281461) (not e!276065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42208 (= res!281461 (validMask!0 mask!1365))))

(assert (=> start!42208 e!276065))

(assert (=> start!42208 tp_is_empty!13155))

(assert (=> start!42208 tp!41206))

(assert (=> start!42208 true))

(declare-fun array_inv!10430 (array!30075) Bool)

(assert (=> start!42208 (array_inv!10430 _keys!1025)))

(declare-fun array_inv!10431 (array!30077) Bool)

(assert (=> start!42208 (and (array_inv!10431 _values!833) e!276062)))

(declare-fun b!471102 () Bool)

(declare-fun e!276064 () Bool)

(assert (=> b!471102 (= e!276064 tp_is_empty!13155)))

(declare-fun mapNonEmpty!21436 () Bool)

(declare-fun tp!41205 () Bool)

(assert (=> mapNonEmpty!21436 (= mapRes!21436 (and tp!41205 e!276064))))

(declare-fun mapKey!21436 () (_ BitVec 32))

(declare-fun mapRest!21436 () (Array (_ BitVec 32) ValueCell!6234))

(declare-fun mapValue!21436 () ValueCell!6234)

(assert (=> mapNonEmpty!21436 (= (arr!14461 _values!833) (store mapRest!21436 mapKey!21436 mapValue!21436))))

(declare-fun mapIsEmpty!21436 () Bool)

(assert (=> mapIsEmpty!21436 mapRes!21436))

(assert (= (and start!42208 res!281461) b!471100))

(assert (= (and b!471100 res!281460) b!471101))

(assert (= (and b!471101 res!281459) b!471103))

(assert (= (and b!471103 res!281458) b!471099))

(assert (= (and b!471104 condMapEmpty!21436) mapIsEmpty!21436))

(assert (= (and b!471104 (not condMapEmpty!21436)) mapNonEmpty!21436))

(get-info :version)

(assert (= (and mapNonEmpty!21436 ((_ is ValueCellFull!6234) mapValue!21436)) b!471102))

(assert (= (and b!471104 ((_ is ValueCellFull!6234) mapDefault!21436)) b!471105))

(assert (= start!42208 b!471104))

(declare-fun m!453287 () Bool)

(assert (=> start!42208 m!453287))

(declare-fun m!453289 () Bool)

(assert (=> start!42208 m!453289))

(declare-fun m!453291 () Bool)

(assert (=> start!42208 m!453291))

(declare-fun m!453293 () Bool)

(assert (=> b!471099 m!453293))

(declare-fun m!453295 () Bool)

(assert (=> b!471099 m!453295))

(declare-fun m!453297 () Bool)

(assert (=> b!471099 m!453297))

(declare-fun m!453299 () Bool)

(assert (=> b!471101 m!453299))

(declare-fun m!453301 () Bool)

(assert (=> b!471103 m!453301))

(declare-fun m!453303 () Bool)

(assert (=> mapNonEmpty!21436 m!453303))

(check-sat (not b!471101) tp_is_empty!13155 (not start!42208) (not b!471103) b_and!20157 (not mapNonEmpty!21436) (not b_next!11727) (not b!471099))
(check-sat b_and!20157 (not b_next!11727))
