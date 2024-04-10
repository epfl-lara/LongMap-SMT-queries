; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79204 () Bool)

(assert start!79204)

(declare-fun b_free!17417 () Bool)

(declare-fun b_next!17417 () Bool)

(assert (=> start!79204 (= b_free!17417 (not b_next!17417))))

(declare-fun tp!60692 () Bool)

(declare-fun b_and!28483 () Bool)

(assert (=> start!79204 (= tp!60692 b_and!28483)))

(declare-fun b!929896 () Bool)

(declare-fun e!522176 () Bool)

(declare-fun tp_is_empty!19925 () Bool)

(assert (=> b!929896 (= e!522176 tp_is_empty!19925)))

(declare-fun b!929897 () Bool)

(declare-fun res!626219 () Bool)

(declare-fun e!522178 () Bool)

(assert (=> b!929897 (=> (not res!626219) (not e!522178))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929897 (= res!626219 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929898 () Bool)

(declare-fun e!522179 () Bool)

(assert (=> b!929898 (= e!522179 tp_is_empty!19925)))

(declare-fun b!929899 () Bool)

(declare-fun res!626221 () Bool)

(declare-fun e!522180 () Bool)

(assert (=> b!929899 (=> (not res!626221) (not e!522180))))

(declare-datatypes ((array!55800 0))(
  ( (array!55801 (arr!26845 (Array (_ BitVec 32) (_ BitVec 64))) (size!27304 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55800)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55800 (_ BitVec 32)) Bool)

(assert (=> b!929899 (= res!626221 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929900 () Bool)

(declare-fun res!626215 () Bool)

(assert (=> b!929900 (=> (not res!626215) (not e!522180))))

(assert (=> b!929900 (= res!626215 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27304 _keys!1487))))))

(declare-fun mapIsEmpty!31644 () Bool)

(declare-fun mapRes!31644 () Bool)

(assert (=> mapIsEmpty!31644 mapRes!31644))

(declare-fun b!929901 () Bool)

(assert (=> b!929901 (= e!522180 e!522178)))

(declare-fun res!626216 () Bool)

(assert (=> b!929901 (=> (not res!626216) (not e!522178))))

(declare-datatypes ((V!31531 0))(
  ( (V!31532 (val!10013 Int)) )
))
(declare-datatypes ((tuple2!13096 0))(
  ( (tuple2!13097 (_1!6559 (_ BitVec 64)) (_2!6559 V!31531)) )
))
(declare-datatypes ((List!18889 0))(
  ( (Nil!18886) (Cons!18885 (h!20031 tuple2!13096) (t!26946 List!18889)) )
))
(declare-datatypes ((ListLongMap!11793 0))(
  ( (ListLongMap!11794 (toList!5912 List!18889)) )
))
(declare-fun lt!419149 () ListLongMap!11793)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4964 (ListLongMap!11793 (_ BitVec 64)) Bool)

(assert (=> b!929901 (= res!626216 (contains!4964 lt!419149 k!1099))))

(declare-datatypes ((ValueCell!9481 0))(
  ( (ValueCellFull!9481 (v!12531 V!31531)) (EmptyCell!9481) )
))
(declare-datatypes ((array!55802 0))(
  ( (array!55803 (arr!26846 (Array (_ BitVec 32) ValueCell!9481)) (size!27305 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55802)

(declare-fun defaultEntry!1235 () Int)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!31531)

(declare-fun minValue!1173 () V!31531)

(declare-fun getCurrentListMap!3155 (array!55800 array!55802 (_ BitVec 32) (_ BitVec 32) V!31531 V!31531 (_ BitVec 32) Int) ListLongMap!11793)

(assert (=> b!929901 (= lt!419149 (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929902 () Bool)

(declare-fun res!626214 () Bool)

(assert (=> b!929902 (=> (not res!626214) (not e!522178))))

(declare-fun v!791 () V!31531)

(declare-fun apply!735 (ListLongMap!11793 (_ BitVec 64)) V!31531)

(assert (=> b!929902 (= res!626214 (= (apply!735 lt!419149 k!1099) v!791))))

(declare-fun mapNonEmpty!31644 () Bool)

(declare-fun tp!60691 () Bool)

(assert (=> mapNonEmpty!31644 (= mapRes!31644 (and tp!60691 e!522179))))

(declare-fun mapValue!31644 () ValueCell!9481)

(declare-fun mapKey!31644 () (_ BitVec 32))

(declare-fun mapRest!31644 () (Array (_ BitVec 32) ValueCell!9481))

(assert (=> mapNonEmpty!31644 (= (arr!26846 _values!1231) (store mapRest!31644 mapKey!31644 mapValue!31644))))

(declare-fun res!626218 () Bool)

(assert (=> start!79204 (=> (not res!626218) (not e!522180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79204 (= res!626218 (validMask!0 mask!1881))))

(assert (=> start!79204 e!522180))

(assert (=> start!79204 true))

(assert (=> start!79204 tp_is_empty!19925))

(declare-fun e!522181 () Bool)

(declare-fun array_inv!20888 (array!55802) Bool)

(assert (=> start!79204 (and (array_inv!20888 _values!1231) e!522181)))

(assert (=> start!79204 tp!60692))

(declare-fun array_inv!20889 (array!55800) Bool)

(assert (=> start!79204 (array_inv!20889 _keys!1487)))

(declare-fun b!929903 () Bool)

(assert (=> b!929903 (= e!522178 false)))

(declare-fun lt!419148 () Bool)

(assert (=> b!929903 (= lt!419148 (contains!4964 (getCurrentListMap!3155 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k!1099))))

(declare-fun b!929904 () Bool)

(declare-fun res!626220 () Bool)

(assert (=> b!929904 (=> (not res!626220) (not e!522180))))

(declare-datatypes ((List!18890 0))(
  ( (Nil!18887) (Cons!18886 (h!20032 (_ BitVec 64)) (t!26947 List!18890)) )
))
(declare-fun arrayNoDuplicates!0 (array!55800 (_ BitVec 32) List!18890) Bool)

(assert (=> b!929904 (= res!626220 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18887))))

(declare-fun b!929905 () Bool)

(assert (=> b!929905 (= e!522181 (and e!522176 mapRes!31644))))

(declare-fun condMapEmpty!31644 () Bool)

(declare-fun mapDefault!31644 () ValueCell!9481)

