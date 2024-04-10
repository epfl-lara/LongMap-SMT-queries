; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40264 () Bool)

(assert start!40264)

(declare-fun b_free!10525 () Bool)

(declare-fun b_next!10525 () Bool)

(assert (=> start!40264 (= b_free!10525 (not b_next!10525))))

(declare-fun tp!37112 () Bool)

(declare-fun b_and!18493 () Bool)

(assert (=> start!40264 (= tp!37112 b_and!18493)))

(declare-fun b!442077 () Bool)

(declare-fun res!261821 () Bool)

(declare-fun e!260216 () Bool)

(assert (=> b!442077 (=> (not res!261821) (not e!260216))))

(declare-datatypes ((array!27177 0))(
  ( (array!27178 (arr!13038 (Array (_ BitVec 32) (_ BitVec 64))) (size!13390 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27177)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16683 0))(
  ( (V!16684 (val!5886 Int)) )
))
(declare-datatypes ((ValueCell!5498 0))(
  ( (ValueCellFull!5498 (v!8133 V!16683)) (EmptyCell!5498) )
))
(declare-datatypes ((array!27179 0))(
  ( (array!27180 (arr!13039 (Array (_ BitVec 32) ValueCell!5498)) (size!13391 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27179)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442077 (= res!261821 (and (= (size!13391 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13390 _keys!709) (size!13391 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!442079 () Bool)

(declare-fun res!261827 () Bool)

(declare-fun e!260214 () Bool)

(assert (=> b!442079 (=> (not res!261827) (not e!260214))))

(declare-fun lt!203078 () array!27177)

(declare-datatypes ((List!7829 0))(
  ( (Nil!7826) (Cons!7825 (h!8681 (_ BitVec 64)) (t!13585 List!7829)) )
))
(declare-fun arrayNoDuplicates!0 (array!27177 (_ BitVec 32) List!7829) Bool)

(assert (=> b!442079 (= res!261827 (arrayNoDuplicates!0 lt!203078 #b00000000000000000000000000000000 Nil!7826))))

(declare-fun b!442080 () Bool)

(declare-fun e!260217 () Bool)

(declare-fun tp_is_empty!11683 () Bool)

(assert (=> b!442080 (= e!260217 tp_is_empty!11683)))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16683)

(declare-fun bm!29518 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!16683)

(declare-fun lt!203075 () array!27179)

(declare-fun c!55799 () Bool)

(declare-datatypes ((tuple2!7832 0))(
  ( (tuple2!7833 (_1!3927 (_ BitVec 64)) (_2!3927 V!16683)) )
))
(declare-datatypes ((List!7830 0))(
  ( (Nil!7827) (Cons!7826 (h!8682 tuple2!7832) (t!13586 List!7830)) )
))
(declare-datatypes ((ListLongMap!6745 0))(
  ( (ListLongMap!6746 (toList!3388 List!7830)) )
))
(declare-fun call!29521 () ListLongMap!6745)

(declare-fun getCurrentListMapNoExtraKeys!1577 (array!27177 array!27179 (_ BitVec 32) (_ BitVec 32) V!16683 V!16683 (_ BitVec 32) Int) ListLongMap!6745)

(assert (=> bm!29518 (= call!29521 (getCurrentListMapNoExtraKeys!1577 (ite c!55799 lt!203078 _keys!709) (ite c!55799 lt!203075 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29519 () Bool)

(declare-fun call!29522 () ListLongMap!6745)

(assert (=> bm!29519 (= call!29522 (getCurrentListMapNoExtraKeys!1577 (ite c!55799 _keys!709 lt!203078) (ite c!55799 _values!549 lt!203075) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!442081 () Bool)

(assert (=> b!442081 (= e!260216 e!260214)))

(declare-fun res!261820 () Bool)

(assert (=> b!442081 (=> (not res!261820) (not e!260214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27177 (_ BitVec 32)) Bool)

(assert (=> b!442081 (= res!261820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203078 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442081 (= lt!203078 (array!27178 (store (arr!13038 _keys!709) i!563 k!794) (size!13390 _keys!709)))))

(declare-fun b!442082 () Bool)

(declare-fun res!261824 () Bool)

(assert (=> b!442082 (=> (not res!261824) (not e!260216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!442082 (= res!261824 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!19146 () Bool)

(declare-fun mapRes!19146 () Bool)

(declare-fun tp!37113 () Bool)

(assert (=> mapNonEmpty!19146 (= mapRes!19146 (and tp!37113 e!260217))))

(declare-fun mapRest!19146 () (Array (_ BitVec 32) ValueCell!5498))

(declare-fun mapKey!19146 () (_ BitVec 32))

(declare-fun mapValue!19146 () ValueCell!5498)

(assert (=> mapNonEmpty!19146 (= (arr!13039 _values!549) (store mapRest!19146 mapKey!19146 mapValue!19146))))

(declare-fun b!442083 () Bool)

(declare-fun res!261823 () Bool)

(assert (=> b!442083 (=> (not res!261823) (not e!260216))))

(assert (=> b!442083 (= res!261823 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!442084 () Bool)

(declare-fun res!261819 () Bool)

(assert (=> b!442084 (=> (not res!261819) (not e!260216))))

(assert (=> b!442084 (= res!261819 (or (= (select (arr!13038 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13038 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!442085 () Bool)

(declare-fun res!261831 () Bool)

(assert (=> b!442085 (=> (not res!261831) (not e!260214))))

(assert (=> b!442085 (= res!261831 (bvsle from!863 i!563))))

(declare-fun b!442086 () Bool)

(declare-fun res!261826 () Bool)

(assert (=> b!442086 (=> (not res!261826) (not e!260216))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442086 (= res!261826 (validKeyInArray!0 k!794))))

(declare-fun b!442087 () Bool)

(declare-fun res!261825 () Bool)

(assert (=> b!442087 (=> (not res!261825) (not e!260216))))

(assert (=> b!442087 (= res!261825 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13390 _keys!709))))))

(declare-fun b!442078 () Bool)

(declare-fun e!260211 () Bool)

(declare-fun e!260213 () Bool)

(assert (=> b!442078 (= e!260211 (and e!260213 mapRes!19146))))

(declare-fun condMapEmpty!19146 () Bool)

(declare-fun mapDefault!19146 () ValueCell!5498)

