; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40494 () Bool)

(assert start!40494)

(declare-fun b_free!10565 () Bool)

(declare-fun b_next!10565 () Bool)

(assert (=> start!40494 (= b_free!10565 (not b_next!10565))))

(declare-fun tp!37473 () Bool)

(declare-fun b_and!18549 () Bool)

(assert (=> start!40494 (= tp!37473 b_and!18549)))

(declare-fun res!264827 () Bool)

(declare-fun e!262129 () Bool)

(assert (=> start!40494 (=> (not res!264827) (not e!262129))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!27565 0))(
  ( (array!27566 (arr!13230 (Array (_ BitVec 32) (_ BitVec 64))) (size!13582 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27565)

(assert (=> start!40494 (= res!264827 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13582 _keys!709))))))

(assert (=> start!40494 e!262129))

(declare-fun tp_is_empty!11879 () Bool)

(assert (=> start!40494 tp_is_empty!11879))

(assert (=> start!40494 tp!37473))

(assert (=> start!40494 true))

(declare-datatypes ((V!16943 0))(
  ( (V!16944 (val!5984 Int)) )
))
(declare-datatypes ((ValueCell!5596 0))(
  ( (ValueCellFull!5596 (v!8235 V!16943)) (EmptyCell!5596) )
))
(declare-datatypes ((array!27567 0))(
  ( (array!27568 (arr!13231 (Array (_ BitVec 32) ValueCell!5596)) (size!13583 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27567)

(declare-fun e!262131 () Bool)

(declare-fun array_inv!9594 (array!27567) Bool)

(assert (=> start!40494 (and (array_inv!9594 _values!549) e!262131)))

(declare-fun array_inv!9595 (array!27565) Bool)

(assert (=> start!40494 (array_inv!9595 _keys!709)))

(declare-fun b!446164 () Bool)

(declare-fun res!264824 () Bool)

(assert (=> b!446164 (=> (not res!264824) (not e!262129))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27565 (_ BitVec 32)) Bool)

(assert (=> b!446164 (= res!264824 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!446165 () Bool)

(declare-fun res!264826 () Bool)

(assert (=> b!446165 (=> (not res!264826) (not e!262129))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!446165 (= res!264826 (or (= (select (arr!13230 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13230 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!446166 () Bool)

(declare-fun res!264825 () Bool)

(assert (=> b!446166 (=> (not res!264825) (not e!262129))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!446166 (= res!264825 (and (= (size!13583 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13582 _keys!709) (size!13583 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun minValue!515 () V!16943)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16943)

(declare-datatypes ((tuple2!7864 0))(
  ( (tuple2!7865 (_1!3943 (_ BitVec 64)) (_2!3943 V!16943)) )
))
(declare-datatypes ((List!7915 0))(
  ( (Nil!7912) (Cons!7911 (h!8767 tuple2!7864) (t!13673 List!7915)) )
))
(declare-datatypes ((ListLongMap!6777 0))(
  ( (ListLongMap!6778 (toList!3404 List!7915)) )
))
(declare-fun call!29652 () ListLongMap!6777)

(declare-fun c!55893 () Bool)

(declare-fun lt!203719 () array!27565)

(declare-fun bm!29648 () Bool)

(declare-fun v!412 () V!16943)

(declare-fun getCurrentListMapNoExtraKeys!1590 (array!27565 array!27567 (_ BitVec 32) (_ BitVec 32) V!16943 V!16943 (_ BitVec 32) Int) ListLongMap!6777)

(assert (=> bm!29648 (= call!29652 (getCurrentListMapNoExtraKeys!1590 (ite c!55893 lt!203719 _keys!709) (ite c!55893 (array!27568 (store (arr!13231 _values!549) i!563 (ValueCellFull!5596 v!412)) (size!13583 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446167 () Bool)

(declare-fun e!262128 () Bool)

(declare-fun call!29651 () ListLongMap!6777)

(assert (=> b!446167 (= e!262128 (= call!29651 call!29652))))

(declare-fun mapNonEmpty!19446 () Bool)

(declare-fun mapRes!19446 () Bool)

(declare-fun tp!37472 () Bool)

(declare-fun e!262133 () Bool)

(assert (=> mapNonEmpty!19446 (= mapRes!19446 (and tp!37472 e!262133))))

(declare-fun mapKey!19446 () (_ BitVec 32))

(declare-fun mapRest!19446 () (Array (_ BitVec 32) ValueCell!5596))

(declare-fun mapValue!19446 () ValueCell!5596)

(assert (=> mapNonEmpty!19446 (= (arr!13231 _values!549) (store mapRest!19446 mapKey!19446 mapValue!19446))))

(declare-fun b!446168 () Bool)

(declare-fun e!262132 () Bool)

(assert (=> b!446168 (= e!262132 (not (= (getCurrentListMapNoExtraKeys!1590 lt!203719 (array!27568 (store (arr!13231 _values!549) i!563 (ValueCellFull!5596 v!412)) (size!13583 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) (getCurrentListMapNoExtraKeys!1590 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))))

(assert (=> b!446168 e!262128))

(assert (=> b!446168 (= c!55893 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13178 0))(
  ( (Unit!13179) )
))
(declare-fun lt!203720 () Unit!13178)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!705 (array!27565 array!27567 (_ BitVec 32) (_ BitVec 32) V!16943 V!16943 (_ BitVec 32) (_ BitVec 64) V!16943 (_ BitVec 32) Int) Unit!13178)

(assert (=> b!446168 (= lt!203720 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!705 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446169 () Bool)

(declare-fun res!264821 () Bool)

(assert (=> b!446169 (=> (not res!264821) (not e!262129))))

(assert (=> b!446169 (= res!264821 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13582 _keys!709))))))

(declare-fun b!446170 () Bool)

(declare-fun res!264823 () Bool)

(assert (=> b!446170 (=> (not res!264823) (not e!262129))))

(declare-datatypes ((List!7916 0))(
  ( (Nil!7913) (Cons!7912 (h!8768 (_ BitVec 64)) (t!13674 List!7916)) )
))
(declare-fun arrayNoDuplicates!0 (array!27565 (_ BitVec 32) List!7916) Bool)

(assert (=> b!446170 (= res!264823 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7913))))

(declare-fun b!446171 () Bool)

(declare-fun res!264822 () Bool)

(assert (=> b!446171 (=> (not res!264822) (not e!262132))))

(assert (=> b!446171 (= res!264822 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13582 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!446172 () Bool)

(assert (=> b!446172 (= e!262129 e!262132)))

(declare-fun res!264828 () Bool)

(assert (=> b!446172 (=> (not res!264828) (not e!262132))))

(assert (=> b!446172 (= res!264828 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203719 mask!1025))))

(assert (=> b!446172 (= lt!203719 (array!27566 (store (arr!13230 _keys!709) i!563 k!794) (size!13582 _keys!709)))))

(declare-fun b!446173 () Bool)

(declare-fun res!264818 () Bool)

(assert (=> b!446173 (=> (not res!264818) (not e!262129))))

(declare-fun arrayContainsKey!0 (array!27565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!446173 (= res!264818 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun bm!29649 () Bool)

(assert (=> bm!29649 (= call!29651 (getCurrentListMapNoExtraKeys!1590 (ite c!55893 _keys!709 lt!203719) (ite c!55893 _values!549 (array!27568 (store (arr!13231 _values!549) i!563 (ValueCellFull!5596 v!412)) (size!13583 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!446174 () Bool)

(assert (=> b!446174 (= e!262133 tp_is_empty!11879)))

(declare-fun mapIsEmpty!19446 () Bool)

(assert (=> mapIsEmpty!19446 mapRes!19446))

(declare-fun b!446175 () Bool)

(declare-fun res!264829 () Bool)

(assert (=> b!446175 (=> (not res!264829) (not e!262132))))

(assert (=> b!446175 (= res!264829 (arrayNoDuplicates!0 lt!203719 #b00000000000000000000000000000000 Nil!7913))))

(declare-fun b!446176 () Bool)

(declare-fun res!264820 () Bool)

(assert (=> b!446176 (=> (not res!264820) (not e!262129))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!446176 (= res!264820 (validKeyInArray!0 k!794))))

(declare-fun b!446177 () Bool)

(declare-fun res!264819 () Bool)

(assert (=> b!446177 (=> (not res!264819) (not e!262129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!446177 (= res!264819 (validMask!0 mask!1025))))

(declare-fun b!446178 () Bool)

(declare-fun +!1534 (ListLongMap!6777 tuple2!7864) ListLongMap!6777)

(assert (=> b!446178 (= e!262128 (= call!29652 (+!1534 call!29651 (tuple2!7865 k!794 v!412))))))

(declare-fun b!446179 () Bool)

(declare-fun e!262127 () Bool)

(assert (=> b!446179 (= e!262131 (and e!262127 mapRes!19446))))

(declare-fun condMapEmpty!19446 () Bool)

(declare-fun mapDefault!19446 () ValueCell!5596)

