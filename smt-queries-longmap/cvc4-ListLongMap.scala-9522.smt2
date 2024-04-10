; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112998 () Bool)

(assert start!112998)

(declare-fun b!1339355 () Bool)

(declare-fun e!762844 () Bool)

(declare-fun tp_is_empty!37049 () Bool)

(assert (=> b!1339355 (= e!762844 tp_is_empty!37049)))

(declare-fun mapNonEmpty!57280 () Bool)

(declare-fun mapRes!57280 () Bool)

(declare-fun tp!108979 () Bool)

(declare-fun e!762847 () Bool)

(assert (=> mapNonEmpty!57280 (= mapRes!57280 (and tp!108979 e!762847))))

(declare-datatypes ((V!54501 0))(
  ( (V!54502 (val!18599 Int)) )
))
(declare-datatypes ((ValueCell!17626 0))(
  ( (ValueCellFull!17626 (v!21247 V!54501)) (EmptyCell!17626) )
))
(declare-fun mapRest!57280 () (Array (_ BitVec 32) ValueCell!17626))

(declare-fun mapValue!57280 () ValueCell!17626)

(declare-fun mapKey!57280 () (_ BitVec 32))

(declare-datatypes ((array!90956 0))(
  ( (array!90957 (arr!43934 (Array (_ BitVec 32) ValueCell!17626)) (size!44484 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90956)

(assert (=> mapNonEmpty!57280 (= (arr!43934 _values!1303) (store mapRest!57280 mapKey!57280 mapValue!57280))))

(declare-fun mapIsEmpty!57280 () Bool)

(assert (=> mapIsEmpty!57280 mapRes!57280))

(declare-fun b!1339356 () Bool)

(declare-fun res!888516 () Bool)

(declare-fun e!762848 () Bool)

(assert (=> b!1339356 (=> (not res!888516) (not e!762848))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((array!90958 0))(
  ( (array!90959 (arr!43935 (Array (_ BitVec 32) (_ BitVec 64))) (size!44485 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90958)

(assert (=> b!1339356 (= res!888516 (and (= (size!44484 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44485 _keys!1571) (size!44484 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1339357 () Bool)

(assert (=> b!1339357 (= e!762847 tp_is_empty!37049)))

(declare-fun b!1339358 () Bool)

(declare-fun res!888514 () Bool)

(assert (=> b!1339358 (=> (not res!888514) (not e!762848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90958 (_ BitVec 32)) Bool)

(assert (=> b!1339358 (= res!888514 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339359 () Bool)

(declare-fun e!762845 () Bool)

(assert (=> b!1339359 (= e!762845 (and e!762844 mapRes!57280))))

(declare-fun condMapEmpty!57280 () Bool)

(declare-fun mapDefault!57280 () ValueCell!17626)

