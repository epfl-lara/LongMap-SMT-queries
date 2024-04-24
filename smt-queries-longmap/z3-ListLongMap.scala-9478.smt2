; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112700 () Bool)

(assert start!112700)

(declare-fun b_free!30871 () Bool)

(declare-fun b_next!30871 () Bool)

(assert (=> start!112700 (= b_free!30871 (not b_next!30871))))

(declare-fun tp!108250 () Bool)

(declare-fun b_and!49745 () Bool)

(assert (=> start!112700 (= tp!108250 b_and!49745)))

(declare-fun mapNonEmpty!56845 () Bool)

(declare-fun mapRes!56845 () Bool)

(declare-fun tp!108249 () Bool)

(declare-fun e!760607 () Bool)

(assert (=> mapNonEmpty!56845 (= mapRes!56845 (and tp!108249 e!760607))))

(declare-datatypes ((V!54145 0))(
  ( (V!54146 (val!18465 Int)) )
))
(declare-datatypes ((ValueCell!17492 0))(
  ( (ValueCellFull!17492 (v!21097 V!54145)) (EmptyCell!17492) )
))
(declare-fun mapValue!56845 () ValueCell!17492)

(declare-fun mapKey!56845 () (_ BitVec 32))

(declare-fun mapRest!56845 () (Array (_ BitVec 32) ValueCell!17492))

(declare-datatypes ((array!90535 0))(
  ( (array!90536 (arr!43729 (Array (_ BitVec 32) ValueCell!17492)) (size!44280 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90535)

(assert (=> mapNonEmpty!56845 (= (arr!43729 _values!1320) (store mapRest!56845 mapKey!56845 mapValue!56845))))

(declare-fun b!1335117 () Bool)

(declare-fun e!760609 () Bool)

(declare-fun tp_is_empty!36781 () Bool)

(assert (=> b!1335117 (= e!760609 tp_is_empty!36781)))

(declare-fun b!1335118 () Bool)

(declare-fun res!885703 () Bool)

(declare-fun e!760606 () Bool)

(assert (=> b!1335118 (=> (not res!885703) (not e!760606))))

(declare-datatypes ((array!90537 0))(
  ( (array!90538 (arr!43730 (Array (_ BitVec 32) (_ BitVec 64))) (size!44281 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90537)

(declare-datatypes ((List!30982 0))(
  ( (Nil!30979) (Cons!30978 (h!32196 (_ BitVec 64)) (t!45204 List!30982)) )
))
(declare-fun arrayNoDuplicates!0 (array!90537 (_ BitVec 32) List!30982) Bool)

(assert (=> b!1335118 (= res!885703 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30979))))

(declare-fun res!885696 () Bool)

(assert (=> start!112700 (=> (not res!885696) (not e!760606))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112700 (= res!885696 (validMask!0 mask!1998))))

(assert (=> start!112700 e!760606))

(declare-fun e!760605 () Bool)

(declare-fun array_inv!33253 (array!90535) Bool)

(assert (=> start!112700 (and (array_inv!33253 _values!1320) e!760605)))

(assert (=> start!112700 true))

(declare-fun array_inv!33254 (array!90537) Bool)

(assert (=> start!112700 (array_inv!33254 _keys!1590)))

(assert (=> start!112700 tp!108250))

(assert (=> start!112700 tp_is_empty!36781))

(declare-fun b!1335119 () Bool)

(declare-fun res!885700 () Bool)

(assert (=> b!1335119 (=> (not res!885700) (not e!760606))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!54145)

(declare-fun zeroValue!1262 () V!54145)

(declare-fun from!1980 () (_ BitVec 32))

(declare-datatypes ((tuple2!23828 0))(
  ( (tuple2!23829 (_1!11925 (_ BitVec 64)) (_2!11925 V!54145)) )
))
(declare-datatypes ((List!30983 0))(
  ( (Nil!30980) (Cons!30979 (h!32197 tuple2!23828) (t!45205 List!30983)) )
))
(declare-datatypes ((ListLongMap!21493 0))(
  ( (ListLongMap!21494 (toList!10762 List!30983)) )
))
(declare-fun contains!8938 (ListLongMap!21493 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5725 (array!90537 array!90535 (_ BitVec 32) (_ BitVec 32) V!54145 V!54145 (_ BitVec 32) Int) ListLongMap!21493)

(assert (=> b!1335119 (= res!885700 (contains!8938 (getCurrentListMap!5725 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1335120 () Bool)

(assert (=> b!1335120 (= e!760607 tp_is_empty!36781)))

(declare-fun b!1335121 () Bool)

(declare-fun res!885694 () Bool)

(assert (=> b!1335121 (=> (not res!885694) (not e!760606))))

(assert (=> b!1335121 (= res!885694 (not (= (select (arr!43730 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1335122 () Bool)

(declare-fun e!760608 () Bool)

(assert (=> b!1335122 (= e!760608 (not true))))

(declare-fun lt!592686 () ListLongMap!21493)

(assert (=> b!1335122 (contains!8938 lt!592686 k0!1153)))

(declare-fun lt!592685 () V!54145)

(declare-datatypes ((Unit!43810 0))(
  ( (Unit!43811) )
))
(declare-fun lt!592684 () Unit!43810)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!293 ((_ BitVec 64) (_ BitVec 64) V!54145 ListLongMap!21493) Unit!43810)

(assert (=> b!1335122 (= lt!592684 (lemmaInListMapAfterAddingDiffThenInBefore!293 k0!1153 (select (arr!43730 _keys!1590) from!1980) lt!592685 lt!592686))))

(declare-fun mapIsEmpty!56845 () Bool)

(assert (=> mapIsEmpty!56845 mapRes!56845))

(declare-fun b!1335123 () Bool)

(declare-fun res!885698 () Bool)

(assert (=> b!1335123 (=> (not res!885698) (not e!760606))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1335123 (= res!885698 (validKeyInArray!0 (select (arr!43730 _keys!1590) from!1980)))))

(declare-fun b!1335124 () Bool)

(declare-fun res!885695 () Bool)

(assert (=> b!1335124 (=> (not res!885695) (not e!760606))))

(assert (=> b!1335124 (= res!885695 (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))

(declare-fun b!1335125 () Bool)

(assert (=> b!1335125 (= e!760605 (and e!760609 mapRes!56845))))

(declare-fun condMapEmpty!56845 () Bool)

(declare-fun mapDefault!56845 () ValueCell!17492)

(assert (=> b!1335125 (= condMapEmpty!56845 (= (arr!43729 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17492)) mapDefault!56845)))))

(declare-fun b!1335126 () Bool)

(assert (=> b!1335126 (= e!760606 e!760608)))

(declare-fun res!885699 () Bool)

(assert (=> b!1335126 (=> (not res!885699) (not e!760608))))

(declare-fun +!4753 (ListLongMap!21493 tuple2!23828) ListLongMap!21493)

(assert (=> b!1335126 (= res!885699 (contains!8938 (+!4753 lt!592686 (tuple2!23829 (select (arr!43730 _keys!1590) from!1980) lt!592685)) k0!1153))))

(declare-fun getCurrentListMapNoExtraKeys!6397 (array!90537 array!90535 (_ BitVec 32) (_ BitVec 32) V!54145 V!54145 (_ BitVec 32) Int) ListLongMap!21493)

(assert (=> b!1335126 (= lt!592686 (getCurrentListMapNoExtraKeys!6397 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun get!22076 (ValueCell!17492 V!54145) V!54145)

(declare-fun dynLambda!3707 (Int (_ BitVec 64)) V!54145)

(assert (=> b!1335126 (= lt!592685 (get!22076 (select (arr!43729 _values!1320) from!1980) (dynLambda!3707 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1335127 () Bool)

(declare-fun res!885704 () Bool)

(assert (=> b!1335127 (=> (not res!885704) (not e!760606))))

(assert (=> b!1335127 (= res!885704 (and (= (size!44280 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44281 _keys!1590) (size!44280 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1335128 () Bool)

(declare-fun res!885701 () Bool)

(assert (=> b!1335128 (=> (not res!885701) (not e!760606))))

(assert (=> b!1335128 (= res!885701 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44281 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1335129 () Bool)

(declare-fun res!885697 () Bool)

(assert (=> b!1335129 (=> (not res!885697) (not e!760608))))

(assert (=> b!1335129 (= res!885697 (not (= k0!1153 (select (arr!43730 _keys!1590) from!1980))))))

(declare-fun b!1335130 () Bool)

(declare-fun res!885702 () Bool)

(assert (=> b!1335130 (=> (not res!885702) (not e!760606))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90537 (_ BitVec 32)) Bool)

(assert (=> b!1335130 (= res!885702 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112700 res!885696) b!1335127))

(assert (= (and b!1335127 res!885704) b!1335130))

(assert (= (and b!1335130 res!885702) b!1335118))

(assert (= (and b!1335118 res!885703) b!1335128))

(assert (= (and b!1335128 res!885701) b!1335119))

(assert (= (and b!1335119 res!885700) b!1335121))

(assert (= (and b!1335121 res!885694) b!1335123))

(assert (= (and b!1335123 res!885698) b!1335124))

(assert (= (and b!1335124 res!885695) b!1335126))

(assert (= (and b!1335126 res!885699) b!1335129))

(assert (= (and b!1335129 res!885697) b!1335122))

(assert (= (and b!1335125 condMapEmpty!56845) mapIsEmpty!56845))

(assert (= (and b!1335125 (not condMapEmpty!56845)) mapNonEmpty!56845))

(get-info :version)

(assert (= (and mapNonEmpty!56845 ((_ is ValueCellFull!17492) mapValue!56845)) b!1335120))

(assert (= (and b!1335125 ((_ is ValueCellFull!17492) mapDefault!56845)) b!1335117))

(assert (= start!112700 b!1335125))

(declare-fun b_lambda!24071 () Bool)

(assert (=> (not b_lambda!24071) (not b!1335126)))

(declare-fun t!45203 () Bool)

(declare-fun tb!12025 () Bool)

(assert (=> (and start!112700 (= defaultEntry!1323 defaultEntry!1323) t!45203) tb!12025))

(declare-fun result!25129 () Bool)

(assert (=> tb!12025 (= result!25129 tp_is_empty!36781)))

(assert (=> b!1335126 t!45203))

(declare-fun b_and!49747 () Bool)

(assert (= b_and!49745 (and (=> t!45203 result!25129) b_and!49747)))

(declare-fun m!1223897 () Bool)

(assert (=> b!1335121 m!1223897))

(declare-fun m!1223899 () Bool)

(assert (=> b!1335118 m!1223899))

(declare-fun m!1223901 () Bool)

(assert (=> b!1335130 m!1223901))

(declare-fun m!1223903 () Bool)

(assert (=> b!1335122 m!1223903))

(assert (=> b!1335122 m!1223897))

(assert (=> b!1335122 m!1223897))

(declare-fun m!1223905 () Bool)

(assert (=> b!1335122 m!1223905))

(declare-fun m!1223907 () Bool)

(assert (=> b!1335126 m!1223907))

(declare-fun m!1223909 () Bool)

(assert (=> b!1335126 m!1223909))

(declare-fun m!1223911 () Bool)

(assert (=> b!1335126 m!1223911))

(declare-fun m!1223913 () Bool)

(assert (=> b!1335126 m!1223913))

(assert (=> b!1335126 m!1223911))

(declare-fun m!1223915 () Bool)

(assert (=> b!1335126 m!1223915))

(assert (=> b!1335126 m!1223907))

(declare-fun m!1223917 () Bool)

(assert (=> b!1335126 m!1223917))

(assert (=> b!1335126 m!1223913))

(assert (=> b!1335126 m!1223897))

(declare-fun m!1223919 () Bool)

(assert (=> mapNonEmpty!56845 m!1223919))

(declare-fun m!1223921 () Bool)

(assert (=> start!112700 m!1223921))

(declare-fun m!1223923 () Bool)

(assert (=> start!112700 m!1223923))

(declare-fun m!1223925 () Bool)

(assert (=> start!112700 m!1223925))

(assert (=> b!1335129 m!1223897))

(assert (=> b!1335123 m!1223897))

(assert (=> b!1335123 m!1223897))

(declare-fun m!1223927 () Bool)

(assert (=> b!1335123 m!1223927))

(declare-fun m!1223929 () Bool)

(assert (=> b!1335119 m!1223929))

(assert (=> b!1335119 m!1223929))

(declare-fun m!1223931 () Bool)

(assert (=> b!1335119 m!1223931))

(check-sat (not mapNonEmpty!56845) (not b!1335122) (not b_next!30871) (not start!112700) (not b!1335126) (not b!1335119) (not b!1335123) (not b!1335130) b_and!49747 tp_is_empty!36781 (not b!1335118) (not b_lambda!24071))
(check-sat b_and!49747 (not b_next!30871))
