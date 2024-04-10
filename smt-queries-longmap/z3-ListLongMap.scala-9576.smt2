; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113320 () Bool)

(assert start!113320)

(declare-fun b_free!31371 () Bool)

(declare-fun b_next!31371 () Bool)

(assert (=> start!113320 (= b_free!31371 (not b_next!31371))))

(declare-fun tp!109917 () Bool)

(declare-fun b_and!50595 () Bool)

(assert (=> start!113320 (= tp!109917 b_and!50595)))

(declare-fun b!1344592 () Bool)

(declare-fun res!892116 () Bool)

(declare-fun e!765262 () Bool)

(assert (=> b!1344592 (=> (not res!892116) (not e!765262))))

(declare-datatypes ((array!91582 0))(
  ( (array!91583 (arr!44247 (Array (_ BitVec 32) (_ BitVec 64))) (size!44797 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91582)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344592 (= res!892116 (validKeyInArray!0 (select (arr!44247 _keys!1571) from!1960)))))

(declare-fun b!1344593 () Bool)

(declare-fun res!892112 () Bool)

(assert (=> b!1344593 (=> (not res!892112) (not e!765262))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54931 0))(
  ( (V!54932 (val!18760 Int)) )
))
(declare-datatypes ((ValueCell!17787 0))(
  ( (ValueCellFull!17787 (v!21408 V!54931)) (EmptyCell!17787) )
))
(declare-datatypes ((array!91584 0))(
  ( (array!91585 (arr!44248 (Array (_ BitVec 32) ValueCell!17787)) (size!44798 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91584)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1344593 (= res!892112 (and (= (size!44798 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44797 _keys!1571) (size!44798 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344594 () Bool)

(declare-fun res!892110 () Bool)

(assert (=> b!1344594 (=> (not res!892110) (not e!765262))))

(declare-fun minValue!1245 () V!54931)

(declare-fun zeroValue!1245 () V!54931)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24178 0))(
  ( (tuple2!24179 (_1!12100 (_ BitVec 64)) (_2!12100 V!54931)) )
))
(declare-datatypes ((List!31333 0))(
  ( (Nil!31330) (Cons!31329 (h!32538 tuple2!24178) (t!45861 List!31333)) )
))
(declare-datatypes ((ListLongMap!21835 0))(
  ( (ListLongMap!21836 (toList!10933 List!31333)) )
))
(declare-fun contains!9109 (ListLongMap!21835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5889 (array!91582 array!91584 (_ BitVec 32) (_ BitVec 32) V!54931 V!54931 (_ BitVec 32) Int) ListLongMap!21835)

(assert (=> b!1344594 (= res!892110 (contains!9109 (getCurrentListMap!5889 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344595 () Bool)

(declare-fun res!892109 () Bool)

(assert (=> b!1344595 (=> (not res!892109) (not e!765262))))

(assert (=> b!1344595 (= res!892109 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun res!892115 () Bool)

(assert (=> start!113320 (=> (not res!892115) (not e!765262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113320 (= res!892115 (validMask!0 mask!1977))))

(assert (=> start!113320 e!765262))

(declare-fun tp_is_empty!37371 () Bool)

(assert (=> start!113320 tp_is_empty!37371))

(assert (=> start!113320 true))

(declare-fun array_inv!33347 (array!91582) Bool)

(assert (=> start!113320 (array_inv!33347 _keys!1571)))

(declare-fun e!765260 () Bool)

(declare-fun array_inv!33348 (array!91584) Bool)

(assert (=> start!113320 (and (array_inv!33348 _values!1303) e!765260)))

(assert (=> start!113320 tp!109917))

(declare-fun b!1344596 () Bool)

(declare-fun e!765263 () Bool)

(assert (=> b!1344596 (= e!765263 tp_is_empty!37371)))

(declare-fun b!1344597 () Bool)

(declare-fun res!892111 () Bool)

(assert (=> b!1344597 (=> (not res!892111) (not e!765262))))

(assert (=> b!1344597 (= res!892111 (not (= (select (arr!44247 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344598 () Bool)

(declare-fun mapRes!57763 () Bool)

(assert (=> b!1344598 (= e!765260 (and e!765263 mapRes!57763))))

(declare-fun condMapEmpty!57763 () Bool)

(declare-fun mapDefault!57763 () ValueCell!17787)

(assert (=> b!1344598 (= condMapEmpty!57763 (= (arr!44248 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17787)) mapDefault!57763)))))

(declare-fun b!1344599 () Bool)

(declare-fun res!892114 () Bool)

(assert (=> b!1344599 (=> (not res!892114) (not e!765262))))

(assert (=> b!1344599 (= res!892114 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44797 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344600 () Bool)

(declare-fun e!765261 () Bool)

(assert (=> b!1344600 (= e!765261 tp_is_empty!37371)))

(declare-fun b!1344601 () Bool)

(declare-fun res!892108 () Bool)

(assert (=> b!1344601 (=> (not res!892108) (not e!765262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91582 (_ BitVec 32)) Bool)

(assert (=> b!1344601 (= res!892108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1344602 () Bool)

(assert (=> b!1344602 (= e!765262 false)))

(declare-fun lt!595197 () Bool)

(declare-fun +!4820 (ListLongMap!21835 tuple2!24178) ListLongMap!21835)

(declare-fun getCurrentListMapNoExtraKeys!6462 (array!91582 array!91584 (_ BitVec 32) (_ BitVec 32) V!54931 V!54931 (_ BitVec 32) Int) ListLongMap!21835)

(declare-fun get!22349 (ValueCell!17787 V!54931) V!54931)

(declare-fun dynLambda!3759 (Int (_ BitVec 64)) V!54931)

(assert (=> b!1344602 (= lt!595197 (contains!9109 (+!4820 (getCurrentListMapNoExtraKeys!6462 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24179 (select (arr!44247 _keys!1571) from!1960) (get!22349 (select (arr!44248 _values!1303) from!1960) (dynLambda!3759 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142))))

(declare-fun b!1344603 () Bool)

(declare-fun res!892113 () Bool)

(assert (=> b!1344603 (=> (not res!892113) (not e!765262))))

(declare-datatypes ((List!31334 0))(
  ( (Nil!31331) (Cons!31330 (h!32539 (_ BitVec 64)) (t!45862 List!31334)) )
))
(declare-fun arrayNoDuplicates!0 (array!91582 (_ BitVec 32) List!31334) Bool)

(assert (=> b!1344603 (= res!892113 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31331))))

(declare-fun mapIsEmpty!57763 () Bool)

(assert (=> mapIsEmpty!57763 mapRes!57763))

(declare-fun mapNonEmpty!57763 () Bool)

(declare-fun tp!109918 () Bool)

(assert (=> mapNonEmpty!57763 (= mapRes!57763 (and tp!109918 e!765261))))

(declare-fun mapValue!57763 () ValueCell!17787)

(declare-fun mapKey!57763 () (_ BitVec 32))

(declare-fun mapRest!57763 () (Array (_ BitVec 32) ValueCell!17787))

(assert (=> mapNonEmpty!57763 (= (arr!44248 _values!1303) (store mapRest!57763 mapKey!57763 mapValue!57763))))

(assert (= (and start!113320 res!892115) b!1344593))

(assert (= (and b!1344593 res!892112) b!1344601))

(assert (= (and b!1344601 res!892108) b!1344603))

(assert (= (and b!1344603 res!892113) b!1344599))

(assert (= (and b!1344599 res!892114) b!1344594))

(assert (= (and b!1344594 res!892110) b!1344597))

(assert (= (and b!1344597 res!892111) b!1344592))

(assert (= (and b!1344592 res!892116) b!1344595))

(assert (= (and b!1344595 res!892109) b!1344602))

(assert (= (and b!1344598 condMapEmpty!57763) mapIsEmpty!57763))

(assert (= (and b!1344598 (not condMapEmpty!57763)) mapNonEmpty!57763))

(get-info :version)

(assert (= (and mapNonEmpty!57763 ((_ is ValueCellFull!17787) mapValue!57763)) b!1344600))

(assert (= (and b!1344598 ((_ is ValueCellFull!17787) mapDefault!57763)) b!1344596))

(assert (= start!113320 b!1344598))

(declare-fun b_lambda!24493 () Bool)

(assert (=> (not b_lambda!24493) (not b!1344602)))

(declare-fun t!45860 () Bool)

(declare-fun tb!12331 () Bool)

(assert (=> (and start!113320 (= defaultEntry!1306 defaultEntry!1306) t!45860) tb!12331))

(declare-fun result!25753 () Bool)

(assert (=> tb!12331 (= result!25753 tp_is_empty!37371)))

(assert (=> b!1344602 t!45860))

(declare-fun b_and!50597 () Bool)

(assert (= b_and!50595 (and (=> t!45860 result!25753) b_and!50597)))

(declare-fun m!1232139 () Bool)

(assert (=> b!1344602 m!1232139))

(declare-fun m!1232141 () Bool)

(assert (=> b!1344602 m!1232141))

(declare-fun m!1232143 () Bool)

(assert (=> b!1344602 m!1232143))

(declare-fun m!1232145 () Bool)

(assert (=> b!1344602 m!1232145))

(assert (=> b!1344602 m!1232139))

(declare-fun m!1232147 () Bool)

(assert (=> b!1344602 m!1232147))

(assert (=> b!1344602 m!1232141))

(assert (=> b!1344602 m!1232143))

(assert (=> b!1344602 m!1232147))

(declare-fun m!1232149 () Bool)

(assert (=> b!1344602 m!1232149))

(declare-fun m!1232151 () Bool)

(assert (=> b!1344602 m!1232151))

(assert (=> b!1344597 m!1232151))

(declare-fun m!1232153 () Bool)

(assert (=> start!113320 m!1232153))

(declare-fun m!1232155 () Bool)

(assert (=> start!113320 m!1232155))

(declare-fun m!1232157 () Bool)

(assert (=> start!113320 m!1232157))

(declare-fun m!1232159 () Bool)

(assert (=> mapNonEmpty!57763 m!1232159))

(assert (=> b!1344592 m!1232151))

(assert (=> b!1344592 m!1232151))

(declare-fun m!1232161 () Bool)

(assert (=> b!1344592 m!1232161))

(declare-fun m!1232163 () Bool)

(assert (=> b!1344601 m!1232163))

(declare-fun m!1232165 () Bool)

(assert (=> b!1344603 m!1232165))

(declare-fun m!1232167 () Bool)

(assert (=> b!1344594 m!1232167))

(assert (=> b!1344594 m!1232167))

(declare-fun m!1232169 () Bool)

(assert (=> b!1344594 m!1232169))

(check-sat (not mapNonEmpty!57763) (not start!113320) tp_is_empty!37371 (not b!1344603) (not b!1344601) (not b!1344602) (not b!1344592) (not b_next!31371) (not b_lambda!24493) b_and!50597 (not b!1344594))
(check-sat b_and!50597 (not b_next!31371))
