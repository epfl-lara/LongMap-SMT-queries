; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41462 () Bool)

(assert start!41462)

(declare-fun b_free!11141 () Bool)

(declare-fun b_next!11141 () Bool)

(assert (=> start!41462 (= b_free!11141 (not b_next!11141))))

(declare-fun tp!39418 () Bool)

(declare-fun b_and!19477 () Bool)

(assert (=> start!41462 (= tp!39418 b_and!19477)))

(declare-fun b!463254 () Bool)

(declare-fun res!277013 () Bool)

(declare-fun e!270456 () Bool)

(assert (=> b!463254 (=> (not res!277013) (not e!270456))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28933 0))(
  ( (array!28934 (arr!13899 (Array (_ BitVec 32) (_ BitVec 64))) (size!14251 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28933)

(declare-datatypes ((V!17863 0))(
  ( (V!17864 (val!6329 Int)) )
))
(declare-datatypes ((ValueCell!5941 0))(
  ( (ValueCellFull!5941 (v!8616 V!17863)) (EmptyCell!5941) )
))
(declare-datatypes ((array!28935 0))(
  ( (array!28936 (arr!13900 (Array (_ BitVec 32) ValueCell!5941)) (size!14252 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28935)

(assert (=> b!463254 (= res!277013 (and (= (size!14252 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14251 _keys!1025) (size!14252 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463256 () Bool)

(declare-fun res!277010 () Bool)

(assert (=> b!463256 (=> (not res!277010) (not e!270456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28933 (_ BitVec 32)) Bool)

(assert (=> b!463256 (= res!277010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!463257 () Bool)

(declare-fun res!277012 () Bool)

(assert (=> b!463257 (=> (not res!277012) (not e!270456))))

(declare-datatypes ((List!8382 0))(
  ( (Nil!8379) (Cons!8378 (h!9234 (_ BitVec 64)) (t!14326 List!8382)) )
))
(declare-fun arrayNoDuplicates!0 (array!28933 (_ BitVec 32) List!8382) Bool)

(assert (=> b!463257 (= res!277012 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8379))))

(declare-fun mapNonEmpty!20527 () Bool)

(declare-fun mapRes!20527 () Bool)

(declare-fun tp!39417 () Bool)

(declare-fun e!270457 () Bool)

(assert (=> mapNonEmpty!20527 (= mapRes!20527 (and tp!39417 e!270457))))

(declare-fun mapRest!20527 () (Array (_ BitVec 32) ValueCell!5941))

(declare-fun mapValue!20527 () ValueCell!5941)

(declare-fun mapKey!20527 () (_ BitVec 32))

(assert (=> mapNonEmpty!20527 (= (arr!13900 _values!833) (store mapRest!20527 mapKey!20527 mapValue!20527))))

(declare-fun b!463258 () Bool)

(declare-fun tp_is_empty!12569 () Bool)

(assert (=> b!463258 (= e!270457 tp_is_empty!12569)))

(declare-fun mapIsEmpty!20527 () Bool)

(assert (=> mapIsEmpty!20527 mapRes!20527))

(declare-fun res!277011 () Bool)

(assert (=> start!41462 (=> (not res!277011) (not e!270456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41462 (= res!277011 (validMask!0 mask!1365))))

(assert (=> start!41462 e!270456))

(assert (=> start!41462 tp_is_empty!12569))

(assert (=> start!41462 tp!39418))

(assert (=> start!41462 true))

(declare-fun array_inv!10048 (array!28933) Bool)

(assert (=> start!41462 (array_inv!10048 _keys!1025)))

(declare-fun e!270455 () Bool)

(declare-fun array_inv!10049 (array!28935) Bool)

(assert (=> start!41462 (and (array_inv!10049 _values!833) e!270455)))

(declare-fun b!463255 () Bool)

(assert (=> b!463255 (= e!270456 false)))

(declare-datatypes ((tuple2!8288 0))(
  ( (tuple2!8289 (_1!4155 (_ BitVec 64)) (_2!4155 V!17863)) )
))
(declare-datatypes ((List!8383 0))(
  ( (Nil!8380) (Cons!8379 (h!9235 tuple2!8288) (t!14327 List!8383)) )
))
(declare-datatypes ((ListLongMap!7201 0))(
  ( (ListLongMap!7202 (toList!3616 List!8383)) )
))
(declare-fun lt!209327 () ListLongMap!7201)

(declare-fun minValueBefore!38 () V!17863)

(declare-fun zeroValue!794 () V!17863)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1796 (array!28933 array!28935 (_ BitVec 32) (_ BitVec 32) V!17863 V!17863 (_ BitVec 32) Int) ListLongMap!7201)

(assert (=> b!463255 (= lt!209327 (getCurrentListMapNoExtraKeys!1796 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463259 () Bool)

(declare-fun e!270458 () Bool)

(assert (=> b!463259 (= e!270458 tp_is_empty!12569)))

(declare-fun b!463260 () Bool)

(assert (=> b!463260 (= e!270455 (and e!270458 mapRes!20527))))

(declare-fun condMapEmpty!20527 () Bool)

(declare-fun mapDefault!20527 () ValueCell!5941)

