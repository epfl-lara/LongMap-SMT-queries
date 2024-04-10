; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41464 () Bool)

(assert start!41464)

(declare-fun b_free!11143 () Bool)

(declare-fun b_next!11143 () Bool)

(assert (=> start!41464 (= b_free!11143 (not b_next!11143))))

(declare-fun tp!39423 () Bool)

(declare-fun b_and!19479 () Bool)

(assert (=> start!41464 (= tp!39423 b_and!19479)))

(declare-fun b!463275 () Bool)

(declare-fun e!270470 () Bool)

(declare-fun tp_is_empty!12571 () Bool)

(assert (=> b!463275 (= e!270470 tp_is_empty!12571)))

(declare-fun b!463276 () Bool)

(declare-fun res!277022 () Bool)

(declare-fun e!270473 () Bool)

(assert (=> b!463276 (=> (not res!277022) (not e!270473))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28937 0))(
  ( (array!28938 (arr!13901 (Array (_ BitVec 32) (_ BitVec 64))) (size!14253 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28937)

(declare-datatypes ((V!17867 0))(
  ( (V!17868 (val!6330 Int)) )
))
(declare-datatypes ((ValueCell!5942 0))(
  ( (ValueCellFull!5942 (v!8617 V!17867)) (EmptyCell!5942) )
))
(declare-datatypes ((array!28939 0))(
  ( (array!28940 (arr!13902 (Array (_ BitVec 32) ValueCell!5942)) (size!14254 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28939)

(assert (=> b!463276 (= res!277022 (and (= (size!14254 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14253 _keys!1025) (size!14254 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463277 () Bool)

(declare-fun res!277023 () Bool)

(assert (=> b!463277 (=> (not res!277023) (not e!270473))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28937 (_ BitVec 32)) Bool)

(assert (=> b!463277 (= res!277023 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463278 () Bool)

(assert (=> b!463278 (= e!270473 (bvsgt #b00000000000000000000000000000000 (size!14253 _keys!1025)))))

(declare-fun zeroValue!794 () V!17867)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueBefore!38 () V!17867)

(declare-datatypes ((tuple2!8290 0))(
  ( (tuple2!8291 (_1!4156 (_ BitVec 64)) (_2!4156 V!17867)) )
))
(declare-datatypes ((List!8384 0))(
  ( (Nil!8381) (Cons!8380 (h!9236 tuple2!8290) (t!14328 List!8384)) )
))
(declare-datatypes ((ListLongMap!7203 0))(
  ( (ListLongMap!7204 (toList!3617 List!8384)) )
))
(declare-fun lt!209330 () ListLongMap!7203)

(declare-fun getCurrentListMapNoExtraKeys!1797 (array!28937 array!28939 (_ BitVec 32) (_ BitVec 32) V!17867 V!17867 (_ BitVec 32) Int) ListLongMap!7203)

(assert (=> b!463278 (= lt!209330 (getCurrentListMapNoExtraKeys!1797 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463279 () Bool)

(declare-fun e!270474 () Bool)

(declare-fun e!270472 () Bool)

(declare-fun mapRes!20530 () Bool)

(assert (=> b!463279 (= e!270474 (and e!270472 mapRes!20530))))

(declare-fun condMapEmpty!20530 () Bool)

(declare-fun mapDefault!20530 () ValueCell!5942)

