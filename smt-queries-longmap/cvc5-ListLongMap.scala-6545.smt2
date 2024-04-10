; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83154 () Bool)

(assert start!83154)

(declare-fun b_free!19147 () Bool)

(declare-fun b_next!19147 () Bool)

(assert (=> start!83154 (= b_free!19147 (not b_next!19147))))

(declare-fun tp!66719 () Bool)

(declare-fun b_and!30635 () Bool)

(assert (=> start!83154 (= tp!66719 b_and!30635)))

(declare-fun b!970081 () Bool)

(declare-fun e!546904 () Bool)

(declare-fun tp_is_empty!22045 () Bool)

(assert (=> b!970081 (= e!546904 tp_is_empty!22045)))

(declare-fun mapNonEmpty!35077 () Bool)

(declare-fun mapRes!35077 () Bool)

(declare-fun tp!66720 () Bool)

(assert (=> mapNonEmpty!35077 (= mapRes!35077 (and tp!66720 e!546904))))

(declare-datatypes ((V!34377 0))(
  ( (V!34378 (val!11073 Int)) )
))
(declare-datatypes ((ValueCell!10541 0))(
  ( (ValueCellFull!10541 (v!13632 V!34377)) (EmptyCell!10541) )
))
(declare-datatypes ((array!60151 0))(
  ( (array!60152 (arr!28939 (Array (_ BitVec 32) ValueCell!10541)) (size!29418 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60151)

(declare-fun mapValue!35077 () ValueCell!10541)

(declare-fun mapRest!35077 () (Array (_ BitVec 32) ValueCell!10541))

(declare-fun mapKey!35077 () (_ BitVec 32))

(assert (=> mapNonEmpty!35077 (= (arr!28939 _values!1425) (store mapRest!35077 mapKey!35077 mapValue!35077))))

(declare-fun b!970082 () Bool)

(declare-fun e!546903 () Bool)

(declare-fun e!546902 () Bool)

(assert (=> b!970082 (= e!546903 (and e!546902 mapRes!35077))))

(declare-fun condMapEmpty!35077 () Bool)

(declare-fun mapDefault!35077 () ValueCell!10541)

