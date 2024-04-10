; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70290 () Bool)

(assert start!70290)

(declare-fun b_free!12665 () Bool)

(declare-fun b_next!12665 () Bool)

(assert (=> start!70290 (= b_free!12665 (not b_next!12665))))

(declare-fun tp!44719 () Bool)

(declare-fun b_and!21465 () Bool)

(assert (=> start!70290 (= tp!44719 b_and!21465)))

(declare-fun mapNonEmpty!23152 () Bool)

(declare-fun mapRes!23152 () Bool)

(declare-fun tp!44718 () Bool)

(declare-fun e!453010 () Bool)

(assert (=> mapNonEmpty!23152 (= mapRes!23152 (and tp!44718 e!453010))))

(declare-datatypes ((V!24167 0))(
  ( (V!24168 (val!7235 Int)) )
))
(declare-datatypes ((ValueCell!6772 0))(
  ( (ValueCellFull!6772 (v!9663 V!24167)) (EmptyCell!6772) )
))
(declare-fun mapRest!23152 () (Array (_ BitVec 32) ValueCell!6772))

(declare-fun mapValue!23152 () ValueCell!6772)

(declare-datatypes ((array!44950 0))(
  ( (array!44951 (arr!21532 (Array (_ BitVec 32) ValueCell!6772)) (size!21953 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44950)

(declare-fun mapKey!23152 () (_ BitVec 32))

(assert (=> mapNonEmpty!23152 (= (arr!21532 _values!788) (store mapRest!23152 mapKey!23152 mapValue!23152))))

(declare-fun res!557511 () Bool)

(declare-fun e!453006 () Bool)

(assert (=> start!70290 (=> (not res!557511) (not e!453006))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70290 (= res!557511 (validMask!0 mask!1312))))

(assert (=> start!70290 e!453006))

(declare-fun tp_is_empty!14375 () Bool)

(assert (=> start!70290 tp_is_empty!14375))

(declare-datatypes ((array!44952 0))(
  ( (array!44953 (arr!21533 (Array (_ BitVec 32) (_ BitVec 64))) (size!21954 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44952)

(declare-fun array_inv!17229 (array!44952) Bool)

(assert (=> start!70290 (array_inv!17229 _keys!976)))

(assert (=> start!70290 true))

(declare-fun e!453005 () Bool)

(declare-fun array_inv!17230 (array!44950) Bool)

(assert (=> start!70290 (and (array_inv!17230 _values!788) e!453005)))

(assert (=> start!70290 tp!44719))

(declare-fun mapIsEmpty!23152 () Bool)

(assert (=> mapIsEmpty!23152 mapRes!23152))

(declare-fun b!816607 () Bool)

(declare-fun e!453009 () Bool)

(assert (=> b!816607 (= e!453006 (not e!453009))))

(declare-fun res!557508 () Bool)

(assert (=> b!816607 (=> res!557508 e!453009)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!816607 (= res!557508 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!9508 0))(
  ( (tuple2!9509 (_1!4765 (_ BitVec 64)) (_2!4765 V!24167)) )
))
(declare-datatypes ((List!15336 0))(
  ( (Nil!15333) (Cons!15332 (h!16461 tuple2!9508) (t!21659 List!15336)) )
))
(declare-datatypes ((ListLongMap!8331 0))(
  ( (ListLongMap!8332 (toList!4181 List!15336)) )
))
(declare-fun lt!365780 () ListLongMap!8331)

(declare-fun lt!365781 () ListLongMap!8331)

(assert (=> b!816607 (= lt!365780 lt!365781)))

(declare-fun zeroValueBefore!34 () V!24167)

(declare-fun zeroValueAfter!34 () V!24167)

(declare-fun minValue!754 () V!24167)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27848 0))(
  ( (Unit!27849) )
))
(declare-fun lt!365779 () Unit!27848)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!334 (array!44952 array!44950 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24167 V!24167 V!24167 V!24167 (_ BitVec 32) Int) Unit!27848)

(assert (=> b!816607 (= lt!365779 (lemmaNoChangeToArrayThenSameMapNoExtras!334 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2224 (array!44952 array!44950 (_ BitVec 32) (_ BitVec 32) V!24167 V!24167 (_ BitVec 32) Int) ListLongMap!8331)

(assert (=> b!816607 (= lt!365781 (getCurrentListMapNoExtraKeys!2224 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!816607 (= lt!365780 (getCurrentListMapNoExtraKeys!2224 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!816608 () Bool)

(declare-fun res!557509 () Bool)

(assert (=> b!816608 (=> (not res!557509) (not e!453006))))

(declare-datatypes ((List!15337 0))(
  ( (Nil!15334) (Cons!15333 (h!16462 (_ BitVec 64)) (t!21660 List!15337)) )
))
(declare-fun arrayNoDuplicates!0 (array!44952 (_ BitVec 32) List!15337) Bool)

(assert (=> b!816608 (= res!557509 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15334))))

(declare-fun b!816609 () Bool)

(declare-fun res!557507 () Bool)

(assert (=> b!816609 (=> (not res!557507) (not e!453006))))

(assert (=> b!816609 (= res!557507 (and (= (size!21953 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21954 _keys!976) (size!21953 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!816610 () Bool)

(assert (=> b!816610 (= e!453009 true)))

(declare-fun lt!365778 () ListLongMap!8331)

(declare-fun getCurrentListMap!2406 (array!44952 array!44950 (_ BitVec 32) (_ BitVec 32) V!24167 V!24167 (_ BitVec 32) Int) ListLongMap!8331)

(assert (=> b!816610 (= lt!365778 (getCurrentListMap!2406 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!365782 () ListLongMap!8331)

(declare-fun +!1812 (ListLongMap!8331 tuple2!9508) ListLongMap!8331)

(assert (=> b!816610 (= lt!365782 (+!1812 (getCurrentListMap!2406 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (tuple2!9509 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun b!816611 () Bool)

(declare-fun res!557510 () Bool)

(assert (=> b!816611 (=> (not res!557510) (not e!453006))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44952 (_ BitVec 32)) Bool)

(assert (=> b!816611 (= res!557510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!816612 () Bool)

(assert (=> b!816612 (= e!453010 tp_is_empty!14375)))

(declare-fun b!816613 () Bool)

(declare-fun e!453007 () Bool)

(assert (=> b!816613 (= e!453005 (and e!453007 mapRes!23152))))

(declare-fun condMapEmpty!23152 () Bool)

(declare-fun mapDefault!23152 () ValueCell!6772)

