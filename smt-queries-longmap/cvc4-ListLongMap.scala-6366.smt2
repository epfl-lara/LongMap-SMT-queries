; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81936 () Bool)

(assert start!81936)

(declare-fun b_free!18431 () Bool)

(declare-fun b_next!18431 () Bool)

(assert (=> start!81936 (= b_free!18431 (not b_next!18431))))

(declare-fun tp!63992 () Bool)

(declare-fun b_and!29917 () Bool)

(assert (=> start!81936 (= tp!63992 b_and!29917)))

(declare-fun b!955768 () Bool)

(declare-fun res!640050 () Bool)

(declare-fun e!538422 () Bool)

(assert (=> b!955768 (=> (not res!640050) (not e!538422))))

(declare-fun i!735 () (_ BitVec 32))

(declare-datatypes ((array!58053 0))(
  ( (array!58054 (arr!27906 (Array (_ BitVec 32) (_ BitVec 64))) (size!28385 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58053)

(assert (=> b!955768 (= res!640050 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28385 _keys!1441))))))

(declare-fun b!955769 () Bool)

(declare-fun e!538419 () Bool)

(declare-fun tp_is_empty!20975 () Bool)

(assert (=> b!955769 (= e!538419 tp_is_empty!20975)))

(declare-fun b!955770 () Bool)

(declare-fun res!640047 () Bool)

(assert (=> b!955770 (=> (not res!640047) (not e!538422))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32949 0))(
  ( (V!32950 (val!10538 Int)) )
))
(declare-fun zeroValue!1139 () V!32949)

(declare-datatypes ((ValueCell!10006 0))(
  ( (ValueCellFull!10006 (v!13093 V!32949)) (EmptyCell!10006) )
))
(declare-datatypes ((array!58055 0))(
  ( (array!58056 (arr!27907 (Array (_ BitVec 32) ValueCell!10006)) (size!28386 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58055)

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun minValue!1139 () V!32949)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13678 0))(
  ( (tuple2!13679 (_1!6850 (_ BitVec 64)) (_2!6850 V!32949)) )
))
(declare-datatypes ((List!19451 0))(
  ( (Nil!19448) (Cons!19447 (h!20609 tuple2!13678) (t!27812 List!19451)) )
))
(declare-datatypes ((ListLongMap!12375 0))(
  ( (ListLongMap!12376 (toList!6203 List!19451)) )
))
(declare-fun contains!5301 (ListLongMap!12375 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3436 (array!58053 array!58055 (_ BitVec 32) (_ BitVec 32) V!32949 V!32949 (_ BitVec 32) Int) ListLongMap!12375)

(assert (=> b!955770 (= res!640047 (contains!5301 (getCurrentListMap!3436 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27906 _keys!1441) i!735)))))

(declare-fun b!955771 () Bool)

(declare-fun e!538420 () Bool)

(assert (=> b!955771 (= e!538420 tp_is_empty!20975)))

(declare-fun b!955772 () Bool)

(declare-fun res!640048 () Bool)

(assert (=> b!955772 (=> (not res!640048) (not e!538422))))

(assert (=> b!955772 (= res!640048 (and (= (size!28386 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28385 _keys!1441) (size!28386 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33424 () Bool)

(declare-fun mapRes!33424 () Bool)

(assert (=> mapIsEmpty!33424 mapRes!33424))

(declare-fun b!955773 () Bool)

(declare-fun res!640045 () Bool)

(assert (=> b!955773 (=> (not res!640045) (not e!538422))))

(declare-datatypes ((List!19452 0))(
  ( (Nil!19449) (Cons!19448 (h!20610 (_ BitVec 64)) (t!27813 List!19452)) )
))
(declare-fun arrayNoDuplicates!0 (array!58053 (_ BitVec 32) List!19452) Bool)

(assert (=> b!955773 (= res!640045 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19449))))

(declare-fun b!955767 () Bool)

(declare-fun res!640046 () Bool)

(assert (=> b!955767 (=> (not res!640046) (not e!538422))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!955767 (= res!640046 (validKeyInArray!0 (select (arr!27906 _keys!1441) i!735)))))

(declare-fun res!640044 () Bool)

(assert (=> start!81936 (=> (not res!640044) (not e!538422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81936 (= res!640044 (validMask!0 mask!1823))))

(assert (=> start!81936 e!538422))

(assert (=> start!81936 true))

(assert (=> start!81936 tp_is_empty!20975))

(declare-fun array_inv!21653 (array!58053) Bool)

(assert (=> start!81936 (array_inv!21653 _keys!1441)))

(declare-fun e!538423 () Bool)

(declare-fun array_inv!21654 (array!58055) Bool)

(assert (=> start!81936 (and (array_inv!21654 _values!1197) e!538423)))

(assert (=> start!81936 tp!63992))

(declare-fun b!955774 () Bool)

(assert (=> b!955774 (= e!538422 (not true))))

(assert (=> b!955774 (contains!5301 (getCurrentListMap!3436 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27906 _keys!1441) i!735))))

(declare-datatypes ((Unit!32127 0))(
  ( (Unit!32128) )
))
(declare-fun lt!430040 () Unit!32127)

(declare-fun lemmaInListMapFromThenFromZero!18 (array!58053 array!58055 (_ BitVec 32) (_ BitVec 32) V!32949 V!32949 (_ BitVec 32) (_ BitVec 32) Int) Unit!32127)

(assert (=> b!955774 (= lt!430040 (lemmaInListMapFromThenFromZero!18 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun mapNonEmpty!33424 () Bool)

(declare-fun tp!63993 () Bool)

(assert (=> mapNonEmpty!33424 (= mapRes!33424 (and tp!63993 e!538419))))

(declare-fun mapKey!33424 () (_ BitVec 32))

(declare-fun mapRest!33424 () (Array (_ BitVec 32) ValueCell!10006))

(declare-fun mapValue!33424 () ValueCell!10006)

(assert (=> mapNonEmpty!33424 (= (arr!27907 _values!1197) (store mapRest!33424 mapKey!33424 mapValue!33424))))

(declare-fun b!955775 () Bool)

(assert (=> b!955775 (= e!538423 (and e!538420 mapRes!33424))))

(declare-fun condMapEmpty!33424 () Bool)

(declare-fun mapDefault!33424 () ValueCell!10006)

