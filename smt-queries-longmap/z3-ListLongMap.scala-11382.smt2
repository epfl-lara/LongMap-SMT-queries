; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132284 () Bool)

(assert start!132284)

(declare-fun b_free!31911 () Bool)

(declare-fun b_next!31911 () Bool)

(assert (=> start!132284 (= b_free!31911 (not b_next!31911))))

(declare-fun tp!111997 () Bool)

(declare-fun b_and!51349 () Bool)

(assert (=> start!132284 (= tp!111997 b_and!51349)))

(declare-fun b!1551866 () Bool)

(declare-fun res!1062620 () Bool)

(declare-fun e!863905 () Bool)

(assert (=> b!1551866 (=> (not res!1062620) (not e!863905))))

(declare-datatypes ((array!103578 0))(
  ( (array!103579 (arr!49987 (Array (_ BitVec 32) (_ BitVec 64))) (size!50537 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!103578)

(declare-datatypes ((List!36195 0))(
  ( (Nil!36192) (Cons!36191 (h!37636 (_ BitVec 64)) (t!50909 List!36195)) )
))
(declare-fun arrayNoDuplicates!0 (array!103578 (_ BitVec 32) List!36195) Bool)

(assert (=> b!1551866 (= res!1062620 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!36192))))

(declare-fun b!1551867 () Bool)

(declare-datatypes ((Unit!51679 0))(
  ( (Unit!51680) )
))
(declare-fun e!863907 () Unit!51679)

(declare-fun lt!668942 () Unit!51679)

(assert (=> b!1551867 (= e!863907 lt!668942)))

(declare-datatypes ((V!59359 0))(
  ( (V!59360 (val!19171 Int)) )
))
(declare-fun zeroValue!436 () V!59359)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun defaultEntry!478 () Int)

(declare-fun from!762 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((ValueCell!18183 0))(
  ( (ValueCellFull!18183 (v!21976 V!59359)) (EmptyCell!18183) )
))
(declare-datatypes ((array!103580 0))(
  ( (array!103581 (arr!49988 (Array (_ BitVec 32) ValueCell!18183)) (size!50538 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103580)

(declare-fun minValue!436 () V!59359)

(declare-datatypes ((tuple2!24718 0))(
  ( (tuple2!24719 (_1!12370 (_ BitVec 64)) (_2!12370 V!59359)) )
))
(declare-datatypes ((List!36196 0))(
  ( (Nil!36193) (Cons!36192 (h!37637 tuple2!24718) (t!50910 List!36196)) )
))
(declare-datatypes ((ListLongMap!22327 0))(
  ( (ListLongMap!22328 (toList!11179 List!36196)) )
))
(declare-fun lt!668938 () ListLongMap!22327)

(declare-fun getCurrentListMapNoExtraKeys!6626 (array!103578 array!103580 (_ BitVec 32) (_ BitVec 32) V!59359 V!59359 (_ BitVec 32) Int) ListLongMap!22327)

(assert (=> b!1551867 (= lt!668938 (getCurrentListMapNoExtraKeys!6626 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun lt!668946 () Unit!51679)

(declare-fun addStillContains!1297 (ListLongMap!22327 (_ BitVec 64) V!59359 (_ BitVec 64)) Unit!51679)

(assert (=> b!1551867 (= lt!668946 (addStillContains!1297 lt!668938 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49987 _keys!618) from!762)))))

(declare-fun lt!668939 () ListLongMap!22327)

(declare-fun +!5000 (ListLongMap!22327 tuple2!24718) ListLongMap!22327)

(assert (=> b!1551867 (= lt!668939 (+!5000 lt!668938 (tuple2!24719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436)))))

(declare-fun contains!10121 (ListLongMap!22327 (_ BitVec 64)) Bool)

(assert (=> b!1551867 (contains!10121 lt!668939 (select (arr!49987 _keys!618) from!762))))

(declare-fun addApplyDifferent!639 (ListLongMap!22327 (_ BitVec 64) V!59359 (_ BitVec 64)) Unit!51679)

(assert (=> b!1551867 (= lt!668942 (addApplyDifferent!639 lt!668938 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436 (select (arr!49987 _keys!618) from!762)))))

(declare-fun lt!668943 () V!59359)

(declare-fun apply!1101 (ListLongMap!22327 (_ BitVec 64)) V!59359)

(assert (=> b!1551867 (= lt!668943 (apply!1101 (+!5000 lt!668938 (tuple2!24719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)) (select (arr!49987 _keys!618) from!762)))))

(declare-fun lt!668941 () V!59359)

(assert (=> b!1551867 (= lt!668941 (apply!1101 lt!668938 (select (arr!49987 _keys!618) from!762)))))

(assert (=> b!1551867 (= lt!668943 lt!668941)))

(declare-fun lt!668940 () Unit!51679)

(assert (=> b!1551867 (= lt!668940 (addApplyDifferent!639 lt!668938 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436 (select (arr!49987 _keys!618) from!762)))))

(assert (=> b!1551867 (= (apply!1101 lt!668939 (select (arr!49987 _keys!618) from!762)) lt!668941)))

(declare-fun bm!71102 () Bool)

(declare-fun call!71109 () ListLongMap!22327)

(assert (=> bm!71102 (= call!71109 (getCurrentListMapNoExtraKeys!6626 _keys!618 _values!470 mask!926 extraKeys!417 zeroValue!436 minValue!436 from!762 defaultEntry!478))))

(declare-fun bm!71103 () Bool)

(declare-fun call!71105 () ListLongMap!22327)

(declare-fun call!71107 () ListLongMap!22327)

(assert (=> bm!71103 (= call!71105 call!71107)))

(declare-fun b!1551868 () Bool)

(declare-fun Unit!51681 () Unit!51679)

(assert (=> b!1551868 (= e!863907 Unit!51681)))

(declare-fun b!1551869 () Bool)

(declare-fun e!863903 () Bool)

(declare-fun e!863904 () Bool)

(declare-fun mapRes!58996 () Bool)

(assert (=> b!1551869 (= e!863903 (and e!863904 mapRes!58996))))

(declare-fun condMapEmpty!58996 () Bool)

(declare-fun mapDefault!58996 () ValueCell!18183)

(assert (=> b!1551869 (= condMapEmpty!58996 (= (arr!49988 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18183)) mapDefault!58996)))))

(declare-fun b!1551870 () Bool)

(declare-fun e!863911 () ListLongMap!22327)

(declare-fun call!71106 () ListLongMap!22327)

(assert (=> b!1551870 (= e!863911 (+!5000 call!71106 (tuple2!24719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1551871 () Bool)

(assert (=> b!1551871 (= e!863905 false)))

(declare-fun lt!668944 () Unit!51679)

(assert (=> b!1551871 (= lt!668944 e!863907)))

(declare-fun c!142857 () Bool)

(declare-fun e!863906 () Bool)

(assert (=> b!1551871 (= c!142857 e!863906)))

(declare-fun res!1062622 () Bool)

(assert (=> b!1551871 (=> (not res!1062622) (not e!863906))))

(assert (=> b!1551871 (= res!1062622 (bvslt from!762 (size!50537 _keys!618)))))

(declare-fun lt!668937 () ListLongMap!22327)

(assert (=> b!1551871 (= lt!668937 e!863911)))

(declare-fun c!142856 () Bool)

(declare-fun lt!668945 () Bool)

(assert (=> b!1551871 (= c!142856 (and (not lt!668945) (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> b!1551871 (= lt!668945 (= (bvand extraKeys!417 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1551872 () Bool)

(declare-fun tp_is_empty!38187 () Bool)

(assert (=> b!1551872 (= e!863904 tp_is_empty!38187)))

(declare-fun mapIsEmpty!58996 () Bool)

(assert (=> mapIsEmpty!58996 mapRes!58996))

(declare-fun b!1551873 () Bool)

(declare-fun res!1062623 () Bool)

(assert (=> b!1551873 (=> (not res!1062623) (not e!863905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103578 (_ BitVec 32)) Bool)

(assert (=> b!1551873 (= res!1062623 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1551874 () Bool)

(declare-fun e!863909 () ListLongMap!22327)

(declare-fun call!71108 () ListLongMap!22327)

(assert (=> b!1551874 (= e!863909 call!71108)))

(declare-fun b!1551875 () Bool)

(assert (=> b!1551875 (= e!863909 call!71105)))

(declare-fun b!1551876 () Bool)

(declare-fun res!1062625 () Bool)

(assert (=> b!1551876 (=> (not res!1062625) (not e!863905))))

(assert (=> b!1551876 (= res!1062625 (and (bvsge from!762 #b00000000000000000000000000000000) (bvsle from!762 (size!50537 _keys!618))))))

(declare-fun res!1062621 () Bool)

(assert (=> start!132284 (=> (not res!1062621) (not e!863905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132284 (= res!1062621 (validMask!0 mask!926))))

(assert (=> start!132284 e!863905))

(declare-fun array_inv!38859 (array!103578) Bool)

(assert (=> start!132284 (array_inv!38859 _keys!618)))

(assert (=> start!132284 tp_is_empty!38187))

(assert (=> start!132284 true))

(assert (=> start!132284 tp!111997))

(declare-fun array_inv!38860 (array!103580) Bool)

(assert (=> start!132284 (and (array_inv!38860 _values!470) e!863903)))

(declare-fun bm!71104 () Bool)

(assert (=> bm!71104 (= call!71108 call!71106)))

(declare-fun c!142859 () Bool)

(declare-fun bm!71105 () Bool)

(assert (=> bm!71105 (= call!71106 (+!5000 (ite c!142856 call!71109 (ite c!142859 call!71107 call!71105)) (ite (or c!142856 c!142859) (tuple2!24719 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!436) (tuple2!24719 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436))))))

(declare-fun b!1551877 () Bool)

(declare-fun c!142858 () Bool)

(assert (=> b!1551877 (= c!142858 (and (not (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!668945))))

(declare-fun e!863910 () ListLongMap!22327)

(assert (=> b!1551877 (= e!863910 e!863909)))

(declare-fun mapNonEmpty!58996 () Bool)

(declare-fun tp!111996 () Bool)

(declare-fun e!863902 () Bool)

(assert (=> mapNonEmpty!58996 (= mapRes!58996 (and tp!111996 e!863902))))

(declare-fun mapKey!58996 () (_ BitVec 32))

(declare-fun mapRest!58996 () (Array (_ BitVec 32) ValueCell!18183))

(declare-fun mapValue!58996 () ValueCell!18183)

(assert (=> mapNonEmpty!58996 (= (arr!49988 _values!470) (store mapRest!58996 mapKey!58996 mapValue!58996))))

(declare-fun b!1551878 () Bool)

(assert (=> b!1551878 (= e!863910 call!71108)))

(declare-fun bm!71106 () Bool)

(assert (=> bm!71106 (= call!71107 call!71109)))

(declare-fun b!1551879 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1551879 (= e!863906 (validKeyInArray!0 (select (arr!49987 _keys!618) from!762)))))

(declare-fun b!1551880 () Bool)

(assert (=> b!1551880 (= e!863902 tp_is_empty!38187)))

(declare-fun b!1551881 () Bool)

(declare-fun res!1062624 () Bool)

(assert (=> b!1551881 (=> (not res!1062624) (not e!863905))))

(assert (=> b!1551881 (= res!1062624 (and (= (size!50538 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50537 _keys!618) (size!50538 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1551882 () Bool)

(assert (=> b!1551882 (= e!863911 e!863910)))

(assert (=> b!1551882 (= c!142859 (and (not lt!668945) (= (bvand extraKeys!417 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (= (and start!132284 res!1062621) b!1551881))

(assert (= (and b!1551881 res!1062624) b!1551873))

(assert (= (and b!1551873 res!1062623) b!1551866))

(assert (= (and b!1551866 res!1062620) b!1551876))

(assert (= (and b!1551876 res!1062625) b!1551871))

(assert (= (and b!1551871 c!142856) b!1551870))

(assert (= (and b!1551871 (not c!142856)) b!1551882))

(assert (= (and b!1551882 c!142859) b!1551878))

(assert (= (and b!1551882 (not c!142859)) b!1551877))

(assert (= (and b!1551877 c!142858) b!1551874))

(assert (= (and b!1551877 (not c!142858)) b!1551875))

(assert (= (or b!1551874 b!1551875) bm!71103))

(assert (= (or b!1551878 bm!71103) bm!71106))

(assert (= (or b!1551878 b!1551874) bm!71104))

(assert (= (or b!1551870 bm!71106) bm!71102))

(assert (= (or b!1551870 bm!71104) bm!71105))

(assert (= (and b!1551871 res!1062622) b!1551879))

(assert (= (and b!1551871 c!142857) b!1551867))

(assert (= (and b!1551871 (not c!142857)) b!1551868))

(assert (= (and b!1551869 condMapEmpty!58996) mapIsEmpty!58996))

(assert (= (and b!1551869 (not condMapEmpty!58996)) mapNonEmpty!58996))

(get-info :version)

(assert (= (and mapNonEmpty!58996 ((_ is ValueCellFull!18183) mapValue!58996)) b!1551880))

(assert (= (and b!1551869 ((_ is ValueCellFull!18183) mapDefault!58996)) b!1551872))

(assert (= start!132284 b!1551869))

(declare-fun m!1430499 () Bool)

(assert (=> b!1551870 m!1430499))

(declare-fun m!1430501 () Bool)

(assert (=> b!1551866 m!1430501))

(declare-fun m!1430503 () Bool)

(assert (=> b!1551879 m!1430503))

(assert (=> b!1551879 m!1430503))

(declare-fun m!1430505 () Bool)

(assert (=> b!1551879 m!1430505))

(declare-fun m!1430507 () Bool)

(assert (=> start!132284 m!1430507))

(declare-fun m!1430509 () Bool)

(assert (=> start!132284 m!1430509))

(declare-fun m!1430511 () Bool)

(assert (=> start!132284 m!1430511))

(assert (=> b!1551867 m!1430503))

(declare-fun m!1430513 () Bool)

(assert (=> b!1551867 m!1430513))

(assert (=> b!1551867 m!1430503))

(declare-fun m!1430515 () Bool)

(assert (=> b!1551867 m!1430515))

(declare-fun m!1430517 () Bool)

(assert (=> b!1551867 m!1430517))

(assert (=> b!1551867 m!1430503))

(declare-fun m!1430519 () Bool)

(assert (=> b!1551867 m!1430519))

(assert (=> b!1551867 m!1430503))

(declare-fun m!1430521 () Bool)

(assert (=> b!1551867 m!1430521))

(assert (=> b!1551867 m!1430503))

(declare-fun m!1430523 () Bool)

(assert (=> b!1551867 m!1430523))

(declare-fun m!1430525 () Bool)

(assert (=> b!1551867 m!1430525))

(assert (=> b!1551867 m!1430519))

(assert (=> b!1551867 m!1430503))

(declare-fun m!1430527 () Bool)

(assert (=> b!1551867 m!1430527))

(assert (=> b!1551867 m!1430503))

(declare-fun m!1430529 () Bool)

(assert (=> b!1551867 m!1430529))

(assert (=> b!1551867 m!1430503))

(declare-fun m!1430531 () Bool)

(assert (=> b!1551867 m!1430531))

(declare-fun m!1430533 () Bool)

(assert (=> mapNonEmpty!58996 m!1430533))

(assert (=> bm!71102 m!1430517))

(declare-fun m!1430535 () Bool)

(assert (=> bm!71105 m!1430535))

(declare-fun m!1430537 () Bool)

(assert (=> b!1551873 m!1430537))

(check-sat (not b_next!31911) (not start!132284) tp_is_empty!38187 (not b!1551873) (not b!1551870) (not bm!71105) (not bm!71102) b_and!51349 (not mapNonEmpty!58996) (not b!1551866) (not b!1551867) (not b!1551879))
(check-sat b_and!51349 (not b_next!31911))
