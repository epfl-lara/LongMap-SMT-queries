; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110654 () Bool)

(assert start!110654)

(declare-fun b_free!29489 () Bool)

(declare-fun b_next!29489 () Bool)

(assert (=> start!110654 (= b_free!29489 (not b_next!29489))))

(declare-fun tp!103788 () Bool)

(declare-fun b_and!47697 () Bool)

(assert (=> start!110654 (= tp!103788 b_and!47697)))

(declare-fun b!1309331 () Bool)

(declare-fun res!869175 () Bool)

(declare-fun e!747031 () Bool)

(assert (=> b!1309331 (=> (not res!869175) (not e!747031))))

(declare-datatypes ((array!87430 0))(
  ( (array!87431 (arr!42195 (Array (_ BitVec 32) (_ BitVec 64))) (size!42745 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87430)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1309331 (= res!869175 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42745 _keys!1628)) (not (= k!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54457 () Bool)

(declare-fun mapRes!54457 () Bool)

(declare-fun tp!103789 () Bool)

(declare-fun e!747032 () Bool)

(assert (=> mapNonEmpty!54457 (= mapRes!54457 (and tp!103789 e!747032))))

(declare-datatypes ((V!52061 0))(
  ( (V!52062 (val!17684 Int)) )
))
(declare-datatypes ((ValueCell!16711 0))(
  ( (ValueCellFull!16711 (v!20311 V!52061)) (EmptyCell!16711) )
))
(declare-fun mapValue!54457 () ValueCell!16711)

(declare-datatypes ((array!87432 0))(
  ( (array!87433 (arr!42196 (Array (_ BitVec 32) ValueCell!16711)) (size!42746 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87432)

(declare-fun mapKey!54457 () (_ BitVec 32))

(declare-fun mapRest!54457 () (Array (_ BitVec 32) ValueCell!16711))

(assert (=> mapNonEmpty!54457 (= (arr!42196 _values!1354) (store mapRest!54457 mapKey!54457 mapValue!54457))))

(declare-fun b!1309332 () Bool)

(declare-fun res!869178 () Bool)

(assert (=> b!1309332 (=> (not res!869178) (not e!747031))))

(declare-datatypes ((List!29913 0))(
  ( (Nil!29910) (Cons!29909 (h!31118 (_ BitVec 64)) (t!43519 List!29913)) )
))
(declare-fun arrayNoDuplicates!0 (array!87430 (_ BitVec 32) List!29913) Bool)

(assert (=> b!1309332 (= res!869178 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29910))))

(declare-fun b!1309333 () Bool)

(declare-fun e!747029 () Bool)

(declare-fun e!747030 () Bool)

(assert (=> b!1309333 (= e!747029 (and e!747030 mapRes!54457))))

(declare-fun condMapEmpty!54457 () Bool)

(declare-fun mapDefault!54457 () ValueCell!16711)

