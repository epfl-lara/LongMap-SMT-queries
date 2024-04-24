; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111652 () Bool)

(assert start!111652)

(declare-fun b_free!30085 () Bool)

(declare-fun b_next!30085 () Bool)

(assert (=> start!111652 (= b_free!30085 (not b_next!30085))))

(declare-fun tp!105730 () Bool)

(declare-fun b_and!48331 () Bool)

(assert (=> start!111652 (= tp!105730 b_and!48331)))

(declare-fun b!1320004 () Bool)

(declare-fun res!875715 () Bool)

(declare-fun e!753321 () Bool)

(assert (=> b!1320004 (=> (not res!875715) (not e!753321))))

(declare-datatypes ((array!88827 0))(
  ( (array!88828 (arr!42883 (Array (_ BitVec 32) (_ BitVec 64))) (size!43434 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88827)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88827 (_ BitVec 32)) Bool)

(assert (=> b!1320004 (= res!875715 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!875719 () Bool)

(assert (=> start!111652 (=> (not res!875719) (not e!753321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111652 (= res!875719 (validMask!0 mask!2019))))

(assert (=> start!111652 e!753321))

(declare-fun array_inv!32649 (array!88827) Bool)

(assert (=> start!111652 (array_inv!32649 _keys!1609)))

(assert (=> start!111652 true))

(declare-fun tp_is_empty!35905 () Bool)

(assert (=> start!111652 tp_is_empty!35905))

(declare-datatypes ((V!52977 0))(
  ( (V!52978 (val!18027 Int)) )
))
(declare-datatypes ((ValueCell!17054 0))(
  ( (ValueCellFull!17054 (v!20652 V!52977)) (EmptyCell!17054) )
))
(declare-datatypes ((array!88829 0))(
  ( (array!88830 (arr!42884 (Array (_ BitVec 32) ValueCell!17054)) (size!43435 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88829)

(declare-fun e!753320 () Bool)

(declare-fun array_inv!32650 (array!88829) Bool)

(assert (=> start!111652 (and (array_inv!32650 _values!1337) e!753320)))

(assert (=> start!111652 tp!105730))

(declare-fun b!1320005 () Bool)

(declare-fun e!753318 () Bool)

(assert (=> b!1320005 (= e!753318 tp_is_empty!35905)))

(declare-fun mapIsEmpty!55505 () Bool)

(declare-fun mapRes!55505 () Bool)

(assert (=> mapIsEmpty!55505 mapRes!55505))

(declare-fun b!1320006 () Bool)

(declare-fun res!875717 () Bool)

(assert (=> b!1320006 (=> (not res!875717) (not e!753321))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!52977)

(declare-fun minValue!1279 () V!52977)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23230 0))(
  ( (tuple2!23231 (_1!11626 (_ BitVec 64)) (_2!11626 V!52977)) )
))
(declare-datatypes ((List!30394 0))(
  ( (Nil!30391) (Cons!30390 (h!31608 tuple2!23230) (t!44020 List!30394)) )
))
(declare-datatypes ((ListLongMap!20895 0))(
  ( (ListLongMap!20896 (toList!10463 List!30394)) )
))
(declare-fun contains!8630 (ListLongMap!20895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5466 (array!88827 array!88829 (_ BitVec 32) (_ BitVec 32) V!52977 V!52977 (_ BitVec 32) Int) ListLongMap!20895)

(assert (=> b!1320006 (= res!875717 (contains!8630 (getCurrentListMap!5466 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1320007 () Bool)

(declare-fun res!875721 () Bool)

(assert (=> b!1320007 (=> (not res!875721) (not e!753321))))

(declare-datatypes ((List!30395 0))(
  ( (Nil!30392) (Cons!30391 (h!31609 (_ BitVec 64)) (t!44021 List!30395)) )
))
(declare-fun arrayNoDuplicates!0 (array!88827 (_ BitVec 32) List!30395) Bool)

(assert (=> b!1320007 (= res!875721 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30392))))

(declare-fun b!1320008 () Bool)

(declare-fun res!875718 () Bool)

(assert (=> b!1320008 (=> (not res!875718) (not e!753321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1320008 (= res!875718 (validKeyInArray!0 (select (arr!42883 _keys!1609) from!2000)))))

(declare-fun mapNonEmpty!55505 () Bool)

(declare-fun tp!105731 () Bool)

(assert (=> mapNonEmpty!55505 (= mapRes!55505 (and tp!105731 e!753318))))

(declare-fun mapKey!55505 () (_ BitVec 32))

(declare-fun mapValue!55505 () ValueCell!17054)

(declare-fun mapRest!55505 () (Array (_ BitVec 32) ValueCell!17054))

(assert (=> mapNonEmpty!55505 (= (arr!42884 _values!1337) (store mapRest!55505 mapKey!55505 mapValue!55505))))

(declare-fun b!1320009 () Bool)

(declare-fun e!753319 () Bool)

(assert (=> b!1320009 (= e!753320 (and e!753319 mapRes!55505))))

(declare-fun condMapEmpty!55505 () Bool)

(declare-fun mapDefault!55505 () ValueCell!17054)

(assert (=> b!1320009 (= condMapEmpty!55505 (= (arr!42884 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17054)) mapDefault!55505)))))

(declare-fun b!1320010 () Bool)

(declare-fun res!875722 () Bool)

(assert (=> b!1320010 (=> (not res!875722) (not e!753321))))

(assert (=> b!1320010 (= res!875722 (and (= (size!43435 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43434 _keys!1609) (size!43435 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1320011 () Bool)

(assert (=> b!1320011 (= e!753321 (not true))))

(declare-fun lt!586990 () ListLongMap!20895)

(assert (=> b!1320011 (contains!8630 lt!586990 k0!1164)))

(declare-datatypes ((Unit!43391 0))(
  ( (Unit!43392) )
))
(declare-fun lt!586991 () Unit!43391)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!107 ((_ BitVec 64) (_ BitVec 64) V!52977 ListLongMap!20895) Unit!43391)

(assert (=> b!1320011 (= lt!586991 (lemmaInListMapAfterAddingDiffThenInBefore!107 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586990))))

(declare-fun +!4552 (ListLongMap!20895 tuple2!23230) ListLongMap!20895)

(declare-fun getCurrentListMapNoExtraKeys!6191 (array!88827 array!88829 (_ BitVec 32) (_ BitVec 32) V!52977 V!52977 (_ BitVec 32) Int) ListLongMap!20895)

(declare-fun get!21575 (ValueCell!17054 V!52977) V!52977)

(declare-fun dynLambda!3506 (Int (_ BitVec 64)) V!52977)

(assert (=> b!1320011 (= lt!586990 (+!4552 (+!4552 (getCurrentListMapNoExtraKeys!6191 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23231 (select (arr!42883 _keys!1609) from!2000) (get!21575 (select (arr!42884 _values!1337) from!2000) (dynLambda!3506 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1320012 () Bool)

(assert (=> b!1320012 (= e!753319 tp_is_empty!35905)))

(declare-fun b!1320013 () Bool)

(declare-fun res!875720 () Bool)

(assert (=> b!1320013 (=> (not res!875720) (not e!753321))))

(assert (=> b!1320013 (= res!875720 (not (= (select (arr!42883 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1320014 () Bool)

(declare-fun res!875716 () Bool)

(assert (=> b!1320014 (=> (not res!875716) (not e!753321))))

(assert (=> b!1320014 (= res!875716 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43434 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111652 res!875719) b!1320010))

(assert (= (and b!1320010 res!875722) b!1320004))

(assert (= (and b!1320004 res!875715) b!1320007))

(assert (= (and b!1320007 res!875721) b!1320014))

(assert (= (and b!1320014 res!875716) b!1320006))

(assert (= (and b!1320006 res!875717) b!1320013))

(assert (= (and b!1320013 res!875720) b!1320008))

(assert (= (and b!1320008 res!875718) b!1320011))

(assert (= (and b!1320009 condMapEmpty!55505) mapIsEmpty!55505))

(assert (= (and b!1320009 (not condMapEmpty!55505)) mapNonEmpty!55505))

(get-info :version)

(assert (= (and mapNonEmpty!55505 ((_ is ValueCellFull!17054) mapValue!55505)) b!1320005))

(assert (= (and b!1320009 ((_ is ValueCellFull!17054) mapDefault!55505)) b!1320012))

(assert (= start!111652 b!1320009))

(declare-fun b_lambda!23405 () Bool)

(assert (=> (not b_lambda!23405) (not b!1320011)))

(declare-fun t!44019 () Bool)

(declare-fun tb!11429 () Bool)

(assert (=> (and start!111652 (= defaultEntry!1340 defaultEntry!1340) t!44019) tb!11429))

(declare-fun result!23921 () Bool)

(assert (=> tb!11429 (= result!23921 tp_is_empty!35905)))

(assert (=> b!1320011 t!44019))

(declare-fun b_and!48333 () Bool)

(assert (= b_and!48331 (and (=> t!44019 result!23921) b_and!48333)))

(declare-fun m!1207877 () Bool)

(assert (=> b!1320008 m!1207877))

(assert (=> b!1320008 m!1207877))

(declare-fun m!1207879 () Bool)

(assert (=> b!1320008 m!1207879))

(assert (=> b!1320013 m!1207877))

(declare-fun m!1207881 () Bool)

(assert (=> b!1320007 m!1207881))

(declare-fun m!1207883 () Bool)

(assert (=> mapNonEmpty!55505 m!1207883))

(declare-fun m!1207885 () Bool)

(assert (=> b!1320004 m!1207885))

(declare-fun m!1207887 () Bool)

(assert (=> b!1320011 m!1207887))

(declare-fun m!1207889 () Bool)

(assert (=> b!1320011 m!1207889))

(declare-fun m!1207891 () Bool)

(assert (=> b!1320011 m!1207891))

(declare-fun m!1207893 () Bool)

(assert (=> b!1320011 m!1207893))

(assert (=> b!1320011 m!1207891))

(declare-fun m!1207895 () Bool)

(assert (=> b!1320011 m!1207895))

(assert (=> b!1320011 m!1207893))

(assert (=> b!1320011 m!1207887))

(declare-fun m!1207897 () Bool)

(assert (=> b!1320011 m!1207897))

(assert (=> b!1320011 m!1207877))

(declare-fun m!1207899 () Bool)

(assert (=> b!1320011 m!1207899))

(assert (=> b!1320011 m!1207889))

(declare-fun m!1207901 () Bool)

(assert (=> b!1320011 m!1207901))

(declare-fun m!1207903 () Bool)

(assert (=> start!111652 m!1207903))

(declare-fun m!1207905 () Bool)

(assert (=> start!111652 m!1207905))

(declare-fun m!1207907 () Bool)

(assert (=> start!111652 m!1207907))

(declare-fun m!1207909 () Bool)

(assert (=> b!1320006 m!1207909))

(assert (=> b!1320006 m!1207909))

(declare-fun m!1207911 () Bool)

(assert (=> b!1320006 m!1207911))

(check-sat (not b_next!30085) (not b!1320004) (not b!1320011) (not b_lambda!23405) tp_is_empty!35905 (not mapNonEmpty!55505) (not b!1320006) (not b!1320007) (not b!1320008) (not start!111652) b_and!48333)
(check-sat b_and!48333 (not b_next!30085))
