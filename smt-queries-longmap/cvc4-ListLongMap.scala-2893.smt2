; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41504 () Bool)

(assert start!41504)

(declare-fun b_free!11171 () Bool)

(declare-fun b_next!11171 () Bool)

(assert (=> start!41504 (= b_free!11171 (not b_next!11171))))

(declare-fun tp!39510 () Bool)

(declare-fun b_and!19511 () Bool)

(assert (=> start!41504 (= tp!39510 b_and!19511)))

(declare-fun b!463642 () Bool)

(declare-fun e!270732 () Bool)

(assert (=> b!463642 (= e!270732 false)))

(declare-datatypes ((V!17903 0))(
  ( (V!17904 (val!6344 Int)) )
))
(declare-fun zeroValue!794 () V!17903)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8310 0))(
  ( (tuple2!8311 (_1!4166 (_ BitVec 64)) (_2!4166 V!17903)) )
))
(declare-datatypes ((List!8403 0))(
  ( (Nil!8400) (Cons!8399 (h!9255 tuple2!8310) (t!14349 List!8403)) )
))
(declare-datatypes ((ListLongMap!7223 0))(
  ( (ListLongMap!7224 (toList!3627 List!8403)) )
))
(declare-fun lt!209437 () ListLongMap!7223)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28991 0))(
  ( (array!28992 (arr!13927 (Array (_ BitVec 32) (_ BitVec 64))) (size!14279 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28991)

(declare-datatypes ((ValueCell!5956 0))(
  ( (ValueCellFull!5956 (v!8631 V!17903)) (EmptyCell!5956) )
))
(declare-datatypes ((array!28993 0))(
  ( (array!28994 (arr!13928 (Array (_ BitVec 32) ValueCell!5956)) (size!14280 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28993)

(declare-fun minValueAfter!38 () V!17903)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1807 (array!28991 array!28993 (_ BitVec 32) (_ BitVec 32) V!17903 V!17903 (_ BitVec 32) Int) ListLongMap!7223)

(assert (=> b!463642 (= lt!209437 (getCurrentListMapNoExtraKeys!1807 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17903)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!209438 () ListLongMap!7223)

(assert (=> b!463642 (= lt!209438 (getCurrentListMapNoExtraKeys!1807 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!277219 () Bool)

(assert (=> start!41504 (=> (not res!277219) (not e!270732))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41504 (= res!277219 (validMask!0 mask!1365))))

(assert (=> start!41504 e!270732))

(declare-fun tp_is_empty!12599 () Bool)

(assert (=> start!41504 tp_is_empty!12599))

(assert (=> start!41504 tp!39510))

(assert (=> start!41504 true))

(declare-fun array_inv!10066 (array!28991) Bool)

(assert (=> start!41504 (array_inv!10066 _keys!1025)))

(declare-fun e!270728 () Bool)

(declare-fun array_inv!10067 (array!28993) Bool)

(assert (=> start!41504 (and (array_inv!10067 _values!833) e!270728)))

(declare-fun b!463643 () Bool)

(declare-fun res!277220 () Bool)

(assert (=> b!463643 (=> (not res!277220) (not e!270732))))

(assert (=> b!463643 (= res!277220 (and (= (size!14280 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14279 _keys!1025) (size!14280 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463644 () Bool)

(declare-fun res!277217 () Bool)

(assert (=> b!463644 (=> (not res!277217) (not e!270732))))

(declare-datatypes ((List!8404 0))(
  ( (Nil!8401) (Cons!8400 (h!9256 (_ BitVec 64)) (t!14350 List!8404)) )
))
(declare-fun arrayNoDuplicates!0 (array!28991 (_ BitVec 32) List!8404) Bool)

(assert (=> b!463644 (= res!277217 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8401))))

(declare-fun b!463645 () Bool)

(declare-fun e!270729 () Bool)

(assert (=> b!463645 (= e!270729 tp_is_empty!12599)))

(declare-fun mapNonEmpty!20575 () Bool)

(declare-fun mapRes!20575 () Bool)

(declare-fun tp!39511 () Bool)

(declare-fun e!270731 () Bool)

(assert (=> mapNonEmpty!20575 (= mapRes!20575 (and tp!39511 e!270731))))

(declare-fun mapRest!20575 () (Array (_ BitVec 32) ValueCell!5956))

(declare-fun mapKey!20575 () (_ BitVec 32))

(declare-fun mapValue!20575 () ValueCell!5956)

(assert (=> mapNonEmpty!20575 (= (arr!13928 _values!833) (store mapRest!20575 mapKey!20575 mapValue!20575))))

(declare-fun b!463646 () Bool)

(assert (=> b!463646 (= e!270728 (and e!270729 mapRes!20575))))

(declare-fun condMapEmpty!20575 () Bool)

(declare-fun mapDefault!20575 () ValueCell!5956)

