; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113414 () Bool)

(assert start!113414)

(declare-fun b_free!31465 () Bool)

(declare-fun b_next!31465 () Bool)

(assert (=> start!113414 (= b_free!31465 (not b_next!31465))))

(declare-fun tp!110201 () Bool)

(declare-fun b_and!50735 () Bool)

(assert (=> start!113414 (= tp!110201 b_and!50735)))

(declare-fun mapIsEmpty!57904 () Bool)

(declare-fun mapRes!57904 () Bool)

(assert (=> mapIsEmpty!57904 mapRes!57904))

(declare-fun mapNonEmpty!57904 () Bool)

(declare-fun tp!110200 () Bool)

(declare-fun e!766015 () Bool)

(assert (=> mapNonEmpty!57904 (= mapRes!57904 (and tp!110200 e!766015))))

(declare-datatypes ((V!55057 0))(
  ( (V!55058 (val!18807 Int)) )
))
(declare-datatypes ((ValueCell!17834 0))(
  ( (ValueCellFull!17834 (v!21454 V!55057)) (EmptyCell!17834) )
))
(declare-fun mapValue!57904 () ValueCell!17834)

(declare-fun mapRest!57904 () (Array (_ BitVec 32) ValueCell!17834))

(declare-datatypes ((array!91709 0))(
  ( (array!91710 (arr!44311 (Array (_ BitVec 32) ValueCell!17834)) (size!44863 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91709)

(declare-fun mapKey!57904 () (_ BitVec 32))

(assert (=> mapNonEmpty!57904 (= (arr!44311 _values!1303) (store mapRest!57904 mapKey!57904 mapValue!57904))))

(declare-fun b!1346253 () Bool)

(declare-fun res!893326 () Bool)

(declare-fun e!766013 () Bool)

(assert (=> b!1346253 (=> (not res!893326) (not e!766013))))

(declare-datatypes ((array!91711 0))(
  ( (array!91712 (arr!44312 (Array (_ BitVec 32) (_ BitVec 64))) (size!44864 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91711)

(declare-datatypes ((List!31448 0))(
  ( (Nil!31445) (Cons!31444 (h!32653 (_ BitVec 64)) (t!46030 List!31448)) )
))
(declare-fun arrayNoDuplicates!0 (array!91711 (_ BitVec 32) List!31448) Bool)

(assert (=> b!1346253 (= res!893326 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31445))))

(declare-fun b!1346254 () Bool)

(declare-fun res!893323 () Bool)

(assert (=> b!1346254 (=> (not res!893323) (not e!766013))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91711 (_ BitVec 32)) Bool)

(assert (=> b!1346254 (= res!893323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346255 () Bool)

(declare-fun res!893322 () Bool)

(assert (=> b!1346255 (=> (not res!893322) (not e!766013))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1346255 (= res!893322 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44864 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1346256 () Bool)

(declare-fun tp_is_empty!37465 () Bool)

(assert (=> b!1346256 (= e!766015 tp_is_empty!37465)))

(declare-fun b!1346257 () Bool)

(assert (=> b!1346257 (= e!766013 false)))

(declare-fun minValue!1245 () V!55057)

(declare-fun zeroValue!1245 () V!55057)

(declare-fun lt!595314 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24312 0))(
  ( (tuple2!24313 (_1!12167 (_ BitVec 64)) (_2!12167 V!55057)) )
))
(declare-datatypes ((List!31449 0))(
  ( (Nil!31446) (Cons!31445 (h!32654 tuple2!24312) (t!46031 List!31449)) )
))
(declare-datatypes ((ListLongMap!21969 0))(
  ( (ListLongMap!21970 (toList!11000 List!31449)) )
))
(declare-fun contains!9105 (ListLongMap!21969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5839 (array!91711 array!91709 (_ BitVec 32) (_ BitVec 32) V!55057 V!55057 (_ BitVec 32) Int) ListLongMap!21969)

(assert (=> b!1346257 (= lt!595314 (contains!9105 (getCurrentListMap!5839 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346258 () Bool)

(declare-fun e!766016 () Bool)

(assert (=> b!1346258 (= e!766016 tp_is_empty!37465)))

(declare-fun b!1346259 () Bool)

(declare-fun e!766012 () Bool)

(assert (=> b!1346259 (= e!766012 (and e!766016 mapRes!57904))))

(declare-fun condMapEmpty!57904 () Bool)

(declare-fun mapDefault!57904 () ValueCell!17834)

(assert (=> b!1346259 (= condMapEmpty!57904 (= (arr!44311 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17834)) mapDefault!57904)))))

(declare-fun res!893324 () Bool)

(assert (=> start!113414 (=> (not res!893324) (not e!766013))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113414 (= res!893324 (validMask!0 mask!1977))))

(assert (=> start!113414 e!766013))

(assert (=> start!113414 tp_is_empty!37465))

(assert (=> start!113414 true))

(declare-fun array_inv!33583 (array!91711) Bool)

(assert (=> start!113414 (array_inv!33583 _keys!1571)))

(declare-fun array_inv!33584 (array!91709) Bool)

(assert (=> start!113414 (and (array_inv!33584 _values!1303) e!766012)))

(assert (=> start!113414 tp!110201))

(declare-fun b!1346252 () Bool)

(declare-fun res!893325 () Bool)

(assert (=> b!1346252 (=> (not res!893325) (not e!766013))))

(assert (=> b!1346252 (= res!893325 (and (= (size!44863 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44864 _keys!1571) (size!44863 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113414 res!893324) b!1346252))

(assert (= (and b!1346252 res!893325) b!1346254))

(assert (= (and b!1346254 res!893323) b!1346253))

(assert (= (and b!1346253 res!893326) b!1346255))

(assert (= (and b!1346255 res!893322) b!1346257))

(assert (= (and b!1346259 condMapEmpty!57904) mapIsEmpty!57904))

(assert (= (and b!1346259 (not condMapEmpty!57904)) mapNonEmpty!57904))

(get-info :version)

(assert (= (and mapNonEmpty!57904 ((_ is ValueCellFull!17834) mapValue!57904)) b!1346256))

(assert (= (and b!1346259 ((_ is ValueCellFull!17834) mapDefault!57904)) b!1346258))

(assert (= start!113414 b!1346259))

(declare-fun m!1232995 () Bool)

(assert (=> b!1346254 m!1232995))

(declare-fun m!1232997 () Bool)

(assert (=> b!1346253 m!1232997))

(declare-fun m!1232999 () Bool)

(assert (=> b!1346257 m!1232999))

(assert (=> b!1346257 m!1232999))

(declare-fun m!1233001 () Bool)

(assert (=> b!1346257 m!1233001))

(declare-fun m!1233003 () Bool)

(assert (=> start!113414 m!1233003))

(declare-fun m!1233005 () Bool)

(assert (=> start!113414 m!1233005))

(declare-fun m!1233007 () Bool)

(assert (=> start!113414 m!1233007))

(declare-fun m!1233009 () Bool)

(assert (=> mapNonEmpty!57904 m!1233009))

(check-sat b_and!50735 tp_is_empty!37465 (not b!1346257) (not start!113414) (not b_next!31465) (not b!1346254) (not mapNonEmpty!57904) (not b!1346253))
(check-sat b_and!50735 (not b_next!31465))
