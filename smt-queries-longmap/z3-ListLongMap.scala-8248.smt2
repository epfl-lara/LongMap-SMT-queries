; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100438 () Bool)

(assert start!100438)

(declare-fun b_free!25761 () Bool)

(declare-fun b_next!25761 () Bool)

(assert (=> start!100438 (= b_free!25761 (not b_next!25761))))

(declare-fun tp!90273 () Bool)

(declare-fun b_and!42409 () Bool)

(assert (=> start!100438 (= tp!90273 b_and!42409)))

(declare-fun mapIsEmpty!47540 () Bool)

(declare-fun mapRes!47540 () Bool)

(assert (=> mapIsEmpty!47540 mapRes!47540))

(declare-fun b!1199144 () Bool)

(declare-fun e!681104 () Bool)

(declare-fun tp_is_empty!30465 () Bool)

(assert (=> b!1199144 (= e!681104 tp_is_empty!30465)))

(declare-fun b!1199145 () Bool)

(declare-fun e!681103 () Bool)

(declare-fun e!681107 () Bool)

(assert (=> b!1199145 (= e!681103 e!681107)))

(declare-fun res!798135 () Bool)

(assert (=> b!1199145 (=> (not res!798135) (not e!681107))))

(declare-datatypes ((array!77707 0))(
  ( (array!77708 (arr!37498 (Array (_ BitVec 32) (_ BitVec 64))) (size!38034 (_ BitVec 32))) )
))
(declare-fun lt!543691 () array!77707)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77707 (_ BitVec 32)) Bool)

(assert (=> b!1199145 (= res!798135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!543691 mask!1564))))

(declare-fun _keys!1208 () array!77707)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1199145 (= lt!543691 (array!77708 (store (arr!37498 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38034 _keys!1208)))))

(declare-fun b!1199146 () Bool)

(declare-fun res!798141 () Bool)

(assert (=> b!1199146 (=> (not res!798141) (not e!681103))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1199146 (= res!798141 (validKeyInArray!0 k0!934))))

(declare-fun b!1199147 () Bool)

(declare-fun e!681105 () Bool)

(assert (=> b!1199147 (= e!681105 true)))

(declare-datatypes ((V!45747 0))(
  ( (V!45748 (val!15289 Int)) )
))
(declare-fun zeroValue!944 () V!45747)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((tuple2!19568 0))(
  ( (tuple2!19569 (_1!9795 (_ BitVec 64)) (_2!9795 V!45747)) )
))
(declare-datatypes ((List!26384 0))(
  ( (Nil!26381) (Cons!26380 (h!27589 tuple2!19568) (t!39125 List!26384)) )
))
(declare-datatypes ((ListLongMap!17537 0))(
  ( (ListLongMap!17538 (toList!8784 List!26384)) )
))
(declare-fun lt!543688 () ListLongMap!17537)

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!14523 0))(
  ( (ValueCellFull!14523 (v!17927 V!45747)) (EmptyCell!14523) )
))
(declare-datatypes ((array!77709 0))(
  ( (array!77710 (arr!37499 (Array (_ BitVec 32) ValueCell!14523)) (size!38035 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77709)

(declare-fun minValue!944 () V!45747)

(declare-fun getCurrentListMapNoExtraKeys!5223 (array!77707 array!77709 (_ BitVec 32) (_ BitVec 32) V!45747 V!45747 (_ BitVec 32) Int) ListLongMap!17537)

(declare-fun dynLambda!3143 (Int (_ BitVec 64)) V!45747)

(assert (=> b!1199147 (= lt!543688 (getCurrentListMapNoExtraKeys!5223 lt!543691 (array!77710 (store (arr!37499 _values!996) i!673 (ValueCellFull!14523 (dynLambda!3143 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!38035 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!543690 () ListLongMap!17537)

(assert (=> b!1199147 (= lt!543690 (getCurrentListMapNoExtraKeys!5223 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1199148 () Bool)

(declare-fun e!681109 () Bool)

(assert (=> b!1199148 (= e!681109 tp_is_empty!30465)))

(declare-fun b!1199149 () Bool)

(declare-fun res!798138 () Bool)

(assert (=> b!1199149 (=> (not res!798138) (not e!681103))))

(declare-datatypes ((List!26385 0))(
  ( (Nil!26382) (Cons!26381 (h!27590 (_ BitVec 64)) (t!39126 List!26385)) )
))
(declare-fun arrayNoDuplicates!0 (array!77707 (_ BitVec 32) List!26385) Bool)

(assert (=> b!1199149 (= res!798138 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26382))))

(declare-fun b!1199150 () Bool)

(declare-fun res!798134 () Bool)

(assert (=> b!1199150 (=> (not res!798134) (not e!681103))))

(assert (=> b!1199150 (= res!798134 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38034 _keys!1208))))))

(declare-fun b!1199151 () Bool)

(declare-fun res!798137 () Bool)

(assert (=> b!1199151 (=> (not res!798137) (not e!681103))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1199151 (= res!798137 (validMask!0 mask!1564))))

(declare-fun res!798139 () Bool)

(assert (=> start!100438 (=> (not res!798139) (not e!681103))))

(assert (=> start!100438 (= res!798139 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38034 _keys!1208))))))

(assert (=> start!100438 e!681103))

(assert (=> start!100438 tp_is_empty!30465))

(declare-fun array_inv!28574 (array!77707) Bool)

(assert (=> start!100438 (array_inv!28574 _keys!1208)))

(assert (=> start!100438 true))

(assert (=> start!100438 tp!90273))

(declare-fun e!681108 () Bool)

(declare-fun array_inv!28575 (array!77709) Bool)

(assert (=> start!100438 (and (array_inv!28575 _values!996) e!681108)))

(declare-fun b!1199152 () Bool)

(declare-fun res!798142 () Bool)

(assert (=> b!1199152 (=> (not res!798142) (not e!681103))))

(assert (=> b!1199152 (= res!798142 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1199153 () Bool)

(assert (=> b!1199153 (= e!681107 (not e!681105))))

(declare-fun res!798140 () Bool)

(assert (=> b!1199153 (=> res!798140 e!681105)))

(assert (=> b!1199153 (= res!798140 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!77707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1199153 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!39760 0))(
  ( (Unit!39761) )
))
(declare-fun lt!543689 () Unit!39760)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!77707 (_ BitVec 64) (_ BitVec 32)) Unit!39760)

(assert (=> b!1199153 (= lt!543689 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1199154 () Bool)

(assert (=> b!1199154 (= e!681108 (and e!681109 mapRes!47540))))

(declare-fun condMapEmpty!47540 () Bool)

(declare-fun mapDefault!47540 () ValueCell!14523)

(assert (=> b!1199154 (= condMapEmpty!47540 (= (arr!37499 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14523)) mapDefault!47540)))))

(declare-fun b!1199155 () Bool)

(declare-fun res!798143 () Bool)

(assert (=> b!1199155 (=> (not res!798143) (not e!681107))))

(assert (=> b!1199155 (= res!798143 (arrayNoDuplicates!0 lt!543691 #b00000000000000000000000000000000 Nil!26382))))

(declare-fun b!1199156 () Bool)

(declare-fun res!798144 () Bool)

(assert (=> b!1199156 (=> (not res!798144) (not e!681103))))

(assert (=> b!1199156 (= res!798144 (and (= (size!38035 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38034 _keys!1208) (size!38035 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!47540 () Bool)

(declare-fun tp!90272 () Bool)

(assert (=> mapNonEmpty!47540 (= mapRes!47540 (and tp!90272 e!681104))))

(declare-fun mapRest!47540 () (Array (_ BitVec 32) ValueCell!14523))

(declare-fun mapKey!47540 () (_ BitVec 32))

(declare-fun mapValue!47540 () ValueCell!14523)

(assert (=> mapNonEmpty!47540 (= (arr!37499 _values!996) (store mapRest!47540 mapKey!47540 mapValue!47540))))

(declare-fun b!1199157 () Bool)

(declare-fun res!798136 () Bool)

(assert (=> b!1199157 (=> (not res!798136) (not e!681103))))

(assert (=> b!1199157 (= res!798136 (= (select (arr!37498 _keys!1208) i!673) k0!934))))

(assert (= (and start!100438 res!798139) b!1199151))

(assert (= (and b!1199151 res!798137) b!1199156))

(assert (= (and b!1199156 res!798144) b!1199152))

(assert (= (and b!1199152 res!798142) b!1199149))

(assert (= (and b!1199149 res!798138) b!1199150))

(assert (= (and b!1199150 res!798134) b!1199146))

(assert (= (and b!1199146 res!798141) b!1199157))

(assert (= (and b!1199157 res!798136) b!1199145))

(assert (= (and b!1199145 res!798135) b!1199155))

(assert (= (and b!1199155 res!798143) b!1199153))

(assert (= (and b!1199153 (not res!798140)) b!1199147))

(assert (= (and b!1199154 condMapEmpty!47540) mapIsEmpty!47540))

(assert (= (and b!1199154 (not condMapEmpty!47540)) mapNonEmpty!47540))

(get-info :version)

(assert (= (and mapNonEmpty!47540 ((_ is ValueCellFull!14523) mapValue!47540)) b!1199144))

(assert (= (and b!1199154 ((_ is ValueCellFull!14523) mapDefault!47540)) b!1199148))

(assert (= start!100438 b!1199154))

(declare-fun b_lambda!20957 () Bool)

(assert (=> (not b_lambda!20957) (not b!1199147)))

(declare-fun t!39124 () Bool)

(declare-fun tb!10561 () Bool)

(assert (=> (and start!100438 (= defaultEntry!1004 defaultEntry!1004) t!39124) tb!10561))

(declare-fun result!21699 () Bool)

(assert (=> tb!10561 (= result!21699 tp_is_empty!30465)))

(assert (=> b!1199147 t!39124))

(declare-fun b_and!42411 () Bool)

(assert (= b_and!42409 (and (=> t!39124 result!21699) b_and!42411)))

(declare-fun m!1105749 () Bool)

(assert (=> start!100438 m!1105749))

(declare-fun m!1105751 () Bool)

(assert (=> start!100438 m!1105751))

(declare-fun m!1105753 () Bool)

(assert (=> b!1199146 m!1105753))

(declare-fun m!1105755 () Bool)

(assert (=> mapNonEmpty!47540 m!1105755))

(declare-fun m!1105757 () Bool)

(assert (=> b!1199147 m!1105757))

(declare-fun m!1105759 () Bool)

(assert (=> b!1199147 m!1105759))

(declare-fun m!1105761 () Bool)

(assert (=> b!1199147 m!1105761))

(declare-fun m!1105763 () Bool)

(assert (=> b!1199147 m!1105763))

(declare-fun m!1105765 () Bool)

(assert (=> b!1199149 m!1105765))

(declare-fun m!1105767 () Bool)

(assert (=> b!1199151 m!1105767))

(declare-fun m!1105769 () Bool)

(assert (=> b!1199157 m!1105769))

(declare-fun m!1105771 () Bool)

(assert (=> b!1199152 m!1105771))

(declare-fun m!1105773 () Bool)

(assert (=> b!1199153 m!1105773))

(declare-fun m!1105775 () Bool)

(assert (=> b!1199153 m!1105775))

(declare-fun m!1105777 () Bool)

(assert (=> b!1199145 m!1105777))

(declare-fun m!1105779 () Bool)

(assert (=> b!1199145 m!1105779))

(declare-fun m!1105781 () Bool)

(assert (=> b!1199155 m!1105781))

(check-sat (not start!100438) (not b!1199145) tp_is_empty!30465 (not b!1199149) (not b!1199155) (not b!1199152) (not b!1199151) (not b!1199146) (not mapNonEmpty!47540) (not b_lambda!20957) b_and!42411 (not b_next!25761) (not b!1199147) (not b!1199153))
(check-sat b_and!42411 (not b_next!25761))
