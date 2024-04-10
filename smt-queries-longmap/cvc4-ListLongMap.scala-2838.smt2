; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40996 () Bool)

(assert start!40996)

(declare-fun b_free!10931 () Bool)

(declare-fun b_next!10931 () Bool)

(assert (=> start!40996 (= b_free!10931 (not b_next!10931))))

(declare-fun tp!38619 () Bool)

(declare-fun b_and!19073 () Bool)

(assert (=> start!40996 (= tp!38619 b_and!19073)))

(declare-fun b!456589 () Bool)

(declare-fun res!272491 () Bool)

(declare-fun e!266754 () Bool)

(assert (=> b!456589 (=> (not res!272491) (not e!266754))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456589 (= res!272491 (validMask!0 mask!1025))))

(declare-fun b!456590 () Bool)

(declare-fun e!266749 () Bool)

(declare-fun e!266755 () Bool)

(declare-fun mapRes!20044 () Bool)

(assert (=> b!456590 (= e!266749 (and e!266755 mapRes!20044))))

(declare-fun condMapEmpty!20044 () Bool)

(declare-datatypes ((V!17463 0))(
  ( (V!17464 (val!6179 Int)) )
))
(declare-datatypes ((ValueCell!5791 0))(
  ( (ValueCellFull!5791 (v!8445 V!17463)) (EmptyCell!5791) )
))
(declare-datatypes ((array!28341 0))(
  ( (array!28342 (arr!13614 (Array (_ BitVec 32) ValueCell!5791)) (size!13966 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28341)

(declare-fun mapDefault!20044 () ValueCell!5791)

