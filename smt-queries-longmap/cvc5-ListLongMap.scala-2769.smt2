; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40466 () Bool)

(assert start!40466)

(declare-fun b_free!10537 () Bool)

(declare-fun b_next!10537 () Bool)

(assert (=> start!40466 (= b_free!10537 (not b_next!10537))))

(declare-fun tp!37388 () Bool)

(declare-fun b_and!18521 () Bool)

(assert (=> start!40466 (= tp!37388 b_and!18521)))

(declare-datatypes ((V!16907 0))(
  ( (V!16908 (val!5970 Int)) )
))
(declare-datatypes ((tuple2!7840 0))(
  ( (tuple2!7841 (_1!3931 (_ BitVec 64)) (_2!3931 V!16907)) )
))
(declare-datatypes ((List!7891 0))(
  ( (Nil!7888) (Cons!7887 (h!8743 tuple2!7840) (t!13649 List!7891)) )
))
(declare-datatypes ((ListLongMap!6753 0))(
  ( (ListLongMap!6754 (toList!3392 List!7891)) )
))
(declare-fun call!29567 () ListLongMap!6753)

(declare-fun minValue!515 () V!16907)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5582 0))(
  ( (ValueCellFull!5582 (v!8221 V!16907)) (EmptyCell!5582) )
))
(declare-datatypes ((array!27509 0))(
  ( (array!27510 (arr!13202 (Array (_ BitVec 32) ValueCell!5582)) (size!13554 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27509)

(declare-fun zeroValue!515 () V!16907)

(declare-fun c!55851 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27511 0))(
  ( (array!27512 (arr!13203 (Array (_ BitVec 32) (_ BitVec 64))) (size!13555 (_ BitVec 32))) )
))
(declare-fun lt!203636 () array!27511)

(declare-fun v!412 () V!16907)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27511)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!29564 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1581 (array!27511 array!27509 (_ BitVec 32) (_ BitVec 32) V!16907 V!16907 (_ BitVec 32) Int) ListLongMap!6753)

(assert (=> bm!29564 (= call!29567 (getCurrentListMapNoExtraKeys!1581 (ite c!55851 _keys!709 lt!203636) (ite c!55851 _values!549 (array!27510 (store (arr!13202 _values!549) i!563 (ValueCellFull!5582 v!412)) (size!13554 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445450 () Bool)

(declare-fun e!261839 () Bool)

(assert (=> b!445450 (= e!261839 (not true))))

(declare-fun e!261836 () Bool)

(assert (=> b!445450 e!261836))

(assert (=> b!445450 (= c!55851 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((Unit!13156 0))(
  ( (Unit!13157) )
))
(declare-fun lt!203635 () Unit!13156)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!694 (array!27511 array!27509 (_ BitVec 32) (_ BitVec 32) V!16907 V!16907 (_ BitVec 32) (_ BitVec 64) V!16907 (_ BitVec 32) Int) Unit!13156)

(assert (=> b!445450 (= lt!203635 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!694 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!29568 () ListLongMap!6753)

(declare-fun bm!29565 () Bool)

(assert (=> bm!29565 (= call!29568 (getCurrentListMapNoExtraKeys!1581 (ite c!55851 lt!203636 _keys!709) (ite c!55851 (array!27510 (store (arr!13202 _values!549) i!563 (ValueCellFull!5582 v!412)) (size!13554 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!445451 () Bool)

(assert (=> b!445451 (= e!261836 (= call!29567 call!29568))))

(declare-fun b!445452 () Bool)

(declare-fun res!264314 () Bool)

(declare-fun e!261837 () Bool)

(assert (=> b!445452 (=> (not res!264314) (not e!261837))))

(assert (=> b!445452 (= res!264314 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13555 _keys!709))))))

(declare-fun res!264320 () Bool)

(assert (=> start!40466 (=> (not res!264320) (not e!261837))))

(assert (=> start!40466 (= res!264320 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13555 _keys!709))))))

(assert (=> start!40466 e!261837))

(declare-fun tp_is_empty!11851 () Bool)

(assert (=> start!40466 tp_is_empty!11851))

(assert (=> start!40466 tp!37388))

(assert (=> start!40466 true))

(declare-fun e!261834 () Bool)

(declare-fun array_inv!9572 (array!27509) Bool)

(assert (=> start!40466 (and (array_inv!9572 _values!549) e!261834)))

(declare-fun array_inv!9573 (array!27511) Bool)

(assert (=> start!40466 (array_inv!9573 _keys!709)))

(declare-fun b!445453 () Bool)

(declare-fun res!264317 () Bool)

(assert (=> b!445453 (=> (not res!264317) (not e!261839))))

(assert (=> b!445453 (= res!264317 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13555 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!445454 () Bool)

(declare-fun res!264325 () Bool)

(assert (=> b!445454 (=> (not res!264325) (not e!261837))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445454 (= res!264325 (validMask!0 mask!1025))))

(declare-fun b!445455 () Bool)

(declare-fun e!261835 () Bool)

(declare-fun mapRes!19404 () Bool)

(assert (=> b!445455 (= e!261834 (and e!261835 mapRes!19404))))

(declare-fun condMapEmpty!19404 () Bool)

(declare-fun mapDefault!19404 () ValueCell!5582)

