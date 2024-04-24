; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79556 () Bool)

(assert start!79556)

(declare-fun b_free!17575 () Bool)

(declare-fun b_next!17575 () Bool)

(assert (=> start!79556 (= b_free!17575 (not b_next!17575))))

(declare-fun tp!61169 () Bool)

(declare-fun b_and!28719 () Bool)

(assert (=> start!79556 (= tp!61169 b_and!28719)))

(declare-fun b!933676 () Bool)

(declare-fun e!524384 () Bool)

(declare-fun tp_is_empty!20083 () Bool)

(assert (=> b!933676 (= e!524384 tp_is_empty!20083)))

(declare-fun b!933677 () Bool)

(declare-fun e!524383 () Bool)

(assert (=> b!933677 (= e!524383 (not true))))

(declare-datatypes ((array!56159 0))(
  ( (array!56160 (arr!27019 (Array (_ BitVec 32) (_ BitVec 64))) (size!27479 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56159)

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((List!18995 0))(
  ( (Nil!18992) (Cons!18991 (h!20143 (_ BitVec 64)) (t!27106 List!18995)) )
))
(declare-fun arrayNoDuplicates!0 (array!56159 (_ BitVec 32) List!18995) Bool)

(assert (=> b!933677 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18992)))

(declare-datatypes ((Unit!31468 0))(
  ( (Unit!31469) )
))
(declare-fun lt!420425 () Unit!31468)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56159 (_ BitVec 32) (_ BitVec 32)) Unit!31468)

(assert (=> b!933677 (= lt!420425 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!31743 0))(
  ( (V!31744 (val!10092 Int)) )
))
(declare-datatypes ((tuple2!13212 0))(
  ( (tuple2!13213 (_1!6617 (_ BitVec 64)) (_2!6617 V!31743)) )
))
(declare-datatypes ((List!18996 0))(
  ( (Nil!18993) (Cons!18992 (h!20144 tuple2!13212) (t!27107 List!18996)) )
))
(declare-datatypes ((ListLongMap!11911 0))(
  ( (ListLongMap!11912 (toList!5971 List!18996)) )
))
(declare-fun lt!420426 () ListLongMap!11911)

(declare-fun lt!420421 () tuple2!13212)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5036 (ListLongMap!11911 (_ BitVec 64)) Bool)

(declare-fun +!2799 (ListLongMap!11911 tuple2!13212) ListLongMap!11911)

(assert (=> b!933677 (contains!5036 (+!2799 lt!420426 lt!420421) k0!1099)))

(declare-fun lt!420422 () (_ BitVec 64))

(declare-fun lt!420424 () Unit!31468)

(declare-fun lt!420420 () V!31743)

(declare-fun addStillContains!502 (ListLongMap!11911 (_ BitVec 64) V!31743 (_ BitVec 64)) Unit!31468)

(assert (=> b!933677 (= lt!420424 (addStillContains!502 lt!420426 lt!420422 lt!420420 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9560 0))(
  ( (ValueCellFull!9560 (v!12608 V!31743)) (EmptyCell!9560) )
))
(declare-datatypes ((array!56161 0))(
  ( (array!56162 (arr!27020 (Array (_ BitVec 32) ValueCell!9560)) (size!27480 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56161)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31743)

(declare-fun minValue!1173 () V!31743)

(declare-fun getCurrentListMap!3213 (array!56159 array!56161 (_ BitVec 32) (_ BitVec 32) V!31743 V!31743 (_ BitVec 32) Int) ListLongMap!11911)

(assert (=> b!933677 (= (getCurrentListMap!3213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2799 (getCurrentListMap!3213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420421))))

(assert (=> b!933677 (= lt!420421 (tuple2!13213 lt!420422 lt!420420))))

(declare-fun get!14229 (ValueCell!9560 V!31743) V!31743)

(declare-fun dynLambda!1596 (Int (_ BitVec 64)) V!31743)

(assert (=> b!933677 (= lt!420420 (get!14229 (select (arr!27020 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1596 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420423 () Unit!31468)

(declare-fun lemmaListMapRecursiveValidKeyArray!179 (array!56159 array!56161 (_ BitVec 32) (_ BitVec 32) V!31743 V!31743 (_ BitVec 32) Int) Unit!31468)

(assert (=> b!933677 (= lt!420423 (lemmaListMapRecursiveValidKeyArray!179 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31884 () Bool)

(declare-fun mapRes!31884 () Bool)

(declare-fun tp!61170 () Bool)

(declare-fun e!524386 () Bool)

(assert (=> mapNonEmpty!31884 (= mapRes!31884 (and tp!61170 e!524386))))

(declare-fun mapKey!31884 () (_ BitVec 32))

(declare-fun mapValue!31884 () ValueCell!9560)

(declare-fun mapRest!31884 () (Array (_ BitVec 32) ValueCell!9560))

(assert (=> mapNonEmpty!31884 (= (arr!27020 _values!1231) (store mapRest!31884 mapKey!31884 mapValue!31884))))

(declare-fun b!933678 () Bool)

(declare-fun res!628572 () Bool)

(declare-fun e!524388 () Bool)

(assert (=> b!933678 (=> (not res!628572) (not e!524388))))

(assert (=> b!933678 (= res!628572 (and (= (size!27480 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27479 _keys!1487) (size!27480 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933679 () Bool)

(declare-fun e!524385 () Bool)

(assert (=> b!933679 (= e!524385 (and e!524384 mapRes!31884))))

(declare-fun condMapEmpty!31884 () Bool)

(declare-fun mapDefault!31884 () ValueCell!9560)

(assert (=> b!933679 (= condMapEmpty!31884 (= (arr!27020 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9560)) mapDefault!31884)))))

(declare-fun b!933680 () Bool)

(declare-fun e!524387 () Bool)

(assert (=> b!933680 (= e!524388 e!524387)))

(declare-fun res!628577 () Bool)

(assert (=> b!933680 (=> (not res!628577) (not e!524387))))

(assert (=> b!933680 (= res!628577 (contains!5036 lt!420426 k0!1099))))

(assert (=> b!933680 (= lt!420426 (getCurrentListMap!3213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933681 () Bool)

(declare-fun res!628575 () Bool)

(assert (=> b!933681 (=> (not res!628575) (not e!524388))))

(assert (=> b!933681 (= res!628575 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27479 _keys!1487))))))

(declare-fun b!933683 () Bool)

(assert (=> b!933683 (= e!524386 tp_is_empty!20083)))

(declare-fun b!933684 () Bool)

(declare-fun res!628576 () Bool)

(assert (=> b!933684 (=> (not res!628576) (not e!524387))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933684 (= res!628576 (validKeyInArray!0 k0!1099))))

(declare-fun b!933685 () Bool)

(declare-fun res!628578 () Bool)

(assert (=> b!933685 (=> (not res!628578) (not e!524388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56159 (_ BitVec 32)) Bool)

(assert (=> b!933685 (= res!628578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!628569 () Bool)

(assert (=> start!79556 (=> (not res!628569) (not e!524388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79556 (= res!628569 (validMask!0 mask!1881))))

(assert (=> start!79556 e!524388))

(assert (=> start!79556 true))

(assert (=> start!79556 tp_is_empty!20083))

(declare-fun array_inv!21118 (array!56161) Bool)

(assert (=> start!79556 (and (array_inv!21118 _values!1231) e!524385)))

(assert (=> start!79556 tp!61169))

(declare-fun array_inv!21119 (array!56159) Bool)

(assert (=> start!79556 (array_inv!21119 _keys!1487)))

(declare-fun b!933682 () Bool)

(assert (=> b!933682 (= e!524387 e!524383)))

(declare-fun res!628573 () Bool)

(assert (=> b!933682 (=> (not res!628573) (not e!524383))))

(assert (=> b!933682 (= res!628573 (validKeyInArray!0 lt!420422))))

(assert (=> b!933682 (= lt!420422 (select (arr!27019 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapIsEmpty!31884 () Bool)

(assert (=> mapIsEmpty!31884 mapRes!31884))

(declare-fun b!933686 () Bool)

(declare-fun res!628571 () Bool)

(assert (=> b!933686 (=> (not res!628571) (not e!524387))))

(declare-fun v!791 () V!31743)

(declare-fun apply!799 (ListLongMap!11911 (_ BitVec 64)) V!31743)

(assert (=> b!933686 (= res!628571 (= (apply!799 lt!420426 k0!1099) v!791))))

(declare-fun b!933687 () Bool)

(declare-fun res!628574 () Bool)

(assert (=> b!933687 (=> (not res!628574) (not e!524388))))

(assert (=> b!933687 (= res!628574 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18992))))

(declare-fun b!933688 () Bool)

(declare-fun res!628570 () Bool)

(assert (=> b!933688 (=> (not res!628570) (not e!524387))))

(assert (=> b!933688 (= res!628570 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!79556 res!628569) b!933678))

(assert (= (and b!933678 res!628572) b!933685))

(assert (= (and b!933685 res!628578) b!933687))

(assert (= (and b!933687 res!628574) b!933681))

(assert (= (and b!933681 res!628575) b!933680))

(assert (= (and b!933680 res!628577) b!933686))

(assert (= (and b!933686 res!628571) b!933688))

(assert (= (and b!933688 res!628570) b!933684))

(assert (= (and b!933684 res!628576) b!933682))

(assert (= (and b!933682 res!628573) b!933677))

(assert (= (and b!933679 condMapEmpty!31884) mapIsEmpty!31884))

(assert (= (and b!933679 (not condMapEmpty!31884)) mapNonEmpty!31884))

(get-info :version)

(assert (= (and mapNonEmpty!31884 ((_ is ValueCellFull!9560) mapValue!31884)) b!933683))

(assert (= (and b!933679 ((_ is ValueCellFull!9560) mapDefault!31884)) b!933676))

(assert (= start!79556 b!933679))

(declare-fun b_lambda!13923 () Bool)

(assert (=> (not b_lambda!13923) (not b!933677)))

(declare-fun t!27105 () Bool)

(declare-fun tb!5961 () Bool)

(assert (=> (and start!79556 (= defaultEntry!1235 defaultEntry!1235) t!27105) tb!5961))

(declare-fun result!11755 () Bool)

(assert (=> tb!5961 (= result!11755 tp_is_empty!20083)))

(assert (=> b!933677 t!27105))

(declare-fun b_and!28721 () Bool)

(assert (= b_and!28719 (and (=> t!27105 result!11755) b_and!28721)))

(declare-fun m!868085 () Bool)

(assert (=> mapNonEmpty!31884 m!868085))

(declare-fun m!868087 () Bool)

(assert (=> b!933686 m!868087))

(declare-fun m!868089 () Bool)

(assert (=> b!933684 m!868089))

(declare-fun m!868091 () Bool)

(assert (=> b!933680 m!868091))

(declare-fun m!868093 () Bool)

(assert (=> b!933680 m!868093))

(declare-fun m!868095 () Bool)

(assert (=> b!933682 m!868095))

(declare-fun m!868097 () Bool)

(assert (=> b!933682 m!868097))

(declare-fun m!868099 () Bool)

(assert (=> b!933677 m!868099))

(declare-fun m!868101 () Bool)

(assert (=> b!933677 m!868101))

(declare-fun m!868103 () Bool)

(assert (=> b!933677 m!868103))

(declare-fun m!868105 () Bool)

(assert (=> b!933677 m!868105))

(declare-fun m!868107 () Bool)

(assert (=> b!933677 m!868107))

(declare-fun m!868109 () Bool)

(assert (=> b!933677 m!868109))

(assert (=> b!933677 m!868107))

(assert (=> b!933677 m!868109))

(declare-fun m!868111 () Bool)

(assert (=> b!933677 m!868111))

(declare-fun m!868113 () Bool)

(assert (=> b!933677 m!868113))

(assert (=> b!933677 m!868099))

(declare-fun m!868115 () Bool)

(assert (=> b!933677 m!868115))

(declare-fun m!868117 () Bool)

(assert (=> b!933677 m!868117))

(declare-fun m!868119 () Bool)

(assert (=> b!933677 m!868119))

(assert (=> b!933677 m!868103))

(declare-fun m!868121 () Bool)

(assert (=> b!933677 m!868121))

(declare-fun m!868123 () Bool)

(assert (=> b!933685 m!868123))

(declare-fun m!868125 () Bool)

(assert (=> start!79556 m!868125))

(declare-fun m!868127 () Bool)

(assert (=> start!79556 m!868127))

(declare-fun m!868129 () Bool)

(assert (=> start!79556 m!868129))

(declare-fun m!868131 () Bool)

(assert (=> b!933687 m!868131))

(check-sat tp_is_empty!20083 (not b!933677) (not b_next!17575) (not b_lambda!13923) (not b!933687) (not mapNonEmpty!31884) (not b!933680) (not b!933685) b_and!28721 (not b!933684) (not b!933686) (not b!933682) (not start!79556))
(check-sat b_and!28721 (not b_next!17575))
