; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108068 () Bool)

(assert start!108068)

(declare-fun b_free!27781 () Bool)

(declare-fun b_next!27781 () Bool)

(assert (=> start!108068 (= b_free!27781 (not b_next!27781))))

(declare-fun tp!98296 () Bool)

(declare-fun b_and!45837 () Bool)

(assert (=> start!108068 (= tp!98296 b_and!45837)))

(declare-fun b!1276271 () Bool)

(declare-fun res!848187 () Bool)

(declare-fun e!728766 () Bool)

(assert (=> b!1276271 (=> (not res!848187) (not e!728766))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83758 0))(
  ( (array!83759 (arr!40390 (Array (_ BitVec 32) (_ BitVec 64))) (size!40940 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83758)

(declare-datatypes ((V!49545 0))(
  ( (V!49546 (val!16740 Int)) )
))
(declare-datatypes ((ValueCell!15767 0))(
  ( (ValueCellFull!15767 (v!19337 V!49545)) (EmptyCell!15767) )
))
(declare-datatypes ((array!83760 0))(
  ( (array!83761 (arr!40391 (Array (_ BitVec 32) ValueCell!15767)) (size!40941 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83760)

(assert (=> b!1276271 (= res!848187 (and (= (size!40941 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40940 _keys!1427) (size!40941 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1276272 () Bool)

(declare-fun res!848189 () Bool)

(assert (=> b!1276272 (=> (not res!848189) (not e!728766))))

(declare-datatypes ((List!28643 0))(
  ( (Nil!28640) (Cons!28639 (h!29848 (_ BitVec 64)) (t!42179 List!28643)) )
))
(declare-fun arrayNoDuplicates!0 (array!83758 (_ BitVec 32) List!28643) Bool)

(assert (=> b!1276272 (= res!848189 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28640))))

(declare-fun b!1276273 () Bool)

(declare-fun e!728764 () Bool)

(declare-fun tp_is_empty!33331 () Bool)

(assert (=> b!1276273 (= e!728764 tp_is_empty!33331)))

(declare-fun b!1276274 () Bool)

(assert (=> b!1276274 (= e!728766 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun minValue!1129 () V!49545)

(declare-fun k!1053 () (_ BitVec 64))

(declare-fun lt!575464 () Bool)

(declare-fun zeroValue!1129 () V!49545)

(declare-datatypes ((tuple2!21472 0))(
  ( (tuple2!21473 (_1!10747 (_ BitVec 64)) (_2!10747 V!49545)) )
))
(declare-datatypes ((List!28644 0))(
  ( (Nil!28641) (Cons!28640 (h!29849 tuple2!21472) (t!42180 List!28644)) )
))
(declare-datatypes ((ListLongMap!19129 0))(
  ( (ListLongMap!19130 (toList!9580 List!28644)) )
))
(declare-fun contains!7689 (ListLongMap!19129 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4664 (array!83758 array!83760 (_ BitVec 32) (_ BitVec 32) V!49545 V!49545 (_ BitVec 32) Int) ListLongMap!19129)

(assert (=> b!1276274 (= lt!575464 (contains!7689 (getCurrentListMap!4664 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k!1053))))

(declare-fun b!1276275 () Bool)

(declare-fun e!728763 () Bool)

(assert (=> b!1276275 (= e!728763 tp_is_empty!33331)))

(declare-fun b!1276276 () Bool)

(declare-fun e!728762 () Bool)

(declare-fun mapRes!51527 () Bool)

(assert (=> b!1276276 (= e!728762 (and e!728763 mapRes!51527))))

(declare-fun condMapEmpty!51527 () Bool)

(declare-fun mapDefault!51527 () ValueCell!15767)

