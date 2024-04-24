; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112562 () Bool)

(assert start!112562)

(declare-fun b_free!30733 () Bool)

(declare-fun b_next!30733 () Bool)

(assert (=> start!112562 (= b_free!30733 (not b_next!30733))))

(declare-fun tp!107836 () Bool)

(declare-fun b_and!49523 () Bool)

(assert (=> start!112562 (= tp!107836 b_and!49523)))

(declare-fun b!1332788 () Bool)

(declare-fun res!884070 () Bool)

(declare-fun e!759544 () Bool)

(assert (=> b!1332788 (=> (not res!884070) (not e!759544))))

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun k0!1153 () (_ BitVec 64))

(declare-datatypes ((array!90275 0))(
  ( (array!90276 (arr!43599 (Array (_ BitVec 32) (_ BitVec 64))) (size!44150 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90275)

(assert (=> b!1332788 (= res!884070 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44150 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332789 () Bool)

(declare-fun res!884074 () Bool)

(assert (=> b!1332789 (=> (not res!884074) (not e!759544))))

(declare-datatypes ((V!53961 0))(
  ( (V!53962 (val!18396 Int)) )
))
(declare-datatypes ((ValueCell!17423 0))(
  ( (ValueCellFull!17423 (v!21028 V!53961)) (EmptyCell!17423) )
))
(declare-datatypes ((array!90277 0))(
  ( (array!90278 (arr!43600 (Array (_ BitVec 32) ValueCell!17423)) (size!44151 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90277)

(declare-fun mask!1998 () (_ BitVec 32))

(assert (=> b!1332789 (= res!884074 (and (= (size!44151 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44150 _keys!1590) (size!44151 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332790 () Bool)

(declare-fun e!759540 () Bool)

(declare-fun tp_is_empty!36643 () Bool)

(assert (=> b!1332790 (= e!759540 tp_is_empty!36643)))

(declare-fun b!1332791 () Bool)

(declare-fun res!884077 () Bool)

(assert (=> b!1332791 (=> (not res!884077) (not e!759544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332791 (= res!884077 (validKeyInArray!0 (select (arr!43599 _keys!1590) from!1980)))))

(declare-fun b!1332792 () Bool)

(declare-fun res!884071 () Bool)

(assert (=> b!1332792 (=> (not res!884071) (not e!759544))))

(assert (=> b!1332792 (= res!884071 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!56638 () Bool)

(declare-fun mapRes!56638 () Bool)

(declare-fun tp!107835 () Bool)

(assert (=> mapNonEmpty!56638 (= mapRes!56638 (and tp!107835 e!759540))))

(declare-fun mapKey!56638 () (_ BitVec 32))

(declare-fun mapRest!56638 () (Array (_ BitVec 32) ValueCell!17423))

(declare-fun mapValue!56638 () ValueCell!17423)

(assert (=> mapNonEmpty!56638 (= (arr!43600 _values!1320) (store mapRest!56638 mapKey!56638 mapValue!56638))))

(declare-fun b!1332793 () Bool)

(declare-fun e!759542 () Bool)

(assert (=> b!1332793 (= e!759542 tp_is_empty!36643)))

(declare-fun b!1332794 () Bool)

(declare-fun res!884078 () Bool)

(assert (=> b!1332794 (=> (not res!884078) (not e!759544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90275 (_ BitVec 32)) Bool)

(assert (=> b!1332794 (= res!884078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332795 () Bool)

(declare-fun res!884076 () Bool)

(assert (=> b!1332795 (=> (not res!884076) (not e!759544))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun minValue!1262 () V!53961)

(declare-fun zeroValue!1262 () V!53961)

(declare-datatypes ((tuple2!23730 0))(
  ( (tuple2!23731 (_1!11876 (_ BitVec 64)) (_2!11876 V!53961)) )
))
(declare-datatypes ((List!30895 0))(
  ( (Nil!30892) (Cons!30891 (h!32109 tuple2!23730) (t!45033 List!30895)) )
))
(declare-datatypes ((ListLongMap!21395 0))(
  ( (ListLongMap!21396 (toList!10713 List!30895)) )
))
(declare-fun contains!8889 (ListLongMap!21395 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5682 (array!90275 array!90277 (_ BitVec 32) (_ BitVec 32) V!53961 V!53961 (_ BitVec 32) Int) ListLongMap!21395)

(assert (=> b!1332795 (= res!884076 (contains!8889 (getCurrentListMap!5682 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332796 () Bool)

(assert (=> b!1332796 (= e!759544 (not true))))

(declare-fun lt!592035 () ListLongMap!21395)

(declare-fun +!4726 (ListLongMap!21395 tuple2!23730) ListLongMap!21395)

(assert (=> b!1332796 (contains!8889 (+!4726 lt!592035 (tuple2!23731 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262)) k0!1153)))

(declare-datatypes ((Unit!43762 0))(
  ( (Unit!43763) )
))
(declare-fun lt!592036 () Unit!43762)

(declare-fun addStillContains!1172 (ListLongMap!21395 (_ BitVec 64) V!53961 (_ BitVec 64)) Unit!43762)

(assert (=> b!1332796 (= lt!592036 (addStillContains!1172 lt!592035 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 k0!1153))))

(assert (=> b!1332796 (contains!8889 lt!592035 k0!1153)))

(declare-fun lt!592038 () V!53961)

(declare-fun lt!592033 () Unit!43762)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!269 ((_ BitVec 64) (_ BitVec 64) V!53961 ListLongMap!21395) Unit!43762)

(assert (=> b!1332796 (= lt!592033 (lemmaInListMapAfterAddingDiffThenInBefore!269 k0!1153 (select (arr!43599 _keys!1590) from!1980) lt!592038 lt!592035))))

(declare-fun lt!592034 () ListLongMap!21395)

(assert (=> b!1332796 (contains!8889 lt!592034 k0!1153)))

(declare-fun lt!592037 () Unit!43762)

(assert (=> b!1332796 (= lt!592037 (lemmaInListMapAfterAddingDiffThenInBefore!269 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!592034))))

(assert (=> b!1332796 (= lt!592034 (+!4726 lt!592035 (tuple2!23731 (select (arr!43599 _keys!1590) from!1980) lt!592038)))))

(declare-fun get!22003 (ValueCell!17423 V!53961) V!53961)

(declare-fun dynLambda!3680 (Int (_ BitVec 64)) V!53961)

(assert (=> b!1332796 (= lt!592038 (get!22003 (select (arr!43600 _values!1320) from!1980) (dynLambda!3680 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6370 (array!90275 array!90277 (_ BitVec 32) (_ BitVec 32) V!53961 V!53961 (_ BitVec 32) Int) ListLongMap!21395)

(assert (=> b!1332796 (= lt!592035 (getCurrentListMapNoExtraKeys!6370 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332797 () Bool)

(declare-fun res!884073 () Bool)

(assert (=> b!1332797 (=> (not res!884073) (not e!759544))))

(assert (=> b!1332797 (= res!884073 (not (= (select (arr!43599 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332798 () Bool)

(declare-fun e!759543 () Bool)

(assert (=> b!1332798 (= e!759543 (and e!759542 mapRes!56638))))

(declare-fun condMapEmpty!56638 () Bool)

(declare-fun mapDefault!56638 () ValueCell!17423)

(assert (=> b!1332798 (= condMapEmpty!56638 (= (arr!43600 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17423)) mapDefault!56638)))))

(declare-fun b!1332799 () Bool)

(declare-fun res!884072 () Bool)

(assert (=> b!1332799 (=> (not res!884072) (not e!759544))))

(declare-datatypes ((List!30896 0))(
  ( (Nil!30893) (Cons!30892 (h!32110 (_ BitVec 64)) (t!45034 List!30896)) )
))
(declare-fun arrayNoDuplicates!0 (array!90275 (_ BitVec 32) List!30896) Bool)

(assert (=> b!1332799 (= res!884072 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30893))))

(declare-fun res!884075 () Bool)

(assert (=> start!112562 (=> (not res!884075) (not e!759544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112562 (= res!884075 (validMask!0 mask!1998))))

(assert (=> start!112562 e!759544))

(declare-fun array_inv!33167 (array!90277) Bool)

(assert (=> start!112562 (and (array_inv!33167 _values!1320) e!759543)))

(assert (=> start!112562 true))

(declare-fun array_inv!33168 (array!90275) Bool)

(assert (=> start!112562 (array_inv!33168 _keys!1590)))

(assert (=> start!112562 tp!107836))

(assert (=> start!112562 tp_is_empty!36643))

(declare-fun mapIsEmpty!56638 () Bool)

(assert (=> mapIsEmpty!56638 mapRes!56638))

(assert (= (and start!112562 res!884075) b!1332789))

(assert (= (and b!1332789 res!884074) b!1332794))

(assert (= (and b!1332794 res!884078) b!1332799))

(assert (= (and b!1332799 res!884072) b!1332788))

(assert (= (and b!1332788 res!884070) b!1332795))

(assert (= (and b!1332795 res!884076) b!1332797))

(assert (= (and b!1332797 res!884073) b!1332791))

(assert (= (and b!1332791 res!884077) b!1332792))

(assert (= (and b!1332792 res!884071) b!1332796))

(assert (= (and b!1332798 condMapEmpty!56638) mapIsEmpty!56638))

(assert (= (and b!1332798 (not condMapEmpty!56638)) mapNonEmpty!56638))

(get-info :version)

(assert (= (and mapNonEmpty!56638 ((_ is ValueCellFull!17423) mapValue!56638)) b!1332790))

(assert (= (and b!1332798 ((_ is ValueCellFull!17423) mapDefault!56638)) b!1332793))

(assert (= start!112562 b!1332798))

(declare-fun b_lambda!23987 () Bool)

(assert (=> (not b_lambda!23987) (not b!1332796)))

(declare-fun t!45032 () Bool)

(declare-fun tb!11941 () Bool)

(assert (=> (and start!112562 (= defaultEntry!1323 defaultEntry!1323) t!45032) tb!11941))

(declare-fun result!24961 () Bool)

(assert (=> tb!11941 (= result!24961 tp_is_empty!36643)))

(assert (=> b!1332796 t!45032))

(declare-fun b_and!49525 () Bool)

(assert (= b_and!49523 (and (=> t!45032 result!24961) b_and!49525)))

(declare-fun m!1221749 () Bool)

(assert (=> start!112562 m!1221749))

(declare-fun m!1221751 () Bool)

(assert (=> start!112562 m!1221751))

(declare-fun m!1221753 () Bool)

(assert (=> start!112562 m!1221753))

(declare-fun m!1221755 () Bool)

(assert (=> b!1332796 m!1221755))

(declare-fun m!1221757 () Bool)

(assert (=> b!1332796 m!1221757))

(declare-fun m!1221759 () Bool)

(assert (=> b!1332796 m!1221759))

(declare-fun m!1221761 () Bool)

(assert (=> b!1332796 m!1221761))

(assert (=> b!1332796 m!1221759))

(declare-fun m!1221763 () Bool)

(assert (=> b!1332796 m!1221763))

(declare-fun m!1221765 () Bool)

(assert (=> b!1332796 m!1221765))

(assert (=> b!1332796 m!1221755))

(declare-fun m!1221767 () Bool)

(assert (=> b!1332796 m!1221767))

(declare-fun m!1221769 () Bool)

(assert (=> b!1332796 m!1221769))

(declare-fun m!1221771 () Bool)

(assert (=> b!1332796 m!1221771))

(declare-fun m!1221773 () Bool)

(assert (=> b!1332796 m!1221773))

(assert (=> b!1332796 m!1221773))

(declare-fun m!1221775 () Bool)

(assert (=> b!1332796 m!1221775))

(declare-fun m!1221777 () Bool)

(assert (=> b!1332796 m!1221777))

(assert (=> b!1332796 m!1221761))

(declare-fun m!1221779 () Bool)

(assert (=> b!1332796 m!1221779))

(declare-fun m!1221781 () Bool)

(assert (=> b!1332799 m!1221781))

(declare-fun m!1221783 () Bool)

(assert (=> b!1332794 m!1221783))

(assert (=> b!1332791 m!1221773))

(assert (=> b!1332791 m!1221773))

(declare-fun m!1221785 () Bool)

(assert (=> b!1332791 m!1221785))

(declare-fun m!1221787 () Bool)

(assert (=> b!1332795 m!1221787))

(assert (=> b!1332795 m!1221787))

(declare-fun m!1221789 () Bool)

(assert (=> b!1332795 m!1221789))

(declare-fun m!1221791 () Bool)

(assert (=> mapNonEmpty!56638 m!1221791))

(assert (=> b!1332797 m!1221773))

(check-sat (not mapNonEmpty!56638) (not start!112562) (not b!1332795) (not b!1332791) b_and!49525 (not b_lambda!23987) (not b!1332794) (not b_next!30733) (not b!1332796) tp_is_empty!36643 (not b!1332799))
(check-sat b_and!49525 (not b_next!30733))
