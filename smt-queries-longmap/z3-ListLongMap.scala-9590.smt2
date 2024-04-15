; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113402 () Bool)

(assert start!113402)

(declare-fun b_free!31453 () Bool)

(declare-fun b_next!31453 () Bool)

(assert (=> start!113402 (= b_free!31453 (not b_next!31453))))

(declare-fun tp!110165 () Bool)

(declare-fun b_and!50723 () Bool)

(assert (=> start!113402 (= tp!110165 b_and!50723)))

(declare-fun b!1346108 () Bool)

(declare-fun res!893236 () Bool)

(declare-fun e!765922 () Bool)

(assert (=> b!1346108 (=> (not res!893236) (not e!765922))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((array!91685 0))(
  ( (array!91686 (arr!44299 (Array (_ BitVec 32) (_ BitVec 64))) (size!44851 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91685)

(assert (=> b!1346108 (= res!893236 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44851 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!893234 () Bool)

(assert (=> start!113402 (=> (not res!893234) (not e!765922))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113402 (= res!893234 (validMask!0 mask!1977))))

(assert (=> start!113402 e!765922))

(declare-fun tp_is_empty!37453 () Bool)

(assert (=> start!113402 tp_is_empty!37453))

(assert (=> start!113402 true))

(declare-fun array_inv!33575 (array!91685) Bool)

(assert (=> start!113402 (array_inv!33575 _keys!1571)))

(declare-datatypes ((V!55041 0))(
  ( (V!55042 (val!18801 Int)) )
))
(declare-datatypes ((ValueCell!17828 0))(
  ( (ValueCellFull!17828 (v!21448 V!55041)) (EmptyCell!17828) )
))
(declare-datatypes ((array!91687 0))(
  ( (array!91688 (arr!44300 (Array (_ BitVec 32) ValueCell!17828)) (size!44852 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91687)

(declare-fun e!765924 () Bool)

(declare-fun array_inv!33576 (array!91687) Bool)

(assert (=> start!113402 (and (array_inv!33576 _values!1303) e!765924)))

(assert (=> start!113402 tp!110165))

(declare-fun b!1346109 () Bool)

(declare-fun res!893232 () Bool)

(assert (=> b!1346109 (=> (not res!893232) (not e!765922))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91685 (_ BitVec 32)) Bool)

(assert (=> b!1346109 (= res!893232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1346110 () Bool)

(declare-fun res!893233 () Bool)

(assert (=> b!1346110 (=> (not res!893233) (not e!765922))))

(declare-datatypes ((List!31440 0))(
  ( (Nil!31437) (Cons!31436 (h!32645 (_ BitVec 64)) (t!46022 List!31440)) )
))
(declare-fun arrayNoDuplicates!0 (array!91685 (_ BitVec 32) List!31440) Bool)

(assert (=> b!1346110 (= res!893233 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31437))))

(declare-fun b!1346111 () Bool)

(declare-fun e!765925 () Bool)

(assert (=> b!1346111 (= e!765925 tp_is_empty!37453)))

(declare-fun b!1346112 () Bool)

(declare-fun res!893235 () Bool)

(assert (=> b!1346112 (=> (not res!893235) (not e!765922))))

(assert (=> b!1346112 (= res!893235 (and (= (size!44852 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44851 _keys!1571) (size!44852 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1346113 () Bool)

(declare-fun mapRes!57886 () Bool)

(assert (=> b!1346113 (= e!765924 (and e!765925 mapRes!57886))))

(declare-fun condMapEmpty!57886 () Bool)

(declare-fun mapDefault!57886 () ValueCell!17828)

(assert (=> b!1346113 (= condMapEmpty!57886 (= (arr!44300 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17828)) mapDefault!57886)))))

(declare-fun mapIsEmpty!57886 () Bool)

(assert (=> mapIsEmpty!57886 mapRes!57886))

(declare-fun mapNonEmpty!57886 () Bool)

(declare-fun tp!110164 () Bool)

(declare-fun e!765926 () Bool)

(assert (=> mapNonEmpty!57886 (= mapRes!57886 (and tp!110164 e!765926))))

(declare-fun mapKey!57886 () (_ BitVec 32))

(declare-fun mapValue!57886 () ValueCell!17828)

(declare-fun mapRest!57886 () (Array (_ BitVec 32) ValueCell!17828))

(assert (=> mapNonEmpty!57886 (= (arr!44300 _values!1303) (store mapRest!57886 mapKey!57886 mapValue!57886))))

(declare-fun b!1346114 () Bool)

(assert (=> b!1346114 (= e!765926 tp_is_empty!37453)))

(declare-fun b!1346115 () Bool)

(assert (=> b!1346115 (= e!765922 false)))

(declare-fun minValue!1245 () V!55041)

(declare-fun zeroValue!1245 () V!55041)

(declare-fun lt!595296 () Bool)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24304 0))(
  ( (tuple2!24305 (_1!12163 (_ BitVec 64)) (_2!12163 V!55041)) )
))
(declare-datatypes ((List!31441 0))(
  ( (Nil!31438) (Cons!31437 (h!32646 tuple2!24304) (t!46023 List!31441)) )
))
(declare-datatypes ((ListLongMap!21961 0))(
  ( (ListLongMap!21962 (toList!10996 List!31441)) )
))
(declare-fun contains!9101 (ListLongMap!21961 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5835 (array!91685 array!91687 (_ BitVec 32) (_ BitVec 32) V!55041 V!55041 (_ BitVec 32) Int) ListLongMap!21961)

(assert (=> b!1346115 (= lt!595296 (contains!9101 (getCurrentListMap!5835 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113402 res!893234) b!1346112))

(assert (= (and b!1346112 res!893235) b!1346109))

(assert (= (and b!1346109 res!893232) b!1346110))

(assert (= (and b!1346110 res!893233) b!1346108))

(assert (= (and b!1346108 res!893236) b!1346115))

(assert (= (and b!1346113 condMapEmpty!57886) mapIsEmpty!57886))

(assert (= (and b!1346113 (not condMapEmpty!57886)) mapNonEmpty!57886))

(get-info :version)

(assert (= (and mapNonEmpty!57886 ((_ is ValueCellFull!17828) mapValue!57886)) b!1346114))

(assert (= (and b!1346113 ((_ is ValueCellFull!17828) mapDefault!57886)) b!1346111))

(assert (= start!113402 b!1346113))

(declare-fun m!1232899 () Bool)

(assert (=> b!1346110 m!1232899))

(declare-fun m!1232901 () Bool)

(assert (=> b!1346115 m!1232901))

(assert (=> b!1346115 m!1232901))

(declare-fun m!1232903 () Bool)

(assert (=> b!1346115 m!1232903))

(declare-fun m!1232905 () Bool)

(assert (=> start!113402 m!1232905))

(declare-fun m!1232907 () Bool)

(assert (=> start!113402 m!1232907))

(declare-fun m!1232909 () Bool)

(assert (=> start!113402 m!1232909))

(declare-fun m!1232911 () Bool)

(assert (=> b!1346109 m!1232911))

(declare-fun m!1232913 () Bool)

(assert (=> mapNonEmpty!57886 m!1232913))

(check-sat (not start!113402) (not b_next!31453) (not b!1346110) b_and!50723 (not mapNonEmpty!57886) (not b!1346115) (not b!1346109) tp_is_empty!37453)
(check-sat b_and!50723 (not b_next!31453))
