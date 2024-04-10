; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41648 () Bool)

(assert start!41648)

(declare-fun b_free!11301 () Bool)

(declare-fun b_next!11301 () Bool)

(assert (=> start!41648 (= b_free!11301 (not b_next!11301))))

(declare-fun tp!39903 () Bool)

(declare-fun b_and!19649 () Bool)

(assert (=> start!41648 (= tp!39903 b_and!19649)))

(declare-fun b!465092 () Bool)

(declare-fun res!278028 () Bool)

(declare-fun e!271759 () Bool)

(assert (=> b!465092 (=> (not res!278028) (not e!271759))))

(declare-datatypes ((array!29243 0))(
  ( (array!29244 (arr!14052 (Array (_ BitVec 32) (_ BitVec 64))) (size!14404 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29243)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29243 (_ BitVec 32)) Bool)

(assert (=> b!465092 (= res!278028 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465093 () Bool)

(declare-fun e!271758 () Bool)

(declare-fun tp_is_empty!12729 () Bool)

(assert (=> b!465093 (= e!271758 tp_is_empty!12729)))

(declare-fun mapIsEmpty!20773 () Bool)

(declare-fun mapRes!20773 () Bool)

(assert (=> mapIsEmpty!20773 mapRes!20773))

(declare-fun res!278031 () Bool)

(assert (=> start!41648 (=> (not res!278031) (not e!271759))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41648 (= res!278031 (validMask!0 mask!1365))))

(assert (=> start!41648 e!271759))

(assert (=> start!41648 tp_is_empty!12729))

(assert (=> start!41648 tp!39903))

(assert (=> start!41648 true))

(declare-fun array_inv!10154 (array!29243) Bool)

(assert (=> start!41648 (array_inv!10154 _keys!1025)))

(declare-datatypes ((V!18077 0))(
  ( (V!18078 (val!6409 Int)) )
))
(declare-datatypes ((ValueCell!6021 0))(
  ( (ValueCellFull!6021 (v!8696 V!18077)) (EmptyCell!6021) )
))
(declare-datatypes ((array!29245 0))(
  ( (array!29246 (arr!14053 (Array (_ BitVec 32) ValueCell!6021)) (size!14405 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29245)

(declare-fun e!271761 () Bool)

(declare-fun array_inv!10155 (array!29245) Bool)

(assert (=> start!41648 (and (array_inv!10155 _values!833) e!271761)))

(declare-fun b!465094 () Bool)

(declare-fun e!271760 () Bool)

(assert (=> b!465094 (= e!271760 tp_is_empty!12729)))

(declare-fun b!465095 () Bool)

(assert (=> b!465095 (= e!271761 (and e!271758 mapRes!20773))))

(declare-fun condMapEmpty!20773 () Bool)

(declare-fun mapDefault!20773 () ValueCell!6021)

(assert (=> b!465095 (= condMapEmpty!20773 (= (arr!14053 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6021)) mapDefault!20773)))))

(declare-fun b!465096 () Bool)

(assert (=> b!465096 (= e!271759 (not true))))

(declare-datatypes ((tuple2!8398 0))(
  ( (tuple2!8399 (_1!4210 (_ BitVec 64)) (_2!4210 V!18077)) )
))
(declare-datatypes ((List!8490 0))(
  ( (Nil!8487) (Cons!8486 (h!9342 tuple2!8398) (t!14438 List!8490)) )
))
(declare-datatypes ((ListLongMap!7311 0))(
  ( (ListLongMap!7312 (toList!3671 List!8490)) )
))
(declare-fun lt!209999 () ListLongMap!7311)

(declare-fun lt!210000 () ListLongMap!7311)

(assert (=> b!465096 (= lt!209999 lt!210000)))

(declare-fun minValueBefore!38 () V!18077)

(declare-fun zeroValue!794 () V!18077)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13510 0))(
  ( (Unit!13511) )
))
(declare-fun lt!209998 () Unit!13510)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18077)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!31 (array!29243 array!29245 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18077 V!18077 V!18077 V!18077 (_ BitVec 32) Int) Unit!13510)

(assert (=> b!465096 (= lt!209998 (lemmaNoChangeToArrayThenSameMapNoExtras!31 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1851 (array!29243 array!29245 (_ BitVec 32) (_ BitVec 32) V!18077 V!18077 (_ BitVec 32) Int) ListLongMap!7311)

(assert (=> b!465096 (= lt!210000 (getCurrentListMapNoExtraKeys!1851 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465096 (= lt!209999 (getCurrentListMapNoExtraKeys!1851 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465097 () Bool)

(declare-fun res!278030 () Bool)

(assert (=> b!465097 (=> (not res!278030) (not e!271759))))

(assert (=> b!465097 (= res!278030 (and (= (size!14405 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14404 _keys!1025) (size!14405 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465098 () Bool)

(declare-fun res!278029 () Bool)

(assert (=> b!465098 (=> (not res!278029) (not e!271759))))

(declare-datatypes ((List!8491 0))(
  ( (Nil!8488) (Cons!8487 (h!9343 (_ BitVec 64)) (t!14439 List!8491)) )
))
(declare-fun arrayNoDuplicates!0 (array!29243 (_ BitVec 32) List!8491) Bool)

(assert (=> b!465098 (= res!278029 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8488))))

(declare-fun mapNonEmpty!20773 () Bool)

(declare-fun tp!39904 () Bool)

(assert (=> mapNonEmpty!20773 (= mapRes!20773 (and tp!39904 e!271760))))

(declare-fun mapRest!20773 () (Array (_ BitVec 32) ValueCell!6021))

(declare-fun mapValue!20773 () ValueCell!6021)

(declare-fun mapKey!20773 () (_ BitVec 32))

(assert (=> mapNonEmpty!20773 (= (arr!14053 _values!833) (store mapRest!20773 mapKey!20773 mapValue!20773))))

(assert (= (and start!41648 res!278031) b!465097))

(assert (= (and b!465097 res!278030) b!465092))

(assert (= (and b!465092 res!278028) b!465098))

(assert (= (and b!465098 res!278029) b!465096))

(assert (= (and b!465095 condMapEmpty!20773) mapIsEmpty!20773))

(assert (= (and b!465095 (not condMapEmpty!20773)) mapNonEmpty!20773))

(get-info :version)

(assert (= (and mapNonEmpty!20773 ((_ is ValueCellFull!6021) mapValue!20773)) b!465094))

(assert (= (and b!465095 ((_ is ValueCellFull!6021) mapDefault!20773)) b!465093))

(assert (= start!41648 b!465095))

(declare-fun m!447377 () Bool)

(assert (=> b!465092 m!447377))

(declare-fun m!447379 () Bool)

(assert (=> mapNonEmpty!20773 m!447379))

(declare-fun m!447381 () Bool)

(assert (=> b!465098 m!447381))

(declare-fun m!447383 () Bool)

(assert (=> start!41648 m!447383))

(declare-fun m!447385 () Bool)

(assert (=> start!41648 m!447385))

(declare-fun m!447387 () Bool)

(assert (=> start!41648 m!447387))

(declare-fun m!447389 () Bool)

(assert (=> b!465096 m!447389))

(declare-fun m!447391 () Bool)

(assert (=> b!465096 m!447391))

(declare-fun m!447393 () Bool)

(assert (=> b!465096 m!447393))

(check-sat (not b!465092) tp_is_empty!12729 (not start!41648) (not b!465098) (not mapNonEmpty!20773) b_and!19649 (not b_next!11301) (not b!465096))
(check-sat b_and!19649 (not b_next!11301))
