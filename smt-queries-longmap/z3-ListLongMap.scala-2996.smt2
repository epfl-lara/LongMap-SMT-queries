; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42266 () Bool)

(assert start!42266)

(declare-fun b_free!11785 () Bool)

(declare-fun b_next!11785 () Bool)

(assert (=> start!42266 (= b_free!11785 (not b_next!11785))))

(declare-fun tp!41382 () Bool)

(declare-fun b_and!20233 () Bool)

(assert (=> start!42266 (= tp!41382 b_and!20233)))

(declare-fun b!471732 () Bool)

(declare-fun res!281833 () Bool)

(declare-fun e!276512 () Bool)

(assert (=> b!471732 (=> (not res!281833) (not e!276512))))

(declare-datatypes ((array!30174 0))(
  ( (array!30175 (arr!14508 (Array (_ BitVec 32) (_ BitVec 64))) (size!14860 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30174)

(declare-datatypes ((List!8747 0))(
  ( (Nil!8744) (Cons!8743 (h!9599 (_ BitVec 64)) (t!14705 List!8747)) )
))
(declare-fun arrayNoDuplicates!0 (array!30174 (_ BitVec 32) List!8747) Bool)

(assert (=> b!471732 (= res!281833 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8744))))

(declare-fun b!471733 () Bool)

(declare-fun e!276515 () Bool)

(declare-fun e!276514 () Bool)

(declare-fun mapRes!21526 () Bool)

(assert (=> b!471733 (= e!276515 (and e!276514 mapRes!21526))))

(declare-fun condMapEmpty!21526 () Bool)

(declare-datatypes ((V!18723 0))(
  ( (V!18724 (val!6651 Int)) )
))
(declare-datatypes ((ValueCell!6263 0))(
  ( (ValueCellFull!6263 (v!8943 V!18723)) (EmptyCell!6263) )
))
(declare-datatypes ((array!30176 0))(
  ( (array!30177 (arr!14509 (Array (_ BitVec 32) ValueCell!6263)) (size!14861 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30176)

(declare-fun mapDefault!21526 () ValueCell!6263)

(assert (=> b!471733 (= condMapEmpty!21526 (= (arr!14509 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6263)) mapDefault!21526)))))

(declare-fun mapNonEmpty!21526 () Bool)

(declare-fun tp!41383 () Bool)

(declare-fun e!276516 () Bool)

(assert (=> mapNonEmpty!21526 (= mapRes!21526 (and tp!41383 e!276516))))

(declare-fun mapRest!21526 () (Array (_ BitVec 32) ValueCell!6263))

(declare-fun mapKey!21526 () (_ BitVec 32))

(declare-fun mapValue!21526 () ValueCell!6263)

(assert (=> mapNonEmpty!21526 (= (arr!14509 _values!833) (store mapRest!21526 mapKey!21526 mapValue!21526))))

(declare-fun mapIsEmpty!21526 () Bool)

(assert (=> mapIsEmpty!21526 mapRes!21526))

(declare-fun res!281830 () Bool)

(assert (=> start!42266 (=> (not res!281830) (not e!276512))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42266 (= res!281830 (validMask!0 mask!1365))))

(assert (=> start!42266 e!276512))

(declare-fun tp_is_empty!13213 () Bool)

(assert (=> start!42266 tp_is_empty!13213))

(assert (=> start!42266 tp!41382))

(assert (=> start!42266 true))

(declare-fun array_inv!10554 (array!30174) Bool)

(assert (=> start!42266 (array_inv!10554 _keys!1025)))

(declare-fun array_inv!10555 (array!30176) Bool)

(assert (=> start!42266 (and (array_inv!10555 _values!833) e!276515)))

(declare-fun b!471734 () Bool)

(assert (=> b!471734 (= e!276512 (not true))))

(declare-datatypes ((tuple2!8680 0))(
  ( (tuple2!8681 (_1!4351 (_ BitVec 64)) (_2!4351 V!18723)) )
))
(declare-datatypes ((List!8748 0))(
  ( (Nil!8745) (Cons!8744 (h!9600 tuple2!8680) (t!14706 List!8748)) )
))
(declare-datatypes ((ListLongMap!7595 0))(
  ( (ListLongMap!7596 (toList!3813 List!8748)) )
))
(declare-fun lt!214053 () ListLongMap!7595)

(declare-fun lt!214055 () ListLongMap!7595)

(assert (=> b!471734 (= lt!214053 lt!214055)))

(declare-fun minValueBefore!38 () V!18723)

(declare-fun zeroValue!794 () V!18723)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13839 0))(
  ( (Unit!13840) )
))
(declare-fun lt!214054 () Unit!13839)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18723)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!188 (array!30174 array!30176 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18723 V!18723 V!18723 V!18723 (_ BitVec 32) Int) Unit!13839)

(assert (=> b!471734 (= lt!214054 (lemmaNoChangeToArrayThenSameMapNoExtras!188 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2028 (array!30174 array!30176 (_ BitVec 32) (_ BitVec 32) V!18723 V!18723 (_ BitVec 32) Int) ListLongMap!7595)

(assert (=> b!471734 (= lt!214055 (getCurrentListMapNoExtraKeys!2028 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471734 (= lt!214053 (getCurrentListMapNoExtraKeys!2028 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!471735 () Bool)

(assert (=> b!471735 (= e!276514 tp_is_empty!13213)))

(declare-fun b!471736 () Bool)

(declare-fun res!281832 () Bool)

(assert (=> b!471736 (=> (not res!281832) (not e!276512))))

(assert (=> b!471736 (= res!281832 (and (= (size!14861 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14860 _keys!1025) (size!14861 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471737 () Bool)

(declare-fun res!281831 () Bool)

(assert (=> b!471737 (=> (not res!281831) (not e!276512))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30174 (_ BitVec 32)) Bool)

(assert (=> b!471737 (= res!281831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!471738 () Bool)

(assert (=> b!471738 (= e!276516 tp_is_empty!13213)))

(assert (= (and start!42266 res!281830) b!471736))

(assert (= (and b!471736 res!281832) b!471737))

(assert (= (and b!471737 res!281831) b!471732))

(assert (= (and b!471732 res!281833) b!471734))

(assert (= (and b!471733 condMapEmpty!21526) mapIsEmpty!21526))

(assert (= (and b!471733 (not condMapEmpty!21526)) mapNonEmpty!21526))

(get-info :version)

(assert (= (and mapNonEmpty!21526 ((_ is ValueCellFull!6263) mapValue!21526)) b!471738))

(assert (= (and b!471733 ((_ is ValueCellFull!6263) mapDefault!21526)) b!471735))

(assert (= start!42266 b!471733))

(declare-fun m!454057 () Bool)

(assert (=> b!471732 m!454057))

(declare-fun m!454059 () Bool)

(assert (=> b!471737 m!454059))

(declare-fun m!454061 () Bool)

(assert (=> b!471734 m!454061))

(declare-fun m!454063 () Bool)

(assert (=> b!471734 m!454063))

(declare-fun m!454065 () Bool)

(assert (=> b!471734 m!454065))

(declare-fun m!454067 () Bool)

(assert (=> mapNonEmpty!21526 m!454067))

(declare-fun m!454069 () Bool)

(assert (=> start!42266 m!454069))

(declare-fun m!454071 () Bool)

(assert (=> start!42266 m!454071))

(declare-fun m!454073 () Bool)

(assert (=> start!42266 m!454073))

(check-sat (not b!471734) (not mapNonEmpty!21526) (not b!471732) (not b_next!11785) tp_is_empty!13213 b_and!20233 (not start!42266) (not b!471737))
(check-sat b_and!20233 (not b_next!11785))
