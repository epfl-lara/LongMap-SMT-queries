; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40776 () Bool)

(assert start!40776)

(declare-fun b_free!10765 () Bool)

(declare-fun b_next!10765 () Bool)

(assert (=> start!40776 (= b_free!10765 (not b_next!10765))))

(declare-fun tp!38117 () Bool)

(declare-fun b_and!18817 () Bool)

(assert (=> start!40776 (= tp!38117 b_and!18817)))

(declare-fun b!451940 () Bool)

(declare-fun res!269135 () Bool)

(declare-fun e!264688 () Bool)

(assert (=> b!451940 (=> (not res!269135) (not e!264688))))

(declare-datatypes ((array!28013 0))(
  ( (array!28014 (arr!13451 (Array (_ BitVec 32) (_ BitVec 64))) (size!13803 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28013)

(declare-datatypes ((List!8080 0))(
  ( (Nil!8077) (Cons!8076 (h!8932 (_ BitVec 64)) (t!13868 List!8080)) )
))
(declare-fun arrayNoDuplicates!0 (array!28013 (_ BitVec 32) List!8080) Bool)

(assert (=> b!451940 (= res!269135 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8077))))

(declare-fun res!269133 () Bool)

(assert (=> start!40776 (=> (not res!269133) (not e!264688))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40776 (= res!269133 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13803 _keys!709))))))

(assert (=> start!40776 e!264688))

(declare-fun tp_is_empty!12103 () Bool)

(assert (=> start!40776 tp_is_empty!12103))

(assert (=> start!40776 tp!38117))

(assert (=> start!40776 true))

(declare-datatypes ((V!17243 0))(
  ( (V!17244 (val!6096 Int)) )
))
(declare-datatypes ((ValueCell!5708 0))(
  ( (ValueCellFull!5708 (v!8355 V!17243)) (EmptyCell!5708) )
))
(declare-datatypes ((array!28015 0))(
  ( (array!28016 (arr!13452 (Array (_ BitVec 32) ValueCell!5708)) (size!13804 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28015)

(declare-fun e!264681 () Bool)

(declare-fun array_inv!9740 (array!28015) Bool)

(assert (=> start!40776 (and (array_inv!9740 _values!549) e!264681)))

(declare-fun array_inv!9741 (array!28013) Bool)

(assert (=> start!40776 (array_inv!9741 _keys!709)))

(declare-fun minValue!515 () V!17243)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!56096 () Bool)

(declare-datatypes ((tuple2!8020 0))(
  ( (tuple2!8021 (_1!4021 (_ BitVec 64)) (_2!4021 V!17243)) )
))
(declare-datatypes ((List!8081 0))(
  ( (Nil!8078) (Cons!8077 (h!8933 tuple2!8020) (t!13869 List!8081)) )
))
(declare-datatypes ((ListLongMap!6933 0))(
  ( (ListLongMap!6934 (toList!3482 List!8081)) )
))
(declare-fun call!29909 () ListLongMap!6933)

(declare-fun zeroValue!515 () V!17243)

(declare-fun bm!29905 () Bool)

(declare-fun lt!205056 () array!28013)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!205055 () array!28015)

(declare-fun getCurrentListMapNoExtraKeys!1666 (array!28013 array!28015 (_ BitVec 32) (_ BitVec 32) V!17243 V!17243 (_ BitVec 32) Int) ListLongMap!6933)

(assert (=> bm!29905 (= call!29909 (getCurrentListMapNoExtraKeys!1666 (ite c!56096 lt!205056 _keys!709) (ite c!56096 lt!205055 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451941 () Bool)

(declare-fun e!264682 () Bool)

(assert (=> b!451941 (= e!264682 tp_is_empty!12103)))

(declare-fun b!451942 () Bool)

(declare-fun e!264687 () Bool)

(assert (=> b!451942 (= e!264687 tp_is_empty!12103)))

(declare-fun bm!29906 () Bool)

(declare-fun call!29908 () ListLongMap!6933)

(assert (=> bm!29906 (= call!29908 (getCurrentListMapNoExtraKeys!1666 (ite c!56096 _keys!709 lt!205056) (ite c!56096 _values!549 lt!205055) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451943 () Bool)

(declare-fun res!269136 () Bool)

(assert (=> b!451943 (=> (not res!269136) (not e!264688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451943 (= res!269136 (validMask!0 mask!1025))))

(declare-fun b!451944 () Bool)

(declare-fun mapRes!19791 () Bool)

(assert (=> b!451944 (= e!264681 (and e!264687 mapRes!19791))))

(declare-fun condMapEmpty!19791 () Bool)

(declare-fun mapDefault!19791 () ValueCell!5708)

