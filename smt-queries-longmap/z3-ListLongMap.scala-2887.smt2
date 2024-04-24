; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41438 () Bool)

(assert start!41438)

(declare-fun b_free!11131 () Bool)

(declare-fun b_next!11131 () Bool)

(assert (=> start!41438 (= b_free!11131 (not b_next!11131))))

(declare-fun tp!39387 () Bool)

(declare-fun b_and!19477 () Bool)

(assert (=> start!41438 (= tp!39387 b_and!19477)))

(declare-fun b!463088 () Bool)

(declare-fun e!270345 () Bool)

(declare-fun tp_is_empty!12559 () Bool)

(assert (=> b!463088 (= e!270345 tp_is_empty!12559)))

(declare-fun res!276943 () Bool)

(declare-fun e!270344 () Bool)

(assert (=> start!41438 (=> (not res!276943) (not e!270344))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41438 (= res!276943 (validMask!0 mask!1365))))

(assert (=> start!41438 e!270344))

(assert (=> start!41438 tp_is_empty!12559))

(assert (=> start!41438 tp!39387))

(assert (=> start!41438 true))

(declare-datatypes ((array!28914 0))(
  ( (array!28915 (arr!13889 (Array (_ BitVec 32) (_ BitVec 64))) (size!14241 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28914)

(declare-fun array_inv!10124 (array!28914) Bool)

(assert (=> start!41438 (array_inv!10124 _keys!1025)))

(declare-datatypes ((V!17851 0))(
  ( (V!17852 (val!6324 Int)) )
))
(declare-datatypes ((ValueCell!5936 0))(
  ( (ValueCellFull!5936 (v!8612 V!17851)) (EmptyCell!5936) )
))
(declare-datatypes ((array!28916 0))(
  ( (array!28917 (arr!13890 (Array (_ BitVec 32) ValueCell!5936)) (size!14242 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28916)

(declare-fun e!270343 () Bool)

(declare-fun array_inv!10125 (array!28916) Bool)

(assert (=> start!41438 (and (array_inv!10125 _values!833) e!270343)))

(declare-fun b!463089 () Bool)

(declare-fun e!270341 () Bool)

(assert (=> b!463089 (= e!270341 tp_is_empty!12559)))

(declare-fun b!463090 () Bool)

(assert (=> b!463090 (= e!270344 false)))

(declare-fun minValueBefore!38 () V!17851)

(declare-fun zeroValue!794 () V!17851)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8222 0))(
  ( (tuple2!8223 (_1!4122 (_ BitVec 64)) (_2!4122 V!17851)) )
))
(declare-datatypes ((List!8303 0))(
  ( (Nil!8300) (Cons!8299 (h!9155 tuple2!8222) (t!14239 List!8303)) )
))
(declare-datatypes ((ListLongMap!7137 0))(
  ( (ListLongMap!7138 (toList!3584 List!8303)) )
))
(declare-fun lt!209324 () ListLongMap!7137)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1811 (array!28914 array!28916 (_ BitVec 32) (_ BitVec 32) V!17851 V!17851 (_ BitVec 32) Int) ListLongMap!7137)

(assert (=> b!463090 (= lt!209324 (getCurrentListMapNoExtraKeys!1811 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463091 () Bool)

(declare-fun res!276945 () Bool)

(assert (=> b!463091 (=> (not res!276945) (not e!270344))))

(declare-datatypes ((List!8304 0))(
  ( (Nil!8301) (Cons!8300 (h!9156 (_ BitVec 64)) (t!14240 List!8304)) )
))
(declare-fun arrayNoDuplicates!0 (array!28914 (_ BitVec 32) List!8304) Bool)

(assert (=> b!463091 (= res!276945 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8301))))

(declare-fun b!463092 () Bool)

(declare-fun res!276946 () Bool)

(assert (=> b!463092 (=> (not res!276946) (not e!270344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28914 (_ BitVec 32)) Bool)

(assert (=> b!463092 (= res!276946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463093 () Bool)

(declare-fun mapRes!20512 () Bool)

(assert (=> b!463093 (= e!270343 (and e!270345 mapRes!20512))))

(declare-fun condMapEmpty!20512 () Bool)

(declare-fun mapDefault!20512 () ValueCell!5936)

(assert (=> b!463093 (= condMapEmpty!20512 (= (arr!13890 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5936)) mapDefault!20512)))))

(declare-fun mapNonEmpty!20512 () Bool)

(declare-fun tp!39388 () Bool)

(assert (=> mapNonEmpty!20512 (= mapRes!20512 (and tp!39388 e!270341))))

(declare-fun mapKey!20512 () (_ BitVec 32))

(declare-fun mapValue!20512 () ValueCell!5936)

(declare-fun mapRest!20512 () (Array (_ BitVec 32) ValueCell!5936))

(assert (=> mapNonEmpty!20512 (= (arr!13890 _values!833) (store mapRest!20512 mapKey!20512 mapValue!20512))))

(declare-fun b!463094 () Bool)

(declare-fun res!276944 () Bool)

(assert (=> b!463094 (=> (not res!276944) (not e!270344))))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463094 (= res!276944 (and (= (size!14242 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14241 _keys!1025) (size!14242 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20512 () Bool)

(assert (=> mapIsEmpty!20512 mapRes!20512))

(assert (= (and start!41438 res!276943) b!463094))

(assert (= (and b!463094 res!276944) b!463092))

(assert (= (and b!463092 res!276946) b!463091))

(assert (= (and b!463091 res!276945) b!463090))

(assert (= (and b!463093 condMapEmpty!20512) mapIsEmpty!20512))

(assert (= (and b!463093 (not condMapEmpty!20512)) mapNonEmpty!20512))

(get-info :version)

(assert (= (and mapNonEmpty!20512 ((_ is ValueCellFull!5936) mapValue!20512)) b!463089))

(assert (= (and b!463093 ((_ is ValueCellFull!5936) mapDefault!20512)) b!463088))

(assert (= start!41438 b!463093))

(declare-fun m!446021 () Bool)

(assert (=> start!41438 m!446021))

(declare-fun m!446023 () Bool)

(assert (=> start!41438 m!446023))

(declare-fun m!446025 () Bool)

(assert (=> start!41438 m!446025))

(declare-fun m!446027 () Bool)

(assert (=> mapNonEmpty!20512 m!446027))

(declare-fun m!446029 () Bool)

(assert (=> b!463090 m!446029))

(declare-fun m!446031 () Bool)

(assert (=> b!463091 m!446031))

(declare-fun m!446033 () Bool)

(assert (=> b!463092 m!446033))

(check-sat (not b!463092) (not mapNonEmpty!20512) tp_is_empty!12559 b_and!19477 (not start!41438) (not b!463090) (not b!463091) (not b_next!11131))
(check-sat b_and!19477 (not b_next!11131))
