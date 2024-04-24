; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39674 () Bool)

(assert start!39674)

(declare-fun b_free!9955 () Bool)

(declare-fun b_next!9955 () Bool)

(assert (=> start!39674 (= b_free!9955 (not b_next!9955))))

(declare-fun tp!35393 () Bool)

(declare-fun b_and!17625 () Bool)

(assert (=> start!39674 (= tp!35393 b_and!17625)))

(declare-fun b!426286 () Bool)

(declare-fun res!249810 () Bool)

(declare-fun e!252927 () Bool)

(assert (=> b!426286 (=> (not res!249810) (not e!252927))))

(declare-datatypes ((array!26060 0))(
  ( (array!26061 (arr!12479 (Array (_ BitVec 32) (_ BitVec 64))) (size!12831 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26060)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426286 (= res!249810 (or (= (select (arr!12479 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12479 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426287 () Bool)

(declare-fun e!252928 () Bool)

(declare-fun tp_is_empty!11107 () Bool)

(assert (=> b!426287 (= e!252928 tp_is_empty!11107)))

(declare-fun b!426288 () Bool)

(declare-fun e!252926 () Bool)

(declare-fun mapRes!18282 () Bool)

(assert (=> b!426288 (= e!252926 (and e!252928 mapRes!18282))))

(declare-fun condMapEmpty!18282 () Bool)

(declare-datatypes ((V!15915 0))(
  ( (V!15916 (val!5598 Int)) )
))
(declare-datatypes ((ValueCell!5210 0))(
  ( (ValueCellFull!5210 (v!7846 V!15915)) (EmptyCell!5210) )
))
(declare-datatypes ((array!26062 0))(
  ( (array!26063 (arr!12480 (Array (_ BitVec 32) ValueCell!5210)) (size!12832 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26062)

(declare-fun mapDefault!18282 () ValueCell!5210)

(assert (=> b!426288 (= condMapEmpty!18282 (= (arr!12480 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5210)) mapDefault!18282)))))

(declare-fun b!426289 () Bool)

(declare-fun res!249817 () Bool)

(assert (=> b!426289 (=> (not res!249817) (not e!252927))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26060 (_ BitVec 32)) Bool)

(assert (=> b!426289 (= res!249817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!426290 () Bool)

(declare-fun res!249813 () Bool)

(declare-fun e!252924 () Bool)

(assert (=> b!426290 (=> (not res!249813) (not e!252924))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!426290 (= res!249813 (bvsle from!863 i!563))))

(declare-fun b!426291 () Bool)

(declare-fun res!249820 () Bool)

(assert (=> b!426291 (=> (not res!249820) (not e!252924))))

(declare-fun lt!194948 () array!26060)

(declare-datatypes ((List!7261 0))(
  ( (Nil!7258) (Cons!7257 (h!8113 (_ BitVec 64)) (t!12697 List!7261)) )
))
(declare-fun arrayNoDuplicates!0 (array!26060 (_ BitVec 32) List!7261) Bool)

(assert (=> b!426291 (= res!249820 (arrayNoDuplicates!0 lt!194948 #b00000000000000000000000000000000 Nil!7258))))

(declare-fun b!426292 () Bool)

(declare-fun e!252922 () Bool)

(assert (=> b!426292 (= e!252924 e!252922)))

(declare-fun res!249811 () Bool)

(assert (=> b!426292 (=> (not res!249811) (not e!252922))))

(assert (=> b!426292 (= res!249811 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15915)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15915)

(declare-fun lt!194950 () array!26062)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7254 0))(
  ( (tuple2!7255 (_1!3638 (_ BitVec 64)) (_2!3638 V!15915)) )
))
(declare-datatypes ((List!7262 0))(
  ( (Nil!7259) (Cons!7258 (h!8114 tuple2!7254) (t!12698 List!7262)) )
))
(declare-datatypes ((ListLongMap!6169 0))(
  ( (ListLongMap!6170 (toList!3100 List!7262)) )
))
(declare-fun lt!194952 () ListLongMap!6169)

(declare-fun getCurrentListMapNoExtraKeys!1346 (array!26060 array!26062 (_ BitVec 32) (_ BitVec 32) V!15915 V!15915 (_ BitVec 32) Int) ListLongMap!6169)

(assert (=> b!426292 (= lt!194952 (getCurrentListMapNoExtraKeys!1346 lt!194948 lt!194950 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15915)

(assert (=> b!426292 (= lt!194950 (array!26063 (store (arr!12480 _values!549) i!563 (ValueCellFull!5210 v!412)) (size!12832 _values!549)))))

(declare-fun lt!194951 () ListLongMap!6169)

(assert (=> b!426292 (= lt!194951 (getCurrentListMapNoExtraKeys!1346 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!249814 () Bool)

(assert (=> start!39674 (=> (not res!249814) (not e!252927))))

(assert (=> start!39674 (= res!249814 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12831 _keys!709))))))

(assert (=> start!39674 e!252927))

(assert (=> start!39674 tp_is_empty!11107))

(assert (=> start!39674 tp!35393))

(assert (=> start!39674 true))

(declare-fun array_inv!9164 (array!26062) Bool)

(assert (=> start!39674 (and (array_inv!9164 _values!549) e!252926)))

(declare-fun array_inv!9165 (array!26060) Bool)

(assert (=> start!39674 (array_inv!9165 _keys!709)))

(declare-fun mapNonEmpty!18282 () Bool)

(declare-fun tp!35394 () Bool)

(declare-fun e!252925 () Bool)

(assert (=> mapNonEmpty!18282 (= mapRes!18282 (and tp!35394 e!252925))))

(declare-fun mapRest!18282 () (Array (_ BitVec 32) ValueCell!5210))

(declare-fun mapKey!18282 () (_ BitVec 32))

(declare-fun mapValue!18282 () ValueCell!5210)

(assert (=> mapNonEmpty!18282 (= (arr!12480 _values!549) (store mapRest!18282 mapKey!18282 mapValue!18282))))

(declare-fun b!426293 () Bool)

(declare-fun res!249815 () Bool)

(assert (=> b!426293 (=> (not res!249815) (not e!252927))))

(assert (=> b!426293 (= res!249815 (and (= (size!12832 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12831 _keys!709) (size!12832 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426294 () Bool)

(declare-fun res!249819 () Bool)

(assert (=> b!426294 (=> (not res!249819) (not e!252927))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426294 (= res!249819 (validKeyInArray!0 k0!794))))

(declare-fun b!426295 () Bool)

(declare-fun res!249818 () Bool)

(assert (=> b!426295 (=> (not res!249818) (not e!252927))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426295 (= res!249818 (validMask!0 mask!1025))))

(declare-fun b!426296 () Bool)

(declare-fun res!249812 () Bool)

(assert (=> b!426296 (=> (not res!249812) (not e!252927))))

(declare-fun arrayContainsKey!0 (array!26060 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426296 (= res!249812 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426297 () Bool)

(assert (=> b!426297 (= e!252925 tp_is_empty!11107)))

(declare-fun b!426298 () Bool)

(declare-fun res!249821 () Bool)

(assert (=> b!426298 (=> (not res!249821) (not e!252927))))

(assert (=> b!426298 (= res!249821 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7258))))

(declare-fun b!426299 () Bool)

(assert (=> b!426299 (= e!252922 (not true))))

(declare-fun +!1314 (ListLongMap!6169 tuple2!7254) ListLongMap!6169)

(assert (=> b!426299 (= (getCurrentListMapNoExtraKeys!1346 lt!194948 lt!194950 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1314 (getCurrentListMapNoExtraKeys!1346 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7255 k0!794 v!412)))))

(declare-datatypes ((Unit!12503 0))(
  ( (Unit!12504) )
))
(declare-fun lt!194949 () Unit!12503)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!498 (array!26060 array!26062 (_ BitVec 32) (_ BitVec 32) V!15915 V!15915 (_ BitVec 32) (_ BitVec 64) V!15915 (_ BitVec 32) Int) Unit!12503)

(assert (=> b!426299 (= lt!194949 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!498 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426300 () Bool)

(assert (=> b!426300 (= e!252927 e!252924)))

(declare-fun res!249822 () Bool)

(assert (=> b!426300 (=> (not res!249822) (not e!252924))))

(assert (=> b!426300 (= res!249822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194948 mask!1025))))

(assert (=> b!426300 (= lt!194948 (array!26061 (store (arr!12479 _keys!709) i!563 k0!794) (size!12831 _keys!709)))))

(declare-fun b!426301 () Bool)

(declare-fun res!249816 () Bool)

(assert (=> b!426301 (=> (not res!249816) (not e!252927))))

(assert (=> b!426301 (= res!249816 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12831 _keys!709))))))

(declare-fun mapIsEmpty!18282 () Bool)

(assert (=> mapIsEmpty!18282 mapRes!18282))

(assert (= (and start!39674 res!249814) b!426295))

(assert (= (and b!426295 res!249818) b!426293))

(assert (= (and b!426293 res!249815) b!426289))

(assert (= (and b!426289 res!249817) b!426298))

(assert (= (and b!426298 res!249821) b!426301))

(assert (= (and b!426301 res!249816) b!426294))

(assert (= (and b!426294 res!249819) b!426286))

(assert (= (and b!426286 res!249810) b!426296))

(assert (= (and b!426296 res!249812) b!426300))

(assert (= (and b!426300 res!249822) b!426291))

(assert (= (and b!426291 res!249820) b!426290))

(assert (= (and b!426290 res!249813) b!426292))

(assert (= (and b!426292 res!249811) b!426299))

(assert (= (and b!426288 condMapEmpty!18282) mapIsEmpty!18282))

(assert (= (and b!426288 (not condMapEmpty!18282)) mapNonEmpty!18282))

(get-info :version)

(assert (= (and mapNonEmpty!18282 ((_ is ValueCellFull!5210) mapValue!18282)) b!426297))

(assert (= (and b!426288 ((_ is ValueCellFull!5210) mapDefault!18282)) b!426287))

(assert (= start!39674 b!426288))

(declare-fun m!415265 () Bool)

(assert (=> start!39674 m!415265))

(declare-fun m!415267 () Bool)

(assert (=> start!39674 m!415267))

(declare-fun m!415269 () Bool)

(assert (=> b!426292 m!415269))

(declare-fun m!415271 () Bool)

(assert (=> b!426292 m!415271))

(declare-fun m!415273 () Bool)

(assert (=> b!426292 m!415273))

(declare-fun m!415275 () Bool)

(assert (=> b!426294 m!415275))

(declare-fun m!415277 () Bool)

(assert (=> b!426286 m!415277))

(declare-fun m!415279 () Bool)

(assert (=> b!426300 m!415279))

(declare-fun m!415281 () Bool)

(assert (=> b!426300 m!415281))

(declare-fun m!415283 () Bool)

(assert (=> b!426295 m!415283))

(declare-fun m!415285 () Bool)

(assert (=> b!426289 m!415285))

(declare-fun m!415287 () Bool)

(assert (=> b!426299 m!415287))

(declare-fun m!415289 () Bool)

(assert (=> b!426299 m!415289))

(assert (=> b!426299 m!415289))

(declare-fun m!415291 () Bool)

(assert (=> b!426299 m!415291))

(declare-fun m!415293 () Bool)

(assert (=> b!426299 m!415293))

(declare-fun m!415295 () Bool)

(assert (=> b!426296 m!415295))

(declare-fun m!415297 () Bool)

(assert (=> mapNonEmpty!18282 m!415297))

(declare-fun m!415299 () Bool)

(assert (=> b!426298 m!415299))

(declare-fun m!415301 () Bool)

(assert (=> b!426291 m!415301))

(check-sat (not b_next!9955) (not start!39674) (not b!426289) (not b!426299) (not b!426291) (not b!426300) (not b!426298) (not mapNonEmpty!18282) b_and!17625 tp_is_empty!11107 (not b!426292) (not b!426295) (not b!426296) (not b!426294))
(check-sat b_and!17625 (not b_next!9955))
