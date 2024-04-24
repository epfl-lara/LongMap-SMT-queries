; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79470 () Bool)

(assert start!79470)

(declare-fun b_free!17515 () Bool)

(declare-fun b_next!17515 () Bool)

(assert (=> start!79470 (= b_free!17515 (not b_next!17515))))

(declare-fun tp!60987 () Bool)

(declare-fun b_and!28591 () Bool)

(assert (=> start!79470 (= tp!60987 b_and!28591)))

(declare-fun b!932276 () Bool)

(declare-fun res!627594 () Bool)

(declare-fun e!523644 () Bool)

(assert (=> b!932276 (=> (not res!627594) (not e!523644))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31663 0))(
  ( (V!31664 (val!10062 Int)) )
))
(declare-fun v!791 () V!31663)

(declare-datatypes ((tuple2!13168 0))(
  ( (tuple2!13169 (_1!6595 (_ BitVec 64)) (_2!6595 V!31663)) )
))
(declare-datatypes ((List!18955 0))(
  ( (Nil!18952) (Cons!18951 (h!20103 tuple2!13168) (t!27006 List!18955)) )
))
(declare-datatypes ((ListLongMap!11867 0))(
  ( (ListLongMap!11868 (toList!5949 List!18955)) )
))
(declare-fun lt!419779 () ListLongMap!11867)

(declare-fun apply!780 (ListLongMap!11867 (_ BitVec 64)) V!31663)

(assert (=> b!932276 (= res!627594 (= (apply!780 lt!419779 k0!1099) v!791))))

(declare-fun mapIsEmpty!31791 () Bool)

(declare-fun mapRes!31791 () Bool)

(assert (=> mapIsEmpty!31791 mapRes!31791))

(declare-fun res!627603 () Bool)

(declare-fun e!523647 () Bool)

(assert (=> start!79470 (=> (not res!627603) (not e!523647))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79470 (= res!627603 (validMask!0 mask!1881))))

(assert (=> start!79470 e!523647))

(assert (=> start!79470 true))

(declare-fun tp_is_empty!20023 () Bool)

(assert (=> start!79470 tp_is_empty!20023))

(declare-datatypes ((ValueCell!9530 0))(
  ( (ValueCellFull!9530 (v!12577 V!31663)) (EmptyCell!9530) )
))
(declare-datatypes ((array!56043 0))(
  ( (array!56044 (arr!26962 (Array (_ BitVec 32) ValueCell!9530)) (size!27422 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56043)

(declare-fun e!523643 () Bool)

(declare-fun array_inv!21076 (array!56043) Bool)

(assert (=> start!79470 (and (array_inv!21076 _values!1231) e!523643)))

(assert (=> start!79470 tp!60987))

(declare-datatypes ((array!56045 0))(
  ( (array!56046 (arr!26963 (Array (_ BitVec 32) (_ BitVec 64))) (size!27423 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56045)

(declare-fun array_inv!21077 (array!56045) Bool)

(assert (=> start!79470 (array_inv!21077 _keys!1487)))

(declare-fun b!932277 () Bool)

(declare-fun e!523646 () Bool)

(assert (=> b!932277 (= e!523646 tp_is_empty!20023)))

(declare-fun b!932278 () Bool)

(declare-fun res!627597 () Bool)

(assert (=> b!932278 (=> (not res!627597) (not e!523647))))

(declare-datatypes ((List!18956 0))(
  ( (Nil!18953) (Cons!18952 (h!20104 (_ BitVec 64)) (t!27007 List!18956)) )
))
(declare-fun arrayNoDuplicates!0 (array!56045 (_ BitVec 32) List!18956) Bool)

(assert (=> b!932278 (= res!627597 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18953))))

(declare-fun b!932279 () Bool)

(declare-fun e!523648 () Bool)

(assert (=> b!932279 (= e!523648 tp_is_empty!20023)))

(declare-fun b!932280 () Bool)

(declare-fun e!523645 () Bool)

(assert (=> b!932280 (= e!523644 e!523645)))

(declare-fun res!627598 () Bool)

(assert (=> b!932280 (=> (not res!627598) (not e!523645))))

(declare-fun lt!419780 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932280 (= res!627598 (validKeyInArray!0 lt!419780))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932280 (= lt!419780 (select (arr!26963 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932281 () Bool)

(declare-fun res!627599 () Bool)

(assert (=> b!932281 (=> (not res!627599) (not e!523647))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56045 (_ BitVec 32)) Bool)

(assert (=> b!932281 (= res!627599 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932282 () Bool)

(assert (=> b!932282 (= e!523645 (not (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27423 _keys!1487))))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31663)

(declare-fun minValue!1173 () V!31663)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!3192 (array!56045 array!56043 (_ BitVec 32) (_ BitVec 32) V!31663 V!31663 (_ BitVec 32) Int) ListLongMap!11867)

(declare-fun +!2780 (ListLongMap!11867 tuple2!13168) ListLongMap!11867)

(declare-fun get!14187 (ValueCell!9530 V!31663) V!31663)

(declare-fun dynLambda!1577 (Int (_ BitVec 64)) V!31663)

(assert (=> b!932282 (= (getCurrentListMap!3192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2780 (getCurrentListMap!3192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13169 lt!419780 (get!14187 (select (arr!26962 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1577 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31425 0))(
  ( (Unit!31426) )
))
(declare-fun lt!419778 () Unit!31425)

(declare-fun lemmaListMapRecursiveValidKeyArray!160 (array!56045 array!56043 (_ BitVec 32) (_ BitVec 32) V!31663 V!31663 (_ BitVec 32) Int) Unit!31425)

(assert (=> b!932282 (= lt!419778 (lemmaListMapRecursiveValidKeyArray!160 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932283 () Bool)

(declare-fun res!627602 () Bool)

(assert (=> b!932283 (=> (not res!627602) (not e!523644))))

(assert (=> b!932283 (= res!627602 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932284 () Bool)

(declare-fun res!627595 () Bool)

(assert (=> b!932284 (=> (not res!627595) (not e!523647))))

(assert (=> b!932284 (= res!627595 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27423 _keys!1487))))))

(declare-fun b!932285 () Bool)

(declare-fun res!627600 () Bool)

(assert (=> b!932285 (=> (not res!627600) (not e!523647))))

(assert (=> b!932285 (= res!627600 (and (= (size!27422 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27423 _keys!1487) (size!27422 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932286 () Bool)

(declare-fun res!627601 () Bool)

(assert (=> b!932286 (=> (not res!627601) (not e!523644))))

(assert (=> b!932286 (= res!627601 (validKeyInArray!0 k0!1099))))

(declare-fun b!932287 () Bool)

(assert (=> b!932287 (= e!523647 e!523644)))

(declare-fun res!627596 () Bool)

(assert (=> b!932287 (=> (not res!627596) (not e!523644))))

(declare-fun contains!5014 (ListLongMap!11867 (_ BitVec 64)) Bool)

(assert (=> b!932287 (= res!627596 (contains!5014 lt!419779 k0!1099))))

(assert (=> b!932287 (= lt!419779 (getCurrentListMap!3192 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!31791 () Bool)

(declare-fun tp!60986 () Bool)

(assert (=> mapNonEmpty!31791 (= mapRes!31791 (and tp!60986 e!523648))))

(declare-fun mapRest!31791 () (Array (_ BitVec 32) ValueCell!9530))

(declare-fun mapKey!31791 () (_ BitVec 32))

(declare-fun mapValue!31791 () ValueCell!9530)

(assert (=> mapNonEmpty!31791 (= (arr!26962 _values!1231) (store mapRest!31791 mapKey!31791 mapValue!31791))))

(declare-fun b!932288 () Bool)

(assert (=> b!932288 (= e!523643 (and e!523646 mapRes!31791))))

(declare-fun condMapEmpty!31791 () Bool)

(declare-fun mapDefault!31791 () ValueCell!9530)

(assert (=> b!932288 (= condMapEmpty!31791 (= (arr!26962 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9530)) mapDefault!31791)))))

(assert (= (and start!79470 res!627603) b!932285))

(assert (= (and b!932285 res!627600) b!932281))

(assert (= (and b!932281 res!627599) b!932278))

(assert (= (and b!932278 res!627597) b!932284))

(assert (= (and b!932284 res!627595) b!932287))

(assert (= (and b!932287 res!627596) b!932276))

(assert (= (and b!932276 res!627594) b!932283))

(assert (= (and b!932283 res!627602) b!932286))

(assert (= (and b!932286 res!627601) b!932280))

(assert (= (and b!932280 res!627598) b!932282))

(assert (= (and b!932288 condMapEmpty!31791) mapIsEmpty!31791))

(assert (= (and b!932288 (not condMapEmpty!31791)) mapNonEmpty!31791))

(get-info :version)

(assert (= (and mapNonEmpty!31791 ((_ is ValueCellFull!9530) mapValue!31791)) b!932279))

(assert (= (and b!932288 ((_ is ValueCellFull!9530) mapDefault!31791)) b!932277))

(assert (= start!79470 b!932288))

(declare-fun b_lambda!13845 () Bool)

(assert (=> (not b_lambda!13845) (not b!932282)))

(declare-fun t!27005 () Bool)

(declare-fun tb!5901 () Bool)

(assert (=> (and start!79470 (= defaultEntry!1235 defaultEntry!1235) t!27005) tb!5901))

(declare-fun result!11633 () Bool)

(assert (=> tb!5901 (= result!11633 tp_is_empty!20023)))

(assert (=> b!932282 t!27005))

(declare-fun b_and!28593 () Bool)

(assert (= b_and!28591 (and (=> t!27005 result!11633) b_and!28593)))

(declare-fun m!866557 () Bool)

(assert (=> start!79470 m!866557))

(declare-fun m!866559 () Bool)

(assert (=> start!79470 m!866559))

(declare-fun m!866561 () Bool)

(assert (=> start!79470 m!866561))

(declare-fun m!866563 () Bool)

(assert (=> mapNonEmpty!31791 m!866563))

(declare-fun m!866565 () Bool)

(assert (=> b!932281 m!866565))

(declare-fun m!866567 () Bool)

(assert (=> b!932276 m!866567))

(declare-fun m!866569 () Bool)

(assert (=> b!932287 m!866569))

(declare-fun m!866571 () Bool)

(assert (=> b!932287 m!866571))

(declare-fun m!866573 () Bool)

(assert (=> b!932282 m!866573))

(declare-fun m!866575 () Bool)

(assert (=> b!932282 m!866575))

(assert (=> b!932282 m!866573))

(declare-fun m!866577 () Bool)

(assert (=> b!932282 m!866577))

(declare-fun m!866579 () Bool)

(assert (=> b!932282 m!866579))

(declare-fun m!866581 () Bool)

(assert (=> b!932282 m!866581))

(declare-fun m!866583 () Bool)

(assert (=> b!932282 m!866583))

(assert (=> b!932282 m!866581))

(declare-fun m!866585 () Bool)

(assert (=> b!932282 m!866585))

(assert (=> b!932282 m!866575))

(declare-fun m!866587 () Bool)

(assert (=> b!932280 m!866587))

(declare-fun m!866589 () Bool)

(assert (=> b!932280 m!866589))

(declare-fun m!866591 () Bool)

(assert (=> b!932286 m!866591))

(declare-fun m!866593 () Bool)

(assert (=> b!932278 m!866593))

(check-sat tp_is_empty!20023 (not b_next!17515) (not b_lambda!13845) (not b!932276) (not b!932282) (not mapNonEmpty!31791) (not start!79470) (not b!932286) (not b!932287) (not b!932280) b_and!28593 (not b!932281) (not b!932278))
(check-sat b_and!28593 (not b_next!17515))
