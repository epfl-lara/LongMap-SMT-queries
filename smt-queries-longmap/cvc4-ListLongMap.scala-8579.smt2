; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104696 () Bool)

(assert start!104696)

(declare-fun b_free!26513 () Bool)

(declare-fun b_next!26513 () Bool)

(assert (=> start!104696 (= b_free!26513 (not b_next!26513))))

(declare-fun tp!93025 () Bool)

(declare-fun b_and!44277 () Bool)

(assert (=> start!104696 (= tp!93025 b_and!44277)))

(declare-fun b!1248203 () Bool)

(declare-fun res!832775 () Bool)

(declare-fun e!708258 () Bool)

(assert (=> b!1248203 (=> (not res!832775) (not e!708258))))

(declare-datatypes ((array!80522 0))(
  ( (array!80523 (arr!38829 (Array (_ BitVec 32) (_ BitVec 64))) (size!39365 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80522)

(declare-datatypes ((List!27561 0))(
  ( (Nil!27558) (Cons!27557 (h!28766 (_ BitVec 64)) (t!41030 List!27561)) )
))
(declare-fun arrayNoDuplicates!0 (array!80522 (_ BitVec 32) List!27561) Bool)

(assert (=> b!1248203 (= res!832775 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27558))))

(declare-fun b!1248204 () Bool)

(declare-fun e!708256 () Bool)

(declare-fun tp_is_empty!31415 () Bool)

(assert (=> b!1248204 (= e!708256 tp_is_empty!31415)))

(declare-fun b!1248205 () Bool)

(declare-fun e!708255 () Bool)

(declare-fun mapRes!48880 () Bool)

(assert (=> b!1248205 (= e!708255 (and e!708256 mapRes!48880))))

(declare-fun condMapEmpty!48880 () Bool)

(declare-datatypes ((V!47251 0))(
  ( (V!47252 (val!15770 Int)) )
))
(declare-datatypes ((ValueCell!14944 0))(
  ( (ValueCellFull!14944 (v!18466 V!47251)) (EmptyCell!14944) )
))
(declare-datatypes ((array!80524 0))(
  ( (array!80525 (arr!38830 (Array (_ BitVec 32) ValueCell!14944)) (size!39366 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80524)

(declare-fun mapDefault!48880 () ValueCell!14944)

