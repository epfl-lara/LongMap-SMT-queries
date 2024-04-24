; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134488 () Bool)

(assert start!134488)

(declare-fun b_free!32203 () Bool)

(declare-fun b_next!32203 () Bool)

(assert (=> start!134488 (= b_free!32203 (not b_next!32203))))

(declare-fun tp!113928 () Bool)

(declare-fun b_and!51849 () Bool)

(assert (=> start!134488 (= tp!113928 b_and!51849)))

(declare-fun b!1569439 () Bool)

(declare-fun e!874986 () Bool)

(declare-fun e!874988 () Bool)

(declare-fun mapRes!59874 () Bool)

(assert (=> b!1569439 (= e!874986 (and e!874988 mapRes!59874))))

(declare-fun condMapEmpty!59874 () Bool)

(declare-datatypes ((V!60185 0))(
  ( (V!60186 (val!19575 Int)) )
))
(declare-datatypes ((ValueCell!18461 0))(
  ( (ValueCellFull!18461 (v!22326 V!60185)) (EmptyCell!18461) )
))
(declare-datatypes ((array!104776 0))(
  ( (array!104777 (arr!50566 (Array (_ BitVec 32) ValueCell!18461)) (size!51117 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104776)

(declare-fun mapDefault!59874 () ValueCell!18461)

(assert (=> b!1569439 (= condMapEmpty!59874 (= (arr!50566 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18461)) mapDefault!59874)))))

(declare-fun b!1569440 () Bool)

(declare-fun res!1071843 () Bool)

(declare-fun e!874990 () Bool)

(assert (=> b!1569440 (=> (not res!1071843) (not e!874990))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104778 0))(
  ( (array!104779 (arr!50567 (Array (_ BitVec 32) (_ BitVec 64))) (size!51118 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104778)

(assert (=> b!1569440 (= res!1071843 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51118 _keys!637)) (bvslt from!782 (size!51118 _keys!637))))))

(declare-fun b!1569441 () Bool)

(declare-fun res!1071838 () Bool)

(assert (=> b!1569441 (=> (not res!1071838) (not e!874990))))

(declare-datatypes ((List!36677 0))(
  ( (Nil!36674) (Cons!36673 (h!38138 (_ BitVec 64)) (t!51573 List!36677)) )
))
(declare-fun arrayNoDuplicates!0 (array!104778 (_ BitVec 32) List!36677) Bool)

(assert (=> b!1569441 (= res!1071838 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36674))))

(declare-fun res!1071842 () Bool)

(assert (=> start!134488 (=> (not res!1071842) (not e!874990))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134488 (= res!1071842 (validMask!0 mask!947))))

(assert (=> start!134488 e!874990))

(assert (=> start!134488 tp!113928))

(declare-fun tp_is_empty!38983 () Bool)

(assert (=> start!134488 tp_is_empty!38983))

(assert (=> start!134488 true))

(declare-fun array_inv!39527 (array!104778) Bool)

(assert (=> start!134488 (array_inv!39527 _keys!637)))

(declare-fun array_inv!39528 (array!104776) Bool)

(assert (=> start!134488 (and (array_inv!39528 _values!487) e!874986)))

(declare-fun b!1569442 () Bool)

(declare-fun e!874987 () Bool)

(assert (=> b!1569442 (= e!874990 e!874987)))

(declare-fun res!1071841 () Bool)

(assert (=> b!1569442 (=> (not res!1071841) (not e!874987))))

(declare-datatypes ((tuple2!25314 0))(
  ( (tuple2!25315 (_1!12668 (_ BitVec 64)) (_2!12668 V!60185)) )
))
(declare-datatypes ((List!36678 0))(
  ( (Nil!36675) (Cons!36674 (h!38139 tuple2!25314) (t!51574 List!36678)) )
))
(declare-datatypes ((ListLongMap!22757 0))(
  ( (ListLongMap!22758 (toList!11394 List!36678)) )
))
(declare-fun lt!673752 () ListLongMap!22757)

(declare-fun contains!10399 (ListLongMap!22757 (_ BitVec 64)) Bool)

(assert (=> b!1569442 (= res!1071841 (not (contains!10399 lt!673752 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60185)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun minValue!453 () V!60185)

(declare-fun getCurrentListMapNoExtraKeys!6774 (array!104778 array!104776 (_ BitVec 32) (_ BitVec 32) V!60185 V!60185 (_ BitVec 32) Int) ListLongMap!22757)

(assert (=> b!1569442 (= lt!673752 (getCurrentListMapNoExtraKeys!6774 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1569443 () Bool)

(declare-fun res!1071837 () Bool)

(assert (=> b!1569443 (=> (not res!1071837) (not e!874990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104778 (_ BitVec 32)) Bool)

(assert (=> b!1569443 (= res!1071837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1569444 () Bool)

(declare-fun res!1071840 () Bool)

(assert (=> b!1569444 (=> (not res!1071840) (not e!874990))))

(assert (=> b!1569444 (= res!1071840 (and (= (size!51117 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51118 _keys!637) (size!51117 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1569445 () Bool)

(declare-fun e!874989 () Bool)

(assert (=> b!1569445 (= e!874989 tp_is_empty!38983)))

(declare-fun mapIsEmpty!59874 () Bool)

(assert (=> mapIsEmpty!59874 mapRes!59874))

(declare-fun b!1569446 () Bool)

(assert (=> b!1569446 (= e!874987 false)))

(declare-fun lt!673753 () Bool)

(assert (=> b!1569446 (= lt!673753 (contains!10399 lt!673752 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!59874 () Bool)

(declare-fun tp!113927 () Bool)

(assert (=> mapNonEmpty!59874 (= mapRes!59874 (and tp!113927 e!874989))))

(declare-fun mapValue!59874 () ValueCell!18461)

(declare-fun mapKey!59874 () (_ BitVec 32))

(declare-fun mapRest!59874 () (Array (_ BitVec 32) ValueCell!18461))

(assert (=> mapNonEmpty!59874 (= (arr!50566 _values!487) (store mapRest!59874 mapKey!59874 mapValue!59874))))

(declare-fun b!1569447 () Bool)

(declare-fun res!1071839 () Bool)

(assert (=> b!1569447 (=> (not res!1071839) (not e!874990))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1569447 (= res!1071839 (not (validKeyInArray!0 (select (arr!50567 _keys!637) from!782))))))

(declare-fun b!1569448 () Bool)

(assert (=> b!1569448 (= e!874988 tp_is_empty!38983)))

(assert (= (and start!134488 res!1071842) b!1569444))

(assert (= (and b!1569444 res!1071840) b!1569443))

(assert (= (and b!1569443 res!1071837) b!1569441))

(assert (= (and b!1569441 res!1071838) b!1569440))

(assert (= (and b!1569440 res!1071843) b!1569447))

(assert (= (and b!1569447 res!1071839) b!1569442))

(assert (= (and b!1569442 res!1071841) b!1569446))

(assert (= (and b!1569439 condMapEmpty!59874) mapIsEmpty!59874))

(assert (= (and b!1569439 (not condMapEmpty!59874)) mapNonEmpty!59874))

(get-info :version)

(assert (= (and mapNonEmpty!59874 ((_ is ValueCellFull!18461) mapValue!59874)) b!1569445))

(assert (= (and b!1569439 ((_ is ValueCellFull!18461) mapDefault!59874)) b!1569448))

(assert (= start!134488 b!1569439))

(declare-fun m!1444237 () Bool)

(assert (=> b!1569447 m!1444237))

(assert (=> b!1569447 m!1444237))

(declare-fun m!1444239 () Bool)

(assert (=> b!1569447 m!1444239))

(declare-fun m!1444241 () Bool)

(assert (=> start!134488 m!1444241))

(declare-fun m!1444243 () Bool)

(assert (=> start!134488 m!1444243))

(declare-fun m!1444245 () Bool)

(assert (=> start!134488 m!1444245))

(declare-fun m!1444247 () Bool)

(assert (=> b!1569441 m!1444247))

(declare-fun m!1444249 () Bool)

(assert (=> mapNonEmpty!59874 m!1444249))

(declare-fun m!1444251 () Bool)

(assert (=> b!1569443 m!1444251))

(declare-fun m!1444253 () Bool)

(assert (=> b!1569442 m!1444253))

(declare-fun m!1444255 () Bool)

(assert (=> b!1569442 m!1444255))

(declare-fun m!1444257 () Bool)

(assert (=> b!1569446 m!1444257))

(check-sat (not b_next!32203) (not b!1569442) (not b!1569446) b_and!51849 tp_is_empty!38983 (not b!1569443) (not b!1569447) (not start!134488) (not mapNonEmpty!59874) (not b!1569441))
(check-sat b_and!51849 (not b_next!32203))
