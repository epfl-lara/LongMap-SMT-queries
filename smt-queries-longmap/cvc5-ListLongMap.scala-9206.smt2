; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110584 () Bool)

(assert start!110584)

(declare-fun b_free!29419 () Bool)

(declare-fun b_next!29419 () Bool)

(assert (=> start!110584 (= b_free!29419 (not b_next!29419))))

(declare-fun tp!103578 () Bool)

(declare-fun b_and!47627 () Bool)

(assert (=> start!110584 (= tp!103578 b_and!47627)))

(declare-fun b!1308319 () Bool)

(declare-fun res!868484 () Bool)

(declare-fun e!746507 () Bool)

(assert (=> b!1308319 (=> (not res!868484) (not e!746507))))

(declare-datatypes ((array!87296 0))(
  ( (array!87297 (arr!42128 (Array (_ BitVec 32) (_ BitVec 64))) (size!42678 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87296)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308319 (= res!868484 (validKeyInArray!0 (select (arr!42128 _keys!1628) from!2020)))))

(declare-fun mapNonEmpty!54352 () Bool)

(declare-fun mapRes!54352 () Bool)

(declare-fun tp!103579 () Bool)

(declare-fun e!746503 () Bool)

(assert (=> mapNonEmpty!54352 (= mapRes!54352 (and tp!103579 e!746503))))

(declare-datatypes ((V!51969 0))(
  ( (V!51970 (val!17649 Int)) )
))
(declare-datatypes ((ValueCell!16676 0))(
  ( (ValueCellFull!16676 (v!20276 V!51969)) (EmptyCell!16676) )
))
(declare-fun mapValue!54352 () ValueCell!16676)

(declare-datatypes ((array!87298 0))(
  ( (array!87299 (arr!42129 (Array (_ BitVec 32) ValueCell!16676)) (size!42679 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87298)

(declare-fun mapRest!54352 () (Array (_ BitVec 32) ValueCell!16676))

(declare-fun mapKey!54352 () (_ BitVec 32))

(assert (=> mapNonEmpty!54352 (= (arr!42129 _values!1354) (store mapRest!54352 mapKey!54352 mapValue!54352))))

(declare-fun b!1308320 () Bool)

(declare-fun res!868482 () Bool)

(assert (=> b!1308320 (=> (not res!868482) (not e!746507))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308320 (= res!868482 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308321 () Bool)

(declare-fun res!868478 () Bool)

(assert (=> b!1308321 (=> (not res!868478) (not e!746507))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87296 (_ BitVec 32)) Bool)

(assert (=> b!1308321 (= res!868478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308322 () Bool)

(declare-fun e!746506 () Bool)

(declare-fun e!746504 () Bool)

(assert (=> b!1308322 (= e!746506 (and e!746504 mapRes!54352))))

(declare-fun condMapEmpty!54352 () Bool)

(declare-fun mapDefault!54352 () ValueCell!16676)

