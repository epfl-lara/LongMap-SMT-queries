; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40312 () Bool)

(assert start!40312)

(declare-fun b!442659 () Bool)

(declare-fun e!260543 () Bool)

(assert (=> b!442659 (= e!260543 false)))

(declare-fun lt!203231 () Bool)

(declare-datatypes ((array!27233 0))(
  ( (array!27234 (arr!13065 (Array (_ BitVec 32) (_ BitVec 64))) (size!13417 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27233)

(declare-datatypes ((List!7842 0))(
  ( (Nil!7839) (Cons!7838 (h!8694 (_ BitVec 64)) (t!13600 List!7842)) )
))
(declare-fun arrayNoDuplicates!0 (array!27233 (_ BitVec 32) List!7842) Bool)

(assert (=> b!442659 (= lt!203231 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7839))))

(declare-fun b!442660 () Bool)

(declare-fun e!260541 () Bool)

(declare-fun e!260542 () Bool)

(declare-fun mapRes!19191 () Bool)

(assert (=> b!442660 (= e!260541 (and e!260542 mapRes!19191))))

(declare-fun condMapEmpty!19191 () Bool)

(declare-datatypes ((V!16719 0))(
  ( (V!16720 (val!5900 Int)) )
))
(declare-datatypes ((ValueCell!5512 0))(
  ( (ValueCellFull!5512 (v!8151 V!16719)) (EmptyCell!5512) )
))
(declare-datatypes ((array!27235 0))(
  ( (array!27236 (arr!13066 (Array (_ BitVec 32) ValueCell!5512)) (size!13418 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27235)

(declare-fun mapDefault!19191 () ValueCell!5512)

