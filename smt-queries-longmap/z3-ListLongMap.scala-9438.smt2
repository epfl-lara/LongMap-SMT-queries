; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112460 () Bool)

(assert start!112460)

(declare-fun b_free!30631 () Bool)

(declare-fun b_next!30631 () Bool)

(assert (=> start!112460 (= b_free!30631 (not b_next!30631))))

(declare-fun tp!107530 () Bool)

(declare-fun b_and!49319 () Bool)

(assert (=> start!112460 (= tp!107530 b_and!49319)))

(declare-fun mapNonEmpty!56485 () Bool)

(declare-fun mapRes!56485 () Bool)

(declare-fun tp!107529 () Bool)

(declare-fun e!758778 () Bool)

(assert (=> mapNonEmpty!56485 (= mapRes!56485 (and tp!107529 e!758778))))

(declare-datatypes ((V!53825 0))(
  ( (V!53826 (val!18345 Int)) )
))
(declare-datatypes ((ValueCell!17372 0))(
  ( (ValueCellFull!17372 (v!20977 V!53825)) (EmptyCell!17372) )
))
(declare-datatypes ((array!90081 0))(
  ( (array!90082 (arr!43502 (Array (_ BitVec 32) ValueCell!17372)) (size!44053 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90081)

(declare-fun mapKey!56485 () (_ BitVec 32))

(declare-fun mapValue!56485 () ValueCell!17372)

(declare-fun mapRest!56485 () (Array (_ BitVec 32) ValueCell!17372))

(assert (=> mapNonEmpty!56485 (= (arr!43502 _values!1320) (store mapRest!56485 mapKey!56485 mapValue!56485))))

(declare-fun b!1330851 () Bool)

(declare-fun e!758775 () Bool)

(declare-fun tp_is_empty!36541 () Bool)

(assert (=> b!1330851 (= e!758775 tp_is_empty!36541)))

(declare-fun b!1330852 () Bool)

(assert (=> b!1330852 (= e!758778 tp_is_empty!36541)))

(declare-fun b!1330853 () Bool)

(declare-fun res!882701 () Bool)

(declare-fun e!758776 () Bool)

(assert (=> b!1330853 (=> (not res!882701) (not e!758776))))

(declare-datatypes ((array!90083 0))(
  ( (array!90084 (arr!43503 (Array (_ BitVec 32) (_ BitVec 64))) (size!44054 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90083)

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90083 (_ BitVec 32)) Bool)

(assert (=> b!1330853 (= res!882701 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1330854 () Bool)

(declare-fun res!882695 () Bool)

(assert (=> b!1330854 (=> (not res!882695) (not e!758776))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1330854 (= res!882695 (validKeyInArray!0 (select (arr!43503 _keys!1590) from!1980)))))

(declare-fun b!1330855 () Bool)

(declare-fun res!882700 () Bool)

(assert (=> b!1330855 (=> (not res!882700) (not e!758776))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1330855 (= res!882700 (and (= (size!44053 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44054 _keys!1590) (size!44053 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1330856 () Bool)

(declare-fun res!882697 () Bool)

(assert (=> b!1330856 (=> (not res!882697) (not e!758776))))

(assert (=> b!1330856 (= res!882697 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun res!882696 () Bool)

(assert (=> start!112460 (=> (not res!882696) (not e!758776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112460 (= res!882696 (validMask!0 mask!1998))))

(assert (=> start!112460 e!758776))

(declare-fun e!758777 () Bool)

(declare-fun array_inv!33105 (array!90081) Bool)

(assert (=> start!112460 (and (array_inv!33105 _values!1320) e!758777)))

(assert (=> start!112460 true))

(declare-fun array_inv!33106 (array!90083) Bool)

(assert (=> start!112460 (array_inv!33106 _keys!1590)))

(assert (=> start!112460 tp!107530))

(assert (=> start!112460 tp_is_empty!36541))

(declare-fun b!1330850 () Bool)

(declare-fun res!882698 () Bool)

(assert (=> b!1330850 (=> (not res!882698) (not e!758776))))

(declare-datatypes ((List!30822 0))(
  ( (Nil!30819) (Cons!30818 (h!32036 (_ BitVec 64)) (t!44858 List!30822)) )
))
(declare-fun arrayNoDuplicates!0 (array!90083 (_ BitVec 32) List!30822) Bool)

(assert (=> b!1330850 (= res!882698 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30819))))

(declare-fun b!1330857 () Bool)

(assert (=> b!1330857 (= e!758776 (not true))))

(declare-datatypes ((tuple2!23650 0))(
  ( (tuple2!23651 (_1!11836 (_ BitVec 64)) (_2!11836 V!53825)) )
))
(declare-datatypes ((List!30823 0))(
  ( (Nil!30820) (Cons!30819 (h!32037 tuple2!23650) (t!44859 List!30823)) )
))
(declare-datatypes ((ListLongMap!21315 0))(
  ( (ListLongMap!21316 (toList!10673 List!30823)) )
))
(declare-fun lt!591449 () ListLongMap!21315)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8849 (ListLongMap!21315 (_ BitVec 64)) Bool)

(assert (=> b!1330857 (contains!8849 lt!591449 k0!1153)))

(declare-datatypes ((Unit!43700 0))(
  ( (Unit!43701) )
))
(declare-fun lt!591450 () Unit!43700)

(declare-fun minValue!1262 () V!53825)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!238 ((_ BitVec 64) (_ BitVec 64) V!53825 ListLongMap!21315) Unit!43700)

(assert (=> b!1330857 (= lt!591450 (lemmaInListMapAfterAddingDiffThenInBefore!238 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591449))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun zeroValue!1262 () V!53825)

(declare-fun +!4695 (ListLongMap!21315 tuple2!23650) ListLongMap!21315)

(declare-fun getCurrentListMapNoExtraKeys!6339 (array!90083 array!90081 (_ BitVec 32) (_ BitVec 32) V!53825 V!53825 (_ BitVec 32) Int) ListLongMap!21315)

(declare-fun get!21938 (ValueCell!17372 V!53825) V!53825)

(declare-fun dynLambda!3649 (Int (_ BitVec 64)) V!53825)

(assert (=> b!1330857 (= lt!591449 (+!4695 (getCurrentListMapNoExtraKeys!6339 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23651 (select (arr!43503 _keys!1590) from!1980) (get!21938 (select (arr!43502 _values!1320) from!1980) (dynLambda!3649 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun mapIsEmpty!56485 () Bool)

(assert (=> mapIsEmpty!56485 mapRes!56485))

(declare-fun b!1330858 () Bool)

(declare-fun res!882694 () Bool)

(assert (=> b!1330858 (=> (not res!882694) (not e!758776))))

(assert (=> b!1330858 (= res!882694 (not (= (select (arr!43503 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1330859 () Bool)

(declare-fun res!882699 () Bool)

(assert (=> b!1330859 (=> (not res!882699) (not e!758776))))

(assert (=> b!1330859 (= res!882699 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44054 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1330860 () Bool)

(declare-fun res!882693 () Bool)

(assert (=> b!1330860 (=> (not res!882693) (not e!758776))))

(declare-fun getCurrentListMap!5647 (array!90083 array!90081 (_ BitVec 32) (_ BitVec 32) V!53825 V!53825 (_ BitVec 32) Int) ListLongMap!21315)

(assert (=> b!1330860 (= res!882693 (contains!8849 (getCurrentListMap!5647 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1330861 () Bool)

(assert (=> b!1330861 (= e!758777 (and e!758775 mapRes!56485))))

(declare-fun condMapEmpty!56485 () Bool)

(declare-fun mapDefault!56485 () ValueCell!17372)

(assert (=> b!1330861 (= condMapEmpty!56485 (= (arr!43502 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17372)) mapDefault!56485)))))

(assert (= (and start!112460 res!882696) b!1330855))

(assert (= (and b!1330855 res!882700) b!1330853))

(assert (= (and b!1330853 res!882701) b!1330850))

(assert (= (and b!1330850 res!882698) b!1330859))

(assert (= (and b!1330859 res!882699) b!1330860))

(assert (= (and b!1330860 res!882693) b!1330858))

(assert (= (and b!1330858 res!882694) b!1330854))

(assert (= (and b!1330854 res!882695) b!1330856))

(assert (= (and b!1330856 res!882697) b!1330857))

(assert (= (and b!1330861 condMapEmpty!56485) mapIsEmpty!56485))

(assert (= (and b!1330861 (not condMapEmpty!56485)) mapNonEmpty!56485))

(get-info :version)

(assert (= (and mapNonEmpty!56485 ((_ is ValueCellFull!17372) mapValue!56485)) b!1330852))

(assert (= (and b!1330861 ((_ is ValueCellFull!17372) mapDefault!56485)) b!1330851))

(assert (= start!112460 b!1330861))

(declare-fun b_lambda!23885 () Bool)

(assert (=> (not b_lambda!23885) (not b!1330857)))

(declare-fun t!44857 () Bool)

(declare-fun tb!11839 () Bool)

(assert (=> (and start!112460 (= defaultEntry!1323 defaultEntry!1323) t!44857) tb!11839))

(declare-fun result!24757 () Bool)

(assert (=> tb!11839 (= result!24757 tp_is_empty!36541)))

(assert (=> b!1330857 t!44857))

(declare-fun b_and!49321 () Bool)

(assert (= b_and!49319 (and (=> t!44857 result!24757) b_and!49321)))

(declare-fun m!1219895 () Bool)

(assert (=> b!1330858 m!1219895))

(declare-fun m!1219897 () Bool)

(assert (=> b!1330850 m!1219897))

(declare-fun m!1219899 () Bool)

(assert (=> mapNonEmpty!56485 m!1219899))

(declare-fun m!1219901 () Bool)

(assert (=> b!1330860 m!1219901))

(assert (=> b!1330860 m!1219901))

(declare-fun m!1219903 () Bool)

(assert (=> b!1330860 m!1219903))

(declare-fun m!1219905 () Bool)

(assert (=> b!1330853 m!1219905))

(declare-fun m!1219907 () Bool)

(assert (=> start!112460 m!1219907))

(declare-fun m!1219909 () Bool)

(assert (=> start!112460 m!1219909))

(declare-fun m!1219911 () Bool)

(assert (=> start!112460 m!1219911))

(declare-fun m!1219913 () Bool)

(assert (=> b!1330857 m!1219913))

(declare-fun m!1219915 () Bool)

(assert (=> b!1330857 m!1219915))

(declare-fun m!1219917 () Bool)

(assert (=> b!1330857 m!1219917))

(declare-fun m!1219919 () Bool)

(assert (=> b!1330857 m!1219919))

(assert (=> b!1330857 m!1219915))

(declare-fun m!1219921 () Bool)

(assert (=> b!1330857 m!1219921))

(assert (=> b!1330857 m!1219895))

(declare-fun m!1219923 () Bool)

(assert (=> b!1330857 m!1219923))

(assert (=> b!1330857 m!1219921))

(assert (=> b!1330857 m!1219913))

(declare-fun m!1219925 () Bool)

(assert (=> b!1330857 m!1219925))

(assert (=> b!1330854 m!1219895))

(assert (=> b!1330854 m!1219895))

(declare-fun m!1219927 () Bool)

(assert (=> b!1330854 m!1219927))

(check-sat (not b!1330860) (not start!112460) (not b_lambda!23885) (not b!1330850) tp_is_empty!36541 (not mapNonEmpty!56485) (not b!1330857) (not b!1330854) (not b_next!30631) (not b!1330853) b_and!49321)
(check-sat b_and!49321 (not b_next!30631))
