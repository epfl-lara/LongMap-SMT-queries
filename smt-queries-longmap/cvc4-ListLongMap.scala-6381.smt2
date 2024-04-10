; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82042 () Bool)

(assert start!82042)

(declare-fun b_free!18449 () Bool)

(declare-fun b_next!18449 () Bool)

(assert (=> start!82042 (= b_free!18449 (not b_next!18449))))

(declare-fun tp!64158 () Bool)

(declare-fun b_and!29937 () Bool)

(assert (=> start!82042 (= tp!64158 b_and!29937)))

(declare-fun b!956786 () Bool)

(declare-fun e!539167 () Bool)

(declare-fun tp_is_empty!21065 () Bool)

(assert (=> b!956786 (= e!539167 tp_is_empty!21065)))

(declare-fun b!956787 () Bool)

(declare-fun e!539166 () Bool)

(assert (=> b!956787 (= e!539166 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!33069 0))(
  ( (V!33070 (val!10583 Int)) )
))
(declare-fun zeroValue!1139 () V!33069)

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58229 0))(
  ( (array!58230 (arr!27993 (Array (_ BitVec 32) (_ BitVec 64))) (size!28472 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58229)

(declare-datatypes ((ValueCell!10051 0))(
  ( (ValueCellFull!10051 (v!13139 V!33069)) (EmptyCell!10051) )
))
(declare-datatypes ((array!58231 0))(
  ( (array!58232 (arr!27994 (Array (_ BitVec 32) ValueCell!10051)) (size!28473 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58231)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!33069)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13696 0))(
  ( (tuple2!13697 (_1!6859 (_ BitVec 64)) (_2!6859 V!33069)) )
))
(declare-datatypes ((List!19495 0))(
  ( (Nil!19492) (Cons!19491 (h!20653 tuple2!13696) (t!27858 List!19495)) )
))
(declare-datatypes ((ListLongMap!12393 0))(
  ( (ListLongMap!12394 (toList!6212 List!19495)) )
))
(declare-fun contains!5311 (ListLongMap!12393 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3445 (array!58229 array!58231 (_ BitVec 32) (_ BitVec 32) V!33069 V!33069 (_ BitVec 32) Int) ListLongMap!12393)

(assert (=> b!956787 (contains!5311 (getCurrentListMap!3445 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27993 _keys!1441) i!735))))

(declare-datatypes ((Unit!32143 0))(
  ( (Unit!32144) )
))
(declare-fun lt!430253 () Unit!32143)

(declare-fun lemmaInListMapFromThenFromZero!24 (array!58229 array!58231 (_ BitVec 32) (_ BitVec 32) V!33069 V!33069 (_ BitVec 32) (_ BitVec 32) Int) Unit!32143)

(assert (=> b!956787 (= lt!430253 (lemmaInListMapFromThenFromZero!24 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun mapNonEmpty!33562 () Bool)

(declare-fun mapRes!33562 () Bool)

(declare-fun tp!64157 () Bool)

(declare-fun e!539168 () Bool)

(assert (=> mapNonEmpty!33562 (= mapRes!33562 (and tp!64157 e!539168))))

(declare-fun mapKey!33562 () (_ BitVec 32))

(declare-fun mapRest!33562 () (Array (_ BitVec 32) ValueCell!10051))

(declare-fun mapValue!33562 () ValueCell!10051)

(assert (=> mapNonEmpty!33562 (= (arr!27994 _values!1197) (store mapRest!33562 mapKey!33562 mapValue!33562))))

(declare-fun mapIsEmpty!33562 () Bool)

(assert (=> mapIsEmpty!33562 mapRes!33562))

(declare-fun b!956788 () Bool)

(declare-fun res!640595 () Bool)

(assert (=> b!956788 (=> (not res!640595) (not e!539166))))

(assert (=> b!956788 (= res!640595 (contains!5311 (getCurrentListMap!3445 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27993 _keys!1441) i!735)))))

(declare-fun b!956789 () Bool)

(declare-fun e!539170 () Bool)

(assert (=> b!956789 (= e!539170 (and e!539167 mapRes!33562))))

(declare-fun condMapEmpty!33562 () Bool)

(declare-fun mapDefault!33562 () ValueCell!10051)

