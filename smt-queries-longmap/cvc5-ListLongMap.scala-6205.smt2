; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79364 () Bool)

(assert start!79364)

(declare-fun b_free!17551 () Bool)

(declare-fun b_next!17551 () Bool)

(assert (=> start!79364 (= b_free!17551 (not b_next!17551))))

(declare-fun tp!61097 () Bool)

(declare-fun b_and!28661 () Bool)

(assert (=> start!79364 (= tp!61097 b_and!28661)))

(declare-fun b!932281 () Bool)

(declare-fun res!627870 () Bool)

(declare-fun e!523549 () Bool)

(assert (=> b!932281 (=> (not res!627870) (not e!523549))))

(declare-datatypes ((array!56058 0))(
  ( (array!56059 (arr!26973 (Array (_ BitVec 32) (_ BitVec 64))) (size!27432 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56058)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56058 (_ BitVec 32)) Bool)

(assert (=> b!932281 (= res!627870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31848 () Bool)

(declare-fun mapRes!31848 () Bool)

(assert (=> mapIsEmpty!31848 mapRes!31848))

(declare-fun b!932282 () Bool)

(declare-fun res!627867 () Bool)

(assert (=> b!932282 (=> (not res!627867) (not e!523549))))

(declare-datatypes ((List!18989 0))(
  ( (Nil!18986) (Cons!18985 (h!20131 (_ BitVec 64)) (t!27084 List!18989)) )
))
(declare-fun arrayNoDuplicates!0 (array!56058 (_ BitVec 32) List!18989) Bool)

(assert (=> b!932282 (= res!627867 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18986))))

(declare-fun b!932283 () Bool)

(declare-fun e!523551 () Bool)

(declare-fun tp_is_empty!20059 () Bool)

(assert (=> b!932283 (= e!523551 tp_is_empty!20059)))

(declare-fun mapNonEmpty!31848 () Bool)

(declare-fun tp!61096 () Bool)

(declare-fun e!523550 () Bool)

(assert (=> mapNonEmpty!31848 (= mapRes!31848 (and tp!61096 e!523550))))

(declare-fun mapKey!31848 () (_ BitVec 32))

(declare-datatypes ((V!31711 0))(
  ( (V!31712 (val!10080 Int)) )
))
(declare-datatypes ((ValueCell!9548 0))(
  ( (ValueCellFull!9548 (v!12599 V!31711)) (EmptyCell!9548) )
))
(declare-datatypes ((array!56060 0))(
  ( (array!56061 (arr!26974 (Array (_ BitVec 32) ValueCell!9548)) (size!27433 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56060)

(declare-fun mapValue!31848 () ValueCell!9548)

(declare-fun mapRest!31848 () (Array (_ BitVec 32) ValueCell!9548))

(assert (=> mapNonEmpty!31848 (= (arr!26974 _values!1231) (store mapRest!31848 mapKey!31848 mapValue!31848))))

(declare-fun b!932285 () Bool)

(declare-fun res!627873 () Bool)

(declare-fun e!523554 () Bool)

(assert (=> b!932285 (=> (not res!627873) (not e!523554))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932285 (= res!627873 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!932286 () Bool)

(declare-fun res!627866 () Bool)

(assert (=> b!932286 (=> (not res!627866) (not e!523549))))

(assert (=> b!932286 (= res!627866 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27432 _keys!1487))))))

(declare-fun b!932287 () Bool)

(assert (=> b!932287 (= e!523549 e!523554)))

(declare-fun res!627865 () Bool)

(assert (=> b!932287 (=> (not res!627865) (not e!523554))))

(declare-datatypes ((tuple2!13204 0))(
  ( (tuple2!13205 (_1!6613 (_ BitVec 64)) (_2!6613 V!31711)) )
))
(declare-datatypes ((List!18990 0))(
  ( (Nil!18987) (Cons!18986 (h!20132 tuple2!13204) (t!27085 List!18990)) )
))
(declare-datatypes ((ListLongMap!11901 0))(
  ( (ListLongMap!11902 (toList!5966 List!18990)) )
))
(declare-fun lt!419826 () ListLongMap!11901)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!5015 (ListLongMap!11901 (_ BitVec 64)) Bool)

(assert (=> b!932287 (= res!627865 (contains!5015 lt!419826 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31711)

(declare-fun minValue!1173 () V!31711)

(declare-fun getCurrentListMap!3204 (array!56058 array!56060 (_ BitVec 32) (_ BitVec 32) V!31711 V!31711 (_ BitVec 32) Int) ListLongMap!11901)

(assert (=> b!932287 (= lt!419826 (getCurrentListMap!3204 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932284 () Bool)

(declare-fun e!523553 () Bool)

(assert (=> b!932284 (= e!523554 e!523553)))

(declare-fun res!627871 () Bool)

(assert (=> b!932284 (=> (not res!627871) (not e!523553))))

(declare-fun lt!419825 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932284 (= res!627871 (validKeyInArray!0 lt!419825))))

(assert (=> b!932284 (= lt!419825 (select (arr!26973 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!627868 () Bool)

(assert (=> start!79364 (=> (not res!627868) (not e!523549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79364 (= res!627868 (validMask!0 mask!1881))))

(assert (=> start!79364 e!523549))

(assert (=> start!79364 true))

(assert (=> start!79364 tp_is_empty!20059))

(declare-fun e!523548 () Bool)

(declare-fun array_inv!20996 (array!56060) Bool)

(assert (=> start!79364 (and (array_inv!20996 _values!1231) e!523548)))

(assert (=> start!79364 tp!61097))

(declare-fun array_inv!20997 (array!56058) Bool)

(assert (=> start!79364 (array_inv!20997 _keys!1487)))

(declare-fun b!932288 () Bool)

(declare-fun res!627874 () Bool)

(assert (=> b!932288 (=> (not res!627874) (not e!523554))))

(assert (=> b!932288 (= res!627874 (validKeyInArray!0 k!1099))))

(declare-fun b!932289 () Bool)

(assert (=> b!932289 (= e!523548 (and e!523551 mapRes!31848))))

(declare-fun condMapEmpty!31848 () Bool)

(declare-fun mapDefault!31848 () ValueCell!9548)

