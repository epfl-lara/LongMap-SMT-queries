; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113518 () Bool)

(assert start!113518)

(declare-fun b_free!31345 () Bool)

(declare-fun b_next!31345 () Bool)

(assert (=> start!113518 (= b_free!31345 (not b_next!31345))))

(declare-fun tp!109839 () Bool)

(declare-fun b_and!50569 () Bool)

(assert (=> start!113518 (= tp!109839 b_and!50569)))

(declare-fun mapIsEmpty!57724 () Bool)

(declare-fun mapRes!57724 () Bool)

(assert (=> mapIsEmpty!57724 mapRes!57724))

(declare-fun b!1345530 () Bool)

(declare-fun e!765907 () Bool)

(declare-fun e!765908 () Bool)

(assert (=> b!1345530 (= e!765907 (and e!765908 mapRes!57724))))

(declare-fun condMapEmpty!57724 () Bool)

(declare-datatypes ((V!54897 0))(
  ( (V!54898 (val!18747 Int)) )
))
(declare-datatypes ((ValueCell!17774 0))(
  ( (ValueCellFull!17774 (v!21390 V!54897)) (EmptyCell!17774) )
))
(declare-datatypes ((array!91641 0))(
  ( (array!91642 (arr!44272 (Array (_ BitVec 32) ValueCell!17774)) (size!44823 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91641)

(declare-fun mapDefault!57724 () ValueCell!17774)

(assert (=> b!1345530 (= condMapEmpty!57724 (= (arr!44272 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17774)) mapDefault!57724)))))

(declare-fun b!1345532 () Bool)

(declare-fun res!892387 () Bool)

(declare-fun e!765910 () Bool)

(assert (=> b!1345532 (=> (not res!892387) (not e!765910))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91643 0))(
  ( (array!91644 (arr!44273 (Array (_ BitVec 32) (_ BitVec 64))) (size!44824 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91643)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1345532 (= res!892387 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44824 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!57724 () Bool)

(declare-fun tp!109840 () Bool)

(declare-fun e!765909 () Bool)

(assert (=> mapNonEmpty!57724 (= mapRes!57724 (and tp!109840 e!765909))))

(declare-fun mapKey!57724 () (_ BitVec 32))

(declare-fun mapRest!57724 () (Array (_ BitVec 32) ValueCell!17774))

(declare-fun mapValue!57724 () ValueCell!17774)

(assert (=> mapNonEmpty!57724 (= (arr!44272 _values!1303) (store mapRest!57724 mapKey!57724 mapValue!57724))))

(declare-fun b!1345533 () Bool)

(declare-fun tp_is_empty!37345 () Bool)

(assert (=> b!1345533 (= e!765908 tp_is_empty!37345)))

(declare-fun b!1345534 () Bool)

(declare-fun res!892384 () Bool)

(assert (=> b!1345534 (=> (not res!892384) (not e!765910))))

(declare-datatypes ((List!31344 0))(
  ( (Nil!31341) (Cons!31340 (h!32558 (_ BitVec 64)) (t!45860 List!31344)) )
))
(declare-fun arrayNoDuplicates!0 (array!91643 (_ BitVec 32) List!31344) Bool)

(assert (=> b!1345534 (= res!892384 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31341))))

(declare-fun b!1345535 () Bool)

(assert (=> b!1345535 (= e!765910 false)))

(declare-fun minValue!1245 () V!54897)

(declare-fun lt!595643 () Bool)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!54897)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24202 0))(
  ( (tuple2!24203 (_1!12112 (_ BitVec 64)) (_2!12112 V!54897)) )
))
(declare-datatypes ((List!31345 0))(
  ( (Nil!31342) (Cons!31341 (h!32559 tuple2!24202) (t!45861 List!31345)) )
))
(declare-datatypes ((ListLongMap!21867 0))(
  ( (ListLongMap!21868 (toList!10949 List!31345)) )
))
(declare-fun contains!9137 (ListLongMap!21867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5893 (array!91643 array!91641 (_ BitVec 32) (_ BitVec 32) V!54897 V!54897 (_ BitVec 32) Int) ListLongMap!21867)

(assert (=> b!1345535 (= lt!595643 (contains!9137 (getCurrentListMap!5893 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345531 () Bool)

(declare-fun res!892388 () Bool)

(assert (=> b!1345531 (=> (not res!892388) (not e!765910))))

(assert (=> b!1345531 (= res!892388 (and (= (size!44823 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44824 _keys!1571) (size!44823 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!892386 () Bool)

(assert (=> start!113518 (=> (not res!892386) (not e!765910))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113518 (= res!892386 (validMask!0 mask!1977))))

(assert (=> start!113518 e!765910))

(assert (=> start!113518 tp_is_empty!37345))

(assert (=> start!113518 true))

(declare-fun array_inv!33637 (array!91643) Bool)

(assert (=> start!113518 (array_inv!33637 _keys!1571)))

(declare-fun array_inv!33638 (array!91641) Bool)

(assert (=> start!113518 (and (array_inv!33638 _values!1303) e!765907)))

(assert (=> start!113518 tp!109839))

(declare-fun b!1345536 () Bool)

(assert (=> b!1345536 (= e!765909 tp_is_empty!37345)))

(declare-fun b!1345537 () Bool)

(declare-fun res!892385 () Bool)

(assert (=> b!1345537 (=> (not res!892385) (not e!765910))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91643 (_ BitVec 32)) Bool)

(assert (=> b!1345537 (= res!892385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113518 res!892386) b!1345531))

(assert (= (and b!1345531 res!892388) b!1345537))

(assert (= (and b!1345537 res!892385) b!1345534))

(assert (= (and b!1345534 res!892384) b!1345532))

(assert (= (and b!1345532 res!892387) b!1345535))

(assert (= (and b!1345530 condMapEmpty!57724) mapIsEmpty!57724))

(assert (= (and b!1345530 (not condMapEmpty!57724)) mapNonEmpty!57724))

(get-info :version)

(assert (= (and mapNonEmpty!57724 ((_ is ValueCellFull!17774) mapValue!57724)) b!1345536))

(assert (= (and b!1345530 ((_ is ValueCellFull!17774) mapDefault!57724)) b!1345533))

(assert (= start!113518 b!1345530))

(declare-fun m!1233501 () Bool)

(assert (=> b!1345537 m!1233501))

(declare-fun m!1233503 () Bool)

(assert (=> b!1345535 m!1233503))

(assert (=> b!1345535 m!1233503))

(declare-fun m!1233505 () Bool)

(assert (=> b!1345535 m!1233505))

(declare-fun m!1233507 () Bool)

(assert (=> b!1345534 m!1233507))

(declare-fun m!1233509 () Bool)

(assert (=> start!113518 m!1233509))

(declare-fun m!1233511 () Bool)

(assert (=> start!113518 m!1233511))

(declare-fun m!1233513 () Bool)

(assert (=> start!113518 m!1233513))

(declare-fun m!1233515 () Bool)

(assert (=> mapNonEmpty!57724 m!1233515))

(check-sat (not b!1345534) (not b_next!31345) (not mapNonEmpty!57724) tp_is_empty!37345 (not b!1345535) b_and!50569 (not start!113518) (not b!1345537))
(check-sat b_and!50569 (not b_next!31345))
