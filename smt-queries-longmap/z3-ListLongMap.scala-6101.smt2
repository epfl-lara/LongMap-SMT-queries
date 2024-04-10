; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78716 () Bool)

(assert start!78716)

(declare-fun b_free!16929 () Bool)

(declare-fun b_next!16929 () Bool)

(assert (=> start!78716 (= b_free!16929 (not b_next!16929))))

(declare-fun tp!59228 () Bool)

(declare-fun b_and!27595 () Bool)

(assert (=> start!78716 (= tp!59228 b_and!27595)))

(declare-fun b!918124 () Bool)

(declare-fun res!619003 () Bool)

(declare-fun e!515419 () Bool)

(assert (=> b!918124 (=> (not res!619003) (not e!515419))))

(declare-datatypes ((array!54858 0))(
  ( (array!54859 (arr!26374 (Array (_ BitVec 32) (_ BitVec 64))) (size!26833 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54858)

(declare-datatypes ((List!18498 0))(
  ( (Nil!18495) (Cons!18494 (h!19640 (_ BitVec 64)) (t!26157 List!18498)) )
))
(declare-fun arrayNoDuplicates!0 (array!54858 (_ BitVec 32) List!18498) Bool)

(assert (=> b!918124 (= res!619003 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18495))))

(declare-fun b!918125 () Bool)

(declare-fun res!619009 () Bool)

(assert (=> b!918125 (=> (not res!619009) (not e!515419))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918125 (= res!619009 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26833 _keys!1487))))))

(declare-fun b!918126 () Bool)

(declare-fun e!515417 () Bool)

(declare-fun tp_is_empty!19437 () Bool)

(assert (=> b!918126 (= e!515417 tp_is_empty!19437)))

(declare-fun b!918127 () Bool)

(declare-fun res!619008 () Bool)

(declare-fun e!515414 () Bool)

(assert (=> b!918127 (=> (not res!619008) (not e!515414))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30881 0))(
  ( (V!30882 (val!9769 Int)) )
))
(declare-fun v!791 () V!30881)

(declare-datatypes ((tuple2!12692 0))(
  ( (tuple2!12693 (_1!6357 (_ BitVec 64)) (_2!6357 V!30881)) )
))
(declare-datatypes ((List!18499 0))(
  ( (Nil!18496) (Cons!18495 (h!19641 tuple2!12692) (t!26158 List!18499)) )
))
(declare-datatypes ((ListLongMap!11389 0))(
  ( (ListLongMap!11390 (toList!5710 List!18499)) )
))
(declare-fun lt!412164 () ListLongMap!11389)

(declare-fun apply!560 (ListLongMap!11389 (_ BitVec 64)) V!30881)

(assert (=> b!918127 (= res!619008 (= (apply!560 lt!412164 k0!1099) v!791))))

(declare-fun b!918128 () Bool)

(declare-fun e!515418 () Bool)

(assert (=> b!918128 (= e!515414 e!515418)))

(declare-fun res!619006 () Bool)

(assert (=> b!918128 (=> (not res!619006) (not e!515418))))

(declare-fun lt!412165 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918128 (= res!619006 (validKeyInArray!0 lt!412165))))

(assert (=> b!918128 (= lt!412165 (select (arr!26374 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun mapNonEmpty!30912 () Bool)

(declare-fun mapRes!30912 () Bool)

(declare-fun tp!59227 () Bool)

(declare-fun e!515416 () Bool)

(assert (=> mapNonEmpty!30912 (= mapRes!30912 (and tp!59227 e!515416))))

(declare-datatypes ((ValueCell!9237 0))(
  ( (ValueCellFull!9237 (v!12287 V!30881)) (EmptyCell!9237) )
))
(declare-fun mapRest!30912 () (Array (_ BitVec 32) ValueCell!9237))

(declare-fun mapValue!30912 () ValueCell!9237)

(declare-datatypes ((array!54860 0))(
  ( (array!54861 (arr!26375 (Array (_ BitVec 32) ValueCell!9237)) (size!26834 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54860)

(declare-fun mapKey!30912 () (_ BitVec 32))

(assert (=> mapNonEmpty!30912 (= (arr!26375 _values!1231) (store mapRest!30912 mapKey!30912 mapValue!30912))))

(declare-fun res!619001 () Bool)

(assert (=> start!78716 (=> (not res!619001) (not e!515419))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78716 (= res!619001 (validMask!0 mask!1881))))

(assert (=> start!78716 e!515419))

(assert (=> start!78716 true))

(assert (=> start!78716 tp_is_empty!19437))

(declare-fun e!515415 () Bool)

(declare-fun array_inv!20564 (array!54860) Bool)

(assert (=> start!78716 (and (array_inv!20564 _values!1231) e!515415)))

(assert (=> start!78716 tp!59228))

(declare-fun array_inv!20565 (array!54858) Bool)

(assert (=> start!78716 (array_inv!20565 _keys!1487)))

(declare-fun b!918129 () Bool)

(assert (=> b!918129 (= e!515415 (and e!515417 mapRes!30912))))

(declare-fun condMapEmpty!30912 () Bool)

(declare-fun mapDefault!30912 () ValueCell!9237)

(assert (=> b!918129 (= condMapEmpty!30912 (= (arr!26375 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9237)) mapDefault!30912)))))

(declare-fun b!918130 () Bool)

(assert (=> b!918130 (= e!515419 e!515414)))

(declare-fun res!619000 () Bool)

(assert (=> b!918130 (=> (not res!619000) (not e!515414))))

(declare-fun contains!4759 (ListLongMap!11389 (_ BitVec 64)) Bool)

(assert (=> b!918130 (= res!619000 (contains!4759 lt!412164 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30881)

(declare-fun minValue!1173 () V!30881)

(declare-fun getCurrentListMap!2967 (array!54858 array!54860 (_ BitVec 32) (_ BitVec 32) V!30881 V!30881 (_ BitVec 32) Int) ListLongMap!11389)

(assert (=> b!918130 (= lt!412164 (getCurrentListMap!2967 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!30912 () Bool)

(assert (=> mapIsEmpty!30912 mapRes!30912))

(declare-fun b!918131 () Bool)

(declare-fun res!619007 () Bool)

(assert (=> b!918131 (=> (not res!619007) (not e!515414))))

(assert (=> b!918131 (= res!619007 (validKeyInArray!0 k0!1099))))

(declare-fun b!918132 () Bool)

(assert (=> b!918132 (= e!515418 (not true))))

(declare-fun +!2623 (ListLongMap!11389 tuple2!12692) ListLongMap!11389)

(declare-fun get!13822 (ValueCell!9237 V!30881) V!30881)

(declare-fun dynLambda!1412 (Int (_ BitVec 64)) V!30881)

(assert (=> b!918132 (= (getCurrentListMap!2967 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2623 (getCurrentListMap!2967 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12693 lt!412165 (get!13822 (select (arr!26375 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1412 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30994 0))(
  ( (Unit!30995) )
))
(declare-fun lt!412163 () Unit!30994)

(declare-fun lemmaListMapRecursiveValidKeyArray!13 (array!54858 array!54860 (_ BitVec 32) (_ BitVec 32) V!30881 V!30881 (_ BitVec 32) Int) Unit!30994)

(assert (=> b!918132 (= lt!412163 (lemmaListMapRecursiveValidKeyArray!13 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!918133 () Bool)

(assert (=> b!918133 (= e!515416 tp_is_empty!19437)))

(declare-fun b!918134 () Bool)

(declare-fun res!619004 () Bool)

(assert (=> b!918134 (=> (not res!619004) (not e!515419))))

(assert (=> b!918134 (= res!619004 (and (= (size!26834 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26833 _keys!1487) (size!26834 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918135 () Bool)

(declare-fun res!619005 () Bool)

(assert (=> b!918135 (=> (not res!619005) (not e!515414))))

(assert (=> b!918135 (= res!619005 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918136 () Bool)

(declare-fun res!619002 () Bool)

(assert (=> b!918136 (=> (not res!619002) (not e!515419))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54858 (_ BitVec 32)) Bool)

(assert (=> b!918136 (= res!619002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!78716 res!619001) b!918134))

(assert (= (and b!918134 res!619004) b!918136))

(assert (= (and b!918136 res!619002) b!918124))

(assert (= (and b!918124 res!619003) b!918125))

(assert (= (and b!918125 res!619009) b!918130))

(assert (= (and b!918130 res!619000) b!918127))

(assert (= (and b!918127 res!619008) b!918135))

(assert (= (and b!918135 res!619005) b!918131))

(assert (= (and b!918131 res!619007) b!918128))

(assert (= (and b!918128 res!619006) b!918132))

(assert (= (and b!918129 condMapEmpty!30912) mapIsEmpty!30912))

(assert (= (and b!918129 (not condMapEmpty!30912)) mapNonEmpty!30912))

(get-info :version)

(assert (= (and mapNonEmpty!30912 ((_ is ValueCellFull!9237) mapValue!30912)) b!918133))

(assert (= (and b!918129 ((_ is ValueCellFull!9237) mapDefault!30912)) b!918126))

(assert (= start!78716 b!918129))

(declare-fun b_lambda!13431 () Bool)

(assert (=> (not b_lambda!13431) (not b!918132)))

(declare-fun t!26156 () Bool)

(declare-fun tb!5509 () Bool)

(assert (=> (and start!78716 (= defaultEntry!1235 defaultEntry!1235) t!26156) tb!5509))

(declare-fun result!10841 () Bool)

(assert (=> tb!5509 (= result!10841 tp_is_empty!19437)))

(assert (=> b!918132 t!26156))

(declare-fun b_and!27597 () Bool)

(assert (= b_and!27595 (and (=> t!26156 result!10841) b_and!27597)))

(declare-fun m!851819 () Bool)

(assert (=> b!918128 m!851819))

(declare-fun m!851821 () Bool)

(assert (=> b!918128 m!851821))

(declare-fun m!851823 () Bool)

(assert (=> b!918132 m!851823))

(declare-fun m!851825 () Bool)

(assert (=> b!918132 m!851825))

(declare-fun m!851827 () Bool)

(assert (=> b!918132 m!851827))

(declare-fun m!851829 () Bool)

(assert (=> b!918132 m!851829))

(assert (=> b!918132 m!851827))

(assert (=> b!918132 m!851829))

(declare-fun m!851831 () Bool)

(assert (=> b!918132 m!851831))

(declare-fun m!851833 () Bool)

(assert (=> b!918132 m!851833))

(assert (=> b!918132 m!851823))

(declare-fun m!851835 () Bool)

(assert (=> b!918132 m!851835))

(declare-fun m!851837 () Bool)

(assert (=> b!918136 m!851837))

(declare-fun m!851839 () Bool)

(assert (=> b!918131 m!851839))

(declare-fun m!851841 () Bool)

(assert (=> b!918127 m!851841))

(declare-fun m!851843 () Bool)

(assert (=> mapNonEmpty!30912 m!851843))

(declare-fun m!851845 () Bool)

(assert (=> b!918130 m!851845))

(declare-fun m!851847 () Bool)

(assert (=> b!918130 m!851847))

(declare-fun m!851849 () Bool)

(assert (=> b!918124 m!851849))

(declare-fun m!851851 () Bool)

(assert (=> start!78716 m!851851))

(declare-fun m!851853 () Bool)

(assert (=> start!78716 m!851853))

(declare-fun m!851855 () Bool)

(assert (=> start!78716 m!851855))

(check-sat (not b!918136) (not b!918130) (not b!918132) (not b_lambda!13431) b_and!27597 (not b!918127) (not start!78716) tp_is_empty!19437 (not b!918124) (not mapNonEmpty!30912) (not b_next!16929) (not b!918128) (not b!918131))
(check-sat b_and!27597 (not b_next!16929))
