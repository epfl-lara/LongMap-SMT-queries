; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113476 () Bool)

(assert start!113476)

(declare-fun b_free!31303 () Bool)

(declare-fun b_next!31303 () Bool)

(assert (=> start!113476 (= b_free!31303 (not b_next!31303))))

(declare-fun tp!109713 () Bool)

(declare-fun b_and!50515 () Bool)

(assert (=> start!113476 (= tp!109713 b_and!50515)))

(declare-fun res!892006 () Bool)

(declare-fun e!765595 () Bool)

(assert (=> start!113476 (=> (not res!892006) (not e!765595))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113476 (= res!892006 (validMask!0 mask!1977))))

(assert (=> start!113476 e!765595))

(declare-fun tp_is_empty!37303 () Bool)

(assert (=> start!113476 tp_is_empty!37303))

(assert (=> start!113476 true))

(declare-datatypes ((array!91563 0))(
  ( (array!91564 (arr!44233 (Array (_ BitVec 32) (_ BitVec 64))) (size!44784 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91563)

(declare-fun array_inv!33613 (array!91563) Bool)

(assert (=> start!113476 (array_inv!33613 _keys!1571)))

(declare-datatypes ((V!54841 0))(
  ( (V!54842 (val!18726 Int)) )
))
(declare-datatypes ((ValueCell!17753 0))(
  ( (ValueCellFull!17753 (v!21369 V!54841)) (EmptyCell!17753) )
))
(declare-datatypes ((array!91565 0))(
  ( (array!91566 (arr!44234 (Array (_ BitVec 32) ValueCell!17753)) (size!44785 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91565)

(declare-fun e!765592 () Bool)

(declare-fun array_inv!33614 (array!91565) Bool)

(assert (=> start!113476 (and (array_inv!33614 _values!1303) e!765592)))

(assert (=> start!113476 tp!109713))

(declare-fun b!1344950 () Bool)

(assert (=> b!1344950 (= e!765595 (not true))))

(declare-datatypes ((tuple2!24174 0))(
  ( (tuple2!24175 (_1!12098 (_ BitVec 64)) (_2!12098 V!54841)) )
))
(declare-datatypes ((List!31319 0))(
  ( (Nil!31316) (Cons!31315 (h!32533 tuple2!24174) (t!45825 List!31319)) )
))
(declare-datatypes ((ListLongMap!21839 0))(
  ( (ListLongMap!21840 (toList!10935 List!31319)) )
))
(declare-fun lt!595503 () ListLongMap!21839)

(declare-fun zeroValue!1245 () V!54841)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9123 (ListLongMap!21839 (_ BitVec 64)) Bool)

(declare-fun +!4848 (ListLongMap!21839 tuple2!24174) ListLongMap!21839)

(assert (=> b!1344950 (contains!9123 (+!4848 lt!595503 (tuple2!24175 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44036 0))(
  ( (Unit!44037) )
))
(declare-fun lt!595502 () Unit!44036)

(declare-fun addStillContains!1210 (ListLongMap!21839 (_ BitVec 64) V!54841 (_ BitVec 64)) Unit!44036)

(assert (=> b!1344950 (= lt!595502 (addStillContains!1210 lt!595503 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1344950 (contains!9123 lt!595503 k0!1142)))

(declare-fun lt!595505 () Unit!44036)

(declare-fun lt!595504 () V!54841)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!374 ((_ BitVec 64) (_ BitVec 64) V!54841 ListLongMap!21839) Unit!44036)

(assert (=> b!1344950 (= lt!595505 (lemmaInListMapAfterAddingDiffThenInBefore!374 k0!1142 (select (arr!44233 _keys!1571) from!1960) lt!595504 lt!595503))))

(declare-fun lt!595501 () ListLongMap!21839)

(assert (=> b!1344950 (contains!9123 lt!595501 k0!1142)))

(declare-fun lt!595500 () Unit!44036)

(assert (=> b!1344950 (= lt!595500 (lemmaInListMapAfterAddingDiffThenInBefore!374 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595501))))

(assert (=> b!1344950 (= lt!595501 (+!4848 lt!595503 (tuple2!24175 (select (arr!44233 _keys!1571) from!1960) lt!595504)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22358 (ValueCell!17753 V!54841) V!54841)

(declare-fun dynLambda!3802 (Int (_ BitVec 64)) V!54841)

(assert (=> b!1344950 (= lt!595504 (get!22358 (select (arr!44234 _values!1303) from!1960) (dynLambda!3802 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54841)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6497 (array!91563 array!91565 (_ BitVec 32) (_ BitVec 32) V!54841 V!54841 (_ BitVec 32) Int) ListLongMap!21839)

(assert (=> b!1344950 (= lt!595503 (getCurrentListMapNoExtraKeys!6497 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1344951 () Bool)

(declare-fun e!765596 () Bool)

(assert (=> b!1344951 (= e!765596 tp_is_empty!37303)))

(declare-fun b!1344952 () Bool)

(declare-fun res!892011 () Bool)

(assert (=> b!1344952 (=> (not res!892011) (not e!765595))))

(declare-fun getCurrentListMap!5879 (array!91563 array!91565 (_ BitVec 32) (_ BitVec 32) V!54841 V!54841 (_ BitVec 32) Int) ListLongMap!21839)

(assert (=> b!1344952 (= res!892011 (contains!9123 (getCurrentListMap!5879 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57661 () Bool)

(declare-fun mapRes!57661 () Bool)

(assert (=> mapIsEmpty!57661 mapRes!57661))

(declare-fun b!1344953 () Bool)

(declare-fun res!892008 () Bool)

(assert (=> b!1344953 (=> (not res!892008) (not e!765595))))

(assert (=> b!1344953 (= res!892008 (not (= (select (arr!44233 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1344954 () Bool)

(declare-fun res!892007 () Bool)

(assert (=> b!1344954 (=> (not res!892007) (not e!765595))))

(declare-datatypes ((List!31320 0))(
  ( (Nil!31317) (Cons!31316 (h!32534 (_ BitVec 64)) (t!45826 List!31320)) )
))
(declare-fun arrayNoDuplicates!0 (array!91563 (_ BitVec 32) List!31320) Bool)

(assert (=> b!1344954 (= res!892007 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31317))))

(declare-fun b!1344955 () Bool)

(declare-fun res!892013 () Bool)

(assert (=> b!1344955 (=> (not res!892013) (not e!765595))))

(assert (=> b!1344955 (= res!892013 (and (= (size!44785 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44784 _keys!1571) (size!44785 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1344956 () Bool)

(declare-fun res!892009 () Bool)

(assert (=> b!1344956 (=> (not res!892009) (not e!765595))))

(assert (=> b!1344956 (= res!892009 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1344957 () Bool)

(declare-fun res!892010 () Bool)

(assert (=> b!1344957 (=> (not res!892010) (not e!765595))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344957 (= res!892010 (validKeyInArray!0 (select (arr!44233 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!57661 () Bool)

(declare-fun tp!109714 () Bool)

(assert (=> mapNonEmpty!57661 (= mapRes!57661 (and tp!109714 e!765596))))

(declare-fun mapRest!57661 () (Array (_ BitVec 32) ValueCell!17753))

(declare-fun mapValue!57661 () ValueCell!17753)

(declare-fun mapKey!57661 () (_ BitVec 32))

(assert (=> mapNonEmpty!57661 (= (arr!44234 _values!1303) (store mapRest!57661 mapKey!57661 mapValue!57661))))

(declare-fun b!1344958 () Bool)

(declare-fun e!765593 () Bool)

(assert (=> b!1344958 (= e!765593 tp_is_empty!37303)))

(declare-fun b!1344959 () Bool)

(assert (=> b!1344959 (= e!765592 (and e!765593 mapRes!57661))))

(declare-fun condMapEmpty!57661 () Bool)

(declare-fun mapDefault!57661 () ValueCell!17753)

(assert (=> b!1344959 (= condMapEmpty!57661 (= (arr!44234 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17753)) mapDefault!57661)))))

(declare-fun b!1344960 () Bool)

(declare-fun res!892012 () Bool)

(assert (=> b!1344960 (=> (not res!892012) (not e!765595))))

(assert (=> b!1344960 (= res!892012 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44784 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344961 () Bool)

(declare-fun res!892005 () Bool)

(assert (=> b!1344961 (=> (not res!892005) (not e!765595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91563 (_ BitVec 32)) Bool)

(assert (=> b!1344961 (= res!892005 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113476 res!892006) b!1344955))

(assert (= (and b!1344955 res!892013) b!1344961))

(assert (= (and b!1344961 res!892005) b!1344954))

(assert (= (and b!1344954 res!892007) b!1344960))

(assert (= (and b!1344960 res!892012) b!1344952))

(assert (= (and b!1344952 res!892011) b!1344953))

(assert (= (and b!1344953 res!892008) b!1344957))

(assert (= (and b!1344957 res!892010) b!1344956))

(assert (= (and b!1344956 res!892009) b!1344950))

(assert (= (and b!1344959 condMapEmpty!57661) mapIsEmpty!57661))

(assert (= (and b!1344959 (not condMapEmpty!57661)) mapNonEmpty!57661))

(get-info :version)

(assert (= (and mapNonEmpty!57661 ((_ is ValueCellFull!17753) mapValue!57661)) b!1344951))

(assert (= (and b!1344959 ((_ is ValueCellFull!17753) mapDefault!57661)) b!1344958))

(assert (= start!113476 b!1344959))

(declare-fun b_lambda!24473 () Bool)

(assert (=> (not b_lambda!24473) (not b!1344950)))

(declare-fun t!45824 () Bool)

(declare-fun tb!12309 () Bool)

(assert (=> (and start!113476 (= defaultEntry!1306 defaultEntry!1306) t!45824) tb!12309))

(declare-fun result!25717 () Bool)

(assert (=> tb!12309 (= result!25717 tp_is_empty!37303)))

(assert (=> b!1344950 t!45824))

(declare-fun b_and!50517 () Bool)

(assert (= b_and!50515 (and (=> t!45824 result!25717) b_and!50517)))

(declare-fun m!1232997 () Bool)

(assert (=> b!1344953 m!1232997))

(declare-fun m!1232999 () Bool)

(assert (=> b!1344950 m!1232999))

(declare-fun m!1233001 () Bool)

(assert (=> b!1344950 m!1233001))

(declare-fun m!1233003 () Bool)

(assert (=> b!1344950 m!1233003))

(declare-fun m!1233005 () Bool)

(assert (=> b!1344950 m!1233005))

(declare-fun m!1233007 () Bool)

(assert (=> b!1344950 m!1233007))

(assert (=> b!1344950 m!1232999))

(declare-fun m!1233009 () Bool)

(assert (=> b!1344950 m!1233009))

(assert (=> b!1344950 m!1233003))

(assert (=> b!1344950 m!1232997))

(declare-fun m!1233011 () Bool)

(assert (=> b!1344950 m!1233011))

(assert (=> b!1344950 m!1232997))

(declare-fun m!1233013 () Bool)

(assert (=> b!1344950 m!1233013))

(declare-fun m!1233015 () Bool)

(assert (=> b!1344950 m!1233015))

(declare-fun m!1233017 () Bool)

(assert (=> b!1344950 m!1233017))

(declare-fun m!1233019 () Bool)

(assert (=> b!1344950 m!1233019))

(declare-fun m!1233021 () Bool)

(assert (=> b!1344950 m!1233021))

(assert (=> b!1344950 m!1233001))

(declare-fun m!1233023 () Bool)

(assert (=> b!1344961 m!1233023))

(declare-fun m!1233025 () Bool)

(assert (=> mapNonEmpty!57661 m!1233025))

(declare-fun m!1233027 () Bool)

(assert (=> b!1344954 m!1233027))

(declare-fun m!1233029 () Bool)

(assert (=> b!1344952 m!1233029))

(assert (=> b!1344952 m!1233029))

(declare-fun m!1233031 () Bool)

(assert (=> b!1344952 m!1233031))

(assert (=> b!1344957 m!1232997))

(assert (=> b!1344957 m!1232997))

(declare-fun m!1233033 () Bool)

(assert (=> b!1344957 m!1233033))

(declare-fun m!1233035 () Bool)

(assert (=> start!113476 m!1233035))

(declare-fun m!1233037 () Bool)

(assert (=> start!113476 m!1233037))

(declare-fun m!1233039 () Bool)

(assert (=> start!113476 m!1233039))

(check-sat tp_is_empty!37303 (not mapNonEmpty!57661) (not b!1344950) (not b!1344954) (not b!1344952) (not b!1344961) (not b_lambda!24473) (not b_next!31303) (not start!113476) (not b!1344957) b_and!50517)
(check-sat b_and!50517 (not b_next!31303))
