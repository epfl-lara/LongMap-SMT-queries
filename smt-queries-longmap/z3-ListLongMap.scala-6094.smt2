; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78840 () Bool)

(assert start!78840)

(declare-fun b_free!16885 () Bool)

(declare-fun b_next!16885 () Bool)

(assert (=> start!78840 (= b_free!16885 (not b_next!16885))))

(declare-fun tp!59097 () Bool)

(declare-fun b_and!27517 () Bool)

(assert (=> start!78840 (= tp!59097 b_and!27517)))

(declare-fun b!918125 () Bool)

(declare-fun e!515537 () Bool)

(declare-fun e!515538 () Bool)

(declare-fun mapRes!30846 () Bool)

(assert (=> b!918125 (= e!515537 (and e!515538 mapRes!30846))))

(declare-fun condMapEmpty!30846 () Bool)

(declare-datatypes ((V!30823 0))(
  ( (V!30824 (val!9747 Int)) )
))
(declare-datatypes ((ValueCell!9215 0))(
  ( (ValueCellFull!9215 (v!12262 V!30823)) (EmptyCell!9215) )
))
(declare-datatypes ((array!54819 0))(
  ( (array!54820 (arr!26350 (Array (_ BitVec 32) ValueCell!9215)) (size!26810 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54819)

(declare-fun mapDefault!30846 () ValueCell!9215)

(assert (=> b!918125 (= condMapEmpty!30846 (= (arr!26350 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9215)) mapDefault!30846)))))

(declare-fun mapNonEmpty!30846 () Bool)

(declare-fun tp!59096 () Bool)

(declare-fun e!515533 () Bool)

(assert (=> mapNonEmpty!30846 (= mapRes!30846 (and tp!59096 e!515533))))

(declare-fun mapValue!30846 () ValueCell!9215)

(declare-fun mapKey!30846 () (_ BitVec 32))

(declare-fun mapRest!30846 () (Array (_ BitVec 32) ValueCell!9215))

(assert (=> mapNonEmpty!30846 (= (arr!26350 _values!1231) (store mapRest!30846 mapKey!30846 mapValue!30846))))

(declare-fun res!618689 () Bool)

(declare-fun e!515535 () Bool)

(assert (=> start!78840 (=> (not res!618689) (not e!515535))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78840 (= res!618689 (validMask!0 mask!1881))))

(assert (=> start!78840 e!515535))

(assert (=> start!78840 true))

(declare-fun tp_is_empty!19393 () Bool)

(assert (=> start!78840 tp_is_empty!19393))

(declare-fun array_inv!20650 (array!54819) Bool)

(assert (=> start!78840 (and (array_inv!20650 _values!1231) e!515537)))

(assert (=> start!78840 tp!59097))

(declare-datatypes ((array!54821 0))(
  ( (array!54822 (arr!26351 (Array (_ BitVec 32) (_ BitVec 64))) (size!26811 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54821)

(declare-fun array_inv!20651 (array!54821) Bool)

(assert (=> start!78840 (array_inv!20651 _keys!1487)))

(declare-fun b!918126 () Bool)

(assert (=> b!918126 (= e!515538 tp_is_empty!19393)))

(declare-fun b!918127 () Bool)

(declare-fun res!618693 () Bool)

(declare-fun e!515536 () Bool)

(assert (=> b!918127 (=> (not res!618693) (not e!515536))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918127 (= res!618693 (validKeyInArray!0 k0!1099))))

(declare-fun b!918128 () Bool)

(declare-fun res!618692 () Bool)

(assert (=> b!918128 (=> (not res!618692) (not e!515535))))

(declare-datatypes ((List!18443 0))(
  ( (Nil!18440) (Cons!18439 (h!19591 (_ BitVec 64)) (t!26050 List!18443)) )
))
(declare-fun arrayNoDuplicates!0 (array!54821 (_ BitVec 32) List!18443) Bool)

(assert (=> b!918128 (= res!618692 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18440))))

(declare-fun b!918129 () Bool)

(declare-fun res!618687 () Bool)

(assert (=> b!918129 (=> (not res!618687) (not e!515535))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!918129 (= res!618687 (and (= (size!26810 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26811 _keys!1487) (size!26810 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918130 () Bool)

(assert (=> b!918130 (= e!515533 tp_is_empty!19393)))

(declare-fun mapIsEmpty!30846 () Bool)

(assert (=> mapIsEmpty!30846 mapRes!30846))

(declare-fun b!918131 () Bool)

(declare-fun res!618690 () Bool)

(assert (=> b!918131 (=> (not res!618690) (not e!515536))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918131 (= res!618690 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918132 () Bool)

(declare-fun e!515539 () Bool)

(assert (=> b!918132 (= e!515536 e!515539)))

(declare-fun res!618686 () Bool)

(assert (=> b!918132 (=> (not res!618686) (not e!515539))))

(declare-fun lt!412326 () (_ BitVec 64))

(assert (=> b!918132 (= res!618686 (validKeyInArray!0 lt!412326))))

(assert (=> b!918132 (= lt!412326 (select (arr!26351 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!918133 () Bool)

(declare-fun res!618688 () Bool)

(assert (=> b!918133 (=> (not res!618688) (not e!515535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54821 (_ BitVec 32)) Bool)

(assert (=> b!918133 (= res!618688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918134 () Bool)

(declare-fun res!618685 () Bool)

(assert (=> b!918134 (=> (not res!618685) (not e!515536))))

(declare-fun v!791 () V!30823)

(declare-datatypes ((tuple2!12620 0))(
  ( (tuple2!12621 (_1!6321 (_ BitVec 64)) (_2!6321 V!30823)) )
))
(declare-datatypes ((List!18444 0))(
  ( (Nil!18441) (Cons!18440 (h!19592 tuple2!12620) (t!26051 List!18444)) )
))
(declare-datatypes ((ListLongMap!11319 0))(
  ( (ListLongMap!11320 (toList!5675 List!18444)) )
))
(declare-fun lt!412327 () ListLongMap!11319)

(declare-fun apply!556 (ListLongMap!11319 (_ BitVec 64)) V!30823)

(assert (=> b!918134 (= res!618685 (= (apply!556 lt!412327 k0!1099) v!791))))

(declare-fun b!918135 () Bool)

(assert (=> b!918135 (= e!515539 (not true))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30823)

(declare-fun minValue!1173 () V!30823)

(declare-fun getCurrentListMap!2930 (array!54821 array!54819 (_ BitVec 32) (_ BitVec 32) V!30823 V!30823 (_ BitVec 32) Int) ListLongMap!11319)

(declare-fun +!2621 (ListLongMap!11319 tuple2!12620) ListLongMap!11319)

(declare-fun get!13818 (ValueCell!9215 V!30823) V!30823)

(declare-fun dynLambda!1418 (Int (_ BitVec 64)) V!30823)

(assert (=> b!918135 (= (getCurrentListMap!2930 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2621 (getCurrentListMap!2930 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12621 lt!412326 (get!13818 (select (arr!26350 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1418 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30954 0))(
  ( (Unit!30955) )
))
(declare-fun lt!412328 () Unit!30954)

(declare-fun lemmaListMapRecursiveValidKeyArray!1 (array!54821 array!54819 (_ BitVec 32) (_ BitVec 32) V!30823 V!30823 (_ BitVec 32) Int) Unit!30954)

(assert (=> b!918135 (= lt!412328 (lemmaListMapRecursiveValidKeyArray!1 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918136 () Bool)

(declare-fun res!618691 () Bool)

(assert (=> b!918136 (=> (not res!618691) (not e!515535))))

(assert (=> b!918136 (= res!618691 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26811 _keys!1487))))))

(declare-fun b!918137 () Bool)

(assert (=> b!918137 (= e!515535 e!515536)))

(declare-fun res!618684 () Bool)

(assert (=> b!918137 (=> (not res!618684) (not e!515536))))

(declare-fun contains!4733 (ListLongMap!11319 (_ BitVec 64)) Bool)

(assert (=> b!918137 (= res!618684 (contains!4733 lt!412327 k0!1099))))

(assert (=> b!918137 (= lt!412327 (getCurrentListMap!2930 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78840 res!618689) b!918129))

(assert (= (and b!918129 res!618687) b!918133))

(assert (= (and b!918133 res!618688) b!918128))

(assert (= (and b!918128 res!618692) b!918136))

(assert (= (and b!918136 res!618691) b!918137))

(assert (= (and b!918137 res!618684) b!918134))

(assert (= (and b!918134 res!618685) b!918131))

(assert (= (and b!918131 res!618690) b!918127))

(assert (= (and b!918127 res!618693) b!918132))

(assert (= (and b!918132 res!618686) b!918135))

(assert (= (and b!918125 condMapEmpty!30846) mapIsEmpty!30846))

(assert (= (and b!918125 (not condMapEmpty!30846)) mapNonEmpty!30846))

(get-info :version)

(assert (= (and mapNonEmpty!30846 ((_ is ValueCellFull!9215) mapValue!30846)) b!918130))

(assert (= (and b!918125 ((_ is ValueCellFull!9215) mapDefault!30846)) b!918126))

(assert (= start!78840 b!918125))

(declare-fun b_lambda!13401 () Bool)

(assert (=> (not b_lambda!13401) (not b!918135)))

(declare-fun t!26049 () Bool)

(declare-fun tb!5457 () Bool)

(assert (=> (and start!78840 (= defaultEntry!1235 defaultEntry!1235) t!26049) tb!5457))

(declare-fun result!10745 () Bool)

(assert (=> tb!5457 (= result!10745 tp_is_empty!19393)))

(assert (=> b!918135 t!26049))

(declare-fun b_and!27519 () Bool)

(assert (= b_and!27517 (and (=> t!26049 result!10745) b_and!27519)))

(declare-fun m!852277 () Bool)

(assert (=> b!918132 m!852277))

(declare-fun m!852279 () Bool)

(assert (=> b!918132 m!852279))

(declare-fun m!852281 () Bool)

(assert (=> b!918127 m!852281))

(declare-fun m!852283 () Bool)

(assert (=> b!918137 m!852283))

(declare-fun m!852285 () Bool)

(assert (=> b!918137 m!852285))

(declare-fun m!852287 () Bool)

(assert (=> b!918134 m!852287))

(declare-fun m!852289 () Bool)

(assert (=> mapNonEmpty!30846 m!852289))

(declare-fun m!852291 () Bool)

(assert (=> b!918128 m!852291))

(declare-fun m!852293 () Bool)

(assert (=> b!918133 m!852293))

(declare-fun m!852295 () Bool)

(assert (=> b!918135 m!852295))

(declare-fun m!852297 () Bool)

(assert (=> b!918135 m!852297))

(assert (=> b!918135 m!852295))

(assert (=> b!918135 m!852297))

(declare-fun m!852299 () Bool)

(assert (=> b!918135 m!852299))

(declare-fun m!852301 () Bool)

(assert (=> b!918135 m!852301))

(declare-fun m!852303 () Bool)

(assert (=> b!918135 m!852303))

(declare-fun m!852305 () Bool)

(assert (=> b!918135 m!852305))

(assert (=> b!918135 m!852303))

(declare-fun m!852307 () Bool)

(assert (=> b!918135 m!852307))

(declare-fun m!852309 () Bool)

(assert (=> start!78840 m!852309))

(declare-fun m!852311 () Bool)

(assert (=> start!78840 m!852311))

(declare-fun m!852313 () Bool)

(assert (=> start!78840 m!852313))

(check-sat (not b!918127) (not mapNonEmpty!30846) (not b!918128) (not b_lambda!13401) (not b!918135) (not b!918133) (not b!918132) b_and!27519 tp_is_empty!19393 (not start!78840) (not b_next!16885) (not b!918134) (not b!918137))
(check-sat b_and!27519 (not b_next!16885))
