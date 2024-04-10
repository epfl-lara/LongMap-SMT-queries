; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81932 () Bool)

(assert start!81932)

(declare-fun b_free!18427 () Bool)

(declare-fun b_next!18427 () Bool)

(assert (=> start!81932 (= b_free!18427 (not b_next!18427))))

(declare-fun tp!63981 () Bool)

(declare-fun b_and!29913 () Bool)

(assert (=> start!81932 (= tp!63981 b_and!29913)))

(declare-fun b!955707 () Bool)

(declare-fun e!538389 () Bool)

(declare-fun tp_is_empty!20971 () Bool)

(assert (=> b!955707 (= e!538389 tp_is_empty!20971)))

(declare-fun mapNonEmpty!33418 () Bool)

(declare-fun mapRes!33418 () Bool)

(declare-fun tp!63980 () Bool)

(declare-fun e!538390 () Bool)

(assert (=> mapNonEmpty!33418 (= mapRes!33418 (and tp!63980 e!538390))))

(declare-datatypes ((V!32945 0))(
  ( (V!32946 (val!10536 Int)) )
))
(declare-datatypes ((ValueCell!10004 0))(
  ( (ValueCellFull!10004 (v!13091 V!32945)) (EmptyCell!10004) )
))
(declare-fun mapValue!33418 () ValueCell!10004)

(declare-fun mapRest!33418 () (Array (_ BitVec 32) ValueCell!10004))

(declare-fun mapKey!33418 () (_ BitVec 32))

(declare-datatypes ((array!58045 0))(
  ( (array!58046 (arr!27902 (Array (_ BitVec 32) ValueCell!10004)) (size!28381 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58045)

(assert (=> mapNonEmpty!33418 (= (arr!27902 _values!1197) (store mapRest!33418 mapKey!33418 mapValue!33418))))

(declare-fun b!955708 () Bool)

(declare-fun res!640004 () Bool)

(declare-fun e!538392 () Bool)

(assert (=> b!955708 (=> (not res!640004) (not e!538392))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58047 0))(
  ( (array!58048 (arr!27903 (Array (_ BitVec 32) (_ BitVec 64))) (size!28382 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58047)

(assert (=> b!955708 (= res!640004 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28382 _keys!1441))))))

(declare-fun b!955709 () Bool)

(assert (=> b!955709 (= e!538392 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32945)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32945)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13674 0))(
  ( (tuple2!13675 (_1!6848 (_ BitVec 64)) (_2!6848 V!32945)) )
))
(declare-datatypes ((List!19447 0))(
  ( (Nil!19444) (Cons!19443 (h!20605 tuple2!13674) (t!27808 List!19447)) )
))
(declare-datatypes ((ListLongMap!12371 0))(
  ( (ListLongMap!12372 (toList!6201 List!19447)) )
))
(declare-fun contains!5299 (ListLongMap!12371 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3434 (array!58047 array!58045 (_ BitVec 32) (_ BitVec 32) V!32945 V!32945 (_ BitVec 32) Int) ListLongMap!12371)

(assert (=> b!955709 (contains!5299 (getCurrentListMap!3434 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27903 _keys!1441) i!735))))

(declare-datatypes ((Unit!32123 0))(
  ( (Unit!32124) )
))
(declare-fun lt!430034 () Unit!32123)

(declare-fun lemmaInListMapFromThenFromZero!16 (array!58047 array!58045 (_ BitVec 32) (_ BitVec 32) V!32945 V!32945 (_ BitVec 32) (_ BitVec 32) Int) Unit!32123)

(assert (=> b!955709 (= lt!430034 (lemmaInListMapFromThenFromZero!16 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955711 () Bool)

(declare-fun res!640007 () Bool)

(assert (=> b!955711 (=> (not res!640007) (not e!538392))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955711 (= res!640007 (validKeyInArray!0 (select (arr!27903 _keys!1441) i!735)))))

(declare-fun b!955712 () Bool)

(declare-fun res!640006 () Bool)

(assert (=> b!955712 (=> (not res!640006) (not e!538392))))

(assert (=> b!955712 (= res!640006 (contains!5299 (getCurrentListMap!3434 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27903 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33418 () Bool)

(assert (=> mapIsEmpty!33418 mapRes!33418))

(declare-fun b!955713 () Bool)

(declare-fun res!640005 () Bool)

(assert (=> b!955713 (=> (not res!640005) (not e!538392))))

(declare-datatypes ((List!19448 0))(
  ( (Nil!19445) (Cons!19444 (h!20606 (_ BitVec 64)) (t!27809 List!19448)) )
))
(declare-fun arrayNoDuplicates!0 (array!58047 (_ BitVec 32) List!19448) Bool)

(assert (=> b!955713 (= res!640005 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19445))))

(declare-fun b!955714 () Bool)

(assert (=> b!955714 (= e!538390 tp_is_empty!20971)))

(declare-fun b!955715 () Bool)

(declare-fun res!640003 () Bool)

(assert (=> b!955715 (=> (not res!640003) (not e!538392))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58047 (_ BitVec 32)) Bool)

(assert (=> b!955715 (= res!640003 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955716 () Bool)

(declare-fun e!538391 () Bool)

(assert (=> b!955716 (= e!538391 (and e!538389 mapRes!33418))))

(declare-fun condMapEmpty!33418 () Bool)

(declare-fun mapDefault!33418 () ValueCell!10004)

