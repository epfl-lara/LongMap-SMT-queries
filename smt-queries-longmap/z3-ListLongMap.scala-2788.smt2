; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40602 () Bool)

(assert start!40602)

(declare-fun b_free!10627 () Bool)

(declare-fun b_next!10627 () Bool)

(assert (=> start!40602 (= b_free!10627 (not b_next!10627))))

(declare-fun tp!37700 () Bool)

(declare-fun b_and!18649 () Bool)

(assert (=> start!40602 (= tp!37700 b_and!18649)))

(declare-fun b!448228 () Bool)

(declare-fun res!266406 () Bool)

(declare-fun e!263034 () Bool)

(assert (=> b!448228 (=> (not res!266406) (not e!263034))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448228 (= res!266406 (bvsle from!863 i!563))))

(declare-fun b!448229 () Bool)

(declare-fun res!266402 () Bool)

(declare-fun e!263031 () Bool)

(assert (=> b!448229 (=> (not res!266402) (not e!263031))))

(declare-datatypes ((array!27734 0))(
  ( (array!27735 (arr!13312 (Array (_ BitVec 32) (_ BitVec 64))) (size!13664 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27734)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27734 (_ BitVec 32)) Bool)

(assert (=> b!448229 (= res!266402 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448231 () Bool)

(declare-fun e!263030 () Bool)

(declare-fun tp_is_empty!11965 () Bool)

(assert (=> b!448231 (= e!263030 tp_is_empty!11965)))

(declare-fun b!448232 () Bool)

(assert (=> b!448232 (= e!263031 e!263034)))

(declare-fun res!266401 () Bool)

(assert (=> b!448232 (=> (not res!266401) (not e!263034))))

(declare-fun lt!204152 () array!27734)

(assert (=> b!448232 (= res!266401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204152 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!448232 (= lt!204152 (array!27735 (store (arr!13312 _keys!709) i!563 k0!794) (size!13664 _keys!709)))))

(declare-fun b!448233 () Bool)

(declare-fun res!266410 () Bool)

(assert (=> b!448233 (=> (not res!266410) (not e!263031))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448233 (= res!266410 (validMask!0 mask!1025))))

(declare-fun b!448234 () Bool)

(declare-fun res!266404 () Bool)

(assert (=> b!448234 (=> (not res!266404) (not e!263031))))

(declare-fun arrayContainsKey!0 (array!27734 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448234 (= res!266404 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!19581 () Bool)

(declare-fun mapRes!19581 () Bool)

(declare-fun tp!37701 () Bool)

(assert (=> mapNonEmpty!19581 (= mapRes!19581 (and tp!37701 e!263030))))

(declare-datatypes ((V!17059 0))(
  ( (V!17060 (val!6027 Int)) )
))
(declare-datatypes ((ValueCell!5639 0))(
  ( (ValueCellFull!5639 (v!8283 V!17059)) (EmptyCell!5639) )
))
(declare-datatypes ((array!27736 0))(
  ( (array!27737 (arr!13313 (Array (_ BitVec 32) ValueCell!5639)) (size!13665 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27736)

(declare-fun mapRest!19581 () (Array (_ BitVec 32) ValueCell!5639))

(declare-fun mapValue!19581 () ValueCell!5639)

(declare-fun mapKey!19581 () (_ BitVec 32))

(assert (=> mapNonEmpty!19581 (= (arr!13313 _values!549) (store mapRest!19581 mapKey!19581 mapValue!19581))))

(declare-fun b!448235 () Bool)

(declare-fun res!266405 () Bool)

(assert (=> b!448235 (=> (not res!266405) (not e!263031))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!448235 (= res!266405 (and (= (size!13665 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13664 _keys!709) (size!13665 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!448236 () Bool)

(declare-fun e!263032 () Bool)

(declare-fun e!263033 () Bool)

(assert (=> b!448236 (= e!263032 (and e!263033 mapRes!19581))))

(declare-fun condMapEmpty!19581 () Bool)

(declare-fun mapDefault!19581 () ValueCell!5639)

(assert (=> b!448236 (= condMapEmpty!19581 (= (arr!13313 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5639)) mapDefault!19581)))))

(declare-fun b!448237 () Bool)

(assert (=> b!448237 (= e!263033 tp_is_empty!11965)))

(declare-fun mapIsEmpty!19581 () Bool)

(assert (=> mapIsEmpty!19581 mapRes!19581))

(declare-fun b!448238 () Bool)

(declare-fun res!266411 () Bool)

(assert (=> b!448238 (=> (not res!266411) (not e!263031))))

(assert (=> b!448238 (= res!266411 (or (= (select (arr!13312 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13312 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448239 () Bool)

(declare-fun res!266408 () Bool)

(assert (=> b!448239 (=> (not res!266408) (not e!263031))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448239 (= res!266408 (validKeyInArray!0 k0!794))))

(declare-fun b!448240 () Bool)

(declare-fun res!266412 () Bool)

(assert (=> b!448240 (=> (not res!266412) (not e!263031))))

(assert (=> b!448240 (= res!266412 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13664 _keys!709))))))

(declare-fun b!448230 () Bool)

(assert (=> b!448230 (= e!263034 false)))

(declare-fun minValue!515 () V!17059)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17059)

(declare-datatypes ((tuple2!7812 0))(
  ( (tuple2!7813 (_1!3917 (_ BitVec 64)) (_2!3917 V!17059)) )
))
(declare-datatypes ((List!7884 0))(
  ( (Nil!7881) (Cons!7880 (h!8736 tuple2!7812) (t!13638 List!7884)) )
))
(declare-datatypes ((ListLongMap!6727 0))(
  ( (ListLongMap!6728 (toList!3379 List!7884)) )
))
(declare-fun lt!204154 () ListLongMap!6727)

(declare-fun v!412 () V!17059)

(declare-fun getCurrentListMapNoExtraKeys!1609 (array!27734 array!27736 (_ BitVec 32) (_ BitVec 32) V!17059 V!17059 (_ BitVec 32) Int) ListLongMap!6727)

(assert (=> b!448230 (= lt!204154 (getCurrentListMapNoExtraKeys!1609 lt!204152 (array!27737 (store (arr!13313 _values!549) i!563 (ValueCellFull!5639 v!412)) (size!13665 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204153 () ListLongMap!6727)

(assert (=> b!448230 (= lt!204153 (getCurrentListMapNoExtraKeys!1609 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!266403 () Bool)

(assert (=> start!40602 (=> (not res!266403) (not e!263031))))

(assert (=> start!40602 (= res!266403 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13664 _keys!709))))))

(assert (=> start!40602 e!263031))

(assert (=> start!40602 tp_is_empty!11965))

(assert (=> start!40602 tp!37700))

(assert (=> start!40602 true))

(declare-fun array_inv!9724 (array!27736) Bool)

(assert (=> start!40602 (and (array_inv!9724 _values!549) e!263032)))

(declare-fun array_inv!9725 (array!27734) Bool)

(assert (=> start!40602 (array_inv!9725 _keys!709)))

(declare-fun b!448241 () Bool)

(declare-fun res!266409 () Bool)

(assert (=> b!448241 (=> (not res!266409) (not e!263034))))

(declare-datatypes ((List!7885 0))(
  ( (Nil!7882) (Cons!7881 (h!8737 (_ BitVec 64)) (t!13639 List!7885)) )
))
(declare-fun arrayNoDuplicates!0 (array!27734 (_ BitVec 32) List!7885) Bool)

(assert (=> b!448241 (= res!266409 (arrayNoDuplicates!0 lt!204152 #b00000000000000000000000000000000 Nil!7882))))

(declare-fun b!448242 () Bool)

(declare-fun res!266407 () Bool)

(assert (=> b!448242 (=> (not res!266407) (not e!263031))))

(assert (=> b!448242 (= res!266407 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7882))))

(assert (= (and start!40602 res!266403) b!448233))

(assert (= (and b!448233 res!266410) b!448235))

(assert (= (and b!448235 res!266405) b!448229))

(assert (= (and b!448229 res!266402) b!448242))

(assert (= (and b!448242 res!266407) b!448240))

(assert (= (and b!448240 res!266412) b!448239))

(assert (= (and b!448239 res!266408) b!448238))

(assert (= (and b!448238 res!266411) b!448234))

(assert (= (and b!448234 res!266404) b!448232))

(assert (= (and b!448232 res!266401) b!448241))

(assert (= (and b!448241 res!266409) b!448228))

(assert (= (and b!448228 res!266406) b!448230))

(assert (= (and b!448236 condMapEmpty!19581) mapIsEmpty!19581))

(assert (= (and b!448236 (not condMapEmpty!19581)) mapNonEmpty!19581))

(get-info :version)

(assert (= (and mapNonEmpty!19581 ((_ is ValueCellFull!5639) mapValue!19581)) b!448231))

(assert (= (and b!448236 ((_ is ValueCellFull!5639) mapDefault!19581)) b!448237))

(assert (= start!40602 b!448236))

(declare-fun m!433101 () Bool)

(assert (=> b!448229 m!433101))

(declare-fun m!433103 () Bool)

(assert (=> b!448238 m!433103))

(declare-fun m!433105 () Bool)

(assert (=> b!448234 m!433105))

(declare-fun m!433107 () Bool)

(assert (=> b!448230 m!433107))

(declare-fun m!433109 () Bool)

(assert (=> b!448230 m!433109))

(declare-fun m!433111 () Bool)

(assert (=> b!448230 m!433111))

(declare-fun m!433113 () Bool)

(assert (=> b!448241 m!433113))

(declare-fun m!433115 () Bool)

(assert (=> b!448233 m!433115))

(declare-fun m!433117 () Bool)

(assert (=> mapNonEmpty!19581 m!433117))

(declare-fun m!433119 () Bool)

(assert (=> start!40602 m!433119))

(declare-fun m!433121 () Bool)

(assert (=> start!40602 m!433121))

(declare-fun m!433123 () Bool)

(assert (=> b!448242 m!433123))

(declare-fun m!433125 () Bool)

(assert (=> b!448239 m!433125))

(declare-fun m!433127 () Bool)

(assert (=> b!448232 m!433127))

(declare-fun m!433129 () Bool)

(assert (=> b!448232 m!433129))

(check-sat (not b_next!10627) tp_is_empty!11965 (not b!448233) (not b!448230) (not b!448242) (not b!448232) (not b!448229) (not start!40602) (not mapNonEmpty!19581) b_and!18649 (not b!448234) (not b!448239) (not b!448241))
(check-sat b_and!18649 (not b_next!10627))
