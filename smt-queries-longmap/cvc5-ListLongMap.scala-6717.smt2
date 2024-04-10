; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84274 () Bool)

(assert start!84274)

(declare-fun b!985939 () Bool)

(declare-fun e!555791 () Bool)

(declare-fun tp_is_empty!23077 () Bool)

(assert (=> b!985939 (= e!555791 tp_is_empty!23077)))

(declare-fun b!985940 () Bool)

(declare-fun res!659729 () Bool)

(declare-fun e!555789 () Bool)

(assert (=> b!985940 (=> (not res!659729) (not e!555789))))

(declare-datatypes ((array!62127 0))(
  ( (array!62128 (arr!29921 (Array (_ BitVec 32) (_ BitVec 64))) (size!30400 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62127)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62127 (_ BitVec 32)) Bool)

(assert (=> b!985940 (= res!659729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985941 () Bool)

(assert (=> b!985941 (= e!555789 false)))

(declare-fun lt!437411 () Bool)

(declare-datatypes ((List!20722 0))(
  ( (Nil!20719) (Cons!20718 (h!21880 (_ BitVec 64)) (t!29621 List!20722)) )
))
(declare-fun arrayNoDuplicates!0 (array!62127 (_ BitVec 32) List!20722) Bool)

(assert (=> b!985941 (= lt!437411 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20719))))

(declare-fun mapNonEmpty!36644 () Bool)

(declare-fun mapRes!36644 () Bool)

(declare-fun tp!69499 () Bool)

(assert (=> mapNonEmpty!36644 (= mapRes!36644 (and tp!69499 e!555791))))

(declare-datatypes ((V!35753 0))(
  ( (V!35754 (val!11589 Int)) )
))
(declare-datatypes ((ValueCell!11057 0))(
  ( (ValueCellFull!11057 (v!14151 V!35753)) (EmptyCell!11057) )
))
(declare-datatypes ((array!62129 0))(
  ( (array!62130 (arr!29922 (Array (_ BitVec 32) ValueCell!11057)) (size!30401 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62129)

(declare-fun mapValue!36644 () ValueCell!11057)

(declare-fun mapRest!36644 () (Array (_ BitVec 32) ValueCell!11057))

(declare-fun mapKey!36644 () (_ BitVec 32))

(assert (=> mapNonEmpty!36644 (= (arr!29922 _values!1278) (store mapRest!36644 mapKey!36644 mapValue!36644))))

(declare-fun b!985942 () Bool)

(declare-fun e!555792 () Bool)

(declare-fun e!555790 () Bool)

(assert (=> b!985942 (= e!555792 (and e!555790 mapRes!36644))))

(declare-fun condMapEmpty!36644 () Bool)

(declare-fun mapDefault!36644 () ValueCell!11057)

