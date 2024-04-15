; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41438 () Bool)

(assert start!41438)

(declare-fun b_free!11131 () Bool)

(declare-fun b_next!11131 () Bool)

(assert (=> start!41438 (= b_free!11131 (not b_next!11131))))

(declare-fun tp!39388 () Bool)

(declare-fun b_and!19441 () Bool)

(assert (=> start!41438 (= tp!39388 b_and!19441)))

(declare-fun mapNonEmpty!20512 () Bool)

(declare-fun mapRes!20512 () Bool)

(declare-fun tp!39387 () Bool)

(declare-fun e!270210 () Bool)

(assert (=> mapNonEmpty!20512 (= mapRes!20512 (and tp!39387 e!270210))))

(declare-datatypes ((V!17851 0))(
  ( (V!17852 (val!6324 Int)) )
))
(declare-datatypes ((ValueCell!5936 0))(
  ( (ValueCellFull!5936 (v!8605 V!17851)) (EmptyCell!5936) )
))
(declare-fun mapRest!20512 () (Array (_ BitVec 32) ValueCell!5936))

(declare-datatypes ((array!28913 0))(
  ( (array!28914 (arr!13889 (Array (_ BitVec 32) ValueCell!5936)) (size!14242 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28913)

(declare-fun mapKey!20512 () (_ BitVec 32))

(declare-fun mapValue!20512 () ValueCell!5936)

(assert (=> mapNonEmpty!20512 (= (arr!13889 _values!833) (store mapRest!20512 mapKey!20512 mapValue!20512))))

(declare-fun b!462878 () Bool)

(declare-fun e!270208 () Bool)

(declare-fun tp_is_empty!12559 () Bool)

(assert (=> b!462878 (= e!270208 tp_is_empty!12559)))

(declare-fun b!462879 () Bool)

(declare-fun res!276823 () Bool)

(declare-fun e!270207 () Bool)

(assert (=> b!462879 (=> (not res!276823) (not e!270207))))

(declare-datatypes ((array!28915 0))(
  ( (array!28916 (arr!13890 (Array (_ BitVec 32) (_ BitVec 64))) (size!14243 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28915)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28915 (_ BitVec 32)) Bool)

(assert (=> b!462879 (= res!276823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!462880 () Bool)

(declare-fun res!276822 () Bool)

(assert (=> b!462880 (=> (not res!276822) (not e!270207))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462880 (= res!276822 (and (= (size!14242 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14243 _keys!1025) (size!14242 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20512 () Bool)

(assert (=> mapIsEmpty!20512 mapRes!20512))

(declare-fun b!462881 () Bool)

(declare-fun e!270209 () Bool)

(assert (=> b!462881 (= e!270209 (and e!270208 mapRes!20512))))

(declare-fun condMapEmpty!20512 () Bool)

(declare-fun mapDefault!20512 () ValueCell!5936)

(assert (=> b!462881 (= condMapEmpty!20512 (= (arr!13889 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5936)) mapDefault!20512)))))

(declare-fun b!462882 () Bool)

(assert (=> b!462882 (= e!270210 tp_is_empty!12559)))

(declare-fun res!276824 () Bool)

(assert (=> start!41438 (=> (not res!276824) (not e!270207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41438 (= res!276824 (validMask!0 mask!1365))))

(assert (=> start!41438 e!270207))

(assert (=> start!41438 tp_is_empty!12559))

(assert (=> start!41438 tp!39388))

(assert (=> start!41438 true))

(declare-fun array_inv!10110 (array!28915) Bool)

(assert (=> start!41438 (array_inv!10110 _keys!1025)))

(declare-fun array_inv!10111 (array!28913) Bool)

(assert (=> start!41438 (and (array_inv!10111 _values!833) e!270209)))

(declare-fun b!462883 () Bool)

(assert (=> b!462883 (= e!270207 false)))

(declare-fun minValueBefore!38 () V!17851)

(declare-fun zeroValue!794 () V!17851)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8316 0))(
  ( (tuple2!8317 (_1!4169 (_ BitVec 64)) (_2!4169 V!17851)) )
))
(declare-datatypes ((List!8403 0))(
  ( (Nil!8400) (Cons!8399 (h!9255 tuple2!8316) (t!14338 List!8403)) )
))
(declare-datatypes ((ListLongMap!7219 0))(
  ( (ListLongMap!7220 (toList!3625 List!8403)) )
))
(declare-fun lt!209078 () ListLongMap!7219)

(declare-fun getCurrentListMapNoExtraKeys!1817 (array!28915 array!28913 (_ BitVec 32) (_ BitVec 32) V!17851 V!17851 (_ BitVec 32) Int) ListLongMap!7219)

(assert (=> b!462883 (= lt!209078 (getCurrentListMapNoExtraKeys!1817 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462884 () Bool)

(declare-fun res!276821 () Bool)

(assert (=> b!462884 (=> (not res!276821) (not e!270207))))

(declare-datatypes ((List!8404 0))(
  ( (Nil!8401) (Cons!8400 (h!9256 (_ BitVec 64)) (t!14339 List!8404)) )
))
(declare-fun arrayNoDuplicates!0 (array!28915 (_ BitVec 32) List!8404) Bool)

(assert (=> b!462884 (= res!276821 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8401))))

(assert (= (and start!41438 res!276824) b!462880))

(assert (= (and b!462880 res!276822) b!462879))

(assert (= (and b!462879 res!276823) b!462884))

(assert (= (and b!462884 res!276821) b!462883))

(assert (= (and b!462881 condMapEmpty!20512) mapIsEmpty!20512))

(assert (= (and b!462881 (not condMapEmpty!20512)) mapNonEmpty!20512))

(get-info :version)

(assert (= (and mapNonEmpty!20512 ((_ is ValueCellFull!5936) mapValue!20512)) b!462882))

(assert (= (and b!462881 ((_ is ValueCellFull!5936) mapDefault!20512)) b!462878))

(assert (= start!41438 b!462881))

(declare-fun m!445105 () Bool)

(assert (=> b!462879 m!445105))

(declare-fun m!445107 () Bool)

(assert (=> start!41438 m!445107))

(declare-fun m!445109 () Bool)

(assert (=> start!41438 m!445109))

(declare-fun m!445111 () Bool)

(assert (=> start!41438 m!445111))

(declare-fun m!445113 () Bool)

(assert (=> b!462883 m!445113))

(declare-fun m!445115 () Bool)

(assert (=> mapNonEmpty!20512 m!445115))

(declare-fun m!445117 () Bool)

(assert (=> b!462884 m!445117))

(check-sat (not b_next!11131) tp_is_empty!12559 (not mapNonEmpty!20512) b_and!19441 (not b!462883) (not b!462879) (not b!462884) (not start!41438))
(check-sat b_and!19441 (not b_next!11131))
