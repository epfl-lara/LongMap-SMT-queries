; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!111350 () Bool)

(assert start!111350)

(declare-fun b_free!30007 () Bool)

(declare-fun b_next!30007 () Bool)

(assert (=> start!111350 (= b_free!30007 (not b_next!30007))))

(declare-fun tp!105497 () Bool)

(declare-fun b_and!48227 () Bool)

(assert (=> start!111350 (= tp!105497 b_and!48227)))

(declare-fun b!1317604 () Bool)

(declare-fun e!751891 () Bool)

(declare-fun tp_is_empty!35827 () Bool)

(assert (=> b!1317604 (= e!751891 tp_is_empty!35827)))

(declare-fun b!1317605 () Bool)

(declare-fun e!751893 () Bool)

(assert (=> b!1317605 (= e!751893 false)))

(declare-datatypes ((array!88608 0))(
  ( (array!88609 (arr!42778 (Array (_ BitVec 32) (_ BitVec 64))) (size!43328 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88608)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-datatypes ((V!52873 0))(
  ( (V!52874 (val!17988 Int)) )
))
(declare-fun zeroValue!1279 () V!52873)

(declare-datatypes ((ValueCell!17015 0))(
  ( (ValueCellFull!17015 (v!20618 V!52873)) (EmptyCell!17015) )
))
(declare-datatypes ((array!88610 0))(
  ( (array!88611 (arr!42779 (Array (_ BitVec 32) ValueCell!17015)) (size!43329 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88610)

(declare-fun minValue!1279 () V!52873)

(declare-fun lt!586386 () Bool)

(declare-fun k!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23152 0))(
  ( (tuple2!23153 (_1!11587 (_ BitVec 64)) (_2!11587 V!52873)) )
))
(declare-datatypes ((List!30311 0))(
  ( (Nil!30308) (Cons!30307 (h!31516 tuple2!23152) (t!43919 List!30311)) )
))
(declare-datatypes ((ListLongMap!20809 0))(
  ( (ListLongMap!20810 (toList!10420 List!30311)) )
))
(declare-fun contains!8575 (ListLongMap!20809 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5433 (array!88608 array!88610 (_ BitVec 32) (_ BitVec 32) V!52873 V!52873 (_ BitVec 32) Int) ListLongMap!20809)

(assert (=> b!1317605 (= lt!586386 (contains!8575 (getCurrentListMap!5433 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k!1164))))

(declare-fun res!874472 () Bool)

(assert (=> start!111350 (=> (not res!874472) (not e!751893))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111350 (= res!874472 (validMask!0 mask!2019))))

(assert (=> start!111350 e!751893))

(declare-fun array_inv!32309 (array!88608) Bool)

(assert (=> start!111350 (array_inv!32309 _keys!1609)))

(assert (=> start!111350 true))

(assert (=> start!111350 tp_is_empty!35827))

(declare-fun e!751892 () Bool)

(declare-fun array_inv!32310 (array!88610) Bool)

(assert (=> start!111350 (and (array_inv!32310 _values!1337) e!751892)))

(assert (=> start!111350 tp!105497))

(declare-fun b!1317606 () Bool)

(declare-fun res!874474 () Bool)

(assert (=> b!1317606 (=> (not res!874474) (not e!751893))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88608 (_ BitVec 32)) Bool)

(assert (=> b!1317606 (= res!874474 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55388 () Bool)

(declare-fun mapRes!55388 () Bool)

(declare-fun tp!105496 () Bool)

(assert (=> mapNonEmpty!55388 (= mapRes!55388 (and tp!105496 e!751891))))

(declare-fun mapKey!55388 () (_ BitVec 32))

(declare-fun mapRest!55388 () (Array (_ BitVec 32) ValueCell!17015))

(declare-fun mapValue!55388 () ValueCell!17015)

(assert (=> mapNonEmpty!55388 (= (arr!42779 _values!1337) (store mapRest!55388 mapKey!55388 mapValue!55388))))

(declare-fun b!1317607 () Bool)

(declare-fun res!874471 () Bool)

(assert (=> b!1317607 (=> (not res!874471) (not e!751893))))

(assert (=> b!1317607 (= res!874471 (and (= (size!43329 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43328 _keys!1609) (size!43329 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317608 () Bool)

(declare-fun res!874475 () Bool)

(assert (=> b!1317608 (=> (not res!874475) (not e!751893))))

(assert (=> b!1317608 (= res!874475 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43328 _keys!1609)) (not (= k!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1317609 () Bool)

(declare-fun e!751890 () Bool)

(assert (=> b!1317609 (= e!751890 tp_is_empty!35827)))

(declare-fun b!1317610 () Bool)

(assert (=> b!1317610 (= e!751892 (and e!751890 mapRes!55388))))

(declare-fun condMapEmpty!55388 () Bool)

(declare-fun mapDefault!55388 () ValueCell!17015)

