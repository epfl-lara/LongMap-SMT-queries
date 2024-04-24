; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42534 () Bool)

(assert start!42534)

(declare-fun b_free!11983 () Bool)

(declare-fun b_next!11983 () Bool)

(assert (=> start!42534 (= b_free!11983 (not b_next!11983))))

(declare-fun tp!41988 () Bool)

(declare-fun b_and!20473 () Bool)

(assert (=> start!42534 (= tp!41988 b_and!20473)))

(declare-fun mapIsEmpty!21835 () Bool)

(declare-fun mapRes!21835 () Bool)

(assert (=> mapIsEmpty!21835 mapRes!21835))

(declare-fun b!474649 () Bool)

(declare-fun res!283510 () Bool)

(declare-fun e!278618 () Bool)

(assert (=> b!474649 (=> (not res!283510) (not e!278618))))

(declare-datatypes ((array!30548 0))(
  ( (array!30549 (arr!14691 (Array (_ BitVec 32) (_ BitVec 64))) (size!15043 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30548)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30548 (_ BitVec 32)) Bool)

(assert (=> b!474649 (= res!283510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!474650 () Bool)

(declare-fun e!278617 () Bool)

(declare-fun tp_is_empty!13411 () Bool)

(assert (=> b!474650 (= e!278617 tp_is_empty!13411)))

(declare-fun b!474651 () Bool)

(declare-fun e!278619 () Bool)

(assert (=> b!474651 (= e!278619 tp_is_empty!13411)))

(declare-fun b!474652 () Bool)

(assert (=> b!474652 (= e!278618 false)))

(declare-datatypes ((V!18987 0))(
  ( (V!18988 (val!6750 Int)) )
))
(declare-fun zeroValue!794 () V!18987)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8824 0))(
  ( (tuple2!8825 (_1!4423 (_ BitVec 64)) (_2!4423 V!18987)) )
))
(declare-datatypes ((List!8884 0))(
  ( (Nil!8881) (Cons!8880 (h!9736 tuple2!8824) (t!14850 List!8884)) )
))
(declare-datatypes ((ListLongMap!7739 0))(
  ( (ListLongMap!7740 (toList!3885 List!8884)) )
))
(declare-fun lt!216280 () ListLongMap!7739)

(declare-datatypes ((ValueCell!6362 0))(
  ( (ValueCellFull!6362 (v!9044 V!18987)) (EmptyCell!6362) )
))
(declare-datatypes ((array!30550 0))(
  ( (array!30551 (arr!14692 (Array (_ BitVec 32) ValueCell!6362)) (size!15044 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30550)

(declare-fun minValueAfter!38 () V!18987)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2092 (array!30548 array!30550 (_ BitVec 32) (_ BitVec 32) V!18987 V!18987 (_ BitVec 32) Int) ListLongMap!7739)

(assert (=> b!474652 (= lt!216280 (getCurrentListMapNoExtraKeys!2092 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18987)

(declare-fun lt!216281 () ListLongMap!7739)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474652 (= lt!216281 (getCurrentListMapNoExtraKeys!2092 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474653 () Bool)

(declare-fun e!278615 () Bool)

(assert (=> b!474653 (= e!278615 (and e!278619 mapRes!21835))))

(declare-fun condMapEmpty!21835 () Bool)

(declare-fun mapDefault!21835 () ValueCell!6362)

(assert (=> b!474653 (= condMapEmpty!21835 (= (arr!14692 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6362)) mapDefault!21835)))))

(declare-fun b!474654 () Bool)

(declare-fun res!283509 () Bool)

(assert (=> b!474654 (=> (not res!283509) (not e!278618))))

(assert (=> b!474654 (= res!283509 (and (= (size!15044 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15043 _keys!1025) (size!15044 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474655 () Bool)

(declare-fun res!283508 () Bool)

(assert (=> b!474655 (=> (not res!283508) (not e!278618))))

(declare-datatypes ((List!8885 0))(
  ( (Nil!8882) (Cons!8881 (h!9737 (_ BitVec 64)) (t!14851 List!8885)) )
))
(declare-fun arrayNoDuplicates!0 (array!30548 (_ BitVec 32) List!8885) Bool)

(assert (=> b!474655 (= res!283508 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8882))))

(declare-fun res!283511 () Bool)

(assert (=> start!42534 (=> (not res!283511) (not e!278618))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42534 (= res!283511 (validMask!0 mask!1365))))

(assert (=> start!42534 e!278618))

(assert (=> start!42534 tp_is_empty!13411))

(assert (=> start!42534 tp!41988))

(assert (=> start!42534 true))

(declare-fun array_inv!10678 (array!30548) Bool)

(assert (=> start!42534 (array_inv!10678 _keys!1025)))

(declare-fun array_inv!10679 (array!30550) Bool)

(assert (=> start!42534 (and (array_inv!10679 _values!833) e!278615)))

(declare-fun mapNonEmpty!21835 () Bool)

(declare-fun tp!41989 () Bool)

(assert (=> mapNonEmpty!21835 (= mapRes!21835 (and tp!41989 e!278617))))

(declare-fun mapKey!21835 () (_ BitVec 32))

(declare-fun mapValue!21835 () ValueCell!6362)

(declare-fun mapRest!21835 () (Array (_ BitVec 32) ValueCell!6362))

(assert (=> mapNonEmpty!21835 (= (arr!14692 _values!833) (store mapRest!21835 mapKey!21835 mapValue!21835))))

(assert (= (and start!42534 res!283511) b!474654))

(assert (= (and b!474654 res!283509) b!474649))

(assert (= (and b!474649 res!283510) b!474655))

(assert (= (and b!474655 res!283508) b!474652))

(assert (= (and b!474653 condMapEmpty!21835) mapIsEmpty!21835))

(assert (= (and b!474653 (not condMapEmpty!21835)) mapNonEmpty!21835))

(get-info :version)

(assert (= (and mapNonEmpty!21835 ((_ is ValueCellFull!6362) mapValue!21835)) b!474650))

(assert (= (and b!474653 ((_ is ValueCellFull!6362) mapDefault!21835)) b!474651))

(assert (= start!42534 b!474653))

(declare-fun m!457245 () Bool)

(assert (=> b!474649 m!457245))

(declare-fun m!457247 () Bool)

(assert (=> mapNonEmpty!21835 m!457247))

(declare-fun m!457249 () Bool)

(assert (=> start!42534 m!457249))

(declare-fun m!457251 () Bool)

(assert (=> start!42534 m!457251))

(declare-fun m!457253 () Bool)

(assert (=> start!42534 m!457253))

(declare-fun m!457255 () Bool)

(assert (=> b!474652 m!457255))

(declare-fun m!457257 () Bool)

(assert (=> b!474652 m!457257))

(declare-fun m!457259 () Bool)

(assert (=> b!474655 m!457259))

(check-sat (not b!474649) (not mapNonEmpty!21835) (not b!474655) (not b!474652) (not b_next!11983) b_and!20473 tp_is_empty!13411 (not start!42534))
(check-sat b_and!20473 (not b_next!11983))
