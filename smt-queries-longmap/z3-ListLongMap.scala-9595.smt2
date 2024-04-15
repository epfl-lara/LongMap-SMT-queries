; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113432 () Bool)

(assert start!113432)

(declare-fun b_free!31483 () Bool)

(declare-fun b_next!31483 () Bool)

(assert (=> start!113432 (= b_free!31483 (not b_next!31483))))

(declare-fun tp!110255 () Bool)

(declare-fun b_and!50753 () Bool)

(assert (=> start!113432 (= tp!110255 b_and!50753)))

(declare-fun b!1346474 () Bool)

(declare-fun res!893468 () Bool)

(declare-fun e!766148 () Bool)

(assert (=> b!1346474 (=> (not res!893468) (not e!766148))))

(declare-datatypes ((V!55081 0))(
  ( (V!55082 (val!18816 Int)) )
))
(declare-fun minValue!1245 () V!55081)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91745 0))(
  ( (array!91746 (arr!44329 (Array (_ BitVec 32) (_ BitVec 64))) (size!44881 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91745)

(declare-fun zeroValue!1245 () V!55081)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17843 0))(
  ( (ValueCellFull!17843 (v!21463 V!55081)) (EmptyCell!17843) )
))
(declare-datatypes ((array!91747 0))(
  ( (array!91748 (arr!44330 (Array (_ BitVec 32) ValueCell!17843)) (size!44882 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91747)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24324 0))(
  ( (tuple2!24325 (_1!12173 (_ BitVec 64)) (_2!12173 V!55081)) )
))
(declare-datatypes ((List!31459 0))(
  ( (Nil!31456) (Cons!31455 (h!32664 tuple2!24324) (t!46041 List!31459)) )
))
(declare-datatypes ((ListLongMap!21981 0))(
  ( (ListLongMap!21982 (toList!11006 List!31459)) )
))
(declare-fun contains!9111 (ListLongMap!21981 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5845 (array!91745 array!91747 (_ BitVec 32) (_ BitVec 32) V!55081 V!55081 (_ BitVec 32) Int) ListLongMap!21981)

(assert (=> b!1346474 (= res!893468 (contains!9111 (getCurrentListMap!5845 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1346475 () Bool)

(declare-fun res!893467 () Bool)

(assert (=> b!1346475 (=> (not res!893467) (not e!766148))))

(declare-datatypes ((List!31460 0))(
  ( (Nil!31457) (Cons!31456 (h!32665 (_ BitVec 64)) (t!46042 List!31460)) )
))
(declare-fun arrayNoDuplicates!0 (array!91745 (_ BitVec 32) List!31460) Bool)

(assert (=> b!1346475 (= res!893467 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31457))))

(declare-fun b!1346476 () Bool)

(declare-fun res!893464 () Bool)

(assert (=> b!1346476 (=> (not res!893464) (not e!766148))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1346476 (= res!893464 (not (validKeyInArray!0 (select (arr!44329 _keys!1571) from!1960))))))

(declare-fun b!1346477 () Bool)

(declare-fun res!893465 () Bool)

(assert (=> b!1346477 (=> (not res!893465) (not e!766148))))

(assert (=> b!1346477 (= res!893465 (not (= (select (arr!44329 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1346478 () Bool)

(declare-fun res!893470 () Bool)

(assert (=> b!1346478 (=> (not res!893470) (not e!766148))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91745 (_ BitVec 32)) Bool)

(assert (=> b!1346478 (= res!893470 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346479 () Bool)

(declare-fun e!766149 () Bool)

(declare-fun tp_is_empty!37483 () Bool)

(assert (=> b!1346479 (= e!766149 tp_is_empty!37483)))

(declare-fun b!1346480 () Bool)

(declare-fun e!766147 () Bool)

(assert (=> b!1346480 (= e!766147 tp_is_empty!37483)))

(declare-fun b!1346481 () Bool)

(declare-fun e!766150 () Bool)

(declare-fun mapRes!57931 () Bool)

(assert (=> b!1346481 (= e!766150 (and e!766147 mapRes!57931))))

(declare-fun condMapEmpty!57931 () Bool)

(declare-fun mapDefault!57931 () ValueCell!17843)

(assert (=> b!1346481 (= condMapEmpty!57931 (= (arr!44330 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17843)) mapDefault!57931)))))

(declare-fun b!1346482 () Bool)

(declare-fun res!893466 () Bool)

(assert (=> b!1346482 (=> (not res!893466) (not e!766148))))

(assert (=> b!1346482 (= res!893466 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44881 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57931 () Bool)

(declare-fun tp!110254 () Bool)

(assert (=> mapNonEmpty!57931 (= mapRes!57931 (and tp!110254 e!766149))))

(declare-fun mapValue!57931 () ValueCell!17843)

(declare-fun mapRest!57931 () (Array (_ BitVec 32) ValueCell!17843))

(declare-fun mapKey!57931 () (_ BitVec 32))

(assert (=> mapNonEmpty!57931 (= (arr!44330 _values!1303) (store mapRest!57931 mapKey!57931 mapValue!57931))))

(declare-fun b!1346483 () Bool)

(assert (=> b!1346483 (= e!766148 (bvslt (bvadd #b00000000000000000000000000000001 from!1960) #b00000000000000000000000000000000))))

(declare-fun b!1346484 () Bool)

(declare-fun res!893463 () Bool)

(assert (=> b!1346484 (=> (not res!893463) (not e!766148))))

(assert (=> b!1346484 (= res!893463 (and (= (size!44882 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44881 _keys!1571) (size!44882 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!893469 () Bool)

(assert (=> start!113432 (=> (not res!893469) (not e!766148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113432 (= res!893469 (validMask!0 mask!1977))))

(assert (=> start!113432 e!766148))

(assert (=> start!113432 tp_is_empty!37483))

(assert (=> start!113432 true))

(declare-fun array_inv!33595 (array!91745) Bool)

(assert (=> start!113432 (array_inv!33595 _keys!1571)))

(declare-fun array_inv!33596 (array!91747) Bool)

(assert (=> start!113432 (and (array_inv!33596 _values!1303) e!766150)))

(assert (=> start!113432 tp!110255))

(declare-fun mapIsEmpty!57931 () Bool)

(assert (=> mapIsEmpty!57931 mapRes!57931))

(assert (= (and start!113432 res!893469) b!1346484))

(assert (= (and b!1346484 res!893463) b!1346478))

(assert (= (and b!1346478 res!893470) b!1346475))

(assert (= (and b!1346475 res!893467) b!1346482))

(assert (= (and b!1346482 res!893466) b!1346474))

(assert (= (and b!1346474 res!893468) b!1346477))

(assert (= (and b!1346477 res!893465) b!1346476))

(assert (= (and b!1346476 res!893464) b!1346483))

(assert (= (and b!1346481 condMapEmpty!57931) mapIsEmpty!57931))

(assert (= (and b!1346481 (not condMapEmpty!57931)) mapNonEmpty!57931))

(get-info :version)

(assert (= (and mapNonEmpty!57931 ((_ is ValueCellFull!17843) mapValue!57931)) b!1346479))

(assert (= (and b!1346481 ((_ is ValueCellFull!17843) mapDefault!57931)) b!1346480))

(assert (= start!113432 b!1346481))

(declare-fun m!1233139 () Bool)

(assert (=> mapNonEmpty!57931 m!1233139))

(declare-fun m!1233141 () Bool)

(assert (=> start!113432 m!1233141))

(declare-fun m!1233143 () Bool)

(assert (=> start!113432 m!1233143))

(declare-fun m!1233145 () Bool)

(assert (=> start!113432 m!1233145))

(declare-fun m!1233147 () Bool)

(assert (=> b!1346476 m!1233147))

(assert (=> b!1346476 m!1233147))

(declare-fun m!1233149 () Bool)

(assert (=> b!1346476 m!1233149))

(declare-fun m!1233151 () Bool)

(assert (=> b!1346474 m!1233151))

(assert (=> b!1346474 m!1233151))

(declare-fun m!1233153 () Bool)

(assert (=> b!1346474 m!1233153))

(declare-fun m!1233155 () Bool)

(assert (=> b!1346475 m!1233155))

(declare-fun m!1233157 () Bool)

(assert (=> b!1346478 m!1233157))

(assert (=> b!1346477 m!1233147))

(check-sat (not mapNonEmpty!57931) b_and!50753 (not b!1346478) tp_is_empty!37483 (not b_next!31483) (not b!1346475) (not start!113432) (not b!1346476) (not b!1346474))
(check-sat b_and!50753 (not b_next!31483))
