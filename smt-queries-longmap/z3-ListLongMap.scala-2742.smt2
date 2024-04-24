; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40276 () Bool)

(assert start!40276)

(declare-fun b_free!10531 () Bool)

(declare-fun b_next!10531 () Bool)

(assert (=> start!40276 (= b_free!10531 (not b_next!10531))))

(declare-fun tp!37134 () Bool)

(declare-fun b_and!18529 () Bool)

(assert (=> start!40276 (= tp!37134 b_and!18529)))

(declare-fun b!442323 () Bool)

(declare-fun res!261995 () Bool)

(declare-fun e!260339 () Bool)

(assert (=> b!442323 (=> (not res!261995) (not e!260339))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442323 (= res!261995 (validKeyInArray!0 k0!794))))

(declare-fun b!442324 () Bool)

(declare-fun e!260338 () Bool)

(declare-fun tp_is_empty!11689 () Bool)

(assert (=> b!442324 (= e!260338 tp_is_empty!11689)))

(declare-fun b!442325 () Bool)

(declare-fun e!260342 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442325 (= e!260342 (and (not (= from!863 i!563)) (bvsge from!863 i!563)))))

(declare-datatypes ((V!16691 0))(
  ( (V!16692 (val!5889 Int)) )
))
(declare-fun minValue!515 () V!16691)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5501 0))(
  ( (ValueCellFull!5501 (v!8141 V!16691)) (EmptyCell!5501) )
))
(declare-datatypes ((array!27196 0))(
  ( (array!27197 (arr!13046 (Array (_ BitVec 32) ValueCell!5501)) (size!13398 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27196)

(declare-fun zeroValue!515 () V!16691)

(declare-fun v!412 () V!16691)

(declare-datatypes ((array!27198 0))(
  ( (array!27199 (arr!13047 (Array (_ BitVec 32) (_ BitVec 64))) (size!13399 (_ BitVec 32))) )
))
(declare-fun lt!203204 () array!27198)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7740 0))(
  ( (tuple2!7741 (_1!3881 (_ BitVec 64)) (_2!3881 V!16691)) )
))
(declare-datatypes ((List!7732 0))(
  ( (Nil!7729) (Cons!7728 (h!8584 tuple2!7740) (t!13482 List!7732)) )
))
(declare-datatypes ((ListLongMap!6655 0))(
  ( (ListLongMap!6656 (toList!3343 List!7732)) )
))
(declare-fun lt!203205 () ListLongMap!6655)

(declare-fun getCurrentListMapNoExtraKeys!1575 (array!27198 array!27196 (_ BitVec 32) (_ BitVec 32) V!16691 V!16691 (_ BitVec 32) Int) ListLongMap!6655)

(assert (=> b!442325 (= lt!203205 (getCurrentListMapNoExtraKeys!1575 lt!203204 (array!27197 (store (arr!13046 _values!549) i!563 (ValueCellFull!5501 v!412)) (size!13398 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!203203 () ListLongMap!6655)

(declare-fun _keys!709 () array!27198)

(assert (=> b!442325 (= lt!203203 (getCurrentListMapNoExtraKeys!1575 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!442326 () Bool)

(declare-fun e!260337 () Bool)

(assert (=> b!442326 (= e!260337 tp_is_empty!11689)))

(declare-fun b!442328 () Bool)

(assert (=> b!442328 (= e!260339 e!260342)))

(declare-fun res!261997 () Bool)

(assert (=> b!442328 (=> (not res!261997) (not e!260342))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27198 (_ BitVec 32)) Bool)

(assert (=> b!442328 (= res!261997 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203204 mask!1025))))

(assert (=> b!442328 (= lt!203204 (array!27199 (store (arr!13047 _keys!709) i!563 k0!794) (size!13399 _keys!709)))))

(declare-fun b!442329 () Bool)

(declare-fun res!261991 () Bool)

(assert (=> b!442329 (=> (not res!261991) (not e!260342))))

(assert (=> b!442329 (= res!261991 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19158 () Bool)

(declare-fun mapRes!19158 () Bool)

(assert (=> mapIsEmpty!19158 mapRes!19158))

(declare-fun b!442330 () Bool)

(declare-fun res!261992 () Bool)

(assert (=> b!442330 (=> (not res!261992) (not e!260339))))

(assert (=> b!442330 (= res!261992 (or (= (select (arr!13047 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13047 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442331 () Bool)

(declare-fun res!262001 () Bool)

(assert (=> b!442331 (=> (not res!262001) (not e!260339))))

(declare-datatypes ((List!7733 0))(
  ( (Nil!7730) (Cons!7729 (h!8585 (_ BitVec 64)) (t!13483 List!7733)) )
))
(declare-fun arrayNoDuplicates!0 (array!27198 (_ BitVec 32) List!7733) Bool)

(assert (=> b!442331 (= res!262001 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7730))))

(declare-fun b!442332 () Bool)

(declare-fun res!261994 () Bool)

(assert (=> b!442332 (=> (not res!261994) (not e!260342))))

(assert (=> b!442332 (= res!261994 (arrayNoDuplicates!0 lt!203204 #b00000000000000000000000000000000 Nil!7730))))

(declare-fun b!442333 () Bool)

(declare-fun res!261990 () Bool)

(assert (=> b!442333 (=> (not res!261990) (not e!260339))))

(assert (=> b!442333 (= res!261990 (and (= (size!13398 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13399 _keys!709) (size!13398 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442334 () Bool)

(declare-fun e!260341 () Bool)

(assert (=> b!442334 (= e!260341 (and e!260337 mapRes!19158))))

(declare-fun condMapEmpty!19158 () Bool)

(declare-fun mapDefault!19158 () ValueCell!5501)

(assert (=> b!442334 (= condMapEmpty!19158 (= (arr!13046 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5501)) mapDefault!19158)))))

(declare-fun res!262000 () Bool)

(assert (=> start!40276 (=> (not res!262000) (not e!260339))))

(assert (=> start!40276 (= res!262000 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13399 _keys!709))))))

(assert (=> start!40276 e!260339))

(assert (=> start!40276 tp_is_empty!11689))

(assert (=> start!40276 tp!37134))

(assert (=> start!40276 true))

(declare-fun array_inv!9532 (array!27196) Bool)

(assert (=> start!40276 (and (array_inv!9532 _values!549) e!260341)))

(declare-fun array_inv!9533 (array!27198) Bool)

(assert (=> start!40276 (array_inv!9533 _keys!709)))

(declare-fun b!442327 () Bool)

(declare-fun res!261998 () Bool)

(assert (=> b!442327 (=> (not res!261998) (not e!260339))))

(assert (=> b!442327 (= res!261998 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13399 _keys!709))))))

(declare-fun b!442335 () Bool)

(declare-fun res!261999 () Bool)

(assert (=> b!442335 (=> (not res!261999) (not e!260339))))

(assert (=> b!442335 (= res!261999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19158 () Bool)

(declare-fun tp!37133 () Bool)

(assert (=> mapNonEmpty!19158 (= mapRes!19158 (and tp!37133 e!260338))))

(declare-fun mapKey!19158 () (_ BitVec 32))

(declare-fun mapRest!19158 () (Array (_ BitVec 32) ValueCell!5501))

(declare-fun mapValue!19158 () ValueCell!5501)

(assert (=> mapNonEmpty!19158 (= (arr!13046 _values!549) (store mapRest!19158 mapKey!19158 mapValue!19158))))

(declare-fun b!442336 () Bool)

(declare-fun res!261996 () Bool)

(assert (=> b!442336 (=> (not res!261996) (not e!260339))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442336 (= res!261996 (validMask!0 mask!1025))))

(declare-fun b!442337 () Bool)

(declare-fun res!261993 () Bool)

(assert (=> b!442337 (=> (not res!261993) (not e!260339))))

(declare-fun arrayContainsKey!0 (array!27198 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!442337 (= res!261993 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40276 res!262000) b!442336))

(assert (= (and b!442336 res!261996) b!442333))

(assert (= (and b!442333 res!261990) b!442335))

(assert (= (and b!442335 res!261999) b!442331))

(assert (= (and b!442331 res!262001) b!442327))

(assert (= (and b!442327 res!261998) b!442323))

(assert (= (and b!442323 res!261995) b!442330))

(assert (= (and b!442330 res!261992) b!442337))

(assert (= (and b!442337 res!261993) b!442328))

(assert (= (and b!442328 res!261997) b!442332))

(assert (= (and b!442332 res!261994) b!442329))

(assert (= (and b!442329 res!261991) b!442325))

(assert (= (and b!442334 condMapEmpty!19158) mapIsEmpty!19158))

(assert (= (and b!442334 (not condMapEmpty!19158)) mapNonEmpty!19158))

(get-info :version)

(assert (= (and mapNonEmpty!19158 ((_ is ValueCellFull!5501) mapValue!19158)) b!442324))

(assert (= (and b!442334 ((_ is ValueCellFull!5501) mapDefault!19158)) b!442326))

(assert (= start!40276 b!442334))

(declare-fun m!429267 () Bool)

(assert (=> mapNonEmpty!19158 m!429267))

(declare-fun m!429269 () Bool)

(assert (=> start!40276 m!429269))

(declare-fun m!429271 () Bool)

(assert (=> start!40276 m!429271))

(declare-fun m!429273 () Bool)

(assert (=> b!442337 m!429273))

(declare-fun m!429275 () Bool)

(assert (=> b!442332 m!429275))

(declare-fun m!429277 () Bool)

(assert (=> b!442325 m!429277))

(declare-fun m!429279 () Bool)

(assert (=> b!442325 m!429279))

(declare-fun m!429281 () Bool)

(assert (=> b!442325 m!429281))

(declare-fun m!429283 () Bool)

(assert (=> b!442328 m!429283))

(declare-fun m!429285 () Bool)

(assert (=> b!442328 m!429285))

(declare-fun m!429287 () Bool)

(assert (=> b!442331 m!429287))

(declare-fun m!429289 () Bool)

(assert (=> b!442336 m!429289))

(declare-fun m!429291 () Bool)

(assert (=> b!442335 m!429291))

(declare-fun m!429293 () Bool)

(assert (=> b!442323 m!429293))

(declare-fun m!429295 () Bool)

(assert (=> b!442330 m!429295))

(check-sat (not b!442337) (not mapNonEmpty!19158) (not b!442335) (not b!442332) (not b!442328) (not start!40276) (not b!442336) tp_is_empty!11689 (not b!442323) (not b!442325) (not b_next!10531) b_and!18529 (not b!442331))
(check-sat b_and!18529 (not b_next!10531))
