; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106054 () Bool)

(assert start!106054)

(declare-fun b_free!27487 () Bool)

(declare-fun b_next!27487 () Bool)

(assert (=> start!106054 (= b_free!27487 (not b_next!27487))))

(declare-fun tp!96010 () Bool)

(declare-fun b_and!45461 () Bool)

(assert (=> start!106054 (= tp!96010 b_and!45461)))

(declare-fun b!1262898 () Bool)

(declare-fun e!718934 () Bool)

(declare-fun e!718933 () Bool)

(assert (=> b!1262898 (= e!718934 (not e!718933))))

(declare-fun res!841284 () Bool)

(assert (=> b!1262898 (=> res!841284 e!718933)))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(assert (=> b!1262898 (= res!841284 (or (not (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!48551 0))(
  ( (V!48552 (val!16257 Int)) )
))
(declare-datatypes ((tuple2!21042 0))(
  ( (tuple2!21043 (_1!10532 (_ BitVec 64)) (_2!10532 V!48551)) )
))
(declare-datatypes ((List!28235 0))(
  ( (Nil!28232) (Cons!28231 (h!29440 tuple2!21042) (t!41746 List!28235)) )
))
(declare-datatypes ((ListLongMap!18915 0))(
  ( (ListLongMap!18916 (toList!9473 List!28235)) )
))
(declare-fun lt!572594 () ListLongMap!18915)

(declare-fun lt!572592 () ListLongMap!18915)

(assert (=> b!1262898 (= lt!572594 lt!572592)))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun defaultEntry!922 () Int)

(declare-fun minValueAfter!43 () V!48551)

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!82398 0))(
  ( (array!82399 (arr!39746 (Array (_ BitVec 32) (_ BitVec 64))) (size!40282 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!82398)

(declare-datatypes ((ValueCell!15431 0))(
  ( (ValueCellFull!15431 (v!18966 V!48551)) (EmptyCell!15431) )
))
(declare-datatypes ((array!82400 0))(
  ( (array!82401 (arr!39747 (Array (_ BitVec 32) ValueCell!15431)) (size!40283 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!82400)

(declare-fun minValueBefore!43 () V!48551)

(declare-fun zeroValue!871 () V!48551)

(declare-datatypes ((Unit!42095 0))(
  ( (Unit!42096) )
))
(declare-fun lt!572590 () Unit!42095)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1181 (array!82398 array!82400 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48551 V!48551 V!48551 V!48551 (_ BitVec 32) Int) Unit!42095)

(assert (=> b!1262898 (= lt!572590 (lemmaNoChangeToArrayThenSameMapNoExtras!1181 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 extraKeysAfter!63 zeroValue!871 zeroValue!871 minValueBefore!43 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun getCurrentListMapNoExtraKeys!5839 (array!82398 array!82400 (_ BitVec 32) (_ BitVec 32) V!48551 V!48551 (_ BitVec 32) Int) ListLongMap!18915)

(assert (=> b!1262898 (= lt!572592 (getCurrentListMapNoExtraKeys!5839 _keys!1118 _values!914 mask!1466 extraKeysAfter!63 zeroValue!871 minValueAfter!43 #b00000000000000000000000000000000 defaultEntry!922))))

(assert (=> b!1262898 (= lt!572594 (getCurrentListMapNoExtraKeys!5839 _keys!1118 _values!914 mask!1466 extraKeysBefore!71 zeroValue!871 minValueBefore!43 #b00000000000000000000000000000000 defaultEntry!922))))

(declare-fun b!1262899 () Bool)

(declare-fun res!841285 () Bool)

(assert (=> b!1262899 (=> (not res!841285) (not e!718934))))

(declare-datatypes ((List!28236 0))(
  ( (Nil!28233) (Cons!28232 (h!29441 (_ BitVec 64)) (t!41747 List!28236)) )
))
(declare-fun arrayNoDuplicates!0 (array!82398 (_ BitVec 32) List!28236) Bool)

(assert (=> b!1262899 (= res!841285 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!28233))))

(declare-fun b!1262900 () Bool)

(declare-fun e!718938 () Bool)

(declare-fun e!718937 () Bool)

(declare-fun mapRes!50404 () Bool)

(assert (=> b!1262900 (= e!718938 (and e!718937 mapRes!50404))))

(declare-fun condMapEmpty!50404 () Bool)

(declare-fun mapDefault!50404 () ValueCell!15431)

