; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4280 () Bool)

(assert start!4280)

(declare-fun b_free!1145 () Bool)

(declare-fun b_next!1145 () Bool)

(assert (=> start!4280 (= b_free!1145 (not b_next!1145))))

(declare-fun tp!4861 () Bool)

(declare-fun b_and!1959 () Bool)

(assert (=> start!4280 (= tp!4861 b_and!1959)))

(declare-fun b!32798 () Bool)

(declare-fun res!19926 () Bool)

(declare-fun e!20843 () Bool)

(assert (=> b!32798 (=> (not res!19926) (not e!20843))))

(declare-datatypes ((array!2211 0))(
  ( (array!2212 (arr!1057 (Array (_ BitVec 32) (_ BitVec 64))) (size!1158 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2211)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2211 (_ BitVec 32)) Bool)

(assert (=> b!32798 (= res!19926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!32799 () Bool)

(declare-fun e!20840 () Bool)

(declare-fun tp_is_empty!1499 () Bool)

(assert (=> b!32799 (= e!20840 tp_is_empty!1499)))

(declare-fun b!32800 () Bool)

(declare-fun res!19929 () Bool)

(assert (=> b!32800 (=> (not res!19929) (not e!20843))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32800 (= res!19929 (validKeyInArray!0 k!1304))))

(declare-fun b!32801 () Bool)

(declare-fun e!20839 () Bool)

(assert (=> b!32801 (= e!20839 (not (= (size!1158 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((V!1823 0))(
  ( (V!1824 (val!776 Int)) )
))
(declare-datatypes ((tuple2!1262 0))(
  ( (tuple2!1263 (_1!642 (_ BitVec 64)) (_2!642 V!1823)) )
))
(declare-datatypes ((List!855 0))(
  ( (Nil!852) (Cons!851 (h!1418 tuple2!1262) (t!3552 List!855)) )
))
(declare-datatypes ((ListLongMap!839 0))(
  ( (ListLongMap!840 (toList!435 List!855)) )
))
(declare-fun lt!11894 () ListLongMap!839)

(declare-fun lt!11893 () (_ BitVec 32))

(declare-fun contains!377 (ListLongMap!839 (_ BitVec 64)) Bool)

(assert (=> b!32801 (contains!377 lt!11894 (select (arr!1057 _keys!1833) lt!11893))))

(declare-datatypes ((ValueCell!550 0))(
  ( (ValueCellFull!550 (v!1867 V!1823)) (EmptyCell!550) )
))
(declare-datatypes ((array!2213 0))(
  ( (array!2214 (arr!1058 (Array (_ BitVec 32) ValueCell!550)) (size!1159 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2213)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!717 0))(
  ( (Unit!718) )
))
(declare-fun lt!11892 () Unit!717)

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1823)

(declare-fun minValue!1443 () V!1823)

(declare-fun lemmaValidKeyInArrayIsInListMap!48 (array!2211 array!2213 (_ BitVec 32) (_ BitVec 32) V!1823 V!1823 (_ BitVec 32) Int) Unit!717)

(assert (=> b!32801 (= lt!11892 (lemmaValidKeyInArrayIsInListMap!48 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11893 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2211 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32801 (= lt!11893 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32802 () Bool)

(declare-fun res!19925 () Bool)

(assert (=> b!32802 (=> (not res!19925) (not e!20843))))

(assert (=> b!32802 (= res!19925 (and (= (size!1159 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1158 _keys!1833) (size!1159 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1783 () Bool)

(declare-fun mapRes!1783 () Bool)

(declare-fun tp!4860 () Bool)

(assert (=> mapNonEmpty!1783 (= mapRes!1783 (and tp!4860 e!20840))))

(declare-fun mapValue!1783 () ValueCell!550)

(declare-fun mapKey!1783 () (_ BitVec 32))

(declare-fun mapRest!1783 () (Array (_ BitVec 32) ValueCell!550))

(assert (=> mapNonEmpty!1783 (= (arr!1058 _values!1501) (store mapRest!1783 mapKey!1783 mapValue!1783))))

(declare-fun b!32803 () Bool)

(assert (=> b!32803 (= e!20843 e!20839)))

(declare-fun res!19928 () Bool)

(assert (=> b!32803 (=> (not res!19928) (not e!20839))))

(assert (=> b!32803 (= res!19928 (not (contains!377 lt!11894 k!1304)))))

(declare-fun getCurrentListMap!263 (array!2211 array!2213 (_ BitVec 32) (_ BitVec 32) V!1823 V!1823 (_ BitVec 32) Int) ListLongMap!839)

(assert (=> b!32803 (= lt!11894 (getCurrentListMap!263 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32804 () Bool)

(declare-fun e!20842 () Bool)

(assert (=> b!32804 (= e!20842 tp_is_empty!1499)))

(declare-fun b!32805 () Bool)

(declare-fun res!19924 () Bool)

(assert (=> b!32805 (=> (not res!19924) (not e!20839))))

(declare-fun arrayContainsKey!0 (array!2211 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32805 (= res!19924 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32806 () Bool)

(declare-fun res!19927 () Bool)

(assert (=> b!32806 (=> (not res!19927) (not e!20843))))

(declare-datatypes ((List!856 0))(
  ( (Nil!853) (Cons!852 (h!1419 (_ BitVec 64)) (t!3553 List!856)) )
))
(declare-fun arrayNoDuplicates!0 (array!2211 (_ BitVec 32) List!856) Bool)

(assert (=> b!32806 (= res!19927 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!853))))

(declare-fun b!32807 () Bool)

(declare-fun e!20841 () Bool)

(assert (=> b!32807 (= e!20841 (and e!20842 mapRes!1783))))

(declare-fun condMapEmpty!1783 () Bool)

(declare-fun mapDefault!1783 () ValueCell!550)

