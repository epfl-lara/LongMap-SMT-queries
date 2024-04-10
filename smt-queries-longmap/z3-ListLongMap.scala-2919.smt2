; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41686 () Bool)

(assert start!41686)

(declare-fun b_free!11325 () Bool)

(declare-fun b_next!11325 () Bool)

(assert (=> start!41686 (= b_free!11325 (not b_next!11325))))

(declare-fun tp!39978 () Bool)

(declare-fun b_and!19681 () Bool)

(assert (=> start!41686 (= tp!39978 b_and!19681)))

(declare-fun b!465434 () Bool)

(declare-fun res!278209 () Bool)

(declare-fun e!272001 () Bool)

(assert (=> b!465434 (=> (not res!278209) (not e!272001))))

(declare-datatypes ((array!29291 0))(
  ( (array!29292 (arr!14075 (Array (_ BitVec 32) (_ BitVec 64))) (size!14427 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29291)

(declare-datatypes ((List!8505 0))(
  ( (Nil!8502) (Cons!8501 (h!9357 (_ BitVec 64)) (t!14455 List!8505)) )
))
(declare-fun arrayNoDuplicates!0 (array!29291 (_ BitVec 32) List!8505) Bool)

(assert (=> b!465434 (= res!278209 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8502))))

(declare-fun mapIsEmpty!20812 () Bool)

(declare-fun mapRes!20812 () Bool)

(assert (=> mapIsEmpty!20812 mapRes!20812))

(declare-fun mapNonEmpty!20812 () Bool)

(declare-fun tp!39979 () Bool)

(declare-fun e!271999 () Bool)

(assert (=> mapNonEmpty!20812 (= mapRes!20812 (and tp!39979 e!271999))))

(declare-datatypes ((V!18109 0))(
  ( (V!18110 (val!6421 Int)) )
))
(declare-datatypes ((ValueCell!6033 0))(
  ( (ValueCellFull!6033 (v!8708 V!18109)) (EmptyCell!6033) )
))
(declare-datatypes ((array!29293 0))(
  ( (array!29294 (arr!14076 (Array (_ BitVec 32) ValueCell!6033)) (size!14428 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29293)

(declare-fun mapKey!20812 () (_ BitVec 32))

(declare-fun mapRest!20812 () (Array (_ BitVec 32) ValueCell!6033))

(declare-fun mapValue!20812 () ValueCell!6033)

(assert (=> mapNonEmpty!20812 (= (arr!14076 _values!833) (store mapRest!20812 mapKey!20812 mapValue!20812))))

(declare-fun b!465435 () Bool)

(declare-fun tp_is_empty!12753 () Bool)

(assert (=> b!465435 (= e!271999 tp_is_empty!12753)))

(declare-fun b!465436 () Bool)

(declare-fun e!271998 () Bool)

(assert (=> b!465436 (= e!271998 tp_is_empty!12753)))

(declare-fun b!465437 () Bool)

(declare-fun res!278208 () Bool)

(assert (=> b!465437 (=> (not res!278208) (not e!272001))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29291 (_ BitVec 32)) Bool)

(assert (=> b!465437 (= res!278208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!465438 () Bool)

(declare-fun e!272003 () Bool)

(assert (=> b!465438 (= e!272001 (not e!272003))))

(declare-fun res!278211 () Bool)

(assert (=> b!465438 (=> res!278211 e!272003)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!465438 (= res!278211 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!8412 0))(
  ( (tuple2!8413 (_1!4217 (_ BitVec 64)) (_2!4217 V!18109)) )
))
(declare-datatypes ((List!8506 0))(
  ( (Nil!8503) (Cons!8502 (h!9358 tuple2!8412) (t!14456 List!8506)) )
))
(declare-datatypes ((ListLongMap!7325 0))(
  ( (ListLongMap!7326 (toList!3678 List!8506)) )
))
(declare-fun lt!210157 () ListLongMap!7325)

(declare-fun lt!210159 () ListLongMap!7325)

(assert (=> b!465438 (= lt!210157 lt!210159)))

(declare-fun minValueBefore!38 () V!18109)

(declare-fun zeroValue!794 () V!18109)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13524 0))(
  ( (Unit!13525) )
))
(declare-fun lt!210160 () Unit!13524)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18109)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!38 (array!29291 array!29293 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18109 V!18109 V!18109 V!18109 (_ BitVec 32) Int) Unit!13524)

(assert (=> b!465438 (= lt!210160 (lemmaNoChangeToArrayThenSameMapNoExtras!38 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1858 (array!29291 array!29293 (_ BitVec 32) (_ BitVec 32) V!18109 V!18109 (_ BitVec 32) Int) ListLongMap!7325)

(assert (=> b!465438 (= lt!210159 (getCurrentListMapNoExtraKeys!1858 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!465438 (= lt!210157 (getCurrentListMapNoExtraKeys!1858 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!465439 () Bool)

(declare-fun e!272000 () Bool)

(assert (=> b!465439 (= e!272000 (and e!271998 mapRes!20812))))

(declare-fun condMapEmpty!20812 () Bool)

(declare-fun mapDefault!20812 () ValueCell!6033)

(assert (=> b!465439 (= condMapEmpty!20812 (= (arr!14076 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6033)) mapDefault!20812)))))

(declare-fun b!465440 () Bool)

(assert (=> b!465440 (= e!272003 true)))

(declare-fun lt!210156 () ListLongMap!7325)

(declare-fun getCurrentListMap!2133 (array!29291 array!29293 (_ BitVec 32) (_ BitVec 32) V!18109 V!18109 (_ BitVec 32) Int) ListLongMap!7325)

(assert (=> b!465440 (= lt!210156 (getCurrentListMap!2133 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!210158 () ListLongMap!7325)

(declare-fun +!1639 (ListLongMap!7325 tuple2!8412) ListLongMap!7325)

(assert (=> b!465440 (= lt!210158 (+!1639 (getCurrentListMap!2133 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841) (tuple2!8413 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38)))))

(declare-fun res!278210 () Bool)

(assert (=> start!41686 (=> (not res!278210) (not e!272001))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41686 (= res!278210 (validMask!0 mask!1365))))

(assert (=> start!41686 e!272001))

(assert (=> start!41686 tp_is_empty!12753))

(assert (=> start!41686 tp!39978))

(assert (=> start!41686 true))

(declare-fun array_inv!10170 (array!29291) Bool)

(assert (=> start!41686 (array_inv!10170 _keys!1025)))

(declare-fun array_inv!10171 (array!29293) Bool)

(assert (=> start!41686 (and (array_inv!10171 _values!833) e!272000)))

(declare-fun b!465441 () Bool)

(declare-fun res!278212 () Bool)

(assert (=> b!465441 (=> (not res!278212) (not e!272001))))

(assert (=> b!465441 (= res!278212 (and (= (size!14428 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14427 _keys!1025) (size!14428 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41686 res!278210) b!465441))

(assert (= (and b!465441 res!278212) b!465437))

(assert (= (and b!465437 res!278208) b!465434))

(assert (= (and b!465434 res!278209) b!465438))

(assert (= (and b!465438 (not res!278211)) b!465440))

(assert (= (and b!465439 condMapEmpty!20812) mapIsEmpty!20812))

(assert (= (and b!465439 (not condMapEmpty!20812)) mapNonEmpty!20812))

(get-info :version)

(assert (= (and mapNonEmpty!20812 ((_ is ValueCellFull!6033) mapValue!20812)) b!465435))

(assert (= (and b!465439 ((_ is ValueCellFull!6033) mapDefault!20812)) b!465436))

(assert (= start!41686 b!465439))

(declare-fun m!447665 () Bool)

(assert (=> b!465438 m!447665))

(declare-fun m!447667 () Bool)

(assert (=> b!465438 m!447667))

(declare-fun m!447669 () Bool)

(assert (=> b!465438 m!447669))

(declare-fun m!447671 () Bool)

(assert (=> mapNonEmpty!20812 m!447671))

(declare-fun m!447673 () Bool)

(assert (=> start!41686 m!447673))

(declare-fun m!447675 () Bool)

(assert (=> start!41686 m!447675))

(declare-fun m!447677 () Bool)

(assert (=> start!41686 m!447677))

(declare-fun m!447679 () Bool)

(assert (=> b!465440 m!447679))

(declare-fun m!447681 () Bool)

(assert (=> b!465440 m!447681))

(assert (=> b!465440 m!447681))

(declare-fun m!447683 () Bool)

(assert (=> b!465440 m!447683))

(declare-fun m!447685 () Bool)

(assert (=> b!465437 m!447685))

(declare-fun m!447687 () Bool)

(assert (=> b!465434 m!447687))

(check-sat (not mapNonEmpty!20812) (not b!465437) b_and!19681 tp_is_empty!12753 (not b_next!11325) (not b!465440) (not b!465438) (not start!41686) (not b!465434))
(check-sat b_and!19681 (not b_next!11325))
