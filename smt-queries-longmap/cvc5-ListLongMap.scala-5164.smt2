; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!69958 () Bool)

(assert start!69958)

(declare-fun b_free!12391 () Bool)

(declare-fun b_next!12391 () Bool)

(assert (=> start!69958 (= b_free!12391 (not b_next!12391))))

(declare-fun tp!43884 () Bool)

(declare-fun b_and!21159 () Bool)

(assert (=> start!69958 (= tp!43884 b_and!21159)))

(declare-fun b!813187 () Bool)

(declare-fun e!450567 () Bool)

(declare-fun tp_is_empty!14101 () Bool)

(assert (=> b!813187 (= e!450567 tp_is_empty!14101)))

(declare-fun mapNonEmpty!22729 () Bool)

(declare-fun mapRes!22729 () Bool)

(declare-fun tp!43885 () Bool)

(declare-fun e!450566 () Bool)

(assert (=> mapNonEmpty!22729 (= mapRes!22729 (and tp!43885 e!450566))))

(declare-datatypes ((V!23803 0))(
  ( (V!23804 (val!7098 Int)) )
))
(declare-datatypes ((ValueCell!6635 0))(
  ( (ValueCellFull!6635 (v!9525 V!23803)) (EmptyCell!6635) )
))
(declare-fun mapValue!22729 () ValueCell!6635)

(declare-fun mapKey!22729 () (_ BitVec 32))

(declare-fun mapRest!22729 () (Array (_ BitVec 32) ValueCell!6635))

(declare-datatypes ((array!44414 0))(
  ( (array!44415 (arr!21268 (Array (_ BitVec 32) ValueCell!6635)) (size!21689 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44414)

(assert (=> mapNonEmpty!22729 (= (arr!21268 _values!788) (store mapRest!22729 mapKey!22729 mapValue!22729))))

(declare-fun mapIsEmpty!22729 () Bool)

(assert (=> mapIsEmpty!22729 mapRes!22729))

(declare-fun res!555576 () Bool)

(declare-fun e!450568 () Bool)

(assert (=> start!69958 (=> (not res!555576) (not e!450568))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69958 (= res!555576 (validMask!0 mask!1312))))

(assert (=> start!69958 e!450568))

(assert (=> start!69958 tp_is_empty!14101))

(declare-datatypes ((array!44416 0))(
  ( (array!44417 (arr!21269 (Array (_ BitVec 32) (_ BitVec 64))) (size!21690 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44416)

(declare-fun array_inv!17031 (array!44416) Bool)

(assert (=> start!69958 (array_inv!17031 _keys!976)))

(assert (=> start!69958 true))

(declare-fun e!450569 () Bool)

(declare-fun array_inv!17032 (array!44414) Bool)

(assert (=> start!69958 (and (array_inv!17032 _values!788) e!450569)))

(assert (=> start!69958 tp!43884))

(declare-fun b!813188 () Bool)

(declare-fun res!555578 () Bool)

(assert (=> b!813188 (=> (not res!555578) (not e!450568))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44416 (_ BitVec 32)) Bool)

(assert (=> b!813188 (= res!555578 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!813189 () Bool)

(assert (=> b!813189 (= e!450569 (and e!450567 mapRes!22729))))

(declare-fun condMapEmpty!22729 () Bool)

(declare-fun mapDefault!22729 () ValueCell!6635)

