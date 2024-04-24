; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20614 () Bool)

(assert start!20614)

(declare-fun b_free!5269 () Bool)

(declare-fun b_next!5269 () Bool)

(assert (=> start!20614 (= b_free!5269 (not b_next!5269))))

(declare-fun tp!18839 () Bool)

(declare-fun b_and!12029 () Bool)

(assert (=> start!20614 (= tp!18839 b_and!12029)))

(declare-fun b!205535 () Bool)

(declare-fun res!99314 () Bool)

(declare-fun e!134396 () Bool)

(assert (=> b!205535 (=> (not res!99314) (not e!134396))))

(declare-datatypes ((array!9459 0))(
  ( (array!9460 (arr!4480 (Array (_ BitVec 32) (_ BitVec 64))) (size!4805 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9459)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205535 (= res!99314 (= (select (arr!4480 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8756 () Bool)

(declare-fun mapRes!8756 () Bool)

(assert (=> mapIsEmpty!8756 mapRes!8756))

(declare-fun b!205536 () Bool)

(declare-fun res!99317 () Bool)

(assert (=> b!205536 (=> (not res!99317) (not e!134396))))

(declare-datatypes ((List!2797 0))(
  ( (Nil!2794) (Cons!2793 (h!3435 (_ BitVec 64)) (t!7720 List!2797)) )
))
(declare-fun arrayNoDuplicates!0 (array!9459 (_ BitVec 32) List!2797) Bool)

(assert (=> b!205536 (= res!99317 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2794))))

(declare-fun mapNonEmpty!8756 () Bool)

(declare-fun tp!18838 () Bool)

(declare-fun e!134397 () Bool)

(assert (=> mapNonEmpty!8756 (= mapRes!8756 (and tp!18838 e!134397))))

(declare-fun mapKey!8756 () (_ BitVec 32))

(declare-datatypes ((V!6481 0))(
  ( (V!6482 (val!2607 Int)) )
))
(declare-datatypes ((ValueCell!2219 0))(
  ( (ValueCellFull!2219 (v!4578 V!6481)) (EmptyCell!2219) )
))
(declare-fun mapRest!8756 () (Array (_ BitVec 32) ValueCell!2219))

(declare-datatypes ((array!9461 0))(
  ( (array!9462 (arr!4481 (Array (_ BitVec 32) ValueCell!2219)) (size!4806 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9461)

(declare-fun mapValue!8756 () ValueCell!2219)

(assert (=> mapNonEmpty!8756 (= (arr!4481 _values!649) (store mapRest!8756 mapKey!8756 mapValue!8756))))

(declare-fun b!205537 () Bool)

(declare-fun e!134400 () Bool)

(declare-fun tp_is_empty!5125 () Bool)

(assert (=> b!205537 (= e!134400 tp_is_empty!5125)))

(declare-fun b!205538 () Bool)

(declare-fun res!99316 () Bool)

(assert (=> b!205538 (=> (not res!99316) (not e!134396))))

(assert (=> b!205538 (= res!99316 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4805 _keys!825))))))

(declare-fun b!205539 () Bool)

(declare-fun res!99320 () Bool)

(assert (=> b!205539 (=> (not res!99320) (not e!134396))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205539 (= res!99320 (and (= (size!4806 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4805 _keys!825) (size!4806 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!99315 () Bool)

(assert (=> start!20614 (=> (not res!99315) (not e!134396))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20614 (= res!99315 (validMask!0 mask!1149))))

(assert (=> start!20614 e!134396))

(declare-fun e!134402 () Bool)

(declare-fun array_inv!2933 (array!9461) Bool)

(assert (=> start!20614 (and (array_inv!2933 _values!649) e!134402)))

(assert (=> start!20614 true))

(assert (=> start!20614 tp_is_empty!5125))

(declare-fun array_inv!2934 (array!9459) Bool)

(assert (=> start!20614 (array_inv!2934 _keys!825)))

(assert (=> start!20614 tp!18839))

(declare-fun b!205540 () Bool)

(assert (=> b!205540 (= e!134402 (and e!134400 mapRes!8756))))

(declare-fun condMapEmpty!8756 () Bool)

(declare-fun mapDefault!8756 () ValueCell!2219)

(assert (=> b!205540 (= condMapEmpty!8756 (= (arr!4481 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2219)) mapDefault!8756)))))

(declare-fun b!205541 () Bool)

(declare-fun res!99319 () Bool)

(assert (=> b!205541 (=> (not res!99319) (not e!134396))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9459 (_ BitVec 32)) Bool)

(assert (=> b!205541 (= res!99319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205542 () Bool)

(declare-fun res!99321 () Bool)

(assert (=> b!205542 (=> (not res!99321) (not e!134396))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205542 (= res!99321 (validKeyInArray!0 k0!843))))

(declare-fun b!205543 () Bool)

(declare-fun e!134401 () Bool)

(declare-fun e!134399 () Bool)

(assert (=> b!205543 (= e!134401 e!134399)))

(declare-fun res!99318 () Bool)

(assert (=> b!205543 (=> res!99318 e!134399)))

(assert (=> b!205543 (= res!99318 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3906 0))(
  ( (tuple2!3907 (_1!1964 (_ BitVec 64)) (_2!1964 V!6481)) )
))
(declare-datatypes ((List!2798 0))(
  ( (Nil!2795) (Cons!2794 (h!3436 tuple2!3906) (t!7721 List!2798)) )
))
(declare-datatypes ((ListLongMap!2821 0))(
  ( (ListLongMap!2822 (toList!1426 List!2798)) )
))
(declare-fun lt!104688 () ListLongMap!2821)

(declare-fun lt!104684 () ListLongMap!2821)

(assert (=> b!205543 (= lt!104688 lt!104684)))

(declare-fun lt!104681 () ListLongMap!2821)

(declare-fun lt!104689 () tuple2!3906)

(declare-fun +!480 (ListLongMap!2821 tuple2!3906) ListLongMap!2821)

(assert (=> b!205543 (= lt!104684 (+!480 lt!104681 lt!104689))))

(declare-fun lt!104686 () ListLongMap!2821)

(declare-fun lt!104685 () ListLongMap!2821)

(assert (=> b!205543 (= lt!104686 lt!104685)))

(declare-fun lt!104679 () ListLongMap!2821)

(assert (=> b!205543 (= lt!104685 (+!480 lt!104679 lt!104689))))

(declare-fun lt!104683 () ListLongMap!2821)

(assert (=> b!205543 (= lt!104686 (+!480 lt!104683 lt!104689))))

(declare-fun minValue!615 () V!6481)

(assert (=> b!205543 (= lt!104689 (tuple2!3907 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205544 () Bool)

(assert (=> b!205544 (= e!134399 true)))

(declare-fun lt!104680 () tuple2!3906)

(assert (=> b!205544 (= lt!104685 (+!480 lt!104684 lt!104680))))

(declare-fun v!520 () V!6481)

(declare-datatypes ((Unit!6238 0))(
  ( (Unit!6239) )
))
(declare-fun lt!104682 () Unit!6238)

(declare-fun addCommutativeForDiffKeys!184 (ListLongMap!2821 (_ BitVec 64) V!6481 (_ BitVec 64) V!6481) Unit!6238)

(assert (=> b!205544 (= lt!104682 (addCommutativeForDiffKeys!184 lt!104681 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205545 () Bool)

(assert (=> b!205545 (= e!134397 tp_is_empty!5125)))

(declare-fun b!205546 () Bool)

(assert (=> b!205546 (= e!134396 (not e!134401))))

(declare-fun res!99322 () Bool)

(assert (=> b!205546 (=> res!99322 e!134401)))

(assert (=> b!205546 (= res!99322 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6481)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!999 (array!9459 array!9461 (_ BitVec 32) (_ BitVec 32) V!6481 V!6481 (_ BitVec 32) Int) ListLongMap!2821)

(assert (=> b!205546 (= lt!104688 (getCurrentListMap!999 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104687 () array!9461)

(assert (=> b!205546 (= lt!104686 (getCurrentListMap!999 _keys!825 lt!104687 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205546 (and (= lt!104683 lt!104679) (= lt!104679 lt!104683))))

(assert (=> b!205546 (= lt!104679 (+!480 lt!104681 lt!104680))))

(assert (=> b!205546 (= lt!104680 (tuple2!3907 k0!843 v!520))))

(declare-fun lt!104690 () Unit!6238)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!135 (array!9459 array!9461 (_ BitVec 32) (_ BitVec 32) V!6481 V!6481 (_ BitVec 32) (_ BitVec 64) V!6481 (_ BitVec 32) Int) Unit!6238)

(assert (=> b!205546 (= lt!104690 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!135 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!392 (array!9459 array!9461 (_ BitVec 32) (_ BitVec 32) V!6481 V!6481 (_ BitVec 32) Int) ListLongMap!2821)

(assert (=> b!205546 (= lt!104683 (getCurrentListMapNoExtraKeys!392 _keys!825 lt!104687 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205546 (= lt!104687 (array!9462 (store (arr!4481 _values!649) i!601 (ValueCellFull!2219 v!520)) (size!4806 _values!649)))))

(assert (=> b!205546 (= lt!104681 (getCurrentListMapNoExtraKeys!392 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20614 res!99315) b!205539))

(assert (= (and b!205539 res!99320) b!205541))

(assert (= (and b!205541 res!99319) b!205536))

(assert (= (and b!205536 res!99317) b!205538))

(assert (= (and b!205538 res!99316) b!205542))

(assert (= (and b!205542 res!99321) b!205535))

(assert (= (and b!205535 res!99314) b!205546))

(assert (= (and b!205546 (not res!99322)) b!205543))

(assert (= (and b!205543 (not res!99318)) b!205544))

(assert (= (and b!205540 condMapEmpty!8756) mapIsEmpty!8756))

(assert (= (and b!205540 (not condMapEmpty!8756)) mapNonEmpty!8756))

(get-info :version)

(assert (= (and mapNonEmpty!8756 ((_ is ValueCellFull!2219) mapValue!8756)) b!205545))

(assert (= (and b!205540 ((_ is ValueCellFull!2219) mapDefault!8756)) b!205537))

(assert (= start!20614 b!205540))

(declare-fun m!233301 () Bool)

(assert (=> b!205544 m!233301))

(declare-fun m!233303 () Bool)

(assert (=> b!205544 m!233303))

(declare-fun m!233305 () Bool)

(assert (=> mapNonEmpty!8756 m!233305))

(declare-fun m!233307 () Bool)

(assert (=> b!205535 m!233307))

(declare-fun m!233309 () Bool)

(assert (=> b!205541 m!233309))

(declare-fun m!233311 () Bool)

(assert (=> b!205543 m!233311))

(declare-fun m!233313 () Bool)

(assert (=> b!205543 m!233313))

(declare-fun m!233315 () Bool)

(assert (=> b!205543 m!233315))

(declare-fun m!233317 () Bool)

(assert (=> start!20614 m!233317))

(declare-fun m!233319 () Bool)

(assert (=> start!20614 m!233319))

(declare-fun m!233321 () Bool)

(assert (=> start!20614 m!233321))

(declare-fun m!233323 () Bool)

(assert (=> b!205536 m!233323))

(declare-fun m!233325 () Bool)

(assert (=> b!205542 m!233325))

(declare-fun m!233327 () Bool)

(assert (=> b!205546 m!233327))

(declare-fun m!233329 () Bool)

(assert (=> b!205546 m!233329))

(declare-fun m!233331 () Bool)

(assert (=> b!205546 m!233331))

(declare-fun m!233333 () Bool)

(assert (=> b!205546 m!233333))

(declare-fun m!233335 () Bool)

(assert (=> b!205546 m!233335))

(declare-fun m!233337 () Bool)

(assert (=> b!205546 m!233337))

(declare-fun m!233339 () Bool)

(assert (=> b!205546 m!233339))

(check-sat (not b!205546) (not b!205536) (not b!205543) (not b!205542) (not b!205544) (not start!20614) b_and!12029 tp_is_empty!5125 (not b_next!5269) (not mapNonEmpty!8756) (not b!205541))
(check-sat b_and!12029 (not b_next!5269))
