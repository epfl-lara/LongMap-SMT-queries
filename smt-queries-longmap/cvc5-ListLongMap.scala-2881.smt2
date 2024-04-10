; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41416 () Bool)

(assert start!41416)

(declare-fun b_free!11095 () Bool)

(declare-fun b_next!11095 () Bool)

(assert (=> start!41416 (= b_free!11095 (not b_next!11095))))

(declare-fun tp!39279 () Bool)

(declare-fun b_and!19431 () Bool)

(assert (=> start!41416 (= tp!39279 b_and!19431)))

(declare-fun b!462771 () Bool)

(declare-fun res!276734 () Bool)

(declare-fun e!270114 () Bool)

(assert (=> b!462771 (=> (not res!276734) (not e!270114))))

(declare-datatypes ((array!28847 0))(
  ( (array!28848 (arr!13856 (Array (_ BitVec 32) (_ BitVec 64))) (size!14208 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28847)

(declare-datatypes ((List!8353 0))(
  ( (Nil!8350) (Cons!8349 (h!9205 (_ BitVec 64)) (t!14297 List!8353)) )
))
(declare-fun arrayNoDuplicates!0 (array!28847 (_ BitVec 32) List!8353) Bool)

(assert (=> b!462771 (= res!276734 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8350))))

(declare-fun mapNonEmpty!20458 () Bool)

(declare-fun mapRes!20458 () Bool)

(declare-fun tp!39280 () Bool)

(declare-fun e!270113 () Bool)

(assert (=> mapNonEmpty!20458 (= mapRes!20458 (and tp!39280 e!270113))))

(declare-datatypes ((V!17803 0))(
  ( (V!17804 (val!6306 Int)) )
))
(declare-datatypes ((ValueCell!5918 0))(
  ( (ValueCellFull!5918 (v!8593 V!17803)) (EmptyCell!5918) )
))
(declare-fun mapValue!20458 () ValueCell!5918)

(declare-datatypes ((array!28849 0))(
  ( (array!28850 (arr!13857 (Array (_ BitVec 32) ValueCell!5918)) (size!14209 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28849)

(declare-fun mapRest!20458 () (Array (_ BitVec 32) ValueCell!5918))

(declare-fun mapKey!20458 () (_ BitVec 32))

(assert (=> mapNonEmpty!20458 (= (arr!13857 _values!833) (store mapRest!20458 mapKey!20458 mapValue!20458))))

(declare-fun b!462772 () Bool)

(declare-fun tp_is_empty!12523 () Bool)

(assert (=> b!462772 (= e!270113 tp_is_empty!12523)))

(declare-fun b!462773 () Bool)

(declare-fun e!270111 () Bool)

(assert (=> b!462773 (= e!270111 tp_is_empty!12523)))

(declare-fun b!462774 () Bool)

(declare-fun res!276735 () Bool)

(assert (=> b!462774 (=> (not res!276735) (not e!270114))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462774 (= res!276735 (and (= (size!14209 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14208 _keys!1025) (size!14209 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462775 () Bool)

(assert (=> b!462775 (= e!270114 false)))

(declare-fun minValueBefore!38 () V!17803)

(declare-fun zeroValue!794 () V!17803)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8260 0))(
  ( (tuple2!8261 (_1!4141 (_ BitVec 64)) (_2!4141 V!17803)) )
))
(declare-datatypes ((List!8354 0))(
  ( (Nil!8351) (Cons!8350 (h!9206 tuple2!8260) (t!14298 List!8354)) )
))
(declare-datatypes ((ListLongMap!7173 0))(
  ( (ListLongMap!7174 (toList!3602 List!8354)) )
))
(declare-fun lt!209258 () ListLongMap!7173)

(declare-fun getCurrentListMapNoExtraKeys!1782 (array!28847 array!28849 (_ BitVec 32) (_ BitVec 32) V!17803 V!17803 (_ BitVec 32) Int) ListLongMap!7173)

(assert (=> b!462775 (= lt!209258 (getCurrentListMapNoExtraKeys!1782 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!462776 () Bool)

(declare-fun e!270112 () Bool)

(assert (=> b!462776 (= e!270112 (and e!270111 mapRes!20458))))

(declare-fun condMapEmpty!20458 () Bool)

(declare-fun mapDefault!20458 () ValueCell!5918)

