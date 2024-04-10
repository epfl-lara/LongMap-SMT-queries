; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82048 () Bool)

(assert start!82048)

(declare-fun b_free!18455 () Bool)

(declare-fun b_next!18455 () Bool)

(assert (=> start!82048 (= b_free!18455 (not b_next!18455))))

(declare-fun tp!64176 () Bool)

(declare-fun b_and!29943 () Bool)

(assert (=> start!82048 (= tp!64176 b_and!29943)))

(declare-fun mapIsEmpty!33571 () Bool)

(declare-fun mapRes!33571 () Bool)

(assert (=> mapIsEmpty!33571 mapRes!33571))

(declare-fun res!640656 () Bool)

(declare-fun e!539211 () Bool)

(assert (=> start!82048 (=> (not res!640656) (not e!539211))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82048 (= res!640656 (validMask!0 mask!1823))))

(assert (=> start!82048 e!539211))

(assert (=> start!82048 true))

(declare-fun tp_is_empty!21071 () Bool)

(assert (=> start!82048 tp_is_empty!21071))

(declare-datatypes ((array!58241 0))(
  ( (array!58242 (arr!27999 (Array (_ BitVec 32) (_ BitVec 64))) (size!28478 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58241)

(declare-fun array_inv!21723 (array!58241) Bool)

(assert (=> start!82048 (array_inv!21723 _keys!1441)))

(declare-datatypes ((V!33077 0))(
  ( (V!33078 (val!10586 Int)) )
))
(declare-datatypes ((ValueCell!10054 0))(
  ( (ValueCellFull!10054 (v!13142 V!33077)) (EmptyCell!10054) )
))
(declare-datatypes ((array!58243 0))(
  ( (array!58244 (arr!28000 (Array (_ BitVec 32) ValueCell!10054)) (size!28479 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58243)

(declare-fun e!539215 () Bool)

(declare-fun array_inv!21724 (array!58243) Bool)

(assert (=> start!82048 (and (array_inv!21724 _values!1197) e!539215)))

(assert (=> start!82048 tp!64176))

(declare-fun b!956875 () Bool)

(declare-fun res!640659 () Bool)

(assert (=> b!956875 (=> (not res!640659) (not e!539211))))

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956875 (= res!640659 (validKeyInArray!0 (select (arr!27999 _keys!1441) i!735)))))

(declare-fun b!956876 () Bool)

(declare-fun res!640658 () Bool)

(assert (=> b!956876 (=> (not res!640658) (not e!539211))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!956876 (= res!640658 (and (= (size!28479 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28478 _keys!1441) (size!28479 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!33571 () Bool)

(declare-fun tp!64175 () Bool)

(declare-fun e!539214 () Bool)

(assert (=> mapNonEmpty!33571 (= mapRes!33571 (and tp!64175 e!539214))))

(declare-fun mapValue!33571 () ValueCell!10054)

(declare-fun mapKey!33571 () (_ BitVec 32))

(declare-fun mapRest!33571 () (Array (_ BitVec 32) ValueCell!10054))

(assert (=> mapNonEmpty!33571 (= (arr!28000 _values!1197) (store mapRest!33571 mapKey!33571 mapValue!33571))))

(declare-fun b!956877 () Bool)

(assert (=> b!956877 (= e!539211 (not true))))

(declare-fun zeroValue!1139 () V!33077)

(declare-fun minValue!1139 () V!33077)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13702 0))(
  ( (tuple2!13703 (_1!6862 (_ BitVec 64)) (_2!6862 V!33077)) )
))
(declare-datatypes ((List!19500 0))(
  ( (Nil!19497) (Cons!19496 (h!20658 tuple2!13702) (t!27863 List!19500)) )
))
(declare-datatypes ((ListLongMap!12399 0))(
  ( (ListLongMap!12400 (toList!6215 List!19500)) )
))
(declare-fun contains!5314 (ListLongMap!12399 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3448 (array!58241 array!58243 (_ BitVec 32) (_ BitVec 32) V!33077 V!33077 (_ BitVec 32) Int) ListLongMap!12399)

(assert (=> b!956877 (contains!5314 (getCurrentListMap!3448 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27999 _keys!1441) i!735))))

(declare-datatypes ((Unit!32149 0))(
  ( (Unit!32150) )
))
(declare-fun lt!430262 () Unit!32149)

(declare-fun lemmaInListMapFromThenFromZero!27 (array!58241 array!58243 (_ BitVec 32) (_ BitVec 32) V!33077 V!33077 (_ BitVec 32) (_ BitVec 32) Int) Unit!32149)

(assert (=> b!956877 (= lt!430262 (lemmaInListMapFromThenFromZero!27 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956878 () Bool)

(declare-fun e!539213 () Bool)

(assert (=> b!956878 (= e!539213 tp_is_empty!21071)))

(declare-fun b!956879 () Bool)

(assert (=> b!956879 (= e!539215 (and e!539213 mapRes!33571))))

(declare-fun condMapEmpty!33571 () Bool)

(declare-fun mapDefault!33571 () ValueCell!10054)

