; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38028 () Bool)

(assert start!38028)

(declare-fun b_free!8989 () Bool)

(declare-fun b_next!8989 () Bool)

(assert (=> start!38028 (= b_free!8989 (not b_next!8989))))

(declare-fun tp!31739 () Bool)

(declare-fun b_and!16329 () Bool)

(assert (=> start!38028 (= tp!31739 b_and!16329)))

(declare-fun res!224229 () Bool)

(declare-fun e!237179 () Bool)

(assert (=> start!38028 (=> (not res!224229) (not e!237179))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38028 (= res!224229 (validMask!0 mask!970))))

(assert (=> start!38028 e!237179))

(declare-datatypes ((V!13987 0))(
  ( (V!13988 (val!4875 Int)) )
))
(declare-datatypes ((ValueCell!4487 0))(
  ( (ValueCellFull!4487 (v!7101 V!13987)) (EmptyCell!4487) )
))
(declare-datatypes ((array!23210 0))(
  ( (array!23211 (arr!11066 (Array (_ BitVec 32) ValueCell!4487)) (size!11418 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23210)

(declare-fun e!237176 () Bool)

(declare-fun array_inv!8180 (array!23210) Bool)

(assert (=> start!38028 (and (array_inv!8180 _values!506) e!237176)))

(assert (=> start!38028 tp!31739))

(assert (=> start!38028 true))

(declare-fun tp_is_empty!9661 () Bool)

(assert (=> start!38028 tp_is_empty!9661))

(declare-datatypes ((array!23212 0))(
  ( (array!23213 (arr!11067 (Array (_ BitVec 32) (_ BitVec 64))) (size!11419 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23212)

(declare-fun array_inv!8181 (array!23212) Bool)

(assert (=> start!38028 (array_inv!8181 _keys!658)))

(declare-fun mapIsEmpty!16077 () Bool)

(declare-fun mapRes!16077 () Bool)

(assert (=> mapIsEmpty!16077 mapRes!16077))

(declare-fun b!391613 () Bool)

(declare-fun res!224228 () Bool)

(declare-fun e!237175 () Bool)

(assert (=> b!391613 (=> (not res!224228) (not e!237175))))

(declare-fun lt!184927 () array!23212)

(declare-datatypes ((List!6282 0))(
  ( (Nil!6279) (Cons!6278 (h!7134 (_ BitVec 64)) (t!11438 List!6282)) )
))
(declare-fun arrayNoDuplicates!0 (array!23212 (_ BitVec 32) List!6282) Bool)

(assert (=> b!391613 (= res!224228 (arrayNoDuplicates!0 lt!184927 #b00000000000000000000000000000000 Nil!6279))))

(declare-fun b!391614 () Bool)

(declare-fun res!224222 () Bool)

(assert (=> b!391614 (=> (not res!224222) (not e!237179))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391614 (= res!224222 (and (= (size!11418 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11419 _keys!658) (size!11418 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391615 () Bool)

(declare-fun res!224231 () Bool)

(assert (=> b!391615 (=> (not res!224231) (not e!237179))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391615 (= res!224231 (validKeyInArray!0 k0!778))))

(declare-fun b!391616 () Bool)

(declare-fun e!237174 () Bool)

(declare-fun e!237178 () Bool)

(assert (=> b!391616 (= e!237174 e!237178)))

(declare-fun res!224230 () Bool)

(assert (=> b!391616 (=> res!224230 e!237178)))

(assert (=> b!391616 (= res!224230 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6434 0))(
  ( (tuple2!6435 (_1!3228 (_ BitVec 64)) (_2!3228 V!13987)) )
))
(declare-datatypes ((List!6283 0))(
  ( (Nil!6280) (Cons!6279 (h!7135 tuple2!6434) (t!11439 List!6283)) )
))
(declare-datatypes ((ListLongMap!5349 0))(
  ( (ListLongMap!5350 (toList!2690 List!6283)) )
))
(declare-fun lt!184924 () ListLongMap!5349)

(declare-fun lt!184933 () ListLongMap!5349)

(assert (=> b!391616 (= lt!184924 lt!184933)))

(declare-fun lt!184929 () ListLongMap!5349)

(declare-fun lt!184930 () tuple2!6434)

(declare-fun +!1044 (ListLongMap!5349 tuple2!6434) ListLongMap!5349)

(assert (=> b!391616 (= lt!184933 (+!1044 lt!184929 lt!184930))))

(declare-fun lt!184931 () ListLongMap!5349)

(declare-fun lt!184926 () ListLongMap!5349)

(assert (=> b!391616 (= lt!184931 lt!184926)))

(declare-fun lt!184928 () ListLongMap!5349)

(assert (=> b!391616 (= lt!184926 (+!1044 lt!184928 lt!184930))))

(declare-fun lt!184921 () ListLongMap!5349)

(assert (=> b!391616 (= lt!184924 (+!1044 lt!184921 lt!184930))))

(declare-fun zeroValue!472 () V!13987)

(assert (=> b!391616 (= lt!184930 (tuple2!6435 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391617 () Bool)

(declare-fun e!237181 () Bool)

(assert (=> b!391617 (= e!237181 tp_is_empty!9661)))

(declare-fun b!391618 () Bool)

(declare-fun res!224232 () Bool)

(assert (=> b!391618 (=> (not res!224232) (not e!237179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23212 (_ BitVec 32)) Bool)

(assert (=> b!391618 (= res!224232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391619 () Bool)

(declare-fun res!224225 () Bool)

(assert (=> b!391619 (=> (not res!224225) (not e!237179))))

(declare-fun arrayContainsKey!0 (array!23212 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391619 (= res!224225 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391620 () Bool)

(declare-fun e!237180 () Bool)

(assert (=> b!391620 (= e!237180 tp_is_empty!9661)))

(declare-fun b!391621 () Bool)

(assert (=> b!391621 (= e!237176 (and e!237181 mapRes!16077))))

(declare-fun condMapEmpty!16077 () Bool)

(declare-fun mapDefault!16077 () ValueCell!4487)

(assert (=> b!391621 (= condMapEmpty!16077 (= (arr!11066 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4487)) mapDefault!16077)))))

(declare-fun b!391622 () Bool)

(declare-fun res!224227 () Bool)

(assert (=> b!391622 (=> (not res!224227) (not e!237179))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391622 (= res!224227 (or (= (select (arr!11067 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11067 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16077 () Bool)

(declare-fun tp!31740 () Bool)

(assert (=> mapNonEmpty!16077 (= mapRes!16077 (and tp!31740 e!237180))))

(declare-fun mapKey!16077 () (_ BitVec 32))

(declare-fun mapRest!16077 () (Array (_ BitVec 32) ValueCell!4487))

(declare-fun mapValue!16077 () ValueCell!4487)

(assert (=> mapNonEmpty!16077 (= (arr!11066 _values!506) (store mapRest!16077 mapKey!16077 mapValue!16077))))

(declare-fun lt!184922 () tuple2!6434)

(declare-fun b!391623 () Bool)

(assert (=> b!391623 (= e!237178 (= (+!1044 lt!184931 lt!184922) lt!184924))))

(assert (=> b!391623 (= lt!184933 (+!1044 lt!184926 lt!184922))))

(declare-fun v!373 () V!13987)

(declare-datatypes ((Unit!11959 0))(
  ( (Unit!11960) )
))
(declare-fun lt!184925 () Unit!11959)

(declare-fun addCommutativeForDiffKeys!342 (ListLongMap!5349 (_ BitVec 64) V!13987 (_ BitVec 64) V!13987) Unit!11959)

(assert (=> b!391623 (= lt!184925 (addCommutativeForDiffKeys!342 lt!184928 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391624 () Bool)

(declare-fun res!224224 () Bool)

(assert (=> b!391624 (=> (not res!224224) (not e!237179))))

(assert (=> b!391624 (= res!224224 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6279))))

(declare-fun b!391625 () Bool)

(assert (=> b!391625 (= e!237175 (not e!237174))))

(declare-fun res!224223 () Bool)

(assert (=> b!391625 (=> res!224223 e!237174)))

(assert (=> b!391625 (= res!224223 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13987)

(declare-fun getCurrentListMap!2069 (array!23212 array!23210 (_ BitVec 32) (_ BitVec 32) V!13987 V!13987 (_ BitVec 32) Int) ListLongMap!5349)

(assert (=> b!391625 (= lt!184931 (getCurrentListMap!2069 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184932 () array!23210)

(assert (=> b!391625 (= lt!184924 (getCurrentListMap!2069 lt!184927 lt!184932 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391625 (and (= lt!184921 lt!184929) (= lt!184929 lt!184921))))

(assert (=> b!391625 (= lt!184929 (+!1044 lt!184928 lt!184922))))

(assert (=> b!391625 (= lt!184922 (tuple2!6435 k0!778 v!373))))

(declare-fun lt!184923 () Unit!11959)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!260 (array!23212 array!23210 (_ BitVec 32) (_ BitVec 32) V!13987 V!13987 (_ BitVec 32) (_ BitVec 64) V!13987 (_ BitVec 32) Int) Unit!11959)

(assert (=> b!391625 (= lt!184923 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!260 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!958 (array!23212 array!23210 (_ BitVec 32) (_ BitVec 32) V!13987 V!13987 (_ BitVec 32) Int) ListLongMap!5349)

(assert (=> b!391625 (= lt!184921 (getCurrentListMapNoExtraKeys!958 lt!184927 lt!184932 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391625 (= lt!184932 (array!23211 (store (arr!11066 _values!506) i!548 (ValueCellFull!4487 v!373)) (size!11418 _values!506)))))

(assert (=> b!391625 (= lt!184928 (getCurrentListMapNoExtraKeys!958 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391626 () Bool)

(declare-fun res!224226 () Bool)

(assert (=> b!391626 (=> (not res!224226) (not e!237179))))

(assert (=> b!391626 (= res!224226 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11419 _keys!658))))))

(declare-fun b!391627 () Bool)

(assert (=> b!391627 (= e!237179 e!237175)))

(declare-fun res!224233 () Bool)

(assert (=> b!391627 (=> (not res!224233) (not e!237175))))

(assert (=> b!391627 (= res!224233 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184927 mask!970))))

(assert (=> b!391627 (= lt!184927 (array!23213 (store (arr!11067 _keys!658) i!548 k0!778) (size!11419 _keys!658)))))

(assert (= (and start!38028 res!224229) b!391614))

(assert (= (and b!391614 res!224222) b!391618))

(assert (= (and b!391618 res!224232) b!391624))

(assert (= (and b!391624 res!224224) b!391626))

(assert (= (and b!391626 res!224226) b!391615))

(assert (= (and b!391615 res!224231) b!391622))

(assert (= (and b!391622 res!224227) b!391619))

(assert (= (and b!391619 res!224225) b!391627))

(assert (= (and b!391627 res!224233) b!391613))

(assert (= (and b!391613 res!224228) b!391625))

(assert (= (and b!391625 (not res!224223)) b!391616))

(assert (= (and b!391616 (not res!224230)) b!391623))

(assert (= (and b!391621 condMapEmpty!16077) mapIsEmpty!16077))

(assert (= (and b!391621 (not condMapEmpty!16077)) mapNonEmpty!16077))

(get-info :version)

(assert (= (and mapNonEmpty!16077 ((_ is ValueCellFull!4487) mapValue!16077)) b!391620))

(assert (= (and b!391621 ((_ is ValueCellFull!4487) mapDefault!16077)) b!391617))

(assert (= start!38028 b!391621))

(declare-fun m!388273 () Bool)

(assert (=> b!391613 m!388273))

(declare-fun m!388275 () Bool)

(assert (=> start!38028 m!388275))

(declare-fun m!388277 () Bool)

(assert (=> start!38028 m!388277))

(declare-fun m!388279 () Bool)

(assert (=> start!38028 m!388279))

(declare-fun m!388281 () Bool)

(assert (=> b!391625 m!388281))

(declare-fun m!388283 () Bool)

(assert (=> b!391625 m!388283))

(declare-fun m!388285 () Bool)

(assert (=> b!391625 m!388285))

(declare-fun m!388287 () Bool)

(assert (=> b!391625 m!388287))

(declare-fun m!388289 () Bool)

(assert (=> b!391625 m!388289))

(declare-fun m!388291 () Bool)

(assert (=> b!391625 m!388291))

(declare-fun m!388293 () Bool)

(assert (=> b!391625 m!388293))

(declare-fun m!388295 () Bool)

(assert (=> b!391623 m!388295))

(declare-fun m!388297 () Bool)

(assert (=> b!391623 m!388297))

(declare-fun m!388299 () Bool)

(assert (=> b!391623 m!388299))

(declare-fun m!388301 () Bool)

(assert (=> b!391619 m!388301))

(declare-fun m!388303 () Bool)

(assert (=> b!391616 m!388303))

(declare-fun m!388305 () Bool)

(assert (=> b!391616 m!388305))

(declare-fun m!388307 () Bool)

(assert (=> b!391616 m!388307))

(declare-fun m!388309 () Bool)

(assert (=> b!391622 m!388309))

(declare-fun m!388311 () Bool)

(assert (=> b!391615 m!388311))

(declare-fun m!388313 () Bool)

(assert (=> mapNonEmpty!16077 m!388313))

(declare-fun m!388315 () Bool)

(assert (=> b!391618 m!388315))

(declare-fun m!388317 () Bool)

(assert (=> b!391627 m!388317))

(declare-fun m!388319 () Bool)

(assert (=> b!391627 m!388319))

(declare-fun m!388321 () Bool)

(assert (=> b!391624 m!388321))

(check-sat b_and!16329 (not b_next!8989) (not start!38028) (not b!391623) (not b!391613) (not mapNonEmpty!16077) tp_is_empty!9661 (not b!391625) (not b!391615) (not b!391616) (not b!391619) (not b!391618) (not b!391624) (not b!391627))
(check-sat b_and!16329 (not b_next!8989))
