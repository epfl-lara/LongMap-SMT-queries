; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71204 () Bool)

(assert start!71204)

(declare-fun b_free!13351 () Bool)

(declare-fun b_next!13351 () Bool)

(assert (=> start!71204 (= b_free!13351 (not b_next!13351))))

(declare-fun tp!46816 () Bool)

(declare-fun b_and!22289 () Bool)

(assert (=> start!71204 (= tp!46816 b_and!22289)))

(declare-fun b!827134 () Bool)

(declare-fun res!563802 () Bool)

(declare-fun e!460721 () Bool)

(assert (=> b!827134 (=> (not res!563802) (not e!460721))))

(declare-datatypes ((array!46300 0))(
  ( (array!46301 (arr!22194 (Array (_ BitVec 32) (_ BitVec 64))) (size!22615 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46300)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46300 (_ BitVec 32)) Bool)

(assert (=> b!827134 (= res!563802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827135 () Bool)

(declare-fun res!563801 () Bool)

(assert (=> b!827135 (=> (not res!563801) (not e!460721))))

(declare-datatypes ((List!15842 0))(
  ( (Nil!15839) (Cons!15838 (h!16967 (_ BitVec 64)) (t!22191 List!15842)) )
))
(declare-fun arrayNoDuplicates!0 (array!46300 (_ BitVec 32) List!15842) Bool)

(assert (=> b!827135 (= res!563801 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15839))))

(declare-fun b!827136 () Bool)

(declare-fun e!460722 () Bool)

(declare-fun tp_is_empty!15061 () Bool)

(assert (=> b!827136 (= e!460722 tp_is_empty!15061)))

(declare-fun b!827137 () Bool)

(assert (=> b!827137 (= e!460721 (not true))))

(declare-datatypes ((V!25083 0))(
  ( (V!25084 (val!7578 Int)) )
))
(declare-datatypes ((tuple2!10046 0))(
  ( (tuple2!10047 (_1!5034 (_ BitVec 64)) (_2!5034 V!25083)) )
))
(declare-datatypes ((List!15843 0))(
  ( (Nil!15840) (Cons!15839 (h!16968 tuple2!10046) (t!22192 List!15843)) )
))
(declare-datatypes ((ListLongMap!8869 0))(
  ( (ListLongMap!8870 (toList!4450 List!15843)) )
))
(declare-fun lt!374812 () ListLongMap!8869)

(declare-fun lt!374811 () ListLongMap!8869)

(assert (=> b!827137 (= lt!374812 lt!374811)))

(declare-fun zeroValueBefore!34 () V!25083)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!25083)

(declare-fun minValue!754 () V!25083)

(declare-datatypes ((ValueCell!7115 0))(
  ( (ValueCellFull!7115 (v!10013 V!25083)) (EmptyCell!7115) )
))
(declare-datatypes ((array!46302 0))(
  ( (array!46303 (arr!22195 (Array (_ BitVec 32) ValueCell!7115)) (size!22616 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46302)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28359 0))(
  ( (Unit!28360) )
))
(declare-fun lt!374813 () Unit!28359)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!562 (array!46300 array!46302 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25083 V!25083 V!25083 V!25083 (_ BitVec 32) Int) Unit!28359)

(assert (=> b!827137 (= lt!374813 (lemmaNoChangeToArrayThenSameMapNoExtras!562 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2452 (array!46300 array!46302 (_ BitVec 32) (_ BitVec 32) V!25083 V!25083 (_ BitVec 32) Int) ListLongMap!8869)

(assert (=> b!827137 (= lt!374811 (getCurrentListMapNoExtraKeys!2452 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827137 (= lt!374812 (getCurrentListMapNoExtraKeys!2452 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!563803 () Bool)

(assert (=> start!71204 (=> (not res!563803) (not e!460721))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71204 (= res!563803 (validMask!0 mask!1312))))

(assert (=> start!71204 e!460721))

(assert (=> start!71204 tp_is_empty!15061))

(declare-fun array_inv!17689 (array!46300) Bool)

(assert (=> start!71204 (array_inv!17689 _keys!976)))

(assert (=> start!71204 true))

(declare-fun e!460724 () Bool)

(declare-fun array_inv!17690 (array!46302) Bool)

(assert (=> start!71204 (and (array_inv!17690 _values!788) e!460724)))

(assert (=> start!71204 tp!46816))

(declare-fun b!827138 () Bool)

(declare-fun mapRes!24220 () Bool)

(assert (=> b!827138 (= e!460724 (and e!460722 mapRes!24220))))

(declare-fun condMapEmpty!24220 () Bool)

(declare-fun mapDefault!24220 () ValueCell!7115)

