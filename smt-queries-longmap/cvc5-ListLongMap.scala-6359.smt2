; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81890 () Bool)

(assert start!81890)

(declare-fun b_free!18385 () Bool)

(declare-fun b_next!18385 () Bool)

(assert (=> start!81890 (= b_free!18385 (not b_next!18385))))

(declare-fun tp!63854 () Bool)

(declare-fun b_and!29871 () Bool)

(assert (=> start!81890 (= tp!63854 b_and!29871)))

(declare-fun b!955077 () Bool)

(declare-fun e!538075 () Bool)

(declare-fun tp_is_empty!20929 () Bool)

(assert (=> b!955077 (= e!538075 tp_is_empty!20929)))

(declare-fun b!955078 () Bool)

(declare-fun e!538076 () Bool)

(assert (=> b!955078 (= e!538076 tp_is_empty!20929)))

(declare-fun b!955079 () Bool)

(declare-fun e!538077 () Bool)

(declare-fun mapRes!33355 () Bool)

(assert (=> b!955079 (= e!538077 (and e!538076 mapRes!33355))))

(declare-fun condMapEmpty!33355 () Bool)

(declare-datatypes ((V!32889 0))(
  ( (V!32890 (val!10515 Int)) )
))
(declare-datatypes ((ValueCell!9983 0))(
  ( (ValueCellFull!9983 (v!13070 V!32889)) (EmptyCell!9983) )
))
(declare-datatypes ((array!57965 0))(
  ( (array!57966 (arr!27862 (Array (_ BitVec 32) ValueCell!9983)) (size!28341 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57965)

(declare-fun mapDefault!33355 () ValueCell!9983)

