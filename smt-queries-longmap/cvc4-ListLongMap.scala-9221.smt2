; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110678 () Bool)

(assert start!110678)

(declare-fun b_free!29513 () Bool)

(declare-fun b_next!29513 () Bool)

(assert (=> start!110678 (= b_free!29513 (not b_next!29513))))

(declare-fun tp!103861 () Bool)

(declare-fun b_and!47721 () Bool)

(assert (=> start!110678 (= tp!103861 b_and!47721)))

(declare-fun b!1309619 () Bool)

(declare-fun e!747208 () Bool)

(assert (=> b!1309619 (= e!747208 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87476 0))(
  ( (array!87477 (arr!42218 (Array (_ BitVec 32) (_ BitVec 64))) (size!42768 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87476)

(declare-fun lt!585288 () Bool)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52093 0))(
  ( (V!52094 (val!17696 Int)) )
))
(declare-fun minValue!1296 () V!52093)

(declare-datatypes ((ValueCell!16723 0))(
  ( (ValueCellFull!16723 (v!20323 V!52093)) (EmptyCell!16723) )
))
(declare-datatypes ((array!87478 0))(
  ( (array!87479 (arr!42219 (Array (_ BitVec 32) ValueCell!16723)) (size!42769 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87478)

(declare-fun zeroValue!1296 () V!52093)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22790 0))(
  ( (tuple2!22791 (_1!11406 (_ BitVec 64)) (_2!11406 V!52093)) )
))
(declare-datatypes ((List!29932 0))(
  ( (Nil!29929) (Cons!29928 (h!31137 tuple2!22790) (t!43538 List!29932)) )
))
(declare-datatypes ((ListLongMap!20447 0))(
  ( (ListLongMap!20448 (toList!10239 List!29932)) )
))
(declare-fun contains!8389 (ListLongMap!20447 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5252 (array!87476 array!87478 (_ BitVec 32) (_ BitVec 32) V!52093 V!52093 (_ BitVec 32) Int) ListLongMap!20447)

(assert (=> b!1309619 (= lt!585288 (contains!8389 (getCurrentListMap!5252 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309620 () Bool)

(declare-fun e!747211 () Bool)

(declare-fun tp_is_empty!35243 () Bool)

(assert (=> b!1309620 (= e!747211 tp_is_empty!35243)))

(declare-fun b!1309621 () Bool)

(declare-fun e!747212 () Bool)

(declare-fun mapRes!54493 () Bool)

(assert (=> b!1309621 (= e!747212 (and e!747211 mapRes!54493))))

(declare-fun condMapEmpty!54493 () Bool)

(declare-fun mapDefault!54493 () ValueCell!16723)

