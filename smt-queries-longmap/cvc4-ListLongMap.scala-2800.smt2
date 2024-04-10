; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40692 () Bool)

(assert start!40692)

(declare-fun b_free!10703 () Bool)

(declare-fun b_next!10703 () Bool)

(assert (=> start!40692 (= b_free!10703 (not b_next!10703))))

(declare-fun tp!37929 () Bool)

(declare-fun b_and!18711 () Bool)

(assert (=> start!40692 (= tp!37929 b_and!18711)))

(declare-fun mapIsEmpty!19695 () Bool)

(declare-fun mapRes!19695 () Bool)

(assert (=> mapIsEmpty!19695 mapRes!19695))

(declare-fun b!450011 () Bool)

(declare-fun res!267789 () Bool)

(declare-fun e!263766 () Bool)

(assert (=> b!450011 (=> (not res!267789) (not e!263766))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450011 (= res!267789 (validMask!0 mask!1025))))

(declare-fun b!450012 () Bool)

(declare-fun e!263767 () Bool)

(declare-fun tp_is_empty!12041 () Bool)

(assert (=> b!450012 (= e!263767 tp_is_empty!12041)))

(declare-fun c!55961 () Bool)

(declare-datatypes ((V!17159 0))(
  ( (V!17160 (val!6065 Int)) )
))
(declare-fun minValue!515 () V!17159)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27889 0))(
  ( (array!27890 (arr!13390 (Array (_ BitVec 32) (_ BitVec 64))) (size!13742 (_ BitVec 32))) )
))
(declare-fun lt!204493 () array!27889)

(declare-datatypes ((ValueCell!5677 0))(
  ( (ValueCellFull!5677 (v!8320 V!17159)) (EmptyCell!5677) )
))
(declare-datatypes ((array!27891 0))(
  ( (array!27892 (arr!13391 (Array (_ BitVec 32) ValueCell!5677)) (size!13743 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27891)

(declare-datatypes ((tuple2!7962 0))(
  ( (tuple2!7963 (_1!3992 (_ BitVec 64)) (_2!3992 V!17159)) )
))
(declare-datatypes ((List!8031 0))(
  ( (Nil!8028) (Cons!8027 (h!8883 tuple2!7962) (t!13793 List!8031)) )
))
(declare-datatypes ((ListLongMap!6875 0))(
  ( (ListLongMap!6876 (toList!3453 List!8031)) )
))
(declare-fun call!29701 () ListLongMap!6875)

(declare-fun zeroValue!515 () V!17159)

(declare-fun bm!29698 () Bool)

(declare-fun lt!204491 () array!27891)

(declare-fun _keys!709 () array!27889)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1639 (array!27889 array!27891 (_ BitVec 32) (_ BitVec 32) V!17159 V!17159 (_ BitVec 32) Int) ListLongMap!6875)

(assert (=> bm!29698 (= call!29701 (getCurrentListMapNoExtraKeys!1639 (ite c!55961 lt!204493 _keys!709) (ite c!55961 lt!204491 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450013 () Bool)

(declare-fun e!263763 () Bool)

(declare-fun e!263768 () Bool)

(assert (=> b!450013 (= e!263763 e!263768)))

(declare-fun res!267783 () Bool)

(assert (=> b!450013 (=> (not res!267783) (not e!263768))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450013 (= res!267783 (= from!863 i!563))))

(declare-fun lt!204494 () ListLongMap!6875)

(assert (=> b!450013 (= lt!204494 (getCurrentListMapNoExtraKeys!1639 lt!204493 lt!204491 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17159)

(assert (=> b!450013 (= lt!204491 (array!27892 (store (arr!13391 _values!549) i!563 (ValueCellFull!5677 v!412)) (size!13743 _values!549)))))

(declare-fun lt!204492 () ListLongMap!6875)

(assert (=> b!450013 (= lt!204492 (getCurrentListMapNoExtraKeys!1639 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450014 () Bool)

(declare-fun e!263764 () Bool)

(assert (=> b!450014 (= e!263764 tp_is_empty!12041)))

(declare-fun b!450015 () Bool)

(declare-fun res!267784 () Bool)

(assert (=> b!450015 (=> (not res!267784) (not e!263766))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27889 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450015 (= res!267784 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!450016 () Bool)

(assert (=> b!450016 (= e!263768 (not (bvslt from!863 (size!13742 _keys!709))))))

(declare-fun e!263762 () Bool)

(assert (=> b!450016 e!263762))

(assert (=> b!450016 (= c!55961 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13186 0))(
  ( (Unit!13187) )
))
(declare-fun lt!204495 () Unit!13186)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!708 (array!27889 array!27891 (_ BitVec 32) (_ BitVec 32) V!17159 V!17159 (_ BitVec 32) (_ BitVec 64) V!17159 (_ BitVec 32) Int) Unit!13186)

(assert (=> b!450016 (= lt!204495 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!708 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450017 () Bool)

(declare-fun res!267791 () Bool)

(assert (=> b!450017 (=> (not res!267791) (not e!263766))))

(assert (=> b!450017 (= res!267791 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13742 _keys!709))))))

(declare-fun b!450018 () Bool)

(declare-fun e!263761 () Bool)

(assert (=> b!450018 (= e!263761 (and e!263767 mapRes!19695))))

(declare-fun condMapEmpty!19695 () Bool)

(declare-fun mapDefault!19695 () ValueCell!5677)

