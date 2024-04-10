; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113422 () Bool)

(assert start!113422)

(declare-fun b_free!31473 () Bool)

(declare-fun b_next!31473 () Bool)

(assert (=> start!113422 (= b_free!31473 (not b_next!31473))))

(declare-fun tp!110223 () Bool)

(declare-fun b_and!50761 () Bool)

(assert (=> start!113422 (= tp!110223 b_and!50761)))

(declare-fun b!1346419 () Bool)

(declare-fun res!893415 () Bool)

(declare-fun e!766106 () Bool)

(assert (=> b!1346419 (=> (not res!893415) (not e!766106))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91778 0))(
  ( (array!91779 (arr!44345 (Array (_ BitVec 32) (_ BitVec 64))) (size!44895 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91778)

(declare-datatypes ((V!55067 0))(
  ( (V!55068 (val!18811 Int)) )
))
(declare-datatypes ((ValueCell!17838 0))(
  ( (ValueCellFull!17838 (v!21459 V!55067)) (EmptyCell!17838) )
))
(declare-datatypes ((array!91780 0))(
  ( (array!91781 (arr!44346 (Array (_ BitVec 32) ValueCell!17838)) (size!44896 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91780)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1346419 (= res!893415 (and (= (size!44896 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44895 _keys!1571) (size!44896 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346420 () Bool)

(declare-fun e!766105 () Bool)

(declare-fun e!766109 () Bool)

(declare-fun mapRes!57916 () Bool)

(assert (=> b!1346420 (= e!766105 (and e!766109 mapRes!57916))))

(declare-fun condMapEmpty!57916 () Bool)

(declare-fun mapDefault!57916 () ValueCell!17838)

(assert (=> b!1346420 (= condMapEmpty!57916 (= (arr!44346 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17838)) mapDefault!57916)))))

(declare-fun b!1346421 () Bool)

(declare-fun tp_is_empty!37473 () Bool)

(assert (=> b!1346421 (= e!766109 tp_is_empty!37473)))

(declare-fun b!1346422 () Bool)

(assert (=> b!1346422 (= e!766106 false)))

(declare-fun minValue!1245 () V!55067)

(declare-fun zeroValue!1245 () V!55067)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun lt!595512 () Bool)

(declare-datatypes ((tuple2!24246 0))(
  ( (tuple2!24247 (_1!12134 (_ BitVec 64)) (_2!12134 V!55067)) )
))
(declare-datatypes ((List!31402 0))(
  ( (Nil!31399) (Cons!31398 (h!32607 tuple2!24246) (t!45992 List!31402)) )
))
(declare-datatypes ((ListLongMap!21903 0))(
  ( (ListLongMap!21904 (toList!10967 List!31402)) )
))
(declare-fun contains!9143 (ListLongMap!21903 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5919 (array!91778 array!91780 (_ BitVec 32) (_ BitVec 32) V!55067 V!55067 (_ BitVec 32) Int) ListLongMap!21903)

(assert (=> b!1346422 (= lt!595512 (contains!9143 (getCurrentListMap!5919 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57916 () Bool)

(assert (=> mapIsEmpty!57916 mapRes!57916))

(declare-fun b!1346423 () Bool)

(declare-fun e!766108 () Bool)

(assert (=> b!1346423 (= e!766108 tp_is_empty!37473)))

(declare-fun b!1346424 () Bool)

(declare-fun res!893414 () Bool)

(assert (=> b!1346424 (=> (not res!893414) (not e!766106))))

(declare-datatypes ((List!31403 0))(
  ( (Nil!31400) (Cons!31399 (h!32608 (_ BitVec 64)) (t!45993 List!31403)) )
))
(declare-fun arrayNoDuplicates!0 (array!91778 (_ BitVec 32) List!31403) Bool)

(assert (=> b!1346424 (= res!893414 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31400))))

(declare-fun mapNonEmpty!57916 () Bool)

(declare-fun tp!110224 () Bool)

(assert (=> mapNonEmpty!57916 (= mapRes!57916 (and tp!110224 e!766108))))

(declare-fun mapValue!57916 () ValueCell!17838)

(declare-fun mapKey!57916 () (_ BitVec 32))

(declare-fun mapRest!57916 () (Array (_ BitVec 32) ValueCell!17838))

(assert (=> mapNonEmpty!57916 (= (arr!44346 _values!1303) (store mapRest!57916 mapKey!57916 mapValue!57916))))

(declare-fun b!1346425 () Bool)

(declare-fun res!893412 () Bool)

(assert (=> b!1346425 (=> (not res!893412) (not e!766106))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91778 (_ BitVec 32)) Bool)

(assert (=> b!1346425 (= res!893412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!893413 () Bool)

(assert (=> start!113422 (=> (not res!893413) (not e!766106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113422 (= res!893413 (validMask!0 mask!1977))))

(assert (=> start!113422 e!766106))

(assert (=> start!113422 tp_is_empty!37473))

(assert (=> start!113422 true))

(declare-fun array_inv!33409 (array!91778) Bool)

(assert (=> start!113422 (array_inv!33409 _keys!1571)))

(declare-fun array_inv!33410 (array!91780) Bool)

(assert (=> start!113422 (and (array_inv!33410 _values!1303) e!766105)))

(assert (=> start!113422 tp!110223))

(declare-fun b!1346418 () Bool)

(declare-fun res!893411 () Bool)

(assert (=> b!1346418 (=> (not res!893411) (not e!766106))))

(assert (=> b!1346418 (= res!893411 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44895 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!113422 res!893413) b!1346419))

(assert (= (and b!1346419 res!893415) b!1346425))

(assert (= (and b!1346425 res!893412) b!1346424))

(assert (= (and b!1346424 res!893414) b!1346418))

(assert (= (and b!1346418 res!893411) b!1346422))

(assert (= (and b!1346420 condMapEmpty!57916) mapIsEmpty!57916))

(assert (= (and b!1346420 (not condMapEmpty!57916)) mapNonEmpty!57916))

(get-info :version)

(assert (= (and mapNonEmpty!57916 ((_ is ValueCellFull!17838) mapValue!57916)) b!1346423))

(assert (= (and b!1346420 ((_ is ValueCellFull!17838) mapDefault!57916)) b!1346421))

(assert (= start!113422 b!1346420))

(declare-fun m!1233575 () Bool)

(assert (=> b!1346424 m!1233575))

(declare-fun m!1233577 () Bool)

(assert (=> b!1346422 m!1233577))

(assert (=> b!1346422 m!1233577))

(declare-fun m!1233579 () Bool)

(assert (=> b!1346422 m!1233579))

(declare-fun m!1233581 () Bool)

(assert (=> start!113422 m!1233581))

(declare-fun m!1233583 () Bool)

(assert (=> start!113422 m!1233583))

(declare-fun m!1233585 () Bool)

(assert (=> start!113422 m!1233585))

(declare-fun m!1233587 () Bool)

(assert (=> b!1346425 m!1233587))

(declare-fun m!1233589 () Bool)

(assert (=> mapNonEmpty!57916 m!1233589))

(check-sat (not mapNonEmpty!57916) (not b!1346425) tp_is_empty!37473 (not b_next!31473) (not start!113422) (not b!1346422) (not b!1346424) b_and!50761)
(check-sat b_and!50761 (not b_next!31473))
