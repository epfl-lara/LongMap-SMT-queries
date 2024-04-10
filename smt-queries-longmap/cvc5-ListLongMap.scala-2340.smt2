; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37502 () Bool)

(assert start!37502)

(declare-fun b_free!8629 () Bool)

(declare-fun b_next!8629 () Bool)

(assert (=> start!37502 (= b_free!8629 (not b_next!8629))))

(declare-fun tp!30602 () Bool)

(declare-fun b_and!15871 () Bool)

(assert (=> start!37502 (= tp!30602 b_and!15871)))

(declare-fun b!382486 () Bool)

(declare-fun res!217567 () Bool)

(declare-fun e!232428 () Bool)

(assert (=> b!382486 (=> (not res!217567) (not e!232428))))

(declare-datatypes ((array!22463 0))(
  ( (array!22464 (arr!10700 (Array (_ BitVec 32) (_ BitVec 64))) (size!11052 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22463)

(declare-datatypes ((List!6127 0))(
  ( (Nil!6124) (Cons!6123 (h!6979 (_ BitVec 64)) (t!11277 List!6127)) )
))
(declare-fun arrayNoDuplicates!0 (array!22463 (_ BitVec 32) List!6127) Bool)

(assert (=> b!382486 (= res!217567 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6124))))

(declare-fun b!382487 () Bool)

(declare-fun res!217564 () Bool)

(assert (=> b!382487 (=> (not res!217564) (not e!232428))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13475 0))(
  ( (V!13476 (val!4683 Int)) )
))
(declare-datatypes ((ValueCell!4295 0))(
  ( (ValueCellFull!4295 (v!6880 V!13475)) (EmptyCell!4295) )
))
(declare-datatypes ((array!22465 0))(
  ( (array!22466 (arr!10701 (Array (_ BitVec 32) ValueCell!4295)) (size!11053 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22465)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!382487 (= res!217564 (and (= (size!11053 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11052 _keys!658) (size!11053 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382488 () Bool)

(declare-fun e!232430 () Bool)

(declare-fun tp_is_empty!9277 () Bool)

(assert (=> b!382488 (= e!232430 tp_is_empty!9277)))

(declare-fun b!382489 () Bool)

(declare-fun e!232425 () Bool)

(assert (=> b!382489 (= e!232425 true)))

(declare-datatypes ((tuple2!6296 0))(
  ( (tuple2!6297 (_1!3159 (_ BitVec 64)) (_2!3159 V!13475)) )
))
(declare-datatypes ((List!6128 0))(
  ( (Nil!6125) (Cons!6124 (h!6980 tuple2!6296) (t!11278 List!6128)) )
))
(declare-datatypes ((ListLongMap!5209 0))(
  ( (ListLongMap!5210 (toList!2620 List!6128)) )
))
(declare-fun lt!179457 () ListLongMap!5209)

(declare-fun lt!179455 () ListLongMap!5209)

(assert (=> b!382489 (= lt!179457 lt!179455)))

(declare-fun b!382490 () Bool)

(declare-fun e!232429 () Bool)

(assert (=> b!382490 (= e!232429 tp_is_empty!9277)))

(declare-fun b!382491 () Bool)

(declare-fun e!232427 () Bool)

(declare-fun mapRes!15480 () Bool)

(assert (=> b!382491 (= e!232427 (and e!232430 mapRes!15480))))

(declare-fun condMapEmpty!15480 () Bool)

(declare-fun mapDefault!15480 () ValueCell!4295)

