; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20554 () Bool)

(assert start!20554)

(declare-fun b_free!5213 () Bool)

(declare-fun b_next!5213 () Bool)

(assert (=> start!20554 (= b_free!5213 (not b_next!5213))))

(declare-fun tp!18670 () Bool)

(declare-fun b_and!11959 () Bool)

(assert (=> start!20554 (= tp!18670 b_and!11959)))

(declare-fun mapNonEmpty!8672 () Bool)

(declare-fun mapRes!8672 () Bool)

(declare-fun tp!18671 () Bool)

(declare-fun e!133784 () Bool)

(assert (=> mapNonEmpty!8672 (= mapRes!8672 (and tp!18671 e!133784))))

(declare-datatypes ((V!6405 0))(
  ( (V!6406 (val!2579 Int)) )
))
(declare-datatypes ((ValueCell!2191 0))(
  ( (ValueCellFull!2191 (v!4549 V!6405)) (EmptyCell!2191) )
))
(declare-fun mapValue!8672 () ValueCell!2191)

(declare-fun mapKey!8672 () (_ BitVec 32))

(declare-datatypes ((array!9355 0))(
  ( (array!9356 (arr!4428 (Array (_ BitVec 32) ValueCell!2191)) (size!4753 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9355)

(declare-fun mapRest!8672 () (Array (_ BitVec 32) ValueCell!2191))

(assert (=> mapNonEmpty!8672 (= (arr!4428 _values!649) (store mapRest!8672 mapKey!8672 mapValue!8672))))

(declare-fun b!204479 () Bool)

(declare-fun res!98540 () Bool)

(declare-fun e!133788 () Bool)

(assert (=> b!204479 (=> (not res!98540) (not e!133788))))

(declare-datatypes ((array!9357 0))(
  ( (array!9358 (arr!4429 (Array (_ BitVec 32) (_ BitVec 64))) (size!4754 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9357)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!204479 (= res!98540 (and (= (size!4753 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4754 _keys!825) (size!4753 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204480 () Bool)

(declare-fun e!133787 () Bool)

(declare-fun e!133789 () Bool)

(assert (=> b!204480 (= e!133787 (and e!133789 mapRes!8672))))

(declare-fun condMapEmpty!8672 () Bool)

(declare-fun mapDefault!8672 () ValueCell!2191)

