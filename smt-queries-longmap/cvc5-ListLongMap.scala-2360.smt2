; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37622 () Bool)

(assert start!37622)

(declare-fun b_free!8749 () Bool)

(declare-fun b_next!8749 () Bool)

(assert (=> start!37622 (= b_free!8749 (not b_next!8749))))

(declare-fun tp!30962 () Bool)

(declare-fun b_and!15991 () Bool)

(assert (=> start!37622 (= tp!30962 b_and!15991)))

(declare-fun res!219555 () Bool)

(declare-fun e!233694 () Bool)

(assert (=> start!37622 (=> (not res!219555) (not e!233694))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37622 (= res!219555 (validMask!0 mask!970))))

(assert (=> start!37622 e!233694))

(declare-datatypes ((V!13635 0))(
  ( (V!13636 (val!4743 Int)) )
))
(declare-datatypes ((ValueCell!4355 0))(
  ( (ValueCellFull!4355 (v!6940 V!13635)) (EmptyCell!4355) )
))
(declare-datatypes ((array!22695 0))(
  ( (array!22696 (arr!10816 (Array (_ BitVec 32) ValueCell!4355)) (size!11168 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22695)

(declare-fun e!233695 () Bool)

(declare-fun array_inv!7962 (array!22695) Bool)

(assert (=> start!37622 (and (array_inv!7962 _values!506) e!233695)))

(assert (=> start!37622 tp!30962))

(assert (=> start!37622 true))

(declare-fun tp_is_empty!9397 () Bool)

(assert (=> start!37622 tp_is_empty!9397))

(declare-datatypes ((array!22697 0))(
  ( (array!22698 (arr!10817 (Array (_ BitVec 32) (_ BitVec 64))) (size!11169 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22697)

(declare-fun array_inv!7963 (array!22697) Bool)

(assert (=> start!37622 (array_inv!7963 _keys!658)))

(declare-fun b!385015 () Bool)

(declare-fun e!233696 () Bool)

(assert (=> b!385015 (= e!233696 true)))

(declare-datatypes ((tuple2!6388 0))(
  ( (tuple2!6389 (_1!3205 (_ BitVec 64)) (_2!3205 V!13635)) )
))
(declare-datatypes ((List!6224 0))(
  ( (Nil!6221) (Cons!6220 (h!7076 tuple2!6388) (t!11374 List!6224)) )
))
(declare-datatypes ((ListLongMap!5301 0))(
  ( (ListLongMap!5302 (toList!2666 List!6224)) )
))
(declare-fun lt!181345 () ListLongMap!5301)

(declare-fun lt!181346 () ListLongMap!5301)

(declare-fun lt!181340 () tuple2!6388)

(declare-fun +!1001 (ListLongMap!5301 tuple2!6388) ListLongMap!5301)

(assert (=> b!385015 (= lt!181345 (+!1001 lt!181346 lt!181340))))

(declare-fun lt!181343 () ListLongMap!5301)

(declare-fun lt!181337 () ListLongMap!5301)

(assert (=> b!385015 (= lt!181343 lt!181337)))

(declare-fun b!385016 () Bool)

(declare-fun res!219554 () Bool)

(assert (=> b!385016 (=> (not res!219554) (not e!233694))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!385016 (= res!219554 (or (= (select (arr!10817 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10817 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15660 () Bool)

(declare-fun mapRes!15660 () Bool)

(declare-fun tp!30963 () Bool)

(declare-fun e!233697 () Bool)

(assert (=> mapNonEmpty!15660 (= mapRes!15660 (and tp!30963 e!233697))))

(declare-fun mapValue!15660 () ValueCell!4355)

(declare-fun mapKey!15660 () (_ BitVec 32))

(declare-fun mapRest!15660 () (Array (_ BitVec 32) ValueCell!4355))

(assert (=> mapNonEmpty!15660 (= (arr!10816 _values!506) (store mapRest!15660 mapKey!15660 mapValue!15660))))

(declare-fun b!385017 () Bool)

(assert (=> b!385017 (= e!233697 tp_is_empty!9397)))

(declare-fun b!385018 () Bool)

(declare-fun res!219552 () Bool)

(assert (=> b!385018 (=> (not res!219552) (not e!233694))))

(assert (=> b!385018 (= res!219552 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11169 _keys!658))))))

(declare-fun b!385019 () Bool)

(declare-fun res!219553 () Bool)

(assert (=> b!385019 (=> (not res!219553) (not e!233694))))

(declare-fun k!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22697 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!385019 (= res!219553 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!385020 () Bool)

(declare-fun e!233693 () Bool)

(assert (=> b!385020 (= e!233695 (and e!233693 mapRes!15660))))

(declare-fun condMapEmpty!15660 () Bool)

(declare-fun mapDefault!15660 () ValueCell!4355)

