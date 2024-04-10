; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35558 () Bool)

(assert start!35558)

(declare-fun b!356394 () Bool)

(declare-fun e!218381 () Bool)

(declare-fun e!218379 () Bool)

(declare-fun mapRes!13524 () Bool)

(assert (=> b!356394 (= e!218381 (and e!218379 mapRes!13524))))

(declare-fun condMapEmpty!13524 () Bool)

(declare-datatypes ((V!11659 0))(
  ( (V!11660 (val!4050 Int)) )
))
(declare-datatypes ((ValueCell!3662 0))(
  ( (ValueCellFull!3662 (v!6244 V!11659)) (EmptyCell!3662) )
))
(declare-datatypes ((array!19593 0))(
  ( (array!19594 (arr!9290 (Array (_ BitVec 32) ValueCell!3662)) (size!9642 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19593)

(declare-fun mapDefault!13524 () ValueCell!3662)

