; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110788 () Bool)

(assert start!110788)

(declare-fun b_free!29623 () Bool)

(declare-fun b_next!29623 () Bool)

(assert (=> start!110788 (= b_free!29623 (not b_next!29623))))

(declare-fun tp!104191 () Bool)

(declare-fun b_and!47831 () Bool)

(assert (=> start!110788 (= tp!104191 b_and!47831)))

(declare-fun b!1311263 () Bool)

(declare-fun e!748036 () Bool)

(declare-fun tp_is_empty!35353 () Bool)

(assert (=> b!1311263 (= e!748036 tp_is_empty!35353)))

(declare-fun b!1311264 () Bool)

(declare-fun e!748035 () Bool)

(assert (=> b!1311264 (= e!748035 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585453 () Bool)

(declare-datatypes ((array!87694 0))(
  ( (array!87695 (arr!42327 (Array (_ BitVec 32) (_ BitVec 64))) (size!42877 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87694)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52241 0))(
  ( (V!52242 (val!17751 Int)) )
))
(declare-fun minValue!1296 () V!52241)

(declare-datatypes ((ValueCell!16778 0))(
  ( (ValueCellFull!16778 (v!20378 V!52241)) (EmptyCell!16778) )
))
(declare-datatypes ((array!87696 0))(
  ( (array!87697 (arr!42328 (Array (_ BitVec 32) ValueCell!16778)) (size!42878 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87696)

(declare-fun zeroValue!1296 () V!52241)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!22876 0))(
  ( (tuple2!22877 (_1!11449 (_ BitVec 64)) (_2!11449 V!52241)) )
))
(declare-datatypes ((List!30017 0))(
  ( (Nil!30014) (Cons!30013 (h!31222 tuple2!22876) (t!43623 List!30017)) )
))
(declare-datatypes ((ListLongMap!20533 0))(
  ( (ListLongMap!20534 (toList!10282 List!30017)) )
))
(declare-fun contains!8432 (ListLongMap!20533 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5295 (array!87694 array!87696 (_ BitVec 32) (_ BitVec 32) V!52241 V!52241 (_ BitVec 32) Int) ListLongMap!20533)

(assert (=> b!1311264 (= lt!585453 (contains!8432 (getCurrentListMap!5295 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1311265 () Bool)

(declare-fun res!870505 () Bool)

(assert (=> b!1311265 (=> (not res!870505) (not e!748035))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87694 (_ BitVec 32)) Bool)

(assert (=> b!1311265 (= res!870505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1311266 () Bool)

(declare-fun e!748033 () Bool)

(declare-fun e!748037 () Bool)

(declare-fun mapRes!54658 () Bool)

(assert (=> b!1311266 (= e!748033 (and e!748037 mapRes!54658))))

(declare-fun condMapEmpty!54658 () Bool)

(declare-fun mapDefault!54658 () ValueCell!16778)

