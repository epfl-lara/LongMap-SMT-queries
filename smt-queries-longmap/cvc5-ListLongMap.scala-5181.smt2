; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70072 () Bool)

(assert start!70072)

(declare-fun b_free!12493 () Bool)

(declare-fun b_next!12493 () Bool)

(assert (=> start!70072 (= b_free!12493 (not b_next!12493))))

(declare-fun tp!44194 () Bool)

(declare-fun b_and!21265 () Bool)

(assert (=> start!70072 (= tp!44194 b_and!21265)))

(declare-fun mapIsEmpty!22885 () Bool)

(declare-fun mapRes!22885 () Bool)

(assert (=> mapIsEmpty!22885 mapRes!22885))

(declare-fun b!814331 () Bool)

(declare-fun res!556218 () Bool)

(declare-fun e!451379 () Bool)

(assert (=> b!814331 (=> (not res!556218) (not e!451379))))

(declare-datatypes ((array!44610 0))(
  ( (array!44611 (arr!21365 (Array (_ BitVec 32) (_ BitVec 64))) (size!21786 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44610)

(declare-datatypes ((List!15202 0))(
  ( (Nil!15199) (Cons!15198 (h!16327 (_ BitVec 64)) (t!21519 List!15202)) )
))
(declare-fun arrayNoDuplicates!0 (array!44610 (_ BitVec 32) List!15202) Bool)

(assert (=> b!814331 (= res!556218 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15199))))

(declare-fun b!814332 () Bool)

(declare-fun e!451380 () Bool)

(declare-fun e!451382 () Bool)

(assert (=> b!814332 (= e!451380 (and e!451382 mapRes!22885))))

(declare-fun condMapEmpty!22885 () Bool)

(declare-datatypes ((V!23939 0))(
  ( (V!23940 (val!7149 Int)) )
))
(declare-datatypes ((ValueCell!6686 0))(
  ( (ValueCellFull!6686 (v!9576 V!23939)) (EmptyCell!6686) )
))
(declare-datatypes ((array!44612 0))(
  ( (array!44613 (arr!21366 (Array (_ BitVec 32) ValueCell!6686)) (size!21787 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44612)

(declare-fun mapDefault!22885 () ValueCell!6686)

