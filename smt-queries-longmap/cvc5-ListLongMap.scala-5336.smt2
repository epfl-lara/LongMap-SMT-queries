; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!71288 () Bool)

(assert start!71288)

(declare-fun b_free!13423 () Bool)

(declare-fun b_next!13423 () Bool)

(assert (=> start!71288 (= b_free!13423 (not b_next!13423))))

(declare-fun tp!47035 () Bool)

(declare-fun b_and!22369 () Bool)

(assert (=> start!71288 (= tp!47035 b_and!22369)))

(declare-fun b!827977 () Bool)

(declare-fun e!461322 () Bool)

(declare-fun tp_is_empty!15133 () Bool)

(assert (=> b!827977 (= e!461322 tp_is_empty!15133)))

(declare-fun b!827978 () Bool)

(declare-fun e!461320 () Bool)

(assert (=> b!827978 (= e!461320 tp_is_empty!15133)))

(declare-fun res!564266 () Bool)

(declare-fun e!461318 () Bool)

(assert (=> start!71288 (=> (not res!564266) (not e!461318))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71288 (= res!564266 (validMask!0 mask!1312))))

(assert (=> start!71288 e!461318))

(assert (=> start!71288 tp_is_empty!15133))

(declare-datatypes ((array!46430 0))(
  ( (array!46431 (arr!22258 (Array (_ BitVec 32) (_ BitVec 64))) (size!22679 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46430)

(declare-fun array_inv!17733 (array!46430) Bool)

(assert (=> start!71288 (array_inv!17733 _keys!976)))

(assert (=> start!71288 true))

(declare-datatypes ((V!25179 0))(
  ( (V!25180 (val!7614 Int)) )
))
(declare-datatypes ((ValueCell!7151 0))(
  ( (ValueCellFull!7151 (v!10049 V!25179)) (EmptyCell!7151) )
))
(declare-datatypes ((array!46432 0))(
  ( (array!46433 (arr!22259 (Array (_ BitVec 32) ValueCell!7151)) (size!22680 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46432)

(declare-fun e!461321 () Bool)

(declare-fun array_inv!17734 (array!46432) Bool)

(assert (=> start!71288 (and (array_inv!17734 _values!788) e!461321)))

(assert (=> start!71288 tp!47035))

(declare-fun b!827979 () Bool)

(declare-fun res!564270 () Bool)

(assert (=> b!827979 (=> (not res!564270) (not e!461318))))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!827979 (= res!564270 (and (= (size!22680 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22679 _keys!976) (size!22680 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827980 () Bool)

(declare-fun res!564268 () Bool)

(assert (=> b!827980 (=> (not res!564268) (not e!461318))))

(declare-datatypes ((List!15886 0))(
  ( (Nil!15883) (Cons!15882 (h!17011 (_ BitVec 64)) (t!22237 List!15886)) )
))
(declare-fun arrayNoDuplicates!0 (array!46430 (_ BitVec 32) List!15886) Bool)

(assert (=> b!827980 (= res!564268 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15883))))

(declare-fun mapNonEmpty!24331 () Bool)

(declare-fun mapRes!24331 () Bool)

(declare-fun tp!47034 () Bool)

(assert (=> mapNonEmpty!24331 (= mapRes!24331 (and tp!47034 e!461320))))

(declare-fun mapRest!24331 () (Array (_ BitVec 32) ValueCell!7151))

(declare-fun mapKey!24331 () (_ BitVec 32))

(declare-fun mapValue!24331 () ValueCell!7151)

(assert (=> mapNonEmpty!24331 (= (arr!22259 _values!788) (store mapRest!24331 mapKey!24331 mapValue!24331))))

(declare-fun mapIsEmpty!24331 () Bool)

(assert (=> mapIsEmpty!24331 mapRes!24331))

(declare-fun b!827981 () Bool)

(declare-fun e!461319 () Bool)

(assert (=> b!827981 (= e!461318 (not e!461319))))

(declare-fun res!564269 () Bool)

(assert (=> b!827981 (=> res!564269 e!461319)))

(assert (=> b!827981 (= res!564269 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!10094 0))(
  ( (tuple2!10095 (_1!5058 (_ BitVec 64)) (_2!5058 V!25179)) )
))
(declare-datatypes ((List!15887 0))(
  ( (Nil!15884) (Cons!15883 (h!17012 tuple2!10094) (t!22238 List!15887)) )
))
(declare-datatypes ((ListLongMap!8917 0))(
  ( (ListLongMap!8918 (toList!4474 List!15887)) )
))
(declare-fun lt!375075 () ListLongMap!8917)

(declare-fun lt!375074 () ListLongMap!8917)

(assert (=> b!827981 (= lt!375075 lt!375074)))

(declare-fun zeroValueBefore!34 () V!25179)

(declare-fun zeroValueAfter!34 () V!25179)

(declare-fun minValue!754 () V!25179)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!28365 0))(
  ( (Unit!28366) )
))
(declare-fun lt!375073 () Unit!28365)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!564 (array!46430 array!46432 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 V!25179 V!25179 (_ BitVec 32) Int) Unit!28365)

(assert (=> b!827981 (= lt!375073 (lemmaNoChangeToArrayThenSameMapNoExtras!564 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2476 (array!46430 array!46432 (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 (_ BitVec 32) Int) ListLongMap!8917)

(assert (=> b!827981 (= lt!375074 (getCurrentListMapNoExtraKeys!2476 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827981 (= lt!375075 (getCurrentListMapNoExtraKeys!2476 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827982 () Bool)

(declare-fun +!1958 (ListLongMap!8917 tuple2!10094) ListLongMap!8917)

(declare-fun getCurrentListMap!2577 (array!46430 array!46432 (_ BitVec 32) (_ BitVec 32) V!25179 V!25179 (_ BitVec 32) Int) ListLongMap!8917)

(assert (=> b!827982 (= e!461319 (= (+!1958 (getCurrentListMap!2577 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!10095 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (getCurrentListMap!2577 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796)))))

(declare-fun b!827983 () Bool)

(declare-fun res!564267 () Bool)

(assert (=> b!827983 (=> (not res!564267) (not e!461318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46430 (_ BitVec 32)) Bool)

(assert (=> b!827983 (= res!564267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!827984 () Bool)

(assert (=> b!827984 (= e!461321 (and e!461322 mapRes!24331))))

(declare-fun condMapEmpty!24331 () Bool)

(declare-fun mapDefault!24331 () ValueCell!7151)

