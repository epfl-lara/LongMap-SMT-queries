; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40764 () Bool)

(assert start!40764)

(declare-fun b_free!10753 () Bool)

(declare-fun b_next!10753 () Bool)

(assert (=> start!40764 (= b_free!10753 (not b_next!10753))))

(declare-fun tp!38082 () Bool)

(declare-fun b_and!18793 () Bool)

(assert (=> start!40764 (= tp!38082 b_and!18793)))

(declare-datatypes ((V!17227 0))(
  ( (V!17228 (val!6090 Int)) )
))
(declare-datatypes ((tuple2!8008 0))(
  ( (tuple2!8009 (_1!4015 (_ BitVec 64)) (_2!4015 V!17227)) )
))
(declare-datatypes ((List!8070 0))(
  ( (Nil!8067) (Cons!8066 (h!8922 tuple2!8008) (t!13846 List!8070)) )
))
(declare-datatypes ((ListLongMap!6921 0))(
  ( (ListLongMap!6922 (toList!3476 List!8070)) )
))
(declare-fun call!29873 () ListLongMap!6921)

(declare-fun minValue!515 () V!17227)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!27989 0))(
  ( (array!27990 (arr!13439 (Array (_ BitVec 32) (_ BitVec 64))) (size!13791 (_ BitVec 32))) )
))
(declare-fun lt!204968 () array!27989)

(declare-datatypes ((ValueCell!5702 0))(
  ( (ValueCellFull!5702 (v!8349 V!17227)) (EmptyCell!5702) )
))
(declare-datatypes ((array!27991 0))(
  ( (array!27992 (arr!13440 (Array (_ BitVec 32) ValueCell!5702)) (size!13792 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27991)

(declare-fun zeroValue!515 () V!17227)

(declare-fun c!56078 () Bool)

(declare-fun lt!204964 () array!27991)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27989)

(declare-fun bm!29869 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1660 (array!27989 array!27991 (_ BitVec 32) (_ BitVec 32) V!17227 V!17227 (_ BitVec 32) Int) ListLongMap!6921)

(assert (=> bm!29869 (= call!29873 (getCurrentListMapNoExtraKeys!1660 (ite c!56078 lt!204968 _keys!709) (ite c!56078 lt!204964 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451586 () Bool)

(declare-fun e!264521 () Bool)

(declare-fun tp_is_empty!12091 () Bool)

(assert (=> b!451586 (= e!264521 tp_is_empty!12091)))

(declare-fun b!451587 () Bool)

(declare-fun res!268876 () Bool)

(declare-fun e!264524 () Bool)

(assert (=> b!451587 (=> (not res!268876) (not e!264524))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451587 (= res!268876 (or (= (select (arr!13439 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13439 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451588 () Bool)

(declare-fun e!264519 () Bool)

(declare-fun e!264523 () Bool)

(declare-fun mapRes!19773 () Bool)

(assert (=> b!451588 (= e!264519 (and e!264523 mapRes!19773))))

(declare-fun condMapEmpty!19773 () Bool)

(declare-fun mapDefault!19773 () ValueCell!5702)

