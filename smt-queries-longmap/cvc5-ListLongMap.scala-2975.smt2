; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42126 () Bool)

(assert start!42126)

(declare-fun b_free!11659 () Bool)

(declare-fun b_next!11659 () Bool)

(assert (=> start!42126 (= b_free!11659 (not b_next!11659))))

(declare-fun tp!40998 () Bool)

(declare-fun b_and!20081 () Bool)

(assert (=> start!42126 (= tp!40998 b_and!20081)))

(declare-fun res!281022 () Bool)

(declare-fun e!275497 () Bool)

(assert (=> start!42126 (=> (not res!281022) (not e!275497))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42126 (= res!281022 (validMask!0 mask!1365))))

(assert (=> start!42126 e!275497))

(declare-fun tp_is_empty!13087 () Bool)

(assert (=> start!42126 tp_is_empty!13087))

(assert (=> start!42126 tp!40998))

(assert (=> start!42126 true))

(declare-datatypes ((array!29945 0))(
  ( (array!29946 (arr!14396 (Array (_ BitVec 32) (_ BitVec 64))) (size!14748 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29945)

(declare-fun array_inv!10386 (array!29945) Bool)

(assert (=> start!42126 (array_inv!10386 _keys!1025)))

(declare-datatypes ((V!18555 0))(
  ( (V!18556 (val!6588 Int)) )
))
(declare-datatypes ((ValueCell!6200 0))(
  ( (ValueCellFull!6200 (v!8879 V!18555)) (EmptyCell!6200) )
))
(declare-datatypes ((array!29947 0))(
  ( (array!29948 (arr!14397 (Array (_ BitVec 32) ValueCell!6200)) (size!14749 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29947)

(declare-fun e!275498 () Bool)

(declare-fun array_inv!10387 (array!29947) Bool)

(assert (=> start!42126 (and (array_inv!10387 _values!833) e!275498)))

(declare-fun b!470300 () Bool)

(declare-fun res!281020 () Bool)

(assert (=> b!470300 (=> (not res!281020) (not e!275497))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470300 (= res!281020 (and (= (size!14749 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14748 _keys!1025) (size!14749 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470301 () Bool)

(declare-fun res!281019 () Bool)

(assert (=> b!470301 (=> (not res!281019) (not e!275497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29945 (_ BitVec 32)) Bool)

(assert (=> b!470301 (= res!281019 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470302 () Bool)

(declare-fun e!275499 () Bool)

(assert (=> b!470302 (= e!275499 tp_is_empty!13087)))

(declare-fun b!470303 () Bool)

(declare-fun res!281021 () Bool)

(assert (=> b!470303 (=> (not res!281021) (not e!275497))))

(declare-datatypes ((List!8755 0))(
  ( (Nil!8752) (Cons!8751 (h!9607 (_ BitVec 64)) (t!14717 List!8755)) )
))
(declare-fun arrayNoDuplicates!0 (array!29945 (_ BitVec 32) List!8755) Bool)

(assert (=> b!470303 (= res!281021 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8752))))

(declare-fun b!470304 () Bool)

(declare-fun mapRes!21331 () Bool)

(assert (=> b!470304 (= e!275498 (and e!275499 mapRes!21331))))

(declare-fun condMapEmpty!21331 () Bool)

(declare-fun mapDefault!21331 () ValueCell!6200)

