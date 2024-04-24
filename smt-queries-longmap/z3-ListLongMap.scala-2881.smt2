; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41402 () Bool)

(assert start!41402)

(declare-fun b_free!11095 () Bool)

(declare-fun b_next!11095 () Bool)

(assert (=> start!41402 (= b_free!11095 (not b_next!11095))))

(declare-fun tp!39279 () Bool)

(declare-fun b_and!19441 () Bool)

(assert (=> start!41402 (= tp!39279 b_and!19441)))

(declare-fun b!462710 () Bool)

(declare-fun e!270072 () Bool)

(assert (=> b!462710 (= e!270072 false)))

(declare-datatypes ((V!17803 0))(
  ( (V!17804 (val!6306 Int)) )
))
(declare-fun zeroValue!794 () V!17803)

(declare-fun defaultEntry!841 () Int)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun minValueBefore!38 () V!17803)

(declare-datatypes ((tuple2!8196 0))(
  ( (tuple2!8197 (_1!4109 (_ BitVec 64)) (_2!4109 V!17803)) )
))
(declare-datatypes ((List!8278 0))(
  ( (Nil!8275) (Cons!8274 (h!9130 tuple2!8196) (t!14214 List!8278)) )
))
(declare-datatypes ((ListLongMap!7111 0))(
  ( (ListLongMap!7112 (toList!3571 List!8278)) )
))
(declare-fun lt!209270 () ListLongMap!7111)

(declare-datatypes ((array!28844 0))(
  ( (array!28845 (arr!13854 (Array (_ BitVec 32) (_ BitVec 64))) (size!14206 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28844)

(declare-datatypes ((ValueCell!5918 0))(
  ( (ValueCellFull!5918 (v!8594 V!17803)) (EmptyCell!5918) )
))
(declare-datatypes ((array!28846 0))(
  ( (array!28847 (arr!13855 (Array (_ BitVec 32) ValueCell!5918)) (size!14207 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28846)

(declare-fun getCurrentListMapNoExtraKeys!1798 (array!28844 array!28846 (_ BitVec 32) (_ BitVec 32) V!17803 V!17803 (_ BitVec 32) Int) ListLongMap!7111)

(assert (=> b!462710 (= lt!209270 (getCurrentListMapNoExtraKeys!1798 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462711 () Bool)

(declare-fun res!276729 () Bool)

(assert (=> b!462711 (=> (not res!276729) (not e!270072))))

(declare-datatypes ((List!8279 0))(
  ( (Nil!8276) (Cons!8275 (h!9131 (_ BitVec 64)) (t!14215 List!8279)) )
))
(declare-fun arrayNoDuplicates!0 (array!28844 (_ BitVec 32) List!8279) Bool)

(assert (=> b!462711 (= res!276729 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8276))))

(declare-fun mapNonEmpty!20458 () Bool)

(declare-fun mapRes!20458 () Bool)

(declare-fun tp!39280 () Bool)

(declare-fun e!270071 () Bool)

(assert (=> mapNonEmpty!20458 (= mapRes!20458 (and tp!39280 e!270071))))

(declare-fun mapKey!20458 () (_ BitVec 32))

(declare-fun mapValue!20458 () ValueCell!5918)

(declare-fun mapRest!20458 () (Array (_ BitVec 32) ValueCell!5918))

(assert (=> mapNonEmpty!20458 (= (arr!13855 _values!833) (store mapRest!20458 mapKey!20458 mapValue!20458))))

(declare-fun mapIsEmpty!20458 () Bool)

(assert (=> mapIsEmpty!20458 mapRes!20458))

(declare-fun b!462712 () Bool)

(declare-fun res!276728 () Bool)

(assert (=> b!462712 (=> (not res!276728) (not e!270072))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462712 (= res!276728 (and (= (size!14207 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14206 _keys!1025) (size!14207 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462713 () Bool)

(declare-fun tp_is_empty!12523 () Bool)

(assert (=> b!462713 (= e!270071 tp_is_empty!12523)))

(declare-fun res!276727 () Bool)

(assert (=> start!41402 (=> (not res!276727) (not e!270072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41402 (= res!276727 (validMask!0 mask!1365))))

(assert (=> start!41402 e!270072))

(assert (=> start!41402 tp_is_empty!12523))

(assert (=> start!41402 tp!39279))

(assert (=> start!41402 true))

(declare-fun array_inv!10096 (array!28844) Bool)

(assert (=> start!41402 (array_inv!10096 _keys!1025)))

(declare-fun e!270074 () Bool)

(declare-fun array_inv!10097 (array!28846) Bool)

(assert (=> start!41402 (and (array_inv!10097 _values!833) e!270074)))

(declare-fun b!462714 () Bool)

(declare-fun res!276730 () Bool)

(assert (=> b!462714 (=> (not res!276730) (not e!270072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28844 (_ BitVec 32)) Bool)

(assert (=> b!462714 (= res!276730 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462715 () Bool)

(declare-fun e!270075 () Bool)

(assert (=> b!462715 (= e!270075 tp_is_empty!12523)))

(declare-fun b!462716 () Bool)

(assert (=> b!462716 (= e!270074 (and e!270075 mapRes!20458))))

(declare-fun condMapEmpty!20458 () Bool)

(declare-fun mapDefault!20458 () ValueCell!5918)

(assert (=> b!462716 (= condMapEmpty!20458 (= (arr!13855 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5918)) mapDefault!20458)))))

(assert (= (and start!41402 res!276727) b!462712))

(assert (= (and b!462712 res!276728) b!462714))

(assert (= (and b!462714 res!276730) b!462711))

(assert (= (and b!462711 res!276729) b!462710))

(assert (= (and b!462716 condMapEmpty!20458) mapIsEmpty!20458))

(assert (= (and b!462716 (not condMapEmpty!20458)) mapNonEmpty!20458))

(get-info :version)

(assert (= (and mapNonEmpty!20458 ((_ is ValueCellFull!5918) mapValue!20458)) b!462713))

(assert (= (and b!462716 ((_ is ValueCellFull!5918) mapDefault!20458)) b!462715))

(assert (= start!41402 b!462716))

(declare-fun m!445769 () Bool)

(assert (=> b!462714 m!445769))

(declare-fun m!445771 () Bool)

(assert (=> b!462711 m!445771))

(declare-fun m!445773 () Bool)

(assert (=> mapNonEmpty!20458 m!445773))

(declare-fun m!445775 () Bool)

(assert (=> start!41402 m!445775))

(declare-fun m!445777 () Bool)

(assert (=> start!41402 m!445777))

(declare-fun m!445779 () Bool)

(assert (=> start!41402 m!445779))

(declare-fun m!445781 () Bool)

(assert (=> b!462710 m!445781))

(check-sat (not b_next!11095) (not mapNonEmpty!20458) tp_is_empty!12523 (not start!41402) b_and!19441 (not b!462714) (not b!462710) (not b!462711))
(check-sat b_and!19441 (not b_next!11095))
