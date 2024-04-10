; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41520 () Bool)

(assert start!41520)

(declare-fun b_free!11187 () Bool)

(declare-fun b_next!11187 () Bool)

(assert (=> start!41520 (= b_free!11187 (not b_next!11187))))

(declare-fun tp!39558 () Bool)

(declare-fun b_and!19527 () Bool)

(assert (=> start!41520 (= tp!39558 b_and!19527)))

(declare-fun b!463810 () Bool)

(declare-fun res!277315 () Bool)

(declare-fun e!270851 () Bool)

(assert (=> b!463810 (=> (not res!277315) (not e!270851))))

(declare-datatypes ((array!29019 0))(
  ( (array!29020 (arr!13941 (Array (_ BitVec 32) (_ BitVec 64))) (size!14293 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29019)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29019 (_ BitVec 32)) Bool)

(assert (=> b!463810 (= res!277315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20599 () Bool)

(declare-fun mapRes!20599 () Bool)

(assert (=> mapIsEmpty!20599 mapRes!20599))

(declare-fun mapNonEmpty!20599 () Bool)

(declare-fun tp!39559 () Bool)

(declare-fun e!270849 () Bool)

(assert (=> mapNonEmpty!20599 (= mapRes!20599 (and tp!39559 e!270849))))

(declare-datatypes ((V!17925 0))(
  ( (V!17926 (val!6352 Int)) )
))
(declare-datatypes ((ValueCell!5964 0))(
  ( (ValueCellFull!5964 (v!8639 V!17925)) (EmptyCell!5964) )
))
(declare-fun mapRest!20599 () (Array (_ BitVec 32) ValueCell!5964))

(declare-fun mapValue!20599 () ValueCell!5964)

(declare-datatypes ((array!29021 0))(
  ( (array!29022 (arr!13942 (Array (_ BitVec 32) ValueCell!5964)) (size!14294 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29021)

(declare-fun mapKey!20599 () (_ BitVec 32))

(assert (=> mapNonEmpty!20599 (= (arr!13942 _values!833) (store mapRest!20599 mapKey!20599 mapValue!20599))))

(declare-fun res!277316 () Bool)

(assert (=> start!41520 (=> (not res!277316) (not e!270851))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41520 (= res!277316 (validMask!0 mask!1365))))

(assert (=> start!41520 e!270851))

(declare-fun tp_is_empty!12615 () Bool)

(assert (=> start!41520 tp_is_empty!12615))

(assert (=> start!41520 tp!39558))

(assert (=> start!41520 true))

(declare-fun array_inv!10076 (array!29019) Bool)

(assert (=> start!41520 (array_inv!10076 _keys!1025)))

(declare-fun e!270850 () Bool)

(declare-fun array_inv!10077 (array!29021) Bool)

(assert (=> start!41520 (and (array_inv!10077 _values!833) e!270850)))

(declare-fun b!463811 () Bool)

(declare-fun res!277314 () Bool)

(assert (=> b!463811 (=> (not res!277314) (not e!270851))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!463811 (= res!277314 (and (= (size!14294 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14293 _keys!1025) (size!14294 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!463812 () Bool)

(assert (=> b!463812 (= e!270851 false)))

(declare-datatypes ((tuple2!8320 0))(
  ( (tuple2!8321 (_1!4171 (_ BitVec 64)) (_2!4171 V!17925)) )
))
(declare-datatypes ((List!8414 0))(
  ( (Nil!8411) (Cons!8410 (h!9266 tuple2!8320) (t!14360 List!8414)) )
))
(declare-datatypes ((ListLongMap!7233 0))(
  ( (ListLongMap!7234 (toList!3632 List!8414)) )
))
(declare-fun lt!209485 () ListLongMap!7233)

(declare-fun zeroValue!794 () V!17925)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!17925)

(declare-fun getCurrentListMapNoExtraKeys!1812 (array!29019 array!29021 (_ BitVec 32) (_ BitVec 32) V!17925 V!17925 (_ BitVec 32) Int) ListLongMap!7233)

(assert (=> b!463812 (= lt!209485 (getCurrentListMapNoExtraKeys!1812 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!17925)

(declare-fun lt!209486 () ListLongMap!7233)

(assert (=> b!463812 (= lt!209486 (getCurrentListMapNoExtraKeys!1812 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!463813 () Bool)

(declare-fun e!270852 () Bool)

(assert (=> b!463813 (= e!270852 tp_is_empty!12615)))

(declare-fun b!463814 () Bool)

(declare-fun res!277313 () Bool)

(assert (=> b!463814 (=> (not res!277313) (not e!270851))))

(declare-datatypes ((List!8415 0))(
  ( (Nil!8412) (Cons!8411 (h!9267 (_ BitVec 64)) (t!14361 List!8415)) )
))
(declare-fun arrayNoDuplicates!0 (array!29019 (_ BitVec 32) List!8415) Bool)

(assert (=> b!463814 (= res!277313 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8412))))

(declare-fun b!463815 () Bool)

(assert (=> b!463815 (= e!270850 (and e!270852 mapRes!20599))))

(declare-fun condMapEmpty!20599 () Bool)

(declare-fun mapDefault!20599 () ValueCell!5964)

(assert (=> b!463815 (= condMapEmpty!20599 (= (arr!13942 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5964)) mapDefault!20599)))))

(declare-fun b!463816 () Bool)

(assert (=> b!463816 (= e!270849 tp_is_empty!12615)))

(assert (= (and start!41520 res!277316) b!463811))

(assert (= (and b!463811 res!277314) b!463810))

(assert (= (and b!463810 res!277315) b!463814))

(assert (= (and b!463814 res!277313) b!463812))

(assert (= (and b!463815 condMapEmpty!20599) mapIsEmpty!20599))

(assert (= (and b!463815 (not condMapEmpty!20599)) mapNonEmpty!20599))

(get-info :version)

(assert (= (and mapNonEmpty!20599 ((_ is ValueCellFull!5964) mapValue!20599)) b!463816))

(assert (= (and b!463815 ((_ is ValueCellFull!5964) mapDefault!20599)) b!463813))

(assert (= start!41520 b!463815))

(declare-fun m!446313 () Bool)

(assert (=> mapNonEmpty!20599 m!446313))

(declare-fun m!446315 () Bool)

(assert (=> b!463812 m!446315))

(declare-fun m!446317 () Bool)

(assert (=> b!463812 m!446317))

(declare-fun m!446319 () Bool)

(assert (=> start!41520 m!446319))

(declare-fun m!446321 () Bool)

(assert (=> start!41520 m!446321))

(declare-fun m!446323 () Bool)

(assert (=> start!41520 m!446323))

(declare-fun m!446325 () Bool)

(assert (=> b!463810 m!446325))

(declare-fun m!446327 () Bool)

(assert (=> b!463814 m!446327))

(check-sat (not mapNonEmpty!20599) (not b!463814) (not b_next!11187) b_and!19527 (not start!41520) tp_is_empty!12615 (not b!463810) (not b!463812))
(check-sat b_and!19527 (not b_next!11187))
