; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108194 () Bool)

(assert start!108194)

(declare-fun b_free!27889 () Bool)

(declare-fun b_next!27889 () Bool)

(assert (=> start!108194 (= b_free!27889 (not b_next!27889))))

(declare-fun tp!98623 () Bool)

(declare-fun b_and!45947 () Bool)

(assert (=> start!108194 (= tp!98623 b_and!45947)))

(declare-fun b!1277634 () Bool)

(declare-fun res!848943 () Bool)

(declare-fun e!729683 () Bool)

(assert (=> b!1277634 (=> (not res!848943) (not e!729683))))

(declare-datatypes ((array!83972 0))(
  ( (array!83973 (arr!40496 (Array (_ BitVec 32) (_ BitVec 64))) (size!41046 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83972)

(declare-datatypes ((List!28718 0))(
  ( (Nil!28715) (Cons!28714 (h!29923 (_ BitVec 64)) (t!42256 List!28718)) )
))
(declare-fun arrayNoDuplicates!0 (array!83972 (_ BitVec 32) List!28718) Bool)

(assert (=> b!1277634 (= res!848943 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28715))))

(declare-fun b!1277635 () Bool)

(declare-fun res!848941 () Bool)

(assert (=> b!1277635 (=> (not res!848941) (not e!729683))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49689 0))(
  ( (V!49690 (val!16794 Int)) )
))
(declare-datatypes ((ValueCell!15821 0))(
  ( (ValueCellFull!15821 (v!19392 V!49689)) (EmptyCell!15821) )
))
(declare-datatypes ((array!83974 0))(
  ( (array!83975 (arr!40497 (Array (_ BitVec 32) ValueCell!15821)) (size!41047 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83974)

(declare-fun mask!1805 () (_ BitVec 32))

(assert (=> b!1277635 (= res!848941 (and (= (size!41047 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!41046 _keys!1427) (size!41047 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun res!848940 () Bool)

(assert (=> start!108194 (=> (not res!848940) (not e!729683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108194 (= res!848940 (validMask!0 mask!1805))))

(assert (=> start!108194 e!729683))

(assert (=> start!108194 true))

(assert (=> start!108194 tp!98623))

(declare-fun tp_is_empty!33439 () Bool)

(assert (=> start!108194 tp_is_empty!33439))

(declare-fun e!729680 () Bool)

(declare-fun array_inv!30767 (array!83974) Bool)

(assert (=> start!108194 (and (array_inv!30767 _values!1187) e!729680)))

(declare-fun array_inv!30768 (array!83972) Bool)

(assert (=> start!108194 (array_inv!30768 _keys!1427)))

(declare-fun b!1277636 () Bool)

(declare-fun e!729682 () Bool)

(declare-fun mapRes!51692 () Bool)

(assert (=> b!1277636 (= e!729680 (and e!729682 mapRes!51692))))

(declare-fun condMapEmpty!51692 () Bool)

(declare-fun mapDefault!51692 () ValueCell!15821)

