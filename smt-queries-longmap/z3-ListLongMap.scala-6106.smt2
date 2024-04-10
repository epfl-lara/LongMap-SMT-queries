; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78746 () Bool)

(assert start!78746)

(declare-fun b_free!16959 () Bool)

(declare-fun b_next!16959 () Bool)

(assert (=> start!78746 (= b_free!16959 (not b_next!16959))))

(declare-fun tp!59318 () Bool)

(declare-fun b_and!27655 () Bool)

(assert (=> start!78746 (= tp!59318 b_and!27655)))

(declare-fun b!918739 () Bool)

(declare-fun res!619459 () Bool)

(declare-fun e!515729 () Bool)

(assert (=> b!918739 (=> (not res!619459) (not e!515729))))

(declare-datatypes ((array!54918 0))(
  ( (array!54919 (arr!26404 (Array (_ BitVec 32) (_ BitVec 64))) (size!26863 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54918)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54918 (_ BitVec 32)) Bool)

(assert (=> b!918739 (= res!619459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!918740 () Bool)

(declare-fun e!515732 () Bool)

(declare-fun tp_is_empty!19467 () Bool)

(assert (=> b!918740 (= e!515732 tp_is_empty!19467)))

(declare-fun b!918741 () Bool)

(declare-fun res!619450 () Bool)

(declare-fun e!515730 () Bool)

(assert (=> b!918741 (=> (not res!619450) (not e!515730))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30921 0))(
  ( (V!30922 (val!9784 Int)) )
))
(declare-datatypes ((tuple2!12714 0))(
  ( (tuple2!12715 (_1!6368 (_ BitVec 64)) (_2!6368 V!30921)) )
))
(declare-datatypes ((List!18519 0))(
  ( (Nil!18516) (Cons!18515 (h!19661 tuple2!12714) (t!26208 List!18519)) )
))
(declare-datatypes ((ListLongMap!11411 0))(
  ( (ListLongMap!11412 (toList!5721 List!18519)) )
))
(declare-fun lt!412370 () ListLongMap!11411)

(declare-fun v!791 () V!30921)

(declare-fun apply!567 (ListLongMap!11411 (_ BitVec 64)) V!30921)

(assert (=> b!918741 (= res!619450 (= (apply!567 lt!412370 k0!1099) v!791))))

(declare-fun b!918742 () Bool)

(declare-fun res!619452 () Bool)

(assert (=> b!918742 (=> (not res!619452) (not e!515729))))

(declare-datatypes ((List!18520 0))(
  ( (Nil!18517) (Cons!18516 (h!19662 (_ BitVec 64)) (t!26209 List!18520)) )
))
(declare-fun arrayNoDuplicates!0 (array!54918 (_ BitVec 32) List!18520) Bool)

(assert (=> b!918742 (= res!619452 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18517))))

(declare-fun b!918743 () Bool)

(declare-fun e!515731 () Bool)

(declare-fun mapRes!30957 () Bool)

(assert (=> b!918743 (= e!515731 (and e!515732 mapRes!30957))))

(declare-fun condMapEmpty!30957 () Bool)

(declare-datatypes ((ValueCell!9252 0))(
  ( (ValueCellFull!9252 (v!12302 V!30921)) (EmptyCell!9252) )
))
(declare-datatypes ((array!54920 0))(
  ( (array!54921 (arr!26405 (Array (_ BitVec 32) ValueCell!9252)) (size!26864 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54920)

(declare-fun mapDefault!30957 () ValueCell!9252)

(assert (=> b!918743 (= condMapEmpty!30957 (= (arr!26405 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9252)) mapDefault!30957)))))

(declare-fun b!918744 () Bool)

(declare-fun e!515728 () Bool)

(assert (=> b!918744 (= e!515728 tp_is_empty!19467)))

(declare-fun b!918745 () Bool)

(declare-fun res!619458 () Bool)

(assert (=> b!918745 (=> (not res!619458) (not e!515729))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!918745 (= res!619458 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26863 _keys!1487))))))

(declare-fun b!918746 () Bool)

(declare-fun e!515734 () Bool)

(assert (=> b!918746 (= e!515734 (not true))))

(declare-fun lt!412372 () tuple2!12714)

(declare-fun contains!4767 (ListLongMap!11411 (_ BitVec 64)) Bool)

(declare-fun +!2633 (ListLongMap!11411 tuple2!12714) ListLongMap!11411)

(assert (=> b!918746 (contains!4767 (+!2633 lt!412370 lt!412372) k0!1099)))

(declare-datatypes ((Unit!31014 0))(
  ( (Unit!31015) )
))
(declare-fun lt!412368 () Unit!31014)

(declare-fun lt!412367 () V!30921)

(declare-fun lt!412371 () (_ BitVec 64))

(declare-fun addStillContains!357 (ListLongMap!11411 (_ BitVec 64) V!30921 (_ BitVec 64)) Unit!31014)

(assert (=> b!918746 (= lt!412368 (addStillContains!357 lt!412370 lt!412371 lt!412367 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30921)

(declare-fun minValue!1173 () V!30921)

(declare-fun getCurrentListMap!2977 (array!54918 array!54920 (_ BitVec 32) (_ BitVec 32) V!30921 V!30921 (_ BitVec 32) Int) ListLongMap!11411)

(assert (=> b!918746 (= (getCurrentListMap!2977 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2633 (getCurrentListMap!2977 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412372))))

(assert (=> b!918746 (= lt!412372 (tuple2!12715 lt!412371 lt!412367))))

(declare-fun get!13842 (ValueCell!9252 V!30921) V!30921)

(declare-fun dynLambda!1422 (Int (_ BitVec 64)) V!30921)

(assert (=> b!918746 (= lt!412367 (get!13842 (select (arr!26405 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1422 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412369 () Unit!31014)

(declare-fun lemmaListMapRecursiveValidKeyArray!23 (array!54918 array!54920 (_ BitVec 32) (_ BitVec 32) V!30921 V!30921 (_ BitVec 32) Int) Unit!31014)

(assert (=> b!918746 (= lt!412369 (lemmaListMapRecursiveValidKeyArray!23 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!619455 () Bool)

(assert (=> start!78746 (=> (not res!619455) (not e!515729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78746 (= res!619455 (validMask!0 mask!1881))))

(assert (=> start!78746 e!515729))

(assert (=> start!78746 true))

(assert (=> start!78746 tp_is_empty!19467))

(declare-fun array_inv!20582 (array!54920) Bool)

(assert (=> start!78746 (and (array_inv!20582 _values!1231) e!515731)))

(assert (=> start!78746 tp!59318))

(declare-fun array_inv!20583 (array!54918) Bool)

(assert (=> start!78746 (array_inv!20583 _keys!1487)))

(declare-fun b!918747 () Bool)

(declare-fun res!619456 () Bool)

(assert (=> b!918747 (=> (not res!619456) (not e!515729))))

(assert (=> b!918747 (= res!619456 (and (= (size!26864 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26863 _keys!1487) (size!26864 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!918748 () Bool)

(declare-fun res!619457 () Bool)

(assert (=> b!918748 (=> (not res!619457) (not e!515730))))

(assert (=> b!918748 (= res!619457 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!918749 () Bool)

(declare-fun res!619454 () Bool)

(assert (=> b!918749 (=> (not res!619454) (not e!515730))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!918749 (= res!619454 (validKeyInArray!0 k0!1099))))

(declare-fun b!918750 () Bool)

(assert (=> b!918750 (= e!515729 e!515730)))

(declare-fun res!619453 () Bool)

(assert (=> b!918750 (=> (not res!619453) (not e!515730))))

(assert (=> b!918750 (= res!619453 (contains!4767 lt!412370 k0!1099))))

(assert (=> b!918750 (= lt!412370 (getCurrentListMap!2977 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30957 () Bool)

(declare-fun tp!59317 () Bool)

(assert (=> mapNonEmpty!30957 (= mapRes!30957 (and tp!59317 e!515728))))

(declare-fun mapValue!30957 () ValueCell!9252)

(declare-fun mapKey!30957 () (_ BitVec 32))

(declare-fun mapRest!30957 () (Array (_ BitVec 32) ValueCell!9252))

(assert (=> mapNonEmpty!30957 (= (arr!26405 _values!1231) (store mapRest!30957 mapKey!30957 mapValue!30957))))

(declare-fun mapIsEmpty!30957 () Bool)

(assert (=> mapIsEmpty!30957 mapRes!30957))

(declare-fun b!918751 () Bool)

(assert (=> b!918751 (= e!515730 e!515734)))

(declare-fun res!619451 () Bool)

(assert (=> b!918751 (=> (not res!619451) (not e!515734))))

(assert (=> b!918751 (= res!619451 (validKeyInArray!0 lt!412371))))

(assert (=> b!918751 (= lt!412371 (select (arr!26404 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (= (and start!78746 res!619455) b!918747))

(assert (= (and b!918747 res!619456) b!918739))

(assert (= (and b!918739 res!619459) b!918742))

(assert (= (and b!918742 res!619452) b!918745))

(assert (= (and b!918745 res!619458) b!918750))

(assert (= (and b!918750 res!619453) b!918741))

(assert (= (and b!918741 res!619450) b!918748))

(assert (= (and b!918748 res!619457) b!918749))

(assert (= (and b!918749 res!619454) b!918751))

(assert (= (and b!918751 res!619451) b!918746))

(assert (= (and b!918743 condMapEmpty!30957) mapIsEmpty!30957))

(assert (= (and b!918743 (not condMapEmpty!30957)) mapNonEmpty!30957))

(get-info :version)

(assert (= (and mapNonEmpty!30957 ((_ is ValueCellFull!9252) mapValue!30957)) b!918744))

(assert (= (and b!918743 ((_ is ValueCellFull!9252) mapDefault!30957)) b!918740))

(assert (= start!78746 b!918743))

(declare-fun b_lambda!13461 () Bool)

(assert (=> (not b_lambda!13461) (not b!918746)))

(declare-fun t!26207 () Bool)

(declare-fun tb!5539 () Bool)

(assert (=> (and start!78746 (= defaultEntry!1235 defaultEntry!1235) t!26207) tb!5539))

(declare-fun result!10901 () Bool)

(assert (=> tb!5539 (= result!10901 tp_is_empty!19467)))

(assert (=> b!918746 t!26207))

(declare-fun b_and!27657 () Bool)

(assert (= b_and!27655 (and (=> t!26207 result!10901) b_and!27657)))

(declare-fun m!852431 () Bool)

(assert (=> mapNonEmpty!30957 m!852431))

(declare-fun m!852433 () Bool)

(assert (=> b!918739 m!852433))

(declare-fun m!852435 () Bool)

(assert (=> b!918742 m!852435))

(declare-fun m!852437 () Bool)

(assert (=> b!918749 m!852437))

(declare-fun m!852439 () Bool)

(assert (=> b!918741 m!852439))

(declare-fun m!852441 () Bool)

(assert (=> b!918751 m!852441))

(declare-fun m!852443 () Bool)

(assert (=> b!918751 m!852443))

(declare-fun m!852445 () Bool)

(assert (=> b!918750 m!852445))

(declare-fun m!852447 () Bool)

(assert (=> b!918750 m!852447))

(declare-fun m!852449 () Bool)

(assert (=> start!78746 m!852449))

(declare-fun m!852451 () Bool)

(assert (=> start!78746 m!852451))

(declare-fun m!852453 () Bool)

(assert (=> start!78746 m!852453))

(declare-fun m!852455 () Bool)

(assert (=> b!918746 m!852455))

(declare-fun m!852457 () Bool)

(assert (=> b!918746 m!852457))

(declare-fun m!852459 () Bool)

(assert (=> b!918746 m!852459))

(declare-fun m!852461 () Bool)

(assert (=> b!918746 m!852461))

(declare-fun m!852463 () Bool)

(assert (=> b!918746 m!852463))

(assert (=> b!918746 m!852459))

(assert (=> b!918746 m!852461))

(declare-fun m!852465 () Bool)

(assert (=> b!918746 m!852465))

(declare-fun m!852467 () Bool)

(assert (=> b!918746 m!852467))

(declare-fun m!852469 () Bool)

(assert (=> b!918746 m!852469))

(declare-fun m!852471 () Bool)

(assert (=> b!918746 m!852471))

(assert (=> b!918746 m!852469))

(assert (=> b!918746 m!852455))

(declare-fun m!852473 () Bool)

(assert (=> b!918746 m!852473))

(check-sat (not b!918746) (not mapNonEmpty!30957) (not b!918751) (not b!918742) (not b_lambda!13461) (not b_next!16959) (not b!918750) (not start!78746) b_and!27657 (not b!918749) tp_is_empty!19467 (not b!918739) (not b!918741))
(check-sat b_and!27657 (not b_next!16959))
