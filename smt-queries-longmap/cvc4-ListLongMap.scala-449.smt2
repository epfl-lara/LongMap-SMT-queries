; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8310 () Bool)

(assert start!8310)

(declare-fun b!54456 () Bool)

(declare-fun b_free!1785 () Bool)

(declare-fun b_next!1785 () Bool)

(assert (=> b!54456 (= b_free!1785 (not b_next!1785))))

(declare-fun tp!7456 () Bool)

(declare-fun b_and!3111 () Bool)

(assert (=> b!54456 (= tp!7456 b_and!3111)))

(declare-fun b!54451 () Bool)

(declare-fun b_free!1787 () Bool)

(declare-fun b_next!1787 () Bool)

(assert (=> b!54451 (= b_free!1787 (not b_next!1787))))

(declare-fun tp!7457 () Bool)

(declare-fun b_and!3113 () Bool)

(assert (=> b!54451 (= tp!7457 b_and!3113)))

(declare-fun res!30817 () Bool)

(declare-fun e!35567 () Bool)

(assert (=> start!8310 (=> (not res!30817) (not e!35567))))

(declare-datatypes ((V!2725 0))(
  ( (V!2726 (val!1199 Int)) )
))
(declare-datatypes ((array!3541 0))(
  ( (array!3542 (arr!1693 (Array (_ BitVec 32) (_ BitVec 64))) (size!1922 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!811 0))(
  ( (ValueCellFull!811 (v!2284 V!2725)) (EmptyCell!811) )
))
(declare-datatypes ((array!3543 0))(
  ( (array!3544 (arr!1694 (Array (_ BitVec 32) ValueCell!811)) (size!1923 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!530 0))(
  ( (LongMapFixedSize!531 (defaultEntry!1979 Int) (mask!5824 (_ BitVec 32)) (extraKeys!1870 (_ BitVec 32)) (zeroValue!1897 V!2725) (minValue!1897 V!2725) (_size!314 (_ BitVec 32)) (_keys!3599 array!3541) (_values!1962 array!3543) (_vacant!314 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!346 0))(
  ( (Cell!347 (v!2285 LongMapFixedSize!530)) )
))
(declare-datatypes ((LongMap!346 0))(
  ( (LongMap!347 (underlying!184 Cell!346)) )
))
(declare-fun thiss!992 () LongMap!346)

(declare-fun valid!205 (LongMap!346) Bool)

(assert (=> start!8310 (= res!30817 (valid!205 thiss!992))))

(assert (=> start!8310 e!35567))

(declare-fun e!35553 () Bool)

(assert (=> start!8310 e!35553))

(assert (=> start!8310 true))

(declare-fun e!35566 () Bool)

(assert (=> start!8310 e!35566))

(declare-fun b!54445 () Bool)

(declare-fun e!35558 () Bool)

(declare-fun e!35562 () Bool)

(declare-fun mapRes!2597 () Bool)

(assert (=> b!54445 (= e!35558 (and e!35562 mapRes!2597))))

(declare-fun condMapEmpty!2598 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!530)

(declare-fun mapDefault!2597 () ValueCell!811)

