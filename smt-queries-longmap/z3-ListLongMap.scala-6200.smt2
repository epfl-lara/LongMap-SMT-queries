; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79310 () Bool)

(assert start!79310)

(declare-fun b_free!17523 () Bool)

(declare-fun b_next!17523 () Bool)

(assert (=> start!79310 (= b_free!17523 (not b_next!17523))))

(declare-fun tp!61009 () Bool)

(declare-fun b_and!28597 () Bool)

(assert (=> start!79310 (= tp!61009 b_and!28597)))

(declare-fun b!931537 () Bool)

(declare-fun res!627378 () Bool)

(declare-fun e!523150 () Bool)

(assert (=> b!931537 (=> (not res!627378) (not e!523150))))

(declare-datatypes ((array!56002 0))(
  ( (array!56003 (arr!26946 (Array (_ BitVec 32) (_ BitVec 64))) (size!27405 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56002)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56002 (_ BitVec 32)) Bool)

(assert (=> b!931537 (= res!627378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931538 () Bool)

(declare-fun e!523145 () Bool)

(declare-fun e!523147 () Bool)

(assert (=> b!931538 (= e!523145 e!523147)))

(declare-fun res!627375 () Bool)

(assert (=> b!931538 (=> (not res!627375) (not e!523147))))

(declare-fun lt!419453 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931538 (= res!627375 (validKeyInArray!0 lt!419453))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!931538 (= lt!419453 (select (arr!26946 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!931539 () Bool)

(declare-fun res!627374 () Bool)

(assert (=> b!931539 (=> (not res!627374) (not e!523150))))

(assert (=> b!931539 (= res!627374 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27405 _keys!1487))))))

(declare-fun b!931540 () Bool)

(declare-fun res!627373 () Bool)

(assert (=> b!931540 (=> (not res!627373) (not e!523145))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!931540 (= res!627373 (validKeyInArray!0 k0!1099))))

(declare-fun b!931541 () Bool)

(declare-fun e!523148 () Bool)

(declare-fun tp_is_empty!20031 () Bool)

(assert (=> b!931541 (= e!523148 tp_is_empty!20031)))

(declare-fun b!931542 () Bool)

(declare-fun e!523149 () Bool)

(assert (=> b!931542 (= e!523149 tp_is_empty!20031)))

(declare-fun b!931543 () Bool)

(declare-fun res!627372 () Bool)

(assert (=> b!931543 (=> (not res!627372) (not e!523145))))

(declare-datatypes ((V!31673 0))(
  ( (V!31674 (val!10066 Int)) )
))
(declare-datatypes ((tuple2!13184 0))(
  ( (tuple2!13185 (_1!6603 (_ BitVec 64)) (_2!6603 V!31673)) )
))
(declare-datatypes ((List!18969 0))(
  ( (Nil!18966) (Cons!18965 (h!20111 tuple2!13184) (t!27036 List!18969)) )
))
(declare-datatypes ((ListLongMap!11881 0))(
  ( (ListLongMap!11882 (toList!5956 List!18969)) )
))
(declare-fun lt!419455 () ListLongMap!11881)

(declare-fun v!791 () V!31673)

(declare-fun apply!773 (ListLongMap!11881 (_ BitVec 64)) V!31673)

(assert (=> b!931543 (= res!627372 (= (apply!773 lt!419455 k0!1099) v!791))))

(declare-fun b!931544 () Bool)

(declare-fun res!627379 () Bool)

(assert (=> b!931544 (=> (not res!627379) (not e!523145))))

(assert (=> b!931544 (= res!627379 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31803 () Bool)

(declare-fun mapRes!31803 () Bool)

(assert (=> mapIsEmpty!31803 mapRes!31803))

(declare-fun b!931545 () Bool)

(declare-datatypes ((ValueCell!9534 0))(
  ( (ValueCellFull!9534 (v!12584 V!31673)) (EmptyCell!9534) )
))
(declare-datatypes ((array!56004 0))(
  ( (array!56005 (arr!26947 (Array (_ BitVec 32) ValueCell!9534)) (size!27406 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56004)

(assert (=> b!931545 (= e!523147 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27406 _values!1231))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31673)

(declare-fun minValue!1173 () V!31673)

(declare-fun getCurrentListMap!3194 (array!56002 array!56004 (_ BitVec 32) (_ BitVec 32) V!31673 V!31673 (_ BitVec 32) Int) ListLongMap!11881)

(declare-fun +!2763 (ListLongMap!11881 tuple2!13184) ListLongMap!11881)

(declare-fun get!14160 (ValueCell!9534 V!31673) V!31673)

(declare-fun dynLambda!1552 (Int (_ BitVec 64)) V!31673)

(assert (=> b!931545 (= (getCurrentListMap!3194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2763 (getCurrentListMap!3194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13185 lt!419453 (get!14160 (select (arr!26947 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1552 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31436 0))(
  ( (Unit!31437) )
))
(declare-fun lt!419454 () Unit!31436)

(declare-fun lemmaListMapRecursiveValidKeyArray!153 (array!56002 array!56004 (_ BitVec 32) (_ BitVec 32) V!31673 V!31673 (_ BitVec 32) Int) Unit!31436)

(assert (=> b!931545 (= lt!419454 (lemmaListMapRecursiveValidKeyArray!153 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!931546 () Bool)

(declare-fun e!523144 () Bool)

(assert (=> b!931546 (= e!523144 (and e!523148 mapRes!31803))))

(declare-fun condMapEmpty!31803 () Bool)

(declare-fun mapDefault!31803 () ValueCell!9534)

(assert (=> b!931546 (= condMapEmpty!31803 (= (arr!26947 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9534)) mapDefault!31803)))))

(declare-fun b!931547 () Bool)

(declare-fun res!627371 () Bool)

(assert (=> b!931547 (=> (not res!627371) (not e!523150))))

(assert (=> b!931547 (= res!627371 (and (= (size!27406 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27405 _keys!1487) (size!27406 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31803 () Bool)

(declare-fun tp!61010 () Bool)

(assert (=> mapNonEmpty!31803 (= mapRes!31803 (and tp!61010 e!523149))))

(declare-fun mapRest!31803 () (Array (_ BitVec 32) ValueCell!9534))

(declare-fun mapKey!31803 () (_ BitVec 32))

(declare-fun mapValue!31803 () ValueCell!9534)

(assert (=> mapNonEmpty!31803 (= (arr!26947 _values!1231) (store mapRest!31803 mapKey!31803 mapValue!31803))))

(declare-fun res!627370 () Bool)

(assert (=> start!79310 (=> (not res!627370) (not e!523150))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79310 (= res!627370 (validMask!0 mask!1881))))

(assert (=> start!79310 e!523150))

(assert (=> start!79310 true))

(assert (=> start!79310 tp_is_empty!20031))

(declare-fun array_inv!20974 (array!56004) Bool)

(assert (=> start!79310 (and (array_inv!20974 _values!1231) e!523144)))

(assert (=> start!79310 tp!61009))

(declare-fun array_inv!20975 (array!56002) Bool)

(assert (=> start!79310 (array_inv!20975 _keys!1487)))

(declare-fun b!931548 () Bool)

(assert (=> b!931548 (= e!523150 e!523145)))

(declare-fun res!627376 () Bool)

(assert (=> b!931548 (=> (not res!627376) (not e!523145))))

(declare-fun contains!5003 (ListLongMap!11881 (_ BitVec 64)) Bool)

(assert (=> b!931548 (= res!627376 (contains!5003 lt!419455 k0!1099))))

(assert (=> b!931548 (= lt!419455 (getCurrentListMap!3194 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931549 () Bool)

(declare-fun res!627377 () Bool)

(assert (=> b!931549 (=> (not res!627377) (not e!523150))))

(declare-datatypes ((List!18970 0))(
  ( (Nil!18967) (Cons!18966 (h!20112 (_ BitVec 64)) (t!27037 List!18970)) )
))
(declare-fun arrayNoDuplicates!0 (array!56002 (_ BitVec 32) List!18970) Bool)

(assert (=> b!931549 (= res!627377 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18967))))

(assert (= (and start!79310 res!627370) b!931547))

(assert (= (and b!931547 res!627371) b!931537))

(assert (= (and b!931537 res!627378) b!931549))

(assert (= (and b!931549 res!627377) b!931539))

(assert (= (and b!931539 res!627374) b!931548))

(assert (= (and b!931548 res!627376) b!931543))

(assert (= (and b!931543 res!627372) b!931544))

(assert (= (and b!931544 res!627379) b!931540))

(assert (= (and b!931540 res!627373) b!931538))

(assert (= (and b!931538 res!627375) b!931545))

(assert (= (and b!931546 condMapEmpty!31803) mapIsEmpty!31803))

(assert (= (and b!931546 (not condMapEmpty!31803)) mapNonEmpty!31803))

(get-info :version)

(assert (= (and mapNonEmpty!31803 ((_ is ValueCellFull!9534) mapValue!31803)) b!931542))

(assert (= (and b!931546 ((_ is ValueCellFull!9534) mapDefault!31803)) b!931541))

(assert (= start!79310 b!931546))

(declare-fun b_lambda!13839 () Bool)

(assert (=> (not b_lambda!13839) (not b!931545)))

(declare-fun t!27035 () Bool)

(declare-fun tb!5917 () Bool)

(assert (=> (and start!79310 (= defaultEntry!1235 defaultEntry!1235) t!27035) tb!5917))

(declare-fun result!11657 () Bool)

(assert (=> tb!5917 (= result!11657 tp_is_empty!20031)))

(assert (=> b!931545 t!27035))

(declare-fun b_and!28599 () Bool)

(assert (= b_and!28597 (and (=> t!27035 result!11657) b_and!28599)))

(declare-fun m!865415 () Bool)

(assert (=> start!79310 m!865415))

(declare-fun m!865417 () Bool)

(assert (=> start!79310 m!865417))

(declare-fun m!865419 () Bool)

(assert (=> start!79310 m!865419))

(declare-fun m!865421 () Bool)

(assert (=> b!931537 m!865421))

(declare-fun m!865423 () Bool)

(assert (=> mapNonEmpty!31803 m!865423))

(declare-fun m!865425 () Bool)

(assert (=> b!931543 m!865425))

(declare-fun m!865427 () Bool)

(assert (=> b!931549 m!865427))

(declare-fun m!865429 () Bool)

(assert (=> b!931538 m!865429))

(declare-fun m!865431 () Bool)

(assert (=> b!931538 m!865431))

(declare-fun m!865433 () Bool)

(assert (=> b!931548 m!865433))

(declare-fun m!865435 () Bool)

(assert (=> b!931548 m!865435))

(declare-fun m!865437 () Bool)

(assert (=> b!931545 m!865437))

(assert (=> b!931545 m!865437))

(declare-fun m!865439 () Bool)

(assert (=> b!931545 m!865439))

(declare-fun m!865441 () Bool)

(assert (=> b!931545 m!865441))

(declare-fun m!865443 () Bool)

(assert (=> b!931545 m!865443))

(declare-fun m!865445 () Bool)

(assert (=> b!931545 m!865445))

(declare-fun m!865447 () Bool)

(assert (=> b!931545 m!865447))

(assert (=> b!931545 m!865439))

(assert (=> b!931545 m!865445))

(declare-fun m!865449 () Bool)

(assert (=> b!931545 m!865449))

(declare-fun m!865451 () Bool)

(assert (=> b!931540 m!865451))

(check-sat (not b_next!17523) (not b!931538) (not b!931540) b_and!28599 (not b!931543) (not start!79310) (not mapNonEmpty!31803) (not b_lambda!13839) (not b!931537) (not b!931548) tp_is_empty!20031 (not b!931545) (not b!931549))
(check-sat b_and!28599 (not b_next!17523))
