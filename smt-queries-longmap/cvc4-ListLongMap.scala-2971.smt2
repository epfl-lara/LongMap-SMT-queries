; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42086 () Bool)

(assert start!42086)

(declare-fun b_free!11639 () Bool)

(declare-fun b_next!11639 () Bool)

(assert (=> start!42086 (= b_free!11639 (not b_next!11639))))

(declare-fun tp!40935 () Bool)

(declare-fun b_and!20049 () Bool)

(assert (=> start!42086 (= tp!40935 b_and!20049)))

(declare-fun b!469901 () Bool)

(declare-fun e!275225 () Bool)

(declare-fun tp_is_empty!13067 () Bool)

(assert (=> b!469901 (= e!275225 tp_is_empty!13067)))

(declare-fun b!469902 () Bool)

(declare-fun e!275224 () Bool)

(declare-fun e!275226 () Bool)

(assert (=> b!469902 (= e!275224 (not e!275226))))

(declare-fun res!280812 () Bool)

(assert (=> b!469902 (=> res!280812 e!275226)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!469902 (= res!280812 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18527 0))(
  ( (V!18528 (val!6578 Int)) )
))
(declare-datatypes ((tuple2!8662 0))(
  ( (tuple2!8663 (_1!4342 (_ BitVec 64)) (_2!4342 V!18527)) )
))
(declare-datatypes ((List!8740 0))(
  ( (Nil!8737) (Cons!8736 (h!9592 tuple2!8662) (t!14700 List!8740)) )
))
(declare-datatypes ((ListLongMap!7575 0))(
  ( (ListLongMap!7576 (toList!3803 List!8740)) )
))
(declare-fun lt!213115 () ListLongMap!7575)

(declare-fun lt!213119 () ListLongMap!7575)

(assert (=> b!469902 (= lt!213115 lt!213119)))

(declare-datatypes ((Unit!13763 0))(
  ( (Unit!13764) )
))
(declare-fun lt!213114 () Unit!13763)

(declare-fun minValueBefore!38 () V!18527)

(declare-fun zeroValue!794 () V!18527)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((array!29905 0))(
  ( (array!29906 (arr!14377 (Array (_ BitVec 32) (_ BitVec 64))) (size!14729 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29905)

(declare-datatypes ((ValueCell!6190 0))(
  ( (ValueCellFull!6190 (v!8868 V!18527)) (EmptyCell!6190) )
))
(declare-datatypes ((array!29907 0))(
  ( (array!29908 (arr!14378 (Array (_ BitVec 32) ValueCell!6190)) (size!14730 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29907)

(declare-fun minValueAfter!38 () V!18527)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!148 (array!29905 array!29907 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18527 V!18527 V!18527 V!18527 (_ BitVec 32) Int) Unit!13763)

(assert (=> b!469902 (= lt!213114 (lemmaNoChangeToArrayThenSameMapNoExtras!148 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1968 (array!29905 array!29907 (_ BitVec 32) (_ BitVec 32) V!18527 V!18527 (_ BitVec 32) Int) ListLongMap!7575)

(assert (=> b!469902 (= lt!213119 (getCurrentListMapNoExtraKeys!1968 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!469902 (= lt!213115 (getCurrentListMapNoExtraKeys!1968 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!469903 () Bool)

(declare-fun e!275228 () Bool)

(declare-fun mapRes!21298 () Bool)

(assert (=> b!469903 (= e!275228 (and e!275225 mapRes!21298))))

(declare-fun condMapEmpty!21298 () Bool)

(declare-fun mapDefault!21298 () ValueCell!6190)

