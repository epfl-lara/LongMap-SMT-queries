; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41002 () Bool)

(assert start!41002)

(declare-fun b_free!10937 () Bool)

(declare-fun b_next!10937 () Bool)

(assert (=> start!41002 (= b_free!10937 (not b_next!10937))))

(declare-fun tp!38638 () Bool)

(declare-fun b_and!19079 () Bool)

(assert (=> start!41002 (= tp!38638 b_and!19079)))

(declare-fun b!456741 () Bool)

(declare-fun res!272623 () Bool)

(declare-fun e!266826 () Bool)

(assert (=> b!456741 (=> (not res!272623) (not e!266826))))

(declare-datatypes ((array!28351 0))(
  ( (array!28352 (arr!13619 (Array (_ BitVec 32) (_ BitVec 64))) (size!13971 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28351)

(declare-datatypes ((List!8217 0))(
  ( (Nil!8214) (Cons!8213 (h!9069 (_ BitVec 64)) (t!14045 List!8217)) )
))
(declare-fun arrayNoDuplicates!0 (array!28351 (_ BitVec 32) List!8217) Bool)

(assert (=> b!456741 (= res!272623 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8214))))

(declare-fun b!456742 () Bool)

(declare-fun e!266821 () Bool)

(declare-fun e!266823 () Bool)

(declare-fun mapRes!20053 () Bool)

(assert (=> b!456742 (= e!266821 (and e!266823 mapRes!20053))))

(declare-fun condMapEmpty!20053 () Bool)

(declare-datatypes ((V!17471 0))(
  ( (V!17472 (val!6182 Int)) )
))
(declare-datatypes ((ValueCell!5794 0))(
  ( (ValueCellFull!5794 (v!8448 V!17471)) (EmptyCell!5794) )
))
(declare-datatypes ((array!28353 0))(
  ( (array!28354 (arr!13620 (Array (_ BitVec 32) ValueCell!5794)) (size!13972 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28353)

(declare-fun mapDefault!20053 () ValueCell!5794)

