; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113558 () Bool)

(assert start!113558)

(declare-fun b_free!31551 () Bool)

(declare-fun b_next!31551 () Bool)

(assert (=> start!113558 (= b_free!31551 (not b_next!31551))))

(declare-fun tp!110462 () Bool)

(declare-fun b_and!50891 () Bool)

(assert (=> start!113558 (= tp!110462 b_and!50891)))

(declare-fun b!1348111 () Bool)

(declare-fun res!894500 () Bool)

(declare-fun e!766936 () Bool)

(assert (=> b!1348111 (=> (not res!894500) (not e!766936))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1348111 (= res!894500 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1348112 () Bool)

(declare-fun res!894492 () Bool)

(assert (=> b!1348112 (=> (not res!894492) (not e!766936))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91932 0))(
  ( (array!91933 (arr!44421 (Array (_ BitVec 32) (_ BitVec 64))) (size!44971 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91932)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1348112 (= res!894492 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44971 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348113 () Bool)

(declare-fun res!894493 () Bool)

(assert (=> b!1348113 (=> (not res!894493) (not e!766936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1348113 (= res!894493 (validKeyInArray!0 (select (arr!44421 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!58037 () Bool)

(declare-fun mapRes!58037 () Bool)

(assert (=> mapIsEmpty!58037 mapRes!58037))

(declare-fun b!1348114 () Bool)

(declare-fun res!894497 () Bool)

(assert (=> b!1348114 (=> (not res!894497) (not e!766936))))

(declare-datatypes ((List!31457 0))(
  ( (Nil!31454) (Cons!31453 (h!32662 (_ BitVec 64)) (t!46087 List!31457)) )
))
(declare-fun arrayNoDuplicates!0 (array!91932 (_ BitVec 32) List!31457) Bool)

(assert (=> b!1348114 (= res!894497 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31454))))

(declare-fun b!1348115 () Bool)

(declare-fun res!894495 () Bool)

(assert (=> b!1348115 (=> (not res!894495) (not e!766936))))

(declare-datatypes ((V!55171 0))(
  ( (V!55172 (val!18850 Int)) )
))
(declare-fun minValue!1245 () V!55171)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun zeroValue!1245 () V!55171)

(declare-datatypes ((ValueCell!17877 0))(
  ( (ValueCellFull!17877 (v!21501 V!55171)) (EmptyCell!17877) )
))
(declare-datatypes ((array!91934 0))(
  ( (array!91935 (arr!44422 (Array (_ BitVec 32) ValueCell!17877)) (size!44972 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91934)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24304 0))(
  ( (tuple2!24305 (_1!12163 (_ BitVec 64)) (_2!12163 V!55171)) )
))
(declare-datatypes ((List!31458 0))(
  ( (Nil!31455) (Cons!31454 (h!32663 tuple2!24304) (t!46088 List!31458)) )
))
(declare-datatypes ((ListLongMap!21961 0))(
  ( (ListLongMap!21962 (toList!10996 List!31458)) )
))
(declare-fun contains!9174 (ListLongMap!21961 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5946 (array!91932 array!91934 (_ BitVec 32) (_ BitVec 32) V!55171 V!55171 (_ BitVec 32) Int) ListLongMap!21961)

(assert (=> b!1348115 (= res!894495 (contains!9174 (getCurrentListMap!5946 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapNonEmpty!58037 () Bool)

(declare-fun tp!110461 () Bool)

(declare-fun e!766935 () Bool)

(assert (=> mapNonEmpty!58037 (= mapRes!58037 (and tp!110461 e!766935))))

(declare-fun mapRest!58037 () (Array (_ BitVec 32) ValueCell!17877))

(declare-fun mapKey!58037 () (_ BitVec 32))

(declare-fun mapValue!58037 () ValueCell!17877)

(assert (=> mapNonEmpty!58037 (= (arr!44422 _values!1303) (store mapRest!58037 mapKey!58037 mapValue!58037))))

(declare-fun b!1348117 () Bool)

(assert (=> b!1348117 (= e!766936 (not true))))

(declare-fun lt!595930 () ListLongMap!21961)

(assert (=> b!1348117 (contains!9174 lt!595930 k0!1142)))

(declare-fun lt!595926 () V!55171)

(declare-datatypes ((Unit!44168 0))(
  ( (Unit!44169) )
))
(declare-fun lt!595929 () Unit!44168)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!407 ((_ BitVec 64) (_ BitVec 64) V!55171 ListLongMap!21961) Unit!44168)

(assert (=> b!1348117 (= lt!595929 (lemmaInListMapAfterAddingDiffThenInBefore!407 k0!1142 (select (arr!44421 _keys!1571) from!1960) lt!595926 lt!595930))))

(declare-fun lt!595928 () ListLongMap!21961)

(assert (=> b!1348117 (contains!9174 lt!595928 k0!1142)))

(declare-fun lt!595927 () Unit!44168)

(assert (=> b!1348117 (= lt!595927 (lemmaInListMapAfterAddingDiffThenInBefore!407 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595928))))

(declare-fun +!4846 (ListLongMap!21961 tuple2!24304) ListLongMap!21961)

(assert (=> b!1348117 (= lt!595928 (+!4846 lt!595930 (tuple2!24305 (select (arr!44421 _keys!1571) from!1960) lt!595926)))))

(declare-fun get!22438 (ValueCell!17877 V!55171) V!55171)

(declare-fun dynLambda!3785 (Int (_ BitVec 64)) V!55171)

(assert (=> b!1348117 (= lt!595926 (get!22438 (select (arr!44422 _values!1303) from!1960) (dynLambda!3785 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6492 (array!91932 array!91934 (_ BitVec 32) (_ BitVec 32) V!55171 V!55171 (_ BitVec 32) Int) ListLongMap!21961)

(assert (=> b!1348117 (= lt!595930 (getCurrentListMapNoExtraKeys!6492 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1348118 () Bool)

(declare-fun e!766934 () Bool)

(declare-fun e!766933 () Bool)

(assert (=> b!1348118 (= e!766934 (and e!766933 mapRes!58037))))

(declare-fun condMapEmpty!58037 () Bool)

(declare-fun mapDefault!58037 () ValueCell!17877)

(assert (=> b!1348118 (= condMapEmpty!58037 (= (arr!44422 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17877)) mapDefault!58037)))))

(declare-fun b!1348119 () Bool)

(declare-fun res!894494 () Bool)

(assert (=> b!1348119 (=> (not res!894494) (not e!766936))))

(assert (=> b!1348119 (= res!894494 (and (= (size!44972 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44971 _keys!1571) (size!44972 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1348120 () Bool)

(declare-fun res!894499 () Bool)

(assert (=> b!1348120 (=> (not res!894499) (not e!766936))))

(assert (=> b!1348120 (= res!894499 (not (= (select (arr!44421 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1348121 () Bool)

(declare-fun tp_is_empty!37551 () Bool)

(assert (=> b!1348121 (= e!766933 tp_is_empty!37551)))

(declare-fun b!1348122 () Bool)

(declare-fun res!894496 () Bool)

(assert (=> b!1348122 (=> (not res!894496) (not e!766936))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91932 (_ BitVec 32)) Bool)

(assert (=> b!1348122 (= res!894496 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!894498 () Bool)

(assert (=> start!113558 (=> (not res!894498) (not e!766936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113558 (= res!894498 (validMask!0 mask!1977))))

(assert (=> start!113558 e!766936))

(assert (=> start!113558 tp_is_empty!37551))

(assert (=> start!113558 true))

(declare-fun array_inv!33463 (array!91932) Bool)

(assert (=> start!113558 (array_inv!33463 _keys!1571)))

(declare-fun array_inv!33464 (array!91934) Bool)

(assert (=> start!113558 (and (array_inv!33464 _values!1303) e!766934)))

(assert (=> start!113558 tp!110462))

(declare-fun b!1348116 () Bool)

(assert (=> b!1348116 (= e!766935 tp_is_empty!37551)))

(assert (= (and start!113558 res!894498) b!1348119))

(assert (= (and b!1348119 res!894494) b!1348122))

(assert (= (and b!1348122 res!894496) b!1348114))

(assert (= (and b!1348114 res!894497) b!1348112))

(assert (= (and b!1348112 res!894492) b!1348115))

(assert (= (and b!1348115 res!894495) b!1348120))

(assert (= (and b!1348120 res!894499) b!1348113))

(assert (= (and b!1348113 res!894493) b!1348111))

(assert (= (and b!1348111 res!894500) b!1348117))

(assert (= (and b!1348118 condMapEmpty!58037) mapIsEmpty!58037))

(assert (= (and b!1348118 (not condMapEmpty!58037)) mapNonEmpty!58037))

(get-info :version)

(assert (= (and mapNonEmpty!58037 ((_ is ValueCellFull!17877) mapValue!58037)) b!1348116))

(assert (= (and b!1348118 ((_ is ValueCellFull!17877) mapDefault!58037)) b!1348121))

(assert (= start!113558 b!1348118))

(declare-fun b_lambda!24625 () Bool)

(assert (=> (not b_lambda!24625) (not b!1348117)))

(declare-fun t!46086 () Bool)

(declare-fun tb!12433 () Bool)

(assert (=> (and start!113558 (= defaultEntry!1306 defaultEntry!1306) t!46086) tb!12433))

(declare-fun result!25959 () Bool)

(assert (=> tb!12433 (= result!25959 tp_is_empty!37551)))

(assert (=> b!1348117 t!46086))

(declare-fun b_and!50893 () Bool)

(assert (= b_and!50891 (and (=> t!46086 result!25959) b_and!50893)))

(declare-fun m!1235131 () Bool)

(assert (=> b!1348113 m!1235131))

(assert (=> b!1348113 m!1235131))

(declare-fun m!1235133 () Bool)

(assert (=> b!1348113 m!1235133))

(declare-fun m!1235135 () Bool)

(assert (=> b!1348117 m!1235135))

(assert (=> b!1348117 m!1235131))

(declare-fun m!1235137 () Bool)

(assert (=> b!1348117 m!1235137))

(declare-fun m!1235139 () Bool)

(assert (=> b!1348117 m!1235139))

(declare-fun m!1235141 () Bool)

(assert (=> b!1348117 m!1235141))

(declare-fun m!1235143 () Bool)

(assert (=> b!1348117 m!1235143))

(assert (=> b!1348117 m!1235139))

(declare-fun m!1235145 () Bool)

(assert (=> b!1348117 m!1235145))

(assert (=> b!1348117 m!1235141))

(declare-fun m!1235147 () Bool)

(assert (=> b!1348117 m!1235147))

(declare-fun m!1235149 () Bool)

(assert (=> b!1348117 m!1235149))

(assert (=> b!1348117 m!1235131))

(declare-fun m!1235151 () Bool)

(assert (=> b!1348117 m!1235151))

(declare-fun m!1235153 () Bool)

(assert (=> mapNonEmpty!58037 m!1235153))

(declare-fun m!1235155 () Bool)

(assert (=> b!1348115 m!1235155))

(assert (=> b!1348115 m!1235155))

(declare-fun m!1235157 () Bool)

(assert (=> b!1348115 m!1235157))

(declare-fun m!1235159 () Bool)

(assert (=> b!1348122 m!1235159))

(declare-fun m!1235161 () Bool)

(assert (=> b!1348114 m!1235161))

(assert (=> b!1348120 m!1235131))

(declare-fun m!1235163 () Bool)

(assert (=> start!113558 m!1235163))

(declare-fun m!1235165 () Bool)

(assert (=> start!113558 m!1235165))

(declare-fun m!1235167 () Bool)

(assert (=> start!113558 m!1235167))

(check-sat (not b!1348122) b_and!50893 (not b!1348117) (not b!1348115) (not b_next!31551) (not b!1348114) (not b_lambda!24625) (not start!113558) tp_is_empty!37551 (not b!1348113) (not mapNonEmpty!58037))
(check-sat b_and!50893 (not b_next!31551))
