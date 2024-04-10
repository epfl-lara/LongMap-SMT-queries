; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81854 () Bool)

(assert start!81854)

(declare-fun b_free!18349 () Bool)

(declare-fun b_next!18349 () Bool)

(assert (=> start!81854 (= b_free!18349 (not b_next!18349))))

(declare-fun tp!63746 () Bool)

(declare-fun b_and!29835 () Bool)

(assert (=> start!81854 (= tp!63746 b_and!29835)))

(declare-fun b!954589 () Bool)

(declare-fun e!537806 () Bool)

(assert (=> b!954589 (= e!537806 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32841 0))(
  ( (V!32842 (val!10497 Int)) )
))
(declare-fun zeroValue!1139 () V!32841)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!57897 0))(
  ( (array!57898 (arr!27828 (Array (_ BitVec 32) (_ BitVec 64))) (size!28307 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57897)

(declare-datatypes ((ValueCell!9965 0))(
  ( (ValueCellFull!9965 (v!13052 V!32841)) (EmptyCell!9965) )
))
(declare-datatypes ((array!57899 0))(
  ( (array!57900 (arr!27829 (Array (_ BitVec 32) ValueCell!9965)) (size!28308 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57899)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun lt!429917 () Bool)

(declare-fun defaultEntry!1205 () Int)

(declare-fun minValue!1139 () V!32841)

(declare-datatypes ((tuple2!13622 0))(
  ( (tuple2!13623 (_1!6822 (_ BitVec 64)) (_2!6822 V!32841)) )
))
(declare-datatypes ((List!19401 0))(
  ( (Nil!19398) (Cons!19397 (h!20559 tuple2!13622) (t!27762 List!19401)) )
))
(declare-datatypes ((ListLongMap!12319 0))(
  ( (ListLongMap!12320 (toList!6175 List!19401)) )
))
(declare-fun contains!5273 (ListLongMap!12319 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3408 (array!57897 array!57899 (_ BitVec 32) (_ BitVec 32) V!32841 V!32841 (_ BitVec 32) Int) ListLongMap!12319)

(assert (=> b!954589 (= lt!429917 (contains!5273 (getCurrentListMap!3408 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27828 _keys!1441) i!735)))))

(declare-fun b!954590 () Bool)

(declare-fun e!537808 () Bool)

(declare-fun e!537805 () Bool)

(declare-fun mapRes!33301 () Bool)

(assert (=> b!954590 (= e!537808 (and e!537805 mapRes!33301))))

(declare-fun condMapEmpty!33301 () Bool)

(declare-fun mapDefault!33301 () ValueCell!9965)

