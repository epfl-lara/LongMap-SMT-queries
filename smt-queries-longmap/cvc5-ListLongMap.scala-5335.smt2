; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71270 () Bool)

(assert start!71270)

(declare-fun b_free!13417 () Bool)

(declare-fun b_next!13417 () Bool)

(assert (=> start!71270 (= b_free!13417 (not b_next!13417))))

(declare-fun tp!47014 () Bool)

(declare-fun b_and!22355 () Bool)

(assert (=> start!71270 (= tp!47014 b_and!22355)))

(declare-fun b!827827 () Bool)

(declare-fun e!461217 () Bool)

(declare-fun tp_is_empty!15127 () Bool)

(assert (=> b!827827 (= e!461217 tp_is_empty!15127)))

(declare-fun b!827828 () Bool)

(declare-fun res!564199 () Bool)

(declare-fun e!461216 () Bool)

(assert (=> b!827828 (=> (not res!564199) (not e!461216))))

(declare-datatypes ((array!46418 0))(
  ( (array!46419 (arr!22253 (Array (_ BitVec 32) (_ BitVec 64))) (size!22674 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46418)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46418 (_ BitVec 32)) Bool)

(assert (=> b!827828 (= res!564199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!564200 () Bool)

(assert (=> start!71270 (=> (not res!564200) (not e!461216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71270 (= res!564200 (validMask!0 mask!1312))))

(assert (=> start!71270 e!461216))

(assert (=> start!71270 tp_is_empty!15127))

(declare-fun array_inv!17729 (array!46418) Bool)

(assert (=> start!71270 (array_inv!17729 _keys!976)))

(assert (=> start!71270 true))

(declare-datatypes ((V!25171 0))(
  ( (V!25172 (val!7611 Int)) )
))
(declare-datatypes ((ValueCell!7148 0))(
  ( (ValueCellFull!7148 (v!10046 V!25171)) (EmptyCell!7148) )
))
(declare-datatypes ((array!46420 0))(
  ( (array!46421 (arr!22254 (Array (_ BitVec 32) ValueCell!7148)) (size!22675 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46420)

(declare-fun e!461215 () Bool)

(declare-fun array_inv!17730 (array!46420) Bool)

(assert (=> start!71270 (and (array_inv!17730 _values!788) e!461215)))

(assert (=> start!71270 tp!47014))

(declare-fun mapIsEmpty!24319 () Bool)

(declare-fun mapRes!24319 () Bool)

(assert (=> mapIsEmpty!24319 mapRes!24319))

(declare-fun b!827829 () Bool)

(declare-fun res!564198 () Bool)

(assert (=> b!827829 (=> (not res!564198) (not e!461216))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827829 (= res!564198 (and (= (size!22675 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22674 _keys!976) (size!22675 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827830 () Bool)

(assert (=> b!827830 (= e!461216 (bvsgt #b00000000000000000000000000000000 (size!22674 _keys!976)))))

(declare-fun zeroValueAfter!34 () V!25171)

(declare-fun minValue!754 () V!25171)

(declare-datatypes ((tuple2!10090 0))(
  ( (tuple2!10091 (_1!5056 (_ BitVec 64)) (_2!5056 V!25171)) )
))
(declare-datatypes ((List!15882 0))(
  ( (Nil!15879) (Cons!15878 (h!17007 tuple2!10090) (t!22231 List!15882)) )
))
(declare-datatypes ((ListLongMap!8913 0))(
  ( (ListLongMap!8914 (toList!4472 List!15882)) )
))
(declare-fun lt!375017 () ListLongMap!8913)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2474 (array!46418 array!46420 (_ BitVec 32) (_ BitVec 32) V!25171 V!25171 (_ BitVec 32) Int) ListLongMap!8913)

(assert (=> b!827830 (= lt!375017 (getCurrentListMapNoExtraKeys!2474 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25171)

(declare-fun lt!375016 () ListLongMap!8913)

(assert (=> b!827830 (= lt!375016 (getCurrentListMapNoExtraKeys!2474 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24319 () Bool)

(declare-fun tp!47013 () Bool)

(assert (=> mapNonEmpty!24319 (= mapRes!24319 (and tp!47013 e!461217))))

(declare-fun mapValue!24319 () ValueCell!7148)

(declare-fun mapKey!24319 () (_ BitVec 32))

(declare-fun mapRest!24319 () (Array (_ BitVec 32) ValueCell!7148))

(assert (=> mapNonEmpty!24319 (= (arr!22254 _values!788) (store mapRest!24319 mapKey!24319 mapValue!24319))))

(declare-fun b!827831 () Bool)

(declare-fun res!564197 () Bool)

(assert (=> b!827831 (=> (not res!564197) (not e!461216))))

(declare-datatypes ((List!15883 0))(
  ( (Nil!15880) (Cons!15879 (h!17008 (_ BitVec 64)) (t!22232 List!15883)) )
))
(declare-fun arrayNoDuplicates!0 (array!46418 (_ BitVec 32) List!15883) Bool)

(assert (=> b!827831 (= res!564197 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15880))))

(declare-fun b!827832 () Bool)

(declare-fun e!461218 () Bool)

(assert (=> b!827832 (= e!461218 tp_is_empty!15127)))

(declare-fun b!827833 () Bool)

(assert (=> b!827833 (= e!461215 (and e!461218 mapRes!24319))))

(declare-fun condMapEmpty!24319 () Bool)

(declare-fun mapDefault!24319 () ValueCell!7148)

