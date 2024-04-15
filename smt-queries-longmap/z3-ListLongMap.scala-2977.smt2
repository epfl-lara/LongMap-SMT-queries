; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42124 () Bool)

(assert start!42124)

(declare-fun b_free!11671 () Bool)

(declare-fun b_next!11671 () Bool)

(assert (=> start!42124 (= b_free!11671 (not b_next!11671))))

(declare-fun tp!41035 () Bool)

(declare-fun b_and!20067 () Bool)

(assert (=> start!42124 (= tp!41035 b_and!20067)))

(declare-fun b!470155 () Bool)

(declare-fun res!280964 () Bool)

(declare-fun e!275415 () Bool)

(assert (=> b!470155 (=> (not res!280964) (not e!275415))))

(declare-datatypes ((array!29949 0))(
  ( (array!29950 (arr!14398 (Array (_ BitVec 32) (_ BitVec 64))) (size!14751 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29949)

(declare-datatypes ((List!8789 0))(
  ( (Nil!8786) (Cons!8785 (h!9641 (_ BitVec 64)) (t!14742 List!8789)) )
))
(declare-fun arrayNoDuplicates!0 (array!29949 (_ BitVec 32) List!8789) Bool)

(assert (=> b!470155 (= res!280964 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8786))))

(declare-fun res!280962 () Bool)

(assert (=> start!42124 (=> (not res!280962) (not e!275415))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42124 (= res!280962 (validMask!0 mask!1365))))

(assert (=> start!42124 e!275415))

(declare-fun tp_is_empty!13099 () Bool)

(assert (=> start!42124 tp_is_empty!13099))

(assert (=> start!42124 tp!41035))

(assert (=> start!42124 true))

(declare-fun array_inv!10472 (array!29949) Bool)

(assert (=> start!42124 (array_inv!10472 _keys!1025)))

(declare-datatypes ((V!18571 0))(
  ( (V!18572 (val!6594 Int)) )
))
(declare-datatypes ((ValueCell!6206 0))(
  ( (ValueCellFull!6206 (v!8879 V!18571)) (EmptyCell!6206) )
))
(declare-datatypes ((array!29951 0))(
  ( (array!29952 (arr!14399 (Array (_ BitVec 32) ValueCell!6206)) (size!14752 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29951)

(declare-fun e!275413 () Bool)

(declare-fun array_inv!10473 (array!29951) Bool)

(assert (=> start!42124 (and (array_inv!10473 _values!833) e!275413)))

(declare-fun b!470156 () Bool)

(declare-fun e!275412 () Bool)

(declare-fun mapRes!21349 () Bool)

(assert (=> b!470156 (= e!275413 (and e!275412 mapRes!21349))))

(declare-fun condMapEmpty!21349 () Bool)

(declare-fun mapDefault!21349 () ValueCell!6206)

(assert (=> b!470156 (= condMapEmpty!21349 (= (arr!14399 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6206)) mapDefault!21349)))))

(declare-fun mapNonEmpty!21349 () Bool)

(declare-fun tp!41034 () Bool)

(declare-fun e!275416 () Bool)

(assert (=> mapNonEmpty!21349 (= mapRes!21349 (and tp!41034 e!275416))))

(declare-fun mapValue!21349 () ValueCell!6206)

(declare-fun mapRest!21349 () (Array (_ BitVec 32) ValueCell!6206))

(declare-fun mapKey!21349 () (_ BitVec 32))

(assert (=> mapNonEmpty!21349 (= (arr!14399 _values!833) (store mapRest!21349 mapKey!21349 mapValue!21349))))

(declare-fun b!470157 () Bool)

(declare-fun res!280965 () Bool)

(assert (=> b!470157 (=> (not res!280965) (not e!275415))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470157 (= res!280965 (and (= (size!14752 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14751 _keys!1025) (size!14752 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470158 () Bool)

(assert (=> b!470158 (= e!275412 tp_is_empty!13099)))

(declare-fun b!470159 () Bool)

(assert (=> b!470159 (= e!275416 tp_is_empty!13099)))

(declare-fun b!470160 () Bool)

(declare-fun res!280963 () Bool)

(assert (=> b!470160 (=> (not res!280963) (not e!275415))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29949 (_ BitVec 32)) Bool)

(assert (=> b!470160 (= res!280963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470161 () Bool)

(assert (=> b!470161 (= e!275415 (not true))))

(declare-datatypes ((tuple2!8718 0))(
  ( (tuple2!8719 (_1!4370 (_ BitVec 64)) (_2!4370 V!18571)) )
))
(declare-datatypes ((List!8790 0))(
  ( (Nil!8787) (Cons!8786 (h!9642 tuple2!8718) (t!14743 List!8790)) )
))
(declare-datatypes ((ListLongMap!7621 0))(
  ( (ListLongMap!7622 (toList!3826 List!8790)) )
))
(declare-fun lt!213214 () ListLongMap!7621)

(declare-fun lt!213216 () ListLongMap!7621)

(assert (=> b!470161 (= lt!213214 lt!213216)))

(declare-fun minValueBefore!38 () V!18571)

(declare-fun defaultEntry!841 () Int)

(declare-fun zeroValue!794 () V!18571)

(declare-datatypes ((Unit!13753 0))(
  ( (Unit!13754) )
))
(declare-fun lt!213215 () Unit!13753)

(declare-fun minValueAfter!38 () V!18571)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!158 (array!29949 array!29951 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18571 V!18571 V!18571 V!18571 (_ BitVec 32) Int) Unit!13753)

(assert (=> b!470161 (= lt!213215 (lemmaNoChangeToArrayThenSameMapNoExtras!158 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2001 (array!29949 array!29951 (_ BitVec 32) (_ BitVec 32) V!18571 V!18571 (_ BitVec 32) Int) ListLongMap!7621)

(assert (=> b!470161 (= lt!213216 (getCurrentListMapNoExtraKeys!2001 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470161 (= lt!213214 (getCurrentListMapNoExtraKeys!2001 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapIsEmpty!21349 () Bool)

(assert (=> mapIsEmpty!21349 mapRes!21349))

(assert (= (and start!42124 res!280962) b!470157))

(assert (= (and b!470157 res!280965) b!470160))

(assert (= (and b!470160 res!280963) b!470155))

(assert (= (and b!470155 res!280964) b!470161))

(assert (= (and b!470156 condMapEmpty!21349) mapIsEmpty!21349))

(assert (= (and b!470156 (not condMapEmpty!21349)) mapNonEmpty!21349))

(get-info :version)

(assert (= (and mapNonEmpty!21349 ((_ is ValueCellFull!6206) mapValue!21349)) b!470159))

(assert (= (and b!470156 ((_ is ValueCellFull!6206) mapDefault!21349)) b!470158))

(assert (= start!42124 b!470156))

(declare-fun m!451983 () Bool)

(assert (=> start!42124 m!451983))

(declare-fun m!451985 () Bool)

(assert (=> start!42124 m!451985))

(declare-fun m!451987 () Bool)

(assert (=> start!42124 m!451987))

(declare-fun m!451989 () Bool)

(assert (=> b!470160 m!451989))

(declare-fun m!451991 () Bool)

(assert (=> mapNonEmpty!21349 m!451991))

(declare-fun m!451993 () Bool)

(assert (=> b!470155 m!451993))

(declare-fun m!451995 () Bool)

(assert (=> b!470161 m!451995))

(declare-fun m!451997 () Bool)

(assert (=> b!470161 m!451997))

(declare-fun m!451999 () Bool)

(assert (=> b!470161 m!451999))

(check-sat tp_is_empty!13099 (not b!470155) (not b_next!11671) (not b!470160) (not b!470161) (not mapNonEmpty!21349) (not start!42124) b_and!20067)
(check-sat b_and!20067 (not b_next!11671))
