; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78660 () Bool)

(assert start!78660)

(declare-fun b_free!16891 () Bool)

(declare-fun b_next!16891 () Bool)

(assert (=> start!78660 (= b_free!16891 (not b_next!16891))))

(declare-fun tp!59115 () Bool)

(declare-fun b_and!27493 () Bool)

(assert (=> start!78660 (= tp!59115 b_and!27493)))

(declare-fun b!917106 () Bool)

(declare-fun e!514867 () Bool)

(declare-fun e!514872 () Bool)

(declare-fun mapRes!30855 () Bool)

(assert (=> b!917106 (= e!514867 (and e!514872 mapRes!30855))))

(declare-fun condMapEmpty!30855 () Bool)

(declare-datatypes ((V!30831 0))(
  ( (V!30832 (val!9750 Int)) )
))
(declare-datatypes ((ValueCell!9218 0))(
  ( (ValueCellFull!9218 (v!12267 V!30831)) (EmptyCell!9218) )
))
(declare-datatypes ((array!54773 0))(
  ( (array!54774 (arr!26332 (Array (_ BitVec 32) ValueCell!9218)) (size!26793 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54773)

(declare-fun mapDefault!30855 () ValueCell!9218)

(assert (=> b!917106 (= condMapEmpty!30855 (= (arr!26332 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9218)) mapDefault!30855)))))

(declare-fun b!917107 () Bool)

(declare-fun e!514868 () Bool)

(declare-fun e!514870 () Bool)

(assert (=> b!917107 (= e!514868 e!514870)))

(declare-fun res!618322 () Bool)

(assert (=> b!917107 (=> (not res!618322) (not e!514870))))

(declare-fun lt!411757 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917107 (= res!618322 (validKeyInArray!0 lt!411757))))

(declare-datatypes ((array!54775 0))(
  ( (array!54776 (arr!26333 (Array (_ BitVec 32) (_ BitVec 64))) (size!26794 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54775)

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917107 (= lt!411757 (select (arr!26333 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917108 () Bool)

(declare-fun res!618327 () Bool)

(declare-fun e!514869 () Bool)

(assert (=> b!917108 (=> (not res!618327) (not e!514869))))

(declare-datatypes ((List!18496 0))(
  ( (Nil!18493) (Cons!18492 (h!19638 (_ BitVec 64)) (t!26108 List!18496)) )
))
(declare-fun arrayNoDuplicates!0 (array!54775 (_ BitVec 32) List!18496) Bool)

(assert (=> b!917108 (= res!618327 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18493))))

(declare-fun b!917109 () Bool)

(declare-fun res!618323 () Bool)

(assert (=> b!917109 (=> (not res!618323) (not e!514869))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!917109 (= res!618323 (and (= (size!26793 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26794 _keys!1487) (size!26793 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917110 () Bool)

(declare-fun res!618329 () Bool)

(assert (=> b!917110 (=> (not res!618329) (not e!514869))))

(assert (=> b!917110 (= res!618329 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26794 _keys!1487))))))

(declare-fun res!618328 () Bool)

(assert (=> start!78660 (=> (not res!618328) (not e!514869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78660 (= res!618328 (validMask!0 mask!1881))))

(assert (=> start!78660 e!514869))

(assert (=> start!78660 true))

(declare-fun tp_is_empty!19399 () Bool)

(assert (=> start!78660 tp_is_empty!19399))

(declare-fun array_inv!20612 (array!54773) Bool)

(assert (=> start!78660 (and (array_inv!20612 _values!1231) e!514867)))

(assert (=> start!78660 tp!59115))

(declare-fun array_inv!20613 (array!54775) Bool)

(assert (=> start!78660 (array_inv!20613 _keys!1487)))

(declare-fun b!917111 () Bool)

(declare-fun res!618321 () Bool)

(assert (=> b!917111 (=> (not res!618321) (not e!514868))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!917111 (= res!618321 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!30855 () Bool)

(declare-fun tp!59114 () Bool)

(declare-fun e!514866 () Bool)

(assert (=> mapNonEmpty!30855 (= mapRes!30855 (and tp!59114 e!514866))))

(declare-fun mapKey!30855 () (_ BitVec 32))

(declare-fun mapRest!30855 () (Array (_ BitVec 32) ValueCell!9218))

(declare-fun mapValue!30855 () ValueCell!9218)

(assert (=> mapNonEmpty!30855 (= (arr!26332 _values!1231) (store mapRest!30855 mapKey!30855 mapValue!30855))))

(declare-fun mapIsEmpty!30855 () Bool)

(assert (=> mapIsEmpty!30855 mapRes!30855))

(declare-fun b!917112 () Bool)

(declare-fun res!618320 () Bool)

(assert (=> b!917112 (=> (not res!618320) (not e!514869))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54775 (_ BitVec 32)) Bool)

(assert (=> b!917112 (= res!618320 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917113 () Bool)

(declare-fun res!618324 () Bool)

(assert (=> b!917113 (=> (not res!618324) (not e!514868))))

(declare-fun v!791 () V!30831)

(declare-datatypes ((tuple2!12706 0))(
  ( (tuple2!12707 (_1!6364 (_ BitVec 64)) (_2!6364 V!30831)) )
))
(declare-datatypes ((List!18497 0))(
  ( (Nil!18494) (Cons!18493 (h!19639 tuple2!12706) (t!26109 List!18497)) )
))
(declare-datatypes ((ListLongMap!11393 0))(
  ( (ListLongMap!11394 (toList!5712 List!18497)) )
))
(declare-fun lt!411758 () ListLongMap!11393)

(declare-fun apply!551 (ListLongMap!11393 (_ BitVec 64)) V!30831)

(assert (=> b!917113 (= res!618324 (= (apply!551 lt!411758 k0!1099) v!791))))

(declare-fun b!917114 () Bool)

(assert (=> b!917114 (= e!514869 e!514868)))

(declare-fun res!618325 () Bool)

(assert (=> b!917114 (=> (not res!618325) (not e!514868))))

(declare-fun contains!4716 (ListLongMap!11393 (_ BitVec 64)) Bool)

(assert (=> b!917114 (= res!618325 (contains!4716 lt!411758 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30831)

(declare-fun minValue!1173 () V!30831)

(declare-fun getCurrentListMap!2906 (array!54775 array!54773 (_ BitVec 32) (_ BitVec 32) V!30831 V!30831 (_ BitVec 32) Int) ListLongMap!11393)

(assert (=> b!917114 (= lt!411758 (getCurrentListMap!2906 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917115 () Bool)

(assert (=> b!917115 (= e!514870 (not true))))

(declare-fun +!2639 (ListLongMap!11393 tuple2!12706) ListLongMap!11393)

(declare-fun get!13798 (ValueCell!9218 V!30831) V!30831)

(declare-fun dynLambda!1395 (Int (_ BitVec 64)) V!30831)

(assert (=> b!917115 (= (getCurrentListMap!2906 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2639 (getCurrentListMap!2906 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12707 lt!411757 (get!13798 (select (arr!26332 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1395 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30890 0))(
  ( (Unit!30891) )
))
(declare-fun lt!411756 () Unit!30890)

(declare-fun lemmaListMapRecursiveValidKeyArray!3 (array!54775 array!54773 (_ BitVec 32) (_ BitVec 32) V!30831 V!30831 (_ BitVec 32) Int) Unit!30890)

(assert (=> b!917115 (= lt!411756 (lemmaListMapRecursiveValidKeyArray!3 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917116 () Bool)

(assert (=> b!917116 (= e!514872 tp_is_empty!19399)))

(declare-fun b!917117 () Bool)

(declare-fun res!618326 () Bool)

(assert (=> b!917117 (=> (not res!618326) (not e!514868))))

(assert (=> b!917117 (= res!618326 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917118 () Bool)

(assert (=> b!917118 (= e!514866 tp_is_empty!19399)))

(assert (= (and start!78660 res!618328) b!917109))

(assert (= (and b!917109 res!618323) b!917112))

(assert (= (and b!917112 res!618320) b!917108))

(assert (= (and b!917108 res!618327) b!917110))

(assert (= (and b!917110 res!618329) b!917114))

(assert (= (and b!917114 res!618325) b!917113))

(assert (= (and b!917113 res!618324) b!917117))

(assert (= (and b!917117 res!618326) b!917111))

(assert (= (and b!917111 res!618321) b!917107))

(assert (= (and b!917107 res!618322) b!917115))

(assert (= (and b!917106 condMapEmpty!30855) mapIsEmpty!30855))

(assert (= (and b!917106 (not condMapEmpty!30855)) mapNonEmpty!30855))

(get-info :version)

(assert (= (and mapNonEmpty!30855 ((_ is ValueCellFull!9218) mapValue!30855)) b!917118))

(assert (= (and b!917106 ((_ is ValueCellFull!9218) mapDefault!30855)) b!917116))

(assert (= start!78660 b!917106))

(declare-fun b_lambda!13375 () Bool)

(assert (=> (not b_lambda!13375) (not b!917115)))

(declare-fun t!26107 () Bool)

(declare-fun tb!5463 () Bool)

(assert (=> (and start!78660 (= defaultEntry!1235 defaultEntry!1235) t!26107) tb!5463))

(declare-fun result!10757 () Bool)

(assert (=> tb!5463 (= result!10757 tp_is_empty!19399)))

(assert (=> b!917115 t!26107))

(declare-fun b_and!27495 () Bool)

(assert (= b_and!27493 (and (=> t!26107 result!10757) b_and!27495)))

(declare-fun m!850339 () Bool)

(assert (=> mapNonEmpty!30855 m!850339))

(declare-fun m!850341 () Bool)

(assert (=> b!917114 m!850341))

(declare-fun m!850343 () Bool)

(assert (=> b!917114 m!850343))

(declare-fun m!850345 () Bool)

(assert (=> start!78660 m!850345))

(declare-fun m!850347 () Bool)

(assert (=> start!78660 m!850347))

(declare-fun m!850349 () Bool)

(assert (=> start!78660 m!850349))

(declare-fun m!850351 () Bool)

(assert (=> b!917113 m!850351))

(declare-fun m!850353 () Bool)

(assert (=> b!917112 m!850353))

(declare-fun m!850355 () Bool)

(assert (=> b!917108 m!850355))

(declare-fun m!850357 () Bool)

(assert (=> b!917111 m!850357))

(declare-fun m!850359 () Bool)

(assert (=> b!917107 m!850359))

(declare-fun m!850361 () Bool)

(assert (=> b!917107 m!850361))

(declare-fun m!850363 () Bool)

(assert (=> b!917115 m!850363))

(declare-fun m!850365 () Bool)

(assert (=> b!917115 m!850365))

(assert (=> b!917115 m!850363))

(declare-fun m!850367 () Bool)

(assert (=> b!917115 m!850367))

(declare-fun m!850369 () Bool)

(assert (=> b!917115 m!850369))

(declare-fun m!850371 () Bool)

(assert (=> b!917115 m!850371))

(declare-fun m!850373 () Bool)

(assert (=> b!917115 m!850373))

(assert (=> b!917115 m!850371))

(declare-fun m!850375 () Bool)

(assert (=> b!917115 m!850375))

(assert (=> b!917115 m!850365))

(check-sat (not b_lambda!13375) (not b!917112) tp_is_empty!19399 b_and!27495 (not mapNonEmpty!30855) (not b!917113) (not start!78660) (not b!917111) (not b_next!16891) (not b!917107) (not b!917108) (not b!917115) (not b!917114))
(check-sat b_and!27495 (not b_next!16891))
