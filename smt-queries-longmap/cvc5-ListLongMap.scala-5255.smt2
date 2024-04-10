; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70650 () Bool)

(assert start!70650)

(declare-fun b_free!12937 () Bool)

(declare-fun b_next!12937 () Bool)

(assert (=> start!70650 (= b_free!12937 (not b_next!12937))))

(declare-fun tp!45550 () Bool)

(declare-fun b_and!21791 () Bool)

(assert (=> start!70650 (= tp!45550 b_and!21791)))

(declare-fun mapIsEmpty!23575 () Bool)

(declare-fun mapRes!23575 () Bool)

(assert (=> mapIsEmpty!23575 mapRes!23575))

(declare-fun b!820719 () Bool)

(declare-fun e!456007 () Bool)

(declare-fun tp_is_empty!14647 () Bool)

(assert (=> b!820719 (= e!456007 tp_is_empty!14647)))

(declare-fun b!820720 () Bool)

(declare-fun e!456003 () Bool)

(assert (=> b!820720 (= e!456003 (not true))))

(declare-datatypes ((V!24531 0))(
  ( (V!24532 (val!7371 Int)) )
))
(declare-datatypes ((tuple2!9712 0))(
  ( (tuple2!9713 (_1!4867 (_ BitVec 64)) (_2!4867 V!24531)) )
))
(declare-datatypes ((List!15532 0))(
  ( (Nil!15529) (Cons!15528 (h!16657 tuple2!9712) (t!21865 List!15532)) )
))
(declare-datatypes ((ListLongMap!8535 0))(
  ( (ListLongMap!8536 (toList!4283 List!15532)) )
))
(declare-fun lt!368887 () ListLongMap!8535)

(declare-fun lt!368885 () ListLongMap!8535)

(assert (=> b!820720 (= lt!368887 lt!368885)))

(declare-fun zeroValueBefore!34 () V!24531)

(declare-datatypes ((array!45488 0))(
  ( (array!45489 (arr!21796 (Array (_ BitVec 32) (_ BitVec 64))) (size!22217 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45488)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24531)

(declare-fun minValue!754 () V!24531)

(declare-datatypes ((ValueCell!6908 0))(
  ( (ValueCellFull!6908 (v!9802 V!24531)) (EmptyCell!6908) )
))
(declare-datatypes ((array!45490 0))(
  ( (array!45491 (arr!21797 (Array (_ BitVec 32) ValueCell!6908)) (size!22218 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45490)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!28043 0))(
  ( (Unit!28044) )
))
(declare-fun lt!368886 () Unit!28043)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!419 (array!45488 array!45490 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24531 V!24531 V!24531 V!24531 (_ BitVec 32) Int) Unit!28043)

(assert (=> b!820720 (= lt!368886 (lemmaNoChangeToArrayThenSameMapNoExtras!419 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2309 (array!45488 array!45490 (_ BitVec 32) (_ BitVec 32) V!24531 V!24531 (_ BitVec 32) Int) ListLongMap!8535)

(assert (=> b!820720 (= lt!368885 (getCurrentListMapNoExtraKeys!2309 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820720 (= lt!368887 (getCurrentListMapNoExtraKeys!2309 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!559948 () Bool)

(assert (=> start!70650 (=> (not res!559948) (not e!456003))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70650 (= res!559948 (validMask!0 mask!1312))))

(assert (=> start!70650 e!456003))

(assert (=> start!70650 tp_is_empty!14647))

(declare-fun array_inv!17421 (array!45488) Bool)

(assert (=> start!70650 (array_inv!17421 _keys!976)))

(assert (=> start!70650 true))

(declare-fun e!456005 () Bool)

(declare-fun array_inv!17422 (array!45490) Bool)

(assert (=> start!70650 (and (array_inv!17422 _values!788) e!456005)))

(assert (=> start!70650 tp!45550))

(declare-fun b!820721 () Bool)

(declare-fun e!456006 () Bool)

(assert (=> b!820721 (= e!456006 tp_is_empty!14647)))

(declare-fun b!820722 () Bool)

(declare-fun res!559946 () Bool)

(assert (=> b!820722 (=> (not res!559946) (not e!456003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45488 (_ BitVec 32)) Bool)

(assert (=> b!820722 (= res!559946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820723 () Bool)

(declare-fun res!559947 () Bool)

(assert (=> b!820723 (=> (not res!559947) (not e!456003))))

(assert (=> b!820723 (= res!559947 (and (= (size!22218 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22217 _keys!976) (size!22218 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820724 () Bool)

(declare-fun res!559945 () Bool)

(assert (=> b!820724 (=> (not res!559945) (not e!456003))))

(declare-datatypes ((List!15533 0))(
  ( (Nil!15530) (Cons!15529 (h!16658 (_ BitVec 64)) (t!21866 List!15533)) )
))
(declare-fun arrayNoDuplicates!0 (array!45488 (_ BitVec 32) List!15533) Bool)

(assert (=> b!820724 (= res!559945 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15530))))

(declare-fun b!820725 () Bool)

(assert (=> b!820725 (= e!456005 (and e!456006 mapRes!23575))))

(declare-fun condMapEmpty!23575 () Bool)

(declare-fun mapDefault!23575 () ValueCell!6908)

