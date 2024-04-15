; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71140 () Bool)

(assert start!71140)

(declare-fun b_free!13327 () Bool)

(declare-fun b_next!13327 () Bool)

(assert (=> start!71140 (= b_free!13327 (not b_next!13327))))

(declare-fun tp!46741 () Bool)

(declare-fun b_and!22227 () Bool)

(assert (=> start!71140 (= tp!46741 b_and!22227)))

(declare-fun b!826328 () Bool)

(declare-fun res!563347 () Bool)

(declare-fun e!460158 () Bool)

(assert (=> b!826328 (=> (not res!563347) (not e!460158))))

(declare-datatypes ((array!46219 0))(
  ( (array!46220 (arr!22155 (Array (_ BitVec 32) (_ BitVec 64))) (size!22576 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46219)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46219 (_ BitVec 32)) Bool)

(assert (=> b!826328 (= res!563347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826329 () Bool)

(declare-fun res!563345 () Bool)

(assert (=> b!826329 (=> (not res!563345) (not e!460158))))

(declare-datatypes ((List!15826 0))(
  ( (Nil!15823) (Cons!15822 (h!16951 (_ BitVec 64)) (t!22164 List!15826)) )
))
(declare-fun arrayNoDuplicates!0 (array!46219 (_ BitVec 32) List!15826) Bool)

(assert (=> b!826329 (= res!563345 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15823))))

(declare-fun b!826330 () Bool)

(declare-fun e!460159 () Bool)

(declare-fun e!460163 () Bool)

(declare-fun mapRes!24181 () Bool)

(assert (=> b!826330 (= e!460159 (and e!460163 mapRes!24181))))

(declare-fun condMapEmpty!24181 () Bool)

(declare-datatypes ((V!25051 0))(
  ( (V!25052 (val!7566 Int)) )
))
(declare-datatypes ((ValueCell!7103 0))(
  ( (ValueCellFull!7103 (v!9994 V!25051)) (EmptyCell!7103) )
))
(declare-datatypes ((array!46221 0))(
  ( (array!46222 (arr!22156 (Array (_ BitVec 32) ValueCell!7103)) (size!22577 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46221)

(declare-fun mapDefault!24181 () ValueCell!7103)

(assert (=> b!826330 (= condMapEmpty!24181 (= (arr!22156 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7103)) mapDefault!24181)))))

(declare-fun b!826331 () Bool)

(declare-fun e!460161 () Bool)

(assert (=> b!826331 (= e!460161 true)))

(declare-datatypes ((tuple2!10036 0))(
  ( (tuple2!10037 (_1!5029 (_ BitVec 64)) (_2!5029 V!25051)) )
))
(declare-fun lt!373921 () tuple2!10036)

(declare-datatypes ((List!15827 0))(
  ( (Nil!15824) (Cons!15823 (h!16952 tuple2!10036) (t!22165 List!15827)) )
))
(declare-datatypes ((ListLongMap!8849 0))(
  ( (ListLongMap!8850 (toList!4440 List!15827)) )
))
(declare-fun lt!373917 () ListLongMap!8849)

(declare-fun lt!373920 () tuple2!10036)

(declare-fun lt!373918 () ListLongMap!8849)

(declare-fun +!1975 (ListLongMap!8849 tuple2!10036) ListLongMap!8849)

(assert (=> b!826331 (= lt!373917 (+!1975 (+!1975 lt!373918 lt!373921) lt!373920))))

(declare-fun lt!373916 () ListLongMap!8849)

(declare-fun lt!373919 () ListLongMap!8849)

(declare-fun lt!373915 () ListLongMap!8849)

(assert (=> b!826331 (and (= lt!373916 lt!373919) (= lt!373915 lt!373919) (= lt!373915 lt!373916))))

(declare-fun lt!373912 () ListLongMap!8849)

(assert (=> b!826331 (= lt!373919 (+!1975 lt!373912 lt!373921))))

(declare-fun lt!373913 () ListLongMap!8849)

(assert (=> b!826331 (= lt!373916 (+!1975 lt!373913 lt!373921))))

(declare-fun zeroValueBefore!34 () V!25051)

(declare-fun zeroValueAfter!34 () V!25051)

(declare-datatypes ((Unit!28293 0))(
  ( (Unit!28294) )
))
(declare-fun lt!373909 () Unit!28293)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!238 (ListLongMap!8849 (_ BitVec 64) V!25051 V!25051) Unit!28293)

(assert (=> b!826331 (= lt!373909 (addSameAsAddTwiceSameKeyDiffValues!238 lt!373913 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!460160 () Bool)

(assert (=> b!826331 e!460160))

(declare-fun res!563349 () Bool)

(assert (=> b!826331 (=> (not res!563349) (not e!460160))))

(declare-fun lt!373910 () ListLongMap!8849)

(assert (=> b!826331 (= res!563349 (= lt!373910 lt!373912))))

(declare-fun lt!373914 () tuple2!10036)

(assert (=> b!826331 (= lt!373912 (+!1975 lt!373913 lt!373914))))

(assert (=> b!826331 (= lt!373913 (+!1975 lt!373918 lt!373920))))

(assert (=> b!826331 (= lt!373921 (tuple2!10037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460165 () Bool)

(assert (=> b!826331 e!460165))

(declare-fun res!563351 () Bool)

(assert (=> b!826331 (=> (not res!563351) (not e!460165))))

(assert (=> b!826331 (= res!563351 (= lt!373910 (+!1975 (+!1975 lt!373918 lt!373914) lt!373920)))))

(declare-fun minValue!754 () V!25051)

(assert (=> b!826331 (= lt!373920 (tuple2!10037 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826331 (= lt!373914 (tuple2!10037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun getCurrentListMap!2521 (array!46219 array!46221 (_ BitVec 32) (_ BitVec 32) V!25051 V!25051 (_ BitVec 32) Int) ListLongMap!8849)

(assert (=> b!826331 (= lt!373915 (getCurrentListMap!2521 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826331 (= lt!373910 (getCurrentListMap!2521 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826332 () Bool)

(declare-fun lt!373908 () ListLongMap!8849)

(assert (=> b!826332 (= e!460160 (= lt!373915 (+!1975 (+!1975 lt!373908 lt!373920) lt!373921)))))

(declare-fun mapIsEmpty!24181 () Bool)

(assert (=> mapIsEmpty!24181 mapRes!24181))

(declare-fun res!563350 () Bool)

(assert (=> start!71140 (=> (not res!563350) (not e!460158))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71140 (= res!563350 (validMask!0 mask!1312))))

(assert (=> start!71140 e!460158))

(declare-fun tp_is_empty!15037 () Bool)

(assert (=> start!71140 tp_is_empty!15037))

(declare-fun array_inv!17727 (array!46219) Bool)

(assert (=> start!71140 (array_inv!17727 _keys!976)))

(assert (=> start!71140 true))

(declare-fun array_inv!17728 (array!46221) Bool)

(assert (=> start!71140 (and (array_inv!17728 _values!788) e!460159)))

(assert (=> start!71140 tp!46741))

(declare-fun mapNonEmpty!24181 () Bool)

(declare-fun tp!46740 () Bool)

(declare-fun e!460162 () Bool)

(assert (=> mapNonEmpty!24181 (= mapRes!24181 (and tp!46740 e!460162))))

(declare-fun mapRest!24181 () (Array (_ BitVec 32) ValueCell!7103))

(declare-fun mapValue!24181 () ValueCell!7103)

(declare-fun mapKey!24181 () (_ BitVec 32))

(assert (=> mapNonEmpty!24181 (= (arr!22156 _values!788) (store mapRest!24181 mapKey!24181 mapValue!24181))))

(declare-fun b!826333 () Bool)

(assert (=> b!826333 (= e!460163 tp_is_empty!15037)))

(declare-fun b!826334 () Bool)

(assert (=> b!826334 (= e!460158 (not e!460161))))

(declare-fun res!563348 () Bool)

(assert (=> b!826334 (=> res!563348 e!460161)))

(assert (=> b!826334 (= res!563348 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826334 (= lt!373918 lt!373908)))

(declare-fun lt!373911 () Unit!28293)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!566 (array!46219 array!46221 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25051 V!25051 V!25051 V!25051 (_ BitVec 32) Int) Unit!28293)

(assert (=> b!826334 (= lt!373911 (lemmaNoChangeToArrayThenSameMapNoExtras!566 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2473 (array!46219 array!46221 (_ BitVec 32) (_ BitVec 32) V!25051 V!25051 (_ BitVec 32) Int) ListLongMap!8849)

(assert (=> b!826334 (= lt!373908 (getCurrentListMapNoExtraKeys!2473 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826334 (= lt!373918 (getCurrentListMapNoExtraKeys!2473 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826335 () Bool)

(assert (=> b!826335 (= e!460165 (= lt!373915 (+!1975 (+!1975 lt!373908 (tuple2!10037 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373920)))))

(declare-fun b!826336 () Bool)

(assert (=> b!826336 (= e!460162 tp_is_empty!15037)))

(declare-fun b!826337 () Bool)

(declare-fun res!563346 () Bool)

(assert (=> b!826337 (=> (not res!563346) (not e!460158))))

(assert (=> b!826337 (= res!563346 (and (= (size!22577 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22576 _keys!976) (size!22577 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!71140 res!563350) b!826337))

(assert (= (and b!826337 res!563346) b!826328))

(assert (= (and b!826328 res!563347) b!826329))

(assert (= (and b!826329 res!563345) b!826334))

(assert (= (and b!826334 (not res!563348)) b!826331))

(assert (= (and b!826331 res!563351) b!826335))

(assert (= (and b!826331 res!563349) b!826332))

(assert (= (and b!826330 condMapEmpty!24181) mapIsEmpty!24181))

(assert (= (and b!826330 (not condMapEmpty!24181)) mapNonEmpty!24181))

(get-info :version)

(assert (= (and mapNonEmpty!24181 ((_ is ValueCellFull!7103) mapValue!24181)) b!826336))

(assert (= (and b!826330 ((_ is ValueCellFull!7103) mapDefault!24181)) b!826333))

(assert (= start!71140 b!826330))

(declare-fun m!768643 () Bool)

(assert (=> b!826332 m!768643))

(assert (=> b!826332 m!768643))

(declare-fun m!768645 () Bool)

(assert (=> b!826332 m!768645))

(declare-fun m!768647 () Bool)

(assert (=> mapNonEmpty!24181 m!768647))

(declare-fun m!768649 () Bool)

(assert (=> b!826329 m!768649))

(declare-fun m!768651 () Bool)

(assert (=> b!826334 m!768651))

(declare-fun m!768653 () Bool)

(assert (=> b!826334 m!768653))

(declare-fun m!768655 () Bool)

(assert (=> b!826334 m!768655))

(declare-fun m!768657 () Bool)

(assert (=> b!826328 m!768657))

(declare-fun m!768659 () Bool)

(assert (=> start!71140 m!768659))

(declare-fun m!768661 () Bool)

(assert (=> start!71140 m!768661))

(declare-fun m!768663 () Bool)

(assert (=> start!71140 m!768663))

(declare-fun m!768665 () Bool)

(assert (=> b!826335 m!768665))

(assert (=> b!826335 m!768665))

(declare-fun m!768667 () Bool)

(assert (=> b!826335 m!768667))

(declare-fun m!768669 () Bool)

(assert (=> b!826331 m!768669))

(declare-fun m!768671 () Bool)

(assert (=> b!826331 m!768671))

(declare-fun m!768673 () Bool)

(assert (=> b!826331 m!768673))

(declare-fun m!768675 () Bool)

(assert (=> b!826331 m!768675))

(declare-fun m!768677 () Bool)

(assert (=> b!826331 m!768677))

(declare-fun m!768679 () Bool)

(assert (=> b!826331 m!768679))

(declare-fun m!768681 () Bool)

(assert (=> b!826331 m!768681))

(declare-fun m!768683 () Bool)

(assert (=> b!826331 m!768683))

(declare-fun m!768685 () Bool)

(assert (=> b!826331 m!768685))

(declare-fun m!768687 () Bool)

(assert (=> b!826331 m!768687))

(assert (=> b!826331 m!768669))

(assert (=> b!826331 m!768677))

(declare-fun m!768689 () Bool)

(assert (=> b!826331 m!768689))

(check-sat tp_is_empty!15037 (not b!826335) (not b_next!13327) (not b!826328) b_and!22227 (not b!826334) (not mapNonEmpty!24181) (not start!71140) (not b!826331) (not b!826329) (not b!826332))
(check-sat b_and!22227 (not b_next!13327))
