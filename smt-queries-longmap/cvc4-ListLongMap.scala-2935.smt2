; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41802 () Bool)

(assert start!41802)

(declare-fun b_free!11423 () Bool)

(declare-fun b_next!11423 () Bool)

(assert (=> start!41802 (= b_free!11423 (not b_next!11423))))

(declare-fun tp!40275 () Bool)

(declare-fun b_and!19791 () Bool)

(assert (=> start!41802 (= tp!40275 b_and!19791)))

(declare-fun mapIsEmpty!20962 () Bool)

(declare-fun mapRes!20962 () Bool)

(assert (=> mapIsEmpty!20962 mapRes!20962))

(declare-fun b!466794 () Bool)

(declare-fun res!279028 () Bool)

(declare-fun e!272995 () Bool)

(assert (=> b!466794 (=> (not res!279028) (not e!272995))))

(declare-datatypes ((array!29483 0))(
  ( (array!29484 (arr!14170 (Array (_ BitVec 32) (_ BitVec 64))) (size!14522 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29483)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29483 (_ BitVec 32)) Bool)

(assert (=> b!466794 (= res!279028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!466795 () Bool)

(declare-fun res!279027 () Bool)

(assert (=> b!466795 (=> (not res!279027) (not e!272995))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((V!18239 0))(
  ( (V!18240 (val!6470 Int)) )
))
(declare-datatypes ((ValueCell!6082 0))(
  ( (ValueCellFull!6082 (v!8758 V!18239)) (EmptyCell!6082) )
))
(declare-datatypes ((array!29485 0))(
  ( (array!29486 (arr!14171 (Array (_ BitVec 32) ValueCell!6082)) (size!14523 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29485)

(assert (=> b!466795 (= res!279027 (and (= (size!14523 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14522 _keys!1025) (size!14523 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!279025 () Bool)

(assert (=> start!41802 (=> (not res!279025) (not e!272995))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41802 (= res!279025 (validMask!0 mask!1365))))

(assert (=> start!41802 e!272995))

(declare-fun tp_is_empty!12851 () Bool)

(assert (=> start!41802 tp_is_empty!12851))

(assert (=> start!41802 tp!40275))

(assert (=> start!41802 true))

(declare-fun array_inv!10230 (array!29483) Bool)

(assert (=> start!41802 (array_inv!10230 _keys!1025)))

(declare-fun e!272993 () Bool)

(declare-fun array_inv!10231 (array!29485) Bool)

(assert (=> start!41802 (and (array_inv!10231 _values!833) e!272993)))

(declare-fun b!466796 () Bool)

(declare-fun e!272991 () Bool)

(assert (=> b!466796 (= e!272991 true)))

(declare-fun zeroValue!794 () V!18239)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18239)

(declare-datatypes ((tuple2!8486 0))(
  ( (tuple2!8487 (_1!4254 (_ BitVec 64)) (_2!4254 V!18239)) )
))
(declare-datatypes ((List!8576 0))(
  ( (Nil!8573) (Cons!8572 (h!9428 tuple2!8486) (t!14528 List!8576)) )
))
(declare-datatypes ((ListLongMap!7399 0))(
  ( (ListLongMap!7400 (toList!3715 List!8576)) )
))
(declare-fun lt!211017 () ListLongMap!7399)

(declare-fun getCurrentListMap!2164 (array!29483 array!29485 (_ BitVec 32) (_ BitVec 32) V!18239 V!18239 (_ BitVec 32) Int) ListLongMap!7399)

(assert (=> b!466796 (= lt!211017 (getCurrentListMap!2164 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18239)

(declare-fun lt!211013 () ListLongMap!7399)

(declare-fun +!1670 (ListLongMap!7399 tuple2!8486) ListLongMap!7399)

(assert (=> b!466796 (= lt!211013 (+!1670 (getCurrentListMap!2164 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8487 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun b!466797 () Bool)

(declare-fun e!272990 () Bool)

(assert (=> b!466797 (= e!272990 tp_is_empty!12851)))

(declare-fun b!466798 () Bool)

(declare-fun res!279029 () Bool)

(assert (=> b!466798 (=> (not res!279029) (not e!272995))))

(declare-datatypes ((List!8577 0))(
  ( (Nil!8574) (Cons!8573 (h!9429 (_ BitVec 64)) (t!14529 List!8577)) )
))
(declare-fun arrayNoDuplicates!0 (array!29483 (_ BitVec 32) List!8577) Bool)

(assert (=> b!466798 (= res!279029 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8574))))

(declare-fun b!466799 () Bool)

(assert (=> b!466799 (= e!272993 (and e!272990 mapRes!20962))))

(declare-fun condMapEmpty!20962 () Bool)

(declare-fun mapDefault!20962 () ValueCell!6082)

