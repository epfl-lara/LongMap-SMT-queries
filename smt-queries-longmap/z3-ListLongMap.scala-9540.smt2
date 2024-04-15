; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113102 () Bool)

(assert start!113102)

(declare-fun b_free!31153 () Bool)

(declare-fun b_next!31153 () Bool)

(assert (=> start!113102 (= b_free!31153 (not b_next!31153))))

(declare-fun tp!109264 () Bool)

(declare-fun b_and!50195 () Bool)

(assert (=> start!113102 (= tp!109264 b_and!50195)))

(declare-fun b!1340731 () Bool)

(declare-fun res!889437 () Bool)

(declare-fun e!763591 () Bool)

(assert (=> b!1340731 (=> (not res!889437) (not e!763591))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91101 0))(
  ( (array!91102 (arr!44007 (Array (_ BitVec 32) (_ BitVec 64))) (size!44559 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91101)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1340731 (= res!889437 (not (= (select (arr!44007 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1340732 () Bool)

(declare-fun res!889440 () Bool)

(assert (=> b!1340732 (=> (not res!889440) (not e!763591))))

(declare-datatypes ((List!31217 0))(
  ( (Nil!31214) (Cons!31213 (h!32422 (_ BitVec 64)) (t!45573 List!31217)) )
))
(declare-fun arrayNoDuplicates!0 (array!91101 (_ BitVec 32) List!31217) Bool)

(assert (=> b!1340732 (= res!889440 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31214))))

(declare-fun mapIsEmpty!57436 () Bool)

(declare-fun mapRes!57436 () Bool)

(assert (=> mapIsEmpty!57436 mapRes!57436))

(declare-fun b!1340733 () Bool)

(assert (=> b!1340733 (= e!763591 (not true))))

(declare-datatypes ((V!54641 0))(
  ( (V!54642 (val!18651 Int)) )
))
(declare-datatypes ((tuple2!24066 0))(
  ( (tuple2!24067 (_1!12044 (_ BitVec 64)) (_2!12044 V!54641)) )
))
(declare-datatypes ((List!31218 0))(
  ( (Nil!31215) (Cons!31214 (h!32423 tuple2!24066) (t!45574 List!31218)) )
))
(declare-datatypes ((ListLongMap!21723 0))(
  ( (ListLongMap!21724 (toList!10877 List!31218)) )
))
(declare-fun lt!593859 () ListLongMap!21723)

(declare-fun contains!8982 (ListLongMap!21723 (_ BitVec 64)) Bool)

(assert (=> b!1340733 (contains!8982 lt!593859 k0!1142)))

(declare-fun zeroValue!1245 () V!54641)

(declare-datatypes ((Unit!43812 0))(
  ( (Unit!43813) )
))
(declare-fun lt!593858 () Unit!43812)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!324 ((_ BitVec 64) (_ BitVec 64) V!54641 ListLongMap!21723) Unit!43812)

(assert (=> b!1340733 (= lt!593858 (lemmaInListMapAfterAddingDiffThenInBefore!324 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593859))))

(declare-fun minValue!1245 () V!54641)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17678 0))(
  ( (ValueCellFull!17678 (v!21298 V!54641)) (EmptyCell!17678) )
))
(declare-datatypes ((array!91103 0))(
  ( (array!91104 (arr!44008 (Array (_ BitVec 32) ValueCell!17678)) (size!44560 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91103)

(declare-fun defaultEntry!1306 () Int)

(declare-fun +!4785 (ListLongMap!21723 tuple2!24066) ListLongMap!21723)

(declare-fun getCurrentListMapNoExtraKeys!6428 (array!91101 array!91103 (_ BitVec 32) (_ BitVec 32) V!54641 V!54641 (_ BitVec 32) Int) ListLongMap!21723)

(declare-fun get!22209 (ValueCell!17678 V!54641) V!54641)

(declare-fun dynLambda!3715 (Int (_ BitVec 64)) V!54641)

(assert (=> b!1340733 (= lt!593859 (+!4785 (getCurrentListMapNoExtraKeys!6428 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24067 (select (arr!44007 _keys!1571) from!1960) (get!22209 (select (arr!44008 _values!1303) from!1960) (dynLambda!3715 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1340734 () Bool)

(declare-fun res!889439 () Bool)

(assert (=> b!1340734 (=> (not res!889439) (not e!763591))))

(assert (=> b!1340734 (= res!889439 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44559 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1340735 () Bool)

(declare-fun e!763594 () Bool)

(declare-fun e!763595 () Bool)

(assert (=> b!1340735 (= e!763594 (and e!763595 mapRes!57436))))

(declare-fun condMapEmpty!57436 () Bool)

(declare-fun mapDefault!57436 () ValueCell!17678)

(assert (=> b!1340735 (= condMapEmpty!57436 (= (arr!44008 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17678)) mapDefault!57436)))))

(declare-fun b!1340736 () Bool)

(declare-fun tp_is_empty!37153 () Bool)

(assert (=> b!1340736 (= e!763595 tp_is_empty!37153)))

(declare-fun b!1340737 () Bool)

(declare-fun res!889433 () Bool)

(assert (=> b!1340737 (=> (not res!889433) (not e!763591))))

(assert (=> b!1340737 (= res!889433 (and (= (size!44560 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44559 _keys!1571) (size!44560 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!889438 () Bool)

(assert (=> start!113102 (=> (not res!889438) (not e!763591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113102 (= res!889438 (validMask!0 mask!1977))))

(assert (=> start!113102 e!763591))

(assert (=> start!113102 tp_is_empty!37153))

(assert (=> start!113102 true))

(declare-fun array_inv!33371 (array!91101) Bool)

(assert (=> start!113102 (array_inv!33371 _keys!1571)))

(declare-fun array_inv!33372 (array!91103) Bool)

(assert (=> start!113102 (and (array_inv!33372 _values!1303) e!763594)))

(assert (=> start!113102 tp!109264))

(declare-fun b!1340738 () Bool)

(declare-fun res!889434 () Bool)

(assert (=> b!1340738 (=> (not res!889434) (not e!763591))))

(assert (=> b!1340738 (= res!889434 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1340739 () Bool)

(declare-fun res!889436 () Bool)

(assert (=> b!1340739 (=> (not res!889436) (not e!763591))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91101 (_ BitVec 32)) Bool)

(assert (=> b!1340739 (= res!889436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57436 () Bool)

(declare-fun tp!109265 () Bool)

(declare-fun e!763592 () Bool)

(assert (=> mapNonEmpty!57436 (= mapRes!57436 (and tp!109265 e!763592))))

(declare-fun mapValue!57436 () ValueCell!17678)

(declare-fun mapRest!57436 () (Array (_ BitVec 32) ValueCell!17678))

(declare-fun mapKey!57436 () (_ BitVec 32))

(assert (=> mapNonEmpty!57436 (= (arr!44008 _values!1303) (store mapRest!57436 mapKey!57436 mapValue!57436))))

(declare-fun b!1340740 () Bool)

(declare-fun res!889435 () Bool)

(assert (=> b!1340740 (=> (not res!889435) (not e!763591))))

(declare-fun getCurrentListMap!5730 (array!91101 array!91103 (_ BitVec 32) (_ BitVec 32) V!54641 V!54641 (_ BitVec 32) Int) ListLongMap!21723)

(assert (=> b!1340740 (= res!889435 (contains!8982 (getCurrentListMap!5730 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1340741 () Bool)

(assert (=> b!1340741 (= e!763592 tp_is_empty!37153)))

(declare-fun b!1340742 () Bool)

(declare-fun res!889441 () Bool)

(assert (=> b!1340742 (=> (not res!889441) (not e!763591))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1340742 (= res!889441 (validKeyInArray!0 (select (arr!44007 _keys!1571) from!1960)))))

(assert (= (and start!113102 res!889438) b!1340737))

(assert (= (and b!1340737 res!889433) b!1340739))

(assert (= (and b!1340739 res!889436) b!1340732))

(assert (= (and b!1340732 res!889440) b!1340734))

(assert (= (and b!1340734 res!889439) b!1340740))

(assert (= (and b!1340740 res!889435) b!1340731))

(assert (= (and b!1340731 res!889437) b!1340742))

(assert (= (and b!1340742 res!889441) b!1340738))

(assert (= (and b!1340738 res!889434) b!1340733))

(assert (= (and b!1340735 condMapEmpty!57436) mapIsEmpty!57436))

(assert (= (and b!1340735 (not condMapEmpty!57436)) mapNonEmpty!57436))

(get-info :version)

(assert (= (and mapNonEmpty!57436 ((_ is ValueCellFull!17678) mapValue!57436)) b!1340741))

(assert (= (and b!1340735 ((_ is ValueCellFull!17678) mapDefault!57436)) b!1340736))

(assert (= start!113102 b!1340735))

(declare-fun b_lambda!24319 () Bool)

(assert (=> (not b_lambda!24319) (not b!1340733)))

(declare-fun t!45572 () Bool)

(declare-fun tb!12159 () Bool)

(assert (=> (and start!113102 (= defaultEntry!1306 defaultEntry!1306) t!45572) tb!12159))

(declare-fun result!25417 () Bool)

(assert (=> tb!12159 (= result!25417 tp_is_empty!37153)))

(assert (=> b!1340733 t!45572))

(declare-fun b_and!50197 () Bool)

(assert (= b_and!50195 (and (=> t!45572 result!25417) b_and!50197)))

(declare-fun m!1228003 () Bool)

(assert (=> b!1340733 m!1228003))

(declare-fun m!1228005 () Bool)

(assert (=> b!1340733 m!1228005))

(declare-fun m!1228007 () Bool)

(assert (=> b!1340733 m!1228007))

(declare-fun m!1228009 () Bool)

(assert (=> b!1340733 m!1228009))

(assert (=> b!1340733 m!1228003))

(declare-fun m!1228011 () Bool)

(assert (=> b!1340733 m!1228011))

(assert (=> b!1340733 m!1228005))

(assert (=> b!1340733 m!1228007))

(declare-fun m!1228013 () Bool)

(assert (=> b!1340733 m!1228013))

(declare-fun m!1228015 () Bool)

(assert (=> b!1340733 m!1228015))

(declare-fun m!1228017 () Bool)

(assert (=> b!1340733 m!1228017))

(declare-fun m!1228019 () Bool)

(assert (=> b!1340739 m!1228019))

(declare-fun m!1228021 () Bool)

(assert (=> start!113102 m!1228021))

(declare-fun m!1228023 () Bool)

(assert (=> start!113102 m!1228023))

(declare-fun m!1228025 () Bool)

(assert (=> start!113102 m!1228025))

(declare-fun m!1228027 () Bool)

(assert (=> b!1340740 m!1228027))

(assert (=> b!1340740 m!1228027))

(declare-fun m!1228029 () Bool)

(assert (=> b!1340740 m!1228029))

(declare-fun m!1228031 () Bool)

(assert (=> b!1340732 m!1228031))

(assert (=> b!1340742 m!1228017))

(assert (=> b!1340742 m!1228017))

(declare-fun m!1228033 () Bool)

(assert (=> b!1340742 m!1228033))

(assert (=> b!1340731 m!1228017))

(declare-fun m!1228035 () Bool)

(assert (=> mapNonEmpty!57436 m!1228035))

(check-sat b_and!50197 (not b!1340739) (not b!1340733) (not b!1340740) (not start!113102) (not b_lambda!24319) (not b!1340732) tp_is_empty!37153 (not b!1340742) (not b_next!31153) (not mapNonEmpty!57436))
(check-sat b_and!50197 (not b_next!31153))
