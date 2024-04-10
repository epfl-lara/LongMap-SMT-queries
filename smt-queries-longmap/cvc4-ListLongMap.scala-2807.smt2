; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40734 () Bool)

(assert start!40734)

(declare-fun b_free!10745 () Bool)

(declare-fun b_next!10745 () Bool)

(assert (=> start!40734 (= b_free!10745 (not b_next!10745))))

(declare-fun tp!38055 () Bool)

(declare-fun b_and!18757 () Bool)

(assert (=> start!40734 (= tp!38055 b_and!18757)))

(declare-fun b!451193 () Bool)

(declare-fun e!264316 () Bool)

(declare-datatypes ((V!17215 0))(
  ( (V!17216 (val!6086 Int)) )
))
(declare-datatypes ((tuple2!8000 0))(
  ( (tuple2!8001 (_1!4011 (_ BitVec 64)) (_2!4011 V!17215)) )
))
(declare-datatypes ((List!8064 0))(
  ( (Nil!8061) (Cons!8060 (h!8916 tuple2!8000) (t!13832 List!8064)) )
))
(declare-datatypes ((ListLongMap!6913 0))(
  ( (ListLongMap!6914 (toList!3472 List!8064)) )
))
(declare-fun call!29827 () ListLongMap!6913)

(declare-fun call!29828 () ListLongMap!6913)

(assert (=> b!451193 (= e!264316 (= call!29827 call!29828))))

(declare-fun minValue!515 () V!17215)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17215)

(declare-datatypes ((array!27971 0))(
  ( (array!27972 (arr!13431 (Array (_ BitVec 32) (_ BitVec 64))) (size!13783 (_ BitVec 32))) )
))
(declare-fun lt!204828 () array!27971)

(declare-datatypes ((ValueCell!5698 0))(
  ( (ValueCellFull!5698 (v!8341 V!17215)) (EmptyCell!5698) )
))
(declare-datatypes ((array!27973 0))(
  ( (array!27974 (arr!13432 (Array (_ BitVec 32) ValueCell!5698)) (size!13784 (_ BitVec 32))) )
))
(declare-fun lt!204825 () array!27973)

(declare-fun bm!29824 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27971)

(declare-fun c!56024 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _values!549 () array!27973)

(declare-fun getCurrentListMapNoExtraKeys!1656 (array!27971 array!27973 (_ BitVec 32) (_ BitVec 32) V!17215 V!17215 (_ BitVec 32) Int) ListLongMap!6913)

(assert (=> bm!29824 (= call!29827 (getCurrentListMapNoExtraKeys!1656 (ite c!56024 _keys!709 lt!204828) (ite c!56024 _values!549 lt!204825) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun e!264311 () Bool)

(declare-fun b!451194 () Bool)

(declare-fun lt!204826 () ListLongMap!6913)

(declare-fun +!1552 (ListLongMap!6913 tuple2!8000) ListLongMap!6913)

(declare-fun get!6610 (ValueCell!5698 V!17215) V!17215)

(declare-fun dynLambda!853 (Int (_ BitVec 64)) V!17215)

(assert (=> b!451194 (= e!264311 (= lt!204826 (+!1552 (getCurrentListMapNoExtraKeys!1656 lt!204828 lt!204825 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8001 (select (arr!13431 lt!204828) from!863) (get!6610 (select (arr!13432 lt!204825) from!863) (dynLambda!853 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun b!451195 () Bool)

(declare-fun res!268653 () Bool)

(declare-fun e!264314 () Bool)

(assert (=> b!451195 (=> (not res!268653) (not e!264314))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451195 (= res!268653 (validKeyInArray!0 k!794))))

(declare-fun mapIsEmpty!19758 () Bool)

(declare-fun mapRes!19758 () Bool)

(assert (=> mapIsEmpty!19758 mapRes!19758))

(declare-fun b!451196 () Bool)

(declare-fun res!268648 () Bool)

(assert (=> b!451196 (=> (not res!268648) (not e!264314))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451196 (= res!268648 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13783 _keys!709))))))

(declare-fun b!451197 () Bool)

(declare-fun res!268649 () Bool)

(declare-fun e!264313 () Bool)

(assert (=> b!451197 (=> (not res!268649) (not e!264313))))

(assert (=> b!451197 (= res!268649 (bvsle from!863 i!563))))

(declare-fun b!451198 () Bool)

(declare-fun e!264317 () Bool)

(declare-fun tp_is_empty!12083 () Bool)

(assert (=> b!451198 (= e!264317 tp_is_empty!12083)))

(declare-fun b!451199 () Bool)

(declare-fun res!268643 () Bool)

(assert (=> b!451199 (=> (not res!268643) (not e!264314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27971 (_ BitVec 32)) Bool)

(assert (=> b!451199 (= res!268643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451200 () Bool)

(assert (=> b!451200 (= e!264314 e!264313)))

(declare-fun res!268644 () Bool)

(assert (=> b!451200 (=> (not res!268644) (not e!264313))))

(assert (=> b!451200 (= res!268644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204828 mask!1025))))

(assert (=> b!451200 (= lt!204828 (array!27972 (store (arr!13431 _keys!709) i!563 k!794) (size!13783 _keys!709)))))

(declare-fun res!268646 () Bool)

(assert (=> start!40734 (=> (not res!268646) (not e!264314))))

(assert (=> start!40734 (= res!268646 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13783 _keys!709))))))

(assert (=> start!40734 e!264314))

(assert (=> start!40734 tp_is_empty!12083))

(assert (=> start!40734 tp!38055))

(assert (=> start!40734 true))

(declare-fun e!264312 () Bool)

(declare-fun array_inv!9726 (array!27973) Bool)

(assert (=> start!40734 (and (array_inv!9726 _values!549) e!264312)))

(declare-fun array_inv!9727 (array!27971) Bool)

(assert (=> start!40734 (array_inv!9727 _keys!709)))

(declare-fun b!451201 () Bool)

(assert (=> b!451201 (= e!264312 (and e!264317 mapRes!19758))))

(declare-fun condMapEmpty!19758 () Bool)

(declare-fun mapDefault!19758 () ValueCell!5698)

