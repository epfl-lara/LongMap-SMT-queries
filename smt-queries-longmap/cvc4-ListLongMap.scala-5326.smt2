; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71220 () Bool)

(assert start!71220)

(declare-fun b_free!13367 () Bool)

(declare-fun b_next!13367 () Bool)

(assert (=> start!71220 (= b_free!13367 (not b_next!13367))))

(declare-fun tp!46864 () Bool)

(declare-fun b_and!22305 () Bool)

(assert (=> start!71220 (= tp!46864 b_and!22305)))

(declare-fun mapIsEmpty!24244 () Bool)

(declare-fun mapRes!24244 () Bool)

(assert (=> mapIsEmpty!24244 mapRes!24244))

(declare-fun b!827302 () Bool)

(declare-fun res!563900 () Bool)

(declare-fun e!460840 () Bool)

(assert (=> b!827302 (=> (not res!563900) (not e!460840))))

(declare-datatypes ((array!46332 0))(
  ( (array!46333 (arr!22210 (Array (_ BitVec 32) (_ BitVec 64))) (size!22631 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46332)

(declare-datatypes ((List!15854 0))(
  ( (Nil!15851) (Cons!15850 (h!16979 (_ BitVec 64)) (t!22203 List!15854)) )
))
(declare-fun arrayNoDuplicates!0 (array!46332 (_ BitVec 32) List!15854) Bool)

(assert (=> b!827302 (= res!563900 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15851))))

(declare-fun b!827303 () Bool)

(assert (=> b!827303 (= e!460840 false)))

(declare-datatypes ((V!25103 0))(
  ( (V!25104 (val!7586 Int)) )
))
(declare-fun minValue!754 () V!25103)

(declare-datatypes ((ValueCell!7123 0))(
  ( (ValueCellFull!7123 (v!10021 V!25103)) (EmptyCell!7123) )
))
(declare-datatypes ((array!46334 0))(
  ( (array!46335 (arr!22211 (Array (_ BitVec 32) ValueCell!7123)) (size!22632 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46334)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!25103)

(declare-datatypes ((tuple2!10058 0))(
  ( (tuple2!10059 (_1!5040 (_ BitVec 64)) (_2!5040 V!25103)) )
))
(declare-datatypes ((List!15855 0))(
  ( (Nil!15852) (Cons!15851 (h!16980 tuple2!10058) (t!22204 List!15855)) )
))
(declare-datatypes ((ListLongMap!8881 0))(
  ( (ListLongMap!8882 (toList!4456 List!15855)) )
))
(declare-fun lt!374867 () ListLongMap!8881)

(declare-fun getCurrentListMapNoExtraKeys!2458 (array!46332 array!46334 (_ BitVec 32) (_ BitVec 32) V!25103 V!25103 (_ BitVec 32) Int) ListLongMap!8881)

(assert (=> b!827303 (= lt!374867 (getCurrentListMapNoExtraKeys!2458 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25103)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!374866 () ListLongMap!8881)

(assert (=> b!827303 (= lt!374866 (getCurrentListMapNoExtraKeys!2458 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827304 () Bool)

(declare-fun e!460841 () Bool)

(declare-fun e!460843 () Bool)

(assert (=> b!827304 (= e!460841 (and e!460843 mapRes!24244))))

(declare-fun condMapEmpty!24244 () Bool)

(declare-fun mapDefault!24244 () ValueCell!7123)

