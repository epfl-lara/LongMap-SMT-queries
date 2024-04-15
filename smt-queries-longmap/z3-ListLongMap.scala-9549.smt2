; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113156 () Bool)

(assert start!113156)

(declare-fun b_free!31207 () Bool)

(declare-fun b_next!31207 () Bool)

(assert (=> start!113156 (= b_free!31207 (not b_next!31207))))

(declare-fun tp!109426 () Bool)

(declare-fun b_and!50303 () Bool)

(assert (=> start!113156 (= tp!109426 b_and!50303)))

(declare-fun b!1341758 () Bool)

(declare-fun res!890168 () Bool)

(declare-fun e!763997 () Bool)

(assert (=> b!1341758 (=> (not res!890168) (not e!763997))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91207 0))(
  ( (array!91208 (arr!44060 (Array (_ BitVec 32) (_ BitVec 64))) (size!44612 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91207)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341758 (= res!890168 (not (= (select (arr!44060 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapIsEmpty!57517 () Bool)

(declare-fun mapRes!57517 () Bool)

(assert (=> mapIsEmpty!57517 mapRes!57517))

(declare-fun b!1341759 () Bool)

(declare-fun res!890166 () Bool)

(assert (=> b!1341759 (=> (not res!890166) (not e!763997))))

(declare-datatypes ((List!31257 0))(
  ( (Nil!31254) (Cons!31253 (h!32462 (_ BitVec 64)) (t!45667 List!31257)) )
))
(declare-fun arrayNoDuplicates!0 (array!91207 (_ BitVec 32) List!31257) Bool)

(assert (=> b!1341759 (= res!890166 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31254))))

(declare-fun b!1341760 () Bool)

(declare-fun res!890162 () Bool)

(assert (=> b!1341760 (=> (not res!890162) (not e!763997))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341760 (= res!890162 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341761 () Bool)

(declare-fun res!890170 () Bool)

(assert (=> b!1341761 (=> (not res!890170) (not e!763997))))

(assert (=> b!1341761 (= res!890170 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44612 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341762 () Bool)

(assert (=> b!1341762 (= e!763997 (not true))))

(declare-datatypes ((V!54713 0))(
  ( (V!54714 (val!18678 Int)) )
))
(declare-datatypes ((tuple2!24108 0))(
  ( (tuple2!24109 (_1!12065 (_ BitVec 64)) (_2!12065 V!54713)) )
))
(declare-datatypes ((List!31258 0))(
  ( (Nil!31255) (Cons!31254 (h!32463 tuple2!24108) (t!45668 List!31258)) )
))
(declare-datatypes ((ListLongMap!21765 0))(
  ( (ListLongMap!21766 (toList!10898 List!31258)) )
))
(declare-fun lt!594057 () ListLongMap!21765)

(declare-fun contains!9003 (ListLongMap!21765 (_ BitVec 64)) Bool)

(assert (=> b!1341762 (contains!9003 lt!594057 k0!1142)))

(declare-datatypes ((Unit!43846 0))(
  ( (Unit!43847) )
))
(declare-fun lt!594056 () Unit!43846)

(declare-fun lt!594053 () V!54713)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!341 ((_ BitVec 64) (_ BitVec 64) V!54713 ListLongMap!21765) Unit!43846)

(assert (=> b!1341762 (= lt!594056 (lemmaInListMapAfterAddingDiffThenInBefore!341 k0!1142 (select (arr!44060 _keys!1571) from!1960) lt!594053 lt!594057))))

(declare-fun lt!594054 () ListLongMap!21765)

(assert (=> b!1341762 (contains!9003 lt!594054 k0!1142)))

(declare-fun zeroValue!1245 () V!54713)

(declare-fun lt!594055 () Unit!43846)

(assert (=> b!1341762 (= lt!594055 (lemmaInListMapAfterAddingDiffThenInBefore!341 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594054))))

(declare-fun +!4802 (ListLongMap!21765 tuple2!24108) ListLongMap!21765)

(assert (=> b!1341762 (= lt!594054 (+!4802 lt!594057 (tuple2!24109 (select (arr!44060 _keys!1571) from!1960) lt!594053)))))

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((ValueCell!17705 0))(
  ( (ValueCellFull!17705 (v!21325 V!54713)) (EmptyCell!17705) )
))
(declare-datatypes ((array!91209 0))(
  ( (array!91210 (arr!44061 (Array (_ BitVec 32) ValueCell!17705)) (size!44613 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91209)

(declare-fun get!22244 (ValueCell!17705 V!54713) V!54713)

(declare-fun dynLambda!3732 (Int (_ BitVec 64)) V!54713)

(assert (=> b!1341762 (= lt!594053 (get!22244 (select (arr!44061 _values!1303) from!1960) (dynLambda!3732 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54713)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6445 (array!91207 array!91209 (_ BitVec 32) (_ BitVec 32) V!54713 V!54713 (_ BitVec 32) Int) ListLongMap!21765)

(assert (=> b!1341762 (= lt!594057 (getCurrentListMapNoExtraKeys!6445 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun mapNonEmpty!57517 () Bool)

(declare-fun tp!109427 () Bool)

(declare-fun e!763998 () Bool)

(assert (=> mapNonEmpty!57517 (= mapRes!57517 (and tp!109427 e!763998))))

(declare-fun mapKey!57517 () (_ BitVec 32))

(declare-fun mapValue!57517 () ValueCell!17705)

(declare-fun mapRest!57517 () (Array (_ BitVec 32) ValueCell!17705))

(assert (=> mapNonEmpty!57517 (= (arr!44061 _values!1303) (store mapRest!57517 mapKey!57517 mapValue!57517))))

(declare-fun b!1341763 () Bool)

(declare-fun tp_is_empty!37207 () Bool)

(assert (=> b!1341763 (= e!763998 tp_is_empty!37207)))

(declare-fun b!1341764 () Bool)

(declare-fun e!763999 () Bool)

(declare-fun e!764000 () Bool)

(assert (=> b!1341764 (= e!763999 (and e!764000 mapRes!57517))))

(declare-fun condMapEmpty!57517 () Bool)

(declare-fun mapDefault!57517 () ValueCell!17705)

(assert (=> b!1341764 (= condMapEmpty!57517 (= (arr!44061 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17705)) mapDefault!57517)))))

(declare-fun b!1341757 () Bool)

(declare-fun res!890163 () Bool)

(assert (=> b!1341757 (=> (not res!890163) (not e!763997))))

(assert (=> b!1341757 (= res!890163 (and (= (size!44613 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44612 _keys!1571) (size!44613 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!890169 () Bool)

(assert (=> start!113156 (=> (not res!890169) (not e!763997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113156 (= res!890169 (validMask!0 mask!1977))))

(assert (=> start!113156 e!763997))

(assert (=> start!113156 tp_is_empty!37207))

(assert (=> start!113156 true))

(declare-fun array_inv!33405 (array!91207) Bool)

(assert (=> start!113156 (array_inv!33405 _keys!1571)))

(declare-fun array_inv!33406 (array!91209) Bool)

(assert (=> start!113156 (and (array_inv!33406 _values!1303) e!763999)))

(assert (=> start!113156 tp!109426))

(declare-fun b!1341765 () Bool)

(declare-fun res!890165 () Bool)

(assert (=> b!1341765 (=> (not res!890165) (not e!763997))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91207 (_ BitVec 32)) Bool)

(assert (=> b!1341765 (= res!890165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341766 () Bool)

(declare-fun res!890167 () Bool)

(assert (=> b!1341766 (=> (not res!890167) (not e!763997))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341766 (= res!890167 (validKeyInArray!0 (select (arr!44060 _keys!1571) from!1960)))))

(declare-fun b!1341767 () Bool)

(assert (=> b!1341767 (= e!764000 tp_is_empty!37207)))

(declare-fun b!1341768 () Bool)

(declare-fun res!890164 () Bool)

(assert (=> b!1341768 (=> (not res!890164) (not e!763997))))

(declare-fun getCurrentListMap!5750 (array!91207 array!91209 (_ BitVec 32) (_ BitVec 32) V!54713 V!54713 (_ BitVec 32) Int) ListLongMap!21765)

(assert (=> b!1341768 (= res!890164 (contains!9003 (getCurrentListMap!5750 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113156 res!890169) b!1341757))

(assert (= (and b!1341757 res!890163) b!1341765))

(assert (= (and b!1341765 res!890165) b!1341759))

(assert (= (and b!1341759 res!890166) b!1341761))

(assert (= (and b!1341761 res!890170) b!1341768))

(assert (= (and b!1341768 res!890164) b!1341758))

(assert (= (and b!1341758 res!890168) b!1341766))

(assert (= (and b!1341766 res!890167) b!1341760))

(assert (= (and b!1341760 res!890162) b!1341762))

(assert (= (and b!1341764 condMapEmpty!57517) mapIsEmpty!57517))

(assert (= (and b!1341764 (not condMapEmpty!57517)) mapNonEmpty!57517))

(get-info :version)

(assert (= (and mapNonEmpty!57517 ((_ is ValueCellFull!17705) mapValue!57517)) b!1341763))

(assert (= (and b!1341764 ((_ is ValueCellFull!17705) mapDefault!57517)) b!1341767))

(assert (= start!113156 b!1341764))

(declare-fun b_lambda!24373 () Bool)

(assert (=> (not b_lambda!24373) (not b!1341762)))

(declare-fun t!45666 () Bool)

(declare-fun tb!12213 () Bool)

(assert (=> (and start!113156 (= defaultEntry!1306 defaultEntry!1306) t!45666) tb!12213))

(declare-fun result!25525 () Bool)

(assert (=> tb!12213 (= result!25525 tp_is_empty!37207)))

(assert (=> b!1341762 t!45666))

(declare-fun b_and!50305 () Bool)

(assert (= b_and!50303 (and (=> t!45666 result!25525) b_and!50305)))

(declare-fun m!1228933 () Bool)

(assert (=> b!1341768 m!1228933))

(assert (=> b!1341768 m!1228933))

(declare-fun m!1228935 () Bool)

(assert (=> b!1341768 m!1228935))

(declare-fun m!1228937 () Bool)

(assert (=> start!113156 m!1228937))

(declare-fun m!1228939 () Bool)

(assert (=> start!113156 m!1228939))

(declare-fun m!1228941 () Bool)

(assert (=> start!113156 m!1228941))

(declare-fun m!1228943 () Bool)

(assert (=> b!1341765 m!1228943))

(declare-fun m!1228945 () Bool)

(assert (=> b!1341762 m!1228945))

(declare-fun m!1228947 () Bool)

(assert (=> b!1341762 m!1228947))

(declare-fun m!1228949 () Bool)

(assert (=> b!1341762 m!1228949))

(declare-fun m!1228951 () Bool)

(assert (=> b!1341762 m!1228951))

(declare-fun m!1228953 () Bool)

(assert (=> b!1341762 m!1228953))

(declare-fun m!1228955 () Bool)

(assert (=> b!1341762 m!1228955))

(assert (=> b!1341762 m!1228951))

(declare-fun m!1228957 () Bool)

(assert (=> b!1341762 m!1228957))

(assert (=> b!1341762 m!1228953))

(declare-fun m!1228959 () Bool)

(assert (=> b!1341762 m!1228959))

(declare-fun m!1228961 () Bool)

(assert (=> b!1341762 m!1228961))

(assert (=> b!1341762 m!1228945))

(declare-fun m!1228963 () Bool)

(assert (=> b!1341762 m!1228963))

(assert (=> b!1341758 m!1228945))

(assert (=> b!1341766 m!1228945))

(assert (=> b!1341766 m!1228945))

(declare-fun m!1228965 () Bool)

(assert (=> b!1341766 m!1228965))

(declare-fun m!1228967 () Bool)

(assert (=> mapNonEmpty!57517 m!1228967))

(declare-fun m!1228969 () Bool)

(assert (=> b!1341759 m!1228969))

(check-sat (not b!1341762) (not b!1341766) (not b!1341759) (not b!1341768) (not b!1341765) (not b_lambda!24373) tp_is_empty!37207 (not start!113156) b_and!50305 (not b_next!31207) (not mapNonEmpty!57517))
(check-sat b_and!50305 (not b_next!31207))
