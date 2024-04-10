; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81930 () Bool)

(assert start!81930)

(declare-fun b_free!18425 () Bool)

(declare-fun b_next!18425 () Bool)

(assert (=> start!81930 (= b_free!18425 (not b_next!18425))))

(declare-fun tp!63975 () Bool)

(declare-fun b_and!29911 () Bool)

(assert (=> start!81930 (= tp!63975 b_and!29911)))

(declare-fun b!955677 () Bool)

(declare-fun e!538378 () Bool)

(declare-fun tp_is_empty!20969 () Bool)

(assert (=> b!955677 (= e!538378 tp_is_empty!20969)))

(declare-fun b!955678 () Bool)

(declare-fun res!639983 () Bool)

(declare-fun e!538374 () Bool)

(assert (=> b!955678 (=> (not res!639983) (not e!538374))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32941 0))(
  ( (V!32942 (val!10535 Int)) )
))
(declare-fun zeroValue!1139 () V!32941)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58041 0))(
  ( (array!58042 (arr!27900 (Array (_ BitVec 32) (_ BitVec 64))) (size!28379 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58041)

(declare-datatypes ((ValueCell!10003 0))(
  ( (ValueCellFull!10003 (v!13090 V!32941)) (EmptyCell!10003) )
))
(declare-datatypes ((array!58043 0))(
  ( (array!58044 (arr!27901 (Array (_ BitVec 32) ValueCell!10003)) (size!28380 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58043)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32941)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13672 0))(
  ( (tuple2!13673 (_1!6847 (_ BitVec 64)) (_2!6847 V!32941)) )
))
(declare-datatypes ((List!19446 0))(
  ( (Nil!19443) (Cons!19442 (h!20604 tuple2!13672) (t!27807 List!19446)) )
))
(declare-datatypes ((ListLongMap!12369 0))(
  ( (ListLongMap!12370 (toList!6200 List!19446)) )
))
(declare-fun contains!5298 (ListLongMap!12369 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3433 (array!58041 array!58043 (_ BitVec 32) (_ BitVec 32) V!32941 V!32941 (_ BitVec 32) Int) ListLongMap!12369)

(assert (=> b!955678 (= res!639983 (contains!5298 (getCurrentListMap!3433 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27900 _keys!1441) i!735)))))

(declare-fun b!955679 () Bool)

(declare-fun res!639985 () Bool)

(assert (=> b!955679 (=> (not res!639985) (not e!538374))))

(assert (=> b!955679 (= res!639985 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28379 _keys!1441))))))

(declare-fun b!955680 () Bool)

(assert (=> b!955680 (= e!538374 (not true))))

(assert (=> b!955680 (contains!5298 (getCurrentListMap!3433 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27900 _keys!1441) i!735))))

(declare-datatypes ((Unit!32121 0))(
  ( (Unit!32122) )
))
(declare-fun lt!430031 () Unit!32121)

(declare-fun lemmaInListMapFromThenFromZero!15 (array!58041 array!58043 (_ BitVec 32) (_ BitVec 32) V!32941 V!32941 (_ BitVec 32) (_ BitVec 32) Int) Unit!32121)

(assert (=> b!955680 (= lt!430031 (lemmaInListMapFromThenFromZero!15 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun mapIsEmpty!33415 () Bool)

(declare-fun mapRes!33415 () Bool)

(assert (=> mapIsEmpty!33415 mapRes!33415))

(declare-fun mapNonEmpty!33415 () Bool)

(declare-fun tp!63974 () Bool)

(declare-fun e!538375 () Bool)

(assert (=> mapNonEmpty!33415 (= mapRes!33415 (and tp!63974 e!538375))))

(declare-fun mapValue!33415 () ValueCell!10003)

(declare-fun mapKey!33415 () (_ BitVec 32))

(declare-fun mapRest!33415 () (Array (_ BitVec 32) ValueCell!10003))

(assert (=> mapNonEmpty!33415 (= (arr!27901 _values!1197) (store mapRest!33415 mapKey!33415 mapValue!33415))))

(declare-fun b!955681 () Bool)

(declare-fun res!639981 () Bool)

(assert (=> b!955681 (=> (not res!639981) (not e!538374))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58041 (_ BitVec 32)) Bool)

(assert (=> b!955681 (= res!639981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955682 () Bool)

(declare-fun e!538376 () Bool)

(assert (=> b!955682 (= e!538376 (and e!538378 mapRes!33415))))

(declare-fun condMapEmpty!33415 () Bool)

(declare-fun mapDefault!33415 () ValueCell!10003)

