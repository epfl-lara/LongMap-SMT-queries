; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112286 () Bool)

(assert start!112286)

(declare-fun b_free!30681 () Bool)

(declare-fun b_next!30681 () Bool)

(assert (=> start!112286 (= b_free!30681 (not b_next!30681))))

(declare-fun tp!107680 () Bool)

(declare-fun b_and!49417 () Bool)

(assert (=> start!112286 (= tp!107680 b_and!49417)))

(declare-fun b!1330501 () Bool)

(declare-fun res!882851 () Bool)

(declare-fun e!758311 () Bool)

(assert (=> b!1330501 (=> (not res!882851) (not e!758311))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!90068 0))(
  ( (array!90069 (arr!43500 (Array (_ BitVec 32) (_ BitVec 64))) (size!44050 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90068)

(declare-fun k0!1153 () (_ BitVec 64))

(assert (=> b!1330501 (= res!882851 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44050 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330502 () Bool)

(declare-fun res!882854 () Bool)

(assert (=> b!1330502 (=> (not res!882854) (not e!758311))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330502 (= res!882854 (validKeyInArray!0 (select (arr!43500 _keys!1590) from!1980)))))

(declare-fun res!882855 () Bool)

(assert (=> start!112286 (=> (not res!882855) (not e!758311))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112286 (= res!882855 (validMask!0 mask!1998))))

(assert (=> start!112286 e!758311))

(declare-datatypes ((V!53891 0))(
  ( (V!53892 (val!18370 Int)) )
))
(declare-datatypes ((ValueCell!17397 0))(
  ( (ValueCellFull!17397 (v!21007 V!53891)) (EmptyCell!17397) )
))
(declare-datatypes ((array!90070 0))(
  ( (array!90071 (arr!43501 (Array (_ BitVec 32) ValueCell!17397)) (size!44051 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90070)

(declare-fun e!758310 () Bool)

(declare-fun array_inv!32815 (array!90070) Bool)

(assert (=> start!112286 (and (array_inv!32815 _values!1320) e!758310)))

(assert (=> start!112286 true))

(declare-fun array_inv!32816 (array!90068) Bool)

(assert (=> start!112286 (array_inv!32816 _keys!1590)))

(assert (=> start!112286 tp!107680))

(declare-fun tp_is_empty!36591 () Bool)

(assert (=> start!112286 tp_is_empty!36591))

(declare-fun b!1330503 () Bool)

(declare-fun res!882856 () Bool)

(assert (=> b!1330503 (=> (not res!882856) (not e!758311))))

(declare-datatypes ((List!30808 0))(
  ( (Nil!30805) (Cons!30804 (h!32013 (_ BitVec 64)) (t!44902 List!30808)) )
))
(declare-fun arrayNoDuplicates!0 (array!90068 (_ BitVec 32) List!30808) Bool)

(assert (=> b!1330503 (= res!882856 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30805))))

(declare-fun b!1330504 () Bool)

(declare-fun e!758309 () Bool)

(assert (=> b!1330504 (= e!758309 tp_is_empty!36591)))

(declare-fun b!1330505 () Bool)

(declare-fun res!882857 () Bool)

(assert (=> b!1330505 (=> (not res!882857) (not e!758311))))

(assert (=> b!1330505 (= res!882857 (not (= (select (arr!43500 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330506 () Bool)

(assert (=> b!1330506 (= e!758311 (not true))))

(declare-datatypes ((tuple2!23658 0))(
  ( (tuple2!23659 (_1!11840 (_ BitVec 64)) (_2!11840 V!53891)) )
))
(declare-datatypes ((List!30809 0))(
  ( (Nil!30806) (Cons!30805 (h!32014 tuple2!23658) (t!44903 List!30809)) )
))
(declare-datatypes ((ListLongMap!21315 0))(
  ( (ListLongMap!21316 (toList!10673 List!30809)) )
))
(declare-fun lt!591169 () ListLongMap!21315)

(declare-fun contains!8837 (ListLongMap!21315 (_ BitVec 64)) Bool)

(assert (=> b!1330506 (contains!8837 lt!591169 k0!1153)))

(declare-datatypes ((Unit!43789 0))(
  ( (Unit!43790) )
))
(declare-fun lt!591166 () Unit!43789)

(declare-fun lt!591167 () V!53891)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!257 ((_ BitVec 64) (_ BitVec 64) V!53891 ListLongMap!21315) Unit!43789)

(assert (=> b!1330506 (= lt!591166 (lemmaInListMapAfterAddingDiffThenInBefore!257 k0!1153 (select (arr!43500 _keys!1590) from!1980) lt!591167 lt!591169))))

(declare-fun lt!591165 () ListLongMap!21315)

(assert (=> b!1330506 (contains!8837 lt!591165 k0!1153)))

(declare-fun lt!591168 () Unit!43789)

(declare-fun minValue!1262 () V!53891)

(assert (=> b!1330506 (= lt!591168 (lemmaInListMapAfterAddingDiffThenInBefore!257 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591165))))

(declare-fun +!4670 (ListLongMap!21315 tuple2!23658) ListLongMap!21315)

(assert (=> b!1330506 (= lt!591165 (+!4670 lt!591169 (tuple2!23659 (select (arr!43500 _keys!1590) from!1980) lt!591167)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21926 (ValueCell!17397 V!53891) V!53891)

(declare-fun dynLambda!3609 (Int (_ BitVec 64)) V!53891)

(assert (=> b!1330506 (= lt!591167 (get!21926 (select (arr!43501 _values!1320) from!1980) (dynLambda!3609 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53891)

(declare-fun getCurrentListMapNoExtraKeys!6308 (array!90068 array!90070 (_ BitVec 32) (_ BitVec 32) V!53891 V!53891 (_ BitVec 32) Int) ListLongMap!21315)

(assert (=> b!1330506 (= lt!591169 (getCurrentListMapNoExtraKeys!6308 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1330507 () Bool)

(declare-fun res!882853 () Bool)

(assert (=> b!1330507 (=> (not res!882853) (not e!758311))))

(declare-fun getCurrentListMap!5660 (array!90068 array!90070 (_ BitVec 32) (_ BitVec 32) V!53891 V!53891 (_ BitVec 32) Int) ListLongMap!21315)

(assert (=> b!1330507 (= res!882853 (contains!8837 (getCurrentListMap!5660 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330508 () Bool)

(declare-fun e!758308 () Bool)

(declare-fun mapRes!56560 () Bool)

(assert (=> b!1330508 (= e!758310 (and e!758308 mapRes!56560))))

(declare-fun condMapEmpty!56560 () Bool)

(declare-fun mapDefault!56560 () ValueCell!17397)

(assert (=> b!1330508 (= condMapEmpty!56560 (= (arr!43501 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17397)) mapDefault!56560)))))

(declare-fun mapNonEmpty!56560 () Bool)

(declare-fun tp!107679 () Bool)

(assert (=> mapNonEmpty!56560 (= mapRes!56560 (and tp!107679 e!758309))))

(declare-fun mapKey!56560 () (_ BitVec 32))

(declare-fun mapRest!56560 () (Array (_ BitVec 32) ValueCell!17397))

(declare-fun mapValue!56560 () ValueCell!17397)

(assert (=> mapNonEmpty!56560 (= (arr!43501 _values!1320) (store mapRest!56560 mapKey!56560 mapValue!56560))))

(declare-fun b!1330509 () Bool)

(assert (=> b!1330509 (= e!758308 tp_is_empty!36591)))

(declare-fun b!1330510 () Bool)

(declare-fun res!882858 () Bool)

(assert (=> b!1330510 (=> (not res!882858) (not e!758311))))

(assert (=> b!1330510 (= res!882858 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1330511 () Bool)

(declare-fun res!882852 () Bool)

(assert (=> b!1330511 (=> (not res!882852) (not e!758311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90068 (_ BitVec 32)) Bool)

(assert (=> b!1330511 (= res!882852 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330512 () Bool)

(declare-fun res!882850 () Bool)

(assert (=> b!1330512 (=> (not res!882850) (not e!758311))))

(assert (=> b!1330512 (= res!882850 (and (= (size!44051 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44050 _keys!1590) (size!44051 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!56560 () Bool)

(assert (=> mapIsEmpty!56560 mapRes!56560))

(assert (= (and start!112286 res!882855) b!1330512))

(assert (= (and b!1330512 res!882850) b!1330511))

(assert (= (and b!1330511 res!882852) b!1330503))

(assert (= (and b!1330503 res!882856) b!1330501))

(assert (= (and b!1330501 res!882851) b!1330507))

(assert (= (and b!1330507 res!882853) b!1330505))

(assert (= (and b!1330505 res!882857) b!1330502))

(assert (= (and b!1330502 res!882854) b!1330510))

(assert (= (and b!1330510 res!882858) b!1330506))

(assert (= (and b!1330508 condMapEmpty!56560) mapIsEmpty!56560))

(assert (= (and b!1330508 (not condMapEmpty!56560)) mapNonEmpty!56560))

(get-info :version)

(assert (= (and mapNonEmpty!56560 ((_ is ValueCellFull!17397) mapValue!56560)) b!1330504))

(assert (= (and b!1330508 ((_ is ValueCellFull!17397) mapDefault!56560)) b!1330509))

(assert (= start!112286 b!1330508))

(declare-fun b_lambda!23941 () Bool)

(assert (=> (not b_lambda!23941) (not b!1330506)))

(declare-fun t!44901 () Bool)

(declare-fun tb!11897 () Bool)

(assert (=> (and start!112286 (= defaultEntry!1323 defaultEntry!1323) t!44901) tb!11897))

(declare-fun result!24865 () Bool)

(assert (=> tb!11897 (= result!24865 tp_is_empty!36591)))

(assert (=> b!1330506 t!44901))

(declare-fun b_and!49419 () Bool)

(assert (= b_and!49417 (and (=> t!44901 result!24865) b_and!49419)))

(declare-fun m!1219163 () Bool)

(assert (=> b!1330503 m!1219163))

(declare-fun m!1219165 () Bool)

(assert (=> start!112286 m!1219165))

(declare-fun m!1219167 () Bool)

(assert (=> start!112286 m!1219167))

(declare-fun m!1219169 () Bool)

(assert (=> start!112286 m!1219169))

(declare-fun m!1219171 () Bool)

(assert (=> b!1330505 m!1219171))

(declare-fun m!1219173 () Bool)

(assert (=> b!1330507 m!1219173))

(assert (=> b!1330507 m!1219173))

(declare-fun m!1219175 () Bool)

(assert (=> b!1330507 m!1219175))

(declare-fun m!1219177 () Bool)

(assert (=> b!1330506 m!1219177))

(declare-fun m!1219179 () Bool)

(assert (=> b!1330506 m!1219179))

(declare-fun m!1219181 () Bool)

(assert (=> b!1330506 m!1219181))

(declare-fun m!1219183 () Bool)

(assert (=> b!1330506 m!1219183))

(assert (=> b!1330506 m!1219181))

(declare-fun m!1219185 () Bool)

(assert (=> b!1330506 m!1219185))

(declare-fun m!1219187 () Bool)

(assert (=> b!1330506 m!1219187))

(declare-fun m!1219189 () Bool)

(assert (=> b!1330506 m!1219189))

(declare-fun m!1219191 () Bool)

(assert (=> b!1330506 m!1219191))

(assert (=> b!1330506 m!1219183))

(assert (=> b!1330506 m!1219171))

(declare-fun m!1219193 () Bool)

(assert (=> b!1330506 m!1219193))

(assert (=> b!1330506 m!1219171))

(declare-fun m!1219195 () Bool)

(assert (=> b!1330511 m!1219195))

(assert (=> b!1330502 m!1219171))

(assert (=> b!1330502 m!1219171))

(declare-fun m!1219197 () Bool)

(assert (=> b!1330502 m!1219197))

(declare-fun m!1219199 () Bool)

(assert (=> mapNonEmpty!56560 m!1219199))

(check-sat (not b!1330503) (not b_next!30681) (not b!1330502) b_and!49419 (not b!1330511) (not b!1330506) (not b!1330507) (not start!112286) (not mapNonEmpty!56560) (not b_lambda!23941) tp_is_empty!36591)
(check-sat b_and!49419 (not b_next!30681))
