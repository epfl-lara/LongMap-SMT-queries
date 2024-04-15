; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42174 () Bool)

(assert start!42174)

(declare-fun b_free!11707 () Bool)

(declare-fun b_next!11707 () Bool)

(assert (=> start!42174 (= b_free!11707 (not b_next!11707))))

(declare-fun tp!41145 () Bool)

(declare-fun b_and!20111 () Bool)

(assert (=> start!42174 (= tp!41145 b_and!20111)))

(declare-fun b!470618 () Bool)

(declare-fun e!275738 () Bool)

(declare-fun tp_is_empty!13135 () Bool)

(assert (=> b!470618 (= e!275738 tp_is_empty!13135)))

(declare-fun b!470619 () Bool)

(declare-fun e!275741 () Bool)

(declare-fun e!275740 () Bool)

(declare-fun mapRes!21406 () Bool)

(assert (=> b!470619 (= e!275741 (and e!275740 mapRes!21406))))

(declare-fun condMapEmpty!21406 () Bool)

(declare-datatypes ((V!18619 0))(
  ( (V!18620 (val!6612 Int)) )
))
(declare-datatypes ((ValueCell!6224 0))(
  ( (ValueCellFull!6224 (v!8897 V!18619)) (EmptyCell!6224) )
))
(declare-datatypes ((array!30019 0))(
  ( (array!30020 (arr!14432 (Array (_ BitVec 32) ValueCell!6224)) (size!14785 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30019)

(declare-fun mapDefault!21406 () ValueCell!6224)

(assert (=> b!470619 (= condMapEmpty!21406 (= (arr!14432 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6224)) mapDefault!21406)))))

(declare-fun b!470620 () Bool)

(declare-fun res!281211 () Bool)

(declare-fun e!275739 () Bool)

(assert (=> b!470620 (=> (not res!281211) (not e!275739))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-datatypes ((array!30021 0))(
  ( (array!30022 (arr!14433 (Array (_ BitVec 32) (_ BitVec 64))) (size!14786 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30021)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!470620 (= res!281211 (and (= (size!14785 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14786 _keys!1025) (size!14785 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!21406 () Bool)

(declare-fun tp!41146 () Bool)

(assert (=> mapNonEmpty!21406 (= mapRes!21406 (and tp!41146 e!275738))))

(declare-fun mapRest!21406 () (Array (_ BitVec 32) ValueCell!6224))

(declare-fun mapKey!21406 () (_ BitVec 32))

(declare-fun mapValue!21406 () ValueCell!6224)

(assert (=> mapNonEmpty!21406 (= (arr!14432 _values!833) (store mapRest!21406 mapKey!21406 mapValue!21406))))

(declare-fun b!470622 () Bool)

(assert (=> b!470622 (= e!275739 (not true))))

(declare-datatypes ((tuple2!8740 0))(
  ( (tuple2!8741 (_1!4381 (_ BitVec 64)) (_2!4381 V!18619)) )
))
(declare-datatypes ((List!8810 0))(
  ( (Nil!8807) (Cons!8806 (h!9662 tuple2!8740) (t!14765 List!8810)) )
))
(declare-datatypes ((ListLongMap!7643 0))(
  ( (ListLongMap!7644 (toList!3837 List!8810)) )
))
(declare-fun lt!213417 () ListLongMap!7643)

(declare-fun lt!213418 () ListLongMap!7643)

(assert (=> b!470622 (= lt!213417 lt!213418)))

(declare-fun minValueBefore!38 () V!18619)

(declare-fun zeroValue!794 () V!18619)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13775 0))(
  ( (Unit!13776) )
))
(declare-fun lt!213416 () Unit!13775)

(declare-fun minValueAfter!38 () V!18619)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!169 (array!30021 array!30019 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18619 V!18619 V!18619 V!18619 (_ BitVec 32) Int) Unit!13775)

(assert (=> b!470622 (= lt!213416 (lemmaNoChangeToArrayThenSameMapNoExtras!169 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2012 (array!30021 array!30019 (_ BitVec 32) (_ BitVec 32) V!18619 V!18619 (_ BitVec 32) Int) ListLongMap!7643)

(assert (=> b!470622 (= lt!213418 (getCurrentListMapNoExtraKeys!2012 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470622 (= lt!213417 (getCurrentListMapNoExtraKeys!2012 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470623 () Bool)

(declare-fun res!281210 () Bool)

(assert (=> b!470623 (=> (not res!281210) (not e!275739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30021 (_ BitVec 32)) Bool)

(assert (=> b!470623 (= res!281210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21406 () Bool)

(assert (=> mapIsEmpty!21406 mapRes!21406))

(declare-fun b!470624 () Bool)

(declare-fun res!281212 () Bool)

(assert (=> b!470624 (=> (not res!281212) (not e!275739))))

(declare-datatypes ((List!8811 0))(
  ( (Nil!8808) (Cons!8807 (h!9663 (_ BitVec 64)) (t!14766 List!8811)) )
))
(declare-fun arrayNoDuplicates!0 (array!30021 (_ BitVec 32) List!8811) Bool)

(assert (=> b!470624 (= res!281212 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8808))))

(declare-fun res!281209 () Bool)

(assert (=> start!42174 (=> (not res!281209) (not e!275739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42174 (= res!281209 (validMask!0 mask!1365))))

(assert (=> start!42174 e!275739))

(assert (=> start!42174 tp_is_empty!13135))

(assert (=> start!42174 tp!41145))

(assert (=> start!42174 true))

(declare-fun array_inv!10496 (array!30021) Bool)

(assert (=> start!42174 (array_inv!10496 _keys!1025)))

(declare-fun array_inv!10497 (array!30019) Bool)

(assert (=> start!42174 (and (array_inv!10497 _values!833) e!275741)))

(declare-fun b!470621 () Bool)

(assert (=> b!470621 (= e!275740 tp_is_empty!13135)))

(assert (= (and start!42174 res!281209) b!470620))

(assert (= (and b!470620 res!281211) b!470623))

(assert (= (and b!470623 res!281210) b!470624))

(assert (= (and b!470624 res!281212) b!470622))

(assert (= (and b!470619 condMapEmpty!21406) mapIsEmpty!21406))

(assert (= (and b!470619 (not condMapEmpty!21406)) mapNonEmpty!21406))

(get-info :version)

(assert (= (and mapNonEmpty!21406 ((_ is ValueCellFull!6224) mapValue!21406)) b!470618))

(assert (= (and b!470619 ((_ is ValueCellFull!6224) mapDefault!21406)) b!470621))

(assert (= start!42174 b!470619))

(declare-fun m!452373 () Bool)

(assert (=> mapNonEmpty!21406 m!452373))

(declare-fun m!452375 () Bool)

(assert (=> b!470623 m!452375))

(declare-fun m!452377 () Bool)

(assert (=> b!470622 m!452377))

(declare-fun m!452379 () Bool)

(assert (=> b!470622 m!452379))

(declare-fun m!452381 () Bool)

(assert (=> b!470622 m!452381))

(declare-fun m!452383 () Bool)

(assert (=> b!470624 m!452383))

(declare-fun m!452385 () Bool)

(assert (=> start!42174 m!452385))

(declare-fun m!452387 () Bool)

(assert (=> start!42174 m!452387))

(declare-fun m!452389 () Bool)

(assert (=> start!42174 m!452389))

(check-sat b_and!20111 (not b!470623) (not mapNonEmpty!21406) (not b!470624) (not start!42174) (not b_next!11707) tp_is_empty!13135 (not b!470622))
(check-sat b_and!20111 (not b_next!11707))
