; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42180 () Bool)

(assert start!42180)

(declare-fun b_free!11713 () Bool)

(declare-fun b_next!11713 () Bool)

(assert (=> start!42180 (= b_free!11713 (not b_next!11713))))

(declare-fun tp!41163 () Bool)

(declare-fun b_and!20153 () Bool)

(assert (=> start!42180 (= tp!41163 b_and!20153)))

(declare-fun b!470891 () Bool)

(declare-fun res!281367 () Bool)

(declare-fun e!275919 () Bool)

(assert (=> b!470891 (=> (not res!281367) (not e!275919))))

(declare-datatypes ((array!30034 0))(
  ( (array!30035 (arr!14439 (Array (_ BitVec 32) (_ BitVec 64))) (size!14791 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30034)

(declare-datatypes ((List!8702 0))(
  ( (Nil!8699) (Cons!8698 (h!9554 (_ BitVec 64)) (t!14658 List!8702)) )
))
(declare-fun arrayNoDuplicates!0 (array!30034 (_ BitVec 32) List!8702) Bool)

(assert (=> b!470891 (= res!281367 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8699))))

(declare-fun b!470892 () Bool)

(declare-fun res!281369 () Bool)

(assert (=> b!470892 (=> (not res!281369) (not e!275919))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30034 (_ BitVec 32)) Bool)

(assert (=> b!470892 (= res!281369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470893 () Bool)

(assert (=> b!470893 (= e!275919 (not true))))

(declare-datatypes ((V!18627 0))(
  ( (V!18628 (val!6615 Int)) )
))
(declare-datatypes ((tuple2!8630 0))(
  ( (tuple2!8631 (_1!4326 (_ BitVec 64)) (_2!4326 V!18627)) )
))
(declare-datatypes ((List!8703 0))(
  ( (Nil!8700) (Cons!8699 (h!9555 tuple2!8630) (t!14659 List!8703)) )
))
(declare-datatypes ((ListLongMap!7545 0))(
  ( (ListLongMap!7546 (toList!3788 List!8703)) )
))
(declare-fun lt!213691 () ListLongMap!7545)

(declare-fun lt!213690 () ListLongMap!7545)

(assert (=> b!470893 (= lt!213691 lt!213690)))

(declare-fun minValueBefore!38 () V!18627)

(declare-fun zeroValue!794 () V!18627)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13789 0))(
  ( (Unit!13790) )
))
(declare-fun lt!213689 () Unit!13789)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((ValueCell!6227 0))(
  ( (ValueCellFull!6227 (v!8907 V!18627)) (EmptyCell!6227) )
))
(declare-datatypes ((array!30036 0))(
  ( (array!30037 (arr!14440 (Array (_ BitVec 32) ValueCell!6227)) (size!14792 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30036)

(declare-fun minValueAfter!38 () V!18627)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!163 (array!30034 array!30036 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18627 V!18627 V!18627 V!18627 (_ BitVec 32) Int) Unit!13789)

(assert (=> b!470893 (= lt!213689 (lemmaNoChangeToArrayThenSameMapNoExtras!163 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2003 (array!30034 array!30036 (_ BitVec 32) (_ BitVec 32) V!18627 V!18627 (_ BitVec 32) Int) ListLongMap!7545)

(assert (=> b!470893 (= lt!213690 (getCurrentListMapNoExtraKeys!2003 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470893 (= lt!213691 (getCurrentListMapNoExtraKeys!2003 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!21415 () Bool)

(declare-fun mapRes!21415 () Bool)

(declare-fun tp!41164 () Bool)

(declare-fun e!275920 () Bool)

(assert (=> mapNonEmpty!21415 (= mapRes!21415 (and tp!41164 e!275920))))

(declare-fun mapValue!21415 () ValueCell!6227)

(declare-fun mapKey!21415 () (_ BitVec 32))

(declare-fun mapRest!21415 () (Array (_ BitVec 32) ValueCell!6227))

(assert (=> mapNonEmpty!21415 (= (arr!14440 _values!833) (store mapRest!21415 mapKey!21415 mapValue!21415))))

(declare-fun mapIsEmpty!21415 () Bool)

(assert (=> mapIsEmpty!21415 mapRes!21415))

(declare-fun b!470895 () Bool)

(declare-fun e!275921 () Bool)

(declare-fun e!275917 () Bool)

(assert (=> b!470895 (= e!275921 (and e!275917 mapRes!21415))))

(declare-fun condMapEmpty!21415 () Bool)

(declare-fun mapDefault!21415 () ValueCell!6227)

(assert (=> b!470895 (= condMapEmpty!21415 (= (arr!14440 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6227)) mapDefault!21415)))))

(declare-fun b!470896 () Bool)

(declare-fun res!281368 () Bool)

(assert (=> b!470896 (=> (not res!281368) (not e!275919))))

(assert (=> b!470896 (= res!281368 (and (= (size!14792 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14791 _keys!1025) (size!14792 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!470897 () Bool)

(declare-fun tp_is_empty!13141 () Bool)

(assert (=> b!470897 (= e!275920 tp_is_empty!13141)))

(declare-fun b!470894 () Bool)

(assert (=> b!470894 (= e!275917 tp_is_empty!13141)))

(declare-fun res!281370 () Bool)

(assert (=> start!42180 (=> (not res!281370) (not e!275919))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42180 (= res!281370 (validMask!0 mask!1365))))

(assert (=> start!42180 e!275919))

(assert (=> start!42180 tp_is_empty!13141))

(assert (=> start!42180 tp!41163))

(assert (=> start!42180 true))

(declare-fun array_inv!10506 (array!30034) Bool)

(assert (=> start!42180 (array_inv!10506 _keys!1025)))

(declare-fun array_inv!10507 (array!30036) Bool)

(assert (=> start!42180 (and (array_inv!10507 _values!833) e!275921)))

(assert (= (and start!42180 res!281370) b!470896))

(assert (= (and b!470896 res!281368) b!470892))

(assert (= (and b!470892 res!281369) b!470891))

(assert (= (and b!470891 res!281367) b!470893))

(assert (= (and b!470895 condMapEmpty!21415) mapIsEmpty!21415))

(assert (= (and b!470895 (not condMapEmpty!21415)) mapNonEmpty!21415))

(get-info :version)

(assert (= (and mapNonEmpty!21415 ((_ is ValueCellFull!6227) mapValue!21415)) b!470897))

(assert (= (and b!470895 ((_ is ValueCellFull!6227) mapDefault!21415)) b!470894))

(assert (= start!42180 b!470895))

(declare-fun m!453343 () Bool)

(assert (=> mapNonEmpty!21415 m!453343))

(declare-fun m!453345 () Bool)

(assert (=> b!470892 m!453345))

(declare-fun m!453347 () Bool)

(assert (=> b!470893 m!453347))

(declare-fun m!453349 () Bool)

(assert (=> b!470893 m!453349))

(declare-fun m!453351 () Bool)

(assert (=> b!470893 m!453351))

(declare-fun m!453353 () Bool)

(assert (=> start!42180 m!453353))

(declare-fun m!453355 () Bool)

(assert (=> start!42180 m!453355))

(declare-fun m!453357 () Bool)

(assert (=> start!42180 m!453357))

(declare-fun m!453359 () Bool)

(assert (=> b!470891 m!453359))

(check-sat (not mapNonEmpty!21415) tp_is_empty!13141 (not b!470892) (not b!470893) (not start!42180) (not b_next!11713) b_and!20153 (not b!470891))
(check-sat b_and!20153 (not b_next!11713))
