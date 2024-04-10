; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!112988 () Bool)

(assert start!112988)

(declare-fun b!1339265 () Bool)

(declare-fun res!888470 () Bool)

(declare-fun e!762769 () Bool)

(assert (=> b!1339265 (=> (not res!888470) (not e!762769))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90938 0))(
  ( (array!90939 (arr!43925 (Array (_ BitVec 32) (_ BitVec 64))) (size!44475 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90938)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54489 0))(
  ( (V!54490 (val!18594 Int)) )
))
(declare-datatypes ((ValueCell!17621 0))(
  ( (ValueCellFull!17621 (v!21242 V!54489)) (EmptyCell!17621) )
))
(declare-datatypes ((array!90940 0))(
  ( (array!90941 (arr!43926 (Array (_ BitVec 32) ValueCell!17621)) (size!44476 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90940)

(assert (=> b!1339265 (= res!888470 (and (= (size!44476 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44475 _keys!1571) (size!44476 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57265 () Bool)

(declare-fun mapRes!57265 () Bool)

(declare-fun tp!108964 () Bool)

(declare-fun e!762771 () Bool)

(assert (=> mapNonEmpty!57265 (= mapRes!57265 (and tp!108964 e!762771))))

(declare-fun mapRest!57265 () (Array (_ BitVec 32) ValueCell!17621))

(declare-fun mapKey!57265 () (_ BitVec 32))

(declare-fun mapValue!57265 () ValueCell!17621)

(assert (=> mapNonEmpty!57265 (= (arr!43926 _values!1303) (store mapRest!57265 mapKey!57265 mapValue!57265))))

(declare-fun b!1339266 () Bool)

(declare-fun e!762772 () Bool)

(declare-fun e!762773 () Bool)

(assert (=> b!1339266 (= e!762772 (and e!762773 mapRes!57265))))

(declare-fun condMapEmpty!57265 () Bool)

(declare-fun mapDefault!57265 () ValueCell!17621)

