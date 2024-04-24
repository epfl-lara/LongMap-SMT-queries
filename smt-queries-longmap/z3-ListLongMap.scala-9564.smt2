; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113470 () Bool)

(assert start!113470)

(declare-fun b_free!31297 () Bool)

(declare-fun b_next!31297 () Bool)

(assert (=> start!113470 (= b_free!31297 (not b_next!31297))))

(declare-fun tp!109695 () Bool)

(declare-fun b_and!50503 () Bool)

(assert (=> start!113470 (= tp!109695 b_and!50503)))

(declare-fun b!1344836 () Bool)

(declare-fun res!891924 () Bool)

(declare-fun e!765550 () Bool)

(assert (=> b!1344836 (=> (not res!891924) (not e!765550))))

(declare-datatypes ((V!54833 0))(
  ( (V!54834 (val!18723 Int)) )
))
(declare-fun minValue!1245 () V!54833)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91551 0))(
  ( (array!91552 (arr!44227 (Array (_ BitVec 32) (_ BitVec 64))) (size!44778 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91551)

(declare-fun zeroValue!1245 () V!54833)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17750 0))(
  ( (ValueCellFull!17750 (v!21366 V!54833)) (EmptyCell!17750) )
))
(declare-datatypes ((array!91553 0))(
  ( (array!91554 (arr!44228 (Array (_ BitVec 32) ValueCell!17750)) (size!44779 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91553)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24170 0))(
  ( (tuple2!24171 (_1!12096 (_ BitVec 64)) (_2!12096 V!54833)) )
))
(declare-datatypes ((List!31315 0))(
  ( (Nil!31312) (Cons!31311 (h!32529 tuple2!24170) (t!45815 List!31315)) )
))
(declare-datatypes ((ListLongMap!21835 0))(
  ( (ListLongMap!21836 (toList!10933 List!31315)) )
))
(declare-fun contains!9121 (ListLongMap!21835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5877 (array!91551 array!91553 (_ BitVec 32) (_ BitVec 32) V!54833 V!54833 (_ BitVec 32) Int) ListLongMap!21835)

(assert (=> b!1344836 (= res!891924 (contains!9121 (getCurrentListMap!5877 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1344837 () Bool)

(declare-fun res!891928 () Bool)

(assert (=> b!1344837 (=> (not res!891928) (not e!765550))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1344837 (= res!891928 (validKeyInArray!0 (select (arr!44227 _keys!1571) from!1960)))))

(declare-fun b!1344838 () Bool)

(declare-fun res!891926 () Bool)

(assert (=> b!1344838 (=> (not res!891926) (not e!765550))))

(assert (=> b!1344838 (= res!891926 (not (= (select (arr!44227 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57652 () Bool)

(declare-fun mapRes!57652 () Bool)

(assert (=> mapIsEmpty!57652 mapRes!57652))

(declare-fun b!1344839 () Bool)

(assert (=> b!1344839 (= e!765550 (not true))))

(declare-fun lt!595449 () ListLongMap!21835)

(declare-fun +!4847 (ListLongMap!21835 tuple2!24170) ListLongMap!21835)

(assert (=> b!1344839 (contains!9121 (+!4847 lt!595449 (tuple2!24171 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245)) k0!1142)))

(declare-datatypes ((Unit!44034 0))(
  ( (Unit!44035) )
))
(declare-fun lt!595448 () Unit!44034)

(declare-fun addStillContains!1209 (ListLongMap!21835 (_ BitVec 64) V!54833 (_ BitVec 64)) Unit!44034)

(assert (=> b!1344839 (= lt!595448 (addStillContains!1209 lt!595449 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 k0!1142))))

(assert (=> b!1344839 (contains!9121 lt!595449 k0!1142)))

(declare-fun lt!595447 () V!54833)

(declare-fun lt!595451 () Unit!44034)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!373 ((_ BitVec 64) (_ BitVec 64) V!54833 ListLongMap!21835) Unit!44034)

(assert (=> b!1344839 (= lt!595451 (lemmaInListMapAfterAddingDiffThenInBefore!373 k0!1142 (select (arr!44227 _keys!1571) from!1960) lt!595447 lt!595449))))

(declare-fun lt!595446 () ListLongMap!21835)

(assert (=> b!1344839 (contains!9121 lt!595446 k0!1142)))

(declare-fun lt!595450 () Unit!44034)

(assert (=> b!1344839 (= lt!595450 (lemmaInListMapAfterAddingDiffThenInBefore!373 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!595446))))

(assert (=> b!1344839 (= lt!595446 (+!4847 lt!595449 (tuple2!24171 (select (arr!44227 _keys!1571) from!1960) lt!595447)))))

(declare-fun get!22355 (ValueCell!17750 V!54833) V!54833)

(declare-fun dynLambda!3801 (Int (_ BitVec 64)) V!54833)

(assert (=> b!1344839 (= lt!595447 (get!22355 (select (arr!44228 _values!1303) from!1960) (dynLambda!3801 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!6496 (array!91551 array!91553 (_ BitVec 32) (_ BitVec 32) V!54833 V!54833 (_ BitVec 32) Int) ListLongMap!21835)

(assert (=> b!1344839 (= lt!595449 (getCurrentListMapNoExtraKeys!6496 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1344840 () Bool)

(declare-fun e!765551 () Bool)

(declare-fun tp_is_empty!37297 () Bool)

(assert (=> b!1344840 (= e!765551 tp_is_empty!37297)))

(declare-fun b!1344841 () Bool)

(declare-fun res!891929 () Bool)

(assert (=> b!1344841 (=> (not res!891929) (not e!765550))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91551 (_ BitVec 32)) Bool)

(assert (=> b!1344841 (= res!891929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57652 () Bool)

(declare-fun tp!109696 () Bool)

(assert (=> mapNonEmpty!57652 (= mapRes!57652 (and tp!109696 e!765551))))

(declare-fun mapKey!57652 () (_ BitVec 32))

(declare-fun mapValue!57652 () ValueCell!17750)

(declare-fun mapRest!57652 () (Array (_ BitVec 32) ValueCell!17750))

(assert (=> mapNonEmpty!57652 (= (arr!44228 _values!1303) (store mapRest!57652 mapKey!57652 mapValue!57652))))

(declare-fun b!1344842 () Bool)

(declare-fun res!891931 () Bool)

(assert (=> b!1344842 (=> (not res!891931) (not e!765550))))

(assert (=> b!1344842 (= res!891931 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1344843 () Bool)

(declare-fun res!891932 () Bool)

(assert (=> b!1344843 (=> (not res!891932) (not e!765550))))

(assert (=> b!1344843 (= res!891932 (and (= (size!44779 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44778 _keys!1571) (size!44779 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!891930 () Bool)

(assert (=> start!113470 (=> (not res!891930) (not e!765550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113470 (= res!891930 (validMask!0 mask!1977))))

(assert (=> start!113470 e!765550))

(assert (=> start!113470 tp_is_empty!37297))

(assert (=> start!113470 true))

(declare-fun array_inv!33607 (array!91551) Bool)

(assert (=> start!113470 (array_inv!33607 _keys!1571)))

(declare-fun e!765549 () Bool)

(declare-fun array_inv!33608 (array!91553) Bool)

(assert (=> start!113470 (and (array_inv!33608 _values!1303) e!765549)))

(assert (=> start!113470 tp!109695))

(declare-fun b!1344844 () Bool)

(declare-fun e!765548 () Bool)

(assert (=> b!1344844 (= e!765548 tp_is_empty!37297)))

(declare-fun b!1344845 () Bool)

(declare-fun res!891925 () Bool)

(assert (=> b!1344845 (=> (not res!891925) (not e!765550))))

(declare-datatypes ((List!31316 0))(
  ( (Nil!31313) (Cons!31312 (h!32530 (_ BitVec 64)) (t!45816 List!31316)) )
))
(declare-fun arrayNoDuplicates!0 (array!91551 (_ BitVec 32) List!31316) Bool)

(assert (=> b!1344845 (= res!891925 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31313))))

(declare-fun b!1344846 () Bool)

(declare-fun res!891927 () Bool)

(assert (=> b!1344846 (=> (not res!891927) (not e!765550))))

(assert (=> b!1344846 (= res!891927 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44778 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1344847 () Bool)

(assert (=> b!1344847 (= e!765549 (and e!765548 mapRes!57652))))

(declare-fun condMapEmpty!57652 () Bool)

(declare-fun mapDefault!57652 () ValueCell!17750)

(assert (=> b!1344847 (= condMapEmpty!57652 (= (arr!44228 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17750)) mapDefault!57652)))))

(assert (= (and start!113470 res!891930) b!1344843))

(assert (= (and b!1344843 res!891932) b!1344841))

(assert (= (and b!1344841 res!891929) b!1344845))

(assert (= (and b!1344845 res!891925) b!1344846))

(assert (= (and b!1344846 res!891927) b!1344836))

(assert (= (and b!1344836 res!891924) b!1344838))

(assert (= (and b!1344838 res!891926) b!1344837))

(assert (= (and b!1344837 res!891928) b!1344842))

(assert (= (and b!1344842 res!891931) b!1344839))

(assert (= (and b!1344847 condMapEmpty!57652) mapIsEmpty!57652))

(assert (= (and b!1344847 (not condMapEmpty!57652)) mapNonEmpty!57652))

(get-info :version)

(assert (= (and mapNonEmpty!57652 ((_ is ValueCellFull!17750) mapValue!57652)) b!1344840))

(assert (= (and b!1344847 ((_ is ValueCellFull!17750) mapDefault!57652)) b!1344844))

(assert (= start!113470 b!1344847))

(declare-fun b_lambda!24467 () Bool)

(assert (=> (not b_lambda!24467) (not b!1344839)))

(declare-fun t!45814 () Bool)

(declare-fun tb!12303 () Bool)

(assert (=> (and start!113470 (= defaultEntry!1306 defaultEntry!1306) t!45814) tb!12303))

(declare-fun result!25705 () Bool)

(assert (=> tb!12303 (= result!25705 tp_is_empty!37297)))

(assert (=> b!1344839 t!45814))

(declare-fun b_and!50505 () Bool)

(assert (= b_and!50503 (and (=> t!45814 result!25705) b_and!50505)))

(declare-fun m!1232865 () Bool)

(assert (=> b!1344836 m!1232865))

(assert (=> b!1344836 m!1232865))

(declare-fun m!1232867 () Bool)

(assert (=> b!1344836 m!1232867))

(declare-fun m!1232869 () Bool)

(assert (=> mapNonEmpty!57652 m!1232869))

(declare-fun m!1232871 () Bool)

(assert (=> b!1344845 m!1232871))

(declare-fun m!1232873 () Bool)

(assert (=> b!1344838 m!1232873))

(declare-fun m!1232875 () Bool)

(assert (=> b!1344839 m!1232875))

(declare-fun m!1232877 () Bool)

(assert (=> b!1344839 m!1232877))

(declare-fun m!1232879 () Bool)

(assert (=> b!1344839 m!1232879))

(declare-fun m!1232881 () Bool)

(assert (=> b!1344839 m!1232881))

(declare-fun m!1232883 () Bool)

(assert (=> b!1344839 m!1232883))

(declare-fun m!1232885 () Bool)

(assert (=> b!1344839 m!1232885))

(declare-fun m!1232887 () Bool)

(assert (=> b!1344839 m!1232887))

(declare-fun m!1232889 () Bool)

(assert (=> b!1344839 m!1232889))

(declare-fun m!1232891 () Bool)

(assert (=> b!1344839 m!1232891))

(declare-fun m!1232893 () Bool)

(assert (=> b!1344839 m!1232893))

(assert (=> b!1344839 m!1232873))

(declare-fun m!1232895 () Bool)

(assert (=> b!1344839 m!1232895))

(assert (=> b!1344839 m!1232879))

(assert (=> b!1344839 m!1232883))

(declare-fun m!1232897 () Bool)

(assert (=> b!1344839 m!1232897))

(assert (=> b!1344839 m!1232873))

(assert (=> b!1344839 m!1232887))

(assert (=> b!1344837 m!1232873))

(assert (=> b!1344837 m!1232873))

(declare-fun m!1232899 () Bool)

(assert (=> b!1344837 m!1232899))

(declare-fun m!1232901 () Bool)

(assert (=> b!1344841 m!1232901))

(declare-fun m!1232903 () Bool)

(assert (=> start!113470 m!1232903))

(declare-fun m!1232905 () Bool)

(assert (=> start!113470 m!1232905))

(declare-fun m!1232907 () Bool)

(assert (=> start!113470 m!1232907))

(check-sat tp_is_empty!37297 (not b_lambda!24467) (not b!1344839) (not b!1344836) (not b!1344845) b_and!50505 (not start!113470) (not b_next!31297) (not mapNonEmpty!57652) (not b!1344841) (not b!1344837))
(check-sat b_and!50505 (not b_next!31297))
