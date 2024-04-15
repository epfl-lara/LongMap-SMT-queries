; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41614 () Bool)

(assert start!41614)

(declare-fun b_free!11281 () Bool)

(declare-fun b_next!11281 () Bool)

(assert (=> start!41614 (= b_free!11281 (not b_next!11281))))

(declare-fun tp!39844 () Bool)

(declare-fun b_and!19603 () Bool)

(assert (=> start!41614 (= tp!39844 b_and!19603)))

(declare-fun res!277782 () Bool)

(declare-fun e!271437 () Bool)

(assert (=> start!41614 (=> (not res!277782) (not e!271437))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41614 (= res!277782 (validMask!0 mask!1365))))

(assert (=> start!41614 e!271437))

(declare-fun tp_is_empty!12709 () Bool)

(assert (=> start!41614 tp_is_empty!12709))

(assert (=> start!41614 tp!39844))

(assert (=> start!41614 true))

(declare-datatypes ((array!29203 0))(
  ( (array!29204 (arr!14032 (Array (_ BitVec 32) (_ BitVec 64))) (size!14385 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29203)

(declare-fun array_inv!10216 (array!29203) Bool)

(assert (=> start!41614 (array_inv!10216 _keys!1025)))

(declare-datatypes ((V!18051 0))(
  ( (V!18052 (val!6399 Int)) )
))
(declare-datatypes ((ValueCell!6011 0))(
  ( (ValueCellFull!6011 (v!8680 V!18051)) (EmptyCell!6011) )
))
(declare-datatypes ((array!29205 0))(
  ( (array!29206 (arr!14033 (Array (_ BitVec 32) ValueCell!6011)) (size!14386 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29205)

(declare-fun e!271435 () Bool)

(declare-fun array_inv!10217 (array!29205) Bool)

(assert (=> start!41614 (and (array_inv!10217 _values!833) e!271435)))

(declare-fun b!464611 () Bool)

(assert (=> b!464611 (= e!271437 (not true))))

(declare-datatypes ((tuple2!8420 0))(
  ( (tuple2!8421 (_1!4221 (_ BitVec 64)) (_2!4221 V!18051)) )
))
(declare-datatypes ((List!8508 0))(
  ( (Nil!8505) (Cons!8504 (h!9360 tuple2!8420) (t!14447 List!8508)) )
))
(declare-datatypes ((ListLongMap!7323 0))(
  ( (ListLongMap!7324 (toList!3677 List!8508)) )
))
(declare-fun lt!209676 () ListLongMap!7323)

(declare-fun lt!209674 () ListLongMap!7323)

(assert (=> b!464611 (= lt!209676 lt!209674)))

(declare-fun minValueBefore!38 () V!18051)

(declare-fun zeroValue!794 () V!18051)

(declare-fun defaultEntry!841 () Int)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((Unit!13470 0))(
  ( (Unit!13471) )
))
(declare-fun lt!209675 () Unit!13470)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18051)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!26 (array!29203 array!29205 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18051 V!18051 V!18051 V!18051 (_ BitVec 32) Int) Unit!13470)

(assert (=> b!464611 (= lt!209675 (lemmaNoChangeToArrayThenSameMapNoExtras!26 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1869 (array!29203 array!29205 (_ BitVec 32) (_ BitVec 32) V!18051 V!18051 (_ BitVec 32) Int) ListLongMap!7323)

(assert (=> b!464611 (= lt!209674 (getCurrentListMapNoExtraKeys!1869 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!464611 (= lt!209676 (getCurrentListMapNoExtraKeys!1869 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun mapNonEmpty!20743 () Bool)

(declare-fun mapRes!20743 () Bool)

(declare-fun tp!39843 () Bool)

(declare-fun e!271434 () Bool)

(assert (=> mapNonEmpty!20743 (= mapRes!20743 (and tp!39843 e!271434))))

(declare-fun mapKey!20743 () (_ BitVec 32))

(declare-fun mapRest!20743 () (Array (_ BitVec 32) ValueCell!6011))

(declare-fun mapValue!20743 () ValueCell!6011)

(assert (=> mapNonEmpty!20743 (= (arr!14033 _values!833) (store mapRest!20743 mapKey!20743 mapValue!20743))))

(declare-fun b!464612 () Bool)

(declare-fun res!277780 () Bool)

(assert (=> b!464612 (=> (not res!277780) (not e!271437))))

(declare-datatypes ((List!8509 0))(
  ( (Nil!8506) (Cons!8505 (h!9361 (_ BitVec 64)) (t!14448 List!8509)) )
))
(declare-fun arrayNoDuplicates!0 (array!29203 (_ BitVec 32) List!8509) Bool)

(assert (=> b!464612 (= res!277780 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8506))))

(declare-fun b!464613 () Bool)

(assert (=> b!464613 (= e!271434 tp_is_empty!12709)))

(declare-fun b!464614 () Bool)

(declare-fun res!277781 () Bool)

(assert (=> b!464614 (=> (not res!277781) (not e!271437))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29203 (_ BitVec 32)) Bool)

(assert (=> b!464614 (= res!277781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20743 () Bool)

(assert (=> mapIsEmpty!20743 mapRes!20743))

(declare-fun b!464615 () Bool)

(declare-fun e!271438 () Bool)

(assert (=> b!464615 (= e!271438 tp_is_empty!12709)))

(declare-fun b!464616 () Bool)

(assert (=> b!464616 (= e!271435 (and e!271438 mapRes!20743))))

(declare-fun condMapEmpty!20743 () Bool)

(declare-fun mapDefault!20743 () ValueCell!6011)

(assert (=> b!464616 (= condMapEmpty!20743 (= (arr!14033 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6011)) mapDefault!20743)))))

(declare-fun b!464617 () Bool)

(declare-fun res!277779 () Bool)

(assert (=> b!464617 (=> (not res!277779) (not e!271437))))

(assert (=> b!464617 (= res!277779 (and (= (size!14386 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14385 _keys!1025) (size!14386 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41614 res!277782) b!464617))

(assert (= (and b!464617 res!277779) b!464614))

(assert (= (and b!464614 res!277781) b!464612))

(assert (= (and b!464612 res!277780) b!464611))

(assert (= (and b!464616 condMapEmpty!20743) mapIsEmpty!20743))

(assert (= (and b!464616 (not condMapEmpty!20743)) mapNonEmpty!20743))

(get-info :version)

(assert (= (and mapNonEmpty!20743 ((_ is ValueCellFull!6011) mapValue!20743)) b!464613))

(assert (= (and b!464616 ((_ is ValueCellFull!6011) mapDefault!20743)) b!464615))

(assert (= start!41614 b!464616))

(declare-fun m!446463 () Bool)

(assert (=> b!464612 m!446463))

(declare-fun m!446465 () Bool)

(assert (=> mapNonEmpty!20743 m!446465))

(declare-fun m!446467 () Bool)

(assert (=> start!41614 m!446467))

(declare-fun m!446469 () Bool)

(assert (=> start!41614 m!446469))

(declare-fun m!446471 () Bool)

(assert (=> start!41614 m!446471))

(declare-fun m!446473 () Bool)

(assert (=> b!464611 m!446473))

(declare-fun m!446475 () Bool)

(assert (=> b!464611 m!446475))

(declare-fun m!446477 () Bool)

(assert (=> b!464611 m!446477))

(declare-fun m!446479 () Bool)

(assert (=> b!464614 m!446479))

(check-sat (not b!464612) tp_is_empty!12709 (not b!464614) (not b!464611) b_and!19603 (not start!41614) (not mapNonEmpty!20743) (not b_next!11281))
(check-sat b_and!19603 (not b_next!11281))
