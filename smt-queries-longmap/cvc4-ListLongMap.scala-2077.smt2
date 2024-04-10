; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35634 () Bool)

(assert start!35634)

(declare-fun b_free!7889 () Bool)

(declare-fun b_next!7889 () Bool)

(assert (=> start!35634 (= b_free!7889 (not b_next!7889))))

(declare-fun tp!27651 () Bool)

(declare-fun b_and!15131 () Bool)

(assert (=> start!35634 (= tp!27651 b_and!15131)))

(declare-fun b!357683 () Bool)

(declare-fun res!198699 () Bool)

(declare-fun e!218982 () Bool)

(assert (=> b!357683 (=> (not res!198699) (not e!218982))))

(declare-datatypes ((array!19741 0))(
  ( (array!19742 (arr!9364 (Array (_ BitVec 32) (_ BitVec 64))) (size!9716 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19741)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19741 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!357683 (= res!198699 (arrayContainsKey!0 _keys!1456 k!1077 from!1805))))

(declare-fun mapNonEmpty!13638 () Bool)

(declare-fun mapRes!13638 () Bool)

(declare-fun tp!27650 () Bool)

(declare-fun e!218983 () Bool)

(assert (=> mapNonEmpty!13638 (= mapRes!13638 (and tp!27650 e!218983))))

(declare-datatypes ((V!11759 0))(
  ( (V!11760 (val!4088 Int)) )
))
(declare-datatypes ((ValueCell!3700 0))(
  ( (ValueCellFull!3700 (v!6282 V!11759)) (EmptyCell!3700) )
))
(declare-datatypes ((array!19743 0))(
  ( (array!19744 (arr!9365 (Array (_ BitVec 32) ValueCell!3700)) (size!9717 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19743)

(declare-fun mapValue!13638 () ValueCell!3700)

(declare-fun mapRest!13638 () (Array (_ BitVec 32) ValueCell!3700))

(declare-fun mapKey!13638 () (_ BitVec 32))

(assert (=> mapNonEmpty!13638 (= (arr!9365 _values!1208) (store mapRest!13638 mapKey!13638 mapValue!13638))))

(declare-fun b!357685 () Bool)

(declare-fun tp_is_empty!8087 () Bool)

(assert (=> b!357685 (= e!218983 tp_is_empty!8087)))

(declare-fun b!357686 () Bool)

(declare-fun e!218984 () Bool)

(declare-fun e!218987 () Bool)

(assert (=> b!357686 (= e!218984 (and e!218987 mapRes!13638))))

(declare-fun condMapEmpty!13638 () Bool)

(declare-fun mapDefault!13638 () ValueCell!3700)

