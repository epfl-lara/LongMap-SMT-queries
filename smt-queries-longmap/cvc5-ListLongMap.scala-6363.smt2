; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81914 () Bool)

(assert start!81914)

(declare-fun b_free!18409 () Bool)

(declare-fun b_next!18409 () Bool)

(assert (=> start!81914 (= b_free!18409 (not b_next!18409))))

(declare-fun tp!63927 () Bool)

(declare-fun b_and!29895 () Bool)

(assert (=> start!81914 (= tp!63927 b_and!29895)))

(declare-fun mapNonEmpty!33391 () Bool)

(declare-fun mapRes!33391 () Bool)

(declare-fun tp!63926 () Bool)

(declare-fun e!538257 () Bool)

(assert (=> mapNonEmpty!33391 (= mapRes!33391 (and tp!63926 e!538257))))

(declare-datatypes ((V!32921 0))(
  ( (V!32922 (val!10527 Int)) )
))
(declare-datatypes ((ValueCell!9995 0))(
  ( (ValueCellFull!9995 (v!13082 V!32921)) (EmptyCell!9995) )
))
(declare-datatypes ((array!58011 0))(
  ( (array!58012 (arr!27885 (Array (_ BitVec 32) ValueCell!9995)) (size!28364 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58011)

(declare-fun mapKey!33391 () (_ BitVec 32))

(declare-fun mapValue!33391 () ValueCell!9995)

(declare-fun mapRest!33391 () (Array (_ BitVec 32) ValueCell!9995))

(assert (=> mapNonEmpty!33391 (= (arr!27885 _values!1197) (store mapRest!33391 mapKey!33391 mapValue!33391))))

(declare-fun b!955437 () Bool)

(declare-fun res!639819 () Bool)

(declare-fun e!538254 () Bool)

(assert (=> b!955437 (=> (not res!639819) (not e!538254))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58013 0))(
  ( (array!58014 (arr!27886 (Array (_ BitVec 32) (_ BitVec 64))) (size!28365 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58013)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955437 (= res!639819 (and (= (size!28364 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28365 _keys!1441) (size!28364 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955438 () Bool)

(assert (=> b!955438 (= e!538254 (not true))))

(declare-fun zeroValue!1139 () V!32921)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32921)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13660 0))(
  ( (tuple2!13661 (_1!6841 (_ BitVec 64)) (_2!6841 V!32921)) )
))
(declare-datatypes ((List!19434 0))(
  ( (Nil!19431) (Cons!19430 (h!20592 tuple2!13660) (t!27795 List!19434)) )
))
(declare-datatypes ((ListLongMap!12357 0))(
  ( (ListLongMap!12358 (toList!6194 List!19434)) )
))
(declare-fun contains!5292 (ListLongMap!12357 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3427 (array!58013 array!58011 (_ BitVec 32) (_ BitVec 32) V!32921 V!32921 (_ BitVec 32) Int) ListLongMap!12357)

(assert (=> b!955438 (contains!5292 (getCurrentListMap!3427 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27886 _keys!1441) i!735))))

(declare-datatypes ((Unit!32109 0))(
  ( (Unit!32110) )
))
(declare-fun lt!430007 () Unit!32109)

(declare-fun lemmaInListMapFromThenFromZero!9 (array!58013 array!58011 (_ BitVec 32) (_ BitVec 32) V!32921 V!32921 (_ BitVec 32) (_ BitVec 32) Int) Unit!32109)

(assert (=> b!955438 (= lt!430007 (lemmaInListMapFromThenFromZero!9 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955439 () Bool)

(declare-fun res!639816 () Bool)

(assert (=> b!955439 (=> (not res!639816) (not e!538254))))

(declare-datatypes ((List!19435 0))(
  ( (Nil!19432) (Cons!19431 (h!20593 (_ BitVec 64)) (t!27796 List!19435)) )
))
(declare-fun arrayNoDuplicates!0 (array!58013 (_ BitVec 32) List!19435) Bool)

(assert (=> b!955439 (= res!639816 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19432))))

(declare-fun b!955440 () Bool)

(declare-fun e!538258 () Bool)

(declare-fun e!538255 () Bool)

(assert (=> b!955440 (= e!538258 (and e!538255 mapRes!33391))))

(declare-fun condMapEmpty!33391 () Bool)

(declare-fun mapDefault!33391 () ValueCell!9995)

