; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70486 () Bool)

(assert start!70486)

(declare-fun b_free!12813 () Bool)

(declare-fun b_next!12813 () Bool)

(assert (=> start!70486 (= b_free!12813 (not b_next!12813))))

(declare-fun tp!45172 () Bool)

(declare-fun b_and!21643 () Bool)

(assert (=> start!70486 (= tp!45172 b_and!21643)))

(declare-fun b!818733 () Bool)

(declare-fun e!454531 () Bool)

(declare-fun e!454530 () Bool)

(assert (=> b!818733 (= e!454531 (not e!454530))))

(declare-fun res!558724 () Bool)

(assert (=> b!818733 (=> res!558724 e!454530)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!818733 (= res!558724 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24365 0))(
  ( (V!24366 (val!7309 Int)) )
))
(declare-datatypes ((tuple2!9606 0))(
  ( (tuple2!9607 (_1!4814 (_ BitVec 64)) (_2!4814 V!24365)) )
))
(declare-datatypes ((List!15439 0))(
  ( (Nil!15436) (Cons!15435 (h!16564 tuple2!9606) (t!21768 List!15439)) )
))
(declare-datatypes ((ListLongMap!8429 0))(
  ( (ListLongMap!8430 (toList!4230 List!15439)) )
))
(declare-fun lt!366991 () ListLongMap!8429)

(declare-fun lt!366987 () ListLongMap!8429)

(assert (=> b!818733 (= lt!366991 lt!366987)))

(declare-fun zeroValueBefore!34 () V!24365)

(declare-datatypes ((array!45244 0))(
  ( (array!45245 (arr!21676 (Array (_ BitVec 32) (_ BitVec 64))) (size!22097 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45244)

(declare-fun zeroValueAfter!34 () V!24365)

(declare-fun minValue!754 () V!24365)

(declare-datatypes ((ValueCell!6846 0))(
  ( (ValueCellFull!6846 (v!9738 V!24365)) (EmptyCell!6846) )
))
(declare-datatypes ((array!45246 0))(
  ( (array!45247 (arr!21677 (Array (_ BitVec 32) ValueCell!6846)) (size!22098 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45246)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((Unit!27941 0))(
  ( (Unit!27942) )
))
(declare-fun lt!366983 () Unit!27941)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!378 (array!45244 array!45246 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24365 V!24365 V!24365 V!24365 (_ BitVec 32) Int) Unit!27941)

(assert (=> b!818733 (= lt!366983 (lemmaNoChangeToArrayThenSameMapNoExtras!378 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2268 (array!45244 array!45246 (_ BitVec 32) (_ BitVec 32) V!24365 V!24365 (_ BitVec 32) Int) ListLongMap!8429)

(assert (=> b!818733 (= lt!366987 (getCurrentListMapNoExtraKeys!2268 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818733 (= lt!366991 (getCurrentListMapNoExtraKeys!2268 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!818734 () Bool)

(declare-fun res!558725 () Bool)

(assert (=> b!818734 (=> (not res!558725) (not e!454531))))

(declare-datatypes ((List!15440 0))(
  ( (Nil!15437) (Cons!15436 (h!16565 (_ BitVec 64)) (t!21769 List!15440)) )
))
(declare-fun arrayNoDuplicates!0 (array!45244 (_ BitVec 32) List!15440) Bool)

(assert (=> b!818734 (= res!558725 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15437))))

(declare-fun b!818735 () Bool)

(declare-fun res!558723 () Bool)

(assert (=> b!818735 (=> (not res!558723) (not e!454531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45244 (_ BitVec 32)) Bool)

(assert (=> b!818735 (= res!558723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun mapNonEmpty!23383 () Bool)

(declare-fun mapRes!23383 () Bool)

(declare-fun tp!45171 () Bool)

(declare-fun e!454534 () Bool)

(assert (=> mapNonEmpty!23383 (= mapRes!23383 (and tp!45171 e!454534))))

(declare-fun mapValue!23383 () ValueCell!6846)

(declare-fun mapRest!23383 () (Array (_ BitVec 32) ValueCell!6846))

(declare-fun mapKey!23383 () (_ BitVec 32))

(assert (=> mapNonEmpty!23383 (= (arr!21677 _values!788) (store mapRest!23383 mapKey!23383 mapValue!23383))))

(declare-fun b!818736 () Bool)

(declare-fun res!558721 () Bool)

(assert (=> b!818736 (=> (not res!558721) (not e!454531))))

(assert (=> b!818736 (= res!558721 (and (= (size!22098 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22097 _keys!976) (size!22098 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!818737 () Bool)

(declare-fun e!454535 () Bool)

(declare-fun e!454532 () Bool)

(assert (=> b!818737 (= e!454535 (and e!454532 mapRes!23383))))

(declare-fun condMapEmpty!23383 () Bool)

(declare-fun mapDefault!23383 () ValueCell!6846)

(assert (=> b!818737 (= condMapEmpty!23383 (= (arr!21677 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6846)) mapDefault!23383)))))

(declare-fun b!818738 () Bool)

(declare-fun tp_is_empty!14523 () Bool)

(assert (=> b!818738 (= e!454534 tp_is_empty!14523)))

(declare-fun b!818739 () Bool)

(assert (=> b!818739 (= e!454532 tp_is_empty!14523)))

(declare-fun lt!366986 () ListLongMap!8429)

(declare-fun e!454533 () Bool)

(declare-fun b!818740 () Bool)

(declare-fun +!1827 (ListLongMap!8429 tuple2!9606) ListLongMap!8429)

(assert (=> b!818740 (= e!454533 (= lt!366986 (+!1827 lt!366987 (tuple2!9607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!818741 () Bool)

(assert (=> b!818741 (= e!454530 true)))

(declare-fun lt!366988 () tuple2!9606)

(declare-fun lt!366989 () tuple2!9606)

(declare-fun lt!366984 () ListLongMap!8429)

(assert (=> b!818741 (= lt!366984 (+!1827 (+!1827 lt!366987 lt!366988) lt!366989))))

(declare-fun lt!366992 () ListLongMap!8429)

(assert (=> b!818741 (= (+!1827 lt!366991 lt!366989) (+!1827 lt!366992 lt!366989))))

(declare-fun lt!366990 () Unit!27941)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!168 (ListLongMap!8429 (_ BitVec 64) V!24365 V!24365) Unit!27941)

(assert (=> b!818741 (= lt!366990 (addSameAsAddTwiceSameKeyDiffValues!168 lt!366991 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!818741 (= lt!366989 (tuple2!9607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!818741 e!454533))

(declare-fun res!558726 () Bool)

(assert (=> b!818741 (=> (not res!558726) (not e!454533))))

(declare-fun lt!366985 () ListLongMap!8429)

(assert (=> b!818741 (= res!558726 (= lt!366985 lt!366992))))

(assert (=> b!818741 (= lt!366992 (+!1827 lt!366991 lt!366988))))

(assert (=> b!818741 (= lt!366988 (tuple2!9607 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2434 (array!45244 array!45246 (_ BitVec 32) (_ BitVec 32) V!24365 V!24365 (_ BitVec 32) Int) ListLongMap!8429)

(assert (=> b!818741 (= lt!366986 (getCurrentListMap!2434 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!818741 (= lt!366985 (getCurrentListMap!2434 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!23383 () Bool)

(assert (=> mapIsEmpty!23383 mapRes!23383))

(declare-fun res!558722 () Bool)

(assert (=> start!70486 (=> (not res!558722) (not e!454531))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70486 (= res!558722 (validMask!0 mask!1312))))

(assert (=> start!70486 e!454531))

(assert (=> start!70486 tp_is_empty!14523))

(declare-fun array_inv!17333 (array!45244) Bool)

(assert (=> start!70486 (array_inv!17333 _keys!976)))

(assert (=> start!70486 true))

(declare-fun array_inv!17334 (array!45246) Bool)

(assert (=> start!70486 (and (array_inv!17334 _values!788) e!454535)))

(assert (=> start!70486 tp!45172))

(assert (= (and start!70486 res!558722) b!818736))

(assert (= (and b!818736 res!558721) b!818735))

(assert (= (and b!818735 res!558723) b!818734))

(assert (= (and b!818734 res!558725) b!818733))

(assert (= (and b!818733 (not res!558724)) b!818741))

(assert (= (and b!818741 res!558726) b!818740))

(assert (= (and b!818737 condMapEmpty!23383) mapIsEmpty!23383))

(assert (= (and b!818737 (not condMapEmpty!23383)) mapNonEmpty!23383))

(get-info :version)

(assert (= (and mapNonEmpty!23383 ((_ is ValueCellFull!6846) mapValue!23383)) b!818738))

(assert (= (and b!818737 ((_ is ValueCellFull!6846) mapDefault!23383)) b!818739))

(assert (= start!70486 b!818737))

(declare-fun m!760141 () Bool)

(assert (=> b!818733 m!760141))

(declare-fun m!760143 () Bool)

(assert (=> b!818733 m!760143))

(declare-fun m!760145 () Bool)

(assert (=> b!818733 m!760145))

(declare-fun m!760147 () Bool)

(assert (=> b!818741 m!760147))

(declare-fun m!760149 () Bool)

(assert (=> b!818741 m!760149))

(declare-fun m!760151 () Bool)

(assert (=> b!818741 m!760151))

(declare-fun m!760153 () Bool)

(assert (=> b!818741 m!760153))

(declare-fun m!760155 () Bool)

(assert (=> b!818741 m!760155))

(declare-fun m!760157 () Bool)

(assert (=> b!818741 m!760157))

(declare-fun m!760159 () Bool)

(assert (=> b!818741 m!760159))

(declare-fun m!760161 () Bool)

(assert (=> b!818741 m!760161))

(assert (=> b!818741 m!760147))

(declare-fun m!760163 () Bool)

(assert (=> mapNonEmpty!23383 m!760163))

(declare-fun m!760165 () Bool)

(assert (=> b!818740 m!760165))

(declare-fun m!760167 () Bool)

(assert (=> b!818735 m!760167))

(declare-fun m!760169 () Bool)

(assert (=> start!70486 m!760169))

(declare-fun m!760171 () Bool)

(assert (=> start!70486 m!760171))

(declare-fun m!760173 () Bool)

(assert (=> start!70486 m!760173))

(declare-fun m!760175 () Bool)

(assert (=> b!818734 m!760175))

(check-sat (not b!818734) b_and!21643 (not b!818733) (not mapNonEmpty!23383) (not start!70486) (not b_next!12813) (not b!818740) (not b!818741) tp_is_empty!14523 (not b!818735))
(check-sat b_and!21643 (not b_next!12813))
