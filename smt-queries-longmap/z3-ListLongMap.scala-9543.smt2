; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113120 () Bool)

(assert start!113120)

(declare-fun b_free!31171 () Bool)

(declare-fun b_next!31171 () Bool)

(assert (=> start!113120 (= b_free!31171 (not b_next!31171))))

(declare-fun tp!109318 () Bool)

(declare-fun b_and!50231 () Bool)

(assert (=> start!113120 (= tp!109318 b_and!50231)))

(declare-fun b!1341073 () Bool)

(declare-fun res!889680 () Bool)

(declare-fun e!763729 () Bool)

(assert (=> b!1341073 (=> (not res!889680) (not e!763729))))

(declare-datatypes ((array!91135 0))(
  ( (array!91136 (arr!44024 (Array (_ BitVec 32) (_ BitVec 64))) (size!44576 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91135)

(declare-datatypes ((List!31228 0))(
  ( (Nil!31225) (Cons!31224 (h!32433 (_ BitVec 64)) (t!45602 List!31228)) )
))
(declare-fun arrayNoDuplicates!0 (array!91135 (_ BitVec 32) List!31228) Bool)

(assert (=> b!1341073 (= res!889680 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31225))))

(declare-fun b!1341074 () Bool)

(declare-fun res!889678 () Bool)

(assert (=> b!1341074 (=> (not res!889678) (not e!763729))))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341074 (= res!889678 (validKeyInArray!0 (select (arr!44024 _keys!1571) from!1960)))))

(declare-fun b!1341075 () Bool)

(declare-fun e!763727 () Bool)

(declare-fun e!763728 () Bool)

(declare-fun mapRes!57463 () Bool)

(assert (=> b!1341075 (= e!763727 (and e!763728 mapRes!57463))))

(declare-fun condMapEmpty!57463 () Bool)

(declare-datatypes ((V!54665 0))(
  ( (V!54666 (val!18660 Int)) )
))
(declare-datatypes ((ValueCell!17687 0))(
  ( (ValueCellFull!17687 (v!21307 V!54665)) (EmptyCell!17687) )
))
(declare-datatypes ((array!91137 0))(
  ( (array!91138 (arr!44025 (Array (_ BitVec 32) ValueCell!17687)) (size!44577 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91137)

(declare-fun mapDefault!57463 () ValueCell!17687)

(assert (=> b!1341075 (= condMapEmpty!57463 (= (arr!44025 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17687)) mapDefault!57463)))))

(declare-fun b!1341076 () Bool)

(declare-fun res!889679 () Bool)

(assert (=> b!1341076 (=> (not res!889679) (not e!763729))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341076 (= res!889679 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44576 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!889682 () Bool)

(assert (=> start!113120 (=> (not res!889682) (not e!763729))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113120 (= res!889682 (validMask!0 mask!1977))))

(assert (=> start!113120 e!763729))

(declare-fun tp_is_empty!37171 () Bool)

(assert (=> start!113120 tp_is_empty!37171))

(assert (=> start!113120 true))

(declare-fun array_inv!33379 (array!91135) Bool)

(assert (=> start!113120 (array_inv!33379 _keys!1571)))

(declare-fun array_inv!33380 (array!91137) Bool)

(assert (=> start!113120 (and (array_inv!33380 _values!1303) e!763727)))

(assert (=> start!113120 tp!109318))

(declare-fun b!1341077 () Bool)

(declare-fun res!889676 () Bool)

(assert (=> b!1341077 (=> (not res!889676) (not e!763729))))

(declare-fun minValue!1245 () V!54665)

(declare-fun defaultEntry!1306 () Int)

(declare-fun zeroValue!1245 () V!54665)

(declare-datatypes ((tuple2!24078 0))(
  ( (tuple2!24079 (_1!12050 (_ BitVec 64)) (_2!12050 V!54665)) )
))
(declare-datatypes ((List!31229 0))(
  ( (Nil!31226) (Cons!31225 (h!32434 tuple2!24078) (t!45603 List!31229)) )
))
(declare-datatypes ((ListLongMap!21735 0))(
  ( (ListLongMap!21736 (toList!10883 List!31229)) )
))
(declare-fun contains!8988 (ListLongMap!21735 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5736 (array!91135 array!91137 (_ BitVec 32) (_ BitVec 32) V!54665 V!54665 (_ BitVec 32) Int) ListLongMap!21735)

(assert (=> b!1341077 (= res!889676 (contains!8988 (getCurrentListMap!5736 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57463 () Bool)

(assert (=> mapIsEmpty!57463 mapRes!57463))

(declare-fun b!1341078 () Bool)

(declare-fun res!889683 () Bool)

(assert (=> b!1341078 (=> (not res!889683) (not e!763729))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91135 (_ BitVec 32)) Bool)

(assert (=> b!1341078 (= res!889683 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341079 () Bool)

(declare-fun res!889677 () Bool)

(assert (=> b!1341079 (=> (not res!889677) (not e!763729))))

(assert (=> b!1341079 (= res!889677 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!57463 () Bool)

(declare-fun tp!109319 () Bool)

(declare-fun e!763726 () Bool)

(assert (=> mapNonEmpty!57463 (= mapRes!57463 (and tp!109319 e!763726))))

(declare-fun mapRest!57463 () (Array (_ BitVec 32) ValueCell!17687))

(declare-fun mapValue!57463 () ValueCell!17687)

(declare-fun mapKey!57463 () (_ BitVec 32))

(assert (=> mapNonEmpty!57463 (= (arr!44025 _values!1303) (store mapRest!57463 mapKey!57463 mapValue!57463))))

(declare-fun b!1341080 () Bool)

(assert (=> b!1341080 (= e!763729 (not true))))

(declare-fun lt!593912 () ListLongMap!21735)

(assert (=> b!1341080 (contains!8988 lt!593912 k0!1142)))

(declare-datatypes ((Unit!43822 0))(
  ( (Unit!43823) )
))
(declare-fun lt!593913 () Unit!43822)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!329 ((_ BitVec 64) (_ BitVec 64) V!54665 ListLongMap!21735) Unit!43822)

(assert (=> b!1341080 (= lt!593913 (lemmaInListMapAfterAddingDiffThenInBefore!329 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593912))))

(declare-fun +!4790 (ListLongMap!21735 tuple2!24078) ListLongMap!21735)

(declare-fun getCurrentListMapNoExtraKeys!6433 (array!91135 array!91137 (_ BitVec 32) (_ BitVec 32) V!54665 V!54665 (_ BitVec 32) Int) ListLongMap!21735)

(declare-fun get!22220 (ValueCell!17687 V!54665) V!54665)

(declare-fun dynLambda!3720 (Int (_ BitVec 64)) V!54665)

(assert (=> b!1341080 (= lt!593912 (+!4790 (getCurrentListMapNoExtraKeys!6433 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24079 (select (arr!44024 _keys!1571) from!1960) (get!22220 (select (arr!44025 _values!1303) from!1960) (dynLambda!3720 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341081 () Bool)

(assert (=> b!1341081 (= e!763728 tp_is_empty!37171)))

(declare-fun b!1341082 () Bool)

(declare-fun res!889684 () Bool)

(assert (=> b!1341082 (=> (not res!889684) (not e!763729))))

(assert (=> b!1341082 (= res!889684 (and (= (size!44577 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44576 _keys!1571) (size!44577 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341083 () Bool)

(declare-fun res!889681 () Bool)

(assert (=> b!1341083 (=> (not res!889681) (not e!763729))))

(assert (=> b!1341083 (= res!889681 (not (= (select (arr!44024 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341084 () Bool)

(assert (=> b!1341084 (= e!763726 tp_is_empty!37171)))

(assert (= (and start!113120 res!889682) b!1341082))

(assert (= (and b!1341082 res!889684) b!1341078))

(assert (= (and b!1341078 res!889683) b!1341073))

(assert (= (and b!1341073 res!889680) b!1341076))

(assert (= (and b!1341076 res!889679) b!1341077))

(assert (= (and b!1341077 res!889676) b!1341083))

(assert (= (and b!1341083 res!889681) b!1341074))

(assert (= (and b!1341074 res!889678) b!1341079))

(assert (= (and b!1341079 res!889677) b!1341080))

(assert (= (and b!1341075 condMapEmpty!57463) mapIsEmpty!57463))

(assert (= (and b!1341075 (not condMapEmpty!57463)) mapNonEmpty!57463))

(get-info :version)

(assert (= (and mapNonEmpty!57463 ((_ is ValueCellFull!17687) mapValue!57463)) b!1341084))

(assert (= (and b!1341075 ((_ is ValueCellFull!17687) mapDefault!57463)) b!1341081))

(assert (= start!113120 b!1341075))

(declare-fun b_lambda!24337 () Bool)

(assert (=> (not b_lambda!24337) (not b!1341080)))

(declare-fun t!45601 () Bool)

(declare-fun tb!12177 () Bool)

(assert (=> (and start!113120 (= defaultEntry!1306 defaultEntry!1306) t!45601) tb!12177))

(declare-fun result!25453 () Bool)

(assert (=> tb!12177 (= result!25453 tp_is_empty!37171)))

(assert (=> b!1341080 t!45601))

(declare-fun b_and!50233 () Bool)

(assert (= b_and!50231 (and (=> t!45601 result!25453) b_and!50233)))

(declare-fun m!1228309 () Bool)

(assert (=> mapNonEmpty!57463 m!1228309))

(declare-fun m!1228311 () Bool)

(assert (=> b!1341080 m!1228311))

(declare-fun m!1228313 () Bool)

(assert (=> b!1341080 m!1228313))

(declare-fun m!1228315 () Bool)

(assert (=> b!1341080 m!1228315))

(declare-fun m!1228317 () Bool)

(assert (=> b!1341080 m!1228317))

(assert (=> b!1341080 m!1228311))

(declare-fun m!1228319 () Bool)

(assert (=> b!1341080 m!1228319))

(assert (=> b!1341080 m!1228313))

(assert (=> b!1341080 m!1228315))

(declare-fun m!1228321 () Bool)

(assert (=> b!1341080 m!1228321))

(declare-fun m!1228323 () Bool)

(assert (=> b!1341080 m!1228323))

(declare-fun m!1228325 () Bool)

(assert (=> b!1341080 m!1228325))

(assert (=> b!1341074 m!1228323))

(assert (=> b!1341074 m!1228323))

(declare-fun m!1228327 () Bool)

(assert (=> b!1341074 m!1228327))

(declare-fun m!1228329 () Bool)

(assert (=> b!1341077 m!1228329))

(assert (=> b!1341077 m!1228329))

(declare-fun m!1228331 () Bool)

(assert (=> b!1341077 m!1228331))

(declare-fun m!1228333 () Bool)

(assert (=> b!1341073 m!1228333))

(assert (=> b!1341083 m!1228323))

(declare-fun m!1228335 () Bool)

(assert (=> start!113120 m!1228335))

(declare-fun m!1228337 () Bool)

(assert (=> start!113120 m!1228337))

(declare-fun m!1228339 () Bool)

(assert (=> start!113120 m!1228339))

(declare-fun m!1228341 () Bool)

(assert (=> b!1341078 m!1228341))

(check-sat (not b_next!31171) (not mapNonEmpty!57463) (not b!1341073) b_and!50233 (not b!1341078) (not b!1341080) (not b!1341077) (not b!1341074) (not start!113120) tp_is_empty!37171 (not b_lambda!24337))
(check-sat b_and!50233 (not b_next!31171))
