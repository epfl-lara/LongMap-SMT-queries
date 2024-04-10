; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110992 () Bool)

(assert start!110992)

(declare-fun b_free!29827 () Bool)

(declare-fun b_next!29827 () Bool)

(assert (=> start!110992 (= b_free!29827 (not b_next!29827))))

(declare-fun tp!104803 () Bool)

(declare-fun b_and!48035 () Bool)

(assert (=> start!110992 (= tp!104803 b_and!48035)))

(declare-fun b!1314062 () Bool)

(declare-fun e!749565 () Bool)

(declare-fun tp_is_empty!35557 () Bool)

(assert (=> b!1314062 (= e!749565 tp_is_empty!35557)))

(declare-fun b!1314063 () Bool)

(declare-fun res!872385 () Bool)

(declare-fun e!749564 () Bool)

(assert (=> b!1314063 (=> (not res!872385) (not e!749564))))

(declare-datatypes ((array!88086 0))(
  ( (array!88087 (arr!42523 (Array (_ BitVec 32) (_ BitVec 64))) (size!43073 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88086)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52513 0))(
  ( (V!52514 (val!17853 Int)) )
))
(declare-datatypes ((ValueCell!16880 0))(
  ( (ValueCellFull!16880 (v!20480 V!52513)) (EmptyCell!16880) )
))
(declare-datatypes ((array!88088 0))(
  ( (array!88089 (arr!42524 (Array (_ BitVec 32) ValueCell!16880)) (size!43074 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88088)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1314063 (= res!872385 (and (= (size!43074 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43073 _keys!1628) (size!43074 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314064 () Bool)

(declare-fun e!749566 () Bool)

(assert (=> b!1314064 (= e!749566 tp_is_empty!35557)))

(declare-fun b!1314065 () Bool)

(declare-fun res!872388 () Bool)

(assert (=> b!1314065 (=> (not res!872388) (not e!749564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88086 (_ BitVec 32)) Bool)

(assert (=> b!1314065 (= res!872388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54964 () Bool)

(declare-fun mapRes!54964 () Bool)

(declare-fun tp!104802 () Bool)

(assert (=> mapNonEmpty!54964 (= mapRes!54964 (and tp!104802 e!749566))))

(declare-fun mapValue!54964 () ValueCell!16880)

(declare-fun mapRest!54964 () (Array (_ BitVec 32) ValueCell!16880))

(declare-fun mapKey!54964 () (_ BitVec 32))

(assert (=> mapNonEmpty!54964 (= (arr!42524 _values!1354) (store mapRest!54964 mapKey!54964 mapValue!54964))))

(declare-fun mapIsEmpty!54964 () Bool)

(assert (=> mapIsEmpty!54964 mapRes!54964))

(declare-fun b!1314066 () Bool)

(declare-fun e!749563 () Bool)

(assert (=> b!1314066 (= e!749563 (and e!749565 mapRes!54964))))

(declare-fun condMapEmpty!54964 () Bool)

(declare-fun mapDefault!54964 () ValueCell!16880)

