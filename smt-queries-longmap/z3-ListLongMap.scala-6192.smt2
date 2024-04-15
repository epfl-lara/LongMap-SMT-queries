; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79242 () Bool)

(assert start!79242)

(declare-fun b_free!17473 () Bool)

(declare-fun b_next!17473 () Bool)

(assert (=> start!79242 (= b_free!17473 (not b_next!17473))))

(declare-fun tp!60861 () Bool)

(declare-fun b_and!28513 () Bool)

(assert (=> start!79242 (= tp!60861 b_and!28513)))

(declare-fun b!930523 () Bool)

(declare-fun res!626723 () Bool)

(declare-fun e!522533 () Bool)

(assert (=> b!930523 (=> (not res!626723) (not e!522533))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!55873 0))(
  ( (array!55874 (arr!26882 (Array (_ BitVec 32) (_ BitVec 64))) (size!27343 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55873)

(assert (=> b!930523 (= res!626723 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27343 _keys!1487))))))

(declare-fun b!930525 () Bool)

(declare-fun e!522534 () Bool)

(declare-fun tp_is_empty!19981 () Bool)

(assert (=> b!930525 (= e!522534 tp_is_empty!19981)))

(declare-fun b!930526 () Bool)

(declare-fun e!522537 () Bool)

(declare-fun e!522535 () Bool)

(declare-fun mapRes!31728 () Bool)

(assert (=> b!930526 (= e!522537 (and e!522535 mapRes!31728))))

(declare-fun condMapEmpty!31728 () Bool)

(declare-datatypes ((V!31607 0))(
  ( (V!31608 (val!10041 Int)) )
))
(declare-datatypes ((ValueCell!9509 0))(
  ( (ValueCellFull!9509 (v!12558 V!31607)) (EmptyCell!9509) )
))
(declare-datatypes ((array!55875 0))(
  ( (array!55876 (arr!26883 (Array (_ BitVec 32) ValueCell!9509)) (size!27344 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55875)

(declare-fun mapDefault!31728 () ValueCell!9509)

(assert (=> b!930526 (= condMapEmpty!31728 (= (arr!26883 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9509)) mapDefault!31728)))))

(declare-fun mapIsEmpty!31728 () Bool)

(assert (=> mapIsEmpty!31728 mapRes!31728))

(declare-fun b!930527 () Bool)

(declare-fun res!626721 () Bool)

(assert (=> b!930527 (=> (not res!626721) (not e!522533))))

(declare-datatypes ((List!18948 0))(
  ( (Nil!18945) (Cons!18944 (h!20090 (_ BitVec 64)) (t!26996 List!18948)) )
))
(declare-fun arrayNoDuplicates!0 (array!55873 (_ BitVec 32) List!18948) Bool)

(assert (=> b!930527 (= res!626721 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18945))))

(declare-fun res!626720 () Bool)

(assert (=> start!79242 (=> (not res!626720) (not e!522533))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79242 (= res!626720 (validMask!0 mask!1881))))

(assert (=> start!79242 e!522533))

(assert (=> start!79242 true))

(declare-fun array_inv!20994 (array!55875) Bool)

(assert (=> start!79242 (and (array_inv!20994 _values!1231) e!522537)))

(assert (=> start!79242 tp!60861))

(declare-fun array_inv!20995 (array!55873) Bool)

(assert (=> start!79242 (array_inv!20995 _keys!1487)))

(assert (=> start!79242 tp_is_empty!19981))

(declare-fun b!930524 () Bool)

(declare-fun e!522536 () Bool)

(assert (=> b!930524 (= e!522536 false)))

(declare-fun lt!419062 () V!31607)

(declare-datatypes ((tuple2!13192 0))(
  ( (tuple2!13193 (_1!6607 (_ BitVec 64)) (_2!6607 V!31607)) )
))
(declare-datatypes ((List!18949 0))(
  ( (Nil!18946) (Cons!18945 (h!20091 tuple2!13192) (t!26997 List!18949)) )
))
(declare-datatypes ((ListLongMap!11879 0))(
  ( (ListLongMap!11880 (toList!5955 List!18949)) )
))
(declare-fun lt!419063 () ListLongMap!11879)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!752 (ListLongMap!11879 (_ BitVec 64)) V!31607)

(assert (=> b!930524 (= lt!419062 (apply!752 lt!419063 k0!1099))))

(declare-fun b!930528 () Bool)

(assert (=> b!930528 (= e!522535 tp_is_empty!19981)))

(declare-fun mapNonEmpty!31728 () Bool)

(declare-fun tp!60860 () Bool)

(assert (=> mapNonEmpty!31728 (= mapRes!31728 (and tp!60860 e!522534))))

(declare-fun mapRest!31728 () (Array (_ BitVec 32) ValueCell!9509))

(declare-fun mapValue!31728 () ValueCell!9509)

(declare-fun mapKey!31728 () (_ BitVec 32))

(assert (=> mapNonEmpty!31728 (= (arr!26883 _values!1231) (store mapRest!31728 mapKey!31728 mapValue!31728))))

(declare-fun b!930529 () Bool)

(assert (=> b!930529 (= e!522533 e!522536)))

(declare-fun res!626718 () Bool)

(assert (=> b!930529 (=> (not res!626718) (not e!522536))))

(declare-fun contains!4957 (ListLongMap!11879 (_ BitVec 64)) Bool)

(assert (=> b!930529 (= res!626718 (contains!4957 lt!419063 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31607)

(declare-fun minValue!1173 () V!31607)

(declare-fun getCurrentListMap!3131 (array!55873 array!55875 (_ BitVec 32) (_ BitVec 32) V!31607 V!31607 (_ BitVec 32) Int) ListLongMap!11879)

(assert (=> b!930529 (= lt!419063 (getCurrentListMap!3131 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930530 () Bool)

(declare-fun res!626719 () Bool)

(assert (=> b!930530 (=> (not res!626719) (not e!522533))))

(assert (=> b!930530 (= res!626719 (and (= (size!27344 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27343 _keys!1487) (size!27344 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!930531 () Bool)

(declare-fun res!626722 () Bool)

(assert (=> b!930531 (=> (not res!626722) (not e!522533))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55873 (_ BitVec 32)) Bool)

(assert (=> b!930531 (= res!626722 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79242 res!626720) b!930530))

(assert (= (and b!930530 res!626719) b!930531))

(assert (= (and b!930531 res!626722) b!930527))

(assert (= (and b!930527 res!626721) b!930523))

(assert (= (and b!930523 res!626723) b!930529))

(assert (= (and b!930529 res!626718) b!930524))

(assert (= (and b!930526 condMapEmpty!31728) mapIsEmpty!31728))

(assert (= (and b!930526 (not condMapEmpty!31728)) mapNonEmpty!31728))

(get-info :version)

(assert (= (and mapNonEmpty!31728 ((_ is ValueCellFull!9509) mapValue!31728)) b!930525))

(assert (= (and b!930526 ((_ is ValueCellFull!9509) mapDefault!31728)) b!930528))

(assert (= start!79242 b!930526))

(declare-fun m!864109 () Bool)

(assert (=> start!79242 m!864109))

(declare-fun m!864111 () Bool)

(assert (=> start!79242 m!864111))

(declare-fun m!864113 () Bool)

(assert (=> start!79242 m!864113))

(declare-fun m!864115 () Bool)

(assert (=> b!930524 m!864115))

(declare-fun m!864117 () Bool)

(assert (=> b!930527 m!864117))

(declare-fun m!864119 () Bool)

(assert (=> b!930529 m!864119))

(declare-fun m!864121 () Bool)

(assert (=> b!930529 m!864121))

(declare-fun m!864123 () Bool)

(assert (=> mapNonEmpty!31728 m!864123))

(declare-fun m!864125 () Bool)

(assert (=> b!930531 m!864125))

(check-sat (not b!930527) (not b!930531) (not b!930529) (not start!79242) (not b!930524) b_and!28513 tp_is_empty!19981 (not mapNonEmpty!31728) (not b_next!17473))
(check-sat b_and!28513 (not b_next!17473))
