; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81818 () Bool)

(assert start!81818)

(declare-fun b_free!18313 () Bool)

(declare-fun b_next!18313 () Bool)

(assert (=> start!81818 (= b_free!18313 (not b_next!18313))))

(declare-fun tp!63639 () Bool)

(declare-fun b_and!29799 () Bool)

(assert (=> start!81818 (= tp!63639 b_and!29799)))

(declare-fun mapIsEmpty!33247 () Bool)

(declare-fun mapRes!33247 () Bool)

(assert (=> mapIsEmpty!33247 mapRes!33247))

(declare-fun b!954103 () Bool)

(declare-fun res!638911 () Bool)

(declare-fun e!537534 () Bool)

(assert (=> b!954103 (=> (not res!638911) (not e!537534))))

(declare-datatypes ((array!57827 0))(
  ( (array!57828 (arr!27793 (Array (_ BitVec 32) (_ BitVec 64))) (size!28272 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57827)

(declare-datatypes ((List!19381 0))(
  ( (Nil!19378) (Cons!19377 (h!20539 (_ BitVec 64)) (t!27742 List!19381)) )
))
(declare-fun arrayNoDuplicates!0 (array!57827 (_ BitVec 32) List!19381) Bool)

(assert (=> b!954103 (= res!638911 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19378))))

(declare-fun b!954104 () Bool)

(declare-fun e!537536 () Bool)

(declare-fun tp_is_empty!20857 () Bool)

(assert (=> b!954104 (= e!537536 tp_is_empty!20857)))

(declare-fun b!954105 () Bool)

(declare-fun res!638914 () Bool)

(assert (=> b!954105 (=> (not res!638914) (not e!537534))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954105 (= res!638914 (validKeyInArray!0 (select (arr!27793 _keys!1441) i!735)))))

(declare-fun b!954106 () Bool)

(declare-fun res!638915 () Bool)

(assert (=> b!954106 (=> (not res!638915) (not e!537534))))

(assert (=> b!954106 (= res!638915 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28272 _keys!1441))))))

(declare-fun res!638916 () Bool)

(assert (=> start!81818 (=> (not res!638916) (not e!537534))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81818 (= res!638916 (validMask!0 mask!1823))))

(assert (=> start!81818 e!537534))

(assert (=> start!81818 true))

(assert (=> start!81818 tp_is_empty!20857))

(declare-fun array_inv!21575 (array!57827) Bool)

(assert (=> start!81818 (array_inv!21575 _keys!1441)))

(declare-datatypes ((V!32793 0))(
  ( (V!32794 (val!10479 Int)) )
))
(declare-datatypes ((ValueCell!9947 0))(
  ( (ValueCellFull!9947 (v!13034 V!32793)) (EmptyCell!9947) )
))
(declare-datatypes ((array!57829 0))(
  ( (array!57830 (arr!27794 (Array (_ BitVec 32) ValueCell!9947)) (size!28273 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57829)

(declare-fun e!537538 () Bool)

(declare-fun array_inv!21576 (array!57829) Bool)

(assert (=> start!81818 (and (array_inv!21576 _values!1197) e!537538)))

(assert (=> start!81818 tp!63639))

(declare-fun mapNonEmpty!33247 () Bool)

(declare-fun tp!63638 () Bool)

(assert (=> mapNonEmpty!33247 (= mapRes!33247 (and tp!63638 e!537536))))

(declare-fun mapKey!33247 () (_ BitVec 32))

(declare-fun mapRest!33247 () (Array (_ BitVec 32) ValueCell!9947))

(declare-fun mapValue!33247 () ValueCell!9947)

(assert (=> mapNonEmpty!33247 (= (arr!27794 _values!1197) (store mapRest!33247 mapKey!33247 mapValue!33247))))

(declare-fun b!954107 () Bool)

(assert (=> b!954107 (= e!537534 false)))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32793)

(declare-fun lt!429863 () Bool)

(declare-fun minValue!1139 () V!32793)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13602 0))(
  ( (tuple2!13603 (_1!6812 (_ BitVec 64)) (_2!6812 V!32793)) )
))
(declare-datatypes ((List!19382 0))(
  ( (Nil!19379) (Cons!19378 (h!20540 tuple2!13602) (t!27743 List!19382)) )
))
(declare-datatypes ((ListLongMap!12299 0))(
  ( (ListLongMap!12300 (toList!6165 List!19382)) )
))
(declare-fun contains!5263 (ListLongMap!12299 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3398 (array!57827 array!57829 (_ BitVec 32) (_ BitVec 32) V!32793 V!32793 (_ BitVec 32) Int) ListLongMap!12299)

(assert (=> b!954107 (= lt!429863 (contains!5263 (getCurrentListMap!3398 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27793 _keys!1441) i!735)))))

(declare-fun b!954108 () Bool)

(declare-fun res!638912 () Bool)

(assert (=> b!954108 (=> (not res!638912) (not e!537534))))

(assert (=> b!954108 (= res!638912 (and (= (size!28273 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28272 _keys!1441) (size!28273 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954109 () Bool)

(declare-fun e!537535 () Bool)

(assert (=> b!954109 (= e!537538 (and e!537535 mapRes!33247))))

(declare-fun condMapEmpty!33247 () Bool)

(declare-fun mapDefault!33247 () ValueCell!9947)

