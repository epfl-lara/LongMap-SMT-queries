; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82038 () Bool)

(assert start!82038)

(declare-fun b_free!18445 () Bool)

(declare-fun b_next!18445 () Bool)

(assert (=> start!82038 (= b_free!18445 (not b_next!18445))))

(declare-fun tp!64145 () Bool)

(declare-fun b_and!29933 () Bool)

(assert (=> start!82038 (= tp!64145 b_and!29933)))

(declare-fun mapIsEmpty!33556 () Bool)

(declare-fun mapRes!33556 () Bool)

(assert (=> mapIsEmpty!33556 mapRes!33556))

(declare-fun b!956725 () Bool)

(declare-fun res!640551 () Bool)

(declare-fun e!539136 () Bool)

(assert (=> b!956725 (=> (not res!640551) (not e!539136))))

(declare-datatypes ((array!58221 0))(
  ( (array!58222 (arr!27989 (Array (_ BitVec 32) (_ BitVec 64))) (size!28468 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58221)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!956725 (= res!640551 (validKeyInArray!0 (select (arr!27989 _keys!1441) i!735)))))

(declare-fun b!956726 () Bool)

(declare-fun res!640554 () Bool)

(assert (=> b!956726 (=> (not res!640554) (not e!539136))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58221 (_ BitVec 32)) Bool)

(assert (=> b!956726 (= res!640554 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!640557 () Bool)

(assert (=> start!82038 (=> (not res!640557) (not e!539136))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82038 (= res!640557 (validMask!0 mask!1823))))

(assert (=> start!82038 e!539136))

(assert (=> start!82038 true))

(declare-fun tp_is_empty!21061 () Bool)

(assert (=> start!82038 tp_is_empty!21061))

(declare-fun array_inv!21715 (array!58221) Bool)

(assert (=> start!82038 (array_inv!21715 _keys!1441)))

(declare-datatypes ((V!33065 0))(
  ( (V!33066 (val!10581 Int)) )
))
(declare-datatypes ((ValueCell!10049 0))(
  ( (ValueCellFull!10049 (v!13137 V!33065)) (EmptyCell!10049) )
))
(declare-datatypes ((array!58223 0))(
  ( (array!58224 (arr!27990 (Array (_ BitVec 32) ValueCell!10049)) (size!28469 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58223)

(declare-fun e!539140 () Bool)

(declare-fun array_inv!21716 (array!58223) Bool)

(assert (=> start!82038 (and (array_inv!21716 _values!1197) e!539140)))

(assert (=> start!82038 tp!64145))

(declare-fun b!956727 () Bool)

(assert (=> b!956727 (= e!539136 (not true))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-fun zeroValue!1139 () V!33065)

(declare-fun minValue!1139 () V!33065)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13692 0))(
  ( (tuple2!13693 (_1!6857 (_ BitVec 64)) (_2!6857 V!33065)) )
))
(declare-datatypes ((List!19491 0))(
  ( (Nil!19488) (Cons!19487 (h!20649 tuple2!13692) (t!27854 List!19491)) )
))
(declare-datatypes ((ListLongMap!12389 0))(
  ( (ListLongMap!12390 (toList!6210 List!19491)) )
))
(declare-fun contains!5309 (ListLongMap!12389 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3443 (array!58221 array!58223 (_ BitVec 32) (_ BitVec 32) V!33065 V!33065 (_ BitVec 32) Int) ListLongMap!12389)

(assert (=> b!956727 (contains!5309 (getCurrentListMap!3443 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 #b00000000000000000000000000000000 defaultEntry!1205) (select (arr!27989 _keys!1441) i!735))))

(declare-datatypes ((Unit!32139 0))(
  ( (Unit!32140) )
))
(declare-fun lt!430247 () Unit!32139)

(declare-fun lemmaInListMapFromThenFromZero!22 (array!58221 array!58223 (_ BitVec 32) (_ BitVec 32) V!33065 V!33065 (_ BitVec 32) (_ BitVec 32) Int) Unit!32139)

(assert (=> b!956727 (= lt!430247 (lemmaInListMapFromThenFromZero!22 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 i!735 defaultEntry!1205))))

(declare-fun b!956728 () Bool)

(declare-fun e!539139 () Bool)

(assert (=> b!956728 (= e!539139 tp_is_empty!21061)))

(declare-fun mapNonEmpty!33556 () Bool)

(declare-fun tp!64146 () Bool)

(declare-fun e!539138 () Bool)

(assert (=> mapNonEmpty!33556 (= mapRes!33556 (and tp!64146 e!539138))))

(declare-fun mapValue!33556 () ValueCell!10049)

(declare-fun mapKey!33556 () (_ BitVec 32))

(declare-fun mapRest!33556 () (Array (_ BitVec 32) ValueCell!10049))

(assert (=> mapNonEmpty!33556 (= (arr!27990 _values!1197) (store mapRest!33556 mapKey!33556 mapValue!33556))))

(declare-fun b!956729 () Bool)

(declare-fun res!640556 () Bool)

(assert (=> b!956729 (=> (not res!640556) (not e!539136))))

(declare-datatypes ((List!19492 0))(
  ( (Nil!19489) (Cons!19488 (h!20650 (_ BitVec 64)) (t!27855 List!19492)) )
))
(declare-fun arrayNoDuplicates!0 (array!58221 (_ BitVec 32) List!19492) Bool)

(assert (=> b!956729 (= res!640556 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19489))))

(declare-fun b!956730 () Bool)

(declare-fun res!640552 () Bool)

(assert (=> b!956730 (=> (not res!640552) (not e!539136))))

(assert (=> b!956730 (= res!640552 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28468 _keys!1441))))))

(declare-fun b!956731 () Bool)

(declare-fun res!640555 () Bool)

(assert (=> b!956731 (=> (not res!640555) (not e!539136))))

(assert (=> b!956731 (= res!640555 (contains!5309 (getCurrentListMap!3443 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27989 _keys!1441) i!735)))))

(declare-fun b!956732 () Bool)

(assert (=> b!956732 (= e!539140 (and e!539139 mapRes!33556))))

(declare-fun condMapEmpty!33556 () Bool)

(declare-fun mapDefault!33556 () ValueCell!10049)

