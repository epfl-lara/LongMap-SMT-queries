; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111882 () Bool)

(assert start!111882)

(declare-fun b_free!30481 () Bool)

(declare-fun b_next!30481 () Bool)

(assert (=> start!111882 (= b_free!30481 (not b_next!30481))))

(declare-fun tp!106923 () Bool)

(declare-fun b_and!49039 () Bool)

(assert (=> start!111882 (= tp!106923 b_and!49039)))

(declare-fun b!1325628 () Bool)

(declare-fun res!879826 () Bool)

(declare-fun e!755670 () Bool)

(assert (=> b!1325628 (=> (not res!879826) (not e!755670))))

(declare-datatypes ((array!89443 0))(
  ( (array!89444 (arr!43195 (Array (_ BitVec 32) (_ BitVec 64))) (size!43747 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89443)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1325628 (= res!879826 (not (= (select (arr!43195 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1325629 () Bool)

(assert (=> b!1325629 (= e!755670 (not true))))

(declare-datatypes ((V!53505 0))(
  ( (V!53506 (val!18225 Int)) )
))
(declare-datatypes ((tuple2!23574 0))(
  ( (tuple2!23575 (_1!11798 (_ BitVec 64)) (_2!11798 V!53505)) )
))
(declare-datatypes ((List!30701 0))(
  ( (Nil!30698) (Cons!30697 (h!31906 tuple2!23574) (t!44645 List!30701)) )
))
(declare-datatypes ((ListLongMap!21231 0))(
  ( (ListLongMap!21232 (toList!10631 List!30701)) )
))
(declare-fun lt!589641 () ListLongMap!21231)

(declare-fun contains!8715 (ListLongMap!21231 (_ BitVec 64)) Bool)

(assert (=> b!1325629 (contains!8715 lt!589641 k0!1164)))

(declare-datatypes ((Unit!43469 0))(
  ( (Unit!43470) )
))
(declare-fun lt!589640 () Unit!43469)

(declare-fun minValue!1279 () V!53505)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!200 ((_ BitVec 64) (_ BitVec 64) V!53505 ListLongMap!21231) Unit!43469)

(assert (=> b!1325629 (= lt!589640 (lemmaInListMapAfterAddingDiffThenInBefore!200 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!589641))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17252 0))(
  ( (ValueCellFull!17252 (v!20857 V!53505)) (EmptyCell!17252) )
))
(declare-datatypes ((array!89445 0))(
  ( (array!89446 (arr!43196 (Array (_ BitVec 32) ValueCell!17252)) (size!43748 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89445)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun zeroValue!1279 () V!53505)

(declare-fun +!4638 (ListLongMap!21231 tuple2!23574) ListLongMap!21231)

(declare-fun getCurrentListMapNoExtraKeys!6276 (array!89443 array!89445 (_ BitVec 32) (_ BitVec 32) V!53505 V!53505 (_ BitVec 32) Int) ListLongMap!21231)

(declare-fun get!21760 (ValueCell!17252 V!53505) V!53505)

(declare-fun dynLambda!3568 (Int (_ BitVec 64)) V!53505)

(assert (=> b!1325629 (= lt!589641 (+!4638 (+!4638 (getCurrentListMapNoExtraKeys!6276 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23575 (select (arr!43195 _keys!1609) from!2000) (get!21760 (select (arr!43196 _values!1337) from!2000) (dynLambda!3568 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23575 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun b!1325630 () Bool)

(declare-fun e!755673 () Bool)

(declare-fun tp_is_empty!36301 () Bool)

(assert (=> b!1325630 (= e!755673 tp_is_empty!36301)))

(declare-fun mapIsEmpty!56103 () Bool)

(declare-fun mapRes!56103 () Bool)

(assert (=> mapIsEmpty!56103 mapRes!56103))

(declare-fun b!1325631 () Bool)

(declare-fun res!879825 () Bool)

(assert (=> b!1325631 (=> (not res!879825) (not e!755670))))

(declare-datatypes ((List!30702 0))(
  ( (Nil!30699) (Cons!30698 (h!31907 (_ BitVec 64)) (t!44646 List!30702)) )
))
(declare-fun arrayNoDuplicates!0 (array!89443 (_ BitVec 32) List!30702) Bool)

(assert (=> b!1325631 (= res!879825 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30699))))

(declare-fun b!1325632 () Bool)

(declare-fun res!879822 () Bool)

(assert (=> b!1325632 (=> (not res!879822) (not e!755670))))

(assert (=> b!1325632 (= res!879822 (and (= (size!43748 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43747 _keys!1609) (size!43748 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1325633 () Bool)

(declare-fun e!755672 () Bool)

(assert (=> b!1325633 (= e!755672 (and e!755673 mapRes!56103))))

(declare-fun condMapEmpty!56103 () Bool)

(declare-fun mapDefault!56103 () ValueCell!17252)

(assert (=> b!1325633 (= condMapEmpty!56103 (= (arr!43196 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17252)) mapDefault!56103)))))

(declare-fun res!879823 () Bool)

(assert (=> start!111882 (=> (not res!879823) (not e!755670))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111882 (= res!879823 (validMask!0 mask!2019))))

(assert (=> start!111882 e!755670))

(declare-fun array_inv!32789 (array!89443) Bool)

(assert (=> start!111882 (array_inv!32789 _keys!1609)))

(assert (=> start!111882 true))

(assert (=> start!111882 tp_is_empty!36301))

(declare-fun array_inv!32790 (array!89445) Bool)

(assert (=> start!111882 (and (array_inv!32790 _values!1337) e!755672)))

(assert (=> start!111882 tp!106923))

(declare-fun b!1325634 () Bool)

(declare-fun res!879827 () Bool)

(assert (=> b!1325634 (=> (not res!879827) (not e!755670))))

(assert (=> b!1325634 (= res!879827 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43747 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1325635 () Bool)

(declare-fun res!879821 () Bool)

(assert (=> b!1325635 (=> (not res!879821) (not e!755670))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1325635 (= res!879821 (validKeyInArray!0 (select (arr!43195 _keys!1609) from!2000)))))

(declare-fun b!1325636 () Bool)

(declare-fun res!879824 () Bool)

(assert (=> b!1325636 (=> (not res!879824) (not e!755670))))

(declare-fun getCurrentListMap!5507 (array!89443 array!89445 (_ BitVec 32) (_ BitVec 32) V!53505 V!53505 (_ BitVec 32) Int) ListLongMap!21231)

(assert (=> b!1325636 (= res!879824 (contains!8715 (getCurrentListMap!5507 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1325637 () Bool)

(declare-fun res!879820 () Bool)

(assert (=> b!1325637 (=> (not res!879820) (not e!755670))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89443 (_ BitVec 32)) Bool)

(assert (=> b!1325637 (= res!879820 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!56103 () Bool)

(declare-fun tp!106924 () Bool)

(declare-fun e!755674 () Bool)

(assert (=> mapNonEmpty!56103 (= mapRes!56103 (and tp!106924 e!755674))))

(declare-fun mapKey!56103 () (_ BitVec 32))

(declare-fun mapValue!56103 () ValueCell!17252)

(declare-fun mapRest!56103 () (Array (_ BitVec 32) ValueCell!17252))

(assert (=> mapNonEmpty!56103 (= (arr!43196 _values!1337) (store mapRest!56103 mapKey!56103 mapValue!56103))))

(declare-fun b!1325638 () Bool)

(assert (=> b!1325638 (= e!755674 tp_is_empty!36301)))

(assert (= (and start!111882 res!879823) b!1325632))

(assert (= (and b!1325632 res!879822) b!1325637))

(assert (= (and b!1325637 res!879820) b!1325631))

(assert (= (and b!1325631 res!879825) b!1325634))

(assert (= (and b!1325634 res!879827) b!1325636))

(assert (= (and b!1325636 res!879824) b!1325628))

(assert (= (and b!1325628 res!879826) b!1325635))

(assert (= (and b!1325635 res!879821) b!1325629))

(assert (= (and b!1325633 condMapEmpty!56103) mapIsEmpty!56103))

(assert (= (and b!1325633 (not condMapEmpty!56103)) mapNonEmpty!56103))

(get-info :version)

(assert (= (and mapNonEmpty!56103 ((_ is ValueCellFull!17252) mapValue!56103)) b!1325638))

(assert (= (and b!1325633 ((_ is ValueCellFull!17252) mapDefault!56103)) b!1325630))

(assert (= start!111882 b!1325633))

(declare-fun b_lambda!23749 () Bool)

(assert (=> (not b_lambda!23749) (not b!1325629)))

(declare-fun t!44644 () Bool)

(declare-fun tb!11747 () Bool)

(assert (=> (and start!111882 (= defaultEntry!1340 defaultEntry!1340) t!44644) tb!11747))

(declare-fun result!24559 () Bool)

(assert (=> tb!11747 (= result!24559 tp_is_empty!36301)))

(assert (=> b!1325629 t!44644))

(declare-fun b_and!49041 () Bool)

(assert (= b_and!49039 (and (=> t!44644 result!24559) b_and!49041)))

(declare-fun m!1214077 () Bool)

(assert (=> b!1325636 m!1214077))

(assert (=> b!1325636 m!1214077))

(declare-fun m!1214079 () Bool)

(assert (=> b!1325636 m!1214079))

(declare-fun m!1214081 () Bool)

(assert (=> b!1325628 m!1214081))

(assert (=> b!1325635 m!1214081))

(assert (=> b!1325635 m!1214081))

(declare-fun m!1214083 () Bool)

(assert (=> b!1325635 m!1214083))

(declare-fun m!1214085 () Bool)

(assert (=> mapNonEmpty!56103 m!1214085))

(declare-fun m!1214087 () Bool)

(assert (=> b!1325629 m!1214087))

(declare-fun m!1214089 () Bool)

(assert (=> b!1325629 m!1214089))

(assert (=> b!1325629 m!1214087))

(declare-fun m!1214091 () Bool)

(assert (=> b!1325629 m!1214091))

(declare-fun m!1214093 () Bool)

(assert (=> b!1325629 m!1214093))

(assert (=> b!1325629 m!1214091))

(declare-fun m!1214095 () Bool)

(assert (=> b!1325629 m!1214095))

(declare-fun m!1214097 () Bool)

(assert (=> b!1325629 m!1214097))

(declare-fun m!1214099 () Bool)

(assert (=> b!1325629 m!1214099))

(assert (=> b!1325629 m!1214093))

(assert (=> b!1325629 m!1214089))

(declare-fun m!1214101 () Bool)

(assert (=> b!1325629 m!1214101))

(assert (=> b!1325629 m!1214081))

(declare-fun m!1214103 () Bool)

(assert (=> start!111882 m!1214103))

(declare-fun m!1214105 () Bool)

(assert (=> start!111882 m!1214105))

(declare-fun m!1214107 () Bool)

(assert (=> start!111882 m!1214107))

(declare-fun m!1214109 () Bool)

(assert (=> b!1325637 m!1214109))

(declare-fun m!1214111 () Bool)

(assert (=> b!1325631 m!1214111))

(check-sat (not b_next!30481) (not b!1325635) (not b_lambda!23749) (not b!1325636) (not b!1325629) (not b!1325631) (not mapNonEmpty!56103) (not b!1325637) b_and!49041 tp_is_empty!36301 (not start!111882))
(check-sat b_and!49041 (not b_next!30481))
