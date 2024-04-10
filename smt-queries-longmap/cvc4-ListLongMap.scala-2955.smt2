; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41970 () Bool)

(assert start!41970)

(declare-fun b_free!11543 () Bool)

(declare-fun b_next!11543 () Bool)

(assert (=> start!41970 (= b_free!11543 (not b_next!11543))))

(declare-fun tp!40644 () Bool)

(declare-fun b_and!19941 () Bool)

(assert (=> start!41970 (= tp!40644 b_and!19941)))

(declare-fun mapNonEmpty!21151 () Bool)

(declare-fun mapRes!21151 () Bool)

(declare-fun tp!40645 () Bool)

(declare-fun e!274249 () Bool)

(assert (=> mapNonEmpty!21151 (= mapRes!21151 (and tp!40645 e!274249))))

(declare-datatypes ((V!18399 0))(
  ( (V!18400 (val!6530 Int)) )
))
(declare-datatypes ((ValueCell!6142 0))(
  ( (ValueCellFull!6142 (v!8819 V!18399)) (EmptyCell!6142) )
))
(declare-fun mapValue!21151 () ValueCell!6142)

(declare-datatypes ((array!29719 0))(
  ( (array!29720 (arr!14285 (Array (_ BitVec 32) ValueCell!6142)) (size!14637 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29719)

(declare-fun mapKey!21151 () (_ BitVec 32))

(declare-fun mapRest!21151 () (Array (_ BitVec 32) ValueCell!6142))

(assert (=> mapNonEmpty!21151 (= (arr!14285 _values!833) (store mapRest!21151 mapKey!21151 mapValue!21151))))

(declare-fun b!468571 () Bool)

(declare-fun e!274253 () Bool)

(assert (=> b!468571 (= e!274253 true)))

(declare-datatypes ((tuple2!8584 0))(
  ( (tuple2!8585 (_1!4303 (_ BitVec 64)) (_2!4303 V!18399)) )
))
(declare-datatypes ((List!8670 0))(
  ( (Nil!8667) (Cons!8666 (h!9522 tuple2!8584) (t!14628 List!8670)) )
))
(declare-datatypes ((ListLongMap!7497 0))(
  ( (ListLongMap!7498 (toList!3764 List!8670)) )
))
(declare-fun lt!211959 () ListLongMap!7497)

(declare-fun lt!211960 () tuple2!8584)

(declare-fun minValueBefore!38 () V!18399)

(declare-fun +!1676 (ListLongMap!7497 tuple2!8584) ListLongMap!7497)

(assert (=> b!468571 (= (+!1676 lt!211959 lt!211960) (+!1676 (+!1676 lt!211959 (tuple2!8585 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211960))))

(declare-fun minValueAfter!38 () V!18399)

(assert (=> b!468571 (= lt!211960 (tuple2!8585 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-datatypes ((Unit!13683 0))(
  ( (Unit!13684) )
))
(declare-fun lt!211956 () Unit!13683)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!89 (ListLongMap!7497 (_ BitVec 64) V!18399 V!18399) Unit!13683)

(assert (=> b!468571 (= lt!211956 (addSameAsAddTwiceSameKeyDiffValues!89 lt!211959 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun zeroValue!794 () V!18399)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29721 0))(
  ( (array!29722 (arr!14286 (Array (_ BitVec 32) (_ BitVec 64))) (size!14638 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29721)

(declare-fun lt!211958 () ListLongMap!7497)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMap!2190 (array!29721 array!29719 (_ BitVec 32) (_ BitVec 32) V!18399 V!18399 (_ BitVec 32) Int) ListLongMap!7497)

(assert (=> b!468571 (= lt!211958 (getCurrentListMap!2190 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211957 () ListLongMap!7497)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468571 (= lt!211957 (getCurrentListMap!2190 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468572 () Bool)

(declare-fun e!274248 () Bool)

(declare-fun e!274250 () Bool)

(assert (=> b!468572 (= e!274248 (and e!274250 mapRes!21151))))

(declare-fun condMapEmpty!21151 () Bool)

(declare-fun mapDefault!21151 () ValueCell!6142)

