; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70140 () Bool)

(assert start!70140)

(declare-fun b_free!12547 () Bool)

(declare-fun b_next!12547 () Bool)

(assert (=> start!70140 (= b_free!12547 (not b_next!12547))))

(declare-fun tp!44359 () Bool)

(declare-fun b_and!21327 () Bool)

(assert (=> start!70140 (= tp!44359 b_and!21327)))

(declare-fun b!814983 () Bool)

(declare-fun e!451840 () Bool)

(assert (=> b!814983 (= e!451840 (not true))))

(declare-datatypes ((V!24011 0))(
  ( (V!24012 (val!7176 Int)) )
))
(declare-datatypes ((tuple2!9408 0))(
  ( (tuple2!9409 (_1!4715 (_ BitVec 64)) (_2!4715 V!24011)) )
))
(declare-datatypes ((List!15239 0))(
  ( (Nil!15236) (Cons!15235 (h!16364 tuple2!9408) (t!21558 List!15239)) )
))
(declare-datatypes ((ListLongMap!8231 0))(
  ( (ListLongMap!8232 (toList!4131 List!15239)) )
))
(declare-fun lt!364855 () ListLongMap!8231)

(declare-fun lt!364853 () ListLongMap!8231)

(assert (=> b!814983 (= lt!364855 lt!364853)))

(declare-fun zeroValueBefore!34 () V!24011)

(declare-datatypes ((array!44718 0))(
  ( (array!44719 (arr!21418 (Array (_ BitVec 32) (_ BitVec 64))) (size!21839 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44718)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24011)

(declare-fun minValue!754 () V!24011)

(declare-datatypes ((ValueCell!6713 0))(
  ( (ValueCellFull!6713 (v!9603 V!24011)) (EmptyCell!6713) )
))
(declare-datatypes ((array!44720 0))(
  ( (array!44721 (arr!21419 (Array (_ BitVec 32) ValueCell!6713)) (size!21840 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44720)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27760 0))(
  ( (Unit!27761) )
))
(declare-fun lt!364854 () Unit!27760)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!291 (array!44718 array!44720 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24011 V!24011 V!24011 V!24011 (_ BitVec 32) Int) Unit!27760)

(assert (=> b!814983 (= lt!364854 (lemmaNoChangeToArrayThenSameMapNoExtras!291 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2181 (array!44718 array!44720 (_ BitVec 32) (_ BitVec 32) V!24011 V!24011 (_ BitVec 32) Int) ListLongMap!8231)

(assert (=> b!814983 (= lt!364853 (getCurrentListMapNoExtraKeys!2181 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!814983 (= lt!364855 (getCurrentListMapNoExtraKeys!2181 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814984 () Bool)

(declare-fun res!556571 () Bool)

(assert (=> b!814984 (=> (not res!556571) (not e!451840))))

(declare-datatypes ((List!15240 0))(
  ( (Nil!15237) (Cons!15236 (h!16365 (_ BitVec 64)) (t!21559 List!15240)) )
))
(declare-fun arrayNoDuplicates!0 (array!44718 (_ BitVec 32) List!15240) Bool)

(assert (=> b!814984 (= res!556571 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15237))))

(declare-fun b!814986 () Bool)

(declare-fun e!451842 () Bool)

(declare-fun tp_is_empty!14257 () Bool)

(assert (=> b!814986 (= e!451842 tp_is_empty!14257)))

(declare-fun b!814987 () Bool)

(declare-fun res!556572 () Bool)

(assert (=> b!814987 (=> (not res!556572) (not e!451840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44718 (_ BitVec 32)) Bool)

(assert (=> b!814987 (= res!556572 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!22969 () Bool)

(declare-fun mapRes!22969 () Bool)

(declare-fun tp!44358 () Bool)

(declare-fun e!451841 () Bool)

(assert (=> mapNonEmpty!22969 (= mapRes!22969 (and tp!44358 e!451841))))

(declare-fun mapKey!22969 () (_ BitVec 32))

(declare-fun mapValue!22969 () ValueCell!6713)

(declare-fun mapRest!22969 () (Array (_ BitVec 32) ValueCell!6713))

(assert (=> mapNonEmpty!22969 (= (arr!21419 _values!788) (store mapRest!22969 mapKey!22969 mapValue!22969))))

(declare-fun b!814988 () Bool)

(declare-fun res!556570 () Bool)

(assert (=> b!814988 (=> (not res!556570) (not e!451840))))

(assert (=> b!814988 (= res!556570 (and (= (size!21840 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21839 _keys!976) (size!21840 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun res!556573 () Bool)

(assert (=> start!70140 (=> (not res!556573) (not e!451840))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70140 (= res!556573 (validMask!0 mask!1312))))

(assert (=> start!70140 e!451840))

(assert (=> start!70140 tp_is_empty!14257))

(declare-fun array_inv!17137 (array!44718) Bool)

(assert (=> start!70140 (array_inv!17137 _keys!976)))

(assert (=> start!70140 true))

(declare-fun e!451843 () Bool)

(declare-fun array_inv!17138 (array!44720) Bool)

(assert (=> start!70140 (and (array_inv!17138 _values!788) e!451843)))

(assert (=> start!70140 tp!44359))

(declare-fun b!814985 () Bool)

(assert (=> b!814985 (= e!451843 (and e!451842 mapRes!22969))))

(declare-fun condMapEmpty!22969 () Bool)

(declare-fun mapDefault!22969 () ValueCell!6713)

