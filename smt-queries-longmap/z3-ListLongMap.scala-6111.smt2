; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78756 () Bool)

(assert start!78756)

(declare-fun b_free!16987 () Bool)

(declare-fun b_next!16987 () Bool)

(assert (=> start!78756 (= b_free!16987 (not b_next!16987))))

(declare-fun tp!59403 () Bool)

(declare-fun b_and!27685 () Bool)

(assert (=> start!78756 (= tp!59403 b_and!27685)))

(declare-fun b!919074 () Bool)

(declare-fun e!515880 () Bool)

(declare-fun tp_is_empty!19495 () Bool)

(assert (=> b!919074 (= e!515880 tp_is_empty!19495)))

(declare-fun res!619764 () Bool)

(declare-fun e!515878 () Bool)

(assert (=> start!78756 (=> (not res!619764) (not e!515878))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78756 (= res!619764 (validMask!0 mask!1881))))

(assert (=> start!78756 e!515878))

(assert (=> start!78756 true))

(assert (=> start!78756 tp_is_empty!19495))

(declare-datatypes ((V!30959 0))(
  ( (V!30960 (val!9798 Int)) )
))
(declare-datatypes ((ValueCell!9266 0))(
  ( (ValueCellFull!9266 (v!12315 V!30959)) (EmptyCell!9266) )
))
(declare-datatypes ((array!54953 0))(
  ( (array!54954 (arr!26422 (Array (_ BitVec 32) ValueCell!9266)) (size!26883 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54953)

(declare-fun e!515879 () Bool)

(declare-fun array_inv!20676 (array!54953) Bool)

(assert (=> start!78756 (and (array_inv!20676 _values!1231) e!515879)))

(assert (=> start!78756 tp!59403))

(declare-datatypes ((array!54955 0))(
  ( (array!54956 (arr!26423 (Array (_ BitVec 32) (_ BitVec 64))) (size!26884 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54955)

(declare-fun array_inv!20677 (array!54955) Bool)

(assert (=> start!78756 (array_inv!20677 _keys!1487)))

(declare-fun b!919075 () Bool)

(declare-fun e!515874 () Bool)

(assert (=> b!919075 (= e!515878 e!515874)))

(declare-fun res!619767 () Bool)

(assert (=> b!919075 (=> (not res!619767) (not e!515874))))

(declare-datatypes ((tuple2!12784 0))(
  ( (tuple2!12785 (_1!6403 (_ BitVec 64)) (_2!6403 V!30959)) )
))
(declare-datatypes ((List!18570 0))(
  ( (Nil!18567) (Cons!18566 (h!19712 tuple2!12784) (t!26278 List!18570)) )
))
(declare-datatypes ((ListLongMap!11471 0))(
  ( (ListLongMap!11472 (toList!5751 List!18570)) )
))
(declare-fun lt!412406 () ListLongMap!11471)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4751 (ListLongMap!11471 (_ BitVec 64)) Bool)

(assert (=> b!919075 (= res!619767 (contains!4751 lt!412406 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun minValue!1173 () V!30959)

(declare-fun zeroValue!1173 () V!30959)

(declare-fun getCurrentListMap!2943 (array!54955 array!54953 (_ BitVec 32) (_ BitVec 32) V!30959 V!30959 (_ BitVec 32) Int) ListLongMap!11471)

(assert (=> b!919075 (= lt!412406 (getCurrentListMap!2943 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!919076 () Bool)

(declare-fun res!619768 () Bool)

(assert (=> b!919076 (=> (not res!619768) (not e!515878))))

(declare-datatypes ((List!18571 0))(
  ( (Nil!18568) (Cons!18567 (h!19713 (_ BitVec 64)) (t!26279 List!18571)) )
))
(declare-fun arrayNoDuplicates!0 (array!54955 (_ BitVec 32) List!18571) Bool)

(assert (=> b!919076 (= res!619768 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18568))))

(declare-fun mapIsEmpty!30999 () Bool)

(declare-fun mapRes!30999 () Bool)

(assert (=> mapIsEmpty!30999 mapRes!30999))

(declare-fun b!919077 () Bool)

(declare-fun res!619761 () Bool)

(assert (=> b!919077 (=> (not res!619761) (not e!515874))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919077 (= res!619761 (validKeyInArray!0 k0!1099))))

(declare-fun b!919078 () Bool)

(declare-fun e!515875 () Bool)

(assert (=> b!919078 (= e!515874 e!515875)))

(declare-fun res!619766 () Bool)

(assert (=> b!919078 (=> (not res!619766) (not e!515875))))

(declare-fun lt!412403 () (_ BitVec 64))

(assert (=> b!919078 (= res!619766 (validKeyInArray!0 lt!412403))))

(assert (=> b!919078 (= lt!412403 (select (arr!26423 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!919079 () Bool)

(declare-fun res!619763 () Bool)

(assert (=> b!919079 (=> (not res!619763) (not e!515878))))

(assert (=> b!919079 (= res!619763 (and (= (size!26883 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26884 _keys!1487) (size!26883 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!919080 () Bool)

(assert (=> b!919080 (= e!515875 (not true))))

(assert (=> b!919080 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18568)))

(declare-datatypes ((Unit!30950 0))(
  ( (Unit!30951) )
))
(declare-fun lt!412407 () Unit!30950)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!54955 (_ BitVec 32) (_ BitVec 32)) Unit!30950)

(assert (=> b!919080 (= lt!412407 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun lt!412405 () tuple2!12784)

(declare-fun +!2669 (ListLongMap!11471 tuple2!12784) ListLongMap!11471)

(assert (=> b!919080 (contains!4751 (+!2669 lt!412406 lt!412405) k0!1099)))

(declare-fun lt!412409 () Unit!30950)

(declare-fun lt!412404 () V!30959)

(declare-fun addStillContains!366 (ListLongMap!11471 (_ BitVec 64) V!30959 (_ BitVec 64)) Unit!30950)

(assert (=> b!919080 (= lt!412409 (addStillContains!366 lt!412406 lt!412403 lt!412404 k0!1099))))

(assert (=> b!919080 (= (getCurrentListMap!2943 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2669 (getCurrentListMap!2943 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!412405))))

(assert (=> b!919080 (= lt!412405 (tuple2!12785 lt!412403 lt!412404))))

(declare-fun get!13860 (ValueCell!9266 V!30959) V!30959)

(declare-fun dynLambda!1425 (Int (_ BitVec 64)) V!30959)

(assert (=> b!919080 (= lt!412404 (get!13860 (select (arr!26422 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1425 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!412408 () Unit!30950)

(declare-fun lemmaListMapRecursiveValidKeyArray!33 (array!54955 array!54953 (_ BitVec 32) (_ BitVec 32) V!30959 V!30959 (_ BitVec 32) Int) Unit!30950)

(assert (=> b!919080 (= lt!412408 (lemmaListMapRecursiveValidKeyArray!33 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!919081 () Bool)

(declare-fun res!619762 () Bool)

(assert (=> b!919081 (=> (not res!619762) (not e!515874))))

(assert (=> b!919081 (= res!619762 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919082 () Bool)

(declare-fun res!619760 () Bool)

(assert (=> b!919082 (=> (not res!619760) (not e!515878))))

(assert (=> b!919082 (= res!619760 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26884 _keys!1487))))))

(declare-fun mapNonEmpty!30999 () Bool)

(declare-fun tp!59402 () Bool)

(declare-fun e!515877 () Bool)

(assert (=> mapNonEmpty!30999 (= mapRes!30999 (and tp!59402 e!515877))))

(declare-fun mapKey!30999 () (_ BitVec 32))

(declare-fun mapValue!30999 () ValueCell!9266)

(declare-fun mapRest!30999 () (Array (_ BitVec 32) ValueCell!9266))

(assert (=> mapNonEmpty!30999 (= (arr!26422 _values!1231) (store mapRest!30999 mapKey!30999 mapValue!30999))))

(declare-fun b!919083 () Bool)

(assert (=> b!919083 (= e!515879 (and e!515880 mapRes!30999))))

(declare-fun condMapEmpty!30999 () Bool)

(declare-fun mapDefault!30999 () ValueCell!9266)

(assert (=> b!919083 (= condMapEmpty!30999 (= (arr!26422 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9266)) mapDefault!30999)))))

(declare-fun b!919084 () Bool)

(assert (=> b!919084 (= e!515877 tp_is_empty!19495)))

(declare-fun b!919085 () Bool)

(declare-fun res!619769 () Bool)

(assert (=> b!919085 (=> (not res!619769) (not e!515878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54955 (_ BitVec 32)) Bool)

(assert (=> b!919085 (= res!619769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919086 () Bool)

(declare-fun res!619765 () Bool)

(assert (=> b!919086 (=> (not res!619765) (not e!515874))))

(declare-fun v!791 () V!30959)

(declare-fun apply!581 (ListLongMap!11471 (_ BitVec 64)) V!30959)

(assert (=> b!919086 (= res!619765 (= (apply!581 lt!412406 k0!1099) v!791))))

(assert (= (and start!78756 res!619764) b!919079))

(assert (= (and b!919079 res!619763) b!919085))

(assert (= (and b!919085 res!619769) b!919076))

(assert (= (and b!919076 res!619768) b!919082))

(assert (= (and b!919082 res!619760) b!919075))

(assert (= (and b!919075 res!619767) b!919086))

(assert (= (and b!919086 res!619765) b!919081))

(assert (= (and b!919081 res!619762) b!919077))

(assert (= (and b!919077 res!619761) b!919078))

(assert (= (and b!919078 res!619766) b!919080))

(assert (= (and b!919083 condMapEmpty!30999) mapIsEmpty!30999))

(assert (= (and b!919083 (not condMapEmpty!30999)) mapNonEmpty!30999))

(get-info :version)

(assert (= (and mapNonEmpty!30999 ((_ is ValueCellFull!9266) mapValue!30999)) b!919084))

(assert (= (and b!919083 ((_ is ValueCellFull!9266) mapDefault!30999)) b!919074))

(assert (= start!78756 b!919083))

(declare-fun b_lambda!13471 () Bool)

(assert (=> (not b_lambda!13471) (not b!919080)))

(declare-fun t!26277 () Bool)

(declare-fun tb!5559 () Bool)

(assert (=> (and start!78756 (= defaultEntry!1235 defaultEntry!1235) t!26277) tb!5559))

(declare-fun result!10949 () Bool)

(assert (=> tb!5559 (= result!10949 tp_is_empty!19495)))

(assert (=> b!919080 t!26277))

(declare-fun b_and!27687 () Bool)

(assert (= b_and!27685 (and (=> t!26277 result!10949) b_and!27687)))

(declare-fun m!852313 () Bool)

(assert (=> b!919078 m!852313))

(declare-fun m!852315 () Bool)

(assert (=> b!919078 m!852315))

(declare-fun m!852317 () Bool)

(assert (=> b!919075 m!852317))

(declare-fun m!852319 () Bool)

(assert (=> b!919075 m!852319))

(declare-fun m!852321 () Bool)

(assert (=> b!919080 m!852321))

(declare-fun m!852323 () Bool)

(assert (=> b!919080 m!852323))

(declare-fun m!852325 () Bool)

(assert (=> b!919080 m!852325))

(declare-fun m!852327 () Bool)

(assert (=> b!919080 m!852327))

(assert (=> b!919080 m!852325))

(assert (=> b!919080 m!852327))

(declare-fun m!852329 () Bool)

(assert (=> b!919080 m!852329))

(declare-fun m!852331 () Bool)

(assert (=> b!919080 m!852331))

(declare-fun m!852333 () Bool)

(assert (=> b!919080 m!852333))

(declare-fun m!852335 () Bool)

(assert (=> b!919080 m!852335))

(declare-fun m!852337 () Bool)

(assert (=> b!919080 m!852337))

(declare-fun m!852339 () Bool)

(assert (=> b!919080 m!852339))

(assert (=> b!919080 m!852333))

(declare-fun m!852341 () Bool)

(assert (=> b!919080 m!852341))

(assert (=> b!919080 m!852321))

(declare-fun m!852343 () Bool)

(assert (=> b!919080 m!852343))

(declare-fun m!852345 () Bool)

(assert (=> b!919077 m!852345))

(declare-fun m!852347 () Bool)

(assert (=> start!78756 m!852347))

(declare-fun m!852349 () Bool)

(assert (=> start!78756 m!852349))

(declare-fun m!852351 () Bool)

(assert (=> start!78756 m!852351))

(declare-fun m!852353 () Bool)

(assert (=> mapNonEmpty!30999 m!852353))

(declare-fun m!852355 () Bool)

(assert (=> b!919085 m!852355))

(declare-fun m!852357 () Bool)

(assert (=> b!919086 m!852357))

(declare-fun m!852359 () Bool)

(assert (=> b!919076 m!852359))

(check-sat tp_is_empty!19495 (not start!78756) (not mapNonEmpty!30999) b_and!27687 (not b!919076) (not b!919075) (not b!919078) (not b!919080) (not b!919077) (not b_lambda!13471) (not b!919086) (not b_next!16987) (not b!919085))
(check-sat b_and!27687 (not b_next!16987))
