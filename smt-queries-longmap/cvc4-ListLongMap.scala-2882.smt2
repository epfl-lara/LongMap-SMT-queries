; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41426 () Bool)

(assert start!41426)

(declare-fun b_free!11105 () Bool)

(declare-fun b_next!11105 () Bool)

(assert (=> start!41426 (= b_free!11105 (not b_next!11105))))

(declare-fun tp!39309 () Bool)

(declare-fun b_and!19441 () Bool)

(assert (=> start!41426 (= tp!39309 b_and!19441)))

(declare-fun b!462876 () Bool)

(declare-fun res!276795 () Bool)

(declare-fun e!270189 () Bool)

(assert (=> b!462876 (=> (not res!276795) (not e!270189))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!28867 0))(
  ( (array!28868 (arr!13866 (Array (_ BitVec 32) (_ BitVec 64))) (size!14218 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28867)

(declare-datatypes ((V!17815 0))(
  ( (V!17816 (val!6311 Int)) )
))
(declare-datatypes ((ValueCell!5923 0))(
  ( (ValueCellFull!5923 (v!8598 V!17815)) (EmptyCell!5923) )
))
(declare-datatypes ((array!28869 0))(
  ( (array!28870 (arr!13867 (Array (_ BitVec 32) ValueCell!5923)) (size!14219 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28869)

(assert (=> b!462876 (= res!276795 (and (= (size!14219 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14218 _keys!1025) (size!14219 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462877 () Bool)

(declare-fun res!276796 () Bool)

(assert (=> b!462877 (=> (not res!276796) (not e!270189))))

(declare-datatypes ((List!8362 0))(
  ( (Nil!8359) (Cons!8358 (h!9214 (_ BitVec 64)) (t!14306 List!8362)) )
))
(declare-fun arrayNoDuplicates!0 (array!28867 (_ BitVec 32) List!8362) Bool)

(assert (=> b!462877 (= res!276796 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8359))))

(declare-fun b!462878 () Bool)

(assert (=> b!462878 (= e!270189 false)))

(declare-datatypes ((tuple2!8270 0))(
  ( (tuple2!8271 (_1!4146 (_ BitVec 64)) (_2!4146 V!17815)) )
))
(declare-datatypes ((List!8363 0))(
  ( (Nil!8360) (Cons!8359 (h!9215 tuple2!8270) (t!14307 List!8363)) )
))
(declare-datatypes ((ListLongMap!7183 0))(
  ( (ListLongMap!7184 (toList!3607 List!8363)) )
))
(declare-fun lt!209273 () ListLongMap!7183)

(declare-fun minValueBefore!38 () V!17815)

(declare-fun zeroValue!794 () V!17815)

(declare-fun defaultEntry!841 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1787 (array!28867 array!28869 (_ BitVec 32) (_ BitVec 32) V!17815 V!17815 (_ BitVec 32) Int) ListLongMap!7183)

(assert (=> b!462878 (= lt!209273 (getCurrentListMapNoExtraKeys!1787 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20473 () Bool)

(declare-fun mapRes!20473 () Bool)

(declare-fun tp!39310 () Bool)

(declare-fun e!270186 () Bool)

(assert (=> mapNonEmpty!20473 (= mapRes!20473 (and tp!39310 e!270186))))

(declare-fun mapRest!20473 () (Array (_ BitVec 32) ValueCell!5923))

(declare-fun mapKey!20473 () (_ BitVec 32))

(declare-fun mapValue!20473 () ValueCell!5923)

(assert (=> mapNonEmpty!20473 (= (arr!13867 _values!833) (store mapRest!20473 mapKey!20473 mapValue!20473))))

(declare-fun mapIsEmpty!20473 () Bool)

(assert (=> mapIsEmpty!20473 mapRes!20473))

(declare-fun b!462879 () Bool)

(declare-fun e!270185 () Bool)

(declare-fun e!270187 () Bool)

(assert (=> b!462879 (= e!270185 (and e!270187 mapRes!20473))))

(declare-fun condMapEmpty!20473 () Bool)

(declare-fun mapDefault!20473 () ValueCell!5923)

