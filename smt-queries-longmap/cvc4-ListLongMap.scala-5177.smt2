; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70052 () Bool)

(assert start!70052)

(declare-fun b_free!12473 () Bool)

(declare-fun b_next!12473 () Bool)

(assert (=> start!70052 (= b_free!12473 (not b_next!12473))))

(declare-fun tp!44133 () Bool)

(declare-fun b_and!21245 () Bool)

(assert (=> start!70052 (= tp!44133 b_and!21245)))

(declare-fun mapNonEmpty!22855 () Bool)

(declare-fun mapRes!22855 () Bool)

(declare-fun tp!44134 () Bool)

(declare-fun e!451230 () Bool)

(assert (=> mapNonEmpty!22855 (= mapRes!22855 (and tp!44134 e!451230))))

(declare-datatypes ((V!23911 0))(
  ( (V!23912 (val!7139 Int)) )
))
(declare-datatypes ((ValueCell!6676 0))(
  ( (ValueCellFull!6676 (v!9566 V!23911)) (EmptyCell!6676) )
))
(declare-fun mapRest!22855 () (Array (_ BitVec 32) ValueCell!6676))

(declare-fun mapKey!22855 () (_ BitVec 32))

(declare-datatypes ((array!44572 0))(
  ( (array!44573 (arr!21346 (Array (_ BitVec 32) ValueCell!6676)) (size!21767 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44572)

(declare-fun mapValue!22855 () ValueCell!6676)

(assert (=> mapNonEmpty!22855 (= (arr!21346 _values!788) (store mapRest!22855 mapKey!22855 mapValue!22855))))

(declare-fun b!814121 () Bool)

(declare-fun e!451233 () Bool)

(assert (=> b!814121 (= e!451233 false)))

(declare-datatypes ((array!44574 0))(
  ( (array!44575 (arr!21347 (Array (_ BitVec 32) (_ BitVec 64))) (size!21768 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44574)

(declare-fun zeroValueAfter!34 () V!23911)

(declare-fun minValue!754 () V!23911)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9356 0))(
  ( (tuple2!9357 (_1!4689 (_ BitVec 64)) (_2!4689 V!23911)) )
))
(declare-datatypes ((List!15187 0))(
  ( (Nil!15184) (Cons!15183 (h!16312 tuple2!9356) (t!21504 List!15187)) )
))
(declare-datatypes ((ListLongMap!8179 0))(
  ( (ListLongMap!8180 (toList!4105 List!15187)) )
))
(declare-fun lt!364491 () ListLongMap!8179)

(declare-fun getCurrentListMapNoExtraKeys!2155 (array!44574 array!44572 (_ BitVec 32) (_ BitVec 32) V!23911 V!23911 (_ BitVec 32) Int) ListLongMap!8179)

(assert (=> b!814121 (= lt!364491 (getCurrentListMapNoExtraKeys!2155 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23911)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364490 () ListLongMap!8179)

(assert (=> b!814121 (= lt!364490 (getCurrentListMapNoExtraKeys!2155 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814122 () Bool)

(declare-fun tp_is_empty!14183 () Bool)

(assert (=> b!814122 (= e!451230 tp_is_empty!14183)))

(declare-fun res!556096 () Bool)

(assert (=> start!70052 (=> (not res!556096) (not e!451233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70052 (= res!556096 (validMask!0 mask!1312))))

(assert (=> start!70052 e!451233))

(assert (=> start!70052 tp_is_empty!14183))

(declare-fun array_inv!17085 (array!44574) Bool)

(assert (=> start!70052 (array_inv!17085 _keys!976)))

(assert (=> start!70052 true))

(declare-fun e!451229 () Bool)

(declare-fun array_inv!17086 (array!44572) Bool)

(assert (=> start!70052 (and (array_inv!17086 _values!788) e!451229)))

(assert (=> start!70052 tp!44133))

(declare-fun b!814123 () Bool)

(declare-fun e!451232 () Bool)

(assert (=> b!814123 (= e!451232 tp_is_empty!14183)))

(declare-fun b!814124 () Bool)

(declare-fun res!556098 () Bool)

(assert (=> b!814124 (=> (not res!556098) (not e!451233))))

(assert (=> b!814124 (= res!556098 (and (= (size!21767 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21768 _keys!976) (size!21767 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814125 () Bool)

(declare-fun res!556097 () Bool)

(assert (=> b!814125 (=> (not res!556097) (not e!451233))))

(declare-datatypes ((List!15188 0))(
  ( (Nil!15185) (Cons!15184 (h!16313 (_ BitVec 64)) (t!21505 List!15188)) )
))
(declare-fun arrayNoDuplicates!0 (array!44574 (_ BitVec 32) List!15188) Bool)

(assert (=> b!814125 (= res!556097 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15185))))

(declare-fun b!814126 () Bool)

(declare-fun res!556095 () Bool)

(assert (=> b!814126 (=> (not res!556095) (not e!451233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44574 (_ BitVec 32)) Bool)

(assert (=> b!814126 (= res!556095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814127 () Bool)

(assert (=> b!814127 (= e!451229 (and e!451232 mapRes!22855))))

(declare-fun condMapEmpty!22855 () Bool)

(declare-fun mapDefault!22855 () ValueCell!6676)

