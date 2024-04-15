; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133882 () Bool)

(assert start!133882)

(declare-fun b_free!32155 () Bool)

(declare-fun b_next!32155 () Bool)

(assert (=> start!133882 (= b_free!32155 (not b_next!32155))))

(declare-fun tp!113767 () Bool)

(declare-fun b_and!51733 () Bool)

(assert (=> start!133882 (= tp!113767 b_and!51733)))

(declare-fun b!1565295 () Bool)

(declare-fun e!872457 () Bool)

(declare-fun e!872455 () Bool)

(declare-fun mapRes!59785 () Bool)

(assert (=> b!1565295 (= e!872457 (and e!872455 mapRes!59785))))

(declare-fun condMapEmpty!59785 () Bool)

(declare-datatypes ((V!60113 0))(
  ( (V!60114 (val!19548 Int)) )
))
(declare-datatypes ((ValueCell!18434 0))(
  ( (ValueCellFull!18434 (v!22300 V!60113)) (EmptyCell!18434) )
))
(declare-datatypes ((array!104476 0))(
  ( (array!104477 (arr!50426 (Array (_ BitVec 32) ValueCell!18434)) (size!50978 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104476)

(declare-fun mapDefault!59785 () ValueCell!18434)

(assert (=> b!1565295 (= condMapEmpty!59785 (= (arr!50426 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18434)) mapDefault!59785)))))

(declare-fun b!1565296 () Bool)

(declare-fun res!1070078 () Bool)

(declare-fun e!872458 () Bool)

(assert (=> b!1565296 (=> (not res!1070078) (not e!872458))))

(declare-datatypes ((array!104478 0))(
  ( (array!104479 (arr!50427 (Array (_ BitVec 32) (_ BitVec 64))) (size!50979 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104478)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104478 (_ BitVec 32)) Bool)

(assert (=> b!1565296 (= res!1070078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565297 () Bool)

(declare-fun tp_is_empty!38929 () Bool)

(assert (=> b!1565297 (= e!872455 tp_is_empty!38929)))

(declare-fun b!1565298 () Bool)

(declare-fun res!1070080 () Bool)

(assert (=> b!1565298 (=> (not res!1070080) (not e!872458))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565298 (= res!1070080 (and (= (size!50978 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50979 _keys!637) (size!50978 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1565299 () Bool)

(declare-fun res!1070075 () Bool)

(assert (=> b!1565299 (=> (not res!1070075) (not e!872458))))

(declare-fun from!782 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565299 (= res!1070075 (validKeyInArray!0 (select (arr!50427 _keys!637) from!782)))))

(declare-fun b!1565300 () Bool)

(assert (=> b!1565300 (= e!872458 (not true))))

(declare-fun lt!672040 () Bool)

(declare-datatypes ((tuple2!25296 0))(
  ( (tuple2!25297 (_1!12659 (_ BitVec 64)) (_2!12659 V!60113)) )
))
(declare-datatypes ((List!36655 0))(
  ( (Nil!36652) (Cons!36651 (h!38098 tuple2!25296) (t!51516 List!36655)) )
))
(declare-datatypes ((ListLongMap!22731 0))(
  ( (ListLongMap!22732 (toList!11381 List!36655)) )
))
(declare-fun lt!672039 () ListLongMap!22731)

(declare-fun contains!10294 (ListLongMap!22731 (_ BitVec 64)) Bool)

(assert (=> b!1565300 (= lt!672040 (contains!10294 lt!672039 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1565300 (not (contains!10294 lt!672039 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!672042 () ListLongMap!22731)

(declare-fun lt!672043 () V!60113)

(declare-fun +!5102 (ListLongMap!22731 tuple2!25296) ListLongMap!22731)

(assert (=> b!1565300 (= lt!672039 (+!5102 lt!672042 (tuple2!25297 (select (arr!50427 _keys!637) from!782) lt!672043)))))

(declare-datatypes ((Unit!51822 0))(
  ( (Unit!51823) )
))
(declare-fun lt!672041 () Unit!51822)

(declare-fun addStillNotContains!549 (ListLongMap!22731 (_ BitVec 64) V!60113 (_ BitVec 64)) Unit!51822)

(assert (=> b!1565300 (= lt!672041 (addStillNotContains!549 lt!672042 (select (arr!50427 _keys!637) from!782) lt!672043 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26337 (ValueCell!18434 V!60113) V!60113)

(declare-fun dynLambda!3878 (Int (_ BitVec 64)) V!60113)

(assert (=> b!1565300 (= lt!672043 (get!26337 (select (arr!50426 _values!487) from!782) (dynLambda!3878 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!60113)

(declare-fun minValue!453 () V!60113)

(declare-fun getCurrentListMapNoExtraKeys!6733 (array!104478 array!104476 (_ BitVec 32) (_ BitVec 32) V!60113 V!60113 (_ BitVec 32) Int) ListLongMap!22731)

(assert (=> b!1565300 (= lt!672042 (getCurrentListMapNoExtraKeys!6733 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun res!1070077 () Bool)

(assert (=> start!133882 (=> (not res!1070077) (not e!872458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133882 (= res!1070077 (validMask!0 mask!947))))

(assert (=> start!133882 e!872458))

(assert (=> start!133882 tp!113767))

(assert (=> start!133882 tp_is_empty!38929))

(assert (=> start!133882 true))

(declare-fun array_inv!39387 (array!104478) Bool)

(assert (=> start!133882 (array_inv!39387 _keys!637)))

(declare-fun array_inv!39388 (array!104476) Bool)

(assert (=> start!133882 (and (array_inv!39388 _values!487) e!872457)))

(declare-fun mapNonEmpty!59785 () Bool)

(declare-fun tp!113768 () Bool)

(declare-fun e!872454 () Bool)

(assert (=> mapNonEmpty!59785 (= mapRes!59785 (and tp!113768 e!872454))))

(declare-fun mapKey!59785 () (_ BitVec 32))

(declare-fun mapValue!59785 () ValueCell!18434)

(declare-fun mapRest!59785 () (Array (_ BitVec 32) ValueCell!18434))

(assert (=> mapNonEmpty!59785 (= (arr!50426 _values!487) (store mapRest!59785 mapKey!59785 mapValue!59785))))

(declare-fun b!1565301 () Bool)

(declare-fun res!1070076 () Bool)

(assert (=> b!1565301 (=> (not res!1070076) (not e!872458))))

(assert (=> b!1565301 (= res!1070076 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50979 _keys!637)) (bvslt from!782 (size!50979 _keys!637))))))

(declare-fun mapIsEmpty!59785 () Bool)

(assert (=> mapIsEmpty!59785 mapRes!59785))

(declare-fun b!1565302 () Bool)

(assert (=> b!1565302 (= e!872454 tp_is_empty!38929)))

(declare-fun b!1565303 () Bool)

(declare-fun res!1070079 () Bool)

(assert (=> b!1565303 (=> (not res!1070079) (not e!872458))))

(declare-datatypes ((List!36656 0))(
  ( (Nil!36653) (Cons!36652 (h!38099 (_ BitVec 64)) (t!51517 List!36656)) )
))
(declare-fun arrayNoDuplicates!0 (array!104478 (_ BitVec 32) List!36656) Bool)

(assert (=> b!1565303 (= res!1070079 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36653))))

(assert (= (and start!133882 res!1070077) b!1565298))

(assert (= (and b!1565298 res!1070080) b!1565296))

(assert (= (and b!1565296 res!1070078) b!1565303))

(assert (= (and b!1565303 res!1070079) b!1565301))

(assert (= (and b!1565301 res!1070076) b!1565299))

(assert (= (and b!1565299 res!1070075) b!1565300))

(assert (= (and b!1565295 condMapEmpty!59785) mapIsEmpty!59785))

(assert (= (and b!1565295 (not condMapEmpty!59785)) mapNonEmpty!59785))

(get-info :version)

(assert (= (and mapNonEmpty!59785 ((_ is ValueCellFull!18434) mapValue!59785)) b!1565302))

(assert (= (and b!1565295 ((_ is ValueCellFull!18434) mapDefault!59785)) b!1565297))

(assert (= start!133882 b!1565295))

(declare-fun b_lambda!24959 () Bool)

(assert (=> (not b_lambda!24959) (not b!1565300)))

(declare-fun t!51515 () Bool)

(declare-fun tb!12615 () Bool)

(assert (=> (and start!133882 (= defaultEntry!495 defaultEntry!495) t!51515) tb!12615))

(declare-fun result!26529 () Bool)

(assert (=> tb!12615 (= result!26529 tp_is_empty!38929)))

(assert (=> b!1565300 t!51515))

(declare-fun b_and!51735 () Bool)

(assert (= b_and!51733 (and (=> t!51515 result!26529) b_and!51735)))

(declare-fun m!1439623 () Bool)

(assert (=> b!1565296 m!1439623))

(declare-fun m!1439625 () Bool)

(assert (=> b!1565300 m!1439625))

(declare-fun m!1439627 () Bool)

(assert (=> b!1565300 m!1439627))

(declare-fun m!1439629 () Bool)

(assert (=> b!1565300 m!1439629))

(declare-fun m!1439631 () Bool)

(assert (=> b!1565300 m!1439631))

(assert (=> b!1565300 m!1439625))

(declare-fun m!1439633 () Bool)

(assert (=> b!1565300 m!1439633))

(assert (=> b!1565300 m!1439633))

(declare-fun m!1439635 () Bool)

(assert (=> b!1565300 m!1439635))

(assert (=> b!1565300 m!1439627))

(declare-fun m!1439637 () Bool)

(assert (=> b!1565300 m!1439637))

(declare-fun m!1439639 () Bool)

(assert (=> b!1565300 m!1439639))

(declare-fun m!1439641 () Bool)

(assert (=> b!1565300 m!1439641))

(declare-fun m!1439643 () Bool)

(assert (=> b!1565303 m!1439643))

(declare-fun m!1439645 () Bool)

(assert (=> start!133882 m!1439645))

(declare-fun m!1439647 () Bool)

(assert (=> start!133882 m!1439647))

(declare-fun m!1439649 () Bool)

(assert (=> start!133882 m!1439649))

(declare-fun m!1439651 () Bool)

(assert (=> mapNonEmpty!59785 m!1439651))

(assert (=> b!1565299 m!1439633))

(assert (=> b!1565299 m!1439633))

(declare-fun m!1439653 () Bool)

(assert (=> b!1565299 m!1439653))

(check-sat (not b!1565299) (not mapNonEmpty!59785) (not b!1565300) (not start!133882) b_and!51735 tp_is_empty!38929 (not b!1565303) (not b_lambda!24959) (not b!1565296) (not b_next!32155))
(check-sat b_and!51735 (not b_next!32155))
