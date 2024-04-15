; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38028 () Bool)

(assert start!38028)

(declare-fun b_free!8989 () Bool)

(declare-fun b_next!8989 () Bool)

(assert (=> start!38028 (= b_free!8989 (not b_next!8989))))

(declare-fun tp!31739 () Bool)

(declare-fun b_and!16289 () Bool)

(assert (=> start!38028 (= tp!31739 b_and!16289)))

(declare-fun b!391391 () Bool)

(declare-fun res!224106 () Bool)

(declare-fun e!237035 () Bool)

(assert (=> b!391391 (=> (not res!224106) (not e!237035))))

(declare-datatypes ((array!23209 0))(
  ( (array!23210 (arr!11066 (Array (_ BitVec 32) (_ BitVec 64))) (size!11419 (_ BitVec 32))) )
))
(declare-fun lt!184672 () array!23209)

(declare-datatypes ((List!6383 0))(
  ( (Nil!6380) (Cons!6379 (h!7235 (_ BitVec 64)) (t!11538 List!6383)) )
))
(declare-fun arrayNoDuplicates!0 (array!23209 (_ BitVec 32) List!6383) Bool)

(assert (=> b!391391 (= res!224106 (arrayNoDuplicates!0 lt!184672 #b00000000000000000000000000000000 Nil!6380))))

(declare-fun b!391392 () Bool)

(declare-fun res!224100 () Bool)

(declare-fun e!237032 () Bool)

(assert (=> b!391392 (=> (not res!224100) (not e!237032))))

(declare-fun _keys!658 () array!23209)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23209 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391392 (= res!224100 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391393 () Bool)

(declare-fun res!224104 () Bool)

(assert (=> b!391393 (=> (not res!224104) (not e!237032))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!391393 (= res!224104 (or (= (select (arr!11066 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11066 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391394 () Bool)

(declare-fun res!224097 () Bool)

(assert (=> b!391394 (=> (not res!224097) (not e!237032))))

(assert (=> b!391394 (= res!224097 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11419 _keys!658))))))

(declare-fun b!391395 () Bool)

(declare-fun res!224099 () Bool)

(assert (=> b!391395 (=> (not res!224099) (not e!237032))))

(assert (=> b!391395 (= res!224099 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6380))))

(declare-fun b!391396 () Bool)

(declare-fun e!237039 () Bool)

(declare-fun e!237033 () Bool)

(assert (=> b!391396 (= e!237039 e!237033)))

(declare-fun res!224103 () Bool)

(assert (=> b!391396 (=> res!224103 e!237033)))

(assert (=> b!391396 (= res!224103 (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!13987 0))(
  ( (V!13988 (val!4875 Int)) )
))
(declare-datatypes ((tuple2!6540 0))(
  ( (tuple2!6541 (_1!3281 (_ BitVec 64)) (_2!3281 V!13987)) )
))
(declare-datatypes ((List!6384 0))(
  ( (Nil!6381) (Cons!6380 (h!7236 tuple2!6540) (t!11539 List!6384)) )
))
(declare-datatypes ((ListLongMap!5443 0))(
  ( (ListLongMap!5444 (toList!2737 List!6384)) )
))
(declare-fun lt!184668 () ListLongMap!5443)

(declare-fun lt!184670 () ListLongMap!5443)

(assert (=> b!391396 (= lt!184668 lt!184670)))

(declare-fun lt!184679 () ListLongMap!5443)

(declare-fun lt!184680 () tuple2!6540)

(declare-fun +!1057 (ListLongMap!5443 tuple2!6540) ListLongMap!5443)

(assert (=> b!391396 (= lt!184670 (+!1057 lt!184679 lt!184680))))

(declare-fun lt!184674 () ListLongMap!5443)

(declare-fun lt!184671 () ListLongMap!5443)

(assert (=> b!391396 (= lt!184674 lt!184671)))

(declare-fun lt!184676 () ListLongMap!5443)

(assert (=> b!391396 (= lt!184671 (+!1057 lt!184676 lt!184680))))

(declare-fun lt!184677 () ListLongMap!5443)

(assert (=> b!391396 (= lt!184668 (+!1057 lt!184677 lt!184680))))

(declare-fun zeroValue!472 () V!13987)

(assert (=> b!391396 (= lt!184680 (tuple2!6541 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391397 () Bool)

(declare-fun e!237037 () Bool)

(declare-fun tp_is_empty!9661 () Bool)

(assert (=> b!391397 (= e!237037 tp_is_empty!9661)))

(declare-fun b!391398 () Bool)

(declare-fun e!237036 () Bool)

(declare-fun mapRes!16077 () Bool)

(assert (=> b!391398 (= e!237036 (and e!237037 mapRes!16077))))

(declare-fun condMapEmpty!16077 () Bool)

(declare-datatypes ((ValueCell!4487 0))(
  ( (ValueCellFull!4487 (v!7094 V!13987)) (EmptyCell!4487) )
))
(declare-datatypes ((array!23211 0))(
  ( (array!23212 (arr!11067 (Array (_ BitVec 32) ValueCell!4487)) (size!11420 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23211)

(declare-fun mapDefault!16077 () ValueCell!4487)

(assert (=> b!391398 (= condMapEmpty!16077 (= (arr!11067 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4487)) mapDefault!16077)))))

(declare-fun b!391399 () Bool)

(declare-fun res!224101 () Bool)

(assert (=> b!391399 (=> (not res!224101) (not e!237032))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23209 (_ BitVec 32)) Bool)

(assert (=> b!391399 (= res!224101 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!224096 () Bool)

(assert (=> start!38028 (=> (not res!224096) (not e!237032))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38028 (= res!224096 (validMask!0 mask!970))))

(assert (=> start!38028 e!237032))

(declare-fun array_inv!8124 (array!23211) Bool)

(assert (=> start!38028 (and (array_inv!8124 _values!506) e!237036)))

(assert (=> start!38028 tp!31739))

(assert (=> start!38028 true))

(assert (=> start!38028 tp_is_empty!9661))

(declare-fun array_inv!8125 (array!23209) Bool)

(assert (=> start!38028 (array_inv!8125 _keys!658)))

(declare-fun mapIsEmpty!16077 () Bool)

(assert (=> mapIsEmpty!16077 mapRes!16077))

(declare-fun b!391400 () Bool)

(declare-fun lt!184675 () tuple2!6540)

(assert (=> b!391400 (= e!237033 (= (+!1057 lt!184674 lt!184675) lt!184668))))

(assert (=> b!391400 (= lt!184670 (+!1057 lt!184671 lt!184675))))

(declare-fun v!373 () V!13987)

(declare-datatypes ((Unit!11962 0))(
  ( (Unit!11963) )
))
(declare-fun lt!184673 () Unit!11962)

(declare-fun addCommutativeForDiffKeys!337 (ListLongMap!5443 (_ BitVec 64) V!13987 (_ BitVec 64) V!13987) Unit!11962)

(assert (=> b!391400 (= lt!184673 (addCommutativeForDiffKeys!337 lt!184676 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!391401 () Bool)

(declare-fun res!224102 () Bool)

(assert (=> b!391401 (=> (not res!224102) (not e!237032))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391401 (= res!224102 (and (= (size!11420 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11419 _keys!658) (size!11420 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391402 () Bool)

(declare-fun e!237038 () Bool)

(assert (=> b!391402 (= e!237038 tp_is_empty!9661)))

(declare-fun b!391403 () Bool)

(assert (=> b!391403 (= e!237035 (not e!237039))))

(declare-fun res!224107 () Bool)

(assert (=> b!391403 (=> res!224107 e!237039)))

(assert (=> b!391403 (= res!224107 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13987)

(declare-fun getCurrentListMap!2059 (array!23209 array!23211 (_ BitVec 32) (_ BitVec 32) V!13987 V!13987 (_ BitVec 32) Int) ListLongMap!5443)

(assert (=> b!391403 (= lt!184674 (getCurrentListMap!2059 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184669 () array!23211)

(assert (=> b!391403 (= lt!184668 (getCurrentListMap!2059 lt!184672 lt!184669 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391403 (and (= lt!184677 lt!184679) (= lt!184679 lt!184677))))

(assert (=> b!391403 (= lt!184679 (+!1057 lt!184676 lt!184675))))

(assert (=> b!391403 (= lt!184675 (tuple2!6541 k0!778 v!373))))

(declare-fun lt!184678 () Unit!11962)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!260 (array!23209 array!23211 (_ BitVec 32) (_ BitVec 32) V!13987 V!13987 (_ BitVec 32) (_ BitVec 64) V!13987 (_ BitVec 32) Int) Unit!11962)

(assert (=> b!391403 (= lt!184678 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!260 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!969 (array!23209 array!23211 (_ BitVec 32) (_ BitVec 32) V!13987 V!13987 (_ BitVec 32) Int) ListLongMap!5443)

(assert (=> b!391403 (= lt!184677 (getCurrentListMapNoExtraKeys!969 lt!184672 lt!184669 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391403 (= lt!184669 (array!23212 (store (arr!11067 _values!506) i!548 (ValueCellFull!4487 v!373)) (size!11420 _values!506)))))

(assert (=> b!391403 (= lt!184676 (getCurrentListMapNoExtraKeys!969 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391404 () Bool)

(assert (=> b!391404 (= e!237032 e!237035)))

(declare-fun res!224098 () Bool)

(assert (=> b!391404 (=> (not res!224098) (not e!237035))))

(assert (=> b!391404 (= res!224098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184672 mask!970))))

(assert (=> b!391404 (= lt!184672 (array!23210 (store (arr!11066 _keys!658) i!548 k0!778) (size!11419 _keys!658)))))

(declare-fun b!391405 () Bool)

(declare-fun res!224105 () Bool)

(assert (=> b!391405 (=> (not res!224105) (not e!237032))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391405 (= res!224105 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!16077 () Bool)

(declare-fun tp!31740 () Bool)

(assert (=> mapNonEmpty!16077 (= mapRes!16077 (and tp!31740 e!237038))))

(declare-fun mapValue!16077 () ValueCell!4487)

(declare-fun mapKey!16077 () (_ BitVec 32))

(declare-fun mapRest!16077 () (Array (_ BitVec 32) ValueCell!4487))

(assert (=> mapNonEmpty!16077 (= (arr!11067 _values!506) (store mapRest!16077 mapKey!16077 mapValue!16077))))

(assert (= (and start!38028 res!224096) b!391401))

(assert (= (and b!391401 res!224102) b!391399))

(assert (= (and b!391399 res!224101) b!391395))

(assert (= (and b!391395 res!224099) b!391394))

(assert (= (and b!391394 res!224097) b!391405))

(assert (= (and b!391405 res!224105) b!391393))

(assert (= (and b!391393 res!224104) b!391392))

(assert (= (and b!391392 res!224100) b!391404))

(assert (= (and b!391404 res!224098) b!391391))

(assert (= (and b!391391 res!224106) b!391403))

(assert (= (and b!391403 (not res!224107)) b!391396))

(assert (= (and b!391396 (not res!224103)) b!391400))

(assert (= (and b!391398 condMapEmpty!16077) mapIsEmpty!16077))

(assert (= (and b!391398 (not condMapEmpty!16077)) mapNonEmpty!16077))

(get-info :version)

(assert (= (and mapNonEmpty!16077 ((_ is ValueCellFull!4487) mapValue!16077)) b!391402))

(assert (= (and b!391398 ((_ is ValueCellFull!4487) mapDefault!16077)) b!391397))

(assert (= start!38028 b!391398))

(declare-fun m!387319 () Bool)

(assert (=> b!391403 m!387319))

(declare-fun m!387321 () Bool)

(assert (=> b!391403 m!387321))

(declare-fun m!387323 () Bool)

(assert (=> b!391403 m!387323))

(declare-fun m!387325 () Bool)

(assert (=> b!391403 m!387325))

(declare-fun m!387327 () Bool)

(assert (=> b!391403 m!387327))

(declare-fun m!387329 () Bool)

(assert (=> b!391403 m!387329))

(declare-fun m!387331 () Bool)

(assert (=> b!391403 m!387331))

(declare-fun m!387333 () Bool)

(assert (=> b!391396 m!387333))

(declare-fun m!387335 () Bool)

(assert (=> b!391396 m!387335))

(declare-fun m!387337 () Bool)

(assert (=> b!391396 m!387337))

(declare-fun m!387339 () Bool)

(assert (=> b!391392 m!387339))

(declare-fun m!387341 () Bool)

(assert (=> b!391404 m!387341))

(declare-fun m!387343 () Bool)

(assert (=> b!391404 m!387343))

(declare-fun m!387345 () Bool)

(assert (=> b!391405 m!387345))

(declare-fun m!387347 () Bool)

(assert (=> b!391393 m!387347))

(declare-fun m!387349 () Bool)

(assert (=> b!391391 m!387349))

(declare-fun m!387351 () Bool)

(assert (=> start!38028 m!387351))

(declare-fun m!387353 () Bool)

(assert (=> start!38028 m!387353))

(declare-fun m!387355 () Bool)

(assert (=> start!38028 m!387355))

(declare-fun m!387357 () Bool)

(assert (=> mapNonEmpty!16077 m!387357))

(declare-fun m!387359 () Bool)

(assert (=> b!391399 m!387359))

(declare-fun m!387361 () Bool)

(assert (=> b!391400 m!387361))

(declare-fun m!387363 () Bool)

(assert (=> b!391400 m!387363))

(declare-fun m!387365 () Bool)

(assert (=> b!391400 m!387365))

(declare-fun m!387367 () Bool)

(assert (=> b!391395 m!387367))

(check-sat (not start!38028) (not b!391391) (not b!391400) (not b!391399) (not b!391392) (not b!391396) (not mapNonEmpty!16077) (not b!391405) (not b!391395) b_and!16289 (not b_next!8989) (not b!391404) (not b!391403) tp_is_empty!9661)
(check-sat b_and!16289 (not b_next!8989))
