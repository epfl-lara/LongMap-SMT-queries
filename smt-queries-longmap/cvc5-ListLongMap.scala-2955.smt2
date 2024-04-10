; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41966 () Bool)

(assert start!41966)

(declare-fun b_free!11539 () Bool)

(declare-fun b_next!11539 () Bool)

(assert (=> start!41966 (= b_free!11539 (not b_next!11539))))

(declare-fun tp!40633 () Bool)

(declare-fun b_and!19937 () Bool)

(assert (=> start!41966 (= tp!40633 b_and!19937)))

(declare-fun mapIsEmpty!21145 () Bool)

(declare-fun mapRes!21145 () Bool)

(assert (=> mapIsEmpty!21145 mapRes!21145))

(declare-fun b!468522 () Bool)

(declare-fun e!274213 () Bool)

(declare-fun tp_is_empty!12967 () Bool)

(assert (=> b!468522 (= e!274213 tp_is_empty!12967)))

(declare-fun b!468524 () Bool)

(declare-fun res!279988 () Bool)

(declare-fun e!274214 () Bool)

(assert (=> b!468524 (=> (not res!279988) (not e!274214))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29711 0))(
  ( (array!29712 (arr!14281 (Array (_ BitVec 32) (_ BitVec 64))) (size!14633 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29711)

(declare-datatypes ((V!18395 0))(
  ( (V!18396 (val!6528 Int)) )
))
(declare-datatypes ((ValueCell!6140 0))(
  ( (ValueCellFull!6140 (v!8817 V!18395)) (EmptyCell!6140) )
))
(declare-datatypes ((array!29713 0))(
  ( (array!29714 (arr!14282 (Array (_ BitVec 32) ValueCell!6140)) (size!14634 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29713)

(assert (=> b!468524 (= res!279988 (and (= (size!14634 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14633 _keys!1025) (size!14634 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468525 () Bool)

(declare-fun e!274212 () Bool)

(assert (=> b!468525 (= e!274212 tp_is_empty!12967)))

(declare-fun b!468526 () Bool)

(declare-fun e!274215 () Bool)

(assert (=> b!468526 (= e!274214 (not e!274215))))

(declare-fun res!279986 () Bool)

(assert (=> b!468526 (=> res!279986 e!274215)))

(assert (=> b!468526 (= res!279986 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8580 0))(
  ( (tuple2!8581 (_1!4301 (_ BitVec 64)) (_2!4301 V!18395)) )
))
(declare-datatypes ((List!8667 0))(
  ( (Nil!8664) (Cons!8663 (h!9519 tuple2!8580) (t!14625 List!8667)) )
))
(declare-datatypes ((ListLongMap!7493 0))(
  ( (ListLongMap!7494 (toList!3762 List!8667)) )
))
(declare-fun lt!211917 () ListLongMap!7493)

(declare-fun lt!211914 () ListLongMap!7493)

(assert (=> b!468526 (= lt!211917 lt!211914)))

(declare-fun minValueBefore!38 () V!18395)

(declare-fun zeroValue!794 () V!18395)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13679 0))(
  ( (Unit!13680) )
))
(declare-fun lt!211916 () Unit!13679)

(declare-fun minValueAfter!38 () V!18395)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!113 (array!29711 array!29713 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18395 V!18395 V!18395 V!18395 (_ BitVec 32) Int) Unit!13679)

(assert (=> b!468526 (= lt!211916 (lemmaNoChangeToArrayThenSameMapNoExtras!113 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1933 (array!29711 array!29713 (_ BitVec 32) (_ BitVec 32) V!18395 V!18395 (_ BitVec 32) Int) ListLongMap!7493)

(assert (=> b!468526 (= lt!211914 (getCurrentListMapNoExtraKeys!1933 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468526 (= lt!211917 (getCurrentListMapNoExtraKeys!1933 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468527 () Bool)

(declare-fun e!274216 () Bool)

(assert (=> b!468527 (= e!274216 (and e!274213 mapRes!21145))))

(declare-fun condMapEmpty!21145 () Bool)

(declare-fun mapDefault!21145 () ValueCell!6140)

