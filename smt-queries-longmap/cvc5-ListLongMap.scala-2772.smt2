; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40484 () Bool)

(assert start!40484)

(declare-fun b_free!10555 () Bool)

(declare-fun b_next!10555 () Bool)

(assert (=> start!40484 (= b_free!10555 (not b_next!10555))))

(declare-fun tp!37442 () Bool)

(declare-fun b_and!18539 () Bool)

(assert (=> start!40484 (= tp!37442 b_and!18539)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16931 0))(
  ( (V!16932 (val!5979 Int)) )
))
(declare-datatypes ((ValueCell!5591 0))(
  ( (ValueCellFull!5591 (v!8230 V!16931)) (EmptyCell!5591) )
))
(declare-datatypes ((array!27545 0))(
  ( (array!27546 (arr!13220 (Array (_ BitVec 32) ValueCell!5591)) (size!13572 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27545)

(declare-fun zeroValue!515 () V!16931)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun c!55878 () Bool)

(declare-datatypes ((array!27547 0))(
  ( (array!27548 (arr!13221 (Array (_ BitVec 32) (_ BitVec 64))) (size!13573 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27547)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!16931)

(declare-fun bm!29618 () Bool)

(declare-fun lt!203689 () array!27547)

(declare-fun v!412 () V!16931)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7856 0))(
  ( (tuple2!7857 (_1!3939 (_ BitVec 64)) (_2!3939 V!16931)) )
))
(declare-datatypes ((List!7907 0))(
  ( (Nil!7904) (Cons!7903 (h!8759 tuple2!7856) (t!13665 List!7907)) )
))
(declare-datatypes ((ListLongMap!6769 0))(
  ( (ListLongMap!6770 (toList!3400 List!7907)) )
))
(declare-fun call!29621 () ListLongMap!6769)

(declare-fun getCurrentListMapNoExtraKeys!1587 (array!27547 array!27545 (_ BitVec 32) (_ BitVec 32) V!16931 V!16931 (_ BitVec 32) Int) ListLongMap!6769)

(assert (=> bm!29618 (= call!29621 (getCurrentListMapNoExtraKeys!1587 (ite c!55878 _keys!709 lt!203689) (ite c!55878 _values!549 (array!27546 (store (arr!13220 _values!549) i!563 (ValueCellFull!5591 v!412)) (size!13572 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29622 () ListLongMap!6769)

(declare-fun bm!29619 () Bool)

(assert (=> bm!29619 (= call!29622 (getCurrentListMapNoExtraKeys!1587 (ite c!55878 lt!203689 _keys!709) (ite c!55878 (array!27546 (store (arr!13220 _values!549) i!563 (ValueCellFull!5591 v!412)) (size!13572 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445909 () Bool)

(declare-fun res!264644 () Bool)

(declare-fun e!262026 () Bool)

(assert (=> b!445909 (=> (not res!264644) (not e!262026))))

(declare-datatypes ((List!7908 0))(
  ( (Nil!7905) (Cons!7904 (h!8760 (_ BitVec 64)) (t!13666 List!7908)) )
))
(declare-fun arrayNoDuplicates!0 (array!27547 (_ BitVec 32) List!7908) Bool)

(assert (=> b!445909 (= res!264644 (arrayNoDuplicates!0 lt!203689 #b00000000000000000000000000000000 Nil!7905))))

(declare-fun b!445910 () Bool)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun e!262023 () Bool)

(declare-fun +!1531 (ListLongMap!6769 tuple2!7856) ListLongMap!6769)

(assert (=> b!445910 (= e!262023 (= call!29622 (+!1531 call!29621 (tuple2!7857 k!794 v!412))))))

(declare-fun b!445911 () Bool)

(declare-fun res!264646 () Bool)

(declare-fun e!262027 () Bool)

(assert (=> b!445911 (=> (not res!264646) (not e!262027))))

(assert (=> b!445911 (= res!264646 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7905))))

(declare-fun b!445912 () Bool)

(declare-fun e!262024 () Bool)

(declare-fun tp_is_empty!11869 () Bool)

(assert (=> b!445912 (= e!262024 tp_is_empty!11869)))

(declare-fun mapNonEmpty!19431 () Bool)

(declare-fun mapRes!19431 () Bool)

(declare-fun tp!37443 () Bool)

(assert (=> mapNonEmpty!19431 (= mapRes!19431 (and tp!37443 e!262024))))

(declare-fun mapKey!19431 () (_ BitVec 32))

(declare-fun mapRest!19431 () (Array (_ BitVec 32) ValueCell!5591))

(declare-fun mapValue!19431 () ValueCell!5591)

(assert (=> mapNonEmpty!19431 (= (arr!13220 _values!549) (store mapRest!19431 mapKey!19431 mapValue!19431))))

(declare-fun b!445913 () Bool)

(declare-fun res!264642 () Bool)

(assert (=> b!445913 (=> (not res!264642) (not e!262027))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27547 (_ BitVec 32)) Bool)

(assert (=> b!445913 (= res!264642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445914 () Bool)

(declare-fun res!264641 () Bool)

(assert (=> b!445914 (=> (not res!264641) (not e!262027))))

(assert (=> b!445914 (= res!264641 (and (= (size!13572 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13573 _keys!709) (size!13572 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!264643 () Bool)

(assert (=> start!40484 (=> (not res!264643) (not e!262027))))

(assert (=> start!40484 (= res!264643 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13573 _keys!709))))))

(assert (=> start!40484 e!262027))

(assert (=> start!40484 tp_is_empty!11869))

(assert (=> start!40484 tp!37442))

(assert (=> start!40484 true))

(declare-fun e!262022 () Bool)

(declare-fun array_inv!9588 (array!27545) Bool)

(assert (=> start!40484 (and (array_inv!9588 _values!549) e!262022)))

(declare-fun array_inv!9589 (array!27547) Bool)

(assert (=> start!40484 (array_inv!9589 _keys!709)))

(declare-fun b!445915 () Bool)

(declare-fun res!264640 () Bool)

(assert (=> b!445915 (=> (not res!264640) (not e!262027))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445915 (= res!264640 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!19431 () Bool)

(assert (=> mapIsEmpty!19431 mapRes!19431))

(declare-fun b!445916 () Bool)

(assert (=> b!445916 (= e!262026 (not (bvslt i!563 (size!13572 _values!549))))))

(assert (=> b!445916 e!262023))

(assert (=> b!445916 (= c!55878 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13172 0))(
  ( (Unit!13173) )
))
(declare-fun lt!203690 () Unit!13172)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!702 (array!27547 array!27545 (_ BitVec 32) (_ BitVec 32) V!16931 V!16931 (_ BitVec 32) (_ BitVec 64) V!16931 (_ BitVec 32) Int) Unit!13172)

(assert (=> b!445916 (= lt!203690 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!702 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445917 () Bool)

(assert (=> b!445917 (= e!262027 e!262026)))

(declare-fun res!264649 () Bool)

(assert (=> b!445917 (=> (not res!264649) (not e!262026))))

(assert (=> b!445917 (= res!264649 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203689 mask!1025))))

(assert (=> b!445917 (= lt!203689 (array!27548 (store (arr!13221 _keys!709) i!563 k!794) (size!13573 _keys!709)))))

(declare-fun b!445918 () Bool)

(declare-fun res!264647 () Bool)

(assert (=> b!445918 (=> (not res!264647) (not e!262027))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445918 (= res!264647 (validMask!0 mask!1025))))

(declare-fun b!445919 () Bool)

(assert (=> b!445919 (= e!262023 (= call!29621 call!29622))))

(declare-fun b!445920 () Bool)

(declare-fun res!264648 () Bool)

(assert (=> b!445920 (=> (not res!264648) (not e!262027))))

(assert (=> b!445920 (= res!264648 (or (= (select (arr!13221 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13221 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445921 () Bool)

(declare-fun e!262025 () Bool)

(assert (=> b!445921 (= e!262025 tp_is_empty!11869)))

(declare-fun b!445922 () Bool)

(declare-fun res!264638 () Bool)

(assert (=> b!445922 (=> (not res!264638) (not e!262027))))

(assert (=> b!445922 (= res!264638 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13573 _keys!709))))))

(declare-fun b!445923 () Bool)

(declare-fun res!264639 () Bool)

(assert (=> b!445923 (=> (not res!264639) (not e!262027))))

(declare-fun arrayContainsKey!0 (array!27547 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445923 (= res!264639 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!445924 () Bool)

(assert (=> b!445924 (= e!262022 (and e!262025 mapRes!19431))))

(declare-fun condMapEmpty!19431 () Bool)

(declare-fun mapDefault!19431 () ValueCell!5591)

