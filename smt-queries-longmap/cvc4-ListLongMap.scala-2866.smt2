; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41276 () Bool)

(assert start!41276)

(declare-fun b!461827 () Bool)

(declare-fun e!269346 () Bool)

(declare-fun tp_is_empty!12437 () Bool)

(assert (=> b!461827 (= e!269346 tp_is_empty!12437)))

(declare-fun b!461828 () Bool)

(declare-fun e!269345 () Bool)

(declare-fun e!269344 () Bool)

(declare-fun mapRes!20311 () Bool)

(assert (=> b!461828 (= e!269345 (and e!269344 mapRes!20311))))

(declare-fun condMapEmpty!20311 () Bool)

(declare-datatypes ((V!17687 0))(
  ( (V!17688 (val!6263 Int)) )
))
(declare-datatypes ((ValueCell!5875 0))(
  ( (ValueCellFull!5875 (v!8549 V!17687)) (EmptyCell!5875) )
))
(declare-datatypes ((array!28675 0))(
  ( (array!28676 (arr!13776 (Array (_ BitVec 32) ValueCell!5875)) (size!14128 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28675)

(declare-fun mapDefault!20311 () ValueCell!5875)

