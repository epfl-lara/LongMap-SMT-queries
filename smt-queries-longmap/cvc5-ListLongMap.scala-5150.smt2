; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69864 () Bool)

(assert start!69864)

(declare-fun b!812340 () Bool)

(declare-fun res!555127 () Bool)

(declare-fun e!449909 () Bool)

(assert (=> b!812340 (=> (not res!555127) (not e!449909))))

(declare-datatypes ((array!44260 0))(
  ( (array!44261 (arr!21192 (Array (_ BitVec 32) (_ BitVec 64))) (size!21613 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44260)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23691 0))(
  ( (V!23692 (val!7056 Int)) )
))
(declare-datatypes ((ValueCell!6593 0))(
  ( (ValueCellFull!6593 (v!9483 V!23691)) (EmptyCell!6593) )
))
(declare-datatypes ((array!44262 0))(
  ( (array!44263 (arr!21193 (Array (_ BitVec 32) ValueCell!6593)) (size!21614 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44262)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812340 (= res!555127 (and (= (size!21614 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21613 _keys!976) (size!21614 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!812341 () Bool)

(declare-fun e!449913 () Bool)

(declare-fun tp_is_empty!14017 () Bool)

(assert (=> b!812341 (= e!449913 tp_is_empty!14017)))

(declare-fun b!812342 () Bool)

(declare-fun e!449911 () Bool)

(declare-fun mapRes!22600 () Bool)

(assert (=> b!812342 (= e!449911 (and e!449913 mapRes!22600))))

(declare-fun condMapEmpty!22600 () Bool)

(declare-fun mapDefault!22600 () ValueCell!6593)

