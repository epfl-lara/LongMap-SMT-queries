; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79282 () Bool)

(assert start!79282)

(declare-fun b_free!17495 () Bool)

(declare-fun b_next!17495 () Bool)

(assert (=> start!79282 (= b_free!17495 (not b_next!17495))))

(declare-fun tp!60926 () Bool)

(declare-fun b_and!28561 () Bool)

(assert (=> start!79282 (= tp!60926 b_and!28561)))

(declare-fun b!931059 () Bool)

(declare-fun res!627026 () Bool)

(declare-fun e!522878 () Bool)

(assert (=> b!931059 (=> (not res!627026) (not e!522878))))

(declare-datatypes ((array!55946 0))(
  ( (array!55947 (arr!26918 (Array (_ BitVec 32) (_ BitVec 64))) (size!27377 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55946)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31635 0))(
  ( (V!31636 (val!10052 Int)) )
))
(declare-datatypes ((ValueCell!9520 0))(
  ( (ValueCellFull!9520 (v!12570 V!31635)) (EmptyCell!9520) )
))
(declare-datatypes ((array!55948 0))(
  ( (array!55949 (arr!26919 (Array (_ BitVec 32) ValueCell!9520)) (size!27378 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55948)

(assert (=> b!931059 (= res!627026 (and (= (size!27378 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27377 _keys!1487) (size!27378 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31761 () Bool)

(declare-fun mapRes!31761 () Bool)

(declare-fun tp!60925 () Bool)

(declare-fun e!522881 () Bool)

(assert (=> mapNonEmpty!31761 (= mapRes!31761 (and tp!60925 e!522881))))

(declare-fun mapRest!31761 () (Array (_ BitVec 32) ValueCell!9520))

(declare-fun mapKey!31761 () (_ BitVec 32))

(declare-fun mapValue!31761 () ValueCell!9520)

(assert (=> mapNonEmpty!31761 (= (arr!26919 _values!1231) (store mapRest!31761 mapKey!31761 mapValue!31761))))

(declare-fun b!931060 () Bool)

(declare-fun e!522880 () Bool)

(assert (=> b!931060 (= e!522878 e!522880)))

(declare-fun res!627030 () Bool)

(assert (=> b!931060 (=> (not res!627030) (not e!522880))))

(declare-datatypes ((tuple2!13162 0))(
  ( (tuple2!13163 (_1!6592 (_ BitVec 64)) (_2!6592 V!31635)) )
))
(declare-datatypes ((List!18949 0))(
  ( (Nil!18946) (Cons!18945 (h!20091 tuple2!13162) (t!27006 List!18949)) )
))
(declare-datatypes ((ListLongMap!11859 0))(
  ( (ListLongMap!11860 (toList!5945 List!18949)) )
))
(declare-fun lt!419364 () ListLongMap!11859)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4993 (ListLongMap!11859 (_ BitVec 64)) Bool)

(assert (=> b!931060 (= res!627030 (contains!4993 lt!419364 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31635)

(declare-fun minValue!1173 () V!31635)

(declare-fun getCurrentListMap!3184 (array!55946 array!55948 (_ BitVec 32) (_ BitVec 32) V!31635 V!31635 (_ BitVec 32) Int) ListLongMap!11859)

(assert (=> b!931060 (= lt!419364 (getCurrentListMap!3184 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapIsEmpty!31761 () Bool)

(assert (=> mapIsEmpty!31761 mapRes!31761))

(declare-fun b!931061 () Bool)

(declare-fun res!627028 () Bool)

(assert (=> b!931061 (=> (not res!627028) (not e!522878))))

(assert (=> b!931061 (= res!627028 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27377 _keys!1487))))))

(declare-fun res!627027 () Bool)

(assert (=> start!79282 (=> (not res!627027) (not e!522878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79282 (= res!627027 (validMask!0 mask!1881))))

(assert (=> start!79282 e!522878))

(assert (=> start!79282 true))

(declare-fun e!522883 () Bool)

(declare-fun array_inv!20950 (array!55948) Bool)

(assert (=> start!79282 (and (array_inv!20950 _values!1231) e!522883)))

(assert (=> start!79282 tp!60926))

(declare-fun array_inv!20951 (array!55946) Bool)

(assert (=> start!79282 (array_inv!20951 _keys!1487)))

(declare-fun tp_is_empty!20003 () Bool)

(assert (=> start!79282 tp_is_empty!20003))

(declare-fun b!931062 () Bool)

(declare-fun e!522882 () Bool)

(assert (=> b!931062 (= e!522883 (and e!522882 mapRes!31761))))

(declare-fun condMapEmpty!31761 () Bool)

(declare-fun mapDefault!31761 () ValueCell!9520)

