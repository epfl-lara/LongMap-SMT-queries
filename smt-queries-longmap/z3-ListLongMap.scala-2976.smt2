; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42118 () Bool)

(assert start!42118)

(declare-fun b_free!11665 () Bool)

(declare-fun b_next!11665 () Bool)

(assert (=> start!42118 (= b_free!11665 (not b_next!11665))))

(declare-fun tp!41017 () Bool)

(declare-fun b_and!20097 () Bool)

(assert (=> start!42118 (= tp!41017 b_and!20097)))

(declare-fun res!281051 () Bool)

(declare-fun e!275502 () Bool)

(assert (=> start!42118 (=> (not res!281051) (not e!275502))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42118 (= res!281051 (validMask!0 mask!1365))))

(assert (=> start!42118 e!275502))

(declare-fun tp_is_empty!13093 () Bool)

(assert (=> start!42118 tp_is_empty!13093))

(assert (=> start!42118 tp!41017))

(assert (=> start!42118 true))

(declare-datatypes ((array!29944 0))(
  ( (array!29945 (arr!14395 (Array (_ BitVec 32) (_ BitVec 64))) (size!14747 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29944)

(declare-fun array_inv!10478 (array!29944) Bool)

(assert (=> start!42118 (array_inv!10478 _keys!1025)))

(declare-datatypes ((V!18563 0))(
  ( (V!18564 (val!6591 Int)) )
))
(declare-datatypes ((ValueCell!6203 0))(
  ( (ValueCellFull!6203 (v!8883 V!18563)) (EmptyCell!6203) )
))
(declare-datatypes ((array!29946 0))(
  ( (array!29947 (arr!14396 (Array (_ BitVec 32) ValueCell!6203)) (size!14748 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29946)

(declare-fun e!275505 () Bool)

(declare-fun array_inv!10479 (array!29946) Bool)

(assert (=> start!42118 (and (array_inv!10479 _values!833) e!275505)))

(declare-fun mapIsEmpty!21340 () Bool)

(declare-fun mapRes!21340 () Bool)

(assert (=> mapIsEmpty!21340 mapRes!21340))

(declare-fun b!470302 () Bool)

(declare-fun e!275506 () Bool)

(assert (=> b!470302 (= e!275505 (and e!275506 mapRes!21340))))

(declare-fun condMapEmpty!21340 () Bool)

(declare-fun mapDefault!21340 () ValueCell!6203)

(assert (=> b!470302 (= condMapEmpty!21340 (= (arr!14396 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6203)) mapDefault!21340)))))

(declare-fun b!470303 () Bool)

(assert (=> b!470303 (= e!275506 tp_is_empty!13093)))

(declare-fun b!470304 () Bool)

(declare-fun res!281050 () Bool)

(assert (=> b!470304 (=> (not res!281050) (not e!275502))))

(declare-datatypes ((List!8675 0))(
  ( (Nil!8672) (Cons!8671 (h!9527 (_ BitVec 64)) (t!14629 List!8675)) )
))
(declare-fun arrayNoDuplicates!0 (array!29944 (_ BitVec 32) List!8675) Bool)

(assert (=> b!470304 (= res!281050 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8672))))

(declare-fun mapNonEmpty!21340 () Bool)

(declare-fun tp!41016 () Bool)

(declare-fun e!275503 () Bool)

(assert (=> mapNonEmpty!21340 (= mapRes!21340 (and tp!41016 e!275503))))

(declare-fun mapRest!21340 () (Array (_ BitVec 32) ValueCell!6203))

(declare-fun mapValue!21340 () ValueCell!6203)

(declare-fun mapKey!21340 () (_ BitVec 32))

(assert (=> mapNonEmpty!21340 (= (arr!14396 _values!833) (store mapRest!21340 mapKey!21340 mapValue!21340))))

(declare-fun b!470305 () Bool)

(declare-fun res!281049 () Bool)

(assert (=> b!470305 (=> (not res!281049) (not e!275502))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29944 (_ BitVec 32)) Bool)

(assert (=> b!470305 (= res!281049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470306 () Bool)

(assert (=> b!470306 (= e!275503 tp_is_empty!13093)))

(declare-fun b!470307 () Bool)

(assert (=> b!470307 (= e!275502 (not true))))

(declare-datatypes ((tuple2!8602 0))(
  ( (tuple2!8603 (_1!4312 (_ BitVec 64)) (_2!4312 V!18563)) )
))
(declare-datatypes ((List!8676 0))(
  ( (Nil!8673) (Cons!8672 (h!9528 tuple2!8602) (t!14630 List!8676)) )
))
(declare-datatypes ((ListLongMap!7517 0))(
  ( (ListLongMap!7518 (toList!3774 List!8676)) )
))
(declare-fun lt!213435 () ListLongMap!7517)

(declare-fun lt!213433 () ListLongMap!7517)

(assert (=> b!470307 (= lt!213435 lt!213433)))

(declare-fun minValueBefore!38 () V!18563)

(declare-fun zeroValue!794 () V!18563)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((Unit!13761 0))(
  ( (Unit!13762) )
))
(declare-fun lt!213434 () Unit!13761)

(declare-fun minValueAfter!38 () V!18563)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!149 (array!29944 array!29946 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18563 V!18563 V!18563 V!18563 (_ BitVec 32) Int) Unit!13761)

(assert (=> b!470307 (= lt!213434 (lemmaNoChangeToArrayThenSameMapNoExtras!149 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1989 (array!29944 array!29946 (_ BitVec 32) (_ BitVec 32) V!18563 V!18563 (_ BitVec 32) Int) ListLongMap!7517)

(assert (=> b!470307 (= lt!213433 (getCurrentListMapNoExtraKeys!1989 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470307 (= lt!213435 (getCurrentListMapNoExtraKeys!1989 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470308 () Bool)

(declare-fun res!281048 () Bool)

(assert (=> b!470308 (=> (not res!281048) (not e!275502))))

(assert (=> b!470308 (= res!281048 (and (= (size!14748 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14747 _keys!1025) (size!14748 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!42118 res!281051) b!470308))

(assert (= (and b!470308 res!281048) b!470305))

(assert (= (and b!470305 res!281049) b!470304))

(assert (= (and b!470304 res!281050) b!470307))

(assert (= (and b!470302 condMapEmpty!21340) mapIsEmpty!21340))

(assert (= (and b!470302 (not condMapEmpty!21340)) mapNonEmpty!21340))

(get-info :version)

(assert (= (and mapNonEmpty!21340 ((_ is ValueCellFull!6203) mapValue!21340)) b!470306))

(assert (= (and b!470302 ((_ is ValueCellFull!6203) mapDefault!21340)) b!470303))

(assert (= start!42118 b!470302))

(declare-fun m!452845 () Bool)

(assert (=> b!470305 m!452845))

(declare-fun m!452847 () Bool)

(assert (=> start!42118 m!452847))

(declare-fun m!452849 () Bool)

(assert (=> start!42118 m!452849))

(declare-fun m!452851 () Bool)

(assert (=> start!42118 m!452851))

(declare-fun m!452853 () Bool)

(assert (=> b!470307 m!452853))

(declare-fun m!452855 () Bool)

(assert (=> b!470307 m!452855))

(declare-fun m!452857 () Bool)

(assert (=> b!470307 m!452857))

(declare-fun m!452859 () Bool)

(assert (=> b!470304 m!452859))

(declare-fun m!452861 () Bool)

(assert (=> mapNonEmpty!21340 m!452861))

(check-sat (not b!470305) (not start!42118) (not b_next!11665) (not b!470307) (not mapNonEmpty!21340) b_and!20097 (not b!470304) tp_is_empty!13093)
(check-sat b_and!20097 (not b_next!11665))
