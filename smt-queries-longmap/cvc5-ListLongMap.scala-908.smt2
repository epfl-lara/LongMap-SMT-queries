; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20544 () Bool)

(assert start!20544)

(declare-fun b_free!5203 () Bool)

(declare-fun b_next!5203 () Bool)

(assert (=> start!20544 (= b_free!5203 (not b_next!5203))))

(declare-fun tp!18641 () Bool)

(declare-fun b_and!11949 () Bool)

(assert (=> start!20544 (= tp!18641 b_and!11949)))

(declare-fun b!204291 () Bool)

(declare-fun res!98399 () Bool)

(declare-fun e!133680 () Bool)

(assert (=> b!204291 (=> (not res!98399) (not e!133680))))

(declare-datatypes ((array!9335 0))(
  ( (array!9336 (arr!4418 (Array (_ BitVec 32) (_ BitVec 64))) (size!4743 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9335)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9335 (_ BitVec 32)) Bool)

(assert (=> b!204291 (= res!98399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204292 () Bool)

(declare-fun res!98395 () Bool)

(assert (=> b!204292 (=> (not res!98395) (not e!133680))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6393 0))(
  ( (V!6394 (val!2574 Int)) )
))
(declare-datatypes ((ValueCell!2186 0))(
  ( (ValueCellFull!2186 (v!4544 V!6393)) (EmptyCell!2186) )
))
(declare-datatypes ((array!9337 0))(
  ( (array!9338 (arr!4419 (Array (_ BitVec 32) ValueCell!2186)) (size!4744 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9337)

(assert (=> b!204292 (= res!98395 (and (= (size!4744 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4743 _keys!825) (size!4744 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204293 () Bool)

(declare-fun res!98400 () Bool)

(assert (=> b!204293 (=> (not res!98400) (not e!133680))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204293 (= res!98400 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4743 _keys!825))))))

(declare-fun b!204294 () Bool)

(declare-fun e!133679 () Bool)

(declare-fun e!133681 () Bool)

(declare-fun mapRes!8657 () Bool)

(assert (=> b!204294 (= e!133679 (and e!133681 mapRes!8657))))

(declare-fun condMapEmpty!8657 () Bool)

(declare-fun mapDefault!8657 () ValueCell!2186)

