; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41772 () Bool)

(assert start!41772)

(declare-fun b_free!11393 () Bool)

(declare-fun b_next!11393 () Bool)

(assert (=> start!41772 (= b_free!11393 (not b_next!11393))))

(declare-fun tp!40186 () Bool)

(declare-fun b_and!19761 () Bool)

(assert (=> start!41772 (= tp!40186 b_and!19761)))

(declare-fun mapIsEmpty!20917 () Bool)

(declare-fun mapRes!20917 () Bool)

(assert (=> mapIsEmpty!20917 mapRes!20917))

(declare-fun b!466434 () Bool)

(declare-fun res!278803 () Bool)

(declare-fun e!272722 () Bool)

(assert (=> b!466434 (=> (not res!278803) (not e!272722))))

(declare-datatypes ((array!29425 0))(
  ( (array!29426 (arr!14141 (Array (_ BitVec 32) (_ BitVec 64))) (size!14493 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29425)

(declare-datatypes ((List!8555 0))(
  ( (Nil!8552) (Cons!8551 (h!9407 (_ BitVec 64)) (t!14507 List!8555)) )
))
(declare-fun arrayNoDuplicates!0 (array!29425 (_ BitVec 32) List!8555) Bool)

(assert (=> b!466434 (= res!278803 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8552))))

(declare-fun b!466435 () Bool)

(declare-fun e!272721 () Bool)

(assert (=> b!466435 (= e!272721 true)))

(declare-datatypes ((V!18199 0))(
  ( (V!18200 (val!6455 Int)) )
))
(declare-fun zeroValue!794 () V!18199)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6067 0))(
  ( (ValueCellFull!6067 (v!8743 V!18199)) (EmptyCell!6067) )
))
(declare-datatypes ((array!29427 0))(
  ( (array!29428 (arr!14142 (Array (_ BitVec 32) ValueCell!6067)) (size!14494 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29427)

(declare-fun minValueAfter!38 () V!18199)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-datatypes ((tuple2!8464 0))(
  ( (tuple2!8465 (_1!4243 (_ BitVec 64)) (_2!4243 V!18199)) )
))
(declare-datatypes ((List!8556 0))(
  ( (Nil!8553) (Cons!8552 (h!9408 tuple2!8464) (t!14508 List!8556)) )
))
(declare-datatypes ((ListLongMap!7377 0))(
  ( (ListLongMap!7378 (toList!3704 List!8556)) )
))
(declare-fun lt!210791 () ListLongMap!7377)

(declare-fun getCurrentListMap!2154 (array!29425 array!29427 (_ BitVec 32) (_ BitVec 32) V!18199 V!18199 (_ BitVec 32) Int) ListLongMap!7377)

(assert (=> b!466435 (= lt!210791 (getCurrentListMap!2154 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18199)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun lt!210789 () ListLongMap!7377)

(declare-fun +!1660 (ListLongMap!7377 tuple2!8464) ListLongMap!7377)

(assert (=> b!466435 (= lt!210789 (+!1660 (getCurrentListMap!2154 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8465 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466436 () Bool)

(declare-fun e!272724 () Bool)

(declare-fun tp_is_empty!12821 () Bool)

(assert (=> b!466436 (= e!272724 tp_is_empty!12821)))

(declare-fun b!466437 () Bool)

(assert (=> b!466437 (= e!272722 (not e!272721))))

(declare-fun res!278800 () Bool)

(assert (=> b!466437 (=> res!278800 e!272721)))

(assert (=> b!466437 (= res!278800 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!210788 () ListLongMap!7377)

(declare-fun lt!210792 () ListLongMap!7377)

(assert (=> b!466437 (= lt!210788 lt!210792)))

(declare-datatypes ((Unit!13572 0))(
  ( (Unit!13573) )
))
(declare-fun lt!210790 () Unit!13572)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!61 (array!29425 array!29427 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18199 V!18199 V!18199 V!18199 (_ BitVec 32) Int) Unit!13572)

(assert (=> b!466437 (= lt!210790 (lemmaNoChangeToArrayThenSameMapNoExtras!61 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1881 (array!29425 array!29427 (_ BitVec 32) (_ BitVec 32) V!18199 V!18199 (_ BitVec 32) Int) ListLongMap!7377)

(assert (=> b!466437 (= lt!210792 (getCurrentListMapNoExtraKeys!1881 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!466437 (= lt!210788 (getCurrentListMapNoExtraKeys!1881 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!466438 () Bool)

(declare-fun e!272720 () Bool)

(assert (=> b!466438 (= e!272720 tp_is_empty!12821)))

(declare-fun b!466439 () Bool)

(declare-fun e!272723 () Bool)

(assert (=> b!466439 (= e!272723 (and e!272720 mapRes!20917))))

(declare-fun condMapEmpty!20917 () Bool)

(declare-fun mapDefault!20917 () ValueCell!6067)

