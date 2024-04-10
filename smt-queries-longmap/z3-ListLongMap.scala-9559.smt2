; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113218 () Bool)

(assert start!113218)

(declare-fun b_free!31269 () Bool)

(declare-fun b_next!31269 () Bool)

(assert (=> start!113218 (= b_free!31269 (not b_next!31269))))

(declare-fun tp!109611 () Bool)

(declare-fun b_and!50445 () Bool)

(assert (=> start!113218 (= tp!109611 b_and!50445)))

(declare-fun b!1343005 () Bool)

(declare-fun e!764496 () Bool)

(declare-fun e!764497 () Bool)

(declare-fun mapRes!57610 () Bool)

(assert (=> b!1343005 (= e!764496 (and e!764497 mapRes!57610))))

(declare-fun condMapEmpty!57610 () Bool)

(declare-datatypes ((V!54795 0))(
  ( (V!54796 (val!18709 Int)) )
))
(declare-datatypes ((ValueCell!17736 0))(
  ( (ValueCellFull!17736 (v!21357 V!54795)) (EmptyCell!17736) )
))
(declare-datatypes ((array!91386 0))(
  ( (array!91387 (arr!44149 (Array (_ BitVec 32) ValueCell!17736)) (size!44699 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91386)

(declare-fun mapDefault!57610 () ValueCell!17736)

(assert (=> b!1343005 (= condMapEmpty!57610 (= (arr!44149 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17736)) mapDefault!57610)))))

(declare-fun b!1343006 () Bool)

(declare-fun res!891029 () Bool)

(declare-fun e!764498 () Bool)

(assert (=> b!1343006 (=> (not res!891029) (not e!764498))))

(declare-fun minValue!1245 () V!54795)

(declare-datatypes ((array!91388 0))(
  ( (array!91389 (arr!44150 (Array (_ BitVec 32) (_ BitVec 64))) (size!44700 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91388)

(declare-fun zeroValue!1245 () V!54795)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((tuple2!24102 0))(
  ( (tuple2!24103 (_1!12062 (_ BitVec 64)) (_2!12062 V!54795)) )
))
(declare-datatypes ((List!31259 0))(
  ( (Nil!31256) (Cons!31255 (h!32464 tuple2!24102) (t!45739 List!31259)) )
))
(declare-datatypes ((ListLongMap!21759 0))(
  ( (ListLongMap!21760 (toList!10895 List!31259)) )
))
(declare-fun contains!9071 (ListLongMap!21759 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5857 (array!91388 array!91386 (_ BitVec 32) (_ BitVec 32) V!54795 V!54795 (_ BitVec 32) Int) ListLongMap!21759)

(assert (=> b!1343006 (= res!891029 (contains!9071 (getCurrentListMap!5857 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343007 () Bool)

(declare-fun tp_is_empty!37269 () Bool)

(assert (=> b!1343007 (= e!764497 tp_is_empty!37269)))

(declare-fun b!1343008 () Bool)

(declare-fun res!891030 () Bool)

(assert (=> b!1343008 (=> (not res!891030) (not e!764498))))

(assert (=> b!1343008 (= res!891030 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44700 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343009 () Bool)

(assert (=> b!1343009 (= e!764498 (not true))))

(declare-fun lt!594723 () ListLongMap!21759)

(declare-fun +!4803 (ListLongMap!21759 tuple2!24102) ListLongMap!21759)

(assert (=> b!1343009 (contains!9071 (+!4803 lt!594723 (tuple2!24103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44083 0))(
  ( (Unit!44084) )
))
(declare-fun lt!594718 () Unit!44083)

(declare-fun addStillContains!1196 (ListLongMap!21759 (_ BitVec 64) V!54795 (_ BitVec 64)) Unit!44083)

(assert (=> b!1343009 (= lt!594718 (addStillContains!1196 lt!594723 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1343009 (contains!9071 lt!594723 k0!1142)))

(declare-fun lt!594721 () V!54795)

(declare-fun lt!594722 () Unit!44083)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!372 ((_ BitVec 64) (_ BitVec 64) V!54795 ListLongMap!21759) Unit!44083)

(assert (=> b!1343009 (= lt!594722 (lemmaInListMapAfterAddingDiffThenInBefore!372 k0!1142 (select (arr!44150 _keys!1571) from!1960) lt!594721 lt!594723))))

(declare-fun lt!594720 () ListLongMap!21759)

(assert (=> b!1343009 (contains!9071 lt!594720 k0!1142)))

(declare-fun lt!594719 () Unit!44083)

(assert (=> b!1343009 (= lt!594719 (lemmaInListMapAfterAddingDiffThenInBefore!372 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594720))))

(assert (=> b!1343009 (= lt!594720 (+!4803 lt!594723 (tuple2!24103 (select (arr!44150 _keys!1571) from!1960) lt!594721)))))

(declare-fun get!22298 (ValueCell!17736 V!54795) V!54795)

(declare-fun dynLambda!3742 (Int (_ BitVec 64)) V!54795)

(assert (=> b!1343009 (= lt!594721 (get!22298 (select (arr!44149 _values!1303) from!1960) (dynLambda!3742 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6445 (array!91388 array!91386 (_ BitVec 32) (_ BitVec 32) V!54795 V!54795 (_ BitVec 32) Int) ListLongMap!21759)

(assert (=> b!1343009 (= lt!594723 (getCurrentListMapNoExtraKeys!6445 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343010 () Bool)

(declare-fun res!891032 () Bool)

(assert (=> b!1343010 (=> (not res!891032) (not e!764498))))

(declare-datatypes ((List!31260 0))(
  ( (Nil!31257) (Cons!31256 (h!32465 (_ BitVec 64)) (t!45740 List!31260)) )
))
(declare-fun arrayNoDuplicates!0 (array!91388 (_ BitVec 32) List!31260) Bool)

(assert (=> b!1343010 (= res!891032 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31257))))

(declare-fun b!1343011 () Bool)

(declare-fun res!891035 () Bool)

(assert (=> b!1343011 (=> (not res!891035) (not e!764498))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91388 (_ BitVec 32)) Bool)

(assert (=> b!1343011 (= res!891035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343012 () Bool)

(declare-fun res!891031 () Bool)

(assert (=> b!1343012 (=> (not res!891031) (not e!764498))))

(assert (=> b!1343012 (= res!891031 (not (= (select (arr!44150 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343013 () Bool)

(declare-fun e!764494 () Bool)

(assert (=> b!1343013 (= e!764494 tp_is_empty!37269)))

(declare-fun res!891028 () Bool)

(assert (=> start!113218 (=> (not res!891028) (not e!764498))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113218 (= res!891028 (validMask!0 mask!1977))))

(assert (=> start!113218 e!764498))

(assert (=> start!113218 tp_is_empty!37269))

(assert (=> start!113218 true))

(declare-fun array_inv!33281 (array!91388) Bool)

(assert (=> start!113218 (array_inv!33281 _keys!1571)))

(declare-fun array_inv!33282 (array!91386) Bool)

(assert (=> start!113218 (and (array_inv!33282 _values!1303) e!764496)))

(assert (=> start!113218 tp!109611))

(declare-fun b!1343014 () Bool)

(declare-fun res!891034 () Bool)

(assert (=> b!1343014 (=> (not res!891034) (not e!764498))))

(assert (=> b!1343014 (= res!891034 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1343015 () Bool)

(declare-fun res!891033 () Bool)

(assert (=> b!1343015 (=> (not res!891033) (not e!764498))))

(assert (=> b!1343015 (= res!891033 (and (= (size!44699 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44700 _keys!1571) (size!44699 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!57610 () Bool)

(declare-fun tp!109612 () Bool)

(assert (=> mapNonEmpty!57610 (= mapRes!57610 (and tp!109612 e!764494))))

(declare-fun mapKey!57610 () (_ BitVec 32))

(declare-fun mapRest!57610 () (Array (_ BitVec 32) ValueCell!17736))

(declare-fun mapValue!57610 () ValueCell!17736)

(assert (=> mapNonEmpty!57610 (= (arr!44149 _values!1303) (store mapRest!57610 mapKey!57610 mapValue!57610))))

(declare-fun b!1343016 () Bool)

(declare-fun res!891036 () Bool)

(assert (=> b!1343016 (=> (not res!891036) (not e!764498))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343016 (= res!891036 (validKeyInArray!0 (select (arr!44150 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57610 () Bool)

(assert (=> mapIsEmpty!57610 mapRes!57610))

(assert (= (and start!113218 res!891028) b!1343015))

(assert (= (and b!1343015 res!891033) b!1343011))

(assert (= (and b!1343011 res!891035) b!1343010))

(assert (= (and b!1343010 res!891032) b!1343008))

(assert (= (and b!1343008 res!891030) b!1343006))

(assert (= (and b!1343006 res!891029) b!1343012))

(assert (= (and b!1343012 res!891031) b!1343016))

(assert (= (and b!1343016 res!891036) b!1343014))

(assert (= (and b!1343014 res!891034) b!1343009))

(assert (= (and b!1343005 condMapEmpty!57610) mapIsEmpty!57610))

(assert (= (and b!1343005 (not condMapEmpty!57610)) mapNonEmpty!57610))

(get-info :version)

(assert (= (and mapNonEmpty!57610 ((_ is ValueCellFull!17736) mapValue!57610)) b!1343013))

(assert (= (and b!1343005 ((_ is ValueCellFull!17736) mapDefault!57610)) b!1343007))

(assert (= start!113218 b!1343005))

(declare-fun b_lambda!24445 () Bool)

(assert (=> (not b_lambda!24445) (not b!1343009)))

(declare-fun t!45738 () Bool)

(declare-fun tb!12283 () Bool)

(assert (=> (and start!113218 (= defaultEntry!1306 defaultEntry!1306) t!45738) tb!12283))

(declare-fun result!25657 () Bool)

(assert (=> tb!12283 (= result!25657 tp_is_empty!37269)))

(assert (=> b!1343009 t!45738))

(declare-fun b_and!50447 () Bool)

(assert (= b_and!50445 (and (=> t!45738 result!25657) b_and!50447)))

(declare-fun m!1230651 () Bool)

(assert (=> mapNonEmpty!57610 m!1230651))

(declare-fun m!1230653 () Bool)

(assert (=> b!1343016 m!1230653))

(assert (=> b!1343016 m!1230653))

(declare-fun m!1230655 () Bool)

(assert (=> b!1343016 m!1230655))

(declare-fun m!1230657 () Bool)

(assert (=> b!1343009 m!1230657))

(declare-fun m!1230659 () Bool)

(assert (=> b!1343009 m!1230659))

(declare-fun m!1230661 () Bool)

(assert (=> b!1343009 m!1230661))

(declare-fun m!1230663 () Bool)

(assert (=> b!1343009 m!1230663))

(declare-fun m!1230665 () Bool)

(assert (=> b!1343009 m!1230665))

(declare-fun m!1230667 () Bool)

(assert (=> b!1343009 m!1230667))

(assert (=> b!1343009 m!1230661))

(assert (=> b!1343009 m!1230663))

(declare-fun m!1230669 () Bool)

(assert (=> b!1343009 m!1230669))

(declare-fun m!1230671 () Bool)

(assert (=> b!1343009 m!1230671))

(assert (=> b!1343009 m!1230653))

(declare-fun m!1230673 () Bool)

(assert (=> b!1343009 m!1230673))

(declare-fun m!1230675 () Bool)

(assert (=> b!1343009 m!1230675))

(declare-fun m!1230677 () Bool)

(assert (=> b!1343009 m!1230677))

(assert (=> b!1343009 m!1230653))

(declare-fun m!1230679 () Bool)

(assert (=> b!1343009 m!1230679))

(assert (=> b!1343009 m!1230673))

(declare-fun m!1230681 () Bool)

(assert (=> b!1343011 m!1230681))

(declare-fun m!1230683 () Bool)

(assert (=> start!113218 m!1230683))

(declare-fun m!1230685 () Bool)

(assert (=> start!113218 m!1230685))

(declare-fun m!1230687 () Bool)

(assert (=> start!113218 m!1230687))

(declare-fun m!1230689 () Bool)

(assert (=> b!1343010 m!1230689))

(assert (=> b!1343012 m!1230653))

(declare-fun m!1230691 () Bool)

(assert (=> b!1343006 m!1230691))

(assert (=> b!1343006 m!1230691))

(declare-fun m!1230693 () Bool)

(assert (=> b!1343006 m!1230693))

(check-sat (not b_lambda!24445) (not start!113218) b_and!50447 (not b!1343016) (not b!1343011) (not b!1343006) (not b!1343010) (not b_next!31269) (not b!1343009) (not mapNonEmpty!57610) tp_is_empty!37269)
(check-sat b_and!50447 (not b_next!31269))
