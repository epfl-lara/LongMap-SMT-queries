; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113756 () Bool)

(assert start!113756)

(declare-fun b_free!31525 () Bool)

(declare-fun b_next!31525 () Bool)

(assert (=> start!113756 (= b_free!31525 (not b_next!31525))))

(declare-fun tp!110384 () Bool)

(declare-fun b_and!50841 () Bool)

(assert (=> start!113756 (= tp!110384 b_and!50841)))

(declare-fun b!1348916 () Bool)

(declare-fun res!894664 () Bool)

(declare-fun e!767581 () Bool)

(assert (=> b!1348916 (=> (not res!894664) (not e!767581))))

(declare-datatypes ((array!91993 0))(
  ( (array!91994 (arr!44447 (Array (_ BitVec 32) (_ BitVec 64))) (size!44998 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91993)

(declare-datatypes ((List!31473 0))(
  ( (Nil!31470) (Cons!31469 (h!32687 (_ BitVec 64)) (t!46069 List!31473)) )
))
(declare-fun arrayNoDuplicates!0 (array!91993 (_ BitVec 32) List!31473) Bool)

(assert (=> b!1348916 (= res!894664 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31470))))

(declare-fun b!1348917 () Bool)

(declare-fun res!894661 () Bool)

(assert (=> b!1348917 (=> (not res!894661) (not e!767581))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1348917 (= res!894661 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1348918 () Bool)

(declare-fun res!894663 () Bool)

(assert (=> b!1348918 (=> (not res!894663) (not e!767581))))

(declare-datatypes ((V!55137 0))(
  ( (V!55138 (val!18837 Int)) )
))
(declare-fun minValue!1245 () V!55137)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55137)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17864 0))(
  ( (ValueCellFull!17864 (v!21483 V!55137)) (EmptyCell!17864) )
))
(declare-datatypes ((array!91995 0))(
  ( (array!91996 (arr!44448 (Array (_ BitVec 32) ValueCell!17864)) (size!44999 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91995)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24334 0))(
  ( (tuple2!24335 (_1!12178 (_ BitVec 64)) (_2!12178 V!55137)) )
))
(declare-datatypes ((List!31474 0))(
  ( (Nil!31471) (Cons!31470 (h!32688 tuple2!24334) (t!46070 List!31474)) )
))
(declare-datatypes ((ListLongMap!21999 0))(
  ( (ListLongMap!22000 (toList!11015 List!31474)) )
))
(declare-fun contains!9204 (ListLongMap!21999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5953 (array!91993 array!91995 (_ BitVec 32) (_ BitVec 32) V!55137 V!55137 (_ BitVec 32) Int) ListLongMap!21999)

(assert (=> b!1348918 (= res!894663 (contains!9204 (getCurrentListMap!5953 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348919 () Bool)

(declare-fun res!894666 () Bool)

(assert (=> b!1348919 (=> (not res!894666) (not e!767581))))

(assert (=> b!1348919 (= res!894666 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44998 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348920 () Bool)

(declare-fun res!894659 () Bool)

(assert (=> b!1348920 (=> (not res!894659) (not e!767581))))

(assert (=> b!1348920 (= res!894659 (not (= (select (arr!44447 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348922 () Bool)

(declare-fun res!894665 () Bool)

(assert (=> b!1348922 (=> (not res!894665) (not e!767581))))

(assert (=> b!1348922 (= res!894665 (and (= (size!44999 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44998 _keys!1571) (size!44999 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348923 () Bool)

(declare-fun e!767583 () Bool)

(declare-fun tp_is_empty!37525 () Bool)

(assert (=> b!1348923 (= e!767583 tp_is_empty!37525)))

(declare-fun b!1348924 () Bool)

(declare-fun e!767584 () Bool)

(assert (=> b!1348924 (= e!767584 tp_is_empty!37525)))

(declare-fun b!1348925 () Bool)

(declare-fun res!894660 () Bool)

(assert (=> b!1348925 (=> (not res!894660) (not e!767581))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91993 (_ BitVec 32)) Bool)

(assert (=> b!1348925 (= res!894660 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57998 () Bool)

(declare-fun mapRes!57998 () Bool)

(declare-fun tp!110383 () Bool)

(assert (=> mapNonEmpty!57998 (= mapRes!57998 (and tp!110383 e!767584))))

(declare-fun mapKey!57998 () (_ BitVec 32))

(declare-fun mapValue!57998 () ValueCell!17864)

(declare-fun mapRest!57998 () (Array (_ BitVec 32) ValueCell!17864))

(assert (=> mapNonEmpty!57998 (= (arr!44448 _values!1303) (store mapRest!57998 mapKey!57998 mapValue!57998))))

(declare-fun b!1348926 () Bool)

(assert (=> b!1348926 (= e!767581 (not true))))

(declare-fun lt!596310 () ListLongMap!21999)

(assert (=> b!1348926 (contains!9204 lt!596310 k0!1142)))

(declare-datatypes ((Unit!44089 0))(
  ( (Unit!44090) )
))
(declare-fun lt!596309 () Unit!44089)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!393 ((_ BitVec 64) (_ BitVec 64) V!55137 ListLongMap!21999) Unit!44089)

(assert (=> b!1348926 (= lt!596309 (lemmaInListMapAfterAddingDiffThenInBefore!393 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!596310))))

(declare-fun +!4877 (ListLongMap!21999 tuple2!24334) ListLongMap!21999)

(declare-fun getCurrentListMapNoExtraKeys!6530 (array!91993 array!91995 (_ BitVec 32) (_ BitVec 32) V!55137 V!55137 (_ BitVec 32) Int) ListLongMap!21999)

(declare-fun get!22464 (ValueCell!17864 V!55137) V!55137)

(declare-fun dynLambda!3831 (Int (_ BitVec 64)) V!55137)

(assert (=> b!1348926 (= lt!596310 (+!4877 (getCurrentListMapNoExtraKeys!6530 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24335 (select (arr!44447 _keys!1571) from!1960) (get!22464 (select (arr!44448 _values!1303) from!1960) (dynLambda!3831 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1348927 () Bool)

(declare-fun e!767585 () Bool)

(assert (=> b!1348927 (= e!767585 (and e!767583 mapRes!57998))))

(declare-fun condMapEmpty!57998 () Bool)

(declare-fun mapDefault!57998 () ValueCell!17864)

(assert (=> b!1348927 (= condMapEmpty!57998 (= (arr!44448 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17864)) mapDefault!57998)))))

(declare-fun mapIsEmpty!57998 () Bool)

(assert (=> mapIsEmpty!57998 mapRes!57998))

(declare-fun b!1348921 () Bool)

(declare-fun res!894667 () Bool)

(assert (=> b!1348921 (=> (not res!894667) (not e!767581))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348921 (= res!894667 (validKeyInArray!0 (select (arr!44447 _keys!1571) from!1960)))))

(declare-fun res!894662 () Bool)

(assert (=> start!113756 (=> (not res!894662) (not e!767581))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113756 (= res!894662 (validMask!0 mask!1977))))

(assert (=> start!113756 e!767581))

(assert (=> start!113756 tp_is_empty!37525))

(assert (=> start!113756 true))

(declare-fun array_inv!33745 (array!91993) Bool)

(assert (=> start!113756 (array_inv!33745 _keys!1571)))

(declare-fun array_inv!33746 (array!91995) Bool)

(assert (=> start!113756 (and (array_inv!33746 _values!1303) e!767585)))

(assert (=> start!113756 tp!110384))

(assert (= (and start!113756 res!894662) b!1348922))

(assert (= (and b!1348922 res!894665) b!1348925))

(assert (= (and b!1348925 res!894660) b!1348916))

(assert (= (and b!1348916 res!894664) b!1348919))

(assert (= (and b!1348919 res!894666) b!1348918))

(assert (= (and b!1348918 res!894663) b!1348920))

(assert (= (and b!1348920 res!894659) b!1348921))

(assert (= (and b!1348921 res!894667) b!1348917))

(assert (= (and b!1348917 res!894661) b!1348926))

(assert (= (and b!1348927 condMapEmpty!57998) mapIsEmpty!57998))

(assert (= (and b!1348927 (not condMapEmpty!57998)) mapNonEmpty!57998))

(get-info :version)

(assert (= (and mapNonEmpty!57998 ((_ is ValueCellFull!17864) mapValue!57998)) b!1348924))

(assert (= (and b!1348927 ((_ is ValueCellFull!17864) mapDefault!57998)) b!1348923))

(assert (= start!113756 b!1348927))

(declare-fun b_lambda!24593 () Bool)

(assert (=> (not b_lambda!24593) (not b!1348926)))

(declare-fun t!46068 () Bool)

(declare-fun tb!12399 () Bool)

(assert (=> (and start!113756 (= defaultEntry!1306 defaultEntry!1306) t!46068) tb!12399))

(declare-fun result!25899 () Bool)

(assert (=> tb!12399 (= result!25899 tp_is_empty!37525)))

(assert (=> b!1348926 t!46068))

(declare-fun b_and!50843 () Bool)

(assert (= b_and!50841 (and (=> t!46068 result!25899) b_and!50843)))

(declare-fun m!1236283 () Bool)

(assert (=> start!113756 m!1236283))

(declare-fun m!1236285 () Bool)

(assert (=> start!113756 m!1236285))

(declare-fun m!1236287 () Bool)

(assert (=> start!113756 m!1236287))

(declare-fun m!1236289 () Bool)

(assert (=> b!1348921 m!1236289))

(assert (=> b!1348921 m!1236289))

(declare-fun m!1236291 () Bool)

(assert (=> b!1348921 m!1236291))

(assert (=> b!1348920 m!1236289))

(declare-fun m!1236293 () Bool)

(assert (=> mapNonEmpty!57998 m!1236293))

(declare-fun m!1236295 () Bool)

(assert (=> b!1348925 m!1236295))

(declare-fun m!1236297 () Bool)

(assert (=> b!1348926 m!1236297))

(declare-fun m!1236299 () Bool)

(assert (=> b!1348926 m!1236299))

(declare-fun m!1236301 () Bool)

(assert (=> b!1348926 m!1236301))

(declare-fun m!1236303 () Bool)

(assert (=> b!1348926 m!1236303))

(assert (=> b!1348926 m!1236297))

(declare-fun m!1236305 () Bool)

(assert (=> b!1348926 m!1236305))

(assert (=> b!1348926 m!1236299))

(assert (=> b!1348926 m!1236301))

(declare-fun m!1236307 () Bool)

(assert (=> b!1348926 m!1236307))

(declare-fun m!1236309 () Bool)

(assert (=> b!1348926 m!1236309))

(assert (=> b!1348926 m!1236289))

(declare-fun m!1236311 () Bool)

(assert (=> b!1348916 m!1236311))

(declare-fun m!1236313 () Bool)

(assert (=> b!1348918 m!1236313))

(assert (=> b!1348918 m!1236313))

(declare-fun m!1236315 () Bool)

(assert (=> b!1348918 m!1236315))

(check-sat (not mapNonEmpty!57998) (not b_lambda!24593) (not b!1348926) tp_is_empty!37525 (not b!1348925) b_and!50843 (not b!1348916) (not b!1348921) (not start!113756) (not b!1348918) (not b_next!31525))
(check-sat b_and!50843 (not b_next!31525))
