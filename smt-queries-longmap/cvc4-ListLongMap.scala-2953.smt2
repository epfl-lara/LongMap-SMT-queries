; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41942 () Bool)

(assert start!41942)

(declare-fun b_free!11531 () Bool)

(declare-fun b_next!11531 () Bool)

(assert (=> start!41942 (= b_free!11531 (not b_next!11531))))

(declare-fun tp!40605 () Bool)

(declare-fun b_and!19919 () Bool)

(assert (=> start!41942 (= tp!40605 b_and!19919)))

(declare-fun b!468278 () Bool)

(declare-fun e!274050 () Bool)

(declare-fun e!274049 () Bool)

(assert (=> b!468278 (= e!274050 (not e!274049))))

(declare-fun res!279870 () Bool)

(assert (=> b!468278 (=> res!279870 e!274049)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468278 (= res!279870 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!18383 0))(
  ( (V!18384 (val!6524 Int)) )
))
(declare-datatypes ((tuple2!8572 0))(
  ( (tuple2!8573 (_1!4297 (_ BitVec 64)) (_2!4297 V!18383)) )
))
(declare-datatypes ((List!8660 0))(
  ( (Nil!8657) (Cons!8656 (h!9512 tuple2!8572) (t!14616 List!8660)) )
))
(declare-datatypes ((ListLongMap!7485 0))(
  ( (ListLongMap!7486 (toList!3758 List!8660)) )
))
(declare-fun lt!211752 () ListLongMap!7485)

(declare-fun lt!211754 () ListLongMap!7485)

(assert (=> b!468278 (= lt!211752 lt!211754)))

(declare-fun minValueBefore!38 () V!18383)

(declare-fun zeroValue!794 () V!18383)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13672 0))(
  ( (Unit!13673) )
))
(declare-fun lt!211753 () Unit!13672)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29693 0))(
  ( (array!29694 (arr!14273 (Array (_ BitVec 32) (_ BitVec 64))) (size!14625 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29693)

(declare-datatypes ((ValueCell!6136 0))(
  ( (ValueCellFull!6136 (v!8813 V!18383)) (EmptyCell!6136) )
))
(declare-datatypes ((array!29695 0))(
  ( (array!29696 (arr!14274 (Array (_ BitVec 32) ValueCell!6136)) (size!14626 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29695)

(declare-fun minValueAfter!38 () V!18383)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!110 (array!29693 array!29695 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18383 V!18383 V!18383 V!18383 (_ BitVec 32) Int) Unit!13672)

(assert (=> b!468278 (= lt!211753 (lemmaNoChangeToArrayThenSameMapNoExtras!110 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1930 (array!29693 array!29695 (_ BitVec 32) (_ BitVec 32) V!18383 V!18383 (_ BitVec 32) Int) ListLongMap!7485)

(assert (=> b!468278 (= lt!211754 (getCurrentListMapNoExtraKeys!1930 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468278 (= lt!211752 (getCurrentListMapNoExtraKeys!1930 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468279 () Bool)

(declare-fun res!279869 () Bool)

(assert (=> b!468279 (=> (not res!279869) (not e!274050))))

(assert (=> b!468279 (= res!279869 (and (= (size!14626 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14625 _keys!1025) (size!14626 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468280 () Bool)

(declare-fun e!274046 () Bool)

(declare-fun e!274048 () Bool)

(declare-fun mapRes!21130 () Bool)

(assert (=> b!468280 (= e!274046 (and e!274048 mapRes!21130))))

(declare-fun condMapEmpty!21130 () Bool)

(declare-fun mapDefault!21130 () ValueCell!6136)

