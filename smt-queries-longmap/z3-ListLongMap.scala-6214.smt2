; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79420 () Bool)

(assert start!79420)

(declare-fun b_free!17607 () Bool)

(declare-fun b_next!17607 () Bool)

(assert (=> start!79420 (= b_free!17607 (not b_next!17607))))

(declare-fun tp!61264 () Bool)

(declare-fun b_and!28773 () Bool)

(assert (=> start!79420 (= tp!61264 b_and!28773)))

(declare-fun b!933429 () Bool)

(declare-fun res!628713 () Bool)

(declare-fun e!524140 () Bool)

(assert (=> b!933429 (=> (not res!628713) (not e!524140))))

(declare-datatypes ((array!56166 0))(
  ( (array!56167 (arr!27027 (Array (_ BitVec 32) (_ BitVec 64))) (size!27486 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56166)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31785 0))(
  ( (V!31786 (val!10108 Int)) )
))
(declare-datatypes ((ValueCell!9576 0))(
  ( (ValueCellFull!9576 (v!12627 V!31785)) (EmptyCell!9576) )
))
(declare-datatypes ((array!56168 0))(
  ( (array!56169 (arr!27028 (Array (_ BitVec 32) ValueCell!9576)) (size!27487 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56168)

(declare-fun mask!1881 () (_ BitVec 32))

(assert (=> b!933429 (= res!628713 (and (= (size!27487 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27486 _keys!1487) (size!27487 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!933430 () Bool)

(declare-fun e!524142 () Bool)

(declare-fun e!524139 () Bool)

(assert (=> b!933430 (= e!524142 e!524139)))

(declare-fun res!628714 () Bool)

(assert (=> b!933430 (=> (not res!628714) (not e!524139))))

(declare-fun lt!420399 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!933430 (= res!628714 (validKeyInArray!0 lt!420399))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!933430 (= lt!420399 (select (arr!27027 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!933431 () Bool)

(declare-fun res!628711 () Bool)

(assert (=> b!933431 (=> (not res!628711) (not e!524142))))

(declare-fun k0!1099 () (_ BitVec 64))

(assert (=> b!933431 (= res!628711 (validKeyInArray!0 k0!1099))))

(declare-fun b!933432 () Bool)

(declare-fun res!628709 () Bool)

(assert (=> b!933432 (=> (not res!628709) (not e!524140))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56166 (_ BitVec 32)) Bool)

(assert (=> b!933432 (= res!628709 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!933433 () Bool)

(declare-fun res!628707 () Bool)

(assert (=> b!933433 (=> (not res!628707) (not e!524142))))

(assert (=> b!933433 (= res!628707 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!31932 () Bool)

(declare-fun mapRes!31932 () Bool)

(assert (=> mapIsEmpty!31932 mapRes!31932))

(declare-fun b!933434 () Bool)

(declare-fun e!524138 () Bool)

(declare-fun tp_is_empty!20115 () Bool)

(assert (=> b!933434 (= e!524138 tp_is_empty!20115)))

(declare-fun b!933435 () Bool)

(declare-fun e!524137 () Bool)

(assert (=> b!933435 (= e!524137 tp_is_empty!20115)))

(declare-fun b!933436 () Bool)

(assert (=> b!933436 (= e!524139 (not true))))

(declare-datatypes ((List!19032 0))(
  ( (Nil!19029) (Cons!19028 (h!20174 (_ BitVec 64)) (t!27183 List!19032)) )
))
(declare-fun arrayNoDuplicates!0 (array!56166 (_ BitVec 32) List!19032) Bool)

(assert (=> b!933436 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19029)))

(declare-datatypes ((Unit!31495 0))(
  ( (Unit!31496) )
))
(declare-fun lt!420396 () Unit!31495)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56166 (_ BitVec 32) (_ BitVec 32)) Unit!31495)

(assert (=> b!933436 (= lt!420396 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13250 0))(
  ( (tuple2!13251 (_1!6636 (_ BitVec 64)) (_2!6636 V!31785)) )
))
(declare-datatypes ((List!19033 0))(
  ( (Nil!19030) (Cons!19029 (h!20175 tuple2!13250) (t!27184 List!19033)) )
))
(declare-datatypes ((ListLongMap!11947 0))(
  ( (ListLongMap!11948 (toList!5989 List!19033)) )
))
(declare-fun lt!420401 () ListLongMap!11947)

(declare-fun lt!420397 () tuple2!13250)

(declare-fun contains!5038 (ListLongMap!11947 (_ BitVec 64)) Bool)

(declare-fun +!2790 (ListLongMap!11947 tuple2!13250) ListLongMap!11947)

(assert (=> b!933436 (contains!5038 (+!2790 lt!420401 lt!420397) k0!1099)))

(declare-fun lt!420395 () V!31785)

(declare-fun lt!420400 () Unit!31495)

(declare-fun addStillContains!509 (ListLongMap!11947 (_ BitVec 64) V!31785 (_ BitVec 64)) Unit!31495)

(assert (=> b!933436 (= lt!420400 (addStillContains!509 lt!420401 lt!420399 lt!420395 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31785)

(declare-fun minValue!1173 () V!31785)

(declare-fun getCurrentListMap!3227 (array!56166 array!56168 (_ BitVec 32) (_ BitVec 32) V!31785 V!31785 (_ BitVec 32) Int) ListLongMap!11947)

(assert (=> b!933436 (= (getCurrentListMap!3227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2790 (getCurrentListMap!3227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420397))))

(assert (=> b!933436 (= lt!420397 (tuple2!13251 lt!420399 lt!420395))))

(declare-fun get!14218 (ValueCell!9576 V!31785) V!31785)

(declare-fun dynLambda!1579 (Int (_ BitVec 64)) V!31785)

(assert (=> b!933436 (= lt!420395 (get!14218 (select (arr!27028 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1579 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420398 () Unit!31495)

(declare-fun lemmaListMapRecursiveValidKeyArray!180 (array!56166 array!56168 (_ BitVec 32) (_ BitVec 32) V!31785 V!31785 (_ BitVec 32) Int) Unit!31495)

(assert (=> b!933436 (= lt!420398 (lemmaListMapRecursiveValidKeyArray!180 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!933437 () Bool)

(assert (=> b!933437 (= e!524140 e!524142)))

(declare-fun res!628708 () Bool)

(assert (=> b!933437 (=> (not res!628708) (not e!524142))))

(assert (=> b!933437 (= res!628708 (contains!5038 lt!420401 k0!1099))))

(assert (=> b!933437 (= lt!420401 (getCurrentListMap!3227 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!933438 () Bool)

(declare-fun e!524136 () Bool)

(assert (=> b!933438 (= e!524136 (and e!524137 mapRes!31932))))

(declare-fun condMapEmpty!31932 () Bool)

(declare-fun mapDefault!31932 () ValueCell!9576)

(assert (=> b!933438 (= condMapEmpty!31932 (= (arr!27028 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9576)) mapDefault!31932)))))

(declare-fun b!933439 () Bool)

(declare-fun res!628706 () Bool)

(assert (=> b!933439 (=> (not res!628706) (not e!524140))))

(assert (=> b!933439 (= res!628706 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19029))))

(declare-fun b!933440 () Bool)

(declare-fun res!628712 () Bool)

(assert (=> b!933440 (=> (not res!628712) (not e!524142))))

(declare-fun v!791 () V!31785)

(declare-fun apply!800 (ListLongMap!11947 (_ BitVec 64)) V!31785)

(assert (=> b!933440 (= res!628712 (= (apply!800 lt!420401 k0!1099) v!791))))

(declare-fun mapNonEmpty!31932 () Bool)

(declare-fun tp!61265 () Bool)

(assert (=> mapNonEmpty!31932 (= mapRes!31932 (and tp!61265 e!524138))))

(declare-fun mapKey!31932 () (_ BitVec 32))

(declare-fun mapValue!31932 () ValueCell!9576)

(declare-fun mapRest!31932 () (Array (_ BitVec 32) ValueCell!9576))

(assert (=> mapNonEmpty!31932 (= (arr!27028 _values!1231) (store mapRest!31932 mapKey!31932 mapValue!31932))))

(declare-fun b!933441 () Bool)

(declare-fun res!628705 () Bool)

(assert (=> b!933441 (=> (not res!628705) (not e!524140))))

(assert (=> b!933441 (= res!628705 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27486 _keys!1487))))))

(declare-fun res!628710 () Bool)

(assert (=> start!79420 (=> (not res!628710) (not e!524140))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79420 (= res!628710 (validMask!0 mask!1881))))

(assert (=> start!79420 e!524140))

(assert (=> start!79420 true))

(assert (=> start!79420 tp_is_empty!20115))

(declare-fun array_inv!21038 (array!56168) Bool)

(assert (=> start!79420 (and (array_inv!21038 _values!1231) e!524136)))

(assert (=> start!79420 tp!61264))

(declare-fun array_inv!21039 (array!56166) Bool)

(assert (=> start!79420 (array_inv!21039 _keys!1487)))

(assert (= (and start!79420 res!628710) b!933429))

(assert (= (and b!933429 res!628713) b!933432))

(assert (= (and b!933432 res!628709) b!933439))

(assert (= (and b!933439 res!628706) b!933441))

(assert (= (and b!933441 res!628705) b!933437))

(assert (= (and b!933437 res!628708) b!933440))

(assert (= (and b!933440 res!628712) b!933433))

(assert (= (and b!933433 res!628707) b!933431))

(assert (= (and b!933431 res!628711) b!933430))

(assert (= (and b!933430 res!628714) b!933436))

(assert (= (and b!933438 condMapEmpty!31932) mapIsEmpty!31932))

(assert (= (and b!933438 (not condMapEmpty!31932)) mapNonEmpty!31932))

(get-info :version)

(assert (= (and mapNonEmpty!31932 ((_ is ValueCellFull!9576) mapValue!31932)) b!933434))

(assert (= (and b!933438 ((_ is ValueCellFull!9576) mapDefault!31932)) b!933435))

(assert (= start!79420 b!933438))

(declare-fun b_lambda!13941 () Bool)

(assert (=> (not b_lambda!13941) (not b!933436)))

(declare-fun t!27182 () Bool)

(declare-fun tb!6001 () Bool)

(assert (=> (and start!79420 (= defaultEntry!1235 defaultEntry!1235) t!27182) tb!6001))

(declare-fun result!11827 () Bool)

(assert (=> tb!6001 (= result!11827 tp_is_empty!20115)))

(assert (=> b!933436 t!27182))

(declare-fun b_and!28775 () Bool)

(assert (= b_and!28773 (and (=> t!27182 result!11827) b_and!28775)))

(declare-fun m!867559 () Bool)

(assert (=> b!933439 m!867559))

(declare-fun m!867561 () Bool)

(assert (=> b!933440 m!867561))

(declare-fun m!867563 () Bool)

(assert (=> b!933437 m!867563))

(declare-fun m!867565 () Bool)

(assert (=> b!933437 m!867565))

(declare-fun m!867567 () Bool)

(assert (=> start!79420 m!867567))

(declare-fun m!867569 () Bool)

(assert (=> start!79420 m!867569))

(declare-fun m!867571 () Bool)

(assert (=> start!79420 m!867571))

(declare-fun m!867573 () Bool)

(assert (=> b!933432 m!867573))

(declare-fun m!867575 () Bool)

(assert (=> b!933430 m!867575))

(declare-fun m!867577 () Bool)

(assert (=> b!933430 m!867577))

(declare-fun m!867579 () Bool)

(assert (=> b!933436 m!867579))

(declare-fun m!867581 () Bool)

(assert (=> b!933436 m!867581))

(declare-fun m!867583 () Bool)

(assert (=> b!933436 m!867583))

(declare-fun m!867585 () Bool)

(assert (=> b!933436 m!867585))

(declare-fun m!867587 () Bool)

(assert (=> b!933436 m!867587))

(assert (=> b!933436 m!867585))

(declare-fun m!867589 () Bool)

(assert (=> b!933436 m!867589))

(declare-fun m!867591 () Bool)

(assert (=> b!933436 m!867591))

(declare-fun m!867593 () Bool)

(assert (=> b!933436 m!867593))

(declare-fun m!867595 () Bool)

(assert (=> b!933436 m!867595))

(declare-fun m!867597 () Bool)

(assert (=> b!933436 m!867597))

(declare-fun m!867599 () Bool)

(assert (=> b!933436 m!867599))

(assert (=> b!933436 m!867587))

(assert (=> b!933436 m!867593))

(assert (=> b!933436 m!867579))

(declare-fun m!867601 () Bool)

(assert (=> b!933436 m!867601))

(declare-fun m!867603 () Bool)

(assert (=> mapNonEmpty!31932 m!867603))

(declare-fun m!867605 () Bool)

(assert (=> b!933431 m!867605))

(check-sat (not b!933439) (not b!933437) (not b!933436) (not b!933430) (not mapNonEmpty!31932) b_and!28775 (not b_lambda!13941) (not b!933432) (not start!79420) (not b!933440) tp_is_empty!20115 (not b_next!17607) (not b!933431))
(check-sat b_and!28775 (not b_next!17607))
