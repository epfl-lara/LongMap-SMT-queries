; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82398 () Bool)

(assert start!82398)

(declare-fun b_free!18665 () Bool)

(declare-fun b_next!18665 () Bool)

(assert (=> start!82398 (= b_free!18665 (not b_next!18665))))

(declare-fun tp!64965 () Bool)

(declare-fun b_and!30153 () Bool)

(assert (=> start!82398 (= tp!64965 b_and!30153)))

(declare-fun b!960808 () Bool)

(declare-fun res!643154 () Bool)

(declare-fun e!541604 () Bool)

(assert (=> b!960808 (=> (not res!643154) (not e!541604))))

(declare-datatypes ((array!58843 0))(
  ( (array!58844 (arr!28295 (Array (_ BitVec 32) (_ BitVec 64))) (size!28774 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58843)

(declare-datatypes ((List!19676 0))(
  ( (Nil!19673) (Cons!19672 (h!20834 (_ BitVec 64)) (t!28039 List!19676)) )
))
(declare-fun arrayNoDuplicates!0 (array!58843 (_ BitVec 32) List!19676) Bool)

(assert (=> b!960808 (= res!643154 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19673))))

(declare-fun b!960809 () Bool)

(declare-fun e!541602 () Bool)

(declare-fun e!541601 () Bool)

(declare-fun mapRes!34045 () Bool)

(assert (=> b!960809 (= e!541602 (and e!541601 mapRes!34045))))

(declare-fun condMapEmpty!34045 () Bool)

(declare-datatypes ((V!33485 0))(
  ( (V!33486 (val!10739 Int)) )
))
(declare-datatypes ((ValueCell!10207 0))(
  ( (ValueCellFull!10207 (v!13296 V!33485)) (EmptyCell!10207) )
))
(declare-datatypes ((array!58845 0))(
  ( (array!58846 (arr!28296 (Array (_ BitVec 32) ValueCell!10207)) (size!28775 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58845)

(declare-fun mapDefault!34045 () ValueCell!10207)

