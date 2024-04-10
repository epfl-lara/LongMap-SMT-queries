; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113416 () Bool)

(assert start!113416)

(declare-fun b_free!31467 () Bool)

(declare-fun b_next!31467 () Bool)

(assert (=> start!113416 (= b_free!31467 (not b_next!31467))))

(declare-fun tp!110206 () Bool)

(declare-fun b_and!50755 () Bool)

(assert (=> start!113416 (= tp!110206 b_and!50755)))

(declare-fun res!893370 () Bool)

(declare-fun e!766061 () Bool)

(assert (=> start!113416 (=> (not res!893370) (not e!766061))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113416 (= res!893370 (validMask!0 mask!1977))))

(assert (=> start!113416 e!766061))

(declare-fun tp_is_empty!37467 () Bool)

(assert (=> start!113416 tp_is_empty!37467))

(assert (=> start!113416 true))

(declare-datatypes ((array!91768 0))(
  ( (array!91769 (arr!44340 (Array (_ BitVec 32) (_ BitVec 64))) (size!44890 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91768)

(declare-fun array_inv!33407 (array!91768) Bool)

(assert (=> start!113416 (array_inv!33407 _keys!1571)))

(declare-datatypes ((V!55059 0))(
  ( (V!55060 (val!18808 Int)) )
))
(declare-datatypes ((ValueCell!17835 0))(
  ( (ValueCellFull!17835 (v!21456 V!55059)) (EmptyCell!17835) )
))
(declare-datatypes ((array!91770 0))(
  ( (array!91771 (arr!44341 (Array (_ BitVec 32) ValueCell!17835)) (size!44891 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91770)

(declare-fun e!766060 () Bool)

(declare-fun array_inv!33408 (array!91770) Bool)

(assert (=> start!113416 (and (array_inv!33408 _values!1303) e!766060)))

(assert (=> start!113416 tp!110206))

(declare-fun mapNonEmpty!57907 () Bool)

(declare-fun mapRes!57907 () Bool)

(declare-fun tp!110205 () Bool)

(declare-fun e!766062 () Bool)

(assert (=> mapNonEmpty!57907 (= mapRes!57907 (and tp!110205 e!766062))))

(declare-fun mapValue!57907 () ValueCell!17835)

(declare-fun mapKey!57907 () (_ BitVec 32))

(declare-fun mapRest!57907 () (Array (_ BitVec 32) ValueCell!17835))

(assert (=> mapNonEmpty!57907 (= (arr!44341 _values!1303) (store mapRest!57907 mapKey!57907 mapValue!57907))))

(declare-fun b!1346346 () Bool)

(declare-fun e!766063 () Bool)

(assert (=> b!1346346 (= e!766063 tp_is_empty!37467)))

(declare-fun b!1346347 () Bool)

(declare-fun res!893369 () Bool)

(assert (=> b!1346347 (=> (not res!893369) (not e!766061))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346347 (= res!893369 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44890 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346348 () Bool)

(declare-fun res!893367 () Bool)

(assert (=> b!1346348 (=> (not res!893367) (not e!766061))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91768 (_ BitVec 32)) Bool)

(assert (=> b!1346348 (= res!893367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57907 () Bool)

(assert (=> mapIsEmpty!57907 mapRes!57907))

(declare-fun b!1346349 () Bool)

(assert (=> b!1346349 (= e!766062 tp_is_empty!37467)))

(declare-fun b!1346350 () Bool)

(assert (=> b!1346350 (= e!766060 (and e!766063 mapRes!57907))))

(declare-fun condMapEmpty!57907 () Bool)

(declare-fun mapDefault!57907 () ValueCell!17835)

(assert (=> b!1346350 (= condMapEmpty!57907 (= (arr!44341 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17835)) mapDefault!57907)))))

(declare-fun b!1346351 () Bool)

(declare-fun res!893368 () Bool)

(assert (=> b!1346351 (=> (not res!893368) (not e!766061))))

(assert (=> b!1346351 (= res!893368 (and (= (size!44891 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44890 _keys!1571) (size!44891 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346352 () Bool)

(declare-fun res!893366 () Bool)

(assert (=> b!1346352 (=> (not res!893366) (not e!766061))))

(declare-datatypes ((List!31400 0))(
  ( (Nil!31397) (Cons!31396 (h!32605 (_ BitVec 64)) (t!45990 List!31400)) )
))
(declare-fun arrayNoDuplicates!0 (array!91768 (_ BitVec 32) List!31400) Bool)

(assert (=> b!1346352 (= res!893366 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31397))))

(declare-fun b!1346353 () Bool)

(assert (=> b!1346353 (= e!766061 false)))

(declare-fun minValue!1245 () V!55059)

(declare-fun lt!595503 () Bool)

(declare-fun zeroValue!1245 () V!55059)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24244 0))(
  ( (tuple2!24245 (_1!12133 (_ BitVec 64)) (_2!12133 V!55059)) )
))
(declare-datatypes ((List!31401 0))(
  ( (Nil!31398) (Cons!31397 (h!32606 tuple2!24244) (t!45991 List!31401)) )
))
(declare-datatypes ((ListLongMap!21901 0))(
  ( (ListLongMap!21902 (toList!10966 List!31401)) )
))
(declare-fun contains!9142 (ListLongMap!21901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5918 (array!91768 array!91770 (_ BitVec 32) (_ BitVec 32) V!55059 V!55059 (_ BitVec 32) Int) ListLongMap!21901)

(assert (=> b!1346353 (= lt!595503 (contains!9142 (getCurrentListMap!5918 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113416 res!893370) b!1346351))

(assert (= (and b!1346351 res!893368) b!1346348))

(assert (= (and b!1346348 res!893367) b!1346352))

(assert (= (and b!1346352 res!893366) b!1346347))

(assert (= (and b!1346347 res!893369) b!1346353))

(assert (= (and b!1346350 condMapEmpty!57907) mapIsEmpty!57907))

(assert (= (and b!1346350 (not condMapEmpty!57907)) mapNonEmpty!57907))

(get-info :version)

(assert (= (and mapNonEmpty!57907 ((_ is ValueCellFull!17835) mapValue!57907)) b!1346349))

(assert (= (and b!1346350 ((_ is ValueCellFull!17835) mapDefault!57907)) b!1346346))

(assert (= start!113416 b!1346350))

(declare-fun m!1233527 () Bool)

(assert (=> b!1346353 m!1233527))

(assert (=> b!1346353 m!1233527))

(declare-fun m!1233529 () Bool)

(assert (=> b!1346353 m!1233529))

(declare-fun m!1233531 () Bool)

(assert (=> b!1346352 m!1233531))

(declare-fun m!1233533 () Bool)

(assert (=> start!113416 m!1233533))

(declare-fun m!1233535 () Bool)

(assert (=> start!113416 m!1233535))

(declare-fun m!1233537 () Bool)

(assert (=> start!113416 m!1233537))

(declare-fun m!1233539 () Bool)

(assert (=> mapNonEmpty!57907 m!1233539))

(declare-fun m!1233541 () Bool)

(assert (=> b!1346348 m!1233541))

(check-sat tp_is_empty!37467 b_and!50755 (not start!113416) (not mapNonEmpty!57907) (not b!1346348) (not b_next!31467) (not b!1346353) (not b!1346352))
(check-sat b_and!50755 (not b_next!31467))
