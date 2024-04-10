; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81938 () Bool)

(assert start!81938)

(declare-fun b_free!18433 () Bool)

(declare-fun b_next!18433 () Bool)

(assert (=> start!81938 (= b_free!18433 (not b_next!18433))))

(declare-fun tp!63999 () Bool)

(declare-fun b_and!29919 () Bool)

(assert (=> start!81938 (= tp!63999 b_and!29919)))

(declare-fun mapNonEmpty!33427 () Bool)

(declare-fun mapRes!33427 () Bool)

(declare-fun tp!63998 () Bool)

(declare-fun e!538434 () Bool)

(assert (=> mapNonEmpty!33427 (= mapRes!33427 (and tp!63998 e!538434))))

(declare-fun mapKey!33427 () (_ BitVec 32))

(declare-datatypes ((V!32953 0))(
  ( (V!32954 (val!10539 Int)) )
))
(declare-datatypes ((ValueCell!10007 0))(
  ( (ValueCellFull!10007 (v!13094 V!32953)) (EmptyCell!10007) )
))
(declare-fun mapValue!33427 () ValueCell!10007)

(declare-datatypes ((array!58057 0))(
  ( (array!58058 (arr!27908 (Array (_ BitVec 32) ValueCell!10007)) (size!28387 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58057)

(declare-fun mapRest!33427 () (Array (_ BitVec 32) ValueCell!10007))

(assert (=> mapNonEmpty!33427 (= (arr!27908 _values!1197) (store mapRest!33427 mapKey!33427 mapValue!33427))))

(declare-fun b!955797 () Bool)

(declare-fun e!538438 () Bool)

(declare-datatypes ((array!58059 0))(
  ( (array!58060 (arr!27909 (Array (_ BitVec 32) (_ BitVec 64))) (size!28388 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58059)

(assert (=> b!955797 (= e!538438 (not (bvsle #b00000000000000000000000000000000 (size!28388 _keys!1441))))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!32953)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32953)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13680 0))(
  ( (tuple2!13681 (_1!6851 (_ BitVec 64)) (_2!6851 V!32953)) )
))
(declare-datatypes ((List!19453 0))(
  ( (Nil!19450) (Cons!19449 (h!20611 tuple2!13680) (t!27814 List!19453)) )
))
(declare-datatypes ((ListLongMap!12377 0))(
  ( (ListLongMap!12378 (toList!6204 List!19453)) )
))
(declare-fun contains!5302 (ListLongMap!12377 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3437 (array!58059 array!58057 (_ BitVec 32) (_ BitVec 32) V!32953 V!32953 (_ BitVec 32) Int) ListLongMap!12377)

(assert (=> b!955797 (contains!5302 (getCurrentListMap!3437 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27909 _keys!1441) i!735))))

(declare-datatypes ((Unit!32129 0))(
  ( (Unit!32130) )
))
(declare-fun lt!430043 () Unit!32129)

(declare-fun lemmaInListMapFromThenFromZero!19 (array!58059 array!58057 (_ BitVec 32) (_ BitVec 32) V!32953 V!32953 (_ BitVec 32) (_ BitVec 32) Int) Unit!32129)

(assert (=> b!955797 (= lt!430043 (lemmaInListMapFromThenFromZero!19 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!955798 () Bool)

(declare-fun res!640068 () Bool)

(assert (=> b!955798 (=> (not res!640068) (not e!538438))))

(assert (=> b!955798 (= res!640068 (and (= (size!28387 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28388 _keys!1441) (size!28387 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955799 () Bool)

(declare-fun res!640071 () Bool)

(assert (=> b!955799 (=> (not res!640071) (not e!538438))))

(assert (=> b!955799 (= res!640071 (contains!5302 (getCurrentListMap!3437 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27909 _keys!1441) i!735)))))

(declare-fun mapIsEmpty!33427 () Bool)

(assert (=> mapIsEmpty!33427 mapRes!33427))

(declare-fun b!955800 () Bool)

(declare-fun res!640069 () Bool)

(assert (=> b!955800 (=> (not res!640069) (not e!538438))))

(declare-datatypes ((List!19454 0))(
  ( (Nil!19451) (Cons!19450 (h!20612 (_ BitVec 64)) (t!27815 List!19454)) )
))
(declare-fun arrayNoDuplicates!0 (array!58059 (_ BitVec 32) List!19454) Bool)

(assert (=> b!955800 (= res!640069 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19451))))

(declare-fun b!955801 () Bool)

(declare-fun res!640066 () Bool)

(assert (=> b!955801 (=> (not res!640066) (not e!538438))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58059 (_ BitVec 32)) Bool)

(assert (=> b!955801 (= res!640066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!955802 () Bool)

(declare-fun tp_is_empty!20977 () Bool)

(assert (=> b!955802 (= e!538434 tp_is_empty!20977)))

(declare-fun res!640070 () Bool)

(assert (=> start!81938 (=> (not res!640070) (not e!538438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81938 (= res!640070 (validMask!0 mask!1823))))

(assert (=> start!81938 e!538438))

(assert (=> start!81938 true))

(assert (=> start!81938 tp_is_empty!20977))

(declare-fun array_inv!21655 (array!58059) Bool)

(assert (=> start!81938 (array_inv!21655 _keys!1441)))

(declare-fun e!538435 () Bool)

(declare-fun array_inv!21656 (array!58057) Bool)

(assert (=> start!81938 (and (array_inv!21656 _values!1197) e!538435)))

(assert (=> start!81938 tp!63999))

(declare-fun b!955803 () Bool)

(declare-fun res!640067 () Bool)

(assert (=> b!955803 (=> (not res!640067) (not e!538438))))

(assert (=> b!955803 (= res!640067 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28388 _keys!1441))))))

(declare-fun b!955804 () Bool)

(declare-fun e!538437 () Bool)

(assert (=> b!955804 (= e!538435 (and e!538437 mapRes!33427))))

(declare-fun condMapEmpty!33427 () Bool)

(declare-fun mapDefault!33427 () ValueCell!10007)

