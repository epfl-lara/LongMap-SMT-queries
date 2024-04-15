; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70482 () Bool)

(assert start!70482)

(declare-fun b_free!12829 () Bool)

(declare-fun b_next!12829 () Bool)

(assert (=> start!70482 (= b_free!12829 (not b_next!12829))))

(declare-fun tp!45220 () Bool)

(declare-fun b_and!21633 () Bool)

(assert (=> start!70482 (= tp!45220 b_and!21633)))

(declare-fun b!818703 () Bool)

(declare-fun res!558764 () Bool)

(declare-fun e!454548 () Bool)

(assert (=> b!818703 (=> (not res!558764) (not e!454548))))

(declare-datatypes ((array!45253 0))(
  ( (array!45254 (arr!21681 (Array (_ BitVec 32) (_ BitVec 64))) (size!22102 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45253)

(declare-datatypes ((List!15465 0))(
  ( (Nil!15462) (Cons!15461 (h!16590 (_ BitVec 64)) (t!21785 List!15465)) )
))
(declare-fun arrayNoDuplicates!0 (array!45253 (_ BitVec 32) List!15465) Bool)

(assert (=> b!818703 (= res!558764 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15462))))

(declare-fun b!818704 () Bool)

(declare-fun res!558759 () Bool)

(assert (=> b!818704 (=> (not res!558759) (not e!454548))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45253 (_ BitVec 32)) Bool)

(assert (=> b!818704 (= res!558759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!818705 () Bool)

(declare-fun e!454553 () Bool)

(assert (=> b!818705 (= e!454548 (not e!454553))))

(declare-fun res!558762 () Bool)

(assert (=> b!818705 (=> res!558762 e!454553)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818705 (= res!558762 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24387 0))(
  ( (V!24388 (val!7317 Int)) )
))
(declare-datatypes ((tuple2!9644 0))(
  ( (tuple2!9645 (_1!4833 (_ BitVec 64)) (_2!4833 V!24387)) )
))
(declare-datatypes ((List!15466 0))(
  ( (Nil!15463) (Cons!15462 (h!16591 tuple2!9644) (t!21786 List!15466)) )
))
(declare-datatypes ((ListLongMap!8457 0))(
  ( (ListLongMap!8458 (toList!4244 List!15466)) )
))
(declare-fun lt!366984 () ListLongMap!8457)

(declare-fun lt!366986 () ListLongMap!8457)

(assert (=> b!818705 (= lt!366984 lt!366986)))

(declare-fun zeroValueAfter!34 () V!24387)

(declare-fun minValue!754 () V!24387)

(declare-datatypes ((ValueCell!6854 0))(
  ( (ValueCellFull!6854 (v!9740 V!24387)) (EmptyCell!6854) )
))
(declare-datatypes ((array!45255 0))(
  ( (array!45256 (arr!21682 (Array (_ BitVec 32) ValueCell!6854)) (size!22103 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45255)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27913 0))(
  ( (Unit!27914) )
))
(declare-fun lt!366981 () Unit!27913)

(declare-fun zeroValueBefore!34 () V!24387)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!394 (array!45253 array!45255 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24387 V!24387 V!24387 V!24387 (_ BitVec 32) Int) Unit!27913)

(assert (=> b!818705 (= lt!366981 (lemmaNoChangeToArrayThenSameMapNoExtras!394 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2301 (array!45253 array!45255 (_ BitVec 32) (_ BitVec 32) V!24387 V!24387 (_ BitVec 32) Int) ListLongMap!8457)

(assert (=> b!818705 (= lt!366986 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818705 (= lt!366984 (getCurrentListMapNoExtraKeys!2301 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818706 () Bool)

(declare-fun e!454551 () Bool)

(declare-fun tp_is_empty!14539 () Bool)

(assert (=> b!818706 (= e!454551 tp_is_empty!14539)))

(declare-fun mapNonEmpty!23407 () Bool)

(declare-fun mapRes!23407 () Bool)

(declare-fun tp!45219 () Bool)

(assert (=> mapNonEmpty!23407 (= mapRes!23407 (and tp!45219 e!454551))))

(declare-fun mapValue!23407 () ValueCell!6854)

(declare-fun mapRest!23407 () (Array (_ BitVec 32) ValueCell!6854))

(declare-fun mapKey!23407 () (_ BitVec 32))

(assert (=> mapNonEmpty!23407 (= (arr!21682 _values!788) (store mapRest!23407 mapKey!23407 mapValue!23407))))

(declare-fun b!818707 () Bool)

(declare-fun res!558760 () Bool)

(assert (=> b!818707 (=> (not res!558760) (not e!454548))))

(assert (=> b!818707 (= res!558760 (and (= (size!22103 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22102 _keys!976) (size!22103 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818708 () Bool)

(assert (=> b!818708 (= e!454553 true)))

(declare-fun lt!366983 () ListLongMap!8457)

(declare-fun lt!366985 () tuple2!9644)

(declare-fun lt!366988 () tuple2!9644)

(declare-fun +!1866 (ListLongMap!8457 tuple2!9644) ListLongMap!8457)

(assert (=> b!818708 (= lt!366983 (+!1866 (+!1866 lt!366986 lt!366985) lt!366988))))

(declare-fun lt!366982 () ListLongMap!8457)

(assert (=> b!818708 (= (+!1866 lt!366984 lt!366988) (+!1866 lt!366982 lt!366988))))

(declare-fun lt!366987 () Unit!27913)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!181 (ListLongMap!8457 (_ BitVec 64) V!24387 V!24387) Unit!27913)

(assert (=> b!818708 (= lt!366987 (addSameAsAddTwiceSameKeyDiffValues!181 lt!366984 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818708 (= lt!366988 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!454550 () Bool)

(assert (=> b!818708 e!454550))

(declare-fun res!558763 () Bool)

(assert (=> b!818708 (=> (not res!558763) (not e!454550))))

(declare-fun lt!366989 () ListLongMap!8457)

(assert (=> b!818708 (= res!558763 (= lt!366989 lt!366982))))

(assert (=> b!818708 (= lt!366982 (+!1866 lt!366984 lt!366985))))

(assert (=> b!818708 (= lt!366985 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!366980 () ListLongMap!8457)

(declare-fun getCurrentListMap!2394 (array!45253 array!45255 (_ BitVec 32) (_ BitVec 32) V!24387 V!24387 (_ BitVec 32) Int) ListLongMap!8457)

(assert (=> b!818708 (= lt!366980 (getCurrentListMap!2394 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818708 (= lt!366989 (getCurrentListMap!2394 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818709 () Bool)

(assert (=> b!818709 (= e!454550 (= lt!366980 (+!1866 lt!366986 (tuple2!9645 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun mapIsEmpty!23407 () Bool)

(assert (=> mapIsEmpty!23407 mapRes!23407))

(declare-fun b!818710 () Bool)

(declare-fun e!454552 () Bool)

(declare-fun e!454549 () Bool)

(assert (=> b!818710 (= e!454552 (and e!454549 mapRes!23407))))

(declare-fun condMapEmpty!23407 () Bool)

(declare-fun mapDefault!23407 () ValueCell!6854)

(assert (=> b!818710 (= condMapEmpty!23407 (= (arr!21682 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6854)) mapDefault!23407)))))

(declare-fun b!818711 () Bool)

(assert (=> b!818711 (= e!454549 tp_is_empty!14539)))

(declare-fun res!558761 () Bool)

(assert (=> start!70482 (=> (not res!558761) (not e!454548))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70482 (= res!558761 (validMask!0 mask!1312))))

(assert (=> start!70482 e!454548))

(assert (=> start!70482 tp_is_empty!14539))

(declare-fun array_inv!17399 (array!45253) Bool)

(assert (=> start!70482 (array_inv!17399 _keys!976)))

(assert (=> start!70482 true))

(declare-fun array_inv!17400 (array!45255) Bool)

(assert (=> start!70482 (and (array_inv!17400 _values!788) e!454552)))

(assert (=> start!70482 tp!45220))

(assert (= (and start!70482 res!558761) b!818707))

(assert (= (and b!818707 res!558760) b!818704))

(assert (= (and b!818704 res!558759) b!818703))

(assert (= (and b!818703 res!558764) b!818705))

(assert (= (and b!818705 (not res!558762)) b!818708))

(assert (= (and b!818708 res!558763) b!818709))

(assert (= (and b!818710 condMapEmpty!23407) mapIsEmpty!23407))

(assert (= (and b!818710 (not condMapEmpty!23407)) mapNonEmpty!23407))

(get-info :version)

(assert (= (and mapNonEmpty!23407 ((_ is ValueCellFull!6854) mapValue!23407)) b!818706))

(assert (= (and b!818710 ((_ is ValueCellFull!6854) mapDefault!23407)) b!818711))

(assert (= start!70482 b!818710))

(declare-fun m!759677 () Bool)

(assert (=> b!818704 m!759677))

(declare-fun m!759679 () Bool)

(assert (=> b!818709 m!759679))

(declare-fun m!759681 () Bool)

(assert (=> b!818708 m!759681))

(declare-fun m!759683 () Bool)

(assert (=> b!818708 m!759683))

(declare-fun m!759685 () Bool)

(assert (=> b!818708 m!759685))

(declare-fun m!759687 () Bool)

(assert (=> b!818708 m!759687))

(declare-fun m!759689 () Bool)

(assert (=> b!818708 m!759689))

(assert (=> b!818708 m!759683))

(declare-fun m!759691 () Bool)

(assert (=> b!818708 m!759691))

(declare-fun m!759693 () Bool)

(assert (=> b!818708 m!759693))

(declare-fun m!759695 () Bool)

(assert (=> b!818708 m!759695))

(declare-fun m!759697 () Bool)

(assert (=> b!818705 m!759697))

(declare-fun m!759699 () Bool)

(assert (=> b!818705 m!759699))

(declare-fun m!759701 () Bool)

(assert (=> b!818705 m!759701))

(declare-fun m!759703 () Bool)

(assert (=> mapNonEmpty!23407 m!759703))

(declare-fun m!759705 () Bool)

(assert (=> b!818703 m!759705))

(declare-fun m!759707 () Bool)

(assert (=> start!70482 m!759707))

(declare-fun m!759709 () Bool)

(assert (=> start!70482 m!759709))

(declare-fun m!759711 () Bool)

(assert (=> start!70482 m!759711))

(check-sat (not start!70482) (not b!818703) (not mapNonEmpty!23407) tp_is_empty!14539 b_and!21633 (not b_next!12829) (not b!818709) (not b!818704) (not b!818708) (not b!818705))
(check-sat b_and!21633 (not b_next!12829))
