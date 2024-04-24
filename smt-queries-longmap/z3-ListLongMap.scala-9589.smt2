; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113620 () Bool)

(assert start!113620)

(declare-fun b_free!31447 () Bool)

(declare-fun b_next!31447 () Bool)

(assert (=> start!113620 (= b_free!31447 (not b_next!31447))))

(declare-fun tp!110146 () Bool)

(declare-fun b_and!50737 () Bool)

(assert (=> start!113620 (= tp!110146 b_and!50737)))

(declare-fun b!1347405 () Bool)

(declare-fun e!766753 () Bool)

(declare-fun tp_is_empty!37447 () Bool)

(assert (=> b!1347405 (= e!766753 tp_is_empty!37447)))

(declare-fun b!1347406 () Bool)

(declare-fun res!893736 () Bool)

(declare-fun e!766756 () Bool)

(assert (=> b!1347406 (=> (not res!893736) (not e!766756))))

(declare-datatypes ((array!91839 0))(
  ( (array!91840 (arr!44371 (Array (_ BitVec 32) (_ BitVec 64))) (size!44922 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91839)

(declare-datatypes ((List!31416 0))(
  ( (Nil!31413) (Cons!31412 (h!32630 (_ BitVec 64)) (t!45998 List!31416)) )
))
(declare-fun arrayNoDuplicates!0 (array!91839 (_ BitVec 32) List!31416) Bool)

(assert (=> b!1347406 (= res!893736 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31413))))

(declare-fun b!1347408 () Bool)

(declare-fun e!766754 () Bool)

(declare-fun e!766755 () Bool)

(declare-fun mapRes!57877 () Bool)

(assert (=> b!1347408 (= e!766754 (and e!766755 mapRes!57877))))

(declare-fun condMapEmpty!57877 () Bool)

(declare-datatypes ((V!55033 0))(
  ( (V!55034 (val!18798 Int)) )
))
(declare-datatypes ((ValueCell!17825 0))(
  ( (ValueCellFull!17825 (v!21441 V!55033)) (EmptyCell!17825) )
))
(declare-datatypes ((array!91841 0))(
  ( (array!91842 (arr!44372 (Array (_ BitVec 32) ValueCell!17825)) (size!44923 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91841)

(declare-fun mapDefault!57877 () ValueCell!17825)

(assert (=> b!1347408 (= condMapEmpty!57877 (= (arr!44372 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17825)) mapDefault!57877)))))

(declare-fun b!1347409 () Bool)

(declare-fun res!893738 () Bool)

(assert (=> b!1347409 (=> (not res!893738) (not e!766756))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91839 (_ BitVec 32)) Bool)

(assert (=> b!1347409 (= res!893738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57877 () Bool)

(assert (=> mapIsEmpty!57877 mapRes!57877))

(declare-fun b!1347410 () Bool)

(assert (=> b!1347410 (= e!766756 false)))

(declare-fun minValue!1245 () V!55033)

(declare-fun lt!595949 () Bool)

(declare-fun zeroValue!1245 () V!55033)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24274 0))(
  ( (tuple2!24275 (_1!12148 (_ BitVec 64)) (_2!12148 V!55033)) )
))
(declare-datatypes ((List!31417 0))(
  ( (Nil!31414) (Cons!31413 (h!32631 tuple2!24274) (t!45999 List!31417)) )
))
(declare-datatypes ((ListLongMap!21939 0))(
  ( (ListLongMap!21940 (toList!10985 List!31417)) )
))
(declare-fun contains!9173 (ListLongMap!21939 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5925 (array!91839 array!91841 (_ BitVec 32) (_ BitVec 32) V!55033 V!55033 (_ BitVec 32) Int) ListLongMap!21939)

(assert (=> b!1347410 (= lt!595949 (contains!9173 (getCurrentListMap!5925 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1347411 () Bool)

(declare-fun res!893737 () Bool)

(assert (=> b!1347411 (=> (not res!893737) (not e!766756))))

(assert (=> b!1347411 (= res!893737 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44922 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!893735 () Bool)

(assert (=> start!113620 (=> (not res!893735) (not e!766756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113620 (= res!893735 (validMask!0 mask!1977))))

(assert (=> start!113620 e!766756))

(assert (=> start!113620 tp_is_empty!37447))

(assert (=> start!113620 true))

(declare-fun array_inv!33697 (array!91839) Bool)

(assert (=> start!113620 (array_inv!33697 _keys!1571)))

(declare-fun array_inv!33698 (array!91841) Bool)

(assert (=> start!113620 (and (array_inv!33698 _values!1303) e!766754)))

(assert (=> start!113620 tp!110146))

(declare-fun b!1347407 () Bool)

(declare-fun res!893734 () Bool)

(assert (=> b!1347407 (=> (not res!893734) (not e!766756))))

(assert (=> b!1347407 (= res!893734 (and (= (size!44923 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44922 _keys!1571) (size!44923 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1347412 () Bool)

(assert (=> b!1347412 (= e!766755 tp_is_empty!37447)))

(declare-fun mapNonEmpty!57877 () Bool)

(declare-fun tp!110145 () Bool)

(assert (=> mapNonEmpty!57877 (= mapRes!57877 (and tp!110145 e!766753))))

(declare-fun mapValue!57877 () ValueCell!17825)

(declare-fun mapRest!57877 () (Array (_ BitVec 32) ValueCell!17825))

(declare-fun mapKey!57877 () (_ BitVec 32))

(assert (=> mapNonEmpty!57877 (= (arr!44372 _values!1303) (store mapRest!57877 mapKey!57877 mapValue!57877))))

(assert (= (and start!113620 res!893735) b!1347407))

(assert (= (and b!1347407 res!893734) b!1347409))

(assert (= (and b!1347409 res!893738) b!1347406))

(assert (= (and b!1347406 res!893736) b!1347411))

(assert (= (and b!1347411 res!893737) b!1347410))

(assert (= (and b!1347408 condMapEmpty!57877) mapIsEmpty!57877))

(assert (= (and b!1347408 (not condMapEmpty!57877)) mapNonEmpty!57877))

(get-info :version)

(assert (= (and mapNonEmpty!57877 ((_ is ValueCellFull!17825) mapValue!57877)) b!1347405))

(assert (= (and b!1347408 ((_ is ValueCellFull!17825) mapDefault!57877)) b!1347412))

(assert (= start!113620 b!1347408))

(declare-fun m!1234965 () Bool)

(assert (=> mapNonEmpty!57877 m!1234965))

(declare-fun m!1234967 () Bool)

(assert (=> b!1347406 m!1234967))

(declare-fun m!1234969 () Bool)

(assert (=> start!113620 m!1234969))

(declare-fun m!1234971 () Bool)

(assert (=> start!113620 m!1234971))

(declare-fun m!1234973 () Bool)

(assert (=> start!113620 m!1234973))

(declare-fun m!1234975 () Bool)

(assert (=> b!1347409 m!1234975))

(declare-fun m!1234977 () Bool)

(assert (=> b!1347410 m!1234977))

(assert (=> b!1347410 m!1234977))

(declare-fun m!1234979 () Bool)

(assert (=> b!1347410 m!1234979))

(check-sat (not start!113620) (not b!1347406) (not mapNonEmpty!57877) tp_is_empty!37447 (not b_next!31447) (not b!1347410) (not b!1347409) b_and!50737)
(check-sat b_and!50737 (not b_next!31447))
