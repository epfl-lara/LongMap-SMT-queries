; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113320 () Bool)

(assert start!113320)

(declare-fun b_free!31147 () Bool)

(declare-fun b_next!31147 () Bool)

(assert (=> start!113320 (= b_free!31147 (not b_next!31147))))

(declare-fun tp!109246 () Bool)

(declare-fun b_and!50203 () Bool)

(assert (=> start!113320 (= tp!109246 b_and!50203)))

(declare-fun b!1341986 () Bool)

(declare-fun res!889900 () Bool)

(declare-fun e!764423 () Bool)

(assert (=> b!1341986 (=> (not res!889900) (not e!764423))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91267 0))(
  ( (array!91268 (arr!44085 (Array (_ BitVec 32) (_ BitVec 64))) (size!44636 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91267)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341986 (= res!889900 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44636 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341987 () Bool)

(assert (=> b!1341987 (= e!764423 (not true))))

(declare-datatypes ((V!54633 0))(
  ( (V!54634 (val!18648 Int)) )
))
(declare-datatypes ((tuple2!24062 0))(
  ( (tuple2!24063 (_1!12042 (_ BitVec 64)) (_2!12042 V!54633)) )
))
(declare-datatypes ((List!31217 0))(
  ( (Nil!31214) (Cons!31213 (h!32431 tuple2!24062) (t!45567 List!31217)) )
))
(declare-datatypes ((ListLongMap!21727 0))(
  ( (ListLongMap!21728 (toList!10879 List!31217)) )
))
(declare-fun lt!594502 () ListLongMap!21727)

(declare-fun contains!9067 (ListLongMap!21727 (_ BitVec 64)) Bool)

(assert (=> b!1341987 (contains!9067 lt!594502 k0!1142)))

(declare-datatypes ((Unit!43936 0))(
  ( (Unit!43937) )
))
(declare-fun lt!594503 () Unit!43936)

(declare-fun zeroValue!1245 () V!54633)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!324 ((_ BitVec 64) (_ BitVec 64) V!54633 ListLongMap!21727) Unit!43936)

(assert (=> b!1341987 (= lt!594503 (lemmaInListMapAfterAddingDiffThenInBefore!324 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594502))))

(declare-fun minValue!1245 () V!54633)

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17675 0))(
  ( (ValueCellFull!17675 (v!21291 V!54633)) (EmptyCell!17675) )
))
(declare-datatypes ((array!91269 0))(
  ( (array!91270 (arr!44086 (Array (_ BitVec 32) ValueCell!17675)) (size!44637 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91269)

(declare-fun +!4798 (ListLongMap!21727 tuple2!24062) ListLongMap!21727)

(declare-fun getCurrentListMapNoExtraKeys!6447 (array!91267 array!91269 (_ BitVec 32) (_ BitVec 32) V!54633 V!54633 (_ BitVec 32) Int) ListLongMap!21727)

(declare-fun get!22256 (ValueCell!17675 V!54633) V!54633)

(declare-fun dynLambda!3752 (Int (_ BitVec 64)) V!54633)

(assert (=> b!1341987 (= lt!594502 (+!4798 (getCurrentListMapNoExtraKeys!6447 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24063 (select (arr!44085 _keys!1571) from!1960) (get!22256 (select (arr!44086 _values!1303) from!1960) (dynLambda!3752 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341988 () Bool)

(declare-fun e!764422 () Bool)

(declare-fun tp_is_empty!37147 () Bool)

(assert (=> b!1341988 (= e!764422 tp_is_empty!37147)))

(declare-fun mapIsEmpty!57427 () Bool)

(declare-fun mapRes!57427 () Bool)

(assert (=> mapIsEmpty!57427 mapRes!57427))

(declare-fun res!889905 () Bool)

(assert (=> start!113320 (=> (not res!889905) (not e!764423))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113320 (= res!889905 (validMask!0 mask!1977))))

(assert (=> start!113320 e!764423))

(assert (=> start!113320 tp_is_empty!37147))

(assert (=> start!113320 true))

(declare-fun array_inv!33501 (array!91267) Bool)

(assert (=> start!113320 (array_inv!33501 _keys!1571)))

(declare-fun e!764424 () Bool)

(declare-fun array_inv!33502 (array!91269) Bool)

(assert (=> start!113320 (and (array_inv!33502 _values!1303) e!764424)))

(assert (=> start!113320 tp!109246))

(declare-fun b!1341989 () Bool)

(declare-fun res!889902 () Bool)

(assert (=> b!1341989 (=> (not res!889902) (not e!764423))))

(assert (=> b!1341989 (= res!889902 (and (= (size!44637 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44636 _keys!1571) (size!44637 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341990 () Bool)

(declare-fun res!889899 () Bool)

(assert (=> b!1341990 (=> (not res!889899) (not e!764423))))

(declare-datatypes ((List!31218 0))(
  ( (Nil!31215) (Cons!31214 (h!32432 (_ BitVec 64)) (t!45568 List!31218)) )
))
(declare-fun arrayNoDuplicates!0 (array!91267 (_ BitVec 32) List!31218) Bool)

(assert (=> b!1341990 (= res!889899 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31215))))

(declare-fun b!1341991 () Bool)

(declare-fun res!889901 () Bool)

(assert (=> b!1341991 (=> (not res!889901) (not e!764423))))

(declare-fun getCurrentListMap!5831 (array!91267 array!91269 (_ BitVec 32) (_ BitVec 32) V!54633 V!54633 (_ BitVec 32) Int) ListLongMap!21727)

(assert (=> b!1341991 (= res!889901 (contains!9067 (getCurrentListMap!5831 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341992 () Bool)

(declare-fun res!889906 () Bool)

(assert (=> b!1341992 (=> (not res!889906) (not e!764423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91267 (_ BitVec 32)) Bool)

(assert (=> b!1341992 (= res!889906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341993 () Bool)

(declare-fun res!889907 () Bool)

(assert (=> b!1341993 (=> (not res!889907) (not e!764423))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341993 (= res!889907 (validKeyInArray!0 (select (arr!44085 _keys!1571) from!1960)))))

(declare-fun b!1341994 () Bool)

(assert (=> b!1341994 (= e!764424 (and e!764422 mapRes!57427))))

(declare-fun condMapEmpty!57427 () Bool)

(declare-fun mapDefault!57427 () ValueCell!17675)

(assert (=> b!1341994 (= condMapEmpty!57427 (= (arr!44086 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17675)) mapDefault!57427)))))

(declare-fun b!1341995 () Bool)

(declare-fun res!889904 () Bool)

(assert (=> b!1341995 (=> (not res!889904) (not e!764423))))

(assert (=> b!1341995 (= res!889904 (not (= (select (arr!44085 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341996 () Bool)

(declare-fun res!889903 () Bool)

(assert (=> b!1341996 (=> (not res!889903) (not e!764423))))

(assert (=> b!1341996 (= res!889903 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57427 () Bool)

(declare-fun tp!109245 () Bool)

(declare-fun e!764426 () Bool)

(assert (=> mapNonEmpty!57427 (= mapRes!57427 (and tp!109245 e!764426))))

(declare-fun mapRest!57427 () (Array (_ BitVec 32) ValueCell!17675))

(declare-fun mapValue!57427 () ValueCell!17675)

(declare-fun mapKey!57427 () (_ BitVec 32))

(assert (=> mapNonEmpty!57427 (= (arr!44086 _values!1303) (store mapRest!57427 mapKey!57427 mapValue!57427))))

(declare-fun b!1341997 () Bool)

(assert (=> b!1341997 (= e!764426 tp_is_empty!37147)))

(assert (= (and start!113320 res!889905) b!1341989))

(assert (= (and b!1341989 res!889902) b!1341992))

(assert (= (and b!1341992 res!889906) b!1341990))

(assert (= (and b!1341990 res!889899) b!1341986))

(assert (= (and b!1341986 res!889900) b!1341991))

(assert (= (and b!1341991 res!889901) b!1341995))

(assert (= (and b!1341995 res!889904) b!1341993))

(assert (= (and b!1341993 res!889907) b!1341996))

(assert (= (and b!1341996 res!889903) b!1341987))

(assert (= (and b!1341994 condMapEmpty!57427) mapIsEmpty!57427))

(assert (= (and b!1341994 (not condMapEmpty!57427)) mapNonEmpty!57427))

(get-info :version)

(assert (= (and mapNonEmpty!57427 ((_ is ValueCellFull!17675) mapValue!57427)) b!1341997))

(assert (= (and b!1341994 ((_ is ValueCellFull!17675) mapDefault!57427)) b!1341988))

(assert (= start!113320 b!1341994))

(declare-fun b_lambda!24317 () Bool)

(assert (=> (not b_lambda!24317) (not b!1341987)))

(declare-fun t!45566 () Bool)

(declare-fun tb!12153 () Bool)

(assert (=> (and start!113320 (= defaultEntry!1306 defaultEntry!1306) t!45566) tb!12153))

(declare-fun result!25405 () Bool)

(assert (=> tb!12153 (= result!25405 tp_is_empty!37147)))

(assert (=> b!1341987 t!45566))

(declare-fun b_and!50205 () Bool)

(assert (= b_and!50203 (and (=> t!45566 result!25405) b_and!50205)))

(declare-fun m!1230015 () Bool)

(assert (=> b!1341991 m!1230015))

(assert (=> b!1341991 m!1230015))

(declare-fun m!1230017 () Bool)

(assert (=> b!1341991 m!1230017))

(declare-fun m!1230019 () Bool)

(assert (=> b!1341990 m!1230019))

(declare-fun m!1230021 () Bool)

(assert (=> start!113320 m!1230021))

(declare-fun m!1230023 () Bool)

(assert (=> start!113320 m!1230023))

(declare-fun m!1230025 () Bool)

(assert (=> start!113320 m!1230025))

(declare-fun m!1230027 () Bool)

(assert (=> b!1341993 m!1230027))

(assert (=> b!1341993 m!1230027))

(declare-fun m!1230029 () Bool)

(assert (=> b!1341993 m!1230029))

(declare-fun m!1230031 () Bool)

(assert (=> b!1341987 m!1230031))

(declare-fun m!1230033 () Bool)

(assert (=> b!1341987 m!1230033))

(declare-fun m!1230035 () Bool)

(assert (=> b!1341987 m!1230035))

(declare-fun m!1230037 () Bool)

(assert (=> b!1341987 m!1230037))

(declare-fun m!1230039 () Bool)

(assert (=> b!1341987 m!1230039))

(assert (=> b!1341987 m!1230031))

(declare-fun m!1230041 () Bool)

(assert (=> b!1341987 m!1230041))

(assert (=> b!1341987 m!1230035))

(assert (=> b!1341987 m!1230037))

(declare-fun m!1230043 () Bool)

(assert (=> b!1341987 m!1230043))

(assert (=> b!1341987 m!1230027))

(declare-fun m!1230045 () Bool)

(assert (=> b!1341992 m!1230045))

(declare-fun m!1230047 () Bool)

(assert (=> mapNonEmpty!57427 m!1230047))

(assert (=> b!1341995 m!1230027))

(check-sat (not b!1341991) (not b!1341992) (not b!1341990) b_and!50205 (not b!1341993) (not start!113320) (not b!1341987) (not b_next!31147) (not b_lambda!24317) (not mapNonEmpty!57427) tp_is_empty!37147)
(check-sat b_and!50205 (not b_next!31147))
