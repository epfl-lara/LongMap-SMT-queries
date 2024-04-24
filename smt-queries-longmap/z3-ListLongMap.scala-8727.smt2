; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106080 () Bool)

(assert start!106080)

(declare-fun b_free!27397 () Bool)

(declare-fun b_next!27397 () Bool)

(assert (=> start!106080 (= b_free!27397 (not b_next!27397))))

(declare-fun tp!95723 () Bool)

(declare-fun b_and!45307 () Bool)

(assert (=> start!106080 (= tp!95723 b_and!45307)))

(declare-fun b!1262221 () Bool)

(declare-fun e!718422 () Bool)

(declare-fun tp_is_empty!32299 () Bool)

(assert (=> b!1262221 (= e!718422 tp_is_empty!32299)))

(declare-fun mapIsEmpty!50251 () Bool)

(declare-fun mapRes!50251 () Bool)

(assert (=> mapIsEmpty!50251 mapRes!50251))

(declare-fun b!1262222 () Bool)

(declare-fun res!840797 () Bool)

(declare-fun e!718421 () Bool)

(assert (=> b!1262222 (=> (not res!840797) (not e!718421))))

(declare-datatypes ((array!82263 0))(
  ( (array!82264 (arr!39680 (Array (_ BitVec 32) (_ BitVec 64))) (size!40217 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82263)

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82263 (_ BitVec 32)) Bool)

(assert (=> b!1262222 (= res!840797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1262223 () Bool)

(declare-fun e!718418 () Bool)

(assert (=> b!1262223 (= e!718418 tp_is_empty!32299)))

(declare-fun b!1262224 () Bool)

(declare-fun res!840796 () Bool)

(assert (=> b!1262224 (=> (not res!840796) (not e!718421))))

(declare-datatypes ((List!28213 0))(
  ( (Nil!28210) (Cons!28209 (h!29427 (_ BitVec 64)) (t!41704 List!28213)) )
))
(declare-fun arrayNoDuplicates!0 (array!82263 (_ BitVec 32) List!28213) Bool)

(assert (=> b!1262224 (= res!840796 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28210))))

(declare-fun mapNonEmpty!50251 () Bool)

(declare-fun tp!95722 () Bool)

(assert (=> mapNonEmpty!50251 (= mapRes!50251 (and tp!95722 e!718422))))

(declare-fun mapKey!50251 () (_ BitVec 32))

(declare-datatypes ((V!48431 0))(
  ( (V!48432 (val!16212 Int)) )
))
(declare-datatypes ((ValueCell!15386 0))(
  ( (ValueCellFull!15386 (v!18912 V!48431)) (EmptyCell!15386) )
))
(declare-fun mapRest!50251 () (Array (_ BitVec 32) ValueCell!15386))

(declare-fun mapValue!50251 () ValueCell!15386)

(declare-datatypes ((array!82265 0))(
  ( (array!82266 (arr!39681 (Array (_ BitVec 32) ValueCell!15386)) (size!40218 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82265)

(assert (=> mapNonEmpty!50251 (= (arr!39681 _values!914) (store mapRest!50251 mapKey!50251 mapValue!50251))))

(declare-fun b!1262225 () Bool)

(declare-fun res!840794 () Bool)

(assert (=> b!1262225 (=> (not res!840794) (not e!718421))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1262225 (= res!840794 (and (= (size!40218 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40217 _keys!1118) (size!40218 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1262227 () Bool)

(declare-fun e!718420 () Bool)

(assert (=> b!1262227 (= e!718420 (and e!718418 mapRes!50251))))

(declare-fun condMapEmpty!50251 () Bool)

(declare-fun mapDefault!50251 () ValueCell!15386)

(assert (=> b!1262227 (= condMapEmpty!50251 (= (arr!39681 _values!914) ((as const (Array (_ BitVec 32) ValueCell!15386)) mapDefault!50251)))))

(declare-fun b!1262226 () Bool)

(assert (=> b!1262226 (= e!718421 false)))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48431)

(declare-fun zeroValue!871 () V!48431)

(declare-datatypes ((tuple2!20990 0))(
  ( (tuple2!20991 (_1!10506 (_ BitVec 64)) (_2!10506 V!48431)) )
))
(declare-datatypes ((List!28214 0))(
  ( (Nil!28211) (Cons!28210 (h!29428 tuple2!20990) (t!41705 List!28214)) )
))
(declare-datatypes ((ListLongMap!18871 0))(
  ( (ListLongMap!18872 (toList!9451 List!28214)) )
))
(declare-fun lt!571963 () ListLongMap!18871)

(declare-fun getCurrentListMapNoExtraKeys!5857 (array!82263 array!82265 (_ BitVec 32) (_ BitVec 32) V!48431 V!48431 (_ BitVec 32) Int) ListLongMap!18871)

(assert (=> b!1262226 (= lt!571963 (getCurrentListMapNoExtraKeys!5857 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun minValueBefore!43 () V!48431)

(declare-fun lt!571962 () ListLongMap!18871)

(assert (=> b!1262226 (= lt!571962 (getCurrentListMapNoExtraKeys!5857 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun res!840795 () Bool)

(assert (=> start!106080 (=> (not res!840795) (not e!718421))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106080 (= res!840795 (validMask!0 mask!1466))))

(assert (=> start!106080 e!718421))

(assert (=> start!106080 true))

(assert (=> start!106080 tp!95723))

(assert (=> start!106080 tp_is_empty!32299))

(declare-fun array_inv!30355 (array!82263) Bool)

(assert (=> start!106080 (array_inv!30355 _keys!1118)))

(declare-fun array_inv!30356 (array!82265) Bool)

(assert (=> start!106080 (and (array_inv!30356 _values!914) e!718420)))

(assert (= (and start!106080 res!840795) b!1262225))

(assert (= (and b!1262225 res!840794) b!1262222))

(assert (= (and b!1262222 res!840797) b!1262224))

(assert (= (and b!1262224 res!840796) b!1262226))

(assert (= (and b!1262227 condMapEmpty!50251) mapIsEmpty!50251))

(assert (= (and b!1262227 (not condMapEmpty!50251)) mapNonEmpty!50251))

(get-info :version)

(assert (= (and mapNonEmpty!50251 ((_ is ValueCellFull!15386) mapValue!50251)) b!1262221))

(assert (= (and b!1262227 ((_ is ValueCellFull!15386) mapDefault!50251)) b!1262223))

(assert (= start!106080 b!1262227))

(declare-fun m!1163277 () Bool)

(assert (=> b!1262224 m!1163277))

(declare-fun m!1163279 () Bool)

(assert (=> b!1262226 m!1163279))

(declare-fun m!1163281 () Bool)

(assert (=> b!1262226 m!1163281))

(declare-fun m!1163283 () Bool)

(assert (=> mapNonEmpty!50251 m!1163283))

(declare-fun m!1163285 () Bool)

(assert (=> b!1262222 m!1163285))

(declare-fun m!1163287 () Bool)

(assert (=> start!106080 m!1163287))

(declare-fun m!1163289 () Bool)

(assert (=> start!106080 m!1163289))

(declare-fun m!1163291 () Bool)

(assert (=> start!106080 m!1163291))

(check-sat (not start!106080) (not b_next!27397) (not b!1262226) (not b!1262222) tp_is_empty!32299 (not mapNonEmpty!50251) (not b!1262224) b_and!45307)
(check-sat b_and!45307 (not b_next!27397))
