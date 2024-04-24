; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79452 () Bool)

(assert start!79452)

(declare-fun b_free!17497 () Bool)

(declare-fun b_next!17497 () Bool)

(assert (=> start!79452 (= b_free!17497 (not b_next!17497))))

(declare-fun tp!60933 () Bool)

(declare-fun b_and!28573 () Bool)

(assert (=> start!79452 (= tp!60933 b_and!28573)))

(declare-fun b!931989 () Bool)

(declare-fun res!627391 () Bool)

(declare-fun e!523480 () Bool)

(assert (=> b!931989 (=> (not res!627391) (not e!523480))))

(declare-datatypes ((array!56011 0))(
  ( (array!56012 (arr!26946 (Array (_ BitVec 32) (_ BitVec 64))) (size!27406 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56011)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-datatypes ((V!31639 0))(
  ( (V!31640 (val!10053 Int)) )
))
(declare-datatypes ((ValueCell!9521 0))(
  ( (ValueCellFull!9521 (v!12568 V!31639)) (EmptyCell!9521) )
))
(declare-datatypes ((array!56013 0))(
  ( (array!56014 (arr!26947 (Array (_ BitVec 32) ValueCell!9521)) (size!27407 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56013)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!931989 (= res!627391 (and (= (size!27407 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27406 _keys!1487) (size!27407 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931990 () Bool)

(declare-fun res!627390 () Bool)

(assert (=> b!931990 (=> (not res!627390) (not e!523480))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931990 (= res!627390 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27406 _keys!1487))))))

(declare-fun b!931991 () Bool)

(declare-fun res!627388 () Bool)

(assert (=> b!931991 (=> (not res!627388) (not e!523480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56011 (_ BitVec 32)) Bool)

(assert (=> b!931991 (= res!627388 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931992 () Bool)

(declare-fun e!523483 () Bool)

(declare-fun e!523479 () Bool)

(declare-fun mapRes!31764 () Bool)

(assert (=> b!931992 (= e!523483 (and e!523479 mapRes!31764))))

(declare-fun condMapEmpty!31764 () Bool)

(declare-fun mapDefault!31764 () ValueCell!9521)

(assert (=> b!931992 (= condMapEmpty!31764 (= (arr!26947 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9521)) mapDefault!31764)))))

(declare-fun res!627389 () Bool)

(assert (=> start!79452 (=> (not res!627389) (not e!523480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79452 (= res!627389 (validMask!0 mask!1881))))

(assert (=> start!79452 e!523480))

(assert (=> start!79452 true))

(declare-fun array_inv!21068 (array!56013) Bool)

(assert (=> start!79452 (and (array_inv!21068 _values!1231) e!523483)))

(assert (=> start!79452 tp!60933))

(declare-fun array_inv!21069 (array!56011) Bool)

(assert (=> start!79452 (array_inv!21069 _keys!1487)))

(declare-fun tp_is_empty!20005 () Bool)

(assert (=> start!79452 tp_is_empty!20005))

(declare-fun b!931993 () Bool)

(declare-fun e!523482 () Bool)

(assert (=> b!931993 (= e!523482 tp_is_empty!20005)))

(declare-fun b!931994 () Bool)

(declare-fun e!523481 () Bool)

(assert (=> b!931994 (= e!523481 false)))

(declare-fun lt!419732 () V!31639)

(declare-datatypes ((tuple2!13156 0))(
  ( (tuple2!13157 (_1!6589 (_ BitVec 64)) (_2!6589 V!31639)) )
))
(declare-datatypes ((List!18944 0))(
  ( (Nil!18941) (Cons!18940 (h!20092 tuple2!13156) (t!26993 List!18944)) )
))
(declare-datatypes ((ListLongMap!11855 0))(
  ( (ListLongMap!11856 (toList!5943 List!18944)) )
))
(declare-fun lt!419731 () ListLongMap!11855)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!777 (ListLongMap!11855 (_ BitVec 64)) V!31639)

(assert (=> b!931994 (= lt!419732 (apply!777 lt!419731 k0!1099))))

(declare-fun mapNonEmpty!31764 () Bool)

(declare-fun tp!60932 () Bool)

(assert (=> mapNonEmpty!31764 (= mapRes!31764 (and tp!60932 e!523482))))

(declare-fun mapRest!31764 () (Array (_ BitVec 32) ValueCell!9521))

(declare-fun mapKey!31764 () (_ BitVec 32))

(declare-fun mapValue!31764 () ValueCell!9521)

(assert (=> mapNonEmpty!31764 (= (arr!26947 _values!1231) (store mapRest!31764 mapKey!31764 mapValue!31764))))

(declare-fun b!931995 () Bool)

(assert (=> b!931995 (= e!523479 tp_is_empty!20005)))

(declare-fun b!931996 () Bool)

(declare-fun res!627392 () Bool)

(assert (=> b!931996 (=> (not res!627392) (not e!523480))))

(declare-datatypes ((List!18945 0))(
  ( (Nil!18942) (Cons!18941 (h!20093 (_ BitVec 64)) (t!26994 List!18945)) )
))
(declare-fun arrayNoDuplicates!0 (array!56011 (_ BitVec 32) List!18945) Bool)

(assert (=> b!931996 (= res!627392 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18942))))

(declare-fun b!931997 () Bool)

(assert (=> b!931997 (= e!523480 e!523481)))

(declare-fun res!627393 () Bool)

(assert (=> b!931997 (=> (not res!627393) (not e!523481))))

(declare-fun contains!5008 (ListLongMap!11855 (_ BitVec 64)) Bool)

(assert (=> b!931997 (= res!627393 (contains!5008 lt!419731 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31639)

(declare-fun minValue!1173 () V!31639)

(declare-fun getCurrentListMap!3186 (array!56011 array!56013 (_ BitVec 32) (_ BitVec 32) V!31639 V!31639 (_ BitVec 32) Int) ListLongMap!11855)

(assert (=> b!931997 (= lt!419731 (getCurrentListMap!3186 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31764 () Bool)

(assert (=> mapIsEmpty!31764 mapRes!31764))

(assert (= (and start!79452 res!627389) b!931989))

(assert (= (and b!931989 res!627391) b!931991))

(assert (= (and b!931991 res!627388) b!931996))

(assert (= (and b!931996 res!627392) b!931990))

(assert (= (and b!931990 res!627390) b!931997))

(assert (= (and b!931997 res!627393) b!931994))

(assert (= (and b!931992 condMapEmpty!31764) mapIsEmpty!31764))

(assert (= (and b!931992 (not condMapEmpty!31764)) mapNonEmpty!31764))

(get-info :version)

(assert (= (and mapNonEmpty!31764 ((_ is ValueCellFull!9521) mapValue!31764)) b!931993))

(assert (= (and b!931992 ((_ is ValueCellFull!9521) mapDefault!31764)) b!931995))

(assert (= start!79452 b!931992))

(declare-fun m!866377 () Bool)

(assert (=> b!931994 m!866377))

(declare-fun m!866379 () Bool)

(assert (=> b!931996 m!866379))

(declare-fun m!866381 () Bool)

(assert (=> mapNonEmpty!31764 m!866381))

(declare-fun m!866383 () Bool)

(assert (=> b!931991 m!866383))

(declare-fun m!866385 () Bool)

(assert (=> start!79452 m!866385))

(declare-fun m!866387 () Bool)

(assert (=> start!79452 m!866387))

(declare-fun m!866389 () Bool)

(assert (=> start!79452 m!866389))

(declare-fun m!866391 () Bool)

(assert (=> b!931997 m!866391))

(declare-fun m!866393 () Bool)

(assert (=> b!931997 m!866393))

(check-sat tp_is_empty!20005 (not mapNonEmpty!31764) (not b!931991) (not b_next!17497) (not b!931994) (not start!79452) b_and!28573 (not b!931996) (not b!931997))
(check-sat b_and!28573 (not b_next!17497))
