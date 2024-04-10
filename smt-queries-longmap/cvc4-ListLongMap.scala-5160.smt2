; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69938 () Bool)

(assert start!69938)

(declare-fun b_free!12371 () Bool)

(declare-fun b_next!12371 () Bool)

(assert (=> start!69938 (= b_free!12371 (not b_next!12371))))

(declare-fun tp!43824 () Bool)

(declare-fun b_and!21139 () Bool)

(assert (=> start!69938 (= tp!43824 b_and!21139)))

(declare-fun b!812977 () Bool)

(declare-fun res!555458 () Bool)

(declare-fun e!450418 () Bool)

(assert (=> b!812977 (=> (not res!555458) (not e!450418))))

(declare-datatypes ((array!44378 0))(
  ( (array!44379 (arr!21250 (Array (_ BitVec 32) (_ BitVec 64))) (size!21671 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44378)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44378 (_ BitVec 32)) Bool)

(assert (=> b!812977 (= res!555458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812978 () Bool)

(declare-fun e!450419 () Bool)

(declare-fun e!450417 () Bool)

(declare-fun mapRes!22699 () Bool)

(assert (=> b!812978 (= e!450419 (and e!450417 mapRes!22699))))

(declare-fun condMapEmpty!22699 () Bool)

(declare-datatypes ((V!23775 0))(
  ( (V!23776 (val!7088 Int)) )
))
(declare-datatypes ((ValueCell!6625 0))(
  ( (ValueCellFull!6625 (v!9515 V!23775)) (EmptyCell!6625) )
))
(declare-datatypes ((array!44380 0))(
  ( (array!44381 (arr!21251 (Array (_ BitVec 32) ValueCell!6625)) (size!21672 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44380)

(declare-fun mapDefault!22699 () ValueCell!6625)

