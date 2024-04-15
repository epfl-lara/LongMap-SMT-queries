; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78942 () Bool)

(assert start!78942)

(declare-fun b_free!17173 () Bool)

(declare-fun b_next!17173 () Bool)

(assert (=> start!78942 (= b_free!17173 (not b_next!17173))))

(declare-fun tp!59960 () Bool)

(declare-fun b_and!28057 () Bool)

(assert (=> start!78942 (= tp!59960 b_and!28057)))

(declare-fun b!923662 () Bool)

(declare-fun e!518279 () Bool)

(declare-fun tp_is_empty!19681 () Bool)

(assert (=> b!923662 (= e!518279 tp_is_empty!19681)))

(declare-fun b!923663 () Bool)

(declare-fun res!622755 () Bool)

(declare-fun e!518274 () Bool)

(assert (=> b!923663 (=> (not res!622755) (not e!518274))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55307 0))(
  ( (array!55308 (arr!26599 (Array (_ BitVec 32) (_ BitVec 64))) (size!27060 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55307)

(assert (=> b!923663 (= res!622755 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27060 _keys!1487))))))

(declare-fun b!923664 () Bool)

(declare-datatypes ((Unit!31094 0))(
  ( (Unit!31095) )
))
(declare-fun e!518278 () Unit!31094)

(declare-fun e!518276 () Unit!31094)

(assert (=> b!923664 (= e!518278 e!518276)))

(declare-fun lt!415014 () (_ BitVec 64))

(assert (=> b!923664 (= lt!415014 (select (arr!26599 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!96272 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!923664 (= c!96272 (validKeyInArray!0 lt!415014))))

(declare-fun b!923665 () Bool)

(declare-fun res!622758 () Bool)

(assert (=> b!923665 (=> (not res!622758) (not e!518274))))

(declare-datatypes ((List!18724 0))(
  ( (Nil!18721) (Cons!18720 (h!19866 (_ BitVec 64)) (t!26618 List!18724)) )
))
(declare-fun arrayNoDuplicates!0 (array!55307 (_ BitVec 32) List!18724) Bool)

(assert (=> b!923665 (= res!622758 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18721))))

(declare-fun mapIsEmpty!31278 () Bool)

(declare-fun mapRes!31278 () Bool)

(assert (=> mapIsEmpty!31278 mapRes!31278))

(declare-fun b!923666 () Bool)

(declare-fun e!518271 () Bool)

(declare-fun e!518280 () Bool)

(assert (=> b!923666 (= e!518271 e!518280)))

(declare-fun res!622761 () Bool)

(assert (=> b!923666 (=> (not res!622761) (not e!518280))))

(declare-datatypes ((V!31207 0))(
  ( (V!31208 (val!9891 Int)) )
))
(declare-fun v!791 () V!31207)

(declare-fun lt!415009 () V!31207)

(assert (=> b!923666 (= res!622761 (and (= lt!415009 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!12944 0))(
  ( (tuple2!12945 (_1!6483 (_ BitVec 64)) (_2!6483 V!31207)) )
))
(declare-datatypes ((List!18725 0))(
  ( (Nil!18722) (Cons!18721 (h!19867 tuple2!12944) (t!26619 List!18725)) )
))
(declare-datatypes ((ListLongMap!11631 0))(
  ( (ListLongMap!11632 (toList!5831 List!18725)) )
))
(declare-fun lt!415016 () ListLongMap!11631)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!643 (ListLongMap!11631 (_ BitVec 64)) V!31207)

(assert (=> b!923666 (= lt!415009 (apply!643 lt!415016 k0!1099))))

(declare-fun mapNonEmpty!31278 () Bool)

(declare-fun tp!59961 () Bool)

(assert (=> mapNonEmpty!31278 (= mapRes!31278 (and tp!59961 e!518279))))

(declare-datatypes ((ValueCell!9359 0))(
  ( (ValueCellFull!9359 (v!12408 V!31207)) (EmptyCell!9359) )
))
(declare-fun mapValue!31278 () ValueCell!9359)

(declare-datatypes ((array!55309 0))(
  ( (array!55310 (arr!26600 (Array (_ BitVec 32) ValueCell!9359)) (size!27061 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55309)

(declare-fun mapKey!31278 () (_ BitVec 32))

(declare-fun mapRest!31278 () (Array (_ BitVec 32) ValueCell!9359))

(assert (=> mapNonEmpty!31278 (= (arr!26600 _values!1231) (store mapRest!31278 mapKey!31278 mapValue!31278))))

(declare-fun b!923667 () Bool)

(declare-fun lt!415008 () ListLongMap!11631)

(assert (=> b!923667 (= (apply!643 lt!415008 k0!1099) lt!415009)))

(declare-fun lt!415006 () Unit!31094)

(declare-fun lt!415010 () V!31207)

(declare-fun addApplyDifferent!360 (ListLongMap!11631 (_ BitVec 64) V!31207 (_ BitVec 64)) Unit!31094)

(assert (=> b!923667 (= lt!415006 (addApplyDifferent!360 lt!415016 lt!415014 lt!415010 k0!1099))))

(assert (=> b!923667 (not (= lt!415014 k0!1099))))

(declare-fun lt!415013 () Unit!31094)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55307 (_ BitVec 64) (_ BitVec 32) List!18724) Unit!31094)

(assert (=> b!923667 (= lt!415013 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18721))))

(declare-fun e!518272 () Bool)

(assert (=> b!923667 e!518272))

(declare-fun c!96274 () Bool)

(assert (=> b!923667 (= c!96274 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!415007 () Unit!31094)

(declare-fun zeroValue!1173 () V!31207)

(declare-fun minValue!1173 () V!31207)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!220 (array!55307 array!55309 (_ BitVec 32) (_ BitVec 32) V!31207 V!31207 (_ BitVec 64) (_ BitVec 32) Int) Unit!31094)

(assert (=> b!923667 (= lt!415007 (lemmaListMapContainsThenArrayContainsFrom!220 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!923667 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18721)))

(declare-fun lt!415012 () Unit!31094)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55307 (_ BitVec 32) (_ BitVec 32)) Unit!31094)

(assert (=> b!923667 (= lt!415012 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun contains!4844 (ListLongMap!11631 (_ BitVec 64)) Bool)

(assert (=> b!923667 (contains!4844 lt!415008 k0!1099)))

(declare-fun lt!415002 () tuple2!12944)

(declare-fun +!2732 (ListLongMap!11631 tuple2!12944) ListLongMap!11631)

(assert (=> b!923667 (= lt!415008 (+!2732 lt!415016 lt!415002))))

(declare-fun lt!415004 () Unit!31094)

(declare-fun addStillContains!429 (ListLongMap!11631 (_ BitVec 64) V!31207 (_ BitVec 64)) Unit!31094)

(assert (=> b!923667 (= lt!415004 (addStillContains!429 lt!415016 lt!415014 lt!415010 k0!1099))))

(declare-fun getCurrentListMap!3018 (array!55307 array!55309 (_ BitVec 32) (_ BitVec 32) V!31207 V!31207 (_ BitVec 32) Int) ListLongMap!11631)

(assert (=> b!923667 (= (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2732 (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!415002))))

(assert (=> b!923667 (= lt!415002 (tuple2!12945 lt!415014 lt!415010))))

(declare-fun get!13985 (ValueCell!9359 V!31207) V!31207)

(declare-fun dynLambda!1488 (Int (_ BitVec 64)) V!31207)

(assert (=> b!923667 (= lt!415010 (get!13985 (select (arr!26600 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1488 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!415005 () Unit!31094)

(declare-fun lemmaListMapRecursiveValidKeyArray!96 (array!55307 array!55309 (_ BitVec 32) (_ BitVec 32) V!31207 V!31207 (_ BitVec 32) Int) Unit!31094)

(assert (=> b!923667 (= lt!415005 (lemmaListMapRecursiveValidKeyArray!96 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!923667 (= e!518276 lt!415006)))

(declare-fun b!923668 () Bool)

(declare-fun e!518269 () Bool)

(assert (=> b!923668 (= e!518269 false)))

(declare-fun lt!415003 () V!31207)

(declare-fun lt!415015 () ListLongMap!11631)

(assert (=> b!923668 (= lt!415003 (apply!643 lt!415015 k0!1099))))

(declare-fun b!923669 () Bool)

(declare-fun e!518275 () Bool)

(declare-fun e!518277 () Bool)

(assert (=> b!923669 (= e!518275 (and e!518277 mapRes!31278))))

(declare-fun condMapEmpty!31278 () Bool)

(declare-fun mapDefault!31278 () ValueCell!9359)

(assert (=> b!923669 (= condMapEmpty!31278 (= (arr!26600 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9359)) mapDefault!31278)))))

(declare-fun res!622760 () Bool)

(assert (=> start!78942 (=> (not res!622760) (not e!518274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78942 (= res!622760 (validMask!0 mask!1881))))

(assert (=> start!78942 e!518274))

(assert (=> start!78942 true))

(assert (=> start!78942 tp_is_empty!19681))

(declare-fun array_inv!20802 (array!55309) Bool)

(assert (=> start!78942 (and (array_inv!20802 _values!1231) e!518275)))

(assert (=> start!78942 tp!59960))

(declare-fun array_inv!20803 (array!55307) Bool)

(assert (=> start!78942 (array_inv!20803 _keys!1487)))

(declare-fun b!923670 () Bool)

(assert (=> b!923670 (= e!518274 e!518271)))

(declare-fun res!622763 () Bool)

(assert (=> b!923670 (=> (not res!622763) (not e!518271))))

(assert (=> b!923670 (= res!622763 (contains!4844 lt!415016 k0!1099))))

(assert (=> b!923670 (= lt!415016 (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!923671 () Bool)

(declare-fun e!518273 () Bool)

(assert (=> b!923671 (= e!518273 e!518269)))

(declare-fun res!622757 () Bool)

(assert (=> b!923671 (=> (not res!622757) (not e!518269))))

(assert (=> b!923671 (= res!622757 (contains!4844 lt!415015 k0!1099))))

(assert (=> b!923671 (= lt!415015 (getCurrentListMap!3018 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!923672 () Bool)

(declare-fun arrayContainsKey!0 (array!55307 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!923672 (= e!518272 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!923673 () Bool)

(assert (=> b!923673 (= e!518277 tp_is_empty!19681)))

(declare-fun b!923674 () Bool)

(declare-fun res!622759 () Bool)

(assert (=> b!923674 (=> (not res!622759) (not e!518274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55307 (_ BitVec 32)) Bool)

(assert (=> b!923674 (= res!622759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!923675 () Bool)

(assert (=> b!923675 (= e!518272 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!923676 () Bool)

(declare-fun Unit!31096 () Unit!31094)

(assert (=> b!923676 (= e!518278 Unit!31096)))

(declare-fun b!923677 () Bool)

(declare-fun res!622762 () Bool)

(assert (=> b!923677 (=> (not res!622762) (not e!518274))))

(assert (=> b!923677 (= res!622762 (and (= (size!27061 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27060 _keys!1487) (size!27061 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!923678 () Bool)

(assert (=> b!923678 (= e!518280 e!518273)))

(declare-fun res!622756 () Bool)

(assert (=> b!923678 (=> (not res!622756) (not e!518273))))

(assert (=> b!923678 (= res!622756 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27060 _keys!1487)))))

(declare-fun lt!415011 () Unit!31094)

(assert (=> b!923678 (= lt!415011 e!518278)))

(declare-fun c!96273 () Bool)

(assert (=> b!923678 (= c!96273 (validKeyInArray!0 k0!1099))))

(declare-fun b!923679 () Bool)

(declare-fun Unit!31097 () Unit!31094)

(assert (=> b!923679 (= e!518276 Unit!31097)))

(assert (= (and start!78942 res!622760) b!923677))

(assert (= (and b!923677 res!622762) b!923674))

(assert (= (and b!923674 res!622759) b!923665))

(assert (= (and b!923665 res!622758) b!923663))

(assert (= (and b!923663 res!622755) b!923670))

(assert (= (and b!923670 res!622763) b!923666))

(assert (= (and b!923666 res!622761) b!923678))

(assert (= (and b!923678 c!96273) b!923664))

(assert (= (and b!923678 (not c!96273)) b!923676))

(assert (= (and b!923664 c!96272) b!923667))

(assert (= (and b!923664 (not c!96272)) b!923679))

(assert (= (and b!923667 c!96274) b!923672))

(assert (= (and b!923667 (not c!96274)) b!923675))

(assert (= (and b!923678 res!622756) b!923671))

(assert (= (and b!923671 res!622757) b!923668))

(assert (= (and b!923669 condMapEmpty!31278) mapIsEmpty!31278))

(assert (= (and b!923669 (not condMapEmpty!31278)) mapNonEmpty!31278))

(get-info :version)

(assert (= (and mapNonEmpty!31278 ((_ is ValueCellFull!9359) mapValue!31278)) b!923662))

(assert (= (and b!923669 ((_ is ValueCellFull!9359) mapDefault!31278)) b!923673))

(assert (= start!78942 b!923669))

(declare-fun b_lambda!13657 () Bool)

(assert (=> (not b_lambda!13657) (not b!923667)))

(declare-fun t!26617 () Bool)

(declare-fun tb!5745 () Bool)

(assert (=> (and start!78942 (= defaultEntry!1235 defaultEntry!1235) t!26617) tb!5745))

(declare-fun result!11321 () Bool)

(assert (=> tb!5745 (= result!11321 tp_is_empty!19681)))

(assert (=> b!923667 t!26617))

(declare-fun b_and!28059 () Bool)

(assert (= b_and!28057 (and (=> t!26617 result!11321) b_and!28059)))

(declare-fun m!857395 () Bool)

(assert (=> b!923670 m!857395))

(declare-fun m!857397 () Bool)

(assert (=> b!923670 m!857397))

(declare-fun m!857399 () Bool)

(assert (=> b!923668 m!857399))

(declare-fun m!857401 () Bool)

(assert (=> b!923672 m!857401))

(declare-fun m!857403 () Bool)

(assert (=> b!923664 m!857403))

(declare-fun m!857405 () Bool)

(assert (=> b!923664 m!857405))

(declare-fun m!857407 () Bool)

(assert (=> b!923665 m!857407))

(declare-fun m!857409 () Bool)

(assert (=> b!923678 m!857409))

(declare-fun m!857411 () Bool)

(assert (=> mapNonEmpty!31278 m!857411))

(declare-fun m!857413 () Bool)

(assert (=> b!923674 m!857413))

(declare-fun m!857415 () Bool)

(assert (=> b!923666 m!857415))

(declare-fun m!857417 () Bool)

(assert (=> b!923667 m!857417))

(declare-fun m!857419 () Bool)

(assert (=> b!923667 m!857419))

(declare-fun m!857421 () Bool)

(assert (=> b!923667 m!857421))

(declare-fun m!857423 () Bool)

(assert (=> b!923667 m!857423))

(assert (=> b!923667 m!857419))

(declare-fun m!857425 () Bool)

(assert (=> b!923667 m!857425))

(declare-fun m!857427 () Bool)

(assert (=> b!923667 m!857427))

(declare-fun m!857429 () Bool)

(assert (=> b!923667 m!857429))

(declare-fun m!857431 () Bool)

(assert (=> b!923667 m!857431))

(declare-fun m!857433 () Bool)

(assert (=> b!923667 m!857433))

(assert (=> b!923667 m!857425))

(declare-fun m!857435 () Bool)

(assert (=> b!923667 m!857435))

(declare-fun m!857437 () Bool)

(assert (=> b!923667 m!857437))

(assert (=> b!923667 m!857421))

(declare-fun m!857439 () Bool)

(assert (=> b!923667 m!857439))

(declare-fun m!857441 () Bool)

(assert (=> b!923667 m!857441))

(declare-fun m!857443 () Bool)

(assert (=> b!923667 m!857443))

(declare-fun m!857445 () Bool)

(assert (=> b!923667 m!857445))

(declare-fun m!857447 () Bool)

(assert (=> b!923667 m!857447))

(declare-fun m!857449 () Bool)

(assert (=> b!923671 m!857449))

(assert (=> b!923671 m!857429))

(declare-fun m!857451 () Bool)

(assert (=> start!78942 m!857451))

(declare-fun m!857453 () Bool)

(assert (=> start!78942 m!857453))

(declare-fun m!857455 () Bool)

(assert (=> start!78942 m!857455))

(check-sat (not b!923672) (not mapNonEmpty!31278) tp_is_empty!19681 (not b!923666) b_and!28059 (not b!923667) (not b!923668) (not b!923671) (not start!78942) (not b!923674) (not b_lambda!13657) (not b!923664) (not b!923678) (not b!923665) (not b_next!17173) (not b!923670))
(check-sat b_and!28059 (not b_next!17173))
