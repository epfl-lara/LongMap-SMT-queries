; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106066 () Bool)

(assert start!106066)

(declare-fun b_free!27499 () Bool)

(declare-fun b_next!27499 () Bool)

(assert (=> start!106066 (= b_free!27499 (not b_next!27499))))

(declare-fun tp!96047 () Bool)

(declare-fun b_and!45473 () Bool)

(assert (=> start!106066 (= tp!96047 b_and!45473)))

(declare-fun b!1263042 () Bool)

(declare-fun res!841374 () Bool)

(declare-fun e!719046 () Bool)

(assert (=> b!1263042 (=> (not res!841374) (not e!719046))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82422 0))(
  ( (array!82423 (arr!39758 (Array (_ BitVec 32) (_ BitVec 64))) (size!40294 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82422)

(declare-datatypes ((V!48567 0))(
  ( (V!48568 (val!16263 Int)) )
))
(declare-datatypes ((ValueCell!15437 0))(
  ( (ValueCellFull!15437 (v!18972 V!48567)) (EmptyCell!15437) )
))
(declare-datatypes ((array!82424 0))(
  ( (array!82425 (arr!39759 (Array (_ BitVec 32) ValueCell!15437)) (size!40295 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82424)

(assert (=> b!1263042 (= res!841374 (and (= (size!40295 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!40294 _keys!1118) (size!40295 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1263043 () Bool)

(declare-fun e!719042 () Bool)

(declare-fun tp_is_empty!32401 () Bool)

(assert (=> b!1263043 (= e!719042 tp_is_empty!32401)))

(declare-fun res!841371 () Bool)

(assert (=> start!106066 (=> (not res!841371) (not e!719046))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106066 (= res!841371 (validMask!0 mask!1466))))

(assert (=> start!106066 e!719046))

(assert (=> start!106066 true))

(assert (=> start!106066 tp!96047))

(assert (=> start!106066 tp_is_empty!32401))

(declare-fun array_inv!30259 (array!82422) Bool)

(assert (=> start!106066 (array_inv!30259 _keys!1118)))

(declare-fun e!719044 () Bool)

(declare-fun array_inv!30260 (array!82424) Bool)

(assert (=> start!106066 (and (array_inv!30260 _values!914) e!719044)))

(declare-fun defaultEntry!922 () Int)

(declare-fun b!1263044 () Bool)

(declare-fun zeroValue!871 () V!48567)

(declare-fun minValueBefore!43 () V!48567)

(declare-fun e!719045 () Bool)

(declare-datatypes ((tuple2!21052 0))(
  ( (tuple2!21053 (_1!10537 (_ BitVec 64)) (_2!10537 V!48567)) )
))
(declare-datatypes ((List!28244 0))(
  ( (Nil!28241) (Cons!28240 (h!29449 tuple2!21052) (t!41755 List!28244)) )
))
(declare-datatypes ((ListLongMap!18925 0))(
  ( (ListLongMap!18926 (toList!9478 List!28244)) )
))
(declare-fun contains!7598 (ListLongMap!18925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4645 (array!82422 array!82424 (_ BitVec 32) (_ BitVec 32) V!48567 V!48567 (_ BitVec 32) Int) ListLongMap!18925)

(assert (=> b!1263044 (= e!719045 (not (contains!7598 (getCurrentListMap!4645 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1263045 () Bool)

(declare-fun e!719041 () Bool)

(declare-fun mapRes!50422 () Bool)

(assert (=> b!1263045 (= e!719044 (and e!719041 mapRes!50422))))

(declare-fun condMapEmpty!50422 () Bool)

(declare-fun mapDefault!50422 () ValueCell!15437)

