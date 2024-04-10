; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79352 () Bool)

(assert start!79352)

(declare-fun b_free!17539 () Bool)

(declare-fun b_next!17539 () Bool)

(assert (=> start!79352 (= b_free!17539 (not b_next!17539))))

(declare-fun tp!61060 () Bool)

(declare-fun b_and!28637 () Bool)

(assert (=> start!79352 (= tp!61060 b_and!28637)))

(declare-fun b!932035 () Bool)

(declare-fun e!523423 () Bool)

(declare-fun e!523425 () Bool)

(assert (=> b!932035 (= e!523423 e!523425)))

(declare-fun res!627685 () Bool)

(assert (=> b!932035 (=> (not res!627685) (not e!523425))))

(declare-datatypes ((V!31695 0))(
  ( (V!31696 (val!10074 Int)) )
))
(declare-datatypes ((tuple2!13194 0))(
  ( (tuple2!13195 (_1!6608 (_ BitVec 64)) (_2!6608 V!31695)) )
))
(declare-datatypes ((List!18980 0))(
  ( (Nil!18977) (Cons!18976 (h!20122 tuple2!13194) (t!27063 List!18980)) )
))
(declare-datatypes ((ListLongMap!11891 0))(
  ( (ListLongMap!11892 (toList!5961 List!18980)) )
))
(declare-fun lt!419718 () ListLongMap!11891)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5010 (ListLongMap!11891 (_ BitVec 64)) Bool)

(assert (=> b!932035 (= res!627685 (contains!5010 lt!419718 k!1099))))

(declare-datatypes ((array!56034 0))(
  ( (array!56035 (arr!26961 (Array (_ BitVec 32) (_ BitVec 64))) (size!27420 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56034)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9542 0))(
  ( (ValueCellFull!9542 (v!12593 V!31695)) (EmptyCell!9542) )
))
(declare-datatypes ((array!56036 0))(
  ( (array!56037 (arr!26962 (Array (_ BitVec 32) ValueCell!9542)) (size!27421 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56036)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31695)

(declare-fun minValue!1173 () V!31695)

(declare-fun getCurrentListMap!3199 (array!56034 array!56036 (_ BitVec 32) (_ BitVec 32) V!31695 V!31695 (_ BitVec 32) Int) ListLongMap!11891)

(assert (=> b!932035 (= lt!419718 (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932036 () Bool)

(declare-fun res!627688 () Bool)

(assert (=> b!932036 (=> (not res!627688) (not e!523423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56034 (_ BitVec 32)) Bool)

(assert (=> b!932036 (= res!627688 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932037 () Bool)

(declare-fun e!523422 () Bool)

(declare-fun tp_is_empty!20047 () Bool)

(assert (=> b!932037 (= e!523422 tp_is_empty!20047)))

(declare-fun b!932038 () Bool)

(declare-fun res!627691 () Bool)

(assert (=> b!932038 (=> (not res!627691) (not e!523425))))

(assert (=> b!932038 (= res!627691 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932039 () Bool)

(declare-fun res!627692 () Bool)

(assert (=> b!932039 (=> (not res!627692) (not e!523425))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932039 (= res!627692 (validKeyInArray!0 k!1099))))

(declare-fun b!932040 () Bool)

(declare-fun e!523424 () Bool)

(assert (=> b!932040 (= e!523424 tp_is_empty!20047)))

(declare-fun b!932041 () Bool)

(declare-fun res!627686 () Bool)

(assert (=> b!932041 (=> (not res!627686) (not e!523423))))

(declare-datatypes ((List!18981 0))(
  ( (Nil!18978) (Cons!18977 (h!20123 (_ BitVec 64)) (t!27064 List!18981)) )
))
(declare-fun arrayNoDuplicates!0 (array!56034 (_ BitVec 32) List!18981) Bool)

(assert (=> b!932041 (= res!627686 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18978))))

(declare-fun b!932042 () Bool)

(declare-fun e!523428 () Bool)

(assert (=> b!932042 (= e!523428 (not true))))

(declare-fun lt!419719 () tuple2!13194)

(declare-fun +!2768 (ListLongMap!11891 tuple2!13194) ListLongMap!11891)

(assert (=> b!932042 (contains!5010 (+!2768 lt!419718 lt!419719) k!1099)))

(declare-datatypes ((Unit!31451 0))(
  ( (Unit!31452) )
))
(declare-fun lt!419716 () Unit!31451)

(declare-fun lt!419717 () (_ BitVec 64))

(declare-fun lt!419720 () V!31695)

(declare-fun addStillContains!487 (ListLongMap!11891 (_ BitVec 64) V!31695 (_ BitVec 64)) Unit!31451)

(assert (=> b!932042 (= lt!419716 (addStillContains!487 lt!419718 lt!419717 lt!419720 k!1099))))

(assert (=> b!932042 (= (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2768 (getCurrentListMap!3199 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419719))))

(assert (=> b!932042 (= lt!419719 (tuple2!13195 lt!419717 lt!419720))))

(declare-fun get!14174 (ValueCell!9542 V!31695) V!31695)

(declare-fun dynLambda!1557 (Int (_ BitVec 64)) V!31695)

(assert (=> b!932042 (= lt!419720 (get!14174 (select (arr!26962 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1557 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419715 () Unit!31451)

(declare-fun lemmaListMapRecursiveValidKeyArray!158 (array!56034 array!56036 (_ BitVec 32) (_ BitVec 32) V!31695 V!31695 (_ BitVec 32) Int) Unit!31451)

(assert (=> b!932042 (= lt!419715 (lemmaListMapRecursiveValidKeyArray!158 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun mapNonEmpty!31830 () Bool)

(declare-fun mapRes!31830 () Bool)

(declare-fun tp!61061 () Bool)

(assert (=> mapNonEmpty!31830 (= mapRes!31830 (and tp!61061 e!523424))))

(declare-fun mapRest!31830 () (Array (_ BitVec 32) ValueCell!9542))

(declare-fun mapKey!31830 () (_ BitVec 32))

(declare-fun mapValue!31830 () ValueCell!9542)

(assert (=> mapNonEmpty!31830 (= (arr!26962 _values!1231) (store mapRest!31830 mapKey!31830 mapValue!31830))))

(declare-fun b!932043 () Bool)

(declare-fun res!627689 () Bool)

(assert (=> b!932043 (=> (not res!627689) (not e!523423))))

(assert (=> b!932043 (= res!627689 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27420 _keys!1487))))))

(declare-fun b!932044 () Bool)

(declare-fun res!627693 () Bool)

(assert (=> b!932044 (=> (not res!627693) (not e!523423))))

(assert (=> b!932044 (= res!627693 (and (= (size!27421 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27420 _keys!1487) (size!27421 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932045 () Bool)

(assert (=> b!932045 (= e!523425 e!523428)))

(declare-fun res!627690 () Bool)

(assert (=> b!932045 (=> (not res!627690) (not e!523428))))

(assert (=> b!932045 (= res!627690 (validKeyInArray!0 lt!419717))))

(assert (=> b!932045 (= lt!419717 (select (arr!26961 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932046 () Bool)

(declare-fun e!523426 () Bool)

(assert (=> b!932046 (= e!523426 (and e!523422 mapRes!31830))))

(declare-fun condMapEmpty!31830 () Bool)

(declare-fun mapDefault!31830 () ValueCell!9542)

