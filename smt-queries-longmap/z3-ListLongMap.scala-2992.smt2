; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42258 () Bool)

(assert start!42258)

(declare-fun b_free!11763 () Bool)

(declare-fun b_next!11763 () Bool)

(assert (=> start!42258 (= b_free!11763 (not b_next!11763))))

(declare-fun tp!41317 () Bool)

(declare-fun b_and!20201 () Bool)

(assert (=> start!42258 (= tp!41317 b_and!20201)))

(declare-fun b!471562 () Bool)

(declare-fun e!276388 () Bool)

(declare-fun e!276390 () Bool)

(declare-fun mapRes!21493 () Bool)

(assert (=> b!471562 (= e!276388 (and e!276390 mapRes!21493))))

(declare-fun condMapEmpty!21493 () Bool)

(declare-datatypes ((V!18693 0))(
  ( (V!18694 (val!6640 Int)) )
))
(declare-datatypes ((ValueCell!6252 0))(
  ( (ValueCellFull!6252 (v!8931 V!18693)) (EmptyCell!6252) )
))
(declare-datatypes ((array!30145 0))(
  ( (array!30146 (arr!14494 (Array (_ BitVec 32) ValueCell!6252)) (size!14846 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30145)

(declare-fun mapDefault!21493 () ValueCell!6252)

(assert (=> b!471562 (= condMapEmpty!21493 (= (arr!14494 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6252)) mapDefault!21493)))))

(declare-fun b!471563 () Bool)

(declare-fun e!276389 () Bool)

(declare-fun tp_is_empty!13191 () Bool)

(assert (=> b!471563 (= e!276389 tp_is_empty!13191)))

(declare-fun mapIsEmpty!21493 () Bool)

(assert (=> mapIsEmpty!21493 mapRes!21493))

(declare-fun b!471565 () Bool)

(declare-fun res!281706 () Bool)

(declare-fun e!276386 () Bool)

(assert (=> b!471565 (=> (not res!281706) (not e!276386))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30147 0))(
  ( (array!30148 (arr!14495 (Array (_ BitVec 32) (_ BitVec 64))) (size!14847 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30147)

(assert (=> b!471565 (= res!281706 (and (= (size!14846 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14847 _keys!1025) (size!14846 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!471566 () Bool)

(declare-fun res!281707 () Bool)

(assert (=> b!471566 (=> (not res!281707) (not e!276386))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30147 (_ BitVec 32)) Bool)

(assert (=> b!471566 (= res!281707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapNonEmpty!21493 () Bool)

(declare-fun tp!41316 () Bool)

(assert (=> mapNonEmpty!21493 (= mapRes!21493 (and tp!41316 e!276389))))

(declare-fun mapValue!21493 () ValueCell!6252)

(declare-fun mapRest!21493 () (Array (_ BitVec 32) ValueCell!6252))

(declare-fun mapKey!21493 () (_ BitVec 32))

(assert (=> mapNonEmpty!21493 (= (arr!14494 _values!833) (store mapRest!21493 mapKey!21493 mapValue!21493))))

(declare-fun b!471567 () Bool)

(declare-fun res!281705 () Bool)

(assert (=> b!471567 (=> (not res!281705) (not e!276386))))

(declare-datatypes ((List!8823 0))(
  ( (Nil!8820) (Cons!8819 (h!9675 (_ BitVec 64)) (t!14789 List!8823)) )
))
(declare-fun arrayNoDuplicates!0 (array!30147 (_ BitVec 32) List!8823) Bool)

(assert (=> b!471567 (= res!281705 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8820))))

(declare-fun b!471568 () Bool)

(assert (=> b!471568 (= e!276386 (not true))))

(declare-datatypes ((tuple2!8740 0))(
  ( (tuple2!8741 (_1!4381 (_ BitVec 64)) (_2!4381 V!18693)) )
))
(declare-datatypes ((List!8824 0))(
  ( (Nil!8821) (Cons!8820 (h!9676 tuple2!8740) (t!14790 List!8824)) )
))
(declare-datatypes ((ListLongMap!7653 0))(
  ( (ListLongMap!7654 (toList!3842 List!8824)) )
))
(declare-fun lt!213943 () ListLongMap!7653)

(declare-fun lt!213942 () ListLongMap!7653)

(assert (=> b!471568 (= lt!213943 lt!213942)))

(declare-fun minValueBefore!38 () V!18693)

(declare-fun zeroValue!794 () V!18693)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((Unit!13843 0))(
  ( (Unit!13844) )
))
(declare-fun lt!213944 () Unit!13843)

(declare-fun minValueAfter!38 () V!18693)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!185 (array!30147 array!30145 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18693 V!18693 V!18693 V!18693 (_ BitVec 32) Int) Unit!13843)

(assert (=> b!471568 (= lt!213944 (lemmaNoChangeToArrayThenSameMapNoExtras!185 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!2005 (array!30147 array!30145 (_ BitVec 32) (_ BitVec 32) V!18693 V!18693 (_ BitVec 32) Int) ListLongMap!7653)

(assert (=> b!471568 (= lt!213942 (getCurrentListMapNoExtraKeys!2005 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!471568 (= lt!213943 (getCurrentListMapNoExtraKeys!2005 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun res!281708 () Bool)

(assert (=> start!42258 (=> (not res!281708) (not e!276386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42258 (= res!281708 (validMask!0 mask!1365))))

(assert (=> start!42258 e!276386))

(assert (=> start!42258 tp_is_empty!13191))

(assert (=> start!42258 tp!41317))

(assert (=> start!42258 true))

(declare-fun array_inv!10448 (array!30147) Bool)

(assert (=> start!42258 (array_inv!10448 _keys!1025)))

(declare-fun array_inv!10449 (array!30145) Bool)

(assert (=> start!42258 (and (array_inv!10449 _values!833) e!276388)))

(declare-fun b!471564 () Bool)

(assert (=> b!471564 (= e!276390 tp_is_empty!13191)))

(assert (= (and start!42258 res!281708) b!471565))

(assert (= (and b!471565 res!281706) b!471566))

(assert (= (and b!471566 res!281707) b!471567))

(assert (= (and b!471567 res!281705) b!471568))

(assert (= (and b!471562 condMapEmpty!21493) mapIsEmpty!21493))

(assert (= (and b!471562 (not condMapEmpty!21493)) mapNonEmpty!21493))

(get-info :version)

(assert (= (and mapNonEmpty!21493 ((_ is ValueCellFull!6252) mapValue!21493)) b!471563))

(assert (= (and b!471562 ((_ is ValueCellFull!6252) mapDefault!21493)) b!471564))

(assert (= start!42258 b!471562))

(declare-fun m!453677 () Bool)

(assert (=> b!471567 m!453677))

(declare-fun m!453679 () Bool)

(assert (=> start!42258 m!453679))

(declare-fun m!453681 () Bool)

(assert (=> start!42258 m!453681))

(declare-fun m!453683 () Bool)

(assert (=> start!42258 m!453683))

(declare-fun m!453685 () Bool)

(assert (=> mapNonEmpty!21493 m!453685))

(declare-fun m!453687 () Bool)

(assert (=> b!471568 m!453687))

(declare-fun m!453689 () Bool)

(assert (=> b!471568 m!453689))

(declare-fun m!453691 () Bool)

(assert (=> b!471568 m!453691))

(declare-fun m!453693 () Bool)

(assert (=> b!471566 m!453693))

(check-sat b_and!20201 tp_is_empty!13191 (not b!471566) (not start!42258) (not b!471567) (not b!471568) (not mapNonEmpty!21493) (not b_next!11763))
(check-sat b_and!20201 (not b_next!11763))
