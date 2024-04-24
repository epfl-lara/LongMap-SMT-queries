; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!42540 () Bool)

(assert start!42540)

(declare-fun b_free!11989 () Bool)

(declare-fun b_next!11989 () Bool)

(assert (=> start!42540 (= b_free!11989 (not b_next!11989))))

(declare-fun tp!42007 () Bool)

(declare-fun b_and!20479 () Bool)

(assert (=> start!42540 (= tp!42007 b_and!20479)))

(declare-fun mapNonEmpty!21844 () Bool)

(declare-fun mapRes!21844 () Bool)

(declare-fun tp!42006 () Bool)

(declare-fun e!278662 () Bool)

(assert (=> mapNonEmpty!21844 (= mapRes!21844 (and tp!42006 e!278662))))

(declare-datatypes ((V!18995 0))(
  ( (V!18996 (val!6753 Int)) )
))
(declare-datatypes ((ValueCell!6365 0))(
  ( (ValueCellFull!6365 (v!9047 V!18995)) (EmptyCell!6365) )
))
(declare-datatypes ((array!30560 0))(
  ( (array!30561 (arr!14697 (Array (_ BitVec 32) ValueCell!6365)) (size!15049 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30560)

(declare-fun mapKey!21844 () (_ BitVec 32))

(declare-fun mapValue!21844 () ValueCell!6365)

(declare-fun mapRest!21844 () (Array (_ BitVec 32) ValueCell!6365))

(assert (=> mapNonEmpty!21844 (= (arr!14697 _values!833) (store mapRest!21844 mapKey!21844 mapValue!21844))))

(declare-fun b!474712 () Bool)

(declare-fun e!278664 () Bool)

(declare-fun tp_is_empty!13417 () Bool)

(assert (=> b!474712 (= e!278664 tp_is_empty!13417)))

(declare-fun b!474713 () Bool)

(declare-fun e!278663 () Bool)

(assert (=> b!474713 (= e!278663 false)))

(declare-fun zeroValue!794 () V!18995)

(declare-fun defaultEntry!841 () Int)

(declare-datatypes ((tuple2!8830 0))(
  ( (tuple2!8831 (_1!4426 (_ BitVec 64)) (_2!4426 V!18995)) )
))
(declare-datatypes ((List!8889 0))(
  ( (Nil!8886) (Cons!8885 (h!9741 tuple2!8830) (t!14855 List!8889)) )
))
(declare-datatypes ((ListLongMap!7745 0))(
  ( (ListLongMap!7746 (toList!3888 List!8889)) )
))
(declare-fun lt!216298 () ListLongMap!7745)

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30562 0))(
  ( (array!30563 (arr!14698 (Array (_ BitVec 32) (_ BitVec 64))) (size!15050 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30562)

(declare-fun minValueAfter!38 () V!18995)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!2095 (array!30562 array!30560 (_ BitVec 32) (_ BitVec 32) V!18995 V!18995 (_ BitVec 32) Int) ListLongMap!7745)

(assert (=> b!474713 (= lt!216298 (getCurrentListMapNoExtraKeys!2095 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun minValueBefore!38 () V!18995)

(declare-fun lt!216299 () ListLongMap!7745)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(assert (=> b!474713 (= lt!216299 (getCurrentListMapNoExtraKeys!2095 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!474714 () Bool)

(declare-fun e!278660 () Bool)

(assert (=> b!474714 (= e!278660 (and e!278664 mapRes!21844))))

(declare-fun condMapEmpty!21844 () Bool)

(declare-fun mapDefault!21844 () ValueCell!6365)

(assert (=> b!474714 (= condMapEmpty!21844 (= (arr!14697 _values!833) ((as const (Array (_ BitVec 32) ValueCell!6365)) mapDefault!21844)))))

(declare-fun b!474715 () Bool)

(declare-fun res!283545 () Bool)

(assert (=> b!474715 (=> (not res!283545) (not e!278663))))

(assert (=> b!474715 (= res!283545 (and (= (size!15049 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!15050 _keys!1025) (size!15049 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!474716 () Bool)

(declare-fun res!283546 () Bool)

(assert (=> b!474716 (=> (not res!283546) (not e!278663))))

(declare-datatypes ((List!8890 0))(
  ( (Nil!8887) (Cons!8886 (h!9742 (_ BitVec 64)) (t!14856 List!8890)) )
))
(declare-fun arrayNoDuplicates!0 (array!30562 (_ BitVec 32) List!8890) Bool)

(assert (=> b!474716 (= res!283546 (arrayNoDuplicates!0 _keys!1025 #b00000000000000000000000000000000 Nil!8887))))

(declare-fun b!474717 () Bool)

(assert (=> b!474717 (= e!278662 tp_is_empty!13417)))

(declare-fun b!474718 () Bool)

(declare-fun res!283547 () Bool)

(assert (=> b!474718 (=> (not res!283547) (not e!278663))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30562 (_ BitVec 32)) Bool)

(assert (=> b!474718 (= res!283547 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!21844 () Bool)

(assert (=> mapIsEmpty!21844 mapRes!21844))

(declare-fun res!283544 () Bool)

(assert (=> start!42540 (=> (not res!283544) (not e!278663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!42540 (= res!283544 (validMask!0 mask!1365))))

(assert (=> start!42540 e!278663))

(assert (=> start!42540 tp_is_empty!13417))

(assert (=> start!42540 tp!42007))

(assert (=> start!42540 true))

(declare-fun array_inv!10682 (array!30562) Bool)

(assert (=> start!42540 (array_inv!10682 _keys!1025)))

(declare-fun array_inv!10683 (array!30560) Bool)

(assert (=> start!42540 (and (array_inv!10683 _values!833) e!278660)))

(assert (= (and start!42540 res!283544) b!474715))

(assert (= (and b!474715 res!283545) b!474718))

(assert (= (and b!474718 res!283547) b!474716))

(assert (= (and b!474716 res!283546) b!474713))

(assert (= (and b!474714 condMapEmpty!21844) mapIsEmpty!21844))

(assert (= (and b!474714 (not condMapEmpty!21844)) mapNonEmpty!21844))

(get-info :version)

(assert (= (and mapNonEmpty!21844 ((_ is ValueCellFull!6365) mapValue!21844)) b!474717))

(assert (= (and b!474714 ((_ is ValueCellFull!6365) mapDefault!21844)) b!474712))

(assert (= start!42540 b!474714))

(declare-fun m!457293 () Bool)

(assert (=> b!474713 m!457293))

(declare-fun m!457295 () Bool)

(assert (=> b!474713 m!457295))

(declare-fun m!457297 () Bool)

(assert (=> start!42540 m!457297))

(declare-fun m!457299 () Bool)

(assert (=> start!42540 m!457299))

(declare-fun m!457301 () Bool)

(assert (=> start!42540 m!457301))

(declare-fun m!457303 () Bool)

(assert (=> b!474716 m!457303))

(declare-fun m!457305 () Bool)

(assert (=> b!474718 m!457305))

(declare-fun m!457307 () Bool)

(assert (=> mapNonEmpty!21844 m!457307))

(check-sat (not b!474718) tp_is_empty!13417 b_and!20479 (not b!474713) (not start!42540) (not b!474716) (not mapNonEmpty!21844) (not b_next!11989))
(check-sat b_and!20479 (not b_next!11989))
