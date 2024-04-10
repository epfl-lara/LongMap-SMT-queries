; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78654 () Bool)

(assert start!78654)

(declare-fun b_free!16867 () Bool)

(declare-fun b_next!16867 () Bool)

(assert (=> start!78654 (= b_free!16867 (not b_next!16867))))

(declare-fun tp!59042 () Bool)

(declare-fun b_and!27489 () Bool)

(assert (=> start!78654 (= tp!59042 b_and!27489)))

(declare-fun b!916971 () Bool)

(declare-fun res!618171 () Bool)

(declare-fun e!514791 () Bool)

(assert (=> b!916971 (=> (not res!618171) (not e!514791))))

(declare-datatypes ((array!54736 0))(
  ( (array!54737 (arr!26313 (Array (_ BitVec 32) (_ BitVec 64))) (size!26772 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54736)

(declare-datatypes ((List!18451 0))(
  ( (Nil!18448) (Cons!18447 (h!19593 (_ BitVec 64)) (t!26064 List!18451)) )
))
(declare-fun arrayNoDuplicates!0 (array!54736 (_ BitVec 32) List!18451) Bool)

(assert (=> b!916971 (= res!618171 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18448))))

(declare-fun b!916972 () Bool)

(declare-fun res!618172 () Bool)

(assert (=> b!916972 (=> (not res!618172) (not e!514791))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916972 (= res!618172 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26772 _keys!1487))))))

(declare-fun b!916973 () Bool)

(declare-fun e!514789 () Bool)

(assert (=> b!916973 (= e!514789 false)))

(declare-datatypes ((V!30799 0))(
  ( (V!30800 (val!9738 Int)) )
))
(declare-fun lt!411909 () V!30799)

(declare-datatypes ((tuple2!12640 0))(
  ( (tuple2!12641 (_1!6331 (_ BitVec 64)) (_2!6331 V!30799)) )
))
(declare-datatypes ((List!18452 0))(
  ( (Nil!18449) (Cons!18448 (h!19594 tuple2!12640) (t!26065 List!18452)) )
))
(declare-datatypes ((ListLongMap!11337 0))(
  ( (ListLongMap!11338 (toList!5684 List!18452)) )
))
(declare-fun lt!411910 () ListLongMap!11337)

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun apply!539 (ListLongMap!11337 (_ BitVec 64)) V!30799)

(assert (=> b!916973 (= lt!411909 (apply!539 lt!411910 k!1099))))

(declare-fun b!916974 () Bool)

(assert (=> b!916974 (= e!514791 e!514789)))

(declare-fun res!618174 () Bool)

(assert (=> b!916974 (=> (not res!618174) (not e!514789))))

(declare-fun contains!4736 (ListLongMap!11337 (_ BitVec 64)) Bool)

(assert (=> b!916974 (= res!618174 (contains!4736 lt!411910 k!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9206 0))(
  ( (ValueCellFull!9206 (v!12256 V!30799)) (EmptyCell!9206) )
))
(declare-datatypes ((array!54738 0))(
  ( (array!54739 (arr!26314 (Array (_ BitVec 32) ValueCell!9206)) (size!26773 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54738)

(declare-fun defaultEntry!1235 () Int)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30799)

(declare-fun minValue!1173 () V!30799)

(declare-fun getCurrentListMap!2943 (array!54736 array!54738 (_ BitVec 32) (_ BitVec 32) V!30799 V!30799 (_ BitVec 32) Int) ListLongMap!11337)

(assert (=> b!916974 (= lt!411910 (getCurrentListMap!2943 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916975 () Bool)

(declare-fun res!618173 () Bool)

(assert (=> b!916975 (=> (not res!618173) (not e!514791))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54736 (_ BitVec 32)) Bool)

(assert (=> b!916975 (= res!618173 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916976 () Bool)

(declare-fun res!618170 () Bool)

(assert (=> b!916976 (=> (not res!618170) (not e!514791))))

(assert (=> b!916976 (= res!618170 (and (= (size!26773 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26772 _keys!1487) (size!26773 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916977 () Bool)

(declare-fun e!514787 () Bool)

(declare-fun tp_is_empty!19375 () Bool)

(assert (=> b!916977 (= e!514787 tp_is_empty!19375)))

(declare-fun b!916978 () Bool)

(declare-fun e!514790 () Bool)

(assert (=> b!916978 (= e!514790 tp_is_empty!19375)))

(declare-fun mapNonEmpty!30819 () Bool)

(declare-fun mapRes!30819 () Bool)

(declare-fun tp!59041 () Bool)

(assert (=> mapNonEmpty!30819 (= mapRes!30819 (and tp!59041 e!514790))))

(declare-fun mapKey!30819 () (_ BitVec 32))

(declare-fun mapValue!30819 () ValueCell!9206)

(declare-fun mapRest!30819 () (Array (_ BitVec 32) ValueCell!9206))

(assert (=> mapNonEmpty!30819 (= (arr!26314 _values!1231) (store mapRest!30819 mapKey!30819 mapValue!30819))))

(declare-fun res!618175 () Bool)

(assert (=> start!78654 (=> (not res!618175) (not e!514791))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78654 (= res!618175 (validMask!0 mask!1881))))

(assert (=> start!78654 e!514791))

(assert (=> start!78654 true))

(declare-fun e!514792 () Bool)

(declare-fun array_inv!20518 (array!54738) Bool)

(assert (=> start!78654 (and (array_inv!20518 _values!1231) e!514792)))

(assert (=> start!78654 tp!59042))

(declare-fun array_inv!20519 (array!54736) Bool)

(assert (=> start!78654 (array_inv!20519 _keys!1487)))

(assert (=> start!78654 tp_is_empty!19375))

(declare-fun b!916979 () Bool)

(assert (=> b!916979 (= e!514792 (and e!514787 mapRes!30819))))

(declare-fun condMapEmpty!30819 () Bool)

(declare-fun mapDefault!30819 () ValueCell!9206)

