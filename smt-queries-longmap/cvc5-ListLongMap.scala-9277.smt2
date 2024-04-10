; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111010 () Bool)

(assert start!111010)

(declare-fun b_free!29845 () Bool)

(declare-fun b_next!29845 () Bool)

(assert (=> start!111010 (= b_free!29845 (not b_next!29845))))

(declare-fun tp!104856 () Bool)

(declare-fun b_and!48053 () Bool)

(assert (=> start!111010 (= tp!104856 b_and!48053)))

(declare-fun b!1314314 () Bool)

(declare-fun e!749700 () Bool)

(declare-fun tp_is_empty!35575 () Bool)

(assert (=> b!1314314 (= e!749700 tp_is_empty!35575)))

(declare-fun b!1314315 () Bool)

(declare-fun res!872559 () Bool)

(declare-fun e!749699 () Bool)

(assert (=> b!1314315 (=> (not res!872559) (not e!749699))))

(declare-datatypes ((array!88122 0))(
  ( (array!88123 (arr!42541 (Array (_ BitVec 32) (_ BitVec 64))) (size!43091 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!88122)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88122 (_ BitVec 32)) Bool)

(assert (=> b!1314315 (= res!872559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1314316 () Bool)

(assert (=> b!1314316 (= e!749699 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-datatypes ((V!52537 0))(
  ( (V!52538 (val!17862 Int)) )
))
(declare-fun minValue!1296 () V!52537)

(declare-datatypes ((ValueCell!16889 0))(
  ( (ValueCellFull!16889 (v!20489 V!52537)) (EmptyCell!16889) )
))
(declare-datatypes ((array!88124 0))(
  ( (array!88125 (arr!42542 (Array (_ BitVec 32) ValueCell!16889)) (size!43092 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!88124)

(declare-fun zeroValue!1296 () V!52537)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun lt!585777 () Bool)

(declare-datatypes ((tuple2!23032 0))(
  ( (tuple2!23033 (_1!11527 (_ BitVec 64)) (_2!11527 V!52537)) )
))
(declare-datatypes ((List!30169 0))(
  ( (Nil!30166) (Cons!30165 (h!31374 tuple2!23032) (t!43775 List!30169)) )
))
(declare-datatypes ((ListLongMap!20689 0))(
  ( (ListLongMap!20690 (toList!10360 List!30169)) )
))
(declare-fun contains!8510 (ListLongMap!20689 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5373 (array!88122 array!88124 (_ BitVec 32) (_ BitVec 32) V!52537 V!52537 (_ BitVec 32) Int) ListLongMap!20689)

(assert (=> b!1314316 (= lt!585777 (contains!8510 (getCurrentListMap!5373 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun mapNonEmpty!54991 () Bool)

(declare-fun mapRes!54991 () Bool)

(declare-fun tp!104857 () Bool)

(declare-fun e!749698 () Bool)

(assert (=> mapNonEmpty!54991 (= mapRes!54991 (and tp!104857 e!749698))))

(declare-fun mapKey!54991 () (_ BitVec 32))

(declare-fun mapRest!54991 () (Array (_ BitVec 32) ValueCell!16889))

(declare-fun mapValue!54991 () ValueCell!16889)

(assert (=> mapNonEmpty!54991 (= (arr!42542 _values!1354) (store mapRest!54991 mapKey!54991 mapValue!54991))))

(declare-fun mapIsEmpty!54991 () Bool)

(assert (=> mapIsEmpty!54991 mapRes!54991))

(declare-fun b!1314318 () Bool)

(declare-fun res!872558 () Bool)

(assert (=> b!1314318 (=> (not res!872558) (not e!749699))))

(assert (=> b!1314318 (= res!872558 (and (= (size!43092 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!43091 _keys!1628) (size!43092 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1314319 () Bool)

(declare-fun e!749701 () Bool)

(assert (=> b!1314319 (= e!749701 (and e!749700 mapRes!54991))))

(declare-fun condMapEmpty!54991 () Bool)

(declare-fun mapDefault!54991 () ValueCell!16889)

