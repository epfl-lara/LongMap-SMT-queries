; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70700 () Bool)

(assert start!70700)

(declare-fun b_free!12973 () Bool)

(declare-fun b_next!12973 () Bool)

(assert (=> start!70700 (= b_free!12973 (not b_next!12973))))

(declare-fun tp!45661 () Bool)

(declare-fun b_and!21835 () Bool)

(assert (=> start!70700 (= tp!45661 b_and!21835)))

(declare-fun mapNonEmpty!23632 () Bool)

(declare-fun mapRes!23632 () Bool)

(declare-fun tp!45660 () Bool)

(declare-fun e!456341 () Bool)

(assert (=> mapNonEmpty!23632 (= mapRes!23632 (and tp!45660 e!456341))))

(declare-datatypes ((V!24579 0))(
  ( (V!24580 (val!7389 Int)) )
))
(declare-datatypes ((ValueCell!6926 0))(
  ( (ValueCellFull!6926 (v!9820 V!24579)) (EmptyCell!6926) )
))
(declare-fun mapValue!23632 () ValueCell!6926)

(declare-datatypes ((array!45562 0))(
  ( (array!45563 (arr!21832 (Array (_ BitVec 32) ValueCell!6926)) (size!22253 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45562)

(declare-fun mapKey!23632 () (_ BitVec 32))

(declare-fun mapRest!23632 () (Array (_ BitVec 32) ValueCell!6926))

(assert (=> mapNonEmpty!23632 (= (arr!21832 _values!788) (store mapRest!23632 mapKey!23632 mapValue!23632))))

(declare-fun b!821193 () Bool)

(declare-fun e!456342 () Bool)

(declare-fun tp_is_empty!14683 () Bool)

(assert (=> b!821193 (= e!456342 tp_is_empty!14683)))

(declare-fun b!821194 () Bool)

(declare-fun e!456343 () Bool)

(assert (=> b!821194 (= e!456343 true)))

(declare-fun zeroValueBefore!34 () V!24579)

(declare-datatypes ((array!45564 0))(
  ( (array!45565 (arr!21833 (Array (_ BitVec 32) (_ BitVec 64))) (size!22254 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45564)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun minValue!754 () V!24579)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-datatypes ((tuple2!9744 0))(
  ( (tuple2!9745 (_1!4883 (_ BitVec 64)) (_2!4883 V!24579)) )
))
(declare-datatypes ((List!15563 0))(
  ( (Nil!15560) (Cons!15559 (h!16688 tuple2!9744) (t!21898 List!15563)) )
))
(declare-datatypes ((ListLongMap!8567 0))(
  ( (ListLongMap!8568 (toList!4299 List!15563)) )
))
(declare-fun lt!369101 () ListLongMap!8567)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2471 (array!45564 array!45562 (_ BitVec 32) (_ BitVec 32) V!24579 V!24579 (_ BitVec 32) Int) ListLongMap!8567)

(assert (=> b!821194 (= lt!369101 (getCurrentListMap!2471 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23632 () Bool)

(assert (=> mapIsEmpty!23632 mapRes!23632))

(declare-fun res!560203 () Bool)

(declare-fun e!456344 () Bool)

(assert (=> start!70700 (=> (not res!560203) (not e!456344))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70700 (= res!560203 (validMask!0 mask!1312))))

(assert (=> start!70700 e!456344))

(assert (=> start!70700 tp_is_empty!14683))

(declare-fun array_inv!17451 (array!45564) Bool)

(assert (=> start!70700 (array_inv!17451 _keys!976)))

(assert (=> start!70700 true))

(declare-fun e!456339 () Bool)

(declare-fun array_inv!17452 (array!45562) Bool)

(assert (=> start!70700 (and (array_inv!17452 _values!788) e!456339)))

(assert (=> start!70700 tp!45661))

(declare-fun b!821195 () Bool)

(declare-fun res!560206 () Bool)

(assert (=> b!821195 (=> (not res!560206) (not e!456344))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821195 (= res!560206 (and (= (size!22253 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22254 _keys!976) (size!22253 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!821196 () Bool)

(assert (=> b!821196 (= e!456344 (not e!456343))))

(declare-fun res!560205 () Bool)

(assert (=> b!821196 (=> res!560205 e!456343)))

(assert (=> b!821196 (= res!560205 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369100 () ListLongMap!8567)

(declare-fun lt!369099 () ListLongMap!8567)

(assert (=> b!821196 (= lt!369100 lt!369099)))

(declare-fun zeroValueAfter!34 () V!24579)

(declare-datatypes ((Unit!28075 0))(
  ( (Unit!28076) )
))
(declare-fun lt!369098 () Unit!28075)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!435 (array!45564 array!45562 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24579 V!24579 V!24579 V!24579 (_ BitVec 32) Int) Unit!28075)

(assert (=> b!821196 (= lt!369098 (lemmaNoChangeToArrayThenSameMapNoExtras!435 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2325 (array!45564 array!45562 (_ BitVec 32) (_ BitVec 32) V!24579 V!24579 (_ BitVec 32) Int) ListLongMap!8567)

(assert (=> b!821196 (= lt!369099 (getCurrentListMapNoExtraKeys!2325 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821196 (= lt!369100 (getCurrentListMapNoExtraKeys!2325 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821197 () Bool)

(declare-fun res!560207 () Bool)

(assert (=> b!821197 (=> (not res!560207) (not e!456344))))

(declare-datatypes ((List!15564 0))(
  ( (Nil!15561) (Cons!15560 (h!16689 (_ BitVec 64)) (t!21899 List!15564)) )
))
(declare-fun arrayNoDuplicates!0 (array!45564 (_ BitVec 32) List!15564) Bool)

(assert (=> b!821197 (= res!560207 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15561))))

(declare-fun b!821198 () Bool)

(declare-fun res!560204 () Bool)

(assert (=> b!821198 (=> (not res!560204) (not e!456344))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45564 (_ BitVec 32)) Bool)

(assert (=> b!821198 (= res!560204 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821199 () Bool)

(assert (=> b!821199 (= e!456339 (and e!456342 mapRes!23632))))

(declare-fun condMapEmpty!23632 () Bool)

(declare-fun mapDefault!23632 () ValueCell!6926)

