; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42242 () Bool)

(assert start!42242)

(declare-fun b_free!11761 () Bool)

(declare-fun b_next!11761 () Bool)

(assert (=> start!42242 (= b_free!11761 (not b_next!11761))))

(declare-fun tp!41311 () Bool)

(declare-fun b_and!20209 () Bool)

(assert (=> start!42242 (= tp!41311 b_and!20209)))

(declare-fun b!471480 () Bool)

(declare-fun res!281688 () Bool)

(declare-fun e!276335 () Bool)

(assert (=> b!471480 (=> (not res!281688) (not e!276335))))

(declare-datatypes ((array!30128 0))(
  ( (array!30129 (arr!14485 (Array (_ BitVec 32) (_ BitVec 64))) (size!14837 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30128)

(declare-datatypes ((List!8735 0))(
  ( (Nil!8732) (Cons!8731 (h!9587 (_ BitVec 64)) (t!14693 List!8735)) )
))
(declare-fun arrayNoDuplicates!0 (array!30128 (_ BitVec 32) List!8735) Bool)

(assert (=> b!471480 (= res!281688 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8732))))

(declare-fun b!471481 () Bool)

(declare-fun res!281686 () Bool)

(assert (=> b!471481 (=> (not res!281686) (not e!276335))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30128 (_ BitVec 32)) Bool)

(assert (=> b!471481 (= res!281686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!281689 () Bool)

(assert (=> start!42242 (=> (not res!281689) (not e!276335))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42242 (= res!281689 (validMask!0 mask!1365))))

(assert (=> start!42242 e!276335))

(declare-fun tp_is_empty!13189 () Bool)

(assert (=> start!42242 tp_is_empty!13189))

(assert (=> start!42242 tp!41311))

(assert (=> start!42242 true))

(declare-fun array_inv!10542 (array!30128) Bool)

(assert (=> start!42242 (array_inv!10542 _keys!1025)))

(declare-datatypes ((V!18691 0))(
  ( (V!18692 (val!6639 Int)) )
))
(declare-datatypes ((ValueCell!6251 0))(
  ( (ValueCellFull!6251 (v!8931 V!18691)) (EmptyCell!6251) )
))
(declare-datatypes ((array!30130 0))(
  ( (array!30131 (arr!14486 (Array (_ BitVec 32) ValueCell!6251)) (size!14838 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30130)

(declare-fun e!276336 () Bool)

(declare-fun array_inv!10543 (array!30130) Bool)

(assert (=> start!42242 (and (array_inv!10543 _values!833) e!276336)))

(declare-fun b!471482 () Bool)

(declare-fun e!276332 () Bool)

(assert (=> b!471482 (= e!276332 tp_is_empty!13189)))

(declare-fun mapNonEmpty!21490 () Bool)

(declare-fun mapRes!21490 () Bool)

(declare-fun tp!41310 () Bool)

(declare-fun e!276333 () Bool)

(assert (=> mapNonEmpty!21490 (= mapRes!21490 (and tp!41310 e!276333))))

(declare-fun mapRest!21490 () (Array (_ BitVec 32) ValueCell!6251))

(declare-fun mapValue!21490 () ValueCell!6251)

(declare-fun mapKey!21490 () (_ BitVec 32))

(assert (=> mapNonEmpty!21490 (= (arr!14486 _values!833) (store mapRest!21490 mapKey!21490 mapValue!21490))))

(declare-fun mapIsEmpty!21490 () Bool)

(assert (=> mapIsEmpty!21490 mapRes!21490))

(declare-fun b!471483 () Bool)

(assert (=> b!471483 (= e!276333 tp_is_empty!13189)))

(declare-fun b!471484 () Bool)

(declare-fun res!281687 () Bool)

(assert (=> b!471484 (=> (not res!281687) (not e!276335))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!471484 (= res!281687 (and (= (size!14838 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14837 _keys!1025) (size!14838 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471485 () Bool)

(assert (=> b!471485 (= e!276335 (not true))))

(declare-datatypes ((tuple2!8666 0))(
  ( (tuple2!8667 (_1!4344 (_ BitVec 64)) (_2!4344 V!18691)) )
))
(declare-datatypes ((List!8736 0))(
  ( (Nil!8733) (Cons!8732 (h!9588 tuple2!8666) (t!14694 List!8736)) )
))
(declare-datatypes ((ListLongMap!7581 0))(
  ( (ListLongMap!7582 (toList!3806 List!8736)) )
))
(declare-fun lt!213947 () ListLongMap!7581)

(declare-fun lt!213945 () ListLongMap!7581)

(assert (=> b!471485 (= lt!213947 lt!213945)))

(declare-fun minValueBefore!38 () V!18691)

(declare-fun zeroValue!794 () V!18691)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13825 0))(
  ( (Unit!13826) )
))
(declare-fun lt!213946 () Unit!13825)

(declare-fun minValueAfter!38 () V!18691)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!181 (array!30128 array!30130 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18691 V!18691 V!18691 V!18691 (_ BitVec 32) Int) Unit!13825)

(assert (=> b!471485 (= lt!213946 (lemmaNoChangeToArrayThenSameMapNoExtras!181 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2021 (array!30128 array!30130 (_ BitVec 32) (_ BitVec 32) V!18691 V!18691 (_ BitVec 32) Int) ListLongMap!7581)

(assert (=> b!471485 (= lt!213945 (getCurrentListMapNoExtraKeys!2021 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471485 (= lt!213947 (getCurrentListMapNoExtraKeys!2021 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471486 () Bool)

(assert (=> b!471486 (= e!276336 (and e!276332 mapRes!21490))))

(declare-fun condMapEmpty!21490 () Bool)

(declare-fun mapDefault!21490 () ValueCell!6251)

(assert (=> b!471486 (= condMapEmpty!21490 (= (arr!14486 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6251)) mapDefault!21490)))))

(assert (= (and start!42242 res!281689) b!471484))

(assert (= (and b!471484 res!281687) b!471481))

(assert (= (and b!471481 res!281686) b!471480))

(assert (= (and b!471480 res!281688) b!471485))

(assert (= (and b!471486 condMapEmpty!21490) mapIsEmpty!21490))

(assert (= (and b!471486 (not condMapEmpty!21490)) mapNonEmpty!21490))

(get-info :version)

(assert (= (and mapNonEmpty!21490 ((_ is ValueCellFull!6251) mapValue!21490)) b!471483))

(assert (= (and b!471486 ((_ is ValueCellFull!6251) mapDefault!21490)) b!471482))

(assert (= start!42242 b!471486))

(declare-fun m!453841 () Bool)

(assert (=> start!42242 m!453841))

(declare-fun m!453843 () Bool)

(assert (=> start!42242 m!453843))

(declare-fun m!453845 () Bool)

(assert (=> start!42242 m!453845))

(declare-fun m!453847 () Bool)

(assert (=> mapNonEmpty!21490 m!453847))

(declare-fun m!453849 () Bool)

(assert (=> b!471480 m!453849))

(declare-fun m!453851 () Bool)

(assert (=> b!471485 m!453851))

(declare-fun m!453853 () Bool)

(assert (=> b!471485 m!453853))

(declare-fun m!453855 () Bool)

(assert (=> b!471485 m!453855))

(declare-fun m!453857 () Bool)

(assert (=> b!471481 m!453857))

(check-sat (not b_next!11761) (not b!471480) (not start!42242) (not b!471481) b_and!20209 (not mapNonEmpty!21490) tp_is_empty!13189 (not b!471485))
(check-sat b_and!20209 (not b_next!11761))
