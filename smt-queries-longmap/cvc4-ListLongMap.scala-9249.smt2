; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110846 () Bool)

(assert start!110846)

(declare-fun b_free!29681 () Bool)

(declare-fun b_next!29681 () Bool)

(assert (=> start!110846 (= b_free!29681 (not b_next!29681))))

(declare-fun tp!104365 () Bool)

(declare-fun b_and!47889 () Bool)

(assert (=> start!110846 (= tp!104365 b_and!47889)))

(declare-fun b!1312171 () Bool)

(declare-fun res!871150 () Bool)

(declare-fun e!748470 () Bool)

(assert (=> b!1312171 (=> (not res!871150) (not e!748470))))

(declare-datatypes ((array!87810 0))(
  ( (array!87811 (arr!42385 (Array (_ BitVec 32) (_ BitVec 64))) (size!42935 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87810)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312171 (= res!871150 (not (= (select (arr!42385 _keys!1628) from!2020) k!1175)))))

(declare-fun b!1312172 () Bool)

(declare-fun res!871153 () Bool)

(assert (=> b!1312172 (=> (not res!871153) (not e!748470))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312172 (= res!871153 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1312173 () Bool)

(declare-fun res!871154 () Bool)

(assert (=> b!1312173 (=> (not res!871154) (not e!748470))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312173 (= res!871154 (validKeyInArray!0 (select (arr!42385 _keys!1628) from!2020)))))

(declare-fun b!1312174 () Bool)

(declare-fun res!871157 () Bool)

(assert (=> b!1312174 (=> (not res!871157) (not e!748470))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52317 0))(
  ( (V!52318 (val!17780 Int)) )
))
(declare-datatypes ((ValueCell!16807 0))(
  ( (ValueCellFull!16807 (v!20407 V!52317)) (EmptyCell!16807) )
))
(declare-datatypes ((array!87812 0))(
  ( (array!87813 (arr!42386 (Array (_ BitVec 32) ValueCell!16807)) (size!42936 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87812)

(assert (=> b!1312174 (= res!871157 (and (= (size!42936 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42935 _keys!1628) (size!42936 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312175 () Bool)

(declare-fun e!748469 () Bool)

(declare-fun e!748468 () Bool)

(declare-fun mapRes!54745 () Bool)

(assert (=> b!1312175 (= e!748469 (and e!748468 mapRes!54745))))

(declare-fun condMapEmpty!54745 () Bool)

(declare-fun mapDefault!54745 () ValueCell!16807)

