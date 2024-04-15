; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111912 () Bool)

(assert start!111912)

(declare-fun b_free!30511 () Bool)

(declare-fun b_next!30511 () Bool)

(assert (=> start!111912 (= b_free!30511 (not b_next!30511))))

(declare-fun tp!107014 () Bool)

(declare-fun b_and!49099 () Bool)

(assert (=> start!111912 (= tp!107014 b_and!49099)))

(declare-fun b!1326153 () Bool)

(declare-fun res!880184 () Bool)

(declare-fun e!755897 () Bool)

(assert (=> b!1326153 (=> (not res!880184) (not e!755897))))

(declare-datatypes ((array!89501 0))(
  ( (array!89502 (arr!43224 (Array (_ BitVec 32) (_ BitVec 64))) (size!43776 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89501)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89501 (_ BitVec 32)) Bool)

(assert (=> b!1326153 (= res!880184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1326154 () Bool)

(declare-fun e!755899 () Bool)

(declare-fun tp_is_empty!36331 () Bool)

(assert (=> b!1326154 (= e!755899 tp_is_empty!36331)))

(declare-fun b!1326155 () Bool)

(declare-fun res!880187 () Bool)

(assert (=> b!1326155 (=> (not res!880187) (not e!755897))))

(declare-datatypes ((List!30720 0))(
  ( (Nil!30717) (Cons!30716 (h!31925 (_ BitVec 64)) (t!44694 List!30720)) )
))
(declare-fun arrayNoDuplicates!0 (array!89501 (_ BitVec 32) List!30720) Bool)

(assert (=> b!1326155 (= res!880187 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30717))))

(declare-fun b!1326156 () Bool)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1326156 (= e!755897 (not (not (= k0!1164 (select (arr!43224 _keys!1609) from!2000)))))))

(declare-datatypes ((V!53545 0))(
  ( (V!53546 (val!18240 Int)) )
))
(declare-datatypes ((tuple2!23594 0))(
  ( (tuple2!23595 (_1!11808 (_ BitVec 64)) (_2!11808 V!53545)) )
))
(declare-datatypes ((List!30721 0))(
  ( (Nil!30718) (Cons!30717 (h!31926 tuple2!23594) (t!44695 List!30721)) )
))
(declare-datatypes ((ListLongMap!21251 0))(
  ( (ListLongMap!21252 (toList!10641 List!30721)) )
))
(declare-fun lt!589790 () ListLongMap!21251)

(declare-fun contains!8725 (ListLongMap!21251 (_ BitVec 64)) Bool)

(assert (=> b!1326156 (contains!8725 lt!589790 k0!1164)))

(declare-fun zeroValue!1279 () V!53545)

(declare-datatypes ((Unit!43489 0))(
  ( (Unit!43490) )
))
(declare-fun lt!589791 () Unit!43489)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!210 ((_ BitVec 64) (_ BitVec 64) V!53545 ListLongMap!21251) Unit!43489)

(assert (=> b!1326156 (= lt!589791 (lemmaInListMapAfterAddingDiffThenInBefore!210 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!589790))))

(declare-fun lt!589788 () ListLongMap!21251)

(assert (=> b!1326156 (contains!8725 lt!589788 k0!1164)))

(declare-fun minValue!1279 () V!53545)

(declare-fun lt!589789 () Unit!43489)

(assert (=> b!1326156 (= lt!589789 (lemmaInListMapAfterAddingDiffThenInBefore!210 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589788))))

(declare-fun +!4648 (ListLongMap!21251 tuple2!23594) ListLongMap!21251)

(assert (=> b!1326156 (= lt!589788 (+!4648 lt!589790 (tuple2!23595 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17267 0))(
  ( (ValueCellFull!17267 (v!20872 V!53545)) (EmptyCell!17267) )
))
(declare-datatypes ((array!89503 0))(
  ( (array!89504 (arr!43225 (Array (_ BitVec 32) ValueCell!17267)) (size!43777 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89503)

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6286 (array!89501 array!89503 (_ BitVec 32) (_ BitVec 32) V!53545 V!53545 (_ BitVec 32) Int) ListLongMap!21251)

(declare-fun get!21780 (ValueCell!17267 V!53545) V!53545)

(declare-fun dynLambda!3578 (Int (_ BitVec 64)) V!53545)

(assert (=> b!1326156 (= lt!589790 (+!4648 (getCurrentListMapNoExtraKeys!6286 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23595 (select (arr!43224 _keys!1609) from!2000) (get!21780 (select (arr!43225 _values!1337) from!2000) (dynLambda!3578 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1326157 () Bool)

(declare-fun res!880185 () Bool)

(assert (=> b!1326157 (=> (not res!880185) (not e!755897))))

(declare-fun getCurrentListMap!5514 (array!89501 array!89503 (_ BitVec 32) (_ BitVec 32) V!53545 V!53545 (_ BitVec 32) Int) ListLongMap!21251)

(assert (=> b!1326157 (= res!880185 (contains!8725 (getCurrentListMap!5514 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1326158 () Bool)

(declare-fun res!880180 () Bool)

(assert (=> b!1326158 (=> (not res!880180) (not e!755897))))

(assert (=> b!1326158 (= res!880180 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43776 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1326159 () Bool)

(declare-fun res!880183 () Bool)

(assert (=> b!1326159 (=> (not res!880183) (not e!755897))))

(assert (=> b!1326159 (= res!880183 (and (= (size!43777 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43776 _keys!1609) (size!43777 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1326160 () Bool)

(declare-fun e!755895 () Bool)

(declare-fun mapRes!56148 () Bool)

(assert (=> b!1326160 (= e!755895 (and e!755899 mapRes!56148))))

(declare-fun condMapEmpty!56148 () Bool)

(declare-fun mapDefault!56148 () ValueCell!17267)

(assert (=> b!1326160 (= condMapEmpty!56148 (= (arr!43225 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17267)) mapDefault!56148)))))

(declare-fun b!1326161 () Bool)

(declare-fun e!755896 () Bool)

(assert (=> b!1326161 (= e!755896 tp_is_empty!36331)))

(declare-fun mapNonEmpty!56148 () Bool)

(declare-fun tp!107013 () Bool)

(assert (=> mapNonEmpty!56148 (= mapRes!56148 (and tp!107013 e!755896))))

(declare-fun mapValue!56148 () ValueCell!17267)

(declare-fun mapKey!56148 () (_ BitVec 32))

(declare-fun mapRest!56148 () (Array (_ BitVec 32) ValueCell!17267))

(assert (=> mapNonEmpty!56148 (= (arr!43225 _values!1337) (store mapRest!56148 mapKey!56148 mapValue!56148))))

(declare-fun b!1326162 () Bool)

(declare-fun res!880182 () Bool)

(assert (=> b!1326162 (=> (not res!880182) (not e!755897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1326162 (= res!880182 (validKeyInArray!0 (select (arr!43224 _keys!1609) from!2000)))))

(declare-fun res!880186 () Bool)

(assert (=> start!111912 (=> (not res!880186) (not e!755897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111912 (= res!880186 (validMask!0 mask!2019))))

(assert (=> start!111912 e!755897))

(declare-fun array_inv!32803 (array!89501) Bool)

(assert (=> start!111912 (array_inv!32803 _keys!1609)))

(assert (=> start!111912 true))

(assert (=> start!111912 tp_is_empty!36331))

(declare-fun array_inv!32804 (array!89503) Bool)

(assert (=> start!111912 (and (array_inv!32804 _values!1337) e!755895)))

(assert (=> start!111912 tp!107014))

(declare-fun b!1326163 () Bool)

(declare-fun res!880181 () Bool)

(assert (=> b!1326163 (=> (not res!880181) (not e!755897))))

(assert (=> b!1326163 (= res!880181 (not (= (select (arr!43224 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!56148 () Bool)

(assert (=> mapIsEmpty!56148 mapRes!56148))

(assert (= (and start!111912 res!880186) b!1326159))

(assert (= (and b!1326159 res!880183) b!1326153))

(assert (= (and b!1326153 res!880184) b!1326155))

(assert (= (and b!1326155 res!880187) b!1326158))

(assert (= (and b!1326158 res!880180) b!1326157))

(assert (= (and b!1326157 res!880185) b!1326163))

(assert (= (and b!1326163 res!880181) b!1326162))

(assert (= (and b!1326162 res!880182) b!1326156))

(assert (= (and b!1326160 condMapEmpty!56148) mapIsEmpty!56148))

(assert (= (and b!1326160 (not condMapEmpty!56148)) mapNonEmpty!56148))

(get-info :version)

(assert (= (and mapNonEmpty!56148 ((_ is ValueCellFull!17267) mapValue!56148)) b!1326161))

(assert (= (and b!1326160 ((_ is ValueCellFull!17267) mapDefault!56148)) b!1326154))

(assert (= start!111912 b!1326160))

(declare-fun b_lambda!23779 () Bool)

(assert (=> (not b_lambda!23779) (not b!1326156)))

(declare-fun t!44693 () Bool)

(declare-fun tb!11777 () Bool)

(assert (=> (and start!111912 (= defaultEntry!1340 defaultEntry!1340) t!44693) tb!11777))

(declare-fun result!24619 () Bool)

(assert (=> tb!11777 (= result!24619 tp_is_empty!36331)))

(assert (=> b!1326156 t!44693))

(declare-fun b_and!49101 () Bool)

(assert (= b_and!49099 (and (=> t!44693 result!24619) b_and!49101)))

(declare-fun m!1214653 () Bool)

(assert (=> mapNonEmpty!56148 m!1214653))

(declare-fun m!1214655 () Bool)

(assert (=> start!111912 m!1214655))

(declare-fun m!1214657 () Bool)

(assert (=> start!111912 m!1214657))

(declare-fun m!1214659 () Bool)

(assert (=> start!111912 m!1214659))

(declare-fun m!1214661 () Bool)

(assert (=> b!1326156 m!1214661))

(declare-fun m!1214663 () Bool)

(assert (=> b!1326156 m!1214663))

(declare-fun m!1214665 () Bool)

(assert (=> b!1326156 m!1214665))

(declare-fun m!1214667 () Bool)

(assert (=> b!1326156 m!1214667))

(declare-fun m!1214669 () Bool)

(assert (=> b!1326156 m!1214669))

(declare-fun m!1214671 () Bool)

(assert (=> b!1326156 m!1214671))

(assert (=> b!1326156 m!1214667))

(declare-fun m!1214673 () Bool)

(assert (=> b!1326156 m!1214673))

(declare-fun m!1214675 () Bool)

(assert (=> b!1326156 m!1214675))

(declare-fun m!1214677 () Bool)

(assert (=> b!1326156 m!1214677))

(declare-fun m!1214679 () Bool)

(assert (=> b!1326156 m!1214679))

(assert (=> b!1326156 m!1214663))

(assert (=> b!1326156 m!1214673))

(declare-fun m!1214681 () Bool)

(assert (=> b!1326156 m!1214681))

(assert (=> b!1326162 m!1214677))

(assert (=> b!1326162 m!1214677))

(declare-fun m!1214683 () Bool)

(assert (=> b!1326162 m!1214683))

(declare-fun m!1214685 () Bool)

(assert (=> b!1326157 m!1214685))

(assert (=> b!1326157 m!1214685))

(declare-fun m!1214687 () Bool)

(assert (=> b!1326157 m!1214687))

(assert (=> b!1326163 m!1214677))

(declare-fun m!1214689 () Bool)

(assert (=> b!1326155 m!1214689))

(declare-fun m!1214691 () Bool)

(assert (=> b!1326153 m!1214691))

(check-sat (not b!1326153) b_and!49101 tp_is_empty!36331 (not b!1326155) (not b!1326162) (not b_lambda!23779) (not start!111912) (not b!1326157) (not b_next!30511) (not mapNonEmpty!56148) (not b!1326156))
(check-sat b_and!49101 (not b_next!30511))
