; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41670 () Bool)

(assert start!41670)

(declare-fun b_free!11323 () Bool)

(declare-fun b_next!11323 () Bool)

(assert (=> start!41670 (= b_free!11323 (not b_next!11323))))

(declare-fun tp!39972 () Bool)

(declare-fun b_and!19653 () Bool)

(assert (=> start!41670 (= tp!39972 b_and!19653)))

(declare-fun b!465139 () Bool)

(declare-fun e!271806 () Bool)

(declare-fun tp_is_empty!12751 () Bool)

(assert (=> b!465139 (= e!271806 tp_is_empty!12751)))

(declare-fun b!465140 () Bool)

(declare-fun res!278066 () Bool)

(declare-fun e!271808 () Bool)

(assert (=> b!465140 (=> (not res!278066) (not e!271808))))

(declare-datatypes ((array!29285 0))(
  ( (array!29286 (arr!14072 (Array (_ BitVec 32) (_ BitVec 64))) (size!14425 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29285)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29285 (_ BitVec 32)) Bool)

(assert (=> b!465140 (= res!278066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20809 () Bool)

(declare-fun mapRes!20809 () Bool)

(assert (=> mapIsEmpty!20809 mapRes!20809))

(declare-fun b!465141 () Bool)

(declare-fun e!271809 () Bool)

(assert (=> b!465141 (= e!271808 (not e!271809))))

(declare-fun res!278064 () Bool)

(assert (=> b!465141 (=> res!278064 e!271809)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465141 (= res!278064 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!18107 0))(
  ( (V!18108 (val!6420 Int)) )
))
(declare-datatypes ((tuple2!8450 0))(
  ( (tuple2!8451 (_1!4236 (_ BitVec 64)) (_2!4236 V!18107)) )
))
(declare-datatypes ((List!8538 0))(
  ( (Nil!8535) (Cons!8534 (h!9390 tuple2!8450) (t!14479 List!8538)) )
))
(declare-datatypes ((ListLongMap!7353 0))(
  ( (ListLongMap!7354 (toList!3692 List!8538)) )
))
(declare-fun lt!209908 () ListLongMap!7353)

(declare-fun lt!209909 () ListLongMap!7353)

(assert (=> b!465141 (= lt!209908 lt!209909)))

(declare-datatypes ((Unit!13500 0))(
  ( (Unit!13501) )
))
(declare-fun lt!209907 () Unit!13500)

(declare-fun minValueBefore!38 () V!18107)

(declare-fun zeroValue!794 () V!18107)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6032 0))(
  ( (ValueCellFull!6032 (v!8701 V!18107)) (EmptyCell!6032) )
))
(declare-datatypes ((array!29287 0))(
  ( (array!29288 (arr!14073 (Array (_ BitVec 32) ValueCell!6032)) (size!14426 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29287)

(declare-fun minValueAfter!38 () V!18107)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!41 (array!29285 array!29287 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18107 V!18107 V!18107 V!18107 (_ BitVec 32) Int) Unit!13500)

(assert (=> b!465141 (= lt!209907 (lemmaNoChangeToArrayThenSameMapNoExtras!41 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1884 (array!29285 array!29287 (_ BitVec 32) (_ BitVec 32) V!18107 V!18107 (_ BitVec 32) Int) ListLongMap!7353)

(assert (=> b!465141 (= lt!209909 (getCurrentListMapNoExtraKeys!1884 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465141 (= lt!209908 (getCurrentListMapNoExtraKeys!1884 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!278068 () Bool)

(assert (=> start!41670 (=> (not res!278068) (not e!271808))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41670 (= res!278068 (validMask!0 mask!1365))))

(assert (=> start!41670 e!271808))

(assert (=> start!41670 tp_is_empty!12751))

(assert (=> start!41670 tp!39972))

(assert (=> start!41670 true))

(declare-fun array_inv!10250 (array!29285) Bool)

(assert (=> start!41670 (array_inv!10250 _keys!1025)))

(declare-fun e!271810 () Bool)

(declare-fun array_inv!10251 (array!29287) Bool)

(assert (=> start!41670 (and (array_inv!10251 _values!833) e!271810)))

(declare-fun b!465142 () Bool)

(declare-fun e!271807 () Bool)

(assert (=> b!465142 (= e!271807 tp_is_empty!12751)))

(declare-fun b!465143 () Bool)

(declare-fun res!278067 () Bool)

(assert (=> b!465143 (=> (not res!278067) (not e!271808))))

(assert (=> b!465143 (= res!278067 (and (= (size!14426 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14425 _keys!1025) (size!14426 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!465144 () Bool)

(assert (=> b!465144 (= e!271810 (and e!271807 mapRes!20809))))

(declare-fun condMapEmpty!20809 () Bool)

(declare-fun mapDefault!20809 () ValueCell!6032)

(assert (=> b!465144 (= condMapEmpty!20809 (= (arr!14073 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6032)) mapDefault!20809)))))

(declare-fun b!465145 () Bool)

(declare-fun res!278065 () Bool)

(assert (=> b!465145 (=> (not res!278065) (not e!271808))))

(declare-datatypes ((List!8539 0))(
  ( (Nil!8536) (Cons!8535 (h!9391 (_ BitVec 64)) (t!14480 List!8539)) )
))
(declare-fun arrayNoDuplicates!0 (array!29285 (_ BitVec 32) List!8539) Bool)

(assert (=> b!465145 (= res!278065 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8536))))

(declare-fun mapNonEmpty!20809 () Bool)

(declare-fun tp!39973 () Bool)

(assert (=> mapNonEmpty!20809 (= mapRes!20809 (and tp!39973 e!271806))))

(declare-fun mapKey!20809 () (_ BitVec 32))

(declare-fun mapValue!20809 () ValueCell!6032)

(declare-fun mapRest!20809 () (Array (_ BitVec 32) ValueCell!6032))

(assert (=> mapNonEmpty!20809 (= (arr!14073 _values!833) (store mapRest!20809 mapKey!20809 mapValue!20809))))

(declare-fun b!465146 () Bool)

(assert (=> b!465146 (= e!271809 true)))

(declare-fun lt!209910 () ListLongMap!7353)

(declare-fun getCurrentListMap!2086 (array!29285 array!29287 (_ BitVec 32) (_ BitVec 32) V!18107 V!18107 (_ BitVec 32) Int) ListLongMap!7353)

(assert (=> b!465146 (= lt!209910 (getCurrentListMap!2086 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!209911 () ListLongMap!7353)

(declare-fun +!1667 (ListLongMap!7353 tuple2!8450) ListLongMap!7353)

(assert (=> b!465146 (= lt!209911 (+!1667 (getCurrentListMap!2086 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8451 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(assert (= (and start!41670 res!278068) b!465143))

(assert (= (and b!465143 res!278067) b!465140))

(assert (= (and b!465140 res!278066) b!465145))

(assert (= (and b!465145 res!278065) b!465141))

(assert (= (and b!465141 (not res!278064)) b!465146))

(assert (= (and b!465144 condMapEmpty!20809) mapIsEmpty!20809))

(assert (= (and b!465144 (not condMapEmpty!20809)) mapNonEmpty!20809))

(get-info :version)

(assert (= (and mapNonEmpty!20809 ((_ is ValueCellFull!6032) mapValue!20809)) b!465139))

(assert (= (and b!465144 ((_ is ValueCellFull!6032) mapDefault!20809)) b!465142))

(assert (= start!41670 b!465144))

(declare-fun m!446907 () Bool)

(assert (=> b!465141 m!446907))

(declare-fun m!446909 () Bool)

(assert (=> b!465141 m!446909))

(declare-fun m!446911 () Bool)

(assert (=> b!465141 m!446911))

(declare-fun m!446913 () Bool)

(assert (=> b!465146 m!446913))

(declare-fun m!446915 () Bool)

(assert (=> b!465146 m!446915))

(assert (=> b!465146 m!446915))

(declare-fun m!446917 () Bool)

(assert (=> b!465146 m!446917))

(declare-fun m!446919 () Bool)

(assert (=> start!41670 m!446919))

(declare-fun m!446921 () Bool)

(assert (=> start!41670 m!446921))

(declare-fun m!446923 () Bool)

(assert (=> start!41670 m!446923))

(declare-fun m!446925 () Bool)

(assert (=> b!465140 m!446925))

(declare-fun m!446927 () Bool)

(assert (=> mapNonEmpty!20809 m!446927))

(declare-fun m!446929 () Bool)

(assert (=> b!465145 m!446929))

(check-sat (not mapNonEmpty!20809) (not b!465145) b_and!19653 (not b_next!11323) (not b!465146) tp_is_empty!12751 (not start!41670) (not b!465140) (not b!465141))
(check-sat b_and!19653 (not b_next!11323))
