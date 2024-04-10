; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40782 () Bool)

(assert start!40782)

(declare-fun b_free!10771 () Bool)

(declare-fun b_next!10771 () Bool)

(assert (=> start!40782 (= b_free!10771 (not b_next!10771))))

(declare-fun tp!38135 () Bool)

(declare-fun b_and!18829 () Bool)

(assert (=> start!40782 (= tp!38135 b_and!18829)))

(declare-fun b!452117 () Bool)

(declare-fun res!269260 () Bool)

(declare-fun e!264763 () Bool)

(assert (=> b!452117 (=> (not res!269260) (not e!264763))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452117 (= res!269260 (validMask!0 mask!1025))))

(declare-fun b!452118 () Bool)

(declare-fun res!269258 () Bool)

(assert (=> b!452118 (=> (not res!269258) (not e!264763))))

(declare-datatypes ((array!28025 0))(
  ( (array!28026 (arr!13457 (Array (_ BitVec 32) (_ BitVec 64))) (size!13809 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28025)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28025 (_ BitVec 32)) Bool)

(assert (=> b!452118 (= res!269258 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452119 () Bool)

(declare-fun e!264769 () Bool)

(declare-fun e!264770 () Bool)

(declare-fun mapRes!19800 () Bool)

(assert (=> b!452119 (= e!264769 (and e!264770 mapRes!19800))))

(declare-fun condMapEmpty!19800 () Bool)

(declare-datatypes ((V!17251 0))(
  ( (V!17252 (val!6099 Int)) )
))
(declare-datatypes ((ValueCell!5711 0))(
  ( (ValueCellFull!5711 (v!8358 V!17251)) (EmptyCell!5711) )
))
(declare-datatypes ((array!28027 0))(
  ( (array!28028 (arr!13458 (Array (_ BitVec 32) ValueCell!5711)) (size!13810 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28027)

(declare-fun mapDefault!19800 () ValueCell!5711)

