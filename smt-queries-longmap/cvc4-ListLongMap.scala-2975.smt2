; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42130 () Bool)

(assert start!42130)

(declare-fun b_free!11663 () Bool)

(declare-fun b_next!11663 () Bool)

(assert (=> start!42130 (= b_free!11663 (not b_next!11663))))

(declare-fun tp!41011 () Bool)

(declare-fun b_and!20085 () Bool)

(assert (=> start!42130 (= tp!41011 b_and!20085)))

(declare-fun b!470342 () Bool)

(declare-fun res!281044 () Bool)

(declare-fun e!275530 () Bool)

(assert (=> b!470342 (=> (not res!281044) (not e!275530))))

(declare-datatypes ((array!29953 0))(
  ( (array!29954 (arr!14400 (Array (_ BitVec 32) (_ BitVec 64))) (size!14752 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29953)

(declare-datatypes ((List!8758 0))(
  ( (Nil!8755) (Cons!8754 (h!9610 (_ BitVec 64)) (t!14720 List!8758)) )
))
(declare-fun arrayNoDuplicates!0 (array!29953 (_ BitVec 32) List!8758) Bool)

(assert (=> b!470342 (= res!281044 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8755))))

(declare-fun res!281046 () Bool)

(assert (=> start!42130 (=> (not res!281046) (not e!275530))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42130 (= res!281046 (validMask!0 mask!1365))))

(assert (=> start!42130 e!275530))

(declare-fun tp_is_empty!13091 () Bool)

(assert (=> start!42130 tp_is_empty!13091))

(assert (=> start!42130 tp!41011))

(assert (=> start!42130 true))

(declare-fun array_inv!10390 (array!29953) Bool)

(assert (=> start!42130 (array_inv!10390 _keys!1025)))

(declare-datatypes ((V!18559 0))(
  ( (V!18560 (val!6590 Int)) )
))
(declare-datatypes ((ValueCell!6202 0))(
  ( (ValueCellFull!6202 (v!8881 V!18559)) (EmptyCell!6202) )
))
(declare-datatypes ((array!29955 0))(
  ( (array!29956 (arr!14401 (Array (_ BitVec 32) ValueCell!6202)) (size!14753 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29955)

(declare-fun e!275529 () Bool)

(declare-fun array_inv!10391 (array!29955) Bool)

(assert (=> start!42130 (and (array_inv!10391 _values!833) e!275529)))

(declare-fun mapIsEmpty!21337 () Bool)

(declare-fun mapRes!21337 () Bool)

(assert (=> mapIsEmpty!21337 mapRes!21337))

(declare-fun b!470343 () Bool)

(declare-fun e!275526 () Bool)

(assert (=> b!470343 (= e!275526 tp_is_empty!13091)))

(declare-fun b!470344 () Bool)

(assert (=> b!470344 (= e!275530 (not true))))

(declare-datatypes ((tuple2!8678 0))(
  ( (tuple2!8679 (_1!4350 (_ BitVec 64)) (_2!4350 V!18559)) )
))
(declare-datatypes ((List!8759 0))(
  ( (Nil!8756) (Cons!8755 (h!9611 tuple2!8678) (t!14721 List!8759)) )
))
(declare-datatypes ((ListLongMap!7591 0))(
  ( (ListLongMap!7592 (toList!3811 List!8759)) )
))
(declare-fun lt!213412 () ListLongMap!7591)

(declare-fun lt!213414 () ListLongMap!7591)

(assert (=> b!470344 (= lt!213412 lt!213414)))

(declare-fun minValueBefore!38 () V!18559)

(declare-fun zeroValue!794 () V!18559)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13781 0))(
  ( (Unit!13782) )
))
(declare-fun lt!213413 () Unit!13781)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18559)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!154 (array!29953 array!29955 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18559 V!18559 V!18559 V!18559 (_ BitVec 32) Int) Unit!13781)

(assert (=> b!470344 (= lt!213413 (lemmaNoChangeToArrayThenSameMapNoExtras!154 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1974 (array!29953 array!29955 (_ BitVec 32) (_ BitVec 32) V!18559 V!18559 (_ BitVec 32) Int) ListLongMap!7591)

(assert (=> b!470344 (= lt!213414 (getCurrentListMapNoExtraKeys!1974 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470344 (= lt!213412 (getCurrentListMapNoExtraKeys!1974 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470345 () Bool)

(declare-fun e!275528 () Bool)

(assert (=> b!470345 (= e!275528 tp_is_empty!13091)))

(declare-fun b!470346 () Bool)

(assert (=> b!470346 (= e!275529 (and e!275526 mapRes!21337))))

(declare-fun condMapEmpty!21337 () Bool)

(declare-fun mapDefault!21337 () ValueCell!6202)

