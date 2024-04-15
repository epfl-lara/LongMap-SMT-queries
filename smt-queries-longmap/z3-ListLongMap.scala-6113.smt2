; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78768 () Bool)

(assert start!78768)

(declare-fun b_free!16999 () Bool)

(declare-fun b_next!16999 () Bool)

(assert (=> start!78768 (= b_free!16999 (not b_next!16999))))

(declare-fun tp!59438 () Bool)

(declare-fun b_and!27709 () Bool)

(assert (=> start!78768 (= tp!59438 b_and!27709)))

(declare-fun b!919321 () Bool)

(declare-fun res!619943 () Bool)

(declare-fun e!516004 () Bool)

(assert (=> b!919321 (=> (not res!619943) (not e!516004))))

(declare-datatypes ((array!54975 0))(
  ( (array!54976 (arr!26433 (Array (_ BitVec 32) (_ BitVec 64))) (size!26894 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54975)

(declare-datatypes ((List!18579 0))(
  ( (Nil!18576) (Cons!18575 (h!19721 (_ BitVec 64)) (t!26299 List!18579)) )
))
(declare-fun arrayNoDuplicates!0 (array!54975 (_ BitVec 32) List!18579) Bool)

(assert (=> b!919321 (= res!619943 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18576))))

(declare-fun mapIsEmpty!31017 () Bool)

(declare-fun mapRes!31017 () Bool)

(assert (=> mapIsEmpty!31017 mapRes!31017))

(declare-fun b!919322 () Bool)

(declare-fun res!619947 () Bool)

(assert (=> b!919322 (=> (not res!619947) (not e!516004))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!30975 0))(
  ( (V!30976 (val!9804 Int)) )
))
(declare-datatypes ((ValueCell!9272 0))(
  ( (ValueCellFull!9272 (v!12321 V!30975)) (EmptyCell!9272) )
))
(declare-datatypes ((array!54977 0))(
  ( (array!54978 (arr!26434 (Array (_ BitVec 32) ValueCell!9272)) (size!26895 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54977)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!919322 (= res!619947 (and (= (size!26895 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26894 _keys!1487) (size!26895 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919323 () Bool)

(declare-fun e!516005 () Bool)

(declare-fun e!516003 () Bool)

(assert (=> b!919323 (= e!516005 e!516003)))

(declare-fun res!619945 () Bool)

(assert (=> b!919323 (=> (not res!619945) (not e!516003))))

(declare-fun lt!412529 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919323 (= res!619945 (validKeyInArray!0 lt!412529))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919323 (= lt!412529 (select (arr!26433 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919324 () Bool)

(declare-fun e!516001 () Bool)

(declare-fun tp_is_empty!19507 () Bool)

(assert (=> b!919324 (= e!516001 tp_is_empty!19507)))

(declare-fun b!919325 () Bool)

(assert (=> b!919325 (= e!516004 e!516005)))

(declare-fun res!619949 () Bool)

(assert (=> b!919325 (=> (not res!619949) (not e!516005))))

(declare-datatypes ((tuple2!12794 0))(
  ( (tuple2!12795 (_1!6408 (_ BitVec 64)) (_2!6408 V!30975)) )
))
(declare-datatypes ((List!18580 0))(
  ( (Nil!18577) (Cons!18576 (h!19722 tuple2!12794) (t!26300 List!18580)) )
))
(declare-datatypes ((ListLongMap!11481 0))(
  ( (ListLongMap!11482 (toList!5756 List!18580)) )
))
(declare-fun lt!412531 () ListLongMap!11481)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4755 (ListLongMap!11481 (_ BitVec 64)) Bool)

(assert (=> b!919325 (= res!619949 (contains!4755 lt!412531 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30975)

(declare-fun minValue!1173 () V!30975)

(declare-fun getCurrentListMap!2947 (array!54975 array!54977 (_ BitVec 32) (_ BitVec 32) V!30975 V!30975 (_ BitVec 32) Int) ListLongMap!11481)

(assert (=> b!919325 (= lt!412531 (getCurrentListMap!2947 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31017 () Bool)

(declare-fun tp!59439 () Bool)

(declare-fun e!516006 () Bool)

(assert (=> mapNonEmpty!31017 (= mapRes!31017 (and tp!59439 e!516006))))

(declare-fun mapKey!31017 () (_ BitVec 32))

(declare-fun mapRest!31017 () (Array (_ BitVec 32) ValueCell!9272))

(declare-fun mapValue!31017 () ValueCell!9272)

(assert (=> mapNonEmpty!31017 (= (arr!26434 _values!1231) (store mapRest!31017 mapKey!31017 mapValue!31017))))

(declare-fun b!919320 () Bool)

(assert (=> b!919320 (= e!516006 tp_is_empty!19507)))

(declare-fun res!619944 () Bool)

(assert (=> start!78768 (=> (not res!619944) (not e!516004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78768 (= res!619944 (validMask!0 mask!1881))))

(assert (=> start!78768 e!516004))

(assert (=> start!78768 true))

(assert (=> start!78768 tp_is_empty!19507))

(declare-fun e!516002 () Bool)

(declare-fun array_inv!20684 (array!54977) Bool)

(assert (=> start!78768 (and (array_inv!20684 _values!1231) e!516002)))

(assert (=> start!78768 tp!59438))

(declare-fun array_inv!20685 (array!54975) Bool)

(assert (=> start!78768 (array_inv!20685 _keys!1487)))

(declare-fun b!919326 () Bool)

(declare-fun res!619946 () Bool)

(assert (=> b!919326 (=> (not res!619946) (not e!516004))))

(assert (=> b!919326 (= res!619946 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26894 _keys!1487))))))

(declare-fun b!919327 () Bool)

(assert (=> b!919327 (= e!516002 (and e!516001 mapRes!31017))))

(declare-fun condMapEmpty!31017 () Bool)

(declare-fun mapDefault!31017 () ValueCell!9272)

(assert (=> b!919327 (= condMapEmpty!31017 (= (arr!26434 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9272)) mapDefault!31017)))))

(declare-fun b!919328 () Bool)

(declare-fun res!619942 () Bool)

(assert (=> b!919328 (=> (not res!619942) (not e!516005))))

(declare-fun v!791 () V!30975)

(declare-fun apply!584 (ListLongMap!11481 (_ BitVec 64)) V!30975)

(assert (=> b!919328 (= res!619942 (= (apply!584 lt!412531 k0!1099) v!791))))

(declare-fun b!919329 () Bool)

(declare-fun res!619940 () Bool)

(assert (=> b!919329 (=> (not res!619940) (not e!516005))))

(assert (=> b!919329 (= res!619940 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919330 () Bool)

(declare-fun res!619941 () Bool)

(assert (=> b!919330 (=> (not res!619941) (not e!516004))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54975 (_ BitVec 32)) Bool)

(assert (=> b!919330 (= res!619941 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919331 () Bool)

(assert (=> b!919331 (= e!516003 (not true))))

(assert (=> b!919331 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18576)))

(declare-datatypes ((Unit!30956 0))(
  ( (Unit!30957) )
))
(declare-fun lt!412530 () Unit!30956)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54975 (_ BitVec 32) (_ BitVec 32)) Unit!30956)

(assert (=> b!919331 (= lt!412530 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412535 () tuple2!12794)

(declare-fun +!2672 (ListLongMap!11481 tuple2!12794) ListLongMap!11481)

(assert (=> b!919331 (contains!4755 (+!2672 lt!412531 lt!412535) k0!1099)))

(declare-fun lt!412533 () V!30975)

(declare-fun lt!412534 () Unit!30956)

(declare-fun addStillContains!369 (ListLongMap!11481 (_ BitVec 64) V!30975 (_ BitVec 64)) Unit!30956)

(assert (=> b!919331 (= lt!412534 (addStillContains!369 lt!412531 lt!412529 lt!412533 k0!1099))))

(assert (=> b!919331 (= (getCurrentListMap!2947 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2672 (getCurrentListMap!2947 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412535))))

(assert (=> b!919331 (= lt!412535 (tuple2!12795 lt!412529 lt!412533))))

(declare-fun get!13867 (ValueCell!9272 V!30975) V!30975)

(declare-fun dynLambda!1428 (Int (_ BitVec 64)) V!30975)

(assert (=> b!919331 (= lt!412533 (get!13867 (select (arr!26434 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1428 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412532 () Unit!30956)

(declare-fun lemmaListMapRecursiveValidKeyArray!36 (array!54975 array!54977 (_ BitVec 32) (_ BitVec 32) V!30975 V!30975 (_ BitVec 32) Int) Unit!30956)

(assert (=> b!919331 (= lt!412532 (lemmaListMapRecursiveValidKeyArray!36 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919332 () Bool)

(declare-fun res!619948 () Bool)

(assert (=> b!919332 (=> (not res!619948) (not e!516005))))

(assert (=> b!919332 (= res!619948 (validKeyInArray!0 k0!1099))))

(assert (= (and start!78768 res!619944) b!919322))

(assert (= (and b!919322 res!619947) b!919330))

(assert (= (and b!919330 res!619941) b!919321))

(assert (= (and b!919321 res!619943) b!919326))

(assert (= (and b!919326 res!619946) b!919325))

(assert (= (and b!919325 res!619949) b!919328))

(assert (= (and b!919328 res!619942) b!919329))

(assert (= (and b!919329 res!619940) b!919332))

(assert (= (and b!919332 res!619948) b!919323))

(assert (= (and b!919323 res!619945) b!919331))

(assert (= (and b!919327 condMapEmpty!31017) mapIsEmpty!31017))

(assert (= (and b!919327 (not condMapEmpty!31017)) mapNonEmpty!31017))

(get-info :version)

(assert (= (and mapNonEmpty!31017 ((_ is ValueCellFull!9272) mapValue!31017)) b!919320))

(assert (= (and b!919327 ((_ is ValueCellFull!9272) mapDefault!31017)) b!919324))

(assert (= start!78768 b!919327))

(declare-fun b_lambda!13483 () Bool)

(assert (=> (not b_lambda!13483) (not b!919331)))

(declare-fun t!26298 () Bool)

(declare-fun tb!5571 () Bool)

(assert (=> (and start!78768 (= defaultEntry!1235 defaultEntry!1235) t!26298) tb!5571))

(declare-fun result!10973 () Bool)

(assert (=> tb!5571 (= result!10973 tp_is_empty!19507)))

(assert (=> b!919331 t!26298))

(declare-fun b_and!27711 () Bool)

(assert (= b_and!27709 (and (=> t!26298 result!10973) b_and!27711)))

(declare-fun m!852601 () Bool)

(assert (=> start!78768 m!852601))

(declare-fun m!852603 () Bool)

(assert (=> start!78768 m!852603))

(declare-fun m!852605 () Bool)

(assert (=> start!78768 m!852605))

(declare-fun m!852607 () Bool)

(assert (=> b!919321 m!852607))

(declare-fun m!852609 () Bool)

(assert (=> b!919332 m!852609))

(declare-fun m!852611 () Bool)

(assert (=> b!919328 m!852611))

(declare-fun m!852613 () Bool)

(assert (=> b!919325 m!852613))

(declare-fun m!852615 () Bool)

(assert (=> b!919325 m!852615))

(declare-fun m!852617 () Bool)

(assert (=> b!919331 m!852617))

(declare-fun m!852619 () Bool)

(assert (=> b!919331 m!852619))

(declare-fun m!852621 () Bool)

(assert (=> b!919331 m!852621))

(declare-fun m!852623 () Bool)

(assert (=> b!919331 m!852623))

(declare-fun m!852625 () Bool)

(assert (=> b!919331 m!852625))

(assert (=> b!919331 m!852619))

(assert (=> b!919331 m!852625))

(declare-fun m!852627 () Bool)

(assert (=> b!919331 m!852627))

(declare-fun m!852629 () Bool)

(assert (=> b!919331 m!852629))

(assert (=> b!919331 m!852617))

(declare-fun m!852631 () Bool)

(assert (=> b!919331 m!852631))

(declare-fun m!852633 () Bool)

(assert (=> b!919331 m!852633))

(assert (=> b!919331 m!852621))

(declare-fun m!852635 () Bool)

(assert (=> b!919331 m!852635))

(declare-fun m!852637 () Bool)

(assert (=> b!919331 m!852637))

(declare-fun m!852639 () Bool)

(assert (=> b!919331 m!852639))

(declare-fun m!852641 () Bool)

(assert (=> mapNonEmpty!31017 m!852641))

(declare-fun m!852643 () Bool)

(assert (=> b!919330 m!852643))

(declare-fun m!852645 () Bool)

(assert (=> b!919323 m!852645))

(declare-fun m!852647 () Bool)

(assert (=> b!919323 m!852647))

(check-sat (not b!919331) (not b!919328) b_and!27711 (not start!78768) (not b_lambda!13483) (not b!919323) tp_is_empty!19507 (not b!919321) (not b!919332) (not b!919325) (not b!919330) (not b_next!16999) (not mapNonEmpty!31017))
(check-sat b_and!27711 (not b_next!16999))
