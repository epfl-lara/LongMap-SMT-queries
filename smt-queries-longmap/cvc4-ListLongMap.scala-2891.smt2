; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41492 () Bool)

(assert start!41492)

(declare-fun b_free!11159 () Bool)

(declare-fun b_next!11159 () Bool)

(assert (=> start!41492 (= b_free!11159 (not b_next!11159))))

(declare-fun tp!39475 () Bool)

(declare-fun b_and!19499 () Bool)

(assert (=> start!41492 (= tp!39475 b_and!19499)))

(declare-fun b!463516 () Bool)

(declare-fun e!270641 () Bool)

(assert (=> b!463516 (= e!270641 false)))

(declare-datatypes ((V!17887 0))(
  ( (V!17888 (val!6338 Int)) )
))
(declare-fun zeroValue!794 () V!17887)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8302 0))(
  ( (tuple2!8303 (_1!4162 (_ BitVec 64)) (_2!4162 V!17887)) )
))
(declare-datatypes ((List!8396 0))(
  ( (Nil!8393) (Cons!8392 (h!9248 tuple2!8302) (t!14342 List!8396)) )
))
(declare-datatypes ((ListLongMap!7215 0))(
  ( (ListLongMap!7216 (toList!3623 List!8396)) )
))
(declare-fun lt!209402 () ListLongMap!7215)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28969 0))(
  ( (array!28970 (arr!13916 (Array (_ BitVec 32) (_ BitVec 64))) (size!14268 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28969)

(declare-datatypes ((ValueCell!5950 0))(
  ( (ValueCellFull!5950 (v!8625 V!17887)) (EmptyCell!5950) )
))
(declare-datatypes ((array!28971 0))(
  ( (array!28972 (arr!13917 (Array (_ BitVec 32) ValueCell!5950)) (size!14269 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28971)

(declare-fun minValueAfter!38 () V!17887)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1803 (array!28969 array!28971 (_ BitVec 32) (_ BitVec 32) V!17887 V!17887 (_ BitVec 32) Int) ListLongMap!7215)

(assert (=> b!463516 (= lt!209402 (getCurrentListMapNoExtraKeys!1803 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209401 () ListLongMap!7215)

(declare-fun minValueBefore!38 () V!17887)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!463516 (= lt!209401 (getCurrentListMapNoExtraKeys!1803 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!20557 () Bool)

(declare-fun mapRes!20557 () Bool)

(assert (=> mapIsEmpty!20557 mapRes!20557))

(declare-fun b!463517 () Bool)

(declare-fun e!270642 () Bool)

(declare-fun e!270640 () Bool)

(assert (=> b!463517 (= e!270642 (and e!270640 mapRes!20557))))

(declare-fun condMapEmpty!20557 () Bool)

(declare-fun mapDefault!20557 () ValueCell!5950)

