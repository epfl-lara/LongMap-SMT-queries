; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84112 () Bool)

(assert start!84112)

(declare-fun mapIsEmpty!36401 () Bool)

(declare-fun mapRes!36401 () Bool)

(assert (=> mapIsEmpty!36401 mapRes!36401))

(declare-fun mapNonEmpty!36401 () Bool)

(declare-fun tp!69085 () Bool)

(declare-fun e!554413 () Bool)

(assert (=> mapNonEmpty!36401 (= mapRes!36401 (and tp!69085 e!554413))))

(declare-fun mapKey!36401 () (_ BitVec 32))

(declare-datatypes ((V!35537 0))(
  ( (V!35538 (val!11508 Int)) )
))
(declare-datatypes ((ValueCell!10976 0))(
  ( (ValueCellFull!10976 (v!14070 V!35537)) (EmptyCell!10976) )
))
(declare-fun mapValue!36401 () ValueCell!10976)

(declare-datatypes ((array!61817 0))(
  ( (array!61818 (arr!29766 (Array (_ BitVec 32) ValueCell!10976)) (size!30245 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61817)

(declare-fun mapRest!36401 () (Array (_ BitVec 32) ValueCell!10976))

(assert (=> mapNonEmpty!36401 (= (arr!29766 _values!1278) (store mapRest!36401 mapKey!36401 mapValue!36401))))

(declare-fun b!983500 () Bool)

(declare-fun e!554412 () Bool)

(declare-fun tp_is_empty!22915 () Bool)

(assert (=> b!983500 (= e!554412 tp_is_empty!22915)))

(declare-fun b!983501 () Bool)

(declare-fun res!658127 () Bool)

(declare-fun e!554414 () Bool)

(assert (=> b!983501 (=> (not res!658127) (not e!554414))))

(declare-datatypes ((array!61819 0))(
  ( (array!61820 (arr!29767 (Array (_ BitVec 32) (_ BitVec 64))) (size!30246 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61819)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61819 (_ BitVec 32)) Bool)

(assert (=> b!983501 (= res!658127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983502 () Bool)

(assert (=> b!983502 (= e!554413 tp_is_empty!22915)))

(declare-fun b!983503 () Bool)

(declare-fun e!554411 () Bool)

(assert (=> b!983503 (= e!554411 (and e!554412 mapRes!36401))))

(declare-fun condMapEmpty!36401 () Bool)

(declare-fun mapDefault!36401 () ValueCell!10976)

