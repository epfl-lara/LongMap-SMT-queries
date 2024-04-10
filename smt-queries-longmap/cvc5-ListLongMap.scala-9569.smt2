; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!113276 () Bool)

(assert start!113276)

(declare-fun b_free!31327 () Bool)

(declare-fun b_next!31327 () Bool)

(assert (=> start!113276 (= b_free!31327 (not b_next!31327))))

(declare-fun tp!109785 () Bool)

(declare-fun b_and!50549 () Bool)

(assert (=> start!113276 (= tp!109785 b_and!50549)))

(declare-fun b!1344015 () Bool)

(declare-fun e!764930 () Bool)

(assert (=> b!1344015 (= e!764930 false)))

(declare-datatypes ((V!54873 0))(
  ( (V!54874 (val!18738 Int)) )
))
(declare-fun minValue!1245 () V!54873)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91498 0))(
  ( (array!91499 (arr!44205 (Array (_ BitVec 32) (_ BitVec 64))) (size!44755 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91498)

(declare-fun zeroValue!1245 () V!54873)

(declare-fun lt!595140 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17765 0))(
  ( (ValueCellFull!17765 (v!21386 V!54873)) (EmptyCell!17765) )
))
(declare-datatypes ((array!91500 0))(
  ( (array!91501 (arr!44206 (Array (_ BitVec 32) ValueCell!17765)) (size!44756 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91500)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((tuple2!24142 0))(
  ( (tuple2!24143 (_1!12082 (_ BitVec 64)) (_2!12082 V!54873)) )
))
(declare-datatypes ((List!31298 0))(
  ( (Nil!31295) (Cons!31294 (h!32503 tuple2!24142) (t!45822 List!31298)) )
))
(declare-datatypes ((ListLongMap!21799 0))(
  ( (ListLongMap!21800 (toList!10915 List!31298)) )
))
(declare-fun contains!9091 (ListLongMap!21799 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5871 (array!91498 array!91500 (_ BitVec 32) (_ BitVec 32) V!54873 V!54873 (_ BitVec 32) Int) ListLongMap!21799)

(assert (=> b!1344015 (= lt!595140 (contains!9091 (getCurrentListMap!5871 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k!1142))))

(declare-fun b!1344016 () Bool)

(declare-fun e!764933 () Bool)

(declare-fun tp_is_empty!37327 () Bool)

(assert (=> b!1344016 (= e!764933 tp_is_empty!37327)))

(declare-fun b!1344017 () Bool)

(declare-fun e!764932 () Bool)

(assert (=> b!1344017 (= e!764932 tp_is_empty!37327)))

(declare-fun b!1344018 () Bool)

(declare-fun res!891734 () Bool)

(assert (=> b!1344018 (=> (not res!891734) (not e!764930))))

(declare-datatypes ((List!31299 0))(
  ( (Nil!31296) (Cons!31295 (h!32504 (_ BitVec 64)) (t!45823 List!31299)) )
))
(declare-fun arrayNoDuplicates!0 (array!91498 (_ BitVec 32) List!31299) Bool)

(assert (=> b!1344018 (= res!891734 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31296))))

(declare-fun b!1344019 () Bool)

(declare-fun res!891731 () Bool)

(assert (=> b!1344019 (=> (not res!891731) (not e!764930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91498 (_ BitVec 32)) Bool)

(assert (=> b!1344019 (= res!891731 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!891732 () Bool)

(assert (=> start!113276 (=> (not res!891732) (not e!764930))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113276 (= res!891732 (validMask!0 mask!1977))))

(assert (=> start!113276 e!764930))

(assert (=> start!113276 tp_is_empty!37327))

(assert (=> start!113276 true))

(declare-fun array_inv!33315 (array!91498) Bool)

(assert (=> start!113276 (array_inv!33315 _keys!1571)))

(declare-fun e!764931 () Bool)

(declare-fun array_inv!33316 (array!91500) Bool)

(assert (=> start!113276 (and (array_inv!33316 _values!1303) e!764931)))

(assert (=> start!113276 tp!109785))

(declare-fun mapIsEmpty!57697 () Bool)

(declare-fun mapRes!57697 () Bool)

(assert (=> mapIsEmpty!57697 mapRes!57697))

(declare-fun mapNonEmpty!57697 () Bool)

(declare-fun tp!109786 () Bool)

(assert (=> mapNonEmpty!57697 (= mapRes!57697 (and tp!109786 e!764933))))

(declare-fun mapKey!57697 () (_ BitVec 32))

(declare-fun mapRest!57697 () (Array (_ BitVec 32) ValueCell!17765))

(declare-fun mapValue!57697 () ValueCell!17765)

(assert (=> mapNonEmpty!57697 (= (arr!44206 _values!1303) (store mapRest!57697 mapKey!57697 mapValue!57697))))

(declare-fun b!1344020 () Bool)

(assert (=> b!1344020 (= e!764931 (and e!764932 mapRes!57697))))

(declare-fun condMapEmpty!57697 () Bool)

(declare-fun mapDefault!57697 () ValueCell!17765)

