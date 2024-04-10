; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70082 () Bool)

(assert start!70082)

(declare-fun b_free!12503 () Bool)

(declare-fun b_next!12503 () Bool)

(assert (=> start!70082 (= b_free!12503 (not b_next!12503))))

(declare-fun tp!44224 () Bool)

(declare-fun b_and!21275 () Bool)

(assert (=> start!70082 (= tp!44224 b_and!21275)))

(declare-fun b!814436 () Bool)

(declare-fun res!556277 () Bool)

(declare-fun e!451454 () Bool)

(assert (=> b!814436 (=> (not res!556277) (not e!451454))))

(declare-datatypes ((array!44628 0))(
  ( (array!44629 (arr!21374 (Array (_ BitVec 32) (_ BitVec 64))) (size!21795 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44628)

(declare-datatypes ((List!15209 0))(
  ( (Nil!15206) (Cons!15205 (h!16334 (_ BitVec 64)) (t!21526 List!15209)) )
))
(declare-fun arrayNoDuplicates!0 (array!44628 (_ BitVec 32) List!15209) Bool)

(assert (=> b!814436 (= res!556277 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15206))))

(declare-fun b!814437 () Bool)

(declare-fun res!556278 () Bool)

(assert (=> b!814437 (=> (not res!556278) (not e!451454))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23951 0))(
  ( (V!23952 (val!7154 Int)) )
))
(declare-datatypes ((ValueCell!6691 0))(
  ( (ValueCellFull!6691 (v!9581 V!23951)) (EmptyCell!6691) )
))
(declare-datatypes ((array!44630 0))(
  ( (array!44631 (arr!21375 (Array (_ BitVec 32) ValueCell!6691)) (size!21796 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44630)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!814437 (= res!556278 (and (= (size!21796 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21795 _keys!976) (size!21796 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814438 () Bool)

(declare-fun res!556275 () Bool)

(assert (=> b!814438 (=> (not res!556275) (not e!451454))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44628 (_ BitVec 32)) Bool)

(assert (=> b!814438 (= res!556275 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22900 () Bool)

(declare-fun mapRes!22900 () Bool)

(declare-fun tp!44223 () Bool)

(declare-fun e!451455 () Bool)

(assert (=> mapNonEmpty!22900 (= mapRes!22900 (and tp!44223 e!451455))))

(declare-fun mapValue!22900 () ValueCell!6691)

(declare-fun mapKey!22900 () (_ BitVec 32))

(declare-fun mapRest!22900 () (Array (_ BitVec 32) ValueCell!6691))

(assert (=> mapNonEmpty!22900 (= (arr!21375 _values!788) (store mapRest!22900 mapKey!22900 mapValue!22900))))

(declare-fun res!556276 () Bool)

(assert (=> start!70082 (=> (not res!556276) (not e!451454))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70082 (= res!556276 (validMask!0 mask!1312))))

(assert (=> start!70082 e!451454))

(declare-fun tp_is_empty!14213 () Bool)

(assert (=> start!70082 tp_is_empty!14213))

(declare-fun array_inv!17103 (array!44628) Bool)

(assert (=> start!70082 (array_inv!17103 _keys!976)))

(assert (=> start!70082 true))

(declare-fun e!451457 () Bool)

(declare-fun array_inv!17104 (array!44630) Bool)

(assert (=> start!70082 (and (array_inv!17104 _values!788) e!451457)))

(assert (=> start!70082 tp!44224))

(declare-fun b!814439 () Bool)

(assert (=> b!814439 (= e!451454 (not true))))

(declare-datatypes ((tuple2!9376 0))(
  ( (tuple2!9377 (_1!4699 (_ BitVec 64)) (_2!4699 V!23951)) )
))
(declare-datatypes ((List!15210 0))(
  ( (Nil!15207) (Cons!15206 (h!16335 tuple2!9376) (t!21527 List!15210)) )
))
(declare-datatypes ((ListLongMap!8199 0))(
  ( (ListLongMap!8200 (toList!4115 List!15210)) )
))
(declare-fun lt!364615 () ListLongMap!8199)

(declare-fun lt!364616 () ListLongMap!8199)

(assert (=> b!814439 (= lt!364615 lt!364616)))

(declare-fun zeroValueBefore!34 () V!23951)

(declare-fun zeroValueAfter!34 () V!23951)

(declare-fun minValue!754 () V!23951)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27728 0))(
  ( (Unit!27729) )
))
(declare-fun lt!364617 () Unit!27728)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!275 (array!44628 array!44630 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!23951 V!23951 V!23951 V!23951 (_ BitVec 32) Int) Unit!27728)

(assert (=> b!814439 (= lt!364617 (lemmaNoChangeToArrayThenSameMapNoExtras!275 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2165 (array!44628 array!44630 (_ BitVec 32) (_ BitVec 32) V!23951 V!23951 (_ BitVec 32) Int) ListLongMap!8199)

(assert (=> b!814439 (= lt!364616 (getCurrentListMapNoExtraKeys!2165 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814439 (= lt!364615 (getCurrentListMapNoExtraKeys!2165 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814440 () Bool)

(declare-fun e!451458 () Bool)

(assert (=> b!814440 (= e!451457 (and e!451458 mapRes!22900))))

(declare-fun condMapEmpty!22900 () Bool)

(declare-fun mapDefault!22900 () ValueCell!6691)

