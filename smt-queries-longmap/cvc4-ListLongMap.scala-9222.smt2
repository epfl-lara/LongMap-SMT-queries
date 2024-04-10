; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110684 () Bool)

(assert start!110684)

(declare-fun b_free!29519 () Bool)

(declare-fun b_next!29519 () Bool)

(assert (=> start!110684 (= b_free!29519 (not b_next!29519))))

(declare-fun tp!103879 () Bool)

(declare-fun b_and!47727 () Bool)

(assert (=> start!110684 (= tp!103879 b_and!47727)))

(declare-fun b!1309691 () Bool)

(declare-fun res!869403 () Bool)

(declare-fun e!747253 () Bool)

(assert (=> b!1309691 (=> (not res!869403) (not e!747253))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52101 0))(
  ( (V!52102 (val!17699 Int)) )
))
(declare-datatypes ((ValueCell!16726 0))(
  ( (ValueCellFull!16726 (v!20326 V!52101)) (EmptyCell!16726) )
))
(declare-datatypes ((array!87488 0))(
  ( (array!87489 (arr!42224 (Array (_ BitVec 32) ValueCell!16726)) (size!42774 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87488)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-datatypes ((array!87490 0))(
  ( (array!87491 (arr!42225 (Array (_ BitVec 32) (_ BitVec 64))) (size!42775 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87490)

(assert (=> b!1309691 (= res!869403 (and (= (size!42774 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42775 _keys!1628) (size!42774 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1309692 () Bool)

(declare-fun e!747256 () Bool)

(declare-fun e!747257 () Bool)

(declare-fun mapRes!54502 () Bool)

(assert (=> b!1309692 (= e!747256 (and e!747257 mapRes!54502))))

(declare-fun condMapEmpty!54502 () Bool)

(declare-fun mapDefault!54502 () ValueCell!16726)

