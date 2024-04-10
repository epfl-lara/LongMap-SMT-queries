; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41632 () Bool)

(assert start!41632)

(declare-fun b_free!11285 () Bool)

(declare-fun b_next!11285 () Bool)

(assert (=> start!41632 (= b_free!11285 (not b_next!11285))))

(declare-fun tp!39855 () Bool)

(declare-fun b_and!19633 () Bool)

(assert (=> start!41632 (= tp!39855 b_and!19633)))

(declare-fun res!277932 () Bool)

(declare-fun e!271639 () Bool)

(assert (=> start!41632 (=> (not res!277932) (not e!271639))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41632 (= res!277932 (validMask!0 mask!1365))))

(assert (=> start!41632 e!271639))

(declare-fun tp_is_empty!12713 () Bool)

(assert (=> start!41632 tp_is_empty!12713))

(assert (=> start!41632 tp!39855))

(assert (=> start!41632 true))

(declare-datatypes ((array!29211 0))(
  ( (array!29212 (arr!14036 (Array (_ BitVec 32) (_ BitVec 64))) (size!14388 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29211)

(declare-fun array_inv!10138 (array!29211) Bool)

(assert (=> start!41632 (array_inv!10138 _keys!1025)))

(declare-datatypes ((V!18055 0))(
  ( (V!18056 (val!6401 Int)) )
))
(declare-datatypes ((ValueCell!6013 0))(
  ( (ValueCellFull!6013 (v!8688 V!18055)) (EmptyCell!6013) )
))
(declare-datatypes ((array!29213 0))(
  ( (array!29214 (arr!14037 (Array (_ BitVec 32) ValueCell!6013)) (size!14389 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29213)

(declare-fun e!271641 () Bool)

(declare-fun array_inv!10139 (array!29213) Bool)

(assert (=> start!41632 (and (array_inv!10139 _values!833) e!271641)))

(declare-fun b!464924 () Bool)

(declare-fun res!277934 () Bool)

(assert (=> b!464924 (=> (not res!277934) (not e!271639))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!464924 (= res!277934 (and (= (size!14389 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14388 _keys!1025) (size!14389 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!20749 () Bool)

(declare-fun mapRes!20749 () Bool)

(declare-fun tp!39856 () Bool)

(declare-fun e!271638 () Bool)

(assert (=> mapNonEmpty!20749 (= mapRes!20749 (and tp!39856 e!271638))))

(declare-fun mapKey!20749 () (_ BitVec 32))

(declare-fun mapRest!20749 () (Array (_ BitVec 32) ValueCell!6013))

(declare-fun mapValue!20749 () ValueCell!6013)

(assert (=> mapNonEmpty!20749 (= (arr!14037 _values!833) (store mapRest!20749 mapKey!20749 mapValue!20749))))

(declare-fun b!464925 () Bool)

(declare-fun res!277935 () Bool)

(assert (=> b!464925 (=> (not res!277935) (not e!271639))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29211 (_ BitVec 32)) Bool)

(assert (=> b!464925 (= res!277935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20749 () Bool)

(assert (=> mapIsEmpty!20749 mapRes!20749))

(declare-fun b!464926 () Bool)

(declare-fun e!271642 () Bool)

(assert (=> b!464926 (= e!271641 (and e!271642 mapRes!20749))))

(declare-fun condMapEmpty!20749 () Bool)

(declare-fun mapDefault!20749 () ValueCell!6013)

