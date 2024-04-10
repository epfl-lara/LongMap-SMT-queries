; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40758 () Bool)

(assert start!40758)

(declare-fun b_free!10747 () Bool)

(declare-fun b_next!10747 () Bool)

(assert (=> start!40758 (= b_free!10747 (not b_next!10747))))

(declare-fun tp!38064 () Bool)

(declare-fun b_and!18781 () Bool)

(assert (=> start!40758 (= tp!38064 b_and!18781)))

(declare-fun b!451409 () Bool)

(declare-fun res!268755 () Bool)

(declare-fun e!264438 () Bool)

(assert (=> b!451409 (=> (not res!268755) (not e!264438))))

(declare-datatypes ((array!27977 0))(
  ( (array!27978 (arr!13433 (Array (_ BitVec 32) (_ BitVec 64))) (size!13785 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27977)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17219 0))(
  ( (V!17220 (val!6087 Int)) )
))
(declare-datatypes ((ValueCell!5699 0))(
  ( (ValueCellFull!5699 (v!8346 V!17219)) (EmptyCell!5699) )
))
(declare-datatypes ((array!27979 0))(
  ( (array!27980 (arr!13434 (Array (_ BitVec 32) ValueCell!5699)) (size!13786 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27979)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!451409 (= res!268755 (and (= (size!13786 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13785 _keys!709) (size!13786 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451410 () Bool)

(declare-fun res!268752 () Bool)

(assert (=> b!451410 (=> (not res!268752) (not e!264438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27977 (_ BitVec 32)) Bool)

(assert (=> b!451410 (= res!268752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!451411 () Bool)

(declare-fun e!264444 () Bool)

(assert (=> b!451411 (= e!264438 e!264444)))

(declare-fun res!268750 () Bool)

(assert (=> b!451411 (=> (not res!268750) (not e!264444))))

(declare-fun lt!204922 () array!27977)

(assert (=> b!451411 (= res!268750 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204922 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!451411 (= lt!204922 (array!27978 (store (arr!13433 _keys!709) i!563 k!794) (size!13785 _keys!709)))))

(declare-datatypes ((tuple2!8002 0))(
  ( (tuple2!8003 (_1!4012 (_ BitVec 64)) (_2!4012 V!17219)) )
))
(declare-datatypes ((List!8065 0))(
  ( (Nil!8062) (Cons!8061 (h!8917 tuple2!8002) (t!13835 List!8065)) )
))
(declare-datatypes ((ListLongMap!6915 0))(
  ( (ListLongMap!6916 (toList!3473 List!8065)) )
))
(declare-fun call!29854 () ListLongMap!6915)

(declare-fun e!264441 () Bool)

(declare-fun call!29855 () ListLongMap!6915)

(declare-fun b!451412 () Bool)

(declare-fun v!412 () V!17219)

(declare-fun +!1553 (ListLongMap!6915 tuple2!8002) ListLongMap!6915)

(assert (=> b!451412 (= e!264441 (= call!29855 (+!1553 call!29854 (tuple2!8003 k!794 v!412))))))

(declare-fun res!268761 () Bool)

(assert (=> start!40758 (=> (not res!268761) (not e!264438))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40758 (= res!268761 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13785 _keys!709))))))

(assert (=> start!40758 e!264438))

(declare-fun tp_is_empty!12085 () Bool)

(assert (=> start!40758 tp_is_empty!12085))

(assert (=> start!40758 tp!38064))

(assert (=> start!40758 true))

(declare-fun e!264440 () Bool)

(declare-fun array_inv!9728 (array!27979) Bool)

(assert (=> start!40758 (and (array_inv!9728 _values!549) e!264440)))

(declare-fun array_inv!9729 (array!27977) Bool)

(assert (=> start!40758 (array_inv!9729 _keys!709)))

(declare-fun defaultEntry!557 () Int)

(declare-fun c!56069 () Bool)

(declare-fun zeroValue!515 () V!17219)

(declare-fun bm!29851 () Bool)

(declare-fun minValue!515 () V!17219)

(declare-fun lt!204920 () array!27979)

(declare-fun getCurrentListMapNoExtraKeys!1657 (array!27977 array!27979 (_ BitVec 32) (_ BitVec 32) V!17219 V!17219 (_ BitVec 32) Int) ListLongMap!6915)

(assert (=> bm!29851 (= call!29854 (getCurrentListMapNoExtraKeys!1657 (ite c!56069 _keys!709 lt!204922) (ite c!56069 _values!549 lt!204920) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451413 () Bool)

(declare-fun e!264446 () Bool)

(declare-fun mapRes!19764 () Bool)

(assert (=> b!451413 (= e!264440 (and e!264446 mapRes!19764))))

(declare-fun condMapEmpty!19764 () Bool)

(declare-fun mapDefault!19764 () ValueCell!5699)

