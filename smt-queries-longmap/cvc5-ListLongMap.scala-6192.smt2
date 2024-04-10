; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79260 () Bool)

(assert start!79260)

(declare-fun b_free!17473 () Bool)

(declare-fun b_next!17473 () Bool)

(assert (=> start!79260 (= b_free!17473 (not b_next!17473))))

(declare-fun tp!60859 () Bool)

(declare-fun b_and!28539 () Bool)

(assert (=> start!79260 (= tp!60859 b_and!28539)))

(declare-fun b!930762 () Bool)

(declare-fun e!522682 () Bool)

(assert (=> b!930762 (= e!522682 false)))

(declare-datatypes ((V!31607 0))(
  ( (V!31608 (val!10041 Int)) )
))
(declare-fun lt!419299 () V!31607)

(declare-datatypes ((tuple2!13142 0))(
  ( (tuple2!13143 (_1!6582 (_ BitVec 64)) (_2!6582 V!31607)) )
))
(declare-datatypes ((List!18932 0))(
  ( (Nil!18929) (Cons!18928 (h!20074 tuple2!13142) (t!26989 List!18932)) )
))
(declare-datatypes ((ListLongMap!11839 0))(
  ( (ListLongMap!11840 (toList!5935 List!18932)) )
))
(declare-fun lt!419298 () ListLongMap!11839)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!757 (ListLongMap!11839 (_ BitVec 64)) V!31607)

(assert (=> b!930762 (= lt!419299 (apply!757 lt!419298 k!1099))))

(declare-fun b!930763 () Bool)

(declare-fun e!522681 () Bool)

(declare-fun tp_is_empty!19981 () Bool)

(assert (=> b!930763 (= e!522681 tp_is_empty!19981)))

(declare-fun b!930764 () Bool)

(declare-fun e!522684 () Bool)

(declare-fun e!522685 () Bool)

(declare-fun mapRes!31728 () Bool)

(assert (=> b!930764 (= e!522684 (and e!522685 mapRes!31728))))

(declare-fun condMapEmpty!31728 () Bool)

(declare-datatypes ((ValueCell!9509 0))(
  ( (ValueCellFull!9509 (v!12559 V!31607)) (EmptyCell!9509) )
))
(declare-datatypes ((array!55904 0))(
  ( (array!55905 (arr!26897 (Array (_ BitVec 32) ValueCell!9509)) (size!27356 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55904)

(declare-fun mapDefault!31728 () ValueCell!9509)

