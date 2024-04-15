; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113300 () Bool)

(assert start!113300)

(declare-fun b_free!31351 () Bool)

(declare-fun b_next!31351 () Bool)

(assert (=> start!113300 (= b_free!31351 (not b_next!31351))))

(declare-fun tp!109859 () Bool)

(declare-fun b_and!50555 () Bool)

(assert (=> start!113300 (= tp!109859 b_and!50555)))

(declare-fun mapIsEmpty!57733 () Bool)

(declare-fun mapRes!57733 () Bool)

(assert (=> mapIsEmpty!57733 mapRes!57733))

(declare-fun b!1344234 () Bool)

(declare-fun res!891883 () Bool)

(declare-fun e!765079 () Bool)

(assert (=> b!1344234 (=> (not res!891883) (not e!765079))))

(declare-datatypes ((array!91489 0))(
  ( (array!91490 (arr!44201 (Array (_ BitVec 32) (_ BitVec 64))) (size!44753 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91489)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91489 (_ BitVec 32)) Bool)

(assert (=> b!1344234 (= res!891883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344235 () Bool)

(declare-fun e!765078 () Bool)

(declare-fun tp_is_empty!37351 () Bool)

(assert (=> b!1344235 (= e!765078 tp_is_empty!37351)))

(declare-fun mapNonEmpty!57733 () Bool)

(declare-fun tp!109858 () Bool)

(declare-fun e!765080 () Bool)

(assert (=> mapNonEmpty!57733 (= mapRes!57733 (and tp!109858 e!765080))))

(declare-datatypes ((V!54905 0))(
  ( (V!54906 (val!18750 Int)) )
))
(declare-datatypes ((ValueCell!17777 0))(
  ( (ValueCellFull!17777 (v!21397 V!54905)) (EmptyCell!17777) )
))
(declare-fun mapValue!57733 () ValueCell!17777)

(declare-fun mapKey!57733 () (_ BitVec 32))

(declare-fun mapRest!57733 () (Array (_ BitVec 32) ValueCell!17777))

(declare-datatypes ((array!91491 0))(
  ( (array!91492 (arr!44202 (Array (_ BitVec 32) ValueCell!17777)) (size!44754 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91491)

(assert (=> mapNonEmpty!57733 (= (arr!44202 _values!1303) (store mapRest!57733 mapKey!57733 mapValue!57733))))

(declare-fun b!1344236 () Bool)

(declare-fun e!765076 () Bool)

(assert (=> b!1344236 (= e!765076 (and e!765078 mapRes!57733))))

(declare-fun condMapEmpty!57733 () Bool)

(declare-fun mapDefault!57733 () ValueCell!17777)

(assert (=> b!1344236 (= condMapEmpty!57733 (= (arr!44202 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17777)) mapDefault!57733)))))

(declare-fun b!1344237 () Bool)

(declare-fun res!891886 () Bool)

(assert (=> b!1344237 (=> (not res!891886) (not e!765079))))

(declare-datatypes ((List!31367 0))(
  ( (Nil!31364) (Cons!31363 (h!32572 (_ BitVec 64)) (t!45883 List!31367)) )
))
(declare-fun arrayNoDuplicates!0 (array!91489 (_ BitVec 32) List!31367) Bool)

(assert (=> b!1344237 (= res!891886 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31364))))

(declare-fun b!1344238 () Bool)

(declare-fun res!891885 () Bool)

(assert (=> b!1344238 (=> (not res!891885) (not e!765079))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1344238 (= res!891885 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44753 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344233 () Bool)

(assert (=> b!1344233 (= e!765079 false)))

(declare-fun minValue!1245 () V!54905)

(declare-fun zeroValue!1245 () V!54905)

(declare-fun lt!594990 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24226 0))(
  ( (tuple2!24227 (_1!12124 (_ BitVec 64)) (_2!12124 V!54905)) )
))
(declare-datatypes ((List!31368 0))(
  ( (Nil!31365) (Cons!31364 (h!32573 tuple2!24226) (t!45884 List!31368)) )
))
(declare-datatypes ((ListLongMap!21883 0))(
  ( (ListLongMap!21884 (toList!10957 List!31368)) )
))
(declare-fun contains!9062 (ListLongMap!21883 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5803 (array!91489 array!91491 (_ BitVec 32) (_ BitVec 32) V!54905 V!54905 (_ BitVec 32) Int) ListLongMap!21883)

(assert (=> b!1344233 (= lt!594990 (contains!9062 (getCurrentListMap!5803 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun res!891882 () Bool)

(assert (=> start!113300 (=> (not res!891882) (not e!765079))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113300 (= res!891882 (validMask!0 mask!1977))))

(assert (=> start!113300 e!765079))

(assert (=> start!113300 tp_is_empty!37351))

(assert (=> start!113300 true))

(declare-fun array_inv!33503 (array!91489) Bool)

(assert (=> start!113300 (array_inv!33503 _keys!1571)))

(declare-fun array_inv!33504 (array!91491) Bool)

(assert (=> start!113300 (and (array_inv!33504 _values!1303) e!765076)))

(assert (=> start!113300 tp!109859))

(declare-fun b!1344239 () Bool)

(assert (=> b!1344239 (= e!765080 tp_is_empty!37351)))

(declare-fun b!1344240 () Bool)

(declare-fun res!891884 () Bool)

(assert (=> b!1344240 (=> (not res!891884) (not e!765079))))

(assert (=> b!1344240 (= res!891884 (and (= (size!44754 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44753 _keys!1571) (size!44754 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113300 res!891882) b!1344240))

(assert (= (and b!1344240 res!891884) b!1344234))

(assert (= (and b!1344234 res!891883) b!1344237))

(assert (= (and b!1344237 res!891886) b!1344238))

(assert (= (and b!1344238 res!891885) b!1344233))

(assert (= (and b!1344236 condMapEmpty!57733) mapIsEmpty!57733))

(assert (= (and b!1344236 (not condMapEmpty!57733)) mapNonEmpty!57733))

(get-info :version)

(assert (= (and mapNonEmpty!57733 ((_ is ValueCellFull!17777) mapValue!57733)) b!1344239))

(assert (= (and b!1344236 ((_ is ValueCellFull!17777) mapDefault!57733)) b!1344235))

(assert (= start!113300 b!1344236))

(declare-fun m!1231435 () Bool)

(assert (=> start!113300 m!1231435))

(declare-fun m!1231437 () Bool)

(assert (=> start!113300 m!1231437))

(declare-fun m!1231439 () Bool)

(assert (=> start!113300 m!1231439))

(declare-fun m!1231441 () Bool)

(assert (=> b!1344237 m!1231441))

(declare-fun m!1231443 () Bool)

(assert (=> b!1344234 m!1231443))

(declare-fun m!1231445 () Bool)

(assert (=> mapNonEmpty!57733 m!1231445))

(declare-fun m!1231447 () Bool)

(assert (=> b!1344233 m!1231447))

(assert (=> b!1344233 m!1231447))

(declare-fun m!1231449 () Bool)

(assert (=> b!1344233 m!1231449))

(check-sat tp_is_empty!37351 (not start!113300) (not b!1344234) (not b!1344233) (not b!1344237) (not mapNonEmpty!57733) (not b_next!31351) b_and!50555)
(check-sat b_and!50555 (not b_next!31351))
