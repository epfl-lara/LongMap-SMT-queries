; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20784 () Bool)

(assert start!20784)

(declare-fun b_free!5437 () Bool)

(declare-fun b_next!5437 () Bool)

(assert (=> start!20784 (= b_free!5437 (not b_next!5437))))

(declare-fun tp!19352 () Bool)

(declare-fun b_and!12183 () Bool)

(assert (=> start!20784 (= tp!19352 b_and!12183)))

(declare-fun b!208220 () Bool)

(declare-fun res!101246 () Bool)

(declare-fun e!135837 () Bool)

(assert (=> b!208220 (=> (not res!101246) (not e!135837))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9803 0))(
  ( (array!9804 (arr!4652 (Array (_ BitVec 32) (_ BitVec 64))) (size!4977 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9803)

(assert (=> b!208220 (= res!101246 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4977 _keys!825))))))

(declare-fun b!208221 () Bool)

(declare-fun res!101247 () Bool)

(assert (=> b!208221 (=> (not res!101247) (not e!135837))))

(declare-datatypes ((List!2979 0))(
  ( (Nil!2976) (Cons!2975 (h!3617 (_ BitVec 64)) (t!7910 List!2979)) )
))
(declare-fun arrayNoDuplicates!0 (array!9803 (_ BitVec 32) List!2979) Bool)

(assert (=> b!208221 (= res!101247 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2976))))

(declare-fun b!208222 () Bool)

(declare-fun e!135836 () Bool)

(declare-fun tp_is_empty!5299 () Bool)

(assert (=> b!208222 (= e!135836 tp_is_empty!5299)))

(declare-fun b!208223 () Bool)

(declare-fun e!135838 () Bool)

(declare-fun e!135835 () Bool)

(declare-fun mapRes!9017 () Bool)

(assert (=> b!208223 (= e!135838 (and e!135835 mapRes!9017))))

(declare-fun condMapEmpty!9017 () Bool)

(declare-datatypes ((V!6713 0))(
  ( (V!6714 (val!2694 Int)) )
))
(declare-datatypes ((ValueCell!2306 0))(
  ( (ValueCellFull!2306 (v!4664 V!6713)) (EmptyCell!2306) )
))
(declare-datatypes ((array!9805 0))(
  ( (array!9806 (arr!4653 (Array (_ BitVec 32) ValueCell!2306)) (size!4978 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9805)

(declare-fun mapDefault!9017 () ValueCell!2306)

