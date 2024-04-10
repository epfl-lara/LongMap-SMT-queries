; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79214 () Bool)

(assert start!79214)

(declare-fun b_free!17427 () Bool)

(declare-fun b_next!17427 () Bool)

(assert (=> start!79214 (= b_free!17427 (not b_next!17427))))

(declare-fun tp!60722 () Bool)

(declare-fun b_and!28493 () Bool)

(assert (=> start!79214 (= tp!60722 b_and!28493)))

(declare-fun b!930061 () Bool)

(declare-fun e!522266 () Bool)

(declare-fun tp_is_empty!19935 () Bool)

(assert (=> b!930061 (= e!522266 tp_is_empty!19935)))

(declare-fun b!930062 () Bool)

(declare-fun res!626340 () Bool)

(declare-fun e!522270 () Bool)

(assert (=> b!930062 (=> (not res!626340) (not e!522270))))

(declare-datatypes ((array!55818 0))(
  ( (array!55819 (arr!26854 (Array (_ BitVec 32) (_ BitVec 64))) (size!27313 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55818)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31545 0))(
  ( (V!31546 (val!10018 Int)) )
))
(declare-datatypes ((ValueCell!9486 0))(
  ( (ValueCellFull!9486 (v!12536 V!31545)) (EmptyCell!9486) )
))
(declare-datatypes ((array!55820 0))(
  ( (array!55821 (arr!26855 (Array (_ BitVec 32) ValueCell!9486)) (size!27314 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55820)

(assert (=> b!930062 (= res!626340 (and (= (size!27314 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27313 _keys!1487) (size!27314 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930063 () Bool)

(declare-fun e!522271 () Bool)

(assert (=> b!930063 (= e!522271 false)))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!419178 () Bool)

(declare-fun zeroValue!1173 () V!31545)

(declare-fun minValue!1173 () V!31545)

(declare-datatypes ((tuple2!13104 0))(
  ( (tuple2!13105 (_1!6563 (_ BitVec 64)) (_2!6563 V!31545)) )
))
(declare-datatypes ((List!18896 0))(
  ( (Nil!18893) (Cons!18892 (h!20038 tuple2!13104) (t!26953 List!18896)) )
))
(declare-datatypes ((ListLongMap!11801 0))(
  ( (ListLongMap!11802 (toList!5916 List!18896)) )
))
(declare-fun contains!4968 (ListLongMap!11801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3159 (array!55818 array!55820 (_ BitVec 32) (_ BitVec 32) V!31545 V!31545 (_ BitVec 32) Int) ListLongMap!11801)

(assert (=> b!930063 (= lt!419178 (contains!4968 (getCurrentListMap!3159 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun mapIsEmpty!31659 () Bool)

(declare-fun mapRes!31659 () Bool)

(assert (=> mapIsEmpty!31659 mapRes!31659))

(declare-fun b!930064 () Bool)

(declare-fun res!626334 () Bool)

(assert (=> b!930064 (=> (not res!626334) (not e!522270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55818 (_ BitVec 32)) Bool)

(assert (=> b!930064 (= res!626334 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!930065 () Bool)

(declare-fun res!626336 () Bool)

(assert (=> b!930065 (=> (not res!626336) (not e!522271))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!930065 (= res!626336 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!930066 () Bool)

(assert (=> b!930066 (= e!522270 e!522271)))

(declare-fun res!626341 () Bool)

(assert (=> b!930066 (=> (not res!626341) (not e!522271))))

(declare-fun lt!419179 () ListLongMap!11801)

(assert (=> b!930066 (= res!626341 (contains!4968 lt!419179 k0!1099))))

(assert (=> b!930066 (= lt!419179 (getCurrentListMap!3159 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930067 () Bool)

(declare-fun res!626338 () Bool)

(assert (=> b!930067 (=> (not res!626338) (not e!522270))))

(assert (=> b!930067 (= res!626338 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27313 _keys!1487))))))

(declare-fun b!930068 () Bool)

(declare-fun res!626339 () Bool)

(assert (=> b!930068 (=> (not res!626339) (not e!522270))))

(declare-datatypes ((List!18897 0))(
  ( (Nil!18894) (Cons!18893 (h!20039 (_ BitVec 64)) (t!26954 List!18897)) )
))
(declare-fun arrayNoDuplicates!0 (array!55818 (_ BitVec 32) List!18897) Bool)

(assert (=> b!930068 (= res!626339 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18894))))

(declare-fun b!930069 () Bool)

(declare-fun res!626337 () Bool)

(assert (=> b!930069 (=> (not res!626337) (not e!522271))))

(declare-fun v!791 () V!31545)

(declare-fun apply!738 (ListLongMap!11801 (_ BitVec 64)) V!31545)

(assert (=> b!930069 (= res!626337 (= (apply!738 lt!419179 k0!1099) v!791))))

(declare-fun mapNonEmpty!31659 () Bool)

(declare-fun tp!60721 () Bool)

(declare-fun e!522269 () Bool)

(assert (=> mapNonEmpty!31659 (= mapRes!31659 (and tp!60721 e!522269))))

(declare-fun mapKey!31659 () (_ BitVec 32))

(declare-fun mapRest!31659 () (Array (_ BitVec 32) ValueCell!9486))

(declare-fun mapValue!31659 () ValueCell!9486)

(assert (=> mapNonEmpty!31659 (= (arr!26855 _values!1231) (store mapRest!31659 mapKey!31659 mapValue!31659))))

(declare-fun res!626335 () Bool)

(assert (=> start!79214 (=> (not res!626335) (not e!522270))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79214 (= res!626335 (validMask!0 mask!1881))))

(assert (=> start!79214 e!522270))

(assert (=> start!79214 true))

(assert (=> start!79214 tp_is_empty!19935))

(declare-fun e!522268 () Bool)

(declare-fun array_inv!20896 (array!55820) Bool)

(assert (=> start!79214 (and (array_inv!20896 _values!1231) e!522268)))

(assert (=> start!79214 tp!60722))

(declare-fun array_inv!20897 (array!55818) Bool)

(assert (=> start!79214 (array_inv!20897 _keys!1487)))

(declare-fun b!930070 () Bool)

(assert (=> b!930070 (= e!522268 (and e!522266 mapRes!31659))))

(declare-fun condMapEmpty!31659 () Bool)

(declare-fun mapDefault!31659 () ValueCell!9486)

(assert (=> b!930070 (= condMapEmpty!31659 (= (arr!26855 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9486)) mapDefault!31659)))))

(declare-fun b!930071 () Bool)

(assert (=> b!930071 (= e!522269 tp_is_empty!19935)))

(assert (= (and start!79214 res!626335) b!930062))

(assert (= (and b!930062 res!626340) b!930064))

(assert (= (and b!930064 res!626334) b!930068))

(assert (= (and b!930068 res!626339) b!930067))

(assert (= (and b!930067 res!626338) b!930066))

(assert (= (and b!930066 res!626341) b!930069))

(assert (= (and b!930069 res!626337) b!930065))

(assert (= (and b!930065 res!626336) b!930063))

(assert (= (and b!930070 condMapEmpty!31659) mapIsEmpty!31659))

(assert (= (and b!930070 (not condMapEmpty!31659)) mapNonEmpty!31659))

(get-info :version)

(assert (= (and mapNonEmpty!31659 ((_ is ValueCellFull!9486) mapValue!31659)) b!930071))

(assert (= (and b!930070 ((_ is ValueCellFull!9486) mapDefault!31659)) b!930061))

(assert (= start!79214 b!930070))

(declare-fun m!864415 () Bool)

(assert (=> b!930064 m!864415))

(declare-fun m!864417 () Bool)

(assert (=> mapNonEmpty!31659 m!864417))

(declare-fun m!864419 () Bool)

(assert (=> b!930069 m!864419))

(declare-fun m!864421 () Bool)

(assert (=> b!930068 m!864421))

(declare-fun m!864423 () Bool)

(assert (=> b!930063 m!864423))

(assert (=> b!930063 m!864423))

(declare-fun m!864425 () Bool)

(assert (=> b!930063 m!864425))

(declare-fun m!864427 () Bool)

(assert (=> start!79214 m!864427))

(declare-fun m!864429 () Bool)

(assert (=> start!79214 m!864429))

(declare-fun m!864431 () Bool)

(assert (=> start!79214 m!864431))

(declare-fun m!864433 () Bool)

(assert (=> b!930066 m!864433))

(declare-fun m!864435 () Bool)

(assert (=> b!930066 m!864435))

(check-sat tp_is_empty!19935 (not b!930068) (not start!79214) (not mapNonEmpty!31659) (not b!930069) (not b!930064) (not b!930063) (not b!930066) b_and!28493 (not b_next!17427))
(check-sat b_and!28493 (not b_next!17427))
