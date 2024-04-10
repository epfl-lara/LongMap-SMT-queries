; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71214 () Bool)

(assert start!71214)

(declare-fun b_free!13361 () Bool)

(declare-fun b_next!13361 () Bool)

(assert (=> start!71214 (= b_free!13361 (not b_next!13361))))

(declare-fun tp!46846 () Bool)

(declare-fun b_and!22299 () Bool)

(assert (=> start!71214 (= tp!46846 b_and!22299)))

(declare-fun b!827239 () Bool)

(declare-fun e!460795 () Bool)

(declare-fun tp_is_empty!15071 () Bool)

(assert (=> b!827239 (= e!460795 tp_is_empty!15071)))

(declare-fun mapIsEmpty!24235 () Bool)

(declare-fun mapRes!24235 () Bool)

(assert (=> mapIsEmpty!24235 mapRes!24235))

(declare-fun b!827240 () Bool)

(declare-fun e!460798 () Bool)

(assert (=> b!827240 (= e!460798 tp_is_empty!15071)))

(declare-fun mapNonEmpty!24235 () Bool)

(declare-fun tp!46845 () Bool)

(assert (=> mapNonEmpty!24235 (= mapRes!24235 (and tp!46845 e!460798))))

(declare-fun mapKey!24235 () (_ BitVec 32))

(declare-datatypes ((V!25095 0))(
  ( (V!25096 (val!7583 Int)) )
))
(declare-datatypes ((ValueCell!7120 0))(
  ( (ValueCellFull!7120 (v!10018 V!25095)) (EmptyCell!7120) )
))
(declare-fun mapValue!24235 () ValueCell!7120)

(declare-datatypes ((array!46320 0))(
  ( (array!46321 (arr!22204 (Array (_ BitVec 32) ValueCell!7120)) (size!22625 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46320)

(declare-fun mapRest!24235 () (Array (_ BitVec 32) ValueCell!7120))

(assert (=> mapNonEmpty!24235 (= (arr!22204 _values!788) (store mapRest!24235 mapKey!24235 mapValue!24235))))

(declare-fun b!827241 () Bool)

(declare-fun res!563863 () Bool)

(declare-fun e!460797 () Bool)

(assert (=> b!827241 (=> (not res!563863) (not e!460797))))

(declare-datatypes ((array!46322 0))(
  ( (array!46323 (arr!22205 (Array (_ BitVec 32) (_ BitVec 64))) (size!22626 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46322)

(declare-datatypes ((List!15848 0))(
  ( (Nil!15845) (Cons!15844 (h!16973 (_ BitVec 64)) (t!22197 List!15848)) )
))
(declare-fun arrayNoDuplicates!0 (array!46322 (_ BitVec 32) List!15848) Bool)

(assert (=> b!827241 (= res!563863 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15845))))

(declare-fun b!827242 () Bool)

(declare-fun res!563864 () Bool)

(assert (=> b!827242 (=> (not res!563864) (not e!460797))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46322 (_ BitVec 32)) Bool)

(assert (=> b!827242 (= res!563864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827243 () Bool)

(assert (=> b!827243 (= e!460797 false)))

(declare-fun minValue!754 () V!25095)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueAfter!34 () V!25095)

(declare-datatypes ((tuple2!10052 0))(
  ( (tuple2!10053 (_1!5037 (_ BitVec 64)) (_2!5037 V!25095)) )
))
(declare-datatypes ((List!15849 0))(
  ( (Nil!15846) (Cons!15845 (h!16974 tuple2!10052) (t!22198 List!15849)) )
))
(declare-datatypes ((ListLongMap!8875 0))(
  ( (ListLongMap!8876 (toList!4453 List!15849)) )
))
(declare-fun lt!374848 () ListLongMap!8875)

(declare-fun getCurrentListMapNoExtraKeys!2455 (array!46322 array!46320 (_ BitVec 32) (_ BitVec 32) V!25095 V!25095 (_ BitVec 32) Int) ListLongMap!8875)

(assert (=> b!827243 (= lt!374848 (getCurrentListMapNoExtraKeys!2455 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25095)

(declare-fun lt!374849 () ListLongMap!8875)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827243 (= lt!374849 (getCurrentListMapNoExtraKeys!2455 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827244 () Bool)

(declare-fun res!563861 () Bool)

(assert (=> b!827244 (=> (not res!563861) (not e!460797))))

(assert (=> b!827244 (= res!563861 (and (= (size!22625 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22626 _keys!976) (size!22625 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!563862 () Bool)

(assert (=> start!71214 (=> (not res!563862) (not e!460797))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71214 (= res!563862 (validMask!0 mask!1312))))

(assert (=> start!71214 e!460797))

(assert (=> start!71214 tp_is_empty!15071))

(declare-fun array_inv!17697 (array!46322) Bool)

(assert (=> start!71214 (array_inv!17697 _keys!976)))

(assert (=> start!71214 true))

(declare-fun e!460799 () Bool)

(declare-fun array_inv!17698 (array!46320) Bool)

(assert (=> start!71214 (and (array_inv!17698 _values!788) e!460799)))

(assert (=> start!71214 tp!46846))

(declare-fun b!827245 () Bool)

(assert (=> b!827245 (= e!460799 (and e!460795 mapRes!24235))))

(declare-fun condMapEmpty!24235 () Bool)

(declare-fun mapDefault!24235 () ValueCell!7120)

