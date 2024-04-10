; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70438 () Bool)

(assert start!70438)

(declare-fun b_free!12781 () Bool)

(declare-fun b_next!12781 () Bool)

(assert (=> start!70438 (= b_free!12781 (not b_next!12781))))

(declare-fun tp!45072 () Bool)

(declare-fun b_and!21601 () Bool)

(assert (=> start!70438 (= tp!45072 b_and!21601)))

(declare-fun b!818187 () Bool)

(declare-fun e!454138 () Bool)

(assert (=> b!818187 (= e!454138 true)))

(declare-datatypes ((array!45182 0))(
  ( (array!45183 (arr!21646 (Array (_ BitVec 32) (_ BitVec 64))) (size!22067 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45182)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24323 0))(
  ( (V!24324 (val!7293 Int)) )
))
(declare-fun minValue!754 () V!24323)

(declare-datatypes ((ValueCell!6830 0))(
  ( (ValueCellFull!6830 (v!9722 V!24323)) (EmptyCell!6830) )
))
(declare-datatypes ((array!45184 0))(
  ( (array!45185 (arr!21647 (Array (_ BitVec 32) ValueCell!6830)) (size!22068 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45184)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9584 0))(
  ( (tuple2!9585 (_1!4803 (_ BitVec 64)) (_2!4803 V!24323)) )
))
(declare-datatypes ((List!15415 0))(
  ( (Nil!15412) (Cons!15411 (h!16540 tuple2!9584) (t!21742 List!15415)) )
))
(declare-datatypes ((ListLongMap!8407 0))(
  ( (ListLongMap!8408 (toList!4219 List!15415)) )
))
(declare-fun lt!366604 () ListLongMap!8407)

(declare-fun defaultEntry!796 () Int)

(declare-fun zeroValueBefore!34 () V!24323)

(declare-fun getCurrentListMap!2425 (array!45182 array!45184 (_ BitVec 32) (_ BitVec 32) V!24323 V!24323 (_ BitVec 32) Int) ListLongMap!8407)

(assert (=> b!818187 (= lt!366604 (getCurrentListMap!2425 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!23332 () Bool)

(declare-fun mapRes!23332 () Bool)

(declare-fun tp!45073 () Bool)

(declare-fun e!454136 () Bool)

(assert (=> mapNonEmpty!23332 (= mapRes!23332 (and tp!45073 e!454136))))

(declare-fun mapRest!23332 () (Array (_ BitVec 32) ValueCell!6830))

(declare-fun mapValue!23332 () ValueCell!6830)

(declare-fun mapKey!23332 () (_ BitVec 32))

(assert (=> mapNonEmpty!23332 (= (arr!21647 _values!788) (store mapRest!23332 mapKey!23332 mapValue!23332))))

(declare-fun b!818188 () Bool)

(declare-fun tp_is_empty!14491 () Bool)

(assert (=> b!818188 (= e!454136 tp_is_empty!14491)))

(declare-fun b!818189 () Bool)

(declare-fun res!558413 () Bool)

(declare-fun e!454133 () Bool)

(assert (=> b!818189 (=> (not res!558413) (not e!454133))))

(declare-datatypes ((List!15416 0))(
  ( (Nil!15413) (Cons!15412 (h!16541 (_ BitVec 64)) (t!21743 List!15416)) )
))
(declare-fun arrayNoDuplicates!0 (array!45182 (_ BitVec 32) List!15416) Bool)

(assert (=> b!818189 (= res!558413 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15413))))

(declare-fun b!818190 () Bool)

(declare-fun res!558411 () Bool)

(assert (=> b!818190 (=> (not res!558411) (not e!454133))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!818190 (= res!558411 (and (= (size!22068 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22067 _keys!976) (size!22068 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23332 () Bool)

(assert (=> mapIsEmpty!23332 mapRes!23332))

(declare-fun b!818191 () Bool)

(declare-fun e!454135 () Bool)

(assert (=> b!818191 (= e!454135 tp_is_empty!14491)))

(declare-fun b!818192 () Bool)

(assert (=> b!818192 (= e!454133 (not e!454138))))

(declare-fun res!558410 () Bool)

(assert (=> b!818192 (=> res!558410 e!454138)))

(assert (=> b!818192 (= res!558410 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!366603 () ListLongMap!8407)

(declare-fun lt!366602 () ListLongMap!8407)

(assert (=> b!818192 (= lt!366603 lt!366602)))

(declare-fun zeroValueAfter!34 () V!24323)

(declare-datatypes ((Unit!27922 0))(
  ( (Unit!27923) )
))
(declare-fun lt!366601 () Unit!27922)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!370 (array!45182 array!45184 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24323 V!24323 V!24323 V!24323 (_ BitVec 32) Int) Unit!27922)

(assert (=> b!818192 (= lt!366601 (lemmaNoChangeToArrayThenSameMapNoExtras!370 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2260 (array!45182 array!45184 (_ BitVec 32) (_ BitVec 32) V!24323 V!24323 (_ BitVec 32) Int) ListLongMap!8407)

(assert (=> b!818192 (= lt!366602 (getCurrentListMapNoExtraKeys!2260 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818192 (= lt!366603 (getCurrentListMapNoExtraKeys!2260 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!558409 () Bool)

(assert (=> start!70438 (=> (not res!558409) (not e!454133))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70438 (= res!558409 (validMask!0 mask!1312))))

(assert (=> start!70438 e!454133))

(assert (=> start!70438 tp_is_empty!14491))

(declare-fun array_inv!17311 (array!45182) Bool)

(assert (=> start!70438 (array_inv!17311 _keys!976)))

(assert (=> start!70438 true))

(declare-fun e!454137 () Bool)

(declare-fun array_inv!17312 (array!45184) Bool)

(assert (=> start!70438 (and (array_inv!17312 _values!788) e!454137)))

(assert (=> start!70438 tp!45072))

(declare-fun b!818193 () Bool)

(assert (=> b!818193 (= e!454137 (and e!454135 mapRes!23332))))

(declare-fun condMapEmpty!23332 () Bool)

(declare-fun mapDefault!23332 () ValueCell!6830)

