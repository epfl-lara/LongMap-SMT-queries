; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79324 () Bool)

(assert start!79324)

(declare-fun b_free!17537 () Bool)

(declare-fun b_next!17537 () Bool)

(assert (=> start!79324 (= b_free!17537 (not b_next!17537))))

(declare-fun tp!61052 () Bool)

(declare-fun b_and!28625 () Bool)

(assert (=> start!79324 (= tp!61052 b_and!28625)))

(declare-fun b!931824 () Bool)

(declare-fun e!523297 () Bool)

(declare-fun e!523296 () Bool)

(assert (=> b!931824 (= e!523297 e!523296)))

(declare-fun res!627586 () Bool)

(assert (=> b!931824 (=> (not res!627586) (not e!523296))))

(declare-datatypes ((V!31691 0))(
  ( (V!31692 (val!10073 Int)) )
))
(declare-datatypes ((tuple2!13192 0))(
  ( (tuple2!13193 (_1!6607 (_ BitVec 64)) (_2!6607 V!31691)) )
))
(declare-datatypes ((List!18978 0))(
  ( (Nil!18975) (Cons!18974 (h!20120 tuple2!13192) (t!27059 List!18978)) )
))
(declare-datatypes ((ListLongMap!11889 0))(
  ( (ListLongMap!11890 (toList!5960 List!18978)) )
))
(declare-fun lt!419542 () ListLongMap!11889)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5007 (ListLongMap!11889 (_ BitVec 64)) Bool)

(assert (=> b!931824 (= res!627586 (contains!5007 lt!419542 k!1099))))

(declare-datatypes ((array!56028 0))(
  ( (array!56029 (arr!26959 (Array (_ BitVec 32) (_ BitVec 64))) (size!27418 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56028)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((ValueCell!9541 0))(
  ( (ValueCellFull!9541 (v!12591 V!31691)) (EmptyCell!9541) )
))
(declare-datatypes ((array!56030 0))(
  ( (array!56031 (arr!26960 (Array (_ BitVec 32) ValueCell!9541)) (size!27419 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56030)

(declare-fun zeroValue!1173 () V!31691)

(declare-fun minValue!1173 () V!31691)

(declare-fun getCurrentListMap!3198 (array!56028 array!56030 (_ BitVec 32) (_ BitVec 32) V!31691 V!31691 (_ BitVec 32) Int) ListLongMap!11889)

(assert (=> b!931824 (= lt!419542 (getCurrentListMap!3198 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931825 () Bool)

(declare-fun e!523295 () Bool)

(declare-fun tp_is_empty!20045 () Bool)

(assert (=> b!931825 (= e!523295 tp_is_empty!20045)))

(declare-fun b!931826 () Bool)

(declare-fun res!627580 () Bool)

(assert (=> b!931826 (=> (not res!627580) (not e!523296))))

(assert (=> b!931826 (= res!627580 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!931827 () Bool)

(declare-fun res!627584 () Bool)

(assert (=> b!931827 (=> (not res!627584) (not e!523296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!931827 (= res!627584 (validKeyInArray!0 k!1099))))

(declare-fun b!931828 () Bool)

(declare-fun res!627588 () Bool)

(assert (=> b!931828 (=> (not res!627588) (not e!523297))))

(declare-datatypes ((List!18979 0))(
  ( (Nil!18976) (Cons!18975 (h!20121 (_ BitVec 64)) (t!27060 List!18979)) )
))
(declare-fun arrayNoDuplicates!0 (array!56028 (_ BitVec 32) List!18979) Bool)

(assert (=> b!931828 (= res!627588 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18976))))

(declare-fun b!931829 () Bool)

(declare-fun res!627585 () Bool)

(assert (=> b!931829 (=> (not res!627585) (not e!523297))))

(assert (=> b!931829 (= res!627585 (and (= (size!27419 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27418 _keys!1487) (size!27419 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931830 () Bool)

(declare-fun e!523294 () Bool)

(assert (=> b!931830 (= e!523294 tp_is_empty!20045)))

(declare-fun mapNonEmpty!31824 () Bool)

(declare-fun mapRes!31824 () Bool)

(declare-fun tp!61051 () Bool)

(assert (=> mapNonEmpty!31824 (= mapRes!31824 (and tp!61051 e!523294))))

(declare-fun mapRest!31824 () (Array (_ BitVec 32) ValueCell!9541))

(declare-fun mapValue!31824 () ValueCell!9541)

(declare-fun mapKey!31824 () (_ BitVec 32))

(assert (=> mapNonEmpty!31824 (= (arr!26960 _values!1231) (store mapRest!31824 mapKey!31824 mapValue!31824))))

(declare-fun mapIsEmpty!31824 () Bool)

(assert (=> mapIsEmpty!31824 mapRes!31824))

(declare-fun b!931832 () Bool)

(declare-fun res!627589 () Bool)

(assert (=> b!931832 (=> (not res!627589) (not e!523297))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56028 (_ BitVec 32)) Bool)

(assert (=> b!931832 (= res!627589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!931833 () Bool)

(declare-fun res!627587 () Bool)

(assert (=> b!931833 (=> (not res!627587) (not e!523296))))

(declare-fun v!791 () V!31691)

(declare-fun apply!777 (ListLongMap!11889 (_ BitVec 64)) V!31691)

(assert (=> b!931833 (= res!627587 (= (apply!777 lt!419542 k!1099) v!791))))

(declare-fun b!931834 () Bool)

(declare-fun e!523292 () Bool)

(assert (=> b!931834 (= e!523292 (not (bvslt (size!27418 _keys!1487) #b01111111111111111111111111111111)))))

(declare-fun lt!419540 () tuple2!13192)

(declare-fun +!2767 (ListLongMap!11889 tuple2!13192) ListLongMap!11889)

(assert (=> b!931834 (contains!5007 (+!2767 lt!419542 lt!419540) k!1099)))

(declare-fun lt!419544 () (_ BitVec 64))

(declare-datatypes ((Unit!31444 0))(
  ( (Unit!31445) )
))
(declare-fun lt!419545 () Unit!31444)

(declare-fun lt!419541 () V!31691)

(declare-fun addStillContains!486 (ListLongMap!11889 (_ BitVec 64) V!31691 (_ BitVec 64)) Unit!31444)

(assert (=> b!931834 (= lt!419545 (addStillContains!486 lt!419542 lt!419544 lt!419541 k!1099))))

(assert (=> b!931834 (= (getCurrentListMap!3198 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2767 (getCurrentListMap!3198 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!419540))))

(assert (=> b!931834 (= lt!419540 (tuple2!13193 lt!419544 lt!419541))))

(declare-fun get!14168 (ValueCell!9541 V!31691) V!31691)

(declare-fun dynLambda!1556 (Int (_ BitVec 64)) V!31691)

(assert (=> b!931834 (= lt!419541 (get!14168 (select (arr!26960 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1556 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!419543 () Unit!31444)

(declare-fun lemmaListMapRecursiveValidKeyArray!157 (array!56028 array!56030 (_ BitVec 32) (_ BitVec 32) V!31691 V!31691 (_ BitVec 32) Int) Unit!31444)

(assert (=> b!931834 (= lt!419543 (lemmaListMapRecursiveValidKeyArray!157 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun res!627583 () Bool)

(assert (=> start!79324 (=> (not res!627583) (not e!523297))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79324 (= res!627583 (validMask!0 mask!1881))))

(assert (=> start!79324 e!523297))

(assert (=> start!79324 true))

(assert (=> start!79324 tp_is_empty!20045))

(declare-fun e!523291 () Bool)

(declare-fun array_inv!20984 (array!56030) Bool)

(assert (=> start!79324 (and (array_inv!20984 _values!1231) e!523291)))

(assert (=> start!79324 tp!61052))

(declare-fun array_inv!20985 (array!56028) Bool)

(assert (=> start!79324 (array_inv!20985 _keys!1487)))

(declare-fun b!931831 () Bool)

(declare-fun res!627582 () Bool)

(assert (=> b!931831 (=> (not res!627582) (not e!523297))))

(assert (=> b!931831 (= res!627582 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27418 _keys!1487))))))

(declare-fun b!931835 () Bool)

(assert (=> b!931835 (= e!523296 e!523292)))

(declare-fun res!627581 () Bool)

(assert (=> b!931835 (=> (not res!627581) (not e!523292))))

(assert (=> b!931835 (= res!627581 (validKeyInArray!0 lt!419544))))

(assert (=> b!931835 (= lt!419544 (select (arr!26959 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!931836 () Bool)

(assert (=> b!931836 (= e!523291 (and e!523295 mapRes!31824))))

(declare-fun condMapEmpty!31824 () Bool)

(declare-fun mapDefault!31824 () ValueCell!9541)

