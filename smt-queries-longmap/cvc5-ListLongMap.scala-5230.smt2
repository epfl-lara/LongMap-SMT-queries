; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70444 () Bool)

(assert start!70444)

(declare-fun b_free!12787 () Bool)

(declare-fun b_next!12787 () Bool)

(assert (=> start!70444 (= b_free!12787 (not b_next!12787))))

(declare-fun tp!45091 () Bool)

(declare-fun b_and!21607 () Bool)

(assert (=> start!70444 (= tp!45091 b_and!21607)))

(declare-fun mapIsEmpty!23341 () Bool)

(declare-fun mapRes!23341 () Bool)

(assert (=> mapIsEmpty!23341 mapRes!23341))

(declare-fun b!818259 () Bool)

(declare-fun e!454189 () Bool)

(declare-fun e!454188 () Bool)

(assert (=> b!818259 (= e!454189 (not e!454188))))

(declare-fun res!558455 () Bool)

(assert (=> b!818259 (=> res!558455 e!454188)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818259 (= res!558455 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24331 0))(
  ( (V!24332 (val!7296 Int)) )
))
(declare-datatypes ((tuple2!9590 0))(
  ( (tuple2!9591 (_1!4806 (_ BitVec 64)) (_2!4806 V!24331)) )
))
(declare-datatypes ((List!15421 0))(
  ( (Nil!15418) (Cons!15417 (h!16546 tuple2!9590) (t!21748 List!15421)) )
))
(declare-datatypes ((ListLongMap!8413 0))(
  ( (ListLongMap!8414 (toList!4222 List!15421)) )
))
(declare-fun lt!366638 () ListLongMap!8413)

(declare-fun lt!366640 () ListLongMap!8413)

(assert (=> b!818259 (= lt!366638 lt!366640)))

(declare-fun zeroValueBefore!34 () V!24331)

(declare-datatypes ((array!45194 0))(
  ( (array!45195 (arr!21652 (Array (_ BitVec 32) (_ BitVec 64))) (size!22073 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45194)

(declare-fun zeroValueAfter!34 () V!24331)

(declare-fun minValue!754 () V!24331)

(declare-datatypes ((ValueCell!6833 0))(
  ( (ValueCellFull!6833 (v!9725 V!24331)) (EmptyCell!6833) )
))
(declare-datatypes ((array!45196 0))(
  ( (array!45197 (arr!21653 (Array (_ BitVec 32) ValueCell!6833)) (size!22074 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45196)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27926 0))(
  ( (Unit!27927) )
))
(declare-fun lt!366637 () Unit!27926)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!372 (array!45194 array!45196 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24331 V!24331 V!24331 V!24331 (_ BitVec 32) Int) Unit!27926)

(assert (=> b!818259 (= lt!366637 (lemmaNoChangeToArrayThenSameMapNoExtras!372 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2262 (array!45194 array!45196 (_ BitVec 32) (_ BitVec 32) V!24331 V!24331 (_ BitVec 32) Int) ListLongMap!8413)

(assert (=> b!818259 (= lt!366640 (getCurrentListMapNoExtraKeys!2262 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818259 (= lt!366638 (getCurrentListMapNoExtraKeys!2262 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818260 () Bool)

(declare-fun res!558454 () Bool)

(assert (=> b!818260 (=> (not res!558454) (not e!454189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45194 (_ BitVec 32)) Bool)

(assert (=> b!818260 (= res!558454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23341 () Bool)

(declare-fun tp!45090 () Bool)

(declare-fun e!454190 () Bool)

(assert (=> mapNonEmpty!23341 (= mapRes!23341 (and tp!45090 e!454190))))

(declare-fun mapKey!23341 () (_ BitVec 32))

(declare-fun mapRest!23341 () (Array (_ BitVec 32) ValueCell!6833))

(declare-fun mapValue!23341 () ValueCell!6833)

(assert (=> mapNonEmpty!23341 (= (arr!21653 _values!788) (store mapRest!23341 mapKey!23341 mapValue!23341))))

(declare-fun b!818261 () Bool)

(declare-fun res!558456 () Bool)

(assert (=> b!818261 (=> (not res!558456) (not e!454189))))

(declare-datatypes ((List!15422 0))(
  ( (Nil!15419) (Cons!15418 (h!16547 (_ BitVec 64)) (t!21749 List!15422)) )
))
(declare-fun arrayNoDuplicates!0 (array!45194 (_ BitVec 32) List!15422) Bool)

(assert (=> b!818261 (= res!558456 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15419))))

(declare-fun b!818262 () Bool)

(declare-fun tp_is_empty!14497 () Bool)

(assert (=> b!818262 (= e!454190 tp_is_empty!14497)))

(declare-fun res!558458 () Bool)

(assert (=> start!70444 (=> (not res!558458) (not e!454189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70444 (= res!558458 (validMask!0 mask!1312))))

(assert (=> start!70444 e!454189))

(assert (=> start!70444 tp_is_empty!14497))

(declare-fun array_inv!17317 (array!45194) Bool)

(assert (=> start!70444 (array_inv!17317 _keys!976)))

(assert (=> start!70444 true))

(declare-fun e!454187 () Bool)

(declare-fun array_inv!17318 (array!45196) Bool)

(assert (=> start!70444 (and (array_inv!17318 _values!788) e!454187)))

(assert (=> start!70444 tp!45091))

(declare-fun b!818263 () Bool)

(assert (=> b!818263 (= e!454188 true)))

(declare-fun lt!366639 () ListLongMap!8413)

(declare-fun getCurrentListMap!2428 (array!45194 array!45196 (_ BitVec 32) (_ BitVec 32) V!24331 V!24331 (_ BitVec 32) Int) ListLongMap!8413)

(assert (=> b!818263 (= lt!366639 (getCurrentListMap!2428 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818264 () Bool)

(declare-fun e!454192 () Bool)

(assert (=> b!818264 (= e!454192 tp_is_empty!14497)))

(declare-fun b!818265 () Bool)

(declare-fun res!558457 () Bool)

(assert (=> b!818265 (=> (not res!558457) (not e!454189))))

(assert (=> b!818265 (= res!558457 (and (= (size!22074 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22073 _keys!976) (size!22074 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818266 () Bool)

(assert (=> b!818266 (= e!454187 (and e!454192 mapRes!23341))))

(declare-fun condMapEmpty!23341 () Bool)

(declare-fun mapDefault!23341 () ValueCell!6833)

