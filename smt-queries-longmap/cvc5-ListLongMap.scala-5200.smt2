; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70214 () Bool)

(assert start!70214)

(declare-fun b_free!12607 () Bool)

(declare-fun b_next!12607 () Bool)

(assert (=> start!70214 (= b_free!12607 (not b_next!12607))))

(declare-fun tp!44541 () Bool)

(declare-fun b_and!21395 () Bool)

(assert (=> start!70214 (= tp!44541 b_and!21395)))

(declare-fun b!815727 () Bool)

(declare-fun res!556992 () Bool)

(declare-fun e!452373 () Bool)

(assert (=> b!815727 (=> (not res!556992) (not e!452373))))

(declare-datatypes ((array!44834 0))(
  ( (array!44835 (arr!21475 (Array (_ BitVec 32) (_ BitVec 64))) (size!21896 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44834)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24091 0))(
  ( (V!24092 (val!7206 Int)) )
))
(declare-datatypes ((ValueCell!6743 0))(
  ( (ValueCellFull!6743 (v!9633 V!24091)) (EmptyCell!6743) )
))
(declare-datatypes ((array!44836 0))(
  ( (array!44837 (arr!21476 (Array (_ BitVec 32) ValueCell!6743)) (size!21897 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44836)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!815727 (= res!556992 (and (= (size!21897 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21896 _keys!976) (size!21897 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!815728 () Bool)

(declare-fun res!556994 () Bool)

(assert (=> b!815728 (=> (not res!556994) (not e!452373))))

(declare-datatypes ((List!15285 0))(
  ( (Nil!15282) (Cons!15281 (h!16410 (_ BitVec 64)) (t!21606 List!15285)) )
))
(declare-fun arrayNoDuplicates!0 (array!44834 (_ BitVec 32) List!15285) Bool)

(assert (=> b!815728 (= res!556994 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15282))))

(declare-fun b!815729 () Bool)

(declare-fun e!452374 () Bool)

(declare-fun tp_is_empty!14317 () Bool)

(assert (=> b!815729 (= e!452374 tp_is_empty!14317)))

(declare-fun mapNonEmpty!23062 () Bool)

(declare-fun mapRes!23062 () Bool)

(declare-fun tp!44542 () Bool)

(assert (=> mapNonEmpty!23062 (= mapRes!23062 (and tp!44542 e!452374))))

(declare-fun mapValue!23062 () ValueCell!6743)

(declare-fun mapRest!23062 () (Array (_ BitVec 32) ValueCell!6743))

(declare-fun mapKey!23062 () (_ BitVec 32))

(assert (=> mapNonEmpty!23062 (= (arr!21476 _values!788) (store mapRest!23062 mapKey!23062 mapValue!23062))))

(declare-fun b!815730 () Bool)

(declare-fun e!452375 () Bool)

(assert (=> b!815730 (= e!452373 (not e!452375))))

(declare-fun res!556990 () Bool)

(assert (=> b!815730 (=> res!556990 e!452375)))

(assert (=> b!815730 (= res!556990 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9454 0))(
  ( (tuple2!9455 (_1!4738 (_ BitVec 64)) (_2!4738 V!24091)) )
))
(declare-datatypes ((List!15286 0))(
  ( (Nil!15283) (Cons!15282 (h!16411 tuple2!9454) (t!21607 List!15286)) )
))
(declare-datatypes ((ListLongMap!8277 0))(
  ( (ListLongMap!8278 (toList!4154 List!15286)) )
))
(declare-fun lt!365223 () ListLongMap!8277)

(declare-fun lt!365225 () ListLongMap!8277)

(assert (=> b!815730 (= lt!365223 lt!365225)))

(declare-fun zeroValueBefore!34 () V!24091)

(declare-fun zeroValueAfter!34 () V!24091)

(declare-fun minValue!754 () V!24091)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27802 0))(
  ( (Unit!27803) )
))
(declare-fun lt!365221 () Unit!27802)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!312 (array!44834 array!44836 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24091 V!24091 V!24091 V!24091 (_ BitVec 32) Int) Unit!27802)

(assert (=> b!815730 (= lt!365221 (lemmaNoChangeToArrayThenSameMapNoExtras!312 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2202 (array!44834 array!44836 (_ BitVec 32) (_ BitVec 32) V!24091 V!24091 (_ BitVec 32) Int) ListLongMap!8277)

(assert (=> b!815730 (= lt!365225 (getCurrentListMapNoExtraKeys!2202 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!815730 (= lt!365223 (getCurrentListMapNoExtraKeys!2202 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!556991 () Bool)

(assert (=> start!70214 (=> (not res!556991) (not e!452373))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70214 (= res!556991 (validMask!0 mask!1312))))

(assert (=> start!70214 e!452373))

(assert (=> start!70214 tp_is_empty!14317))

(declare-fun array_inv!17185 (array!44834) Bool)

(assert (=> start!70214 (array_inv!17185 _keys!976)))

(assert (=> start!70214 true))

(declare-fun e!452377 () Bool)

(declare-fun array_inv!17186 (array!44836) Bool)

(assert (=> start!70214 (and (array_inv!17186 _values!788) e!452377)))

(assert (=> start!70214 tp!44541))

(declare-fun mapIsEmpty!23062 () Bool)

(assert (=> mapIsEmpty!23062 mapRes!23062))

(declare-fun b!815731 () Bool)

(declare-fun e!452376 () Bool)

(assert (=> b!815731 (= e!452376 tp_is_empty!14317)))

(declare-fun b!815732 () Bool)

(assert (=> b!815732 (= e!452377 (and e!452376 mapRes!23062))))

(declare-fun condMapEmpty!23062 () Bool)

(declare-fun mapDefault!23062 () ValueCell!6743)

