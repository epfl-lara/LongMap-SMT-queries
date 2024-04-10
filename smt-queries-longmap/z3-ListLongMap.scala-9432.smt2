; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112202 () Bool)

(assert start!112202)

(declare-fun b_free!30597 () Bool)

(declare-fun b_next!30597 () Bool)

(assert (=> start!112202 (= b_free!30597 (not b_next!30597))))

(declare-fun tp!107428 () Bool)

(declare-fun b_and!49249 () Bool)

(assert (=> start!112202 (= tp!107428 b_and!49249)))

(declare-fun res!881722 () Bool)

(declare-fun e!757681 () Bool)

(assert (=> start!112202 (=> (not res!881722) (not e!757681))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112202 (= res!881722 (validMask!0 mask!1998))))

(assert (=> start!112202 e!757681))

(declare-datatypes ((V!53779 0))(
  ( (V!53780 (val!18328 Int)) )
))
(declare-datatypes ((ValueCell!17355 0))(
  ( (ValueCellFull!17355 (v!20965 V!53779)) (EmptyCell!17355) )
))
(declare-datatypes ((array!89906 0))(
  ( (array!89907 (arr!43419 (Array (_ BitVec 32) ValueCell!17355)) (size!43969 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89906)

(declare-fun e!757678 () Bool)

(declare-fun array_inv!32761 (array!89906) Bool)

(assert (=> start!112202 (and (array_inv!32761 _values!1320) e!757678)))

(assert (=> start!112202 true))

(declare-datatypes ((array!89908 0))(
  ( (array!89909 (arr!43420 (Array (_ BitVec 32) (_ BitVec 64))) (size!43970 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89908)

(declare-fun array_inv!32762 (array!89908) Bool)

(assert (=> start!112202 (array_inv!32762 _keys!1590)))

(assert (=> start!112202 tp!107428))

(declare-fun tp_is_empty!36507 () Bool)

(assert (=> start!112202 tp_is_empty!36507))

(declare-fun b!1328905 () Bool)

(declare-fun res!881716 () Bool)

(assert (=> b!1328905 (=> (not res!881716) (not e!757681))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1328905 (= res!881716 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!56434 () Bool)

(declare-fun mapRes!56434 () Bool)

(assert (=> mapIsEmpty!56434 mapRes!56434))

(declare-fun b!1328906 () Bool)

(assert (=> b!1328906 (= e!757681 false)))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun zeroValue!1262 () V!53779)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53779)

(declare-fun lt!590884 () Bool)

(declare-datatypes ((tuple2!23592 0))(
  ( (tuple2!23593 (_1!11807 (_ BitVec 64)) (_2!11807 V!53779)) )
))
(declare-datatypes ((List!30748 0))(
  ( (Nil!30745) (Cons!30744 (h!31953 tuple2!23592) (t!44758 List!30748)) )
))
(declare-datatypes ((ListLongMap!21249 0))(
  ( (ListLongMap!21250 (toList!10640 List!30748)) )
))
(declare-fun contains!8804 (ListLongMap!21249 (_ BitVec 64)) Bool)

(declare-fun +!4642 (ListLongMap!21249 tuple2!23592) ListLongMap!21249)

(declare-fun getCurrentListMapNoExtraKeys!6280 (array!89908 array!89906 (_ BitVec 32) (_ BitVec 32) V!53779 V!53779 (_ BitVec 32) Int) ListLongMap!21249)

(declare-fun get!21870 (ValueCell!17355 V!53779) V!53779)

(declare-fun dynLambda!3581 (Int (_ BitVec 64)) V!53779)

(assert (=> b!1328906 (= lt!590884 (contains!8804 (+!4642 (+!4642 (getCurrentListMapNoExtraKeys!6280 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323) (tuple2!23593 (select (arr!43420 _keys!1590) from!1980) (get!21870 (select (arr!43419 _values!1320) from!1980) (dynLambda!3581 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23593 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153))))

(declare-fun b!1328907 () Bool)

(declare-fun e!757679 () Bool)

(assert (=> b!1328907 (= e!757679 tp_is_empty!36507)))

(declare-fun mapNonEmpty!56434 () Bool)

(declare-fun tp!107427 () Bool)

(assert (=> mapNonEmpty!56434 (= mapRes!56434 (and tp!107427 e!757679))))

(declare-fun mapValue!56434 () ValueCell!17355)

(declare-fun mapRest!56434 () (Array (_ BitVec 32) ValueCell!17355))

(declare-fun mapKey!56434 () (_ BitVec 32))

(assert (=> mapNonEmpty!56434 (= (arr!43419 _values!1320) (store mapRest!56434 mapKey!56434 mapValue!56434))))

(declare-fun b!1328908 () Bool)

(declare-fun e!757677 () Bool)

(assert (=> b!1328908 (= e!757678 (and e!757677 mapRes!56434))))

(declare-fun condMapEmpty!56434 () Bool)

(declare-fun mapDefault!56434 () ValueCell!17355)

(assert (=> b!1328908 (= condMapEmpty!56434 (= (arr!43419 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17355)) mapDefault!56434)))))

(declare-fun b!1328909 () Bool)

(declare-fun res!881724 () Bool)

(assert (=> b!1328909 (=> (not res!881724) (not e!757681))))

(assert (=> b!1328909 (= res!881724 (not (= (select (arr!43420 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1328910 () Bool)

(assert (=> b!1328910 (= e!757677 tp_is_empty!36507)))

(declare-fun b!1328911 () Bool)

(declare-fun res!881723 () Bool)

(assert (=> b!1328911 (=> (not res!881723) (not e!757681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1328911 (= res!881723 (validKeyInArray!0 (select (arr!43420 _keys!1590) from!1980)))))

(declare-fun b!1328912 () Bool)

(declare-fun res!881718 () Bool)

(assert (=> b!1328912 (=> (not res!881718) (not e!757681))))

(declare-datatypes ((List!30749 0))(
  ( (Nil!30746) (Cons!30745 (h!31954 (_ BitVec 64)) (t!44759 List!30749)) )
))
(declare-fun arrayNoDuplicates!0 (array!89908 (_ BitVec 32) List!30749) Bool)

(assert (=> b!1328912 (= res!881718 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30746))))

(declare-fun b!1328913 () Bool)

(declare-fun res!881720 () Bool)

(assert (=> b!1328913 (=> (not res!881720) (not e!757681))))

(declare-fun getCurrentListMap!5631 (array!89908 array!89906 (_ BitVec 32) (_ BitVec 32) V!53779 V!53779 (_ BitVec 32) Int) ListLongMap!21249)

(assert (=> b!1328913 (= res!881720 (contains!8804 (getCurrentListMap!5631 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328914 () Bool)

(declare-fun res!881719 () Bool)

(assert (=> b!1328914 (=> (not res!881719) (not e!757681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89908 (_ BitVec 32)) Bool)

(assert (=> b!1328914 (= res!881719 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1328915 () Bool)

(declare-fun res!881721 () Bool)

(assert (=> b!1328915 (=> (not res!881721) (not e!757681))))

(assert (=> b!1328915 (= res!881721 (and (= (size!43969 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43970 _keys!1590) (size!43969 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328916 () Bool)

(declare-fun res!881717 () Bool)

(assert (=> b!1328916 (=> (not res!881717) (not e!757681))))

(assert (=> b!1328916 (= res!881717 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43970 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!112202 res!881722) b!1328915))

(assert (= (and b!1328915 res!881721) b!1328914))

(assert (= (and b!1328914 res!881719) b!1328912))

(assert (= (and b!1328912 res!881718) b!1328916))

(assert (= (and b!1328916 res!881717) b!1328913))

(assert (= (and b!1328913 res!881720) b!1328909))

(assert (= (and b!1328909 res!881724) b!1328911))

(assert (= (and b!1328911 res!881723) b!1328905))

(assert (= (and b!1328905 res!881716) b!1328906))

(assert (= (and b!1328908 condMapEmpty!56434) mapIsEmpty!56434))

(assert (= (and b!1328908 (not condMapEmpty!56434)) mapNonEmpty!56434))

(get-info :version)

(assert (= (and mapNonEmpty!56434 ((_ is ValueCellFull!17355) mapValue!56434)) b!1328907))

(assert (= (and b!1328908 ((_ is ValueCellFull!17355) mapDefault!56434)) b!1328910))

(assert (= start!112202 b!1328908))

(declare-fun b_lambda!23857 () Bool)

(assert (=> (not b_lambda!23857) (not b!1328906)))

(declare-fun t!44757 () Bool)

(declare-fun tb!11813 () Bool)

(assert (=> (and start!112202 (= defaultEntry!1323 defaultEntry!1323) t!44757) tb!11813))

(declare-fun result!24697 () Bool)

(assert (=> tb!11813 (= result!24697 tp_is_empty!36507)))

(assert (=> b!1328906 t!44757))

(declare-fun b_and!49251 () Bool)

(assert (= b_and!49249 (and (=> t!44757 result!24697) b_and!49251)))

(declare-fun m!1217719 () Bool)

(assert (=> b!1328913 m!1217719))

(assert (=> b!1328913 m!1217719))

(declare-fun m!1217721 () Bool)

(assert (=> b!1328913 m!1217721))

(declare-fun m!1217723 () Bool)

(assert (=> b!1328911 m!1217723))

(assert (=> b!1328911 m!1217723))

(declare-fun m!1217725 () Bool)

(assert (=> b!1328911 m!1217725))

(declare-fun m!1217727 () Bool)

(assert (=> b!1328912 m!1217727))

(declare-fun m!1217729 () Bool)

(assert (=> b!1328906 m!1217729))

(declare-fun m!1217731 () Bool)

(assert (=> b!1328906 m!1217731))

(declare-fun m!1217733 () Bool)

(assert (=> b!1328906 m!1217733))

(declare-fun m!1217735 () Bool)

(assert (=> b!1328906 m!1217735))

(declare-fun m!1217737 () Bool)

(assert (=> b!1328906 m!1217737))

(assert (=> b!1328906 m!1217731))

(declare-fun m!1217739 () Bool)

(assert (=> b!1328906 m!1217739))

(assert (=> b!1328906 m!1217729))

(assert (=> b!1328906 m!1217733))

(assert (=> b!1328906 m!1217723))

(assert (=> b!1328906 m!1217735))

(assert (=> b!1328906 m!1217739))

(declare-fun m!1217741 () Bool)

(assert (=> b!1328906 m!1217741))

(declare-fun m!1217743 () Bool)

(assert (=> b!1328914 m!1217743))

(declare-fun m!1217745 () Bool)

(assert (=> mapNonEmpty!56434 m!1217745))

(assert (=> b!1328909 m!1217723))

(declare-fun m!1217747 () Bool)

(assert (=> start!112202 m!1217747))

(declare-fun m!1217749 () Bool)

(assert (=> start!112202 m!1217749))

(declare-fun m!1217751 () Bool)

(assert (=> start!112202 m!1217751))

(check-sat (not b!1328906) (not mapNonEmpty!56434) (not b!1328913) (not b!1328912) (not b_lambda!23857) tp_is_empty!36507 (not b_next!30597) (not b!1328911) b_and!49251 (not start!112202) (not b!1328914))
(check-sat b_and!49251 (not b_next!30597))
