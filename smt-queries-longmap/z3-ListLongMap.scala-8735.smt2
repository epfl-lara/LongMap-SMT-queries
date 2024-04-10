; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!105906 () Bool)

(assert start!105906)

(declare-fun b_free!27447 () Bool)

(declare-fun b_next!27447 () Bool)

(assert (=> start!105906 (= b_free!27447 (not b_next!27447))))

(declare-fun tp!95873 () Bool)

(declare-fun b_and!45355 () Bool)

(assert (=> start!105906 (= tp!95873 b_and!45355)))

(declare-fun b!1261441 () Bool)

(declare-fun e!717949 () Bool)

(declare-fun e!717950 () Bool)

(declare-fun mapRes!50326 () Bool)

(assert (=> b!1261441 (= e!717949 (and e!717950 mapRes!50326))))

(declare-fun condMapEmpty!50326 () Bool)

(declare-datatypes ((V!48497 0))(
  ( (V!48498 (val!16237 Int)) )
))
(declare-datatypes ((ValueCell!15411 0))(
  ( (ValueCellFull!15411 (v!18941 V!48497)) (EmptyCell!15411) )
))
(declare-datatypes ((array!82312 0))(
  ( (array!82313 (arr!39709 (Array (_ BitVec 32) ValueCell!15411)) (size!40245 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82312)

(declare-fun mapDefault!50326 () ValueCell!15411)

(assert (=> b!1261441 (= condMapEmpty!50326 (= (arr!39709 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15411)) mapDefault!50326)))))

(declare-fun b!1261442 () Bool)

(declare-fun e!717946 () Bool)

(declare-fun tp_is_empty!32349 () Bool)

(assert (=> b!1261442 (= e!717946 tp_is_empty!32349)))

(declare-fun res!840577 () Bool)

(declare-fun e!717947 () Bool)

(assert (=> start!105906 (=> (not res!840577) (not e!717947))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!105906 (= res!840577 (validMask!0 mask!1466))))

(assert (=> start!105906 e!717947))

(assert (=> start!105906 true))

(assert (=> start!105906 tp!95873))

(assert (=> start!105906 tp_is_empty!32349))

(declare-datatypes ((array!82314 0))(
  ( (array!82315 (arr!39710 (Array (_ BitVec 32) (_ BitVec 64))) (size!40246 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82314)

(declare-fun array_inv!30231 (array!82314) Bool)

(assert (=> start!105906 (array_inv!30231 _keys!1118)))

(declare-fun array_inv!30232 (array!82312) Bool)

(assert (=> start!105906 (and (array_inv!30232 _values!914) e!717949)))

(declare-fun b!1261443 () Bool)

(assert (=> b!1261443 (= e!717950 tp_is_empty!32349)))

(declare-fun b!1261444 () Bool)

(declare-fun res!840574 () Bool)

(assert (=> b!1261444 (=> (not res!840574) (not e!717947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82314 (_ BitVec 32)) Bool)

(assert (=> b!1261444 (= res!840574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun mapNonEmpty!50326 () Bool)

(declare-fun tp!95872 () Bool)

(assert (=> mapNonEmpty!50326 (= mapRes!50326 (and tp!95872 e!717946))))

(declare-fun mapKey!50326 () (_ BitVec 32))

(declare-fun mapValue!50326 () ValueCell!15411)

(declare-fun mapRest!50326 () (Array (_ BitVec 32) ValueCell!15411))

(assert (=> mapNonEmpty!50326 (= (arr!39709 _values!914) (store mapRest!50326 mapKey!50326 mapValue!50326))))

(declare-fun b!1261445 () Bool)

(declare-fun res!840576 () Bool)

(assert (=> b!1261445 (=> (not res!840576) (not e!717947))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1261445 (= res!840576 (and (= (size!40245 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40246 _keys!1118) (size!40245 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1261446 () Bool)

(declare-fun res!840575 () Bool)

(assert (=> b!1261446 (=> (not res!840575) (not e!717947))))

(declare-datatypes ((List!28209 0))(
  ( (Nil!28206) (Cons!28205 (h!29414 (_ BitVec 64)) (t!41708 List!28209)) )
))
(declare-fun arrayNoDuplicates!0 (array!82314 (_ BitVec 32) List!28209) Bool)

(assert (=> b!1261446 (= res!840575 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28206))))

(declare-fun b!1261447 () Bool)

(assert (=> b!1261447 (= e!717947 false)))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((tuple2!21012 0))(
  ( (tuple2!21013 (_1!10517 (_ BitVec 64)) (_2!10517 V!48497)) )
))
(declare-datatypes ((List!28210 0))(
  ( (Nil!28207) (Cons!28206 (h!29415 tuple2!21012) (t!41709 List!28210)) )
))
(declare-datatypes ((ListLongMap!18885 0))(
  ( (ListLongMap!18886 (toList!9458 List!28210)) )
))
(declare-fun lt!571628 () ListLongMap!18885)

(declare-fun minValueAfter!43 () V!48497)

(declare-fun zeroValue!871 () V!48497)

(declare-fun getCurrentListMapNoExtraKeys!5826 (array!82314 array!82312 (_ BitVec 32) (_ BitVec 32) V!48497 V!48497 (_ BitVec 32) Int) ListLongMap!18885)

(assert (=> b!1261447 (= lt!571628 (getCurrentListMapNoExtraKeys!5826 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48497)

(declare-fun lt!571629 () ListLongMap!18885)

(assert (=> b!1261447 (= lt!571629 (getCurrentListMapNoExtraKeys!5826 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun mapIsEmpty!50326 () Bool)

(assert (=> mapIsEmpty!50326 mapRes!50326))

(assert (= (and start!105906 res!840577) b!1261445))

(assert (= (and b!1261445 res!840576) b!1261444))

(assert (= (and b!1261444 res!840574) b!1261446))

(assert (= (and b!1261446 res!840575) b!1261447))

(assert (= (and b!1261441 condMapEmpty!50326) mapIsEmpty!50326))

(assert (= (and b!1261441 (not condMapEmpty!50326)) mapNonEmpty!50326))

(get-info :version)

(assert (= (and mapNonEmpty!50326 ((_ is ValueCellFull!15411) mapValue!50326)) b!1261442))

(assert (= (and b!1261441 ((_ is ValueCellFull!15411) mapDefault!50326)) b!1261443))

(assert (= start!105906 b!1261441))

(declare-fun m!1162065 () Bool)

(assert (=> mapNonEmpty!50326 m!1162065))

(declare-fun m!1162067 () Bool)

(assert (=> b!1261444 m!1162067))

(declare-fun m!1162069 () Bool)

(assert (=> b!1261447 m!1162069))

(declare-fun m!1162071 () Bool)

(assert (=> b!1261447 m!1162071))

(declare-fun m!1162073 () Bool)

(assert (=> b!1261446 m!1162073))

(declare-fun m!1162075 () Bool)

(assert (=> start!105906 m!1162075))

(declare-fun m!1162077 () Bool)

(assert (=> start!105906 m!1162077))

(declare-fun m!1162079 () Bool)

(assert (=> start!105906 m!1162079))

(check-sat (not b!1261446) (not b!1261447) (not start!105906) b_and!45355 (not b_next!27447) tp_is_empty!32349 (not mapNonEmpty!50326) (not b!1261444))
(check-sat b_and!45355 (not b_next!27447))
