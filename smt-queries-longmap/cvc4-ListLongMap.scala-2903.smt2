; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41564 () Bool)

(assert start!41564)

(declare-fun b_free!11231 () Bool)

(declare-fun b_next!11231 () Bool)

(assert (=> start!41564 (= b_free!11231 (not b_next!11231))))

(declare-fun tp!39691 () Bool)

(declare-fun b_and!19571 () Bool)

(assert (=> start!41564 (= tp!39691 b_and!19571)))

(declare-fun mapIsEmpty!20665 () Bool)

(declare-fun mapRes!20665 () Bool)

(assert (=> mapIsEmpty!20665 mapRes!20665))

(declare-fun b!464272 () Bool)

(declare-fun e!271182 () Bool)

(assert (=> b!464272 (= e!271182 (not true))))

(declare-datatypes ((V!17983 0))(
  ( (V!17984 (val!6374 Int)) )
))
(declare-datatypes ((tuple2!8350 0))(
  ( (tuple2!8351 (_1!4186 (_ BitVec 64)) (_2!4186 V!17983)) )
))
(declare-datatypes ((List!8444 0))(
  ( (Nil!8441) (Cons!8440 (h!9296 tuple2!8350) (t!14390 List!8444)) )
))
(declare-datatypes ((ListLongMap!7263 0))(
  ( (ListLongMap!7264 (toList!3647 List!8444)) )
))
(declare-fun lt!209645 () ListLongMap!7263)

(declare-fun lt!209643 () ListLongMap!7263)

(assert (=> b!464272 (= lt!209645 lt!209643)))

(declare-fun minValueBefore!38 () V!17983)

(declare-fun zeroValue!794 () V!17983)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13462 0))(
  ( (Unit!13463) )
))
(declare-fun lt!209644 () Unit!13462)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!29107 0))(
  ( (array!29108 (arr!13985 (Array (_ BitVec 32) (_ BitVec 64))) (size!14337 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29107)

(declare-datatypes ((ValueCell!5986 0))(
  ( (ValueCellFull!5986 (v!8661 V!17983)) (EmptyCell!5986) )
))
(declare-datatypes ((array!29109 0))(
  ( (array!29110 (arr!13986 (Array (_ BitVec 32) ValueCell!5986)) (size!14338 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29109)

(declare-fun minValueAfter!38 () V!17983)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!7 (array!29107 array!29109 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!17983 V!17983 V!17983 V!17983 (_ BitVec 32) Int) Unit!13462)

(assert (=> b!464272 (= lt!209644 (lemmaNoChangeToArrayThenSameMapNoExtras!7 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1827 (array!29107 array!29109 (_ BitVec 32) (_ BitVec 32) V!17983 V!17983 (_ BitVec 32) Int) ListLongMap!7263)

(assert (=> b!464272 (= lt!209643 (getCurrentListMapNoExtraKeys!1827 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464272 (= lt!209645 (getCurrentListMapNoExtraKeys!1827 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!277577 () Bool)

(assert (=> start!41564 (=> (not res!277577) (not e!271182))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41564 (= res!277577 (validMask!0 mask!1365))))

(assert (=> start!41564 e!271182))

(declare-fun tp_is_empty!12659 () Bool)

(assert (=> start!41564 tp_is_empty!12659))

(assert (=> start!41564 tp!39691))

(assert (=> start!41564 true))

(declare-fun array_inv!10102 (array!29107) Bool)

(assert (=> start!41564 (array_inv!10102 _keys!1025)))

(declare-fun e!271178 () Bool)

(declare-fun array_inv!10103 (array!29109) Bool)

(assert (=> start!41564 (and (array_inv!10103 _values!833) e!271178)))

(declare-fun b!464273 () Bool)

(declare-fun res!277579 () Bool)

(assert (=> b!464273 (=> (not res!277579) (not e!271182))))

(declare-datatypes ((List!8445 0))(
  ( (Nil!8442) (Cons!8441 (h!9297 (_ BitVec 64)) (t!14391 List!8445)) )
))
(declare-fun arrayNoDuplicates!0 (array!29107 (_ BitVec 32) List!8445) Bool)

(assert (=> b!464273 (= res!277579 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8442))))

(declare-fun b!464274 () Bool)

(declare-fun e!271179 () Bool)

(assert (=> b!464274 (= e!271178 (and e!271179 mapRes!20665))))

(declare-fun condMapEmpty!20665 () Bool)

(declare-fun mapDefault!20665 () ValueCell!5986)

