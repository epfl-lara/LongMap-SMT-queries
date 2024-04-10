; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79152 () Bool)

(assert start!79152)

(declare-fun b_free!17365 () Bool)

(declare-fun b_next!17365 () Bool)

(assert (=> start!79152 (= b_free!17365 (not b_next!17365))))

(declare-fun tp!60536 () Bool)

(declare-fun b_and!28431 () Bool)

(assert (=> start!79152 (= tp!60536 b_and!28431)))

(declare-fun b!929079 () Bool)

(declare-fun e!521712 () Bool)

(declare-fun tp_is_empty!19873 () Bool)

(assert (=> b!929079 (= e!521712 tp_is_empty!19873)))

(declare-fun b!929080 () Bool)

(declare-fun e!521713 () Bool)

(assert (=> b!929080 (= e!521713 false)))

(declare-datatypes ((V!31463 0))(
  ( (V!31464 (val!9987 Int)) )
))
(declare-fun lt!419001 () V!31463)

(declare-datatypes ((tuple2!13054 0))(
  ( (tuple2!13055 (_1!6538 (_ BitVec 64)) (_2!6538 V!31463)) )
))
(declare-datatypes ((List!18850 0))(
  ( (Nil!18847) (Cons!18846 (h!19992 tuple2!13054) (t!26907 List!18850)) )
))
(declare-datatypes ((ListLongMap!11751 0))(
  ( (ListLongMap!11752 (toList!5891 List!18850)) )
))
(declare-fun lt!419002 () ListLongMap!11751)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!718 (ListLongMap!11751 (_ BitVec 64)) V!31463)

(assert (=> b!929080 (= lt!419001 (apply!718 lt!419002 k!1099))))

(declare-fun b!929081 () Bool)

(declare-fun e!521708 () Bool)

(assert (=> b!929081 (= e!521708 tp_is_empty!19873)))

(declare-fun b!929082 () Bool)

(declare-fun e!521709 () Bool)

(assert (=> b!929082 (= e!521709 e!521713)))

(declare-fun res!625634 () Bool)

(assert (=> b!929082 (=> (not res!625634) (not e!521713))))

(declare-fun contains!4946 (ListLongMap!11751 (_ BitVec 64)) Bool)

(assert (=> b!929082 (= res!625634 (contains!4946 lt!419002 k!1099))))

(declare-datatypes ((array!55700 0))(
  ( (array!55701 (arr!26795 (Array (_ BitVec 32) (_ BitVec 64))) (size!27254 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55700)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9455 0))(
  ( (ValueCellFull!9455 (v!12505 V!31463)) (EmptyCell!9455) )
))
(declare-datatypes ((array!55702 0))(
  ( (array!55703 (arr!26796 (Array (_ BitVec 32) ValueCell!9455)) (size!27255 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55702)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31463)

(declare-fun minValue!1173 () V!31463)

(declare-fun getCurrentListMap!3137 (array!55700 array!55702 (_ BitVec 32) (_ BitVec 32) V!31463 V!31463 (_ BitVec 32) Int) ListLongMap!11751)

(assert (=> b!929082 (= lt!419002 (getCurrentListMap!3137 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929083 () Bool)

(declare-fun e!521710 () Bool)

(declare-fun mapRes!31566 () Bool)

(assert (=> b!929083 (= e!521710 (and e!521708 mapRes!31566))))

(declare-fun condMapEmpty!31566 () Bool)

(declare-fun mapDefault!31566 () ValueCell!9455)

