; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75724 () Bool)

(assert start!75724)

(declare-fun b!890334 () Bool)

(declare-fun b_free!15695 () Bool)

(declare-fun b_next!15695 () Bool)

(assert (=> b!890334 (= b_free!15695 (not b_next!15695))))

(declare-fun tp!55054 () Bool)

(declare-fun b_and!25935 () Bool)

(assert (=> b!890334 (= tp!55054 b_and!25935)))

(declare-fun b!890333 () Bool)

(declare-fun res!603255 () Bool)

(declare-fun e!496547 () Bool)

(assert (=> b!890333 (=> res!603255 e!496547)))

(declare-datatypes ((array!52026 0))(
  ( (array!52027 (arr!25019 (Array (_ BitVec 32) (_ BitVec 64))) (size!25463 (_ BitVec 32))) )
))
(declare-datatypes ((V!28995 0))(
  ( (V!28996 (val!9062 Int)) )
))
(declare-datatypes ((ValueCell!8530 0))(
  ( (ValueCellFull!8530 (v!11540 V!28995)) (EmptyCell!8530) )
))
(declare-datatypes ((array!52028 0))(
  ( (array!52029 (arr!25020 (Array (_ BitVec 32) ValueCell!8530)) (size!25464 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4076 0))(
  ( (LongMapFixedSize!4077 (defaultEntry!5235 Int) (mask!25706 (_ BitVec 32)) (extraKeys!4929 (_ BitVec 32)) (zeroValue!5033 V!28995) (minValue!5033 V!28995) (_size!2093 (_ BitVec 32)) (_keys!9918 array!52026) (_values!5220 array!52028) (_vacant!2093 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4076)

(assert (=> b!890333 (= res!603255 (or (not (= (size!25464 (_values!5220 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25706 thiss!1181)))) (not (= (size!25463 (_keys!9918 thiss!1181)) (size!25464 (_values!5220 thiss!1181)))) (bvslt (mask!25706 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4929 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4929 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!496542 () Bool)

(declare-fun tp_is_empty!18023 () Bool)

(declare-fun e!496548 () Bool)

(declare-fun array_inv!19670 (array!52026) Bool)

(declare-fun array_inv!19671 (array!52028) Bool)

(assert (=> b!890334 (= e!496542 (and tp!55054 tp_is_empty!18023 (array_inv!19670 (_keys!9918 thiss!1181)) (array_inv!19671 (_values!5220 thiss!1181)) e!496548))))

(declare-fun b!890335 () Bool)

(declare-fun e!496545 () Bool)

(declare-datatypes ((SeekEntryResult!8797 0))(
  ( (MissingZero!8797 (index!37559 (_ BitVec 32))) (Found!8797 (index!37560 (_ BitVec 32))) (Intermediate!8797 (undefined!9609 Bool) (index!37561 (_ BitVec 32)) (x!75629 (_ BitVec 32))) (Undefined!8797) (MissingVacant!8797 (index!37562 (_ BitVec 32))) )
))
(declare-fun lt!402262 () SeekEntryResult!8797)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890335 (= e!496545 (inRange!0 (index!37560 lt!402262) (mask!25706 thiss!1181)))))

(declare-fun b!890336 () Bool)

(declare-fun e!496540 () Bool)

(assert (=> b!890336 (= e!496540 tp_is_empty!18023)))

(declare-fun b!890337 () Bool)

(declare-fun e!496541 () Bool)

(declare-fun mapRes!28589 () Bool)

(assert (=> b!890337 (= e!496548 (and e!496541 mapRes!28589))))

(declare-fun condMapEmpty!28589 () Bool)

(declare-fun mapDefault!28589 () ValueCell!8530)

