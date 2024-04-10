; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110650 () Bool)

(assert start!110650)

(declare-fun b_free!29485 () Bool)

(declare-fun b_next!29485 () Bool)

(assert (=> start!110650 (= b_free!29485 (not b_next!29485))))

(declare-fun tp!103777 () Bool)

(declare-fun b_and!47693 () Bool)

(assert (=> start!110650 (= tp!103777 b_and!47693)))

(declare-fun mapIsEmpty!54451 () Bool)

(declare-fun mapRes!54451 () Bool)

(assert (=> mapIsEmpty!54451 mapRes!54451))

(declare-fun b!1309283 () Bool)

(declare-fun e!747001 () Bool)

(assert (=> b!1309283 (= e!747001 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((array!87422 0))(
  ( (array!87423 (arr!42191 (Array (_ BitVec 32) (_ BitVec 64))) (size!42741 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87422)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52057 0))(
  ( (V!52058 (val!17682 Int)) )
))
(declare-fun minValue!1296 () V!52057)

(declare-datatypes ((ValueCell!16709 0))(
  ( (ValueCellFull!16709 (v!20309 V!52057)) (EmptyCell!16709) )
))
(declare-datatypes ((array!87424 0))(
  ( (array!87425 (arr!42192 (Array (_ BitVec 32) ValueCell!16709)) (size!42742 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87424)

(declare-fun zeroValue!1296 () V!52057)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585246 () Bool)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((tuple2!22766 0))(
  ( (tuple2!22767 (_1!11394 (_ BitVec 64)) (_2!11394 V!52057)) )
))
(declare-datatypes ((List!29909 0))(
  ( (Nil!29906) (Cons!29905 (h!31114 tuple2!22766) (t!43515 List!29909)) )
))
(declare-datatypes ((ListLongMap!20423 0))(
  ( (ListLongMap!20424 (toList!10227 List!29909)) )
))
(declare-fun contains!8377 (ListLongMap!20423 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5240 (array!87422 array!87424 (_ BitVec 32) (_ BitVec 32) V!52057 V!52057 (_ BitVec 32) Int) ListLongMap!20423)

(assert (=> b!1309283 (= lt!585246 (contains!8377 (getCurrentListMap!5240 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1309284 () Bool)

(declare-fun res!869147 () Bool)

(assert (=> b!1309284 (=> (not res!869147) (not e!747001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87422 (_ BitVec 32)) Bool)

(assert (=> b!1309284 (= res!869147 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1309285 () Bool)

(declare-fun res!869146 () Bool)

(assert (=> b!1309285 (=> (not res!869146) (not e!747001))))

(declare-datatypes ((List!29910 0))(
  ( (Nil!29907) (Cons!29906 (h!31115 (_ BitVec 64)) (t!43516 List!29910)) )
))
(declare-fun arrayNoDuplicates!0 (array!87422 (_ BitVec 32) List!29910) Bool)

(assert (=> b!1309285 (= res!869146 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29907))))

(declare-fun mapNonEmpty!54451 () Bool)

(declare-fun tp!103776 () Bool)

(declare-fun e!747000 () Bool)

(assert (=> mapNonEmpty!54451 (= mapRes!54451 (and tp!103776 e!747000))))

(declare-fun mapRest!54451 () (Array (_ BitVec 32) ValueCell!16709))

(declare-fun mapValue!54451 () ValueCell!16709)

(declare-fun mapKey!54451 () (_ BitVec 32))

(assert (=> mapNonEmpty!54451 (= (arr!42192 _values!1354) (store mapRest!54451 mapKey!54451 mapValue!54451))))

(declare-fun b!1309286 () Bool)

(declare-fun e!746999 () Bool)

(declare-fun e!746998 () Bool)

(assert (=> b!1309286 (= e!746999 (and e!746998 mapRes!54451))))

(declare-fun condMapEmpty!54451 () Bool)

(declare-fun mapDefault!54451 () ValueCell!16709)

