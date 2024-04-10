; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42578 () Bool)

(assert start!42578)

(declare-fun b_free!12013 () Bool)

(declare-fun b_next!12013 () Bool)

(assert (=> start!42578 (= b_free!12013 (not b_next!12013))))

(declare-fun tp!42078 () Bool)

(declare-fun b_and!20493 () Bool)

(assert (=> start!42578 (= tp!42078 b_and!20493)))

(declare-fun mapNonEmpty!21880 () Bool)

(declare-fun mapRes!21880 () Bool)

(declare-fun tp!42079 () Bool)

(declare-fun e!278879 () Bool)

(assert (=> mapNonEmpty!21880 (= mapRes!21880 (and tp!42079 e!278879))))

(declare-datatypes ((V!19027 0))(
  ( (V!19028 (val!6765 Int)) )
))
(declare-datatypes ((ValueCell!6377 0))(
  ( (ValueCellFull!6377 (v!9058 V!19027)) (EmptyCell!6377) )
))
(declare-datatypes ((array!30623 0))(
  ( (array!30624 (arr!14729 (Array (_ BitVec 32) ValueCell!6377)) (size!15081 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30623)

(declare-fun mapKey!21880 () (_ BitVec 32))

(declare-fun mapRest!21880 () (Array (_ BitVec 32) ValueCell!6377))

(declare-fun mapValue!21880 () ValueCell!6377)

(assert (=> mapNonEmpty!21880 (= (arr!14729 _values!833) (store mapRest!21880 mapKey!21880 mapValue!21880))))

(declare-fun b!475025 () Bool)

(declare-fun e!278882 () Bool)

(declare-fun tp_is_empty!13441 () Bool)

(assert (=> b!475025 (= e!278882 tp_is_empty!13441)))

(declare-fun res!283696 () Bool)

(declare-fun e!278881 () Bool)

(assert (=> start!42578 (=> (not res!283696) (not e!278881))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42578 (= res!283696 (validMask!0 mask!1365))))

(assert (=> start!42578 e!278881))

(assert (=> start!42578 tp_is_empty!13441))

(assert (=> start!42578 tp!42078))

(assert (=> start!42578 true))

(declare-datatypes ((array!30625 0))(
  ( (array!30626 (arr!14730 (Array (_ BitVec 32) (_ BitVec 64))) (size!15082 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30625)

(declare-fun array_inv!10626 (array!30625) Bool)

(assert (=> start!42578 (array_inv!10626 _keys!1025)))

(declare-fun e!278880 () Bool)

(declare-fun array_inv!10627 (array!30623) Bool)

(assert (=> start!42578 (and (array_inv!10627 _values!833) e!278880)))

(declare-fun b!475026 () Bool)

(declare-fun res!283695 () Bool)

(assert (=> b!475026 (=> (not res!283695) (not e!278881))))

(declare-datatypes ((List!9000 0))(
  ( (Nil!8997) (Cons!8996 (h!9852 (_ BitVec 64)) (t!14974 List!9000)) )
))
(declare-fun arrayNoDuplicates!0 (array!30625 (_ BitVec 32) List!9000) Bool)

(assert (=> b!475026 (= res!283695 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8997))))

(declare-fun b!475027 () Bool)

(assert (=> b!475027 (= e!278880 (and e!278882 mapRes!21880))))

(declare-fun condMapEmpty!21880 () Bool)

(declare-fun mapDefault!21880 () ValueCell!6377)

