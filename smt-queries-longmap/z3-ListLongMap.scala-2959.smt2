; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41976 () Bool)

(assert start!41976)

(declare-fun b_free!11563 () Bool)

(declare-fun b_next!11563 () Bool)

(assert (=> start!41976 (= b_free!11563 (not b_next!11563))))

(declare-fun tp!40705 () Bool)

(declare-fun b_and!19935 () Bool)

(assert (=> start!41976 (= tp!40705 b_and!19935)))

(declare-fun mapIsEmpty!21181 () Bool)

(declare-fun mapRes!21181 () Bool)

(assert (=> mapIsEmpty!21181 mapRes!21181))

(declare-fun res!280037 () Bool)

(declare-fun e!274254 () Bool)

(assert (=> start!41976 (=> (not res!280037) (not e!274254))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41976 (= res!280037 (validMask!0 mask!1365))))

(assert (=> start!41976 e!274254))

(declare-fun tp_is_empty!12991 () Bool)

(assert (=> start!41976 tp_is_empty!12991))

(assert (=> start!41976 tp!40705))

(assert (=> start!41976 true))

(declare-datatypes ((array!29739 0))(
  ( (array!29740 (arr!14295 (Array (_ BitVec 32) (_ BitVec 64))) (size!14648 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!29739)

(declare-fun array_inv!10402 (array!29739) Bool)

(assert (=> start!41976 (array_inv!10402 _keys!1025)))

(declare-datatypes ((V!18427 0))(
  ( (V!18428 (val!6540 Int)) )
))
(declare-datatypes ((ValueCell!6152 0))(
  ( (ValueCellFull!6152 (v!8823 V!18427)) (EmptyCell!6152) )
))
(declare-datatypes ((array!29741 0))(
  ( (array!29742 (arr!14296 (Array (_ BitVec 32) ValueCell!6152)) (size!14649 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!29741)

(declare-fun e!274256 () Bool)

(declare-fun array_inv!10403 (array!29741) Bool)

(assert (=> start!41976 (and (array_inv!10403 _values!833) e!274256)))

(declare-fun mapNonEmpty!21181 () Bool)

(declare-fun tp!40704 () Bool)

(declare-fun e!274259 () Bool)

(assert (=> mapNonEmpty!21181 (= mapRes!21181 (and tp!40704 e!274259))))

(declare-fun mapValue!21181 () ValueCell!6152)

(declare-fun mapKey!21181 () (_ BitVec 32))

(declare-fun mapRest!21181 () (Array (_ BitVec 32) ValueCell!6152))

(assert (=> mapNonEmpty!21181 (= (arr!14296 _values!833) (store mapRest!21181 mapKey!21181 mapValue!21181))))

(declare-fun b!468539 () Bool)

(declare-fun e!274255 () Bool)

(assert (=> b!468539 (= e!274255 tp_is_empty!12991)))

(declare-fun b!468540 () Bool)

(assert (=> b!468540 (= e!274256 (and e!274255 mapRes!21181))))

(declare-fun condMapEmpty!21181 () Bool)

(declare-fun mapDefault!21181 () ValueCell!6152)

(assert (=> b!468540 (= condMapEmpty!21181 (= (arr!14296 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6152)) mapDefault!21181)))))

(declare-fun b!468541 () Bool)

(assert (=> b!468541 (= e!274259 tp_is_empty!12991)))

(declare-fun b!468542 () Bool)

(declare-fun e!274258 () Bool)

(assert (=> b!468542 (= e!274254 (not e!274258))))

(declare-fun res!280039 () Bool)

(assert (=> b!468542 (=> res!280039 e!274258)))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!468542 (= res!280039 (or (not (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!8636 0))(
  ( (tuple2!8637 (_1!4329 (_ BitVec 64)) (_2!4329 V!18427)) )
))
(declare-datatypes ((List!8708 0))(
  ( (Nil!8705) (Cons!8704 (h!9560 tuple2!8636) (t!14657 List!8708)) )
))
(declare-datatypes ((ListLongMap!7539 0))(
  ( (ListLongMap!7540 (toList!3785 List!8708)) )
))
(declare-fun lt!211935 () ListLongMap!7539)

(declare-fun lt!211934 () ListLongMap!7539)

(assert (=> b!468542 (= lt!211935 lt!211934)))

(declare-fun minValueBefore!38 () V!18427)

(declare-fun zeroValue!794 () V!18427)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13667 0))(
  ( (Unit!13668) )
))
(declare-fun lt!211932 () Unit!13667)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun minValueAfter!38 () V!18427)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!122 (array!29739 array!29741 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18427 V!18427 V!18427 V!18427 (_ BitVec 32) Int) Unit!13667)

(assert (=> b!468542 (= lt!211932 (lemmaNoChangeToArrayThenSameMapNoExtras!122 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1965 (array!29739 array!29741 (_ BitVec 32) (_ BitVec 32) V!18427 V!18427 (_ BitVec 32) Int) ListLongMap!7539)

(assert (=> b!468542 (= lt!211934 (getCurrentListMapNoExtraKeys!1965 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!468542 (= lt!211935 (getCurrentListMapNoExtraKeys!1965 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468543 () Bool)

(declare-fun res!280036 () Bool)

(assert (=> b!468543 (=> (not res!280036) (not e!274254))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!29739 (_ BitVec 32)) Bool)

(assert (=> b!468543 (= res!280036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!468544 () Bool)

(declare-fun res!280040 () Bool)

(assert (=> b!468544 (=> (not res!280040) (not e!274254))))

(assert (=> b!468544 (= res!280040 (and (= (size!14649 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14648 _keys!1025) (size!14649 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!468545 () Bool)

(assert (=> b!468545 (= e!274258 true)))

(declare-fun lt!211936 () tuple2!8636)

(declare-fun +!1716 (ListLongMap!7539 tuple2!8636) ListLongMap!7539)

(assert (=> b!468545 (= (+!1716 lt!211935 lt!211936) (+!1716 (+!1716 lt!211935 (tuple2!8637 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38)) lt!211936))))

(assert (=> b!468545 (= lt!211936 (tuple2!8637 #b1000000000000000000000000000000000000000000000000000000000000000 minValueAfter!38))))

(declare-fun lt!211933 () Unit!13667)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!99 (ListLongMap!7539 (_ BitVec 64) V!18427 V!18427) Unit!13667)

(assert (=> b!468545 (= lt!211933 (addSameAsAddTwiceSameKeyDiffValues!99 lt!211935 #b1000000000000000000000000000000000000000000000000000000000000000 minValueBefore!38 minValueAfter!38))))

(declare-fun lt!211930 () ListLongMap!7539)

(declare-fun getCurrentListMap!2152 (array!29739 array!29741 (_ BitVec 32) (_ BitVec 32) V!18427 V!18427 (_ BitVec 32) Int) ListLongMap!7539)

(assert (=> b!468545 (= lt!211930 (getCurrentListMap!2152 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun lt!211931 () ListLongMap!7539)

(assert (=> b!468545 (= lt!211931 (getCurrentListMap!2152 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!468546 () Bool)

(declare-fun res!280038 () Bool)

(assert (=> b!468546 (=> (not res!280038) (not e!274254))))

(declare-datatypes ((List!8709 0))(
  ( (Nil!8706) (Cons!8705 (h!9561 (_ BitVec 64)) (t!14658 List!8709)) )
))
(declare-fun arrayNoDuplicates!0 (array!29739 (_ BitVec 32) List!8709) Bool)

(assert (=> b!468546 (= res!280038 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8706))))

(assert (= (and start!41976 res!280037) b!468544))

(assert (= (and b!468544 res!280040) b!468543))

(assert (= (and b!468543 res!280036) b!468546))

(assert (= (and b!468546 res!280038) b!468542))

(assert (= (and b!468542 (not res!280039)) b!468545))

(assert (= (and b!468540 condMapEmpty!21181) mapIsEmpty!21181))

(assert (= (and b!468540 (not condMapEmpty!21181)) mapNonEmpty!21181))

(get-info :version)

(assert (= (and mapNonEmpty!21181 ((_ is ValueCellFull!6152) mapValue!21181)) b!468541))

(assert (= (and b!468540 ((_ is ValueCellFull!6152) mapDefault!21181)) b!468539))

(assert (= start!41976 b!468540))

(declare-fun m!450107 () Bool)

(assert (=> mapNonEmpty!21181 m!450107))

(declare-fun m!450109 () Bool)

(assert (=> b!468542 m!450109))

(declare-fun m!450111 () Bool)

(assert (=> b!468542 m!450111))

(declare-fun m!450113 () Bool)

(assert (=> b!468542 m!450113))

(declare-fun m!450115 () Bool)

(assert (=> b!468545 m!450115))

(declare-fun m!450117 () Bool)

(assert (=> b!468545 m!450117))

(declare-fun m!450119 () Bool)

(assert (=> b!468545 m!450119))

(declare-fun m!450121 () Bool)

(assert (=> b!468545 m!450121))

(assert (=> b!468545 m!450115))

(declare-fun m!450123 () Bool)

(assert (=> b!468545 m!450123))

(declare-fun m!450125 () Bool)

(assert (=> b!468545 m!450125))

(declare-fun m!450127 () Bool)

(assert (=> b!468543 m!450127))

(declare-fun m!450129 () Bool)

(assert (=> start!41976 m!450129))

(declare-fun m!450131 () Bool)

(assert (=> start!41976 m!450131))

(declare-fun m!450133 () Bool)

(assert (=> start!41976 m!450133))

(declare-fun m!450135 () Bool)

(assert (=> b!468546 m!450135))

(check-sat tp_is_empty!12991 (not mapNonEmpty!21181) (not b!468543) (not b_next!11563) (not b!468542) (not b!468546) b_and!19935 (not b!468545) (not start!41976))
(check-sat b_and!19935 (not b_next!11563))
