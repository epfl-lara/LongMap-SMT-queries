; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69998 () Bool)

(assert start!69998)

(declare-fun b_free!12419 () Bool)

(declare-fun b_next!12419 () Bool)

(assert (=> start!69998 (= b_free!12419 (not b_next!12419))))

(declare-fun tp!43972 () Bool)

(declare-fun b_and!21191 () Bool)

(assert (=> start!69998 (= tp!43972 b_and!21191)))

(declare-fun b!813554 () Bool)

(declare-fun res!555771 () Bool)

(declare-fun e!450825 () Bool)

(assert (=> b!813554 (=> (not res!555771) (not e!450825))))

(declare-datatypes ((array!44466 0))(
  ( (array!44467 (arr!21293 (Array (_ BitVec 32) (_ BitVec 64))) (size!21714 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44466)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23839 0))(
  ( (V!23840 (val!7112 Int)) )
))
(declare-datatypes ((ValueCell!6649 0))(
  ( (ValueCellFull!6649 (v!9539 V!23839)) (EmptyCell!6649) )
))
(declare-datatypes ((array!44468 0))(
  ( (array!44469 (arr!21294 (Array (_ BitVec 32) ValueCell!6649)) (size!21715 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44468)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!813554 (= res!555771 (and (= (size!21715 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21714 _keys!976) (size!21715 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22774 () Bool)

(declare-fun mapRes!22774 () Bool)

(assert (=> mapIsEmpty!22774 mapRes!22774))

(declare-fun b!813555 () Bool)

(assert (=> b!813555 (= e!450825 false)))

(declare-fun minValue!754 () V!23839)

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((tuple2!9312 0))(
  ( (tuple2!9313 (_1!4667 (_ BitVec 64)) (_2!4667 V!23839)) )
))
(declare-datatypes ((List!15144 0))(
  ( (Nil!15141) (Cons!15140 (h!16269 tuple2!9312) (t!21461 List!15144)) )
))
(declare-datatypes ((ListLongMap!8135 0))(
  ( (ListLongMap!8136 (toList!4083 List!15144)) )
))
(declare-fun lt!364328 () ListLongMap!8135)

(declare-fun zeroValueAfter!34 () V!23839)

(declare-fun getCurrentListMapNoExtraKeys!2133 (array!44466 array!44468 (_ BitVec 32) (_ BitVec 32) V!23839 V!23839 (_ BitVec 32) Int) ListLongMap!8135)

(assert (=> b!813555 (= lt!364328 (getCurrentListMapNoExtraKeys!2133 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23839)

(declare-fun lt!364329 () ListLongMap!8135)

(assert (=> b!813555 (= lt!364329 (getCurrentListMapNoExtraKeys!2133 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!813556 () Bool)

(declare-fun res!555773 () Bool)

(assert (=> b!813556 (=> (not res!555773) (not e!450825))))

(declare-datatypes ((List!15145 0))(
  ( (Nil!15142) (Cons!15141 (h!16270 (_ BitVec 64)) (t!21462 List!15145)) )
))
(declare-fun arrayNoDuplicates!0 (array!44466 (_ BitVec 32) List!15145) Bool)

(assert (=> b!813556 (= res!555773 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15142))))

(declare-fun res!555774 () Bool)

(assert (=> start!69998 (=> (not res!555774) (not e!450825))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69998 (= res!555774 (validMask!0 mask!1312))))

(assert (=> start!69998 e!450825))

(declare-fun tp_is_empty!14129 () Bool)

(assert (=> start!69998 tp_is_empty!14129))

(declare-fun array_inv!17053 (array!44466) Bool)

(assert (=> start!69998 (array_inv!17053 _keys!976)))

(assert (=> start!69998 true))

(declare-fun e!450827 () Bool)

(declare-fun array_inv!17054 (array!44468) Bool)

(assert (=> start!69998 (and (array_inv!17054 _values!788) e!450827)))

(assert (=> start!69998 tp!43972))

(declare-fun b!813557 () Bool)

(declare-fun e!450826 () Bool)

(assert (=> b!813557 (= e!450826 tp_is_empty!14129)))

(declare-fun b!813558 () Bool)

(declare-fun res!555772 () Bool)

(assert (=> b!813558 (=> (not res!555772) (not e!450825))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44466 (_ BitVec 32)) Bool)

(assert (=> b!813558 (= res!555772 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813559 () Bool)

(declare-fun e!450828 () Bool)

(assert (=> b!813559 (= e!450827 (and e!450828 mapRes!22774))))

(declare-fun condMapEmpty!22774 () Bool)

(declare-fun mapDefault!22774 () ValueCell!6649)

