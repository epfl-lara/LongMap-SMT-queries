; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82410 () Bool)

(assert start!82410)

(declare-fun b!960940 () Bool)

(declare-fun e!541692 () Bool)

(declare-fun e!541694 () Bool)

(declare-fun mapRes!34063 () Bool)

(assert (=> b!960940 (= e!541692 (and e!541694 mapRes!34063))))

(declare-fun condMapEmpty!34063 () Bool)

(declare-datatypes ((V!33501 0))(
  ( (V!33502 (val!10745 Int)) )
))
(declare-datatypes ((ValueCell!10213 0))(
  ( (ValueCellFull!10213 (v!13302 V!33501)) (EmptyCell!10213) )
))
(declare-datatypes ((array!58867 0))(
  ( (array!58868 (arr!28307 (Array (_ BitVec 32) ValueCell!10213)) (size!28786 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58867)

(declare-fun mapDefault!34063 () ValueCell!10213)

