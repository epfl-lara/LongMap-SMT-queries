; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113116 () Bool)

(assert start!113116)

(declare-fun b_free!31167 () Bool)

(declare-fun b_next!31167 () Bool)

(assert (=> start!113116 (= b_free!31167 (not b_next!31167))))

(declare-fun tp!109306 () Bool)

(declare-fun b_and!50241 () Bool)

(assert (=> start!113116 (= tp!109306 b_and!50241)))

(declare-fun b!1341067 () Bool)

(declare-fun res!889659 () Bool)

(declare-fun e!763732 () Bool)

(assert (=> b!1341067 (=> (not res!889659) (not e!763732))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((array!91186 0))(
  ( (array!91187 (arr!44049 (Array (_ BitVec 32) (_ BitVec 64))) (size!44599 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91186)

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1341067 (= res!889659 (not (= (select (arr!44049 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1341068 () Bool)

(declare-fun res!889658 () Bool)

(assert (=> b!1341068 (=> (not res!889658) (not e!763732))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341068 (= res!889658 (validKeyInArray!0 (select (arr!44049 _keys!1571) from!1960)))))

(declare-fun b!1341069 () Bool)

(declare-fun e!763731 () Bool)

(declare-fun tp_is_empty!37167 () Bool)

(assert (=> b!1341069 (= e!763731 tp_is_empty!37167)))

(declare-fun b!1341070 () Bool)

(assert (=> b!1341070 (= e!763732 (not true))))

(declare-datatypes ((V!54659 0))(
  ( (V!54660 (val!18658 Int)) )
))
(declare-datatypes ((tuple2!24020 0))(
  ( (tuple2!24021 (_1!12021 (_ BitVec 64)) (_2!12021 V!54659)) )
))
(declare-datatypes ((List!31182 0))(
  ( (Nil!31179) (Cons!31178 (h!32387 tuple2!24020) (t!45560 List!31182)) )
))
(declare-datatypes ((ListLongMap!21677 0))(
  ( (ListLongMap!21678 (toList!10854 List!31182)) )
))
(declare-fun lt!594086 () ListLongMap!21677)

(declare-fun contains!9030 (ListLongMap!21677 (_ BitVec 64)) Bool)

(assert (=> b!1341070 (contains!9030 lt!594086 k0!1142)))

(declare-datatypes ((Unit!44013 0))(
  ( (Unit!44014) )
))
(declare-fun lt!594087 () Unit!44013)

(declare-fun zeroValue!1245 () V!54659)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!337 ((_ BitVec 64) (_ BitVec 64) V!54659 ListLongMap!21677) Unit!44013)

(assert (=> b!1341070 (= lt!594087 (lemmaInListMapAfterAddingDiffThenInBefore!337 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594086))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17685 0))(
  ( (ValueCellFull!17685 (v!21306 V!54659)) (EmptyCell!17685) )
))
(declare-datatypes ((array!91188 0))(
  ( (array!91189 (arr!44050 (Array (_ BitVec 32) ValueCell!17685)) (size!44600 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91188)

(declare-fun minValue!1245 () V!54659)

(declare-fun +!4768 (ListLongMap!21677 tuple2!24020) ListLongMap!21677)

(declare-fun getCurrentListMapNoExtraKeys!6410 (array!91186 array!91188 (_ BitVec 32) (_ BitVec 32) V!54659 V!54659 (_ BitVec 32) Int) ListLongMap!21677)

(declare-fun get!22229 (ValueCell!17685 V!54659) V!54659)

(declare-fun dynLambda!3707 (Int (_ BitVec 64)) V!54659)

(assert (=> b!1341070 (= lt!594086 (+!4768 (getCurrentListMapNoExtraKeys!6410 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24021 (select (arr!44049 _keys!1571) from!1960) (get!22229 (select (arr!44050 _values!1303) from!1960) (dynLambda!3707 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341071 () Bool)

(declare-fun e!763730 () Bool)

(assert (=> b!1341071 (= e!763730 tp_is_empty!37167)))

(declare-fun res!889651 () Bool)

(assert (=> start!113116 (=> (not res!889651) (not e!763732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113116 (= res!889651 (validMask!0 mask!1977))))

(assert (=> start!113116 e!763732))

(assert (=> start!113116 tp_is_empty!37167))

(assert (=> start!113116 true))

(declare-fun array_inv!33207 (array!91186) Bool)

(assert (=> start!113116 (array_inv!33207 _keys!1571)))

(declare-fun e!763733 () Bool)

(declare-fun array_inv!33208 (array!91188) Bool)

(assert (=> start!113116 (and (array_inv!33208 _values!1303) e!763733)))

(assert (=> start!113116 tp!109306))

(declare-fun mapNonEmpty!57457 () Bool)

(declare-fun mapRes!57457 () Bool)

(declare-fun tp!109305 () Bool)

(assert (=> mapNonEmpty!57457 (= mapRes!57457 (and tp!109305 e!763730))))

(declare-fun mapValue!57457 () ValueCell!17685)

(declare-fun mapKey!57457 () (_ BitVec 32))

(declare-fun mapRest!57457 () (Array (_ BitVec 32) ValueCell!17685))

(assert (=> mapNonEmpty!57457 (= (arr!44050 _values!1303) (store mapRest!57457 mapKey!57457 mapValue!57457))))

(declare-fun b!1341072 () Bool)

(declare-fun res!889653 () Bool)

(assert (=> b!1341072 (=> (not res!889653) (not e!763732))))

(assert (=> b!1341072 (= res!889653 (and (= (size!44600 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44599 _keys!1571) (size!44600 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341073 () Bool)

(declare-fun res!889655 () Bool)

(assert (=> b!1341073 (=> (not res!889655) (not e!763732))))

(declare-datatypes ((List!31183 0))(
  ( (Nil!31180) (Cons!31179 (h!32388 (_ BitVec 64)) (t!45561 List!31183)) )
))
(declare-fun arrayNoDuplicates!0 (array!91186 (_ BitVec 32) List!31183) Bool)

(assert (=> b!1341073 (= res!889655 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31180))))

(declare-fun b!1341074 () Bool)

(declare-fun res!889652 () Bool)

(assert (=> b!1341074 (=> (not res!889652) (not e!763732))))

(assert (=> b!1341074 (= res!889652 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341075 () Bool)

(declare-fun res!889654 () Bool)

(assert (=> b!1341075 (=> (not res!889654) (not e!763732))))

(assert (=> b!1341075 (= res!889654 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44599 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341076 () Bool)

(assert (=> b!1341076 (= e!763733 (and e!763731 mapRes!57457))))

(declare-fun condMapEmpty!57457 () Bool)

(declare-fun mapDefault!57457 () ValueCell!17685)

(assert (=> b!1341076 (= condMapEmpty!57457 (= (arr!44050 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17685)) mapDefault!57457)))))

(declare-fun mapIsEmpty!57457 () Bool)

(assert (=> mapIsEmpty!57457 mapRes!57457))

(declare-fun b!1341077 () Bool)

(declare-fun res!889656 () Bool)

(assert (=> b!1341077 (=> (not res!889656) (not e!763732))))

(declare-fun getCurrentListMap!5820 (array!91186 array!91188 (_ BitVec 32) (_ BitVec 32) V!54659 V!54659 (_ BitVec 32) Int) ListLongMap!21677)

(assert (=> b!1341077 (= res!889656 (contains!9030 (getCurrentListMap!5820 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1341078 () Bool)

(declare-fun res!889657 () Bool)

(assert (=> b!1341078 (=> (not res!889657) (not e!763732))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91186 (_ BitVec 32)) Bool)

(assert (=> b!1341078 (= res!889657 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113116 res!889651) b!1341072))

(assert (= (and b!1341072 res!889653) b!1341078))

(assert (= (and b!1341078 res!889657) b!1341073))

(assert (= (and b!1341073 res!889655) b!1341075))

(assert (= (and b!1341075 res!889654) b!1341077))

(assert (= (and b!1341077 res!889656) b!1341067))

(assert (= (and b!1341067 res!889659) b!1341068))

(assert (= (and b!1341068 res!889658) b!1341074))

(assert (= (and b!1341074 res!889652) b!1341070))

(assert (= (and b!1341076 condMapEmpty!57457) mapIsEmpty!57457))

(assert (= (and b!1341076 (not condMapEmpty!57457)) mapNonEmpty!57457))

(get-info :version)

(assert (= (and mapNonEmpty!57457 ((_ is ValueCellFull!17685) mapValue!57457)) b!1341071))

(assert (= (and b!1341076 ((_ is ValueCellFull!17685) mapDefault!57457)) b!1341069))

(assert (= start!113116 b!1341076))

(declare-fun b_lambda!24343 () Bool)

(assert (=> (not b_lambda!24343) (not b!1341070)))

(declare-fun t!45559 () Bool)

(declare-fun tb!12181 () Bool)

(assert (=> (and start!113116 (= defaultEntry!1306 defaultEntry!1306) t!45559) tb!12181))

(declare-fun result!25453 () Bool)

(assert (=> tb!12181 (= result!25453 tp_is_empty!37167)))

(assert (=> b!1341070 t!45559))

(declare-fun b_and!50243 () Bool)

(assert (= b_and!50241 (and (=> t!45559 result!25453) b_and!50243)))

(declare-fun m!1228757 () Bool)

(assert (=> b!1341070 m!1228757))

(declare-fun m!1228759 () Bool)

(assert (=> b!1341070 m!1228759))

(assert (=> b!1341070 m!1228759))

(declare-fun m!1228761 () Bool)

(assert (=> b!1341070 m!1228761))

(declare-fun m!1228763 () Bool)

(assert (=> b!1341070 m!1228763))

(declare-fun m!1228765 () Bool)

(assert (=> b!1341070 m!1228765))

(declare-fun m!1228767 () Bool)

(assert (=> b!1341070 m!1228767))

(declare-fun m!1228769 () Bool)

(assert (=> b!1341070 m!1228769))

(assert (=> b!1341070 m!1228763))

(assert (=> b!1341070 m!1228765))

(declare-fun m!1228771 () Bool)

(assert (=> b!1341070 m!1228771))

(declare-fun m!1228773 () Bool)

(assert (=> start!113116 m!1228773))

(declare-fun m!1228775 () Bool)

(assert (=> start!113116 m!1228775))

(declare-fun m!1228777 () Bool)

(assert (=> start!113116 m!1228777))

(declare-fun m!1228779 () Bool)

(assert (=> b!1341073 m!1228779))

(declare-fun m!1228781 () Bool)

(assert (=> mapNonEmpty!57457 m!1228781))

(assert (=> b!1341068 m!1228767))

(assert (=> b!1341068 m!1228767))

(declare-fun m!1228783 () Bool)

(assert (=> b!1341068 m!1228783))

(declare-fun m!1228785 () Bool)

(assert (=> b!1341078 m!1228785))

(declare-fun m!1228787 () Bool)

(assert (=> b!1341077 m!1228787))

(assert (=> b!1341077 m!1228787))

(declare-fun m!1228789 () Bool)

(assert (=> b!1341077 m!1228789))

(assert (=> b!1341067 m!1228767))

(check-sat (not b!1341073) tp_is_empty!37167 (not start!113116) (not b!1341078) (not b_next!31167) b_and!50243 (not b!1341077) (not b_lambda!24343) (not mapNonEmpty!57457) (not b!1341068) (not b!1341070))
(check-sat b_and!50243 (not b_next!31167))
