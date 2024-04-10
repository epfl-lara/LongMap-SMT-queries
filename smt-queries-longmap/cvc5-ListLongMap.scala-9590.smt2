; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113402 () Bool)

(assert start!113402)

(declare-fun b_free!31453 () Bool)

(declare-fun b_next!31453 () Bool)

(assert (=> start!113402 (= b_free!31453 (not b_next!31453))))

(declare-fun tp!110164 () Bool)

(declare-fun b_and!50741 () Bool)

(assert (=> start!113402 (= tp!110164 b_and!50741)))

(declare-fun mapNonEmpty!57886 () Bool)

(declare-fun mapRes!57886 () Bool)

(declare-fun tp!110163 () Bool)

(declare-fun e!765959 () Bool)

(assert (=> mapNonEmpty!57886 (= mapRes!57886 (and tp!110163 e!765959))))

(declare-datatypes ((V!55041 0))(
  ( (V!55042 (val!18801 Int)) )
))
(declare-datatypes ((ValueCell!17828 0))(
  ( (ValueCellFull!17828 (v!21449 V!55041)) (EmptyCell!17828) )
))
(declare-fun mapRest!57886 () (Array (_ BitVec 32) ValueCell!17828))

(declare-fun mapKey!57886 () (_ BitVec 32))

(declare-fun mapValue!57886 () ValueCell!17828)

(declare-datatypes ((array!91742 0))(
  ( (array!91743 (arr!44327 (Array (_ BitVec 32) ValueCell!17828)) (size!44877 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91742)

(assert (=> mapNonEmpty!57886 (= (arr!44327 _values!1303) (store mapRest!57886 mapKey!57886 mapValue!57886))))

(declare-fun b!1346178 () Bool)

(declare-fun e!765957 () Bool)

(assert (=> b!1346178 (= e!765957 false)))

(declare-fun minValue!1245 () V!55041)

(declare-fun lt!595482 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55041)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-datatypes ((array!91744 0))(
  ( (array!91745 (arr!44328 (Array (_ BitVec 32) (_ BitVec 64))) (size!44878 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91744)

(declare-datatypes ((tuple2!24236 0))(
  ( (tuple2!24237 (_1!12129 (_ BitVec 64)) (_2!12129 V!55041)) )
))
(declare-datatypes ((List!31391 0))(
  ( (Nil!31388) (Cons!31387 (h!32596 tuple2!24236) (t!45981 List!31391)) )
))
(declare-datatypes ((ListLongMap!21893 0))(
  ( (ListLongMap!21894 (toList!10962 List!31391)) )
))
(declare-fun contains!9138 (ListLongMap!21893 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5914 (array!91744 array!91742 (_ BitVec 32) (_ BitVec 32) V!55041 V!55041 (_ BitVec 32) Int) ListLongMap!21893)

(assert (=> b!1346178 (= lt!595482 (contains!9138 (getCurrentListMap!5914 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1346179 () Bool)

(declare-fun res!893265 () Bool)

(assert (=> b!1346179 (=> (not res!893265) (not e!765957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91744 (_ BitVec 32)) Bool)

(assert (=> b!1346179 (= res!893265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346180 () Bool)

(declare-fun res!893261 () Bool)

(assert (=> b!1346180 (=> (not res!893261) (not e!765957))))

(assert (=> b!1346180 (= res!893261 (and (= (size!44877 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44878 _keys!1571) (size!44877 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346181 () Bool)

(declare-fun e!765958 () Bool)

(declare-fun e!765955 () Bool)

(assert (=> b!1346181 (= e!765958 (and e!765955 mapRes!57886))))

(declare-fun condMapEmpty!57886 () Bool)

(declare-fun mapDefault!57886 () ValueCell!17828)

