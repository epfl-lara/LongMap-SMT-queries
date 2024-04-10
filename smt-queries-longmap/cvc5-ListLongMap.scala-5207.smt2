; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70274 () Bool)

(assert start!70274)

(declare-fun b_free!12649 () Bool)

(declare-fun b_next!12649 () Bool)

(assert (=> start!70274 (= b_free!12649 (not b_next!12649))))

(declare-fun tp!44670 () Bool)

(declare-fun b_and!21449 () Bool)

(assert (=> start!70274 (= tp!44670 b_and!21449)))

(declare-fun b!816415 () Bool)

(declare-fun e!452864 () Bool)

(declare-fun tp_is_empty!14359 () Bool)

(assert (=> b!816415 (= e!452864 tp_is_empty!14359)))

(declare-fun res!557388 () Bool)

(declare-fun e!452866 () Bool)

(assert (=> start!70274 (=> (not res!557388) (not e!452866))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70274 (= res!557388 (validMask!0 mask!1312))))

(assert (=> start!70274 e!452866))

(assert (=> start!70274 tp_is_empty!14359))

(declare-datatypes ((array!44920 0))(
  ( (array!44921 (arr!21517 (Array (_ BitVec 32) (_ BitVec 64))) (size!21938 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44920)

(declare-fun array_inv!17217 (array!44920) Bool)

(assert (=> start!70274 (array_inv!17217 _keys!976)))

(assert (=> start!70274 true))

(declare-datatypes ((V!24147 0))(
  ( (V!24148 (val!7227 Int)) )
))
(declare-datatypes ((ValueCell!6764 0))(
  ( (ValueCellFull!6764 (v!9655 V!24147)) (EmptyCell!6764) )
))
(declare-datatypes ((array!44922 0))(
  ( (array!44923 (arr!21518 (Array (_ BitVec 32) ValueCell!6764)) (size!21939 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44922)

(declare-fun e!452865 () Bool)

(declare-fun array_inv!17218 (array!44922) Bool)

(assert (=> start!70274 (and (array_inv!17218 _values!788) e!452865)))

(assert (=> start!70274 tp!44670))

(declare-fun b!816416 () Bool)

(declare-fun res!557387 () Bool)

(assert (=> b!816416 (=> (not res!557387) (not e!452866))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!816416 (= res!557387 (and (= (size!21939 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21938 _keys!976) (size!21939 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!23128 () Bool)

(declare-fun mapRes!23128 () Bool)

(declare-fun tp!44671 () Bool)

(declare-fun e!452861 () Bool)

(assert (=> mapNonEmpty!23128 (= mapRes!23128 (and tp!44671 e!452861))))

(declare-fun mapKey!23128 () (_ BitVec 32))

(declare-fun mapValue!23128 () ValueCell!6764)

(declare-fun mapRest!23128 () (Array (_ BitVec 32) ValueCell!6764))

(assert (=> mapNonEmpty!23128 (= (arr!21518 _values!788) (store mapRest!23128 mapKey!23128 mapValue!23128))))

(declare-fun b!816417 () Bool)

(declare-fun res!557390 () Bool)

(assert (=> b!816417 (=> (not res!557390) (not e!452866))))

(declare-datatypes ((List!15323 0))(
  ( (Nil!15320) (Cons!15319 (h!16448 (_ BitVec 64)) (t!21646 List!15323)) )
))
(declare-fun arrayNoDuplicates!0 (array!44920 (_ BitVec 32) List!15323) Bool)

(assert (=> b!816417 (= res!557390 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15320))))

(declare-fun b!816418 () Bool)

(assert (=> b!816418 (= e!452861 tp_is_empty!14359)))

(declare-fun b!816419 () Bool)

(declare-fun e!452863 () Bool)

(assert (=> b!816419 (= e!452866 (not e!452863))))

(declare-fun res!557391 () Bool)

(assert (=> b!816419 (=> res!557391 e!452863)))

(assert (=> b!816419 (= res!557391 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9494 0))(
  ( (tuple2!9495 (_1!4758 (_ BitVec 64)) (_2!4758 V!24147)) )
))
(declare-datatypes ((List!15324 0))(
  ( (Nil!15321) (Cons!15320 (h!16449 tuple2!9494) (t!21647 List!15324)) )
))
(declare-datatypes ((ListLongMap!8317 0))(
  ( (ListLongMap!8318 (toList!4174 List!15324)) )
))
(declare-fun lt!365660 () ListLongMap!8317)

(declare-fun lt!365662 () ListLongMap!8317)

(assert (=> b!816419 (= lt!365660 lt!365662)))

(declare-fun zeroValueBefore!34 () V!24147)

(declare-fun zeroValueAfter!34 () V!24147)

(declare-fun minValue!754 () V!24147)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27836 0))(
  ( (Unit!27837) )
))
(declare-fun lt!365659 () Unit!27836)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!328 (array!44920 array!44922 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24147 V!24147 V!24147 V!24147 (_ BitVec 32) Int) Unit!27836)

(assert (=> b!816419 (= lt!365659 (lemmaNoChangeToArrayThenSameMapNoExtras!328 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2218 (array!44920 array!44922 (_ BitVec 32) (_ BitVec 32) V!24147 V!24147 (_ BitVec 32) Int) ListLongMap!8317)

(assert (=> b!816419 (= lt!365662 (getCurrentListMapNoExtraKeys!2218 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816419 (= lt!365660 (getCurrentListMapNoExtraKeys!2218 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816420 () Bool)

(assert (=> b!816420 (= e!452865 (and e!452864 mapRes!23128))))

(declare-fun condMapEmpty!23128 () Bool)

(declare-fun mapDefault!23128 () ValueCell!6764)

