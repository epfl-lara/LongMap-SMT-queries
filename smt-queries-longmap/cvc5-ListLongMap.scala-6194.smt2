; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79272 () Bool)

(assert start!79272)

(declare-fun b_free!17485 () Bool)

(declare-fun b_next!17485 () Bool)

(assert (=> start!79272 (= b_free!17485 (not b_next!17485))))

(declare-fun tp!60896 () Bool)

(declare-fun b_and!28551 () Bool)

(assert (=> start!79272 (= tp!60896 b_and!28551)))

(declare-fun b!930924 () Bool)

(declare-fun e!522792 () Bool)

(declare-fun e!522788 () Bool)

(assert (=> b!930924 (= e!522792 e!522788)))

(declare-fun res!626941 () Bool)

(assert (=> b!930924 (=> (not res!626941) (not e!522788))))

(declare-datatypes ((V!31623 0))(
  ( (V!31624 (val!10047 Int)) )
))
(declare-datatypes ((tuple2!13152 0))(
  ( (tuple2!13153 (_1!6587 (_ BitVec 64)) (_2!6587 V!31623)) )
))
(declare-datatypes ((List!18941 0))(
  ( (Nil!18938) (Cons!18937 (h!20083 tuple2!13152) (t!26998 List!18941)) )
))
(declare-datatypes ((ListLongMap!11849 0))(
  ( (ListLongMap!11850 (toList!5940 List!18941)) )
))
(declare-fun lt!419334 () ListLongMap!11849)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun contains!4988 (ListLongMap!11849 (_ BitVec 64)) Bool)

(assert (=> b!930924 (= res!626941 (contains!4988 lt!419334 k!1099))))

(declare-datatypes ((array!55926 0))(
  ( (array!55927 (arr!26908 (Array (_ BitVec 32) (_ BitVec 64))) (size!27367 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55926)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9515 0))(
  ( (ValueCellFull!9515 (v!12565 V!31623)) (EmptyCell!9515) )
))
(declare-datatypes ((array!55928 0))(
  ( (array!55929 (arr!26909 (Array (_ BitVec 32) ValueCell!9515)) (size!27368 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55928)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31623)

(declare-fun minValue!1173 () V!31623)

(declare-fun getCurrentListMap!3179 (array!55926 array!55928 (_ BitVec 32) (_ BitVec 32) V!31623 V!31623 (_ BitVec 32) Int) ListLongMap!11849)

(assert (=> b!930924 (= lt!419334 (getCurrentListMap!3179 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!930925 () Bool)

(assert (=> b!930925 (= e!522788 false)))

(declare-fun lt!419335 () V!31623)

(declare-fun apply!761 (ListLongMap!11849 (_ BitVec 64)) V!31623)

(assert (=> b!930925 (= lt!419335 (apply!761 lt!419334 k!1099))))

(declare-fun b!930926 () Bool)

(declare-fun res!626938 () Bool)

(assert (=> b!930926 (=> (not res!626938) (not e!522792))))

(assert (=> b!930926 (= res!626938 (and (= (size!27368 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27367 _keys!1487) (size!27368 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!31746 () Bool)

(declare-fun mapRes!31746 () Bool)

(declare-fun tp!60895 () Bool)

(declare-fun e!522791 () Bool)

(assert (=> mapNonEmpty!31746 (= mapRes!31746 (and tp!60895 e!522791))))

(declare-fun mapValue!31746 () ValueCell!9515)

(declare-fun mapRest!31746 () (Array (_ BitVec 32) ValueCell!9515))

(declare-fun mapKey!31746 () (_ BitVec 32))

(assert (=> mapNonEmpty!31746 (= (arr!26909 _values!1231) (store mapRest!31746 mapKey!31746 mapValue!31746))))

(declare-fun b!930927 () Bool)

(declare-fun e!522793 () Bool)

(declare-fun tp_is_empty!19993 () Bool)

(assert (=> b!930927 (= e!522793 tp_is_empty!19993)))

(declare-fun b!930928 () Bool)

(declare-fun e!522790 () Bool)

(assert (=> b!930928 (= e!522790 (and e!522793 mapRes!31746))))

(declare-fun condMapEmpty!31746 () Bool)

(declare-fun mapDefault!31746 () ValueCell!9515)

