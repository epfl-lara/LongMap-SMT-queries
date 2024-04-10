; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79288 () Bool)

(assert start!79288)

(declare-fun b_free!17501 () Bool)

(declare-fun b_next!17501 () Bool)

(assert (=> start!79288 (= b_free!17501 (not b_next!17501))))

(declare-fun tp!60944 () Bool)

(declare-fun b_and!28567 () Bool)

(assert (=> start!79288 (= tp!60944 b_and!28567)))

(declare-fun b!931140 () Bool)

(declare-fun res!627081 () Bool)

(declare-fun e!522932 () Bool)

(assert (=> b!931140 (=> (not res!627081) (not e!522932))))

(declare-datatypes ((array!55958 0))(
  ( (array!55959 (arr!26924 (Array (_ BitVec 32) (_ BitVec 64))) (size!27383 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55958)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!31643 0))(
  ( (V!31644 (val!10055 Int)) )
))
(declare-datatypes ((ValueCell!9523 0))(
  ( (ValueCellFull!9523 (v!12573 V!31643)) (EmptyCell!9523) )
))
(declare-datatypes ((array!55960 0))(
  ( (array!55961 (arr!26925 (Array (_ BitVec 32) ValueCell!9523)) (size!27384 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55960)

(assert (=> b!931140 (= res!627081 (and (= (size!27384 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27383 _keys!1487) (size!27384 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!931141 () Bool)

(declare-fun res!627083 () Bool)

(assert (=> b!931141 (=> (not res!627083) (not e!522932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55958 (_ BitVec 32)) Bool)

(assert (=> b!931141 (= res!627083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31770 () Bool)

(declare-fun mapRes!31770 () Bool)

(assert (=> mapIsEmpty!31770 mapRes!31770))

(declare-fun b!931142 () Bool)

(declare-fun e!522934 () Bool)

(assert (=> b!931142 (= e!522934 false)))

(declare-fun lt!419382 () V!31643)

(declare-datatypes ((tuple2!13168 0))(
  ( (tuple2!13169 (_1!6595 (_ BitVec 64)) (_2!6595 V!31643)) )
))
(declare-datatypes ((List!18954 0))(
  ( (Nil!18951) (Cons!18950 (h!20096 tuple2!13168) (t!27011 List!18954)) )
))
(declare-datatypes ((ListLongMap!11865 0))(
  ( (ListLongMap!11866 (toList!5948 List!18954)) )
))
(declare-fun lt!419383 () ListLongMap!11865)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!768 (ListLongMap!11865 (_ BitVec 64)) V!31643)

(assert (=> b!931142 (= lt!419382 (apply!768 lt!419383 k!1099))))

(declare-fun res!627080 () Bool)

(assert (=> start!79288 (=> (not res!627080) (not e!522932))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79288 (= res!627080 (validMask!0 mask!1881))))

(assert (=> start!79288 e!522932))

(assert (=> start!79288 true))

(declare-fun e!522935 () Bool)

(declare-fun array_inv!20956 (array!55960) Bool)

(assert (=> start!79288 (and (array_inv!20956 _values!1231) e!522935)))

(assert (=> start!79288 tp!60944))

(declare-fun array_inv!20957 (array!55958) Bool)

(assert (=> start!79288 (array_inv!20957 _keys!1487)))

(declare-fun tp_is_empty!20009 () Bool)

(assert (=> start!79288 tp_is_empty!20009))

(declare-fun b!931143 () Bool)

(assert (=> b!931143 (= e!522932 e!522934)))

(declare-fun res!627084 () Bool)

(assert (=> b!931143 (=> (not res!627084) (not e!522934))))

(declare-fun contains!4995 (ListLongMap!11865 (_ BitVec 64)) Bool)

(assert (=> b!931143 (= res!627084 (contains!4995 lt!419383 k!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31643)

(declare-fun minValue!1173 () V!31643)

(declare-fun getCurrentListMap!3186 (array!55958 array!55960 (_ BitVec 32) (_ BitVec 32) V!31643 V!31643 (_ BitVec 32) Int) ListLongMap!11865)

(assert (=> b!931143 (= lt!419383 (getCurrentListMap!3186 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!931144 () Bool)

(declare-fun e!522937 () Bool)

(assert (=> b!931144 (= e!522935 (and e!522937 mapRes!31770))))

(declare-fun condMapEmpty!31770 () Bool)

(declare-fun mapDefault!31770 () ValueCell!9523)

