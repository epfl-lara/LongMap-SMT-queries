; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70376 () Bool)

(assert start!70376)

(declare-fun b_free!12733 () Bool)

(declare-fun b_next!12733 () Bool)

(assert (=> start!70376 (= b_free!12733 (not b_next!12733))))

(declare-fun tp!44925 () Bool)

(declare-fun b_and!21545 () Bool)

(assert (=> start!70376 (= tp!44925 b_and!21545)))

(declare-fun b!817551 () Bool)

(declare-fun e!453671 () Bool)

(assert (=> b!817551 (= e!453671 (not true))))

(declare-datatypes ((V!24259 0))(
  ( (V!24260 (val!7269 Int)) )
))
(declare-datatypes ((tuple2!9550 0))(
  ( (tuple2!9551 (_1!4786 (_ BitVec 64)) (_2!4786 V!24259)) )
))
(declare-datatypes ((List!15382 0))(
  ( (Nil!15379) (Cons!15378 (h!16507 tuple2!9550) (t!21707 List!15382)) )
))
(declare-datatypes ((ListLongMap!8373 0))(
  ( (ListLongMap!8374 (toList!4202 List!15382)) )
))
(declare-fun lt!366299 () ListLongMap!8373)

(declare-fun lt!366300 () ListLongMap!8373)

(assert (=> b!817551 (= lt!366299 lt!366300)))

(declare-fun zeroValueBefore!34 () V!24259)

(declare-datatypes ((array!45084 0))(
  ( (array!45085 (arr!21598 (Array (_ BitVec 32) (_ BitVec 64))) (size!22019 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45084)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun zeroValueAfter!34 () V!24259)

(declare-fun minValue!754 () V!24259)

(declare-datatypes ((ValueCell!6806 0))(
  ( (ValueCellFull!6806 (v!9698 V!24259)) (EmptyCell!6806) )
))
(declare-datatypes ((array!45086 0))(
  ( (array!45087 (arr!21599 (Array (_ BitVec 32) ValueCell!6806)) (size!22020 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45086)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27888 0))(
  ( (Unit!27889) )
))
(declare-fun lt!366298 () Unit!27888)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!353 (array!45084 array!45086 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24259 V!24259 V!24259 V!24259 (_ BitVec 32) Int) Unit!27888)

(assert (=> b!817551 (= lt!366298 (lemmaNoChangeToArrayThenSameMapNoExtras!353 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2243 (array!45084 array!45086 (_ BitVec 32) (_ BitVec 32) V!24259 V!24259 (_ BitVec 32) Int) ListLongMap!8373)

(assert (=> b!817551 (= lt!366300 (getCurrentListMapNoExtraKeys!2243 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!817551 (= lt!366299 (getCurrentListMapNoExtraKeys!2243 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!817552 () Bool)

(declare-fun e!453672 () Bool)

(declare-fun e!453674 () Bool)

(declare-fun mapRes!23257 () Bool)

(assert (=> b!817552 (= e!453672 (and e!453674 mapRes!23257))))

(declare-fun condMapEmpty!23257 () Bool)

(declare-fun mapDefault!23257 () ValueCell!6806)

