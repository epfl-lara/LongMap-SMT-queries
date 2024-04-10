; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37326 () Bool)

(assert start!37326)

(declare-fun b_free!8453 () Bool)

(declare-fun b_next!8453 () Bool)

(assert (=> start!37326 (= b_free!8453 (not b_next!8453))))

(declare-fun tp!30075 () Bool)

(declare-fun b_and!15695 () Bool)

(assert (=> start!37326 (= tp!30075 b_and!15695)))

(declare-fun res!214523 () Bool)

(declare-fun e!230437 () Bool)

(assert (=> start!37326 (=> (not res!214523) (not e!230437))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37326 (= res!214523 (validMask!0 mask!970))))

(assert (=> start!37326 e!230437))

(declare-datatypes ((V!13239 0))(
  ( (V!13240 (val!4595 Int)) )
))
(declare-datatypes ((ValueCell!4207 0))(
  ( (ValueCellFull!4207 (v!6792 V!13239)) (EmptyCell!4207) )
))
(declare-datatypes ((array!22127 0))(
  ( (array!22128 (arr!10532 (Array (_ BitVec 32) ValueCell!4207)) (size!10884 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22127)

(declare-fun e!230431 () Bool)

(declare-fun array_inv!7756 (array!22127) Bool)

(assert (=> start!37326 (and (array_inv!7756 _values!506) e!230431)))

(assert (=> start!37326 tp!30075))

(assert (=> start!37326 true))

(declare-fun tp_is_empty!9101 () Bool)

(assert (=> start!37326 tp_is_empty!9101))

(declare-datatypes ((array!22129 0))(
  ( (array!22130 (arr!10533 (Array (_ BitVec 32) (_ BitVec 64))) (size!10885 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22129)

(declare-fun array_inv!7757 (array!22129) Bool)

(assert (=> start!37326 (array_inv!7757 _keys!658)))

(declare-fun b!378645 () Bool)

(declare-fun res!214520 () Bool)

(assert (=> b!378645 (=> (not res!214520) (not e!230437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22129 (_ BitVec 32)) Bool)

(assert (=> b!378645 (= res!214520 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!378646 () Bool)

(declare-fun e!230436 () Bool)

(declare-fun mapRes!15216 () Bool)

(assert (=> b!378646 (= e!230431 (and e!230436 mapRes!15216))))

(declare-fun condMapEmpty!15216 () Bool)

(declare-fun mapDefault!15216 () ValueCell!4207)

