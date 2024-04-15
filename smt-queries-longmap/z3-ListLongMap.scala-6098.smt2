; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78678 () Bool)

(assert start!78678)

(declare-fun b_free!16909 () Bool)

(declare-fun b_next!16909 () Bool)

(assert (=> start!78678 (= b_free!16909 (not b_next!16909))))

(declare-fun tp!59169 () Bool)

(declare-fun b_and!27529 () Bool)

(assert (=> start!78678 (= tp!59169 b_and!27529)))

(declare-fun b!917475 () Bool)

(declare-fun res!618592 () Bool)

(declare-fun e!515060 () Bool)

(assert (=> b!917475 (=> (not res!618592) (not e!515060))))

(declare-datatypes ((array!54807 0))(
  ( (array!54808 (arr!26349 (Array (_ BitVec 32) (_ BitVec 64))) (size!26810 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54807)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30855 0))(
  ( (V!30856 (val!9759 Int)) )
))
(declare-datatypes ((ValueCell!9227 0))(
  ( (ValueCellFull!9227 (v!12276 V!30855)) (EmptyCell!9227) )
))
(declare-datatypes ((array!54809 0))(
  ( (array!54810 (arr!26350 (Array (_ BitVec 32) ValueCell!9227)) (size!26811 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54809)

(assert (=> b!917475 (= res!618592 (and (= (size!26811 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26810 _keys!1487) (size!26811 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917476 () Bool)

(declare-fun e!515061 () Bool)

(declare-fun e!515057 () Bool)

(assert (=> b!917476 (= e!515061 e!515057)))

(declare-fun res!618598 () Bool)

(assert (=> b!917476 (=> (not res!618598) (not e!515057))))

(declare-fun lt!411838 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917476 (= res!618598 (validKeyInArray!0 lt!411838))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917476 (= lt!411838 (select (arr!26349 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917477 () Bool)

(declare-fun res!618599 () Bool)

(assert (=> b!917477 (=> (not res!618599) (not e!515060))))

(declare-datatypes ((List!18511 0))(
  ( (Nil!18508) (Cons!18507 (h!19653 (_ BitVec 64)) (t!26141 List!18511)) )
))
(declare-fun arrayNoDuplicates!0 (array!54807 (_ BitVec 32) List!18511) Bool)

(assert (=> b!917477 (= res!618599 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18508))))

(declare-fun b!917478 () Bool)

(declare-fun e!515058 () Bool)

(declare-fun tp_is_empty!19417 () Bool)

(assert (=> b!917478 (= e!515058 tp_is_empty!19417)))

(declare-fun mapNonEmpty!30882 () Bool)

(declare-fun mapRes!30882 () Bool)

(declare-fun tp!59168 () Bool)

(declare-fun e!515056 () Bool)

(assert (=> mapNonEmpty!30882 (= mapRes!30882 (and tp!59168 e!515056))))

(declare-fun mapValue!30882 () ValueCell!9227)

(declare-fun mapRest!30882 () (Array (_ BitVec 32) ValueCell!9227))

(declare-fun mapKey!30882 () (_ BitVec 32))

(assert (=> mapNonEmpty!30882 (= (arr!26350 _values!1231) (store mapRest!30882 mapKey!30882 mapValue!30882))))

(declare-fun mapIsEmpty!30882 () Bool)

(assert (=> mapIsEmpty!30882 mapRes!30882))

(declare-fun b!917479 () Bool)

(declare-fun res!618596 () Bool)

(assert (=> b!917479 (=> (not res!618596) (not e!515061))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!30855)

(declare-datatypes ((tuple2!12722 0))(
  ( (tuple2!12723 (_1!6372 (_ BitVec 64)) (_2!6372 V!30855)) )
))
(declare-datatypes ((List!18512 0))(
  ( (Nil!18509) (Cons!18508 (h!19654 tuple2!12722) (t!26142 List!18512)) )
))
(declare-datatypes ((ListLongMap!11409 0))(
  ( (ListLongMap!11410 (toList!5720 List!18512)) )
))
(declare-fun lt!411839 () ListLongMap!11409)

(declare-fun apply!558 (ListLongMap!11409 (_ BitVec 64)) V!30855)

(assert (=> b!917479 (= res!618596 (= (apply!558 lt!411839 k0!1099) v!791))))

(declare-fun b!917480 () Bool)

(declare-fun res!618595 () Bool)

(assert (=> b!917480 (=> (not res!618595) (not e!515060))))

(assert (=> b!917480 (= res!618595 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26810 _keys!1487))))))

(declare-fun b!917481 () Bool)

(declare-fun e!515059 () Bool)

(assert (=> b!917481 (= e!515059 (and e!515058 mapRes!30882))))

(declare-fun condMapEmpty!30882 () Bool)

(declare-fun mapDefault!30882 () ValueCell!9227)

(assert (=> b!917481 (= condMapEmpty!30882 (= (arr!26350 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9227)) mapDefault!30882)))))

(declare-fun res!618591 () Bool)

(assert (=> start!78678 (=> (not res!618591) (not e!515060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78678 (= res!618591 (validMask!0 mask!1881))))

(assert (=> start!78678 e!515060))

(assert (=> start!78678 true))

(assert (=> start!78678 tp_is_empty!19417))

(declare-fun array_inv!20626 (array!54809) Bool)

(assert (=> start!78678 (and (array_inv!20626 _values!1231) e!515059)))

(assert (=> start!78678 tp!59169))

(declare-fun array_inv!20627 (array!54807) Bool)

(assert (=> start!78678 (array_inv!20627 _keys!1487)))

(declare-fun b!917482 () Bool)

(assert (=> b!917482 (= e!515057 (not true))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30855)

(declare-fun minValue!1173 () V!30855)

(declare-fun getCurrentListMap!2913 (array!54807 array!54809 (_ BitVec 32) (_ BitVec 32) V!30855 V!30855 (_ BitVec 32) Int) ListLongMap!11409)

(declare-fun +!2644 (ListLongMap!11409 tuple2!12722) ListLongMap!11409)

(declare-fun get!13809 (ValueCell!9227 V!30855) V!30855)

(declare-fun dynLambda!1400 (Int (_ BitVec 64)) V!30855)

(assert (=> b!917482 (= (getCurrentListMap!2913 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2644 (getCurrentListMap!2913 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12723 lt!411838 (get!13809 (select (arr!26350 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1400 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30900 0))(
  ( (Unit!30901) )
))
(declare-fun lt!411837 () Unit!30900)

(declare-fun lemmaListMapRecursiveValidKeyArray!8 (array!54807 array!54809 (_ BitVec 32) (_ BitVec 32) V!30855 V!30855 (_ BitVec 32) Int) Unit!30900)

(assert (=> b!917482 (= lt!411837 (lemmaListMapRecursiveValidKeyArray!8 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917483 () Bool)

(assert (=> b!917483 (= e!515056 tp_is_empty!19417)))

(declare-fun b!917484 () Bool)

(declare-fun res!618593 () Bool)

(assert (=> b!917484 (=> (not res!618593) (not e!515060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54807 (_ BitVec 32)) Bool)

(assert (=> b!917484 (= res!618593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917485 () Bool)

(declare-fun res!618594 () Bool)

(assert (=> b!917485 (=> (not res!618594) (not e!515061))))

(assert (=> b!917485 (= res!618594 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!917486 () Bool)

(declare-fun res!618597 () Bool)

(assert (=> b!917486 (=> (not res!618597) (not e!515061))))

(assert (=> b!917486 (= res!618597 (validKeyInArray!0 k0!1099))))

(declare-fun b!917487 () Bool)

(assert (=> b!917487 (= e!515060 e!515061)))

(declare-fun res!618590 () Bool)

(assert (=> b!917487 (=> (not res!618590) (not e!515061))))

(declare-fun contains!4722 (ListLongMap!11409 (_ BitVec 64)) Bool)

(assert (=> b!917487 (= res!618590 (contains!4722 lt!411839 k0!1099))))

(assert (=> b!917487 (= lt!411839 (getCurrentListMap!2913 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!78678 res!618591) b!917475))

(assert (= (and b!917475 res!618592) b!917484))

(assert (= (and b!917484 res!618593) b!917477))

(assert (= (and b!917477 res!618599) b!917480))

(assert (= (and b!917480 res!618595) b!917487))

(assert (= (and b!917487 res!618590) b!917479))

(assert (= (and b!917479 res!618596) b!917485))

(assert (= (and b!917485 res!618594) b!917486))

(assert (= (and b!917486 res!618597) b!917476))

(assert (= (and b!917476 res!618598) b!917482))

(assert (= (and b!917481 condMapEmpty!30882) mapIsEmpty!30882))

(assert (= (and b!917481 (not condMapEmpty!30882)) mapNonEmpty!30882))

(get-info :version)

(assert (= (and mapNonEmpty!30882 ((_ is ValueCellFull!9227) mapValue!30882)) b!917483))

(assert (= (and b!917481 ((_ is ValueCellFull!9227) mapDefault!30882)) b!917478))

(assert (= start!78678 b!917481))

(declare-fun b_lambda!13393 () Bool)

(assert (=> (not b_lambda!13393) (not b!917482)))

(declare-fun t!26140 () Bool)

(declare-fun tb!5481 () Bool)

(assert (=> (and start!78678 (= defaultEntry!1235 defaultEntry!1235) t!26140) tb!5481))

(declare-fun result!10793 () Bool)

(assert (=> tb!5481 (= result!10793 tp_is_empty!19417)))

(assert (=> b!917482 t!26140))

(declare-fun b_and!27531 () Bool)

(assert (= b_and!27529 (and (=> t!26140 result!10793) b_and!27531)))

(declare-fun m!850681 () Bool)

(assert (=> start!78678 m!850681))

(declare-fun m!850683 () Bool)

(assert (=> start!78678 m!850683))

(declare-fun m!850685 () Bool)

(assert (=> start!78678 m!850685))

(declare-fun m!850687 () Bool)

(assert (=> b!917477 m!850687))

(declare-fun m!850689 () Bool)

(assert (=> b!917482 m!850689))

(declare-fun m!850691 () Bool)

(assert (=> b!917482 m!850691))

(declare-fun m!850693 () Bool)

(assert (=> b!917482 m!850693))

(declare-fun m!850695 () Bool)

(assert (=> b!917482 m!850695))

(assert (=> b!917482 m!850689))

(assert (=> b!917482 m!850691))

(declare-fun m!850697 () Bool)

(assert (=> b!917482 m!850697))

(declare-fun m!850699 () Bool)

(assert (=> b!917482 m!850699))

(assert (=> b!917482 m!850693))

(declare-fun m!850701 () Bool)

(assert (=> b!917482 m!850701))

(declare-fun m!850703 () Bool)

(assert (=> mapNonEmpty!30882 m!850703))

(declare-fun m!850705 () Bool)

(assert (=> b!917486 m!850705))

(declare-fun m!850707 () Bool)

(assert (=> b!917484 m!850707))

(declare-fun m!850709 () Bool)

(assert (=> b!917479 m!850709))

(declare-fun m!850711 () Bool)

(assert (=> b!917487 m!850711))

(declare-fun m!850713 () Bool)

(assert (=> b!917487 m!850713))

(declare-fun m!850715 () Bool)

(assert (=> b!917476 m!850715))

(declare-fun m!850717 () Bool)

(assert (=> b!917476 m!850717))

(check-sat (not b_next!16909) (not start!78678) tp_is_empty!19417 (not b!917476) (not b!917479) (not b_lambda!13393) (not mapNonEmpty!30882) (not b!917484) (not b!917477) (not b!917482) (not b!917487) b_and!27531 (not b!917486))
(check-sat b_and!27531 (not b_next!16909))
