; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70442 () Bool)

(assert start!70442)

(declare-fun b_free!12785 () Bool)

(declare-fun b_next!12785 () Bool)

(assert (=> start!70442 (= b_free!12785 (not b_next!12785))))

(declare-fun tp!45085 () Bool)

(declare-fun b_and!21605 () Bool)

(assert (=> start!70442 (= tp!45085 b_and!21605)))

(declare-fun b!818235 () Bool)

(declare-fun e!454171 () Bool)

(assert (=> b!818235 (= e!454171 true)))

(declare-datatypes ((V!24327 0))(
  ( (V!24328 (val!7295 Int)) )
))
(declare-fun zeroValueBefore!34 () V!24327)

(declare-datatypes ((array!45190 0))(
  ( (array!45191 (arr!21650 (Array (_ BitVec 32) (_ BitVec 64))) (size!22071 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45190)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24327)

(declare-datatypes ((ValueCell!6832 0))(
  ( (ValueCellFull!6832 (v!9724 V!24327)) (EmptyCell!6832) )
))
(declare-datatypes ((array!45192 0))(
  ( (array!45193 (arr!21651 (Array (_ BitVec 32) ValueCell!6832)) (size!22072 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45192)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9588 0))(
  ( (tuple2!9589 (_1!4805 (_ BitVec 64)) (_2!4805 V!24327)) )
))
(declare-datatypes ((List!15419 0))(
  ( (Nil!15416) (Cons!15415 (h!16544 tuple2!9588) (t!21746 List!15419)) )
))
(declare-datatypes ((ListLongMap!8411 0))(
  ( (ListLongMap!8412 (toList!4221 List!15419)) )
))
(declare-fun lt!366628 () ListLongMap!8411)

(declare-fun getCurrentListMap!2427 (array!45190 array!45192 (_ BitVec 32) (_ BitVec 32) V!24327 V!24327 (_ BitVec 32) Int) ListLongMap!8411)

(assert (=> b!818235 (= lt!366628 (getCurrentListMap!2427 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818236 () Bool)

(declare-fun res!558442 () Bool)

(declare-fun e!454169 () Bool)

(assert (=> b!818236 (=> (not res!558442) (not e!454169))))

(declare-datatypes ((List!15420 0))(
  ( (Nil!15417) (Cons!15416 (h!16545 (_ BitVec 64)) (t!21747 List!15420)) )
))
(declare-fun arrayNoDuplicates!0 (array!45190 (_ BitVec 32) List!15420) Bool)

(assert (=> b!818236 (= res!558442 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15417))))

(declare-fun res!558443 () Bool)

(assert (=> start!70442 (=> (not res!558443) (not e!454169))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70442 (= res!558443 (validMask!0 mask!1312))))

(assert (=> start!70442 e!454169))

(declare-fun tp_is_empty!14495 () Bool)

(assert (=> start!70442 tp_is_empty!14495))

(declare-fun array_inv!17315 (array!45190) Bool)

(assert (=> start!70442 (array_inv!17315 _keys!976)))

(assert (=> start!70442 true))

(declare-fun e!454174 () Bool)

(declare-fun array_inv!17316 (array!45192) Bool)

(assert (=> start!70442 (and (array_inv!17316 _values!788) e!454174)))

(assert (=> start!70442 tp!45085))

(declare-fun b!818237 () Bool)

(declare-fun e!454173 () Bool)

(assert (=> b!818237 (= e!454173 tp_is_empty!14495)))

(declare-fun b!818238 () Bool)

(declare-fun e!454172 () Bool)

(assert (=> b!818238 (= e!454172 tp_is_empty!14495)))

(declare-fun mapIsEmpty!23338 () Bool)

(declare-fun mapRes!23338 () Bool)

(assert (=> mapIsEmpty!23338 mapRes!23338))

(declare-fun b!818239 () Bool)

(declare-fun res!558440 () Bool)

(assert (=> b!818239 (=> (not res!558440) (not e!454169))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45190 (_ BitVec 32)) Bool)

(assert (=> b!818239 (= res!558440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818240 () Bool)

(assert (=> b!818240 (= e!454174 (and e!454172 mapRes!23338))))

(declare-fun condMapEmpty!23338 () Bool)

(declare-fun mapDefault!23338 () ValueCell!6832)

