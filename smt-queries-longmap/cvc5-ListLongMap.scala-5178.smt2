; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70054 () Bool)

(assert start!70054)

(declare-fun b_free!12475 () Bool)

(declare-fun b_next!12475 () Bool)

(assert (=> start!70054 (= b_free!12475 (not b_next!12475))))

(declare-fun tp!44139 () Bool)

(declare-fun b_and!21247 () Bool)

(assert (=> start!70054 (= tp!44139 b_and!21247)))

(declare-fun b!814142 () Bool)

(declare-fun e!451246 () Bool)

(assert (=> b!814142 (= e!451246 false)))

(declare-datatypes ((V!23915 0))(
  ( (V!23916 (val!7140 Int)) )
))
(declare-datatypes ((tuple2!9358 0))(
  ( (tuple2!9359 (_1!4690 (_ BitVec 64)) (_2!4690 V!23915)) )
))
(declare-datatypes ((List!15189 0))(
  ( (Nil!15186) (Cons!15185 (h!16314 tuple2!9358) (t!21506 List!15189)) )
))
(declare-datatypes ((ListLongMap!8181 0))(
  ( (ListLongMap!8182 (toList!4106 List!15189)) )
))
(declare-fun lt!364497 () ListLongMap!8181)

(declare-datatypes ((array!44576 0))(
  ( (array!44577 (arr!21348 (Array (_ BitVec 32) (_ BitVec 64))) (size!21769 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44576)

(declare-fun zeroValueAfter!34 () V!23915)

(declare-fun minValue!754 () V!23915)

(declare-datatypes ((ValueCell!6677 0))(
  ( (ValueCellFull!6677 (v!9567 V!23915)) (EmptyCell!6677) )
))
(declare-datatypes ((array!44578 0))(
  ( (array!44579 (arr!21349 (Array (_ BitVec 32) ValueCell!6677)) (size!21770 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44578)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2156 (array!44576 array!44578 (_ BitVec 32) (_ BitVec 32) V!23915 V!23915 (_ BitVec 32) Int) ListLongMap!8181)

(assert (=> b!814142 (= lt!364497 (getCurrentListMapNoExtraKeys!2156 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!23915)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun lt!364496 () ListLongMap!8181)

(assert (=> b!814142 (= lt!364496 (getCurrentListMapNoExtraKeys!2156 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!814143 () Bool)

(declare-fun res!556108 () Bool)

(assert (=> b!814143 (=> (not res!556108) (not e!451246))))

(declare-datatypes ((List!15190 0))(
  ( (Nil!15187) (Cons!15186 (h!16315 (_ BitVec 64)) (t!21507 List!15190)) )
))
(declare-fun arrayNoDuplicates!0 (array!44576 (_ BitVec 32) List!15190) Bool)

(assert (=> b!814143 (= res!556108 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15187))))

(declare-fun res!556109 () Bool)

(assert (=> start!70054 (=> (not res!556109) (not e!451246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70054 (= res!556109 (validMask!0 mask!1312))))

(assert (=> start!70054 e!451246))

(declare-fun tp_is_empty!14185 () Bool)

(assert (=> start!70054 tp_is_empty!14185))

(declare-fun array_inv!17087 (array!44576) Bool)

(assert (=> start!70054 (array_inv!17087 _keys!976)))

(assert (=> start!70054 true))

(declare-fun e!451248 () Bool)

(declare-fun array_inv!17088 (array!44578) Bool)

(assert (=> start!70054 (and (array_inv!17088 _values!788) e!451248)))

(assert (=> start!70054 tp!44139))

(declare-fun b!814144 () Bool)

(declare-fun e!451245 () Bool)

(assert (=> b!814144 (= e!451245 tp_is_empty!14185)))

(declare-fun b!814145 () Bool)

(declare-fun res!556110 () Bool)

(assert (=> b!814145 (=> (not res!556110) (not e!451246))))

(assert (=> b!814145 (= res!556110 (and (= (size!21770 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21769 _keys!976) (size!21770 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!814146 () Bool)

(declare-fun res!556107 () Bool)

(assert (=> b!814146 (=> (not res!556107) (not e!451246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44576 (_ BitVec 32)) Bool)

(assert (=> b!814146 (= res!556107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!814147 () Bool)

(declare-fun e!451247 () Bool)

(declare-fun mapRes!22858 () Bool)

(assert (=> b!814147 (= e!451248 (and e!451247 mapRes!22858))))

(declare-fun condMapEmpty!22858 () Bool)

(declare-fun mapDefault!22858 () ValueCell!6677)

