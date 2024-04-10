; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105984 () Bool)

(assert start!105984)

(declare-fun b_free!27473 () Bool)

(declare-fun b_next!27473 () Bool)

(assert (=> start!105984 (= b_free!27473 (not b_next!27473))))

(declare-fun tp!95960 () Bool)

(declare-fun b_and!45411 () Bool)

(assert (=> start!105984 (= tp!95960 b_and!45411)))

(declare-fun b!1262169 () Bool)

(declare-fun e!718444 () Bool)

(declare-fun e!718448 () Bool)

(assert (=> b!1262169 (= e!718444 (not e!718448))))

(declare-fun res!840930 () Bool)

(assert (=> b!1262169 (=> res!840930 e!718448)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262169 (= res!840930 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48531 0))(
  ( (V!48532 (val!16250 Int)) )
))
(declare-datatypes ((tuple2!21030 0))(
  ( (tuple2!21031 (_1!10526 (_ BitVec 64)) (_2!10526 V!48531)) )
))
(declare-datatypes ((List!28225 0))(
  ( (Nil!28222) (Cons!28221 (h!29430 tuple2!21030) (t!41730 List!28225)) )
))
(declare-datatypes ((ListLongMap!18903 0))(
  ( (ListLongMap!18904 (toList!9467 List!28225)) )
))
(declare-fun lt!572069 () ListLongMap!18903)

(declare-fun lt!572071 () ListLongMap!18903)

(assert (=> b!1262169 (= lt!572069 lt!572071)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-datatypes ((Unit!42076 0))(
  ( (Unit!42077) )
))
(declare-fun lt!572070 () Unit!42076)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-fun zeroValue!871 () V!48531)

(declare-datatypes ((array!82366 0))(
  ( (array!82367 (arr!39733 (Array (_ BitVec 32) (_ BitVec 64))) (size!40269 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82366)

(declare-datatypes ((ValueCell!15424 0))(
  ( (ValueCellFull!15424 (v!18956 V!48531)) (EmptyCell!15424) )
))
(declare-datatypes ((array!82368 0))(
  ( (array!82369 (arr!39734 (Array (_ BitVec 32) ValueCell!15424)) (size!40270 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82368)

(declare-fun minValueBefore!43 () V!48531)

(declare-fun minValueAfter!43 () V!48531)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1175 (array!82366 array!82368 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48531 V!48531 V!48531 V!48531 (_ BitVec 32) Int) Unit!42076)

(assert (=> b!1262169 (= lt!572070 (lemmaNoChangeToArrayThenSameMapNoExtras!1175 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5833 (array!82366 array!82368 (_ BitVec 32) (_ BitVec 32) V!48531 V!48531 (_ BitVec 32) Int) ListLongMap!18903)

(assert (=> b!1262169 (= lt!572071 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262169 (= lt!572069 (getCurrentListMapNoExtraKeys!5833 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262170 () Bool)

(declare-fun e!718447 () Bool)

(declare-fun e!718449 () Bool)

(declare-fun mapRes!50374 () Bool)

(assert (=> b!1262170 (= e!718447 (and e!718449 mapRes!50374))))

(declare-fun condMapEmpty!50374 () Bool)

(declare-fun mapDefault!50374 () ValueCell!15424)

