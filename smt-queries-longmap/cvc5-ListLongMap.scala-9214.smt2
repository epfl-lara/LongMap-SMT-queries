; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110632 () Bool)

(assert start!110632)

(declare-fun b_free!29467 () Bool)

(declare-fun b_next!29467 () Bool)

(assert (=> start!110632 (= b_free!29467 (not b_next!29467))))

(declare-fun tp!103722 () Bool)

(declare-fun b_and!47675 () Bool)

(assert (=> start!110632 (= tp!103722 b_and!47675)))

(declare-fun b!1309068 () Bool)

(declare-fun res!869013 () Bool)

(declare-fun e!746866 () Bool)

(assert (=> b!1309068 (=> (not res!869013) (not e!746866))))

(declare-datatypes ((array!87388 0))(
  ( (array!87389 (arr!42174 (Array (_ BitVec 32) (_ BitVec 64))) (size!42724 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87388)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87388 (_ BitVec 32)) Bool)

(assert (=> b!1309068 (= res!869013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54424 () Bool)

(declare-fun mapRes!54424 () Bool)

(declare-fun tp!103723 () Bool)

(declare-fun e!746867 () Bool)

(assert (=> mapNonEmpty!54424 (= mapRes!54424 (and tp!103723 e!746867))))

(declare-fun mapKey!54424 () (_ BitVec 32))

(declare-datatypes ((V!52033 0))(
  ( (V!52034 (val!17673 Int)) )
))
(declare-datatypes ((ValueCell!16700 0))(
  ( (ValueCellFull!16700 (v!20300 V!52033)) (EmptyCell!16700) )
))
(declare-fun mapRest!54424 () (Array (_ BitVec 32) ValueCell!16700))

(declare-datatypes ((array!87390 0))(
  ( (array!87391 (arr!42175 (Array (_ BitVec 32) ValueCell!16700)) (size!42725 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87390)

(declare-fun mapValue!54424 () ValueCell!16700)

(assert (=> mapNonEmpty!54424 (= (arr!42175 _values!1354) (store mapRest!54424 mapKey!54424 mapValue!54424))))

(declare-fun b!1309069 () Bool)

(declare-fun e!746863 () Bool)

(declare-fun e!746865 () Bool)

(assert (=> b!1309069 (= e!746863 (and e!746865 mapRes!54424))))

(declare-fun condMapEmpty!54424 () Bool)

(declare-fun mapDefault!54424 () ValueCell!16700)

