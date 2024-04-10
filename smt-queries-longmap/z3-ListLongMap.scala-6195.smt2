; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79280 () Bool)

(assert start!79280)

(declare-fun b_free!17493 () Bool)

(declare-fun b_next!17493 () Bool)

(assert (=> start!79280 (= b_free!17493 (not b_next!17493))))

(declare-fun tp!60920 () Bool)

(declare-fun b_and!28559 () Bool)

(assert (=> start!79280 (= tp!60920 b_and!28559)))

(declare-fun b!931032 () Bool)

(declare-fun e!522863 () Bool)

(declare-fun tp_is_empty!20001 () Bool)

(assert (=> b!931032 (= e!522863 tp_is_empty!20001)))

(declare-fun res!627009 () Bool)

(declare-fun e!522864 () Bool)

(assert (=> start!79280 (=> (not res!627009) (not e!522864))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79280 (= res!627009 (validMask!0 mask!1881))))

(assert (=> start!79280 e!522864))

(assert (=> start!79280 true))

(declare-datatypes ((V!31633 0))(
  ( (V!31634 (val!10051 Int)) )
))
(declare-datatypes ((ValueCell!9519 0))(
  ( (ValueCellFull!9519 (v!12569 V!31633)) (EmptyCell!9519) )
))
(declare-datatypes ((array!55942 0))(
  ( (array!55943 (arr!26916 (Array (_ BitVec 32) ValueCell!9519)) (size!27375 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55942)

(declare-fun e!522862 () Bool)

(declare-fun array_inv!20948 (array!55942) Bool)

(assert (=> start!79280 (and (array_inv!20948 _values!1231) e!522862)))

(assert (=> start!79280 tp!60920))

(declare-datatypes ((array!55944 0))(
  ( (array!55945 (arr!26917 (Array (_ BitVec 32) (_ BitVec 64))) (size!27376 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55944)

(declare-fun array_inv!20949 (array!55944) Bool)

(assert (=> start!79280 (array_inv!20949 _keys!1487)))

(assert (=> start!79280 tp_is_empty!20001))

(declare-fun b!931033 () Bool)

(declare-fun e!522861 () Bool)

(assert (=> b!931033 (= e!522861 tp_is_empty!20001)))

(declare-fun b!931034 () Bool)

(declare-fun e!522865 () Bool)

(assert (=> b!931034 (= e!522865 false)))

(declare-fun lt!419359 () V!31633)

(declare-datatypes ((tuple2!13160 0))(
  ( (tuple2!13161 (_1!6591 (_ BitVec 64)) (_2!6591 V!31633)) )
))
(declare-datatypes ((List!18947 0))(
  ( (Nil!18944) (Cons!18943 (h!20089 tuple2!13160) (t!27004 List!18947)) )
))
(declare-datatypes ((ListLongMap!11857 0))(
  ( (ListLongMap!11858 (toList!5944 List!18947)) )
))
(declare-fun lt!419358 () ListLongMap!11857)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!765 (ListLongMap!11857 (_ BitVec 64)) V!31633)

(assert (=> b!931034 (= lt!419359 (apply!765 lt!419358 k0!1099))))

(declare-fun mapNonEmpty!31758 () Bool)

(declare-fun mapRes!31758 () Bool)

(declare-fun tp!60919 () Bool)

(assert (=> mapNonEmpty!31758 (= mapRes!31758 (and tp!60919 e!522863))))

(declare-fun mapRest!31758 () (Array (_ BitVec 32) ValueCell!9519))

(declare-fun mapKey!31758 () (_ BitVec 32))

(declare-fun mapValue!31758 () ValueCell!9519)

(assert (=> mapNonEmpty!31758 (= (arr!26916 _values!1231) (store mapRest!31758 mapKey!31758 mapValue!31758))))

(declare-fun b!931035 () Bool)

(declare-fun res!627008 () Bool)

(assert (=> b!931035 (=> (not res!627008) (not e!522864))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55944 (_ BitVec 32)) Bool)

(assert (=> b!931035 (= res!627008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931036 () Bool)

(declare-fun res!627013 () Bool)

(assert (=> b!931036 (=> (not res!627013) (not e!522864))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931036 (= res!627013 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27376 _keys!1487))))))

(declare-fun b!931037 () Bool)

(assert (=> b!931037 (= e!522862 (and e!522861 mapRes!31758))))

(declare-fun condMapEmpty!31758 () Bool)

(declare-fun mapDefault!31758 () ValueCell!9519)

(assert (=> b!931037 (= condMapEmpty!31758 (= (arr!26916 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9519)) mapDefault!31758)))))

(declare-fun mapIsEmpty!31758 () Bool)

(assert (=> mapIsEmpty!31758 mapRes!31758))

(declare-fun b!931038 () Bool)

(declare-fun res!627010 () Bool)

(assert (=> b!931038 (=> (not res!627010) (not e!522864))))

(declare-datatypes ((List!18948 0))(
  ( (Nil!18945) (Cons!18944 (h!20090 (_ BitVec 64)) (t!27005 List!18948)) )
))
(declare-fun arrayNoDuplicates!0 (array!55944 (_ BitVec 32) List!18948) Bool)

(assert (=> b!931038 (= res!627010 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18945))))

(declare-fun b!931039 () Bool)

(declare-fun res!627011 () Bool)

(assert (=> b!931039 (=> (not res!627011) (not e!522864))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931039 (= res!627011 (and (= (size!27375 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27376 _keys!1487) (size!27375 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931040 () Bool)

(assert (=> b!931040 (= e!522864 e!522865)))

(declare-fun res!627012 () Bool)

(assert (=> b!931040 (=> (not res!627012) (not e!522865))))

(declare-fun contains!4992 (ListLongMap!11857 (_ BitVec 64)) Bool)

(assert (=> b!931040 (= res!627012 (contains!4992 lt!419358 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31633)

(declare-fun minValue!1173 () V!31633)

(declare-fun getCurrentListMap!3183 (array!55944 array!55942 (_ BitVec 32) (_ BitVec 32) V!31633 V!31633 (_ BitVec 32) Int) ListLongMap!11857)

(assert (=> b!931040 (= lt!419358 (getCurrentListMap!3183 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(assert (= (and start!79280 res!627009) b!931039))

(assert (= (and b!931039 res!627011) b!931035))

(assert (= (and b!931035 res!627008) b!931038))

(assert (= (and b!931038 res!627010) b!931036))

(assert (= (and b!931036 res!627013) b!931040))

(assert (= (and b!931040 res!627012) b!931034))

(assert (= (and b!931037 condMapEmpty!31758) mapIsEmpty!31758))

(assert (= (and b!931037 (not condMapEmpty!31758)) mapNonEmpty!31758))

(get-info :version)

(assert (= (and mapNonEmpty!31758 ((_ is ValueCellFull!9519) mapValue!31758)) b!931032))

(assert (= (and b!931037 ((_ is ValueCellFull!9519) mapDefault!31758)) b!931033))

(assert (= start!79280 b!931037))

(declare-fun m!865047 () Bool)

(assert (=> b!931040 m!865047))

(declare-fun m!865049 () Bool)

(assert (=> b!931040 m!865049))

(declare-fun m!865051 () Bool)

(assert (=> b!931038 m!865051))

(declare-fun m!865053 () Bool)

(assert (=> start!79280 m!865053))

(declare-fun m!865055 () Bool)

(assert (=> start!79280 m!865055))

(declare-fun m!865057 () Bool)

(assert (=> start!79280 m!865057))

(declare-fun m!865059 () Bool)

(assert (=> mapNonEmpty!31758 m!865059))

(declare-fun m!865061 () Bool)

(assert (=> b!931034 m!865061))

(declare-fun m!865063 () Bool)

(assert (=> b!931035 m!865063))

(check-sat (not b!931040) (not b_next!17493) (not mapNonEmpty!31758) (not b!931038) b_and!28559 (not b!931034) tp_is_empty!20001 (not start!79280) (not b!931035))
(check-sat b_and!28559 (not b_next!17493))
