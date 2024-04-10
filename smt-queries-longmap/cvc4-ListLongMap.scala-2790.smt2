; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40632 () Bool)

(assert start!40632)

(declare-fun b_free!10643 () Bool)

(declare-fun b_next!10643 () Bool)

(assert (=> start!40632 (= b_free!10643 (not b_next!10643))))

(declare-fun tp!37748 () Bool)

(declare-fun b_and!18651 () Bool)

(assert (=> start!40632 (= tp!37748 b_and!18651)))

(declare-fun b!448637 () Bool)

(declare-fun res!266697 () Bool)

(declare-fun e!263207 () Bool)

(assert (=> b!448637 (=> (not res!266697) (not e!263207))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!448637 (= res!266697 (validKeyInArray!0 k!794))))

(declare-fun b!448638 () Bool)

(declare-fun res!266703 () Bool)

(declare-fun e!263210 () Bool)

(assert (=> b!448638 (=> (not res!266703) (not e!263210))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!448638 (= res!266703 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!19605 () Bool)

(declare-fun mapRes!19605 () Bool)

(declare-fun tp!37749 () Bool)

(declare-fun e!263205 () Bool)

(assert (=> mapNonEmpty!19605 (= mapRes!19605 (and tp!37749 e!263205))))

(declare-datatypes ((V!17079 0))(
  ( (V!17080 (val!6035 Int)) )
))
(declare-datatypes ((ValueCell!5647 0))(
  ( (ValueCellFull!5647 (v!8290 V!17079)) (EmptyCell!5647) )
))
(declare-fun mapRest!19605 () (Array (_ BitVec 32) ValueCell!5647))

(declare-datatypes ((array!27769 0))(
  ( (array!27770 (arr!13330 (Array (_ BitVec 32) ValueCell!5647)) (size!13682 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27769)

(declare-fun mapKey!19605 () (_ BitVec 32))

(declare-fun mapValue!19605 () ValueCell!5647)

(assert (=> mapNonEmpty!19605 (= (arr!13330 _values!549) (store mapRest!19605 mapKey!19605 mapValue!19605))))

(declare-fun b!448639 () Bool)

(declare-fun res!266701 () Bool)

(assert (=> b!448639 (=> (not res!266701) (not e!263207))))

(declare-datatypes ((array!27771 0))(
  ( (array!27772 (arr!13331 (Array (_ BitVec 32) (_ BitVec 64))) (size!13683 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27771)

(declare-fun arrayContainsKey!0 (array!27771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!448639 (= res!266701 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!448640 () Bool)

(declare-fun res!266699 () Bool)

(assert (=> b!448640 (=> (not res!266699) (not e!263207))))

(declare-datatypes ((List!7984 0))(
  ( (Nil!7981) (Cons!7980 (h!8836 (_ BitVec 64)) (t!13746 List!7984)) )
))
(declare-fun arrayNoDuplicates!0 (array!27771 (_ BitVec 32) List!7984) Bool)

(assert (=> b!448640 (= res!266699 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7981))))

(declare-fun b!448641 () Bool)

(declare-fun res!266692 () Bool)

(assert (=> b!448641 (=> (not res!266692) (not e!263210))))

(declare-fun lt!204205 () array!27771)

(assert (=> b!448641 (= res!266692 (arrayNoDuplicates!0 lt!204205 #b00000000000000000000000000000000 Nil!7981))))

(declare-fun b!448642 () Bool)

(assert (=> b!448642 (= e!263210 false)))

(declare-fun minValue!515 () V!17079)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17079)

(declare-fun v!412 () V!17079)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7920 0))(
  ( (tuple2!7921 (_1!3971 (_ BitVec 64)) (_2!3971 V!17079)) )
))
(declare-datatypes ((List!7985 0))(
  ( (Nil!7982) (Cons!7981 (h!8837 tuple2!7920) (t!13747 List!7985)) )
))
(declare-datatypes ((ListLongMap!6833 0))(
  ( (ListLongMap!6834 (toList!3432 List!7985)) )
))
(declare-fun lt!204206 () ListLongMap!6833)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1618 (array!27771 array!27769 (_ BitVec 32) (_ BitVec 32) V!17079 V!17079 (_ BitVec 32) Int) ListLongMap!6833)

(assert (=> b!448642 (= lt!204206 (getCurrentListMapNoExtraKeys!1618 lt!204205 (array!27770 (store (arr!13330 _values!549) i!563 (ValueCellFull!5647 v!412)) (size!13682 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!204207 () ListLongMap!6833)

(assert (=> b!448642 (= lt!204207 (getCurrentListMapNoExtraKeys!1618 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!266693 () Bool)

(assert (=> start!40632 (=> (not res!266693) (not e!263207))))

(assert (=> start!40632 (= res!266693 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13683 _keys!709))))))

(assert (=> start!40632 e!263207))

(declare-fun tp_is_empty!11981 () Bool)

(assert (=> start!40632 tp_is_empty!11981))

(assert (=> start!40632 tp!37748))

(assert (=> start!40632 true))

(declare-fun e!263208 () Bool)

(declare-fun array_inv!9660 (array!27769) Bool)

(assert (=> start!40632 (and (array_inv!9660 _values!549) e!263208)))

(declare-fun array_inv!9661 (array!27771) Bool)

(assert (=> start!40632 (array_inv!9661 _keys!709)))

(declare-fun b!448643 () Bool)

(assert (=> b!448643 (= e!263205 tp_is_empty!11981)))

(declare-fun b!448644 () Bool)

(declare-fun res!266696 () Bool)

(assert (=> b!448644 (=> (not res!266696) (not e!263207))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27771 (_ BitVec 32)) Bool)

(assert (=> b!448644 (= res!266696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!448645 () Bool)

(declare-fun res!266700 () Bool)

(assert (=> b!448645 (=> (not res!266700) (not e!263207))))

(assert (=> b!448645 (= res!266700 (or (= (select (arr!13331 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13331 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!448646 () Bool)

(declare-fun e!263209 () Bool)

(assert (=> b!448646 (= e!263209 tp_is_empty!11981)))

(declare-fun b!448647 () Bool)

(declare-fun res!266698 () Bool)

(assert (=> b!448647 (=> (not res!266698) (not e!263207))))

(assert (=> b!448647 (= res!266698 (and (= (size!13682 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13683 _keys!709) (size!13682 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19605 () Bool)

(assert (=> mapIsEmpty!19605 mapRes!19605))

(declare-fun b!448648 () Bool)

(declare-fun res!266702 () Bool)

(assert (=> b!448648 (=> (not res!266702) (not e!263207))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!448648 (= res!266702 (validMask!0 mask!1025))))

(declare-fun b!448649 () Bool)

(assert (=> b!448649 (= e!263207 e!263210)))

(declare-fun res!266695 () Bool)

(assert (=> b!448649 (=> (not res!266695) (not e!263210))))

(assert (=> b!448649 (= res!266695 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204205 mask!1025))))

(assert (=> b!448649 (= lt!204205 (array!27772 (store (arr!13331 _keys!709) i!563 k!794) (size!13683 _keys!709)))))

(declare-fun b!448650 () Bool)

(assert (=> b!448650 (= e!263208 (and e!263209 mapRes!19605))))

(declare-fun condMapEmpty!19605 () Bool)

(declare-fun mapDefault!19605 () ValueCell!5647)

