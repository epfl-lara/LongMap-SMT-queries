; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69846 () Bool)

(assert start!69846)

(declare-fun b!812231 () Bool)

(declare-fun res!555062 () Bool)

(declare-fun e!449832 () Bool)

(assert (=> b!812231 (=> (not res!555062) (not e!449832))))

(declare-datatypes ((array!44248 0))(
  ( (array!44249 (arr!21187 (Array (_ BitVec 32) (_ BitVec 64))) (size!21608 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44248)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44248 (_ BitVec 32)) Bool)

(assert (=> b!812231 (= res!555062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!812232 () Bool)

(declare-fun e!449828 () Bool)

(declare-fun tp_is_empty!14011 () Bool)

(assert (=> b!812232 (= e!449828 tp_is_empty!14011)))

(declare-fun b!812233 () Bool)

(declare-fun e!449829 () Bool)

(declare-datatypes ((List!15092 0))(
  ( (Nil!15089) (Cons!15088 (h!16217 (_ BitVec 64)) (t!21407 List!15092)) )
))
(declare-fun contains!4140 (List!15092 (_ BitVec 64)) Bool)

(assert (=> b!812233 (= e!449829 (contains!4140 Nil!15089 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!812234 () Bool)

(declare-fun res!555060 () Bool)

(assert (=> b!812234 (=> (not res!555060) (not e!449832))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!23683 0))(
  ( (V!23684 (val!7053 Int)) )
))
(declare-datatypes ((ValueCell!6590 0))(
  ( (ValueCellFull!6590 (v!9479 V!23683)) (EmptyCell!6590) )
))
(declare-datatypes ((array!44250 0))(
  ( (array!44251 (arr!21188 (Array (_ BitVec 32) ValueCell!6590)) (size!21609 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44250)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!812234 (= res!555060 (and (= (size!21609 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21608 _keys!976) (size!21609 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!22588 () Bool)

(declare-fun mapRes!22588 () Bool)

(declare-fun tp!43696 () Bool)

(assert (=> mapNonEmpty!22588 (= mapRes!22588 (and tp!43696 e!449828))))

(declare-fun mapKey!22588 () (_ BitVec 32))

(declare-fun mapRest!22588 () (Array (_ BitVec 32) ValueCell!6590))

(declare-fun mapValue!22588 () ValueCell!6590)

(assert (=> mapNonEmpty!22588 (= (arr!21188 _values!788) (store mapRest!22588 mapKey!22588 mapValue!22588))))

(declare-fun b!812235 () Bool)

(declare-fun res!555061 () Bool)

(assert (=> b!812235 (=> (not res!555061) (not e!449832))))

(declare-fun noDuplicate!1293 (List!15092) Bool)

(assert (=> b!812235 (= res!555061 (noDuplicate!1293 Nil!15089))))

(declare-fun mapIsEmpty!22588 () Bool)

(assert (=> mapIsEmpty!22588 mapRes!22588))

(declare-fun b!812236 () Bool)

(declare-fun e!449830 () Bool)

(declare-fun e!449833 () Bool)

(assert (=> b!812236 (= e!449830 (and e!449833 mapRes!22588))))

(declare-fun condMapEmpty!22588 () Bool)

(declare-fun mapDefault!22588 () ValueCell!6590)

