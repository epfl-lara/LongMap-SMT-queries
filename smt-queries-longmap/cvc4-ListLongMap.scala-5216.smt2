; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70350 () Bool)

(assert start!70350)

(declare-fun b_free!12707 () Bool)

(declare-fun b_next!12707 () Bool)

(assert (=> start!70350 (= b_free!12707 (not b_next!12707))))

(declare-fun tp!44848 () Bool)

(declare-fun b_and!21519 () Bool)

(assert (=> start!70350 (= tp!44848 b_and!21519)))

(declare-fun b!817278 () Bool)

(declare-fun e!453477 () Bool)

(declare-fun tp_is_empty!14417 () Bool)

(assert (=> b!817278 (= e!453477 tp_is_empty!14417)))

(declare-fun res!557889 () Bool)

(declare-fun e!453479 () Bool)

(assert (=> start!70350 (=> (not res!557889) (not e!453479))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70350 (= res!557889 (validMask!0 mask!1312))))

(assert (=> start!70350 e!453479))

(assert (=> start!70350 tp_is_empty!14417))

(declare-datatypes ((array!45034 0))(
  ( (array!45035 (arr!21573 (Array (_ BitVec 32) (_ BitVec 64))) (size!21994 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45034)

(declare-fun array_inv!17261 (array!45034) Bool)

(assert (=> start!70350 (array_inv!17261 _keys!976)))

(assert (=> start!70350 true))

(declare-datatypes ((V!24223 0))(
  ( (V!24224 (val!7256 Int)) )
))
(declare-datatypes ((ValueCell!6793 0))(
  ( (ValueCellFull!6793 (v!9685 V!24223)) (EmptyCell!6793) )
))
(declare-datatypes ((array!45036 0))(
  ( (array!45037 (arr!21574 (Array (_ BitVec 32) ValueCell!6793)) (size!21995 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45036)

(declare-fun e!453476 () Bool)

(declare-fun array_inv!17262 (array!45036) Bool)

(assert (=> start!70350 (and (array_inv!17262 _values!788) e!453476)))

(assert (=> start!70350 tp!44848))

(declare-fun b!817279 () Bool)

(declare-fun res!557887 () Bool)

(assert (=> b!817279 (=> (not res!557887) (not e!453479))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45034 (_ BitVec 32)) Bool)

(assert (=> b!817279 (= res!557887 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!817280 () Bool)

(declare-fun res!557890 () Bool)

(assert (=> b!817280 (=> (not res!557890) (not e!453479))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!817280 (= res!557890 (and (= (size!21995 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21994 _keys!976) (size!21995 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!817281 () Bool)

(declare-fun mapRes!23218 () Bool)

(assert (=> b!817281 (= e!453476 (and e!453477 mapRes!23218))))

(declare-fun condMapEmpty!23218 () Bool)

(declare-fun mapDefault!23218 () ValueCell!6793)

