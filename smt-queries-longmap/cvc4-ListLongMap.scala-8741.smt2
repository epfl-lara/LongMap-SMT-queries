; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106032 () Bool)

(assert start!106032)

(declare-fun b_free!27485 () Bool)

(declare-fun b_next!27485 () Bool)

(assert (=> start!106032 (= b_free!27485 (not b_next!27485))))

(declare-fun tp!96001 () Bool)

(declare-fun b_and!45447 () Bool)

(assert (=> start!106032 (= tp!96001 b_and!45447)))

(declare-fun b!1262689 () Bool)

(declare-fun e!718799 () Bool)

(declare-fun e!718800 () Bool)

(assert (=> b!1262689 (= e!718799 (not e!718800))))

(declare-fun res!841192 () Bool)

(assert (=> b!1262689 (=> res!841192 e!718800)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262689 (= res!841192 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48547 0))(
  ( (V!48548 (val!16256 Int)) )
))
(declare-datatypes ((tuple2!21040 0))(
  ( (tuple2!21041 (_1!10531 (_ BitVec 64)) (_2!10531 V!48547)) )
))
(declare-datatypes ((List!28234 0))(
  ( (Nil!28231) (Cons!28230 (h!29439 tuple2!21040) (t!41743 List!28234)) )
))
(declare-datatypes ((ListLongMap!18913 0))(
  ( (ListLongMap!18914 (toList!9472 List!28234)) )
))
(declare-fun lt!572422 () ListLongMap!18913)

(declare-fun lt!572423 () ListLongMap!18913)

(assert (=> b!1262689 (= lt!572422 lt!572423)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48547)

(declare-datatypes ((Unit!42090 0))(
  ( (Unit!42091) )
))
(declare-fun lt!572419 () Unit!42090)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48547)

(declare-datatypes ((array!82392 0))(
  ( (array!82393 (arr!39744 (Array (_ BitVec 32) (_ BitVec 64))) (size!40280 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82392)

(declare-datatypes ((ValueCell!15430 0))(
  ( (ValueCellFull!15430 (v!18964 V!48547)) (EmptyCell!15430) )
))
(declare-datatypes ((array!82394 0))(
  ( (array!82395 (arr!39745 (Array (_ BitVec 32) ValueCell!15430)) (size!40281 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82394)

(declare-fun minValueBefore!43 () V!48547)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1180 (array!82392 array!82394 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48547 V!48547 V!48547 V!48547 (_ BitVec 32) Int) Unit!42090)

(assert (=> b!1262689 (= lt!572419 (lemmaNoChangeToArrayThenSameMapNoExtras!1180 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5838 (array!82392 array!82394 (_ BitVec 32) (_ BitVec 32) V!48547 V!48547 (_ BitVec 32) Int) ListLongMap!18913)

(assert (=> b!1262689 (= lt!572423 (getCurrentListMapNoExtraKeys!5838 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262689 (= lt!572422 (getCurrentListMapNoExtraKeys!5838 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262690 () Bool)

(declare-fun e!718804 () Bool)

(declare-fun e!718801 () Bool)

(declare-fun mapRes!50398 () Bool)

(assert (=> b!1262690 (= e!718804 (and e!718801 mapRes!50398))))

(declare-fun condMapEmpty!50398 () Bool)

(declare-fun mapDefault!50398 () ValueCell!15430)

