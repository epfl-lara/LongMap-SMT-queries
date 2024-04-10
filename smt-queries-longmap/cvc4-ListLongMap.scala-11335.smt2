; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!131918 () Bool)

(assert start!131918)

(declare-fun b_free!31631 () Bool)

(declare-fun b_next!31631 () Bool)

(assert (=> start!131918 (= b_free!31631 (not b_next!31631))))

(declare-fun tp!111145 () Bool)

(declare-fun b_and!51041 () Bool)

(assert (=> start!131918 (= tp!111145 b_and!51041)))

(declare-fun mapNonEmpty!58564 () Bool)

(declare-fun mapRes!58564 () Bool)

(declare-fun tp!111144 () Bool)

(declare-fun e!859769 () Bool)

(assert (=> mapNonEmpty!58564 (= mapRes!58564 (and tp!111144 e!859769))))

(declare-datatypes ((V!58985 0))(
  ( (V!58986 (val!19031 Int)) )
))
(declare-datatypes ((ValueCell!18043 0))(
  ( (ValueCellFull!18043 (v!21832 V!58985)) (EmptyCell!18043) )
))
(declare-fun mapValue!58564 () ValueCell!18043)

(declare-fun mapKey!58564 () (_ BitVec 32))

(declare-fun mapRest!58564 () (Array (_ BitVec 32) ValueCell!18043))

(declare-datatypes ((array!103024 0))(
  ( (array!103025 (arr!49714 (Array (_ BitVec 32) ValueCell!18043)) (size!50264 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!103024)

(assert (=> mapNonEmpty!58564 (= (arr!49714 _values!470) (store mapRest!58564 mapKey!58564 mapValue!58564))))

(declare-fun b!1544641 () Bool)

(declare-datatypes ((tuple2!24450 0))(
  ( (tuple2!24451 (_1!12236 (_ BitVec 64)) (_2!12236 V!58985)) )
))
(declare-datatypes ((List!35965 0))(
  ( (Nil!35962) (Cons!35961 (h!37406 tuple2!24450) (t!50659 List!35965)) )
))
(declare-datatypes ((ListLongMap!22059 0))(
  ( (ListLongMap!22060 (toList!11045 List!35965)) )
))
(declare-fun e!859771 () ListLongMap!22059)

(declare-fun call!68964 () ListLongMap!22059)

(declare-fun minValue!436 () V!58985)

(declare-fun +!4881 (ListLongMap!22059 tuple2!24450) ListLongMap!22059)

(assert (=> b!1544641 (= e!859771 (+!4881 call!68964 (tuple2!24451 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!436)))))

(declare-fun b!1544642 () Bool)

(declare-fun e!859776 () Bool)

(declare-fun e!859773 () Bool)

(assert (=> b!1544642 (= e!859776 (and e!859773 mapRes!58564))))

(declare-fun condMapEmpty!58564 () Bool)

(declare-fun mapDefault!58564 () ValueCell!18043)

