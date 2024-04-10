; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38000 () Bool)

(assert start!38000)

(declare-fun b_free!8969 () Bool)

(declare-fun b_next!8969 () Bool)

(assert (=> start!38000 (= b_free!8969 (not b_next!8969))))

(declare-fun tp!31676 () Bool)

(declare-fun b_and!16283 () Bool)

(assert (=> start!38000 (= tp!31676 b_and!16283)))

(declare-fun b!390998 () Bool)

(declare-fun e!236835 () Bool)

(declare-fun tp_is_empty!9641 () Bool)

(assert (=> b!390998 (= e!236835 tp_is_empty!9641)))

(declare-fun b!390999 () Bool)

(declare-fun res!223773 () Bool)

(declare-fun e!236834 () Bool)

(assert (=> b!390999 (=> (not res!223773) (not e!236834))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390999 (= res!223773 (validKeyInArray!0 k!778))))

(declare-fun b!391000 () Bool)

(declare-fun res!223766 () Bool)

(assert (=> b!391000 (=> (not res!223766) (not e!236834))))

(declare-datatypes ((array!23183 0))(
  ( (array!23184 (arr!11054 (Array (_ BitVec 32) (_ BitVec 64))) (size!11406 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23183)

(declare-datatypes ((List!6405 0))(
  ( (Nil!6402) (Cons!6401 (h!7257 (_ BitVec 64)) (t!11567 List!6405)) )
))
(declare-fun arrayNoDuplicates!0 (array!23183 (_ BitVec 32) List!6405) Bool)

(assert (=> b!391000 (= res!223766 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6402))))

(declare-fun res!223763 () Bool)

(assert (=> start!38000 (=> (not res!223763) (not e!236834))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38000 (= res!223763 (validMask!0 mask!970))))

(assert (=> start!38000 e!236834))

(declare-datatypes ((V!13959 0))(
  ( (V!13960 (val!4865 Int)) )
))
(declare-datatypes ((ValueCell!4477 0))(
  ( (ValueCellFull!4477 (v!7086 V!13959)) (EmptyCell!4477) )
))
(declare-datatypes ((array!23185 0))(
  ( (array!23186 (arr!11055 (Array (_ BitVec 32) ValueCell!4477)) (size!11407 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23185)

(declare-fun e!236839 () Bool)

(declare-fun array_inv!8120 (array!23185) Bool)

(assert (=> start!38000 (and (array_inv!8120 _values!506) e!236839)))

(assert (=> start!38000 tp!31676))

(assert (=> start!38000 true))

(assert (=> start!38000 tp_is_empty!9641))

(declare-fun array_inv!8121 (array!23183) Bool)

(assert (=> start!38000 (array_inv!8121 _keys!658)))

(declare-fun b!391001 () Bool)

(declare-fun e!236838 () Bool)

(declare-fun e!236841 () Bool)

(assert (=> b!391001 (= e!236838 (not e!236841))))

(declare-fun res!223767 () Bool)

(assert (=> b!391001 (=> res!223767 e!236841)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!391001 (= res!223767 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6550 0))(
  ( (tuple2!6551 (_1!3286 (_ BitVec 64)) (_2!3286 V!13959)) )
))
(declare-datatypes ((List!6406 0))(
  ( (Nil!6403) (Cons!6402 (h!7258 tuple2!6550) (t!11568 List!6406)) )
))
(declare-datatypes ((ListLongMap!5463 0))(
  ( (ListLongMap!5464 (toList!2747 List!6406)) )
))
(declare-fun lt!184401 () ListLongMap!5463)

(declare-fun zeroValue!472 () V!13959)

(declare-fun minValue!472 () V!13959)

(declare-fun getCurrentListMap!2092 (array!23183 array!23185 (_ BitVec 32) (_ BitVec 32) V!13959 V!13959 (_ BitVec 32) Int) ListLongMap!5463)

(assert (=> b!391001 (= lt!184401 (getCurrentListMap!2092 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184405 () array!23185)

(declare-fun lt!184402 () array!23183)

(declare-fun lt!184398 () ListLongMap!5463)

(assert (=> b!391001 (= lt!184398 (getCurrentListMap!2092 lt!184402 lt!184405 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184404 () ListLongMap!5463)

(declare-fun lt!184399 () ListLongMap!5463)

(assert (=> b!391001 (and (= lt!184404 lt!184399) (= lt!184399 lt!184404))))

(declare-fun lt!184397 () ListLongMap!5463)

(declare-fun v!373 () V!13959)

(declare-fun +!1042 (ListLongMap!5463 tuple2!6550) ListLongMap!5463)

(assert (=> b!391001 (= lt!184399 (+!1042 lt!184397 (tuple2!6551 k!778 v!373)))))

(declare-datatypes ((Unit!11966 0))(
  ( (Unit!11967) )
))
(declare-fun lt!184403 () Unit!11966)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!256 (array!23183 array!23185 (_ BitVec 32) (_ BitVec 32) V!13959 V!13959 (_ BitVec 32) (_ BitVec 64) V!13959 (_ BitVec 32) Int) Unit!11966)

(assert (=> b!391001 (= lt!184403 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!256 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!972 (array!23183 array!23185 (_ BitVec 32) (_ BitVec 32) V!13959 V!13959 (_ BitVec 32) Int) ListLongMap!5463)

(assert (=> b!391001 (= lt!184404 (getCurrentListMapNoExtraKeys!972 lt!184402 lt!184405 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391001 (= lt!184405 (array!23186 (store (arr!11055 _values!506) i!548 (ValueCellFull!4477 v!373)) (size!11407 _values!506)))))

(assert (=> b!391001 (= lt!184397 (getCurrentListMapNoExtraKeys!972 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391002 () Bool)

(declare-fun e!236836 () Bool)

(assert (=> b!391002 (= e!236836 tp_is_empty!9641)))

(declare-fun b!391003 () Bool)

(declare-fun lt!184400 () tuple2!6550)

(assert (=> b!391003 (= e!236841 (= lt!184398 (+!1042 lt!184399 lt!184400)))))

(declare-fun e!236837 () Bool)

(assert (=> b!391003 e!236837))

(declare-fun res!223764 () Bool)

(assert (=> b!391003 (=> (not res!223764) (not e!236837))))

(assert (=> b!391003 (= res!223764 (= lt!184398 (+!1042 lt!184404 lt!184400)))))

(assert (=> b!391003 (= lt!184400 (tuple2!6551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapNonEmpty!16044 () Bool)

(declare-fun mapRes!16044 () Bool)

(declare-fun tp!31677 () Bool)

(assert (=> mapNonEmpty!16044 (= mapRes!16044 (and tp!31677 e!236835))))

(declare-fun mapKey!16044 () (_ BitVec 32))

(declare-fun mapValue!16044 () ValueCell!4477)

(declare-fun mapRest!16044 () (Array (_ BitVec 32) ValueCell!4477))

(assert (=> mapNonEmpty!16044 (= (arr!11055 _values!506) (store mapRest!16044 mapKey!16044 mapValue!16044))))

(declare-fun b!391004 () Bool)

(assert (=> b!391004 (= e!236837 (= lt!184401 (+!1042 lt!184397 lt!184400)))))

(declare-fun b!391005 () Bool)

(declare-fun res!223771 () Bool)

(assert (=> b!391005 (=> (not res!223771) (not e!236834))))

(assert (=> b!391005 (= res!223771 (and (= (size!11407 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11406 _keys!658) (size!11407 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391006 () Bool)

(declare-fun res!223774 () Bool)

(assert (=> b!391006 (=> (not res!223774) (not e!236834))))

(assert (=> b!391006 (= res!223774 (or (= (select (arr!11054 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11054 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391007 () Bool)

(assert (=> b!391007 (= e!236834 e!236838)))

(declare-fun res!223765 () Bool)

(assert (=> b!391007 (=> (not res!223765) (not e!236838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23183 (_ BitVec 32)) Bool)

(assert (=> b!391007 (= res!223765 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184402 mask!970))))

(assert (=> b!391007 (= lt!184402 (array!23184 (store (arr!11054 _keys!658) i!548 k!778) (size!11406 _keys!658)))))

(declare-fun mapIsEmpty!16044 () Bool)

(assert (=> mapIsEmpty!16044 mapRes!16044))

(declare-fun b!391008 () Bool)

(declare-fun res!223769 () Bool)

(assert (=> b!391008 (=> (not res!223769) (not e!236834))))

(declare-fun arrayContainsKey!0 (array!23183 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391008 (= res!223769 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!391009 () Bool)

(assert (=> b!391009 (= e!236839 (and e!236836 mapRes!16044))))

(declare-fun condMapEmpty!16044 () Bool)

(declare-fun mapDefault!16044 () ValueCell!4477)

