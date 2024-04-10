; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20928 () Bool)

(assert start!20928)

(declare-fun b_free!5541 () Bool)

(declare-fun b_next!5541 () Bool)

(assert (=> start!20928 (= b_free!5541 (not b_next!5541))))

(declare-fun tp!19669 () Bool)

(declare-fun b_and!12311 () Bool)

(assert (=> start!20928 (= tp!19669 b_and!12311)))

(declare-fun mapNonEmpty!9179 () Bool)

(declare-fun mapRes!9179 () Bool)

(declare-fun tp!19670 () Bool)

(declare-fun e!136903 () Bool)

(assert (=> mapNonEmpty!9179 (= mapRes!9179 (and tp!19670 e!136903))))

(declare-datatypes ((V!6851 0))(
  ( (V!6852 (val!2746 Int)) )
))
(declare-datatypes ((ValueCell!2358 0))(
  ( (ValueCellFull!2358 (v!4724 V!6851)) (EmptyCell!2358) )
))
(declare-fun mapRest!9179 () (Array (_ BitVec 32) ValueCell!2358))

(declare-datatypes ((array!10005 0))(
  ( (array!10006 (arr!4751 (Array (_ BitVec 32) ValueCell!2358)) (size!5076 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10005)

(declare-fun mapKey!9179 () (_ BitVec 32))

(declare-fun mapValue!9179 () ValueCell!2358)

(assert (=> mapNonEmpty!9179 (= (arr!4751 _values!649) (store mapRest!9179 mapKey!9179 mapValue!9179))))

(declare-fun b!210211 () Bool)

(declare-fun res!102552 () Bool)

(declare-fun e!136905 () Bool)

(assert (=> b!210211 (=> (not res!102552) (not e!136905))))

(declare-datatypes ((array!10007 0))(
  ( (array!10008 (arr!4752 (Array (_ BitVec 32) (_ BitVec 64))) (size!5077 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10007)

(declare-datatypes ((List!3045 0))(
  ( (Nil!3042) (Cons!3041 (h!3683 (_ BitVec 64)) (t!7980 List!3045)) )
))
(declare-fun arrayNoDuplicates!0 (array!10007 (_ BitVec 32) List!3045) Bool)

(assert (=> b!210211 (= res!102552 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3042))))

(declare-fun b!210212 () Bool)

(declare-fun e!136902 () Bool)

(assert (=> b!210212 (= e!136905 (not e!136902))))

(declare-fun res!102553 () Bool)

(assert (=> b!210212 (=> res!102553 e!136902)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210212 (= res!102553 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4152 0))(
  ( (tuple2!4153 (_1!2087 (_ BitVec 64)) (_2!2087 V!6851)) )
))
(declare-datatypes ((List!3046 0))(
  ( (Nil!3043) (Cons!3042 (h!3684 tuple2!4152) (t!7981 List!3046)) )
))
(declare-datatypes ((ListLongMap!3065 0))(
  ( (ListLongMap!3066 (toList!1548 List!3046)) )
))
(declare-fun lt!107608 () ListLongMap!3065)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6851)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6851)

(declare-fun getCurrentListMap!1084 (array!10007 array!10005 (_ BitVec 32) (_ BitVec 32) V!6851 V!6851 (_ BitVec 32) Int) ListLongMap!3065)

(assert (=> b!210212 (= lt!107608 (getCurrentListMap!1084 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107605 () ListLongMap!3065)

(declare-fun lt!107602 () array!10005)

(assert (=> b!210212 (= lt!107605 (getCurrentListMap!1084 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107601 () ListLongMap!3065)

(declare-fun lt!107606 () ListLongMap!3065)

(assert (=> b!210212 (and (= lt!107601 lt!107606) (= lt!107606 lt!107601))))

(declare-fun lt!107600 () ListLongMap!3065)

(declare-fun v!520 () V!6851)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!551 (ListLongMap!3065 tuple2!4152) ListLongMap!3065)

(assert (=> b!210212 (= lt!107606 (+!551 lt!107600 (tuple2!4153 k0!843 v!520)))))

(declare-datatypes ((Unit!6388 0))(
  ( (Unit!6389) )
))
(declare-fun lt!107604 () Unit!6388)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!201 (array!10007 array!10005 (_ BitVec 32) (_ BitVec 32) V!6851 V!6851 (_ BitVec 32) (_ BitVec 64) V!6851 (_ BitVec 32) Int) Unit!6388)

(assert (=> b!210212 (= lt!107604 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!201 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!486 (array!10007 array!10005 (_ BitVec 32) (_ BitVec 32) V!6851 V!6851 (_ BitVec 32) Int) ListLongMap!3065)

(assert (=> b!210212 (= lt!107601 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210212 (= lt!107602 (array!10006 (store (arr!4751 _values!649) i!601 (ValueCellFull!2358 v!520)) (size!5076 _values!649)))))

(assert (=> b!210212 (= lt!107600 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210213 () Bool)

(declare-fun tp_is_empty!5403 () Bool)

(assert (=> b!210213 (= e!136903 tp_is_empty!5403)))

(declare-fun e!136904 () Bool)

(declare-fun b!210214 () Bool)

(declare-fun lt!107603 () tuple2!4152)

(declare-fun lt!107607 () tuple2!4152)

(assert (=> b!210214 (= e!136904 (= lt!107605 (+!551 (+!551 lt!107606 lt!107607) lt!107603)))))

(declare-fun b!210215 () Bool)

(declare-fun res!102558 () Bool)

(assert (=> b!210215 (=> (not res!102558) (not e!136905))))

(assert (=> b!210215 (= res!102558 (= (select (arr!4752 _keys!825) i!601) k0!843))))

(declare-fun b!210216 () Bool)

(declare-fun res!102550 () Bool)

(assert (=> b!210216 (=> (not res!102550) (not e!136905))))

(assert (=> b!210216 (= res!102550 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5077 _keys!825))))))

(declare-fun b!210217 () Bool)

(declare-fun res!102557 () Bool)

(assert (=> b!210217 (=> (not res!102557) (not e!136905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210217 (= res!102557 (validKeyInArray!0 k0!843))))

(declare-fun b!210218 () Bool)

(declare-fun e!136900 () Bool)

(declare-fun e!136901 () Bool)

(assert (=> b!210218 (= e!136900 (and e!136901 mapRes!9179))))

(declare-fun condMapEmpty!9179 () Bool)

(declare-fun mapDefault!9179 () ValueCell!2358)

(assert (=> b!210218 (= condMapEmpty!9179 (= (arr!4751 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2358)) mapDefault!9179)))))

(declare-fun b!210219 () Bool)

(assert (=> b!210219 (= e!136902 (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210219 e!136904))

(declare-fun res!102555 () Bool)

(assert (=> b!210219 (=> (not res!102555) (not e!136904))))

(assert (=> b!210219 (= res!102555 (= lt!107605 (+!551 (+!551 lt!107601 lt!107607) lt!107603)))))

(assert (=> b!210219 (= lt!107603 (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210219 (= lt!107607 (tuple2!4153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210220 () Bool)

(assert (=> b!210220 (= e!136901 tp_is_empty!5403)))

(declare-fun b!210221 () Bool)

(declare-fun res!102549 () Bool)

(assert (=> b!210221 (=> (not res!102549) (not e!136905))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10007 (_ BitVec 32)) Bool)

(assert (=> b!210221 (= res!102549 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210222 () Bool)

(declare-fun res!102556 () Bool)

(assert (=> b!210222 (=> (not res!102556) (not e!136905))))

(assert (=> b!210222 (= res!102556 (and (= (size!5076 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5077 _keys!825) (size!5076 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210223 () Bool)

(declare-fun res!102554 () Bool)

(assert (=> b!210223 (=> (not res!102554) (not e!136904))))

(assert (=> b!210223 (= res!102554 (= lt!107608 (+!551 (+!551 lt!107600 lt!107607) lt!107603)))))

(declare-fun mapIsEmpty!9179 () Bool)

(assert (=> mapIsEmpty!9179 mapRes!9179))

(declare-fun res!102551 () Bool)

(assert (=> start!20928 (=> (not res!102551) (not e!136905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20928 (= res!102551 (validMask!0 mask!1149))))

(assert (=> start!20928 e!136905))

(declare-fun array_inv!3145 (array!10005) Bool)

(assert (=> start!20928 (and (array_inv!3145 _values!649) e!136900)))

(assert (=> start!20928 true))

(assert (=> start!20928 tp_is_empty!5403))

(declare-fun array_inv!3146 (array!10007) Bool)

(assert (=> start!20928 (array_inv!3146 _keys!825)))

(assert (=> start!20928 tp!19669))

(assert (= (and start!20928 res!102551) b!210222))

(assert (= (and b!210222 res!102556) b!210221))

(assert (= (and b!210221 res!102549) b!210211))

(assert (= (and b!210211 res!102552) b!210216))

(assert (= (and b!210216 res!102550) b!210217))

(assert (= (and b!210217 res!102557) b!210215))

(assert (= (and b!210215 res!102558) b!210212))

(assert (= (and b!210212 (not res!102553)) b!210219))

(assert (= (and b!210219 res!102555) b!210223))

(assert (= (and b!210223 res!102554) b!210214))

(assert (= (and b!210218 condMapEmpty!9179) mapIsEmpty!9179))

(assert (= (and b!210218 (not condMapEmpty!9179)) mapNonEmpty!9179))

(get-info :version)

(assert (= (and mapNonEmpty!9179 ((_ is ValueCellFull!2358) mapValue!9179)) b!210213))

(assert (= (and b!210218 ((_ is ValueCellFull!2358) mapDefault!9179)) b!210220))

(assert (= start!20928 b!210218))

(declare-fun m!237669 () Bool)

(assert (=> b!210221 m!237669))

(declare-fun m!237671 () Bool)

(assert (=> b!210211 m!237671))

(declare-fun m!237673 () Bool)

(assert (=> b!210212 m!237673))

(declare-fun m!237675 () Bool)

(assert (=> b!210212 m!237675))

(declare-fun m!237677 () Bool)

(assert (=> b!210212 m!237677))

(declare-fun m!237679 () Bool)

(assert (=> b!210212 m!237679))

(declare-fun m!237681 () Bool)

(assert (=> b!210212 m!237681))

(declare-fun m!237683 () Bool)

(assert (=> b!210212 m!237683))

(declare-fun m!237685 () Bool)

(assert (=> b!210212 m!237685))

(declare-fun m!237687 () Bool)

(assert (=> b!210219 m!237687))

(assert (=> b!210219 m!237687))

(declare-fun m!237689 () Bool)

(assert (=> b!210219 m!237689))

(declare-fun m!237691 () Bool)

(assert (=> b!210215 m!237691))

(declare-fun m!237693 () Bool)

(assert (=> b!210217 m!237693))

(declare-fun m!237695 () Bool)

(assert (=> mapNonEmpty!9179 m!237695))

(declare-fun m!237697 () Bool)

(assert (=> b!210223 m!237697))

(assert (=> b!210223 m!237697))

(declare-fun m!237699 () Bool)

(assert (=> b!210223 m!237699))

(declare-fun m!237701 () Bool)

(assert (=> start!20928 m!237701))

(declare-fun m!237703 () Bool)

(assert (=> start!20928 m!237703))

(declare-fun m!237705 () Bool)

(assert (=> start!20928 m!237705))

(declare-fun m!237707 () Bool)

(assert (=> b!210214 m!237707))

(assert (=> b!210214 m!237707))

(declare-fun m!237709 () Bool)

(assert (=> b!210214 m!237709))

(check-sat (not b_next!5541) (not b!210221) b_and!12311 (not b!210223) (not b!210211) (not mapNonEmpty!9179) tp_is_empty!5403 (not b!210217) (not b!210214) (not b!210219) (not b!210212) (not start!20928))
(check-sat b_and!12311 (not b_next!5541))
(get-model)

(declare-fun d!57927 () Bool)

(assert (=> d!57927 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20928 d!57927))

(declare-fun d!57929 () Bool)

(assert (=> d!57929 (= (array_inv!3145 _values!649) (bvsge (size!5076 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20928 d!57929))

(declare-fun d!57931 () Bool)

(assert (=> d!57931 (= (array_inv!3146 _keys!825) (bvsge (size!5077 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20928 d!57931))

(declare-fun d!57933 () Bool)

(declare-fun e!136929 () Bool)

(assert (=> d!57933 e!136929))

(declare-fun res!102594 () Bool)

(assert (=> d!57933 (=> (not res!102594) (not e!136929))))

(declare-fun lt!107646 () ListLongMap!3065)

(declare-fun contains!1395 (ListLongMap!3065 (_ BitVec 64)) Bool)

(assert (=> d!57933 (= res!102594 (contains!1395 lt!107646 (_1!2087 lt!107603)))))

(declare-fun lt!107645 () List!3046)

(assert (=> d!57933 (= lt!107646 (ListLongMap!3066 lt!107645))))

(declare-fun lt!107647 () Unit!6388)

(declare-fun lt!107644 () Unit!6388)

(assert (=> d!57933 (= lt!107647 lt!107644)))

(declare-datatypes ((Option!255 0))(
  ( (Some!254 (v!4729 V!6851)) (None!253) )
))
(declare-fun getValueByKey!249 (List!3046 (_ BitVec 64)) Option!255)

(assert (=> d!57933 (= (getValueByKey!249 lt!107645 (_1!2087 lt!107603)) (Some!254 (_2!2087 lt!107603)))))

(declare-fun lemmaContainsTupThenGetReturnValue!136 (List!3046 (_ BitVec 64) V!6851) Unit!6388)

(assert (=> d!57933 (= lt!107644 (lemmaContainsTupThenGetReturnValue!136 lt!107645 (_1!2087 lt!107603) (_2!2087 lt!107603)))))

(declare-fun insertStrictlySorted!139 (List!3046 (_ BitVec 64) V!6851) List!3046)

(assert (=> d!57933 (= lt!107645 (insertStrictlySorted!139 (toList!1548 (+!551 lt!107606 lt!107607)) (_1!2087 lt!107603) (_2!2087 lt!107603)))))

(assert (=> d!57933 (= (+!551 (+!551 lt!107606 lt!107607) lt!107603) lt!107646)))

(declare-fun b!210267 () Bool)

(declare-fun res!102593 () Bool)

(assert (=> b!210267 (=> (not res!102593) (not e!136929))))

(assert (=> b!210267 (= res!102593 (= (getValueByKey!249 (toList!1548 lt!107646) (_1!2087 lt!107603)) (Some!254 (_2!2087 lt!107603))))))

(declare-fun b!210268 () Bool)

(declare-fun contains!1396 (List!3046 tuple2!4152) Bool)

(assert (=> b!210268 (= e!136929 (contains!1396 (toList!1548 lt!107646) lt!107603))))

(assert (= (and d!57933 res!102594) b!210267))

(assert (= (and b!210267 res!102593) b!210268))

(declare-fun m!237753 () Bool)

(assert (=> d!57933 m!237753))

(declare-fun m!237755 () Bool)

(assert (=> d!57933 m!237755))

(declare-fun m!237757 () Bool)

(assert (=> d!57933 m!237757))

(declare-fun m!237759 () Bool)

(assert (=> d!57933 m!237759))

(declare-fun m!237761 () Bool)

(assert (=> b!210267 m!237761))

(declare-fun m!237763 () Bool)

(assert (=> b!210268 m!237763))

(assert (=> b!210214 d!57933))

(declare-fun d!57935 () Bool)

(declare-fun e!136930 () Bool)

(assert (=> d!57935 e!136930))

(declare-fun res!102596 () Bool)

(assert (=> d!57935 (=> (not res!102596) (not e!136930))))

(declare-fun lt!107650 () ListLongMap!3065)

(assert (=> d!57935 (= res!102596 (contains!1395 lt!107650 (_1!2087 lt!107607)))))

(declare-fun lt!107649 () List!3046)

(assert (=> d!57935 (= lt!107650 (ListLongMap!3066 lt!107649))))

(declare-fun lt!107651 () Unit!6388)

(declare-fun lt!107648 () Unit!6388)

(assert (=> d!57935 (= lt!107651 lt!107648)))

(assert (=> d!57935 (= (getValueByKey!249 lt!107649 (_1!2087 lt!107607)) (Some!254 (_2!2087 lt!107607)))))

(assert (=> d!57935 (= lt!107648 (lemmaContainsTupThenGetReturnValue!136 lt!107649 (_1!2087 lt!107607) (_2!2087 lt!107607)))))

(assert (=> d!57935 (= lt!107649 (insertStrictlySorted!139 (toList!1548 lt!107606) (_1!2087 lt!107607) (_2!2087 lt!107607)))))

(assert (=> d!57935 (= (+!551 lt!107606 lt!107607) lt!107650)))

(declare-fun b!210269 () Bool)

(declare-fun res!102595 () Bool)

(assert (=> b!210269 (=> (not res!102595) (not e!136930))))

(assert (=> b!210269 (= res!102595 (= (getValueByKey!249 (toList!1548 lt!107650) (_1!2087 lt!107607)) (Some!254 (_2!2087 lt!107607))))))

(declare-fun b!210270 () Bool)

(assert (=> b!210270 (= e!136930 (contains!1396 (toList!1548 lt!107650) lt!107607))))

(assert (= (and d!57935 res!102596) b!210269))

(assert (= (and b!210269 res!102595) b!210270))

(declare-fun m!237765 () Bool)

(assert (=> d!57935 m!237765))

(declare-fun m!237767 () Bool)

(assert (=> d!57935 m!237767))

(declare-fun m!237769 () Bool)

(assert (=> d!57935 m!237769))

(declare-fun m!237771 () Bool)

(assert (=> d!57935 m!237771))

(declare-fun m!237773 () Bool)

(assert (=> b!210269 m!237773))

(declare-fun m!237775 () Bool)

(assert (=> b!210270 m!237775))

(assert (=> b!210214 d!57935))

(declare-fun d!57937 () Bool)

(declare-fun e!136931 () Bool)

(assert (=> d!57937 e!136931))

(declare-fun res!102598 () Bool)

(assert (=> d!57937 (=> (not res!102598) (not e!136931))))

(declare-fun lt!107654 () ListLongMap!3065)

(assert (=> d!57937 (= res!102598 (contains!1395 lt!107654 (_1!2087 lt!107603)))))

(declare-fun lt!107653 () List!3046)

(assert (=> d!57937 (= lt!107654 (ListLongMap!3066 lt!107653))))

(declare-fun lt!107655 () Unit!6388)

(declare-fun lt!107652 () Unit!6388)

(assert (=> d!57937 (= lt!107655 lt!107652)))

(assert (=> d!57937 (= (getValueByKey!249 lt!107653 (_1!2087 lt!107603)) (Some!254 (_2!2087 lt!107603)))))

(assert (=> d!57937 (= lt!107652 (lemmaContainsTupThenGetReturnValue!136 lt!107653 (_1!2087 lt!107603) (_2!2087 lt!107603)))))

(assert (=> d!57937 (= lt!107653 (insertStrictlySorted!139 (toList!1548 (+!551 lt!107600 lt!107607)) (_1!2087 lt!107603) (_2!2087 lt!107603)))))

(assert (=> d!57937 (= (+!551 (+!551 lt!107600 lt!107607) lt!107603) lt!107654)))

(declare-fun b!210271 () Bool)

(declare-fun res!102597 () Bool)

(assert (=> b!210271 (=> (not res!102597) (not e!136931))))

(assert (=> b!210271 (= res!102597 (= (getValueByKey!249 (toList!1548 lt!107654) (_1!2087 lt!107603)) (Some!254 (_2!2087 lt!107603))))))

(declare-fun b!210272 () Bool)

(assert (=> b!210272 (= e!136931 (contains!1396 (toList!1548 lt!107654) lt!107603))))

(assert (= (and d!57937 res!102598) b!210271))

(assert (= (and b!210271 res!102597) b!210272))

(declare-fun m!237777 () Bool)

(assert (=> d!57937 m!237777))

(declare-fun m!237779 () Bool)

(assert (=> d!57937 m!237779))

(declare-fun m!237781 () Bool)

(assert (=> d!57937 m!237781))

(declare-fun m!237783 () Bool)

(assert (=> d!57937 m!237783))

(declare-fun m!237785 () Bool)

(assert (=> b!210271 m!237785))

(declare-fun m!237787 () Bool)

(assert (=> b!210272 m!237787))

(assert (=> b!210223 d!57937))

(declare-fun d!57939 () Bool)

(declare-fun e!136932 () Bool)

(assert (=> d!57939 e!136932))

(declare-fun res!102600 () Bool)

(assert (=> d!57939 (=> (not res!102600) (not e!136932))))

(declare-fun lt!107658 () ListLongMap!3065)

(assert (=> d!57939 (= res!102600 (contains!1395 lt!107658 (_1!2087 lt!107607)))))

(declare-fun lt!107657 () List!3046)

(assert (=> d!57939 (= lt!107658 (ListLongMap!3066 lt!107657))))

(declare-fun lt!107659 () Unit!6388)

(declare-fun lt!107656 () Unit!6388)

(assert (=> d!57939 (= lt!107659 lt!107656)))

(assert (=> d!57939 (= (getValueByKey!249 lt!107657 (_1!2087 lt!107607)) (Some!254 (_2!2087 lt!107607)))))

(assert (=> d!57939 (= lt!107656 (lemmaContainsTupThenGetReturnValue!136 lt!107657 (_1!2087 lt!107607) (_2!2087 lt!107607)))))

(assert (=> d!57939 (= lt!107657 (insertStrictlySorted!139 (toList!1548 lt!107600) (_1!2087 lt!107607) (_2!2087 lt!107607)))))

(assert (=> d!57939 (= (+!551 lt!107600 lt!107607) lt!107658)))

(declare-fun b!210273 () Bool)

(declare-fun res!102599 () Bool)

(assert (=> b!210273 (=> (not res!102599) (not e!136932))))

(assert (=> b!210273 (= res!102599 (= (getValueByKey!249 (toList!1548 lt!107658) (_1!2087 lt!107607)) (Some!254 (_2!2087 lt!107607))))))

(declare-fun b!210274 () Bool)

(assert (=> b!210274 (= e!136932 (contains!1396 (toList!1548 lt!107658) lt!107607))))

(assert (= (and d!57939 res!102600) b!210273))

(assert (= (and b!210273 res!102599) b!210274))

(declare-fun m!237789 () Bool)

(assert (=> d!57939 m!237789))

(declare-fun m!237791 () Bool)

(assert (=> d!57939 m!237791))

(declare-fun m!237793 () Bool)

(assert (=> d!57939 m!237793))

(declare-fun m!237795 () Bool)

(assert (=> d!57939 m!237795))

(declare-fun m!237797 () Bool)

(assert (=> b!210273 m!237797))

(declare-fun m!237799 () Bool)

(assert (=> b!210274 m!237799))

(assert (=> b!210223 d!57939))

(declare-fun d!57941 () Bool)

(declare-fun e!136933 () Bool)

(assert (=> d!57941 e!136933))

(declare-fun res!102602 () Bool)

(assert (=> d!57941 (=> (not res!102602) (not e!136933))))

(declare-fun lt!107662 () ListLongMap!3065)

(assert (=> d!57941 (= res!102602 (contains!1395 lt!107662 (_1!2087 lt!107603)))))

(declare-fun lt!107661 () List!3046)

(assert (=> d!57941 (= lt!107662 (ListLongMap!3066 lt!107661))))

(declare-fun lt!107663 () Unit!6388)

(declare-fun lt!107660 () Unit!6388)

(assert (=> d!57941 (= lt!107663 lt!107660)))

(assert (=> d!57941 (= (getValueByKey!249 lt!107661 (_1!2087 lt!107603)) (Some!254 (_2!2087 lt!107603)))))

(assert (=> d!57941 (= lt!107660 (lemmaContainsTupThenGetReturnValue!136 lt!107661 (_1!2087 lt!107603) (_2!2087 lt!107603)))))

(assert (=> d!57941 (= lt!107661 (insertStrictlySorted!139 (toList!1548 (+!551 lt!107601 lt!107607)) (_1!2087 lt!107603) (_2!2087 lt!107603)))))

(assert (=> d!57941 (= (+!551 (+!551 lt!107601 lt!107607) lt!107603) lt!107662)))

(declare-fun b!210275 () Bool)

(declare-fun res!102601 () Bool)

(assert (=> b!210275 (=> (not res!102601) (not e!136933))))

(assert (=> b!210275 (= res!102601 (= (getValueByKey!249 (toList!1548 lt!107662) (_1!2087 lt!107603)) (Some!254 (_2!2087 lt!107603))))))

(declare-fun b!210276 () Bool)

(assert (=> b!210276 (= e!136933 (contains!1396 (toList!1548 lt!107662) lt!107603))))

(assert (= (and d!57941 res!102602) b!210275))

(assert (= (and b!210275 res!102601) b!210276))

(declare-fun m!237801 () Bool)

(assert (=> d!57941 m!237801))

(declare-fun m!237803 () Bool)

(assert (=> d!57941 m!237803))

(declare-fun m!237805 () Bool)

(assert (=> d!57941 m!237805))

(declare-fun m!237807 () Bool)

(assert (=> d!57941 m!237807))

(declare-fun m!237809 () Bool)

(assert (=> b!210275 m!237809))

(declare-fun m!237811 () Bool)

(assert (=> b!210276 m!237811))

(assert (=> b!210219 d!57941))

(declare-fun d!57943 () Bool)

(declare-fun e!136934 () Bool)

(assert (=> d!57943 e!136934))

(declare-fun res!102604 () Bool)

(assert (=> d!57943 (=> (not res!102604) (not e!136934))))

(declare-fun lt!107666 () ListLongMap!3065)

(assert (=> d!57943 (= res!102604 (contains!1395 lt!107666 (_1!2087 lt!107607)))))

(declare-fun lt!107665 () List!3046)

(assert (=> d!57943 (= lt!107666 (ListLongMap!3066 lt!107665))))

(declare-fun lt!107667 () Unit!6388)

(declare-fun lt!107664 () Unit!6388)

(assert (=> d!57943 (= lt!107667 lt!107664)))

(assert (=> d!57943 (= (getValueByKey!249 lt!107665 (_1!2087 lt!107607)) (Some!254 (_2!2087 lt!107607)))))

(assert (=> d!57943 (= lt!107664 (lemmaContainsTupThenGetReturnValue!136 lt!107665 (_1!2087 lt!107607) (_2!2087 lt!107607)))))

(assert (=> d!57943 (= lt!107665 (insertStrictlySorted!139 (toList!1548 lt!107601) (_1!2087 lt!107607) (_2!2087 lt!107607)))))

(assert (=> d!57943 (= (+!551 lt!107601 lt!107607) lt!107666)))

(declare-fun b!210277 () Bool)

(declare-fun res!102603 () Bool)

(assert (=> b!210277 (=> (not res!102603) (not e!136934))))

(assert (=> b!210277 (= res!102603 (= (getValueByKey!249 (toList!1548 lt!107666) (_1!2087 lt!107607)) (Some!254 (_2!2087 lt!107607))))))

(declare-fun b!210278 () Bool)

(assert (=> b!210278 (= e!136934 (contains!1396 (toList!1548 lt!107666) lt!107607))))

(assert (= (and d!57943 res!102604) b!210277))

(assert (= (and b!210277 res!102603) b!210278))

(declare-fun m!237813 () Bool)

(assert (=> d!57943 m!237813))

(declare-fun m!237815 () Bool)

(assert (=> d!57943 m!237815))

(declare-fun m!237817 () Bool)

(assert (=> d!57943 m!237817))

(declare-fun m!237819 () Bool)

(assert (=> d!57943 m!237819))

(declare-fun m!237821 () Bool)

(assert (=> b!210277 m!237821))

(declare-fun m!237823 () Bool)

(assert (=> b!210278 m!237823))

(assert (=> b!210219 d!57943))

(declare-fun bm!19864 () Bool)

(declare-fun call!19867 () Bool)

(declare-fun c!35536 () Bool)

(assert (=> bm!19864 (= call!19867 (arrayNoDuplicates!0 _keys!825 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!35536 (Cons!3041 (select (arr!4752 _keys!825) #b00000000000000000000000000000000) Nil!3042) Nil!3042)))))

(declare-fun b!210289 () Bool)

(declare-fun e!136946 () Bool)

(assert (=> b!210289 (= e!136946 call!19867)))

(declare-fun b!210291 () Bool)

(declare-fun e!136943 () Bool)

(assert (=> b!210291 (= e!136943 e!136946)))

(assert (=> b!210291 (= c!35536 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210292 () Bool)

(assert (=> b!210292 (= e!136946 call!19867)))

(declare-fun b!210293 () Bool)

(declare-fun e!136944 () Bool)

(declare-fun contains!1397 (List!3045 (_ BitVec 64)) Bool)

(assert (=> b!210293 (= e!136944 (contains!1397 Nil!3042 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun d!57945 () Bool)

(declare-fun res!102611 () Bool)

(declare-fun e!136945 () Bool)

(assert (=> d!57945 (=> res!102611 e!136945)))

(assert (=> d!57945 (= res!102611 (bvsge #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(assert (=> d!57945 (= (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3042) e!136945)))

(declare-fun b!210290 () Bool)

(assert (=> b!210290 (= e!136945 e!136943)))

(declare-fun res!102612 () Bool)

(assert (=> b!210290 (=> (not res!102612) (not e!136943))))

(assert (=> b!210290 (= res!102612 (not e!136944))))

(declare-fun res!102613 () Bool)

(assert (=> b!210290 (=> (not res!102613) (not e!136944))))

(assert (=> b!210290 (= res!102613 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(assert (= (and d!57945 (not res!102611)) b!210290))

(assert (= (and b!210290 res!102613) b!210293))

(assert (= (and b!210290 res!102612) b!210291))

(assert (= (and b!210291 c!35536) b!210289))

(assert (= (and b!210291 (not c!35536)) b!210292))

(assert (= (or b!210289 b!210292) bm!19864))

(declare-fun m!237825 () Bool)

(assert (=> bm!19864 m!237825))

(declare-fun m!237827 () Bool)

(assert (=> bm!19864 m!237827))

(assert (=> b!210291 m!237825))

(assert (=> b!210291 m!237825))

(declare-fun m!237829 () Bool)

(assert (=> b!210291 m!237829))

(assert (=> b!210293 m!237825))

(assert (=> b!210293 m!237825))

(declare-fun m!237831 () Bool)

(assert (=> b!210293 m!237831))

(assert (=> b!210290 m!237825))

(assert (=> b!210290 m!237825))

(assert (=> b!210290 m!237829))

(assert (=> b!210211 d!57945))

(declare-fun bm!19867 () Bool)

(declare-fun call!19870 () Bool)

(assert (=> bm!19867 (= call!19870 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!210302 () Bool)

(declare-fun e!136954 () Bool)

(assert (=> b!210302 (= e!136954 call!19870)))

(declare-fun b!210303 () Bool)

(declare-fun e!136955 () Bool)

(assert (=> b!210303 (= e!136954 e!136955)))

(declare-fun lt!107674 () (_ BitVec 64))

(assert (=> b!210303 (= lt!107674 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107675 () Unit!6388)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!10007 (_ BitVec 64) (_ BitVec 32)) Unit!6388)

(assert (=> b!210303 (= lt!107675 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!107674 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!10007 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!210303 (arrayContainsKey!0 _keys!825 lt!107674 #b00000000000000000000000000000000)))

(declare-fun lt!107676 () Unit!6388)

(assert (=> b!210303 (= lt!107676 lt!107675)))

(declare-fun res!102619 () Bool)

(declare-datatypes ((SeekEntryResult!706 0))(
  ( (MissingZero!706 (index!4994 (_ BitVec 32))) (Found!706 (index!4995 (_ BitVec 32))) (Intermediate!706 (undefined!1518 Bool) (index!4996 (_ BitVec 32)) (x!22022 (_ BitVec 32))) (Undefined!706) (MissingVacant!706 (index!4997 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10007 (_ BitVec 32)) SeekEntryResult!706)

(assert (=> b!210303 (= res!102619 (= (seekEntryOrOpen!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!706 #b00000000000000000000000000000000)))))

(assert (=> b!210303 (=> (not res!102619) (not e!136955))))

(declare-fun d!57947 () Bool)

(declare-fun res!102618 () Bool)

(declare-fun e!136953 () Bool)

(assert (=> d!57947 (=> res!102618 e!136953)))

(assert (=> d!57947 (= res!102618 (bvsge #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(assert (=> d!57947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!136953)))

(declare-fun b!210304 () Bool)

(assert (=> b!210304 (= e!136953 e!136954)))

(declare-fun c!35539 () Bool)

(assert (=> b!210304 (= c!35539 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210305 () Bool)

(assert (=> b!210305 (= e!136955 call!19870)))

(assert (= (and d!57947 (not res!102618)) b!210304))

(assert (= (and b!210304 c!35539) b!210303))

(assert (= (and b!210304 (not c!35539)) b!210302))

(assert (= (and b!210303 res!102619) b!210305))

(assert (= (or b!210305 b!210302) bm!19867))

(declare-fun m!237833 () Bool)

(assert (=> bm!19867 m!237833))

(assert (=> b!210303 m!237825))

(declare-fun m!237835 () Bool)

(assert (=> b!210303 m!237835))

(declare-fun m!237837 () Bool)

(assert (=> b!210303 m!237837))

(assert (=> b!210303 m!237825))

(declare-fun m!237839 () Bool)

(assert (=> b!210303 m!237839))

(assert (=> b!210304 m!237825))

(assert (=> b!210304 m!237825))

(assert (=> b!210304 m!237829))

(assert (=> b!210221 d!57947))

(declare-fun d!57949 () Bool)

(assert (=> d!57949 (= (validKeyInArray!0 k0!843) (and (not (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210217 d!57949))

(declare-fun d!57951 () Bool)

(declare-fun e!136956 () Bool)

(assert (=> d!57951 e!136956))

(declare-fun res!102621 () Bool)

(assert (=> d!57951 (=> (not res!102621) (not e!136956))))

(declare-fun lt!107679 () ListLongMap!3065)

(assert (=> d!57951 (= res!102621 (contains!1395 lt!107679 (_1!2087 (tuple2!4153 k0!843 v!520))))))

(declare-fun lt!107678 () List!3046)

(assert (=> d!57951 (= lt!107679 (ListLongMap!3066 lt!107678))))

(declare-fun lt!107680 () Unit!6388)

(declare-fun lt!107677 () Unit!6388)

(assert (=> d!57951 (= lt!107680 lt!107677)))

(assert (=> d!57951 (= (getValueByKey!249 lt!107678 (_1!2087 (tuple2!4153 k0!843 v!520))) (Some!254 (_2!2087 (tuple2!4153 k0!843 v!520))))))

(assert (=> d!57951 (= lt!107677 (lemmaContainsTupThenGetReturnValue!136 lt!107678 (_1!2087 (tuple2!4153 k0!843 v!520)) (_2!2087 (tuple2!4153 k0!843 v!520))))))

(assert (=> d!57951 (= lt!107678 (insertStrictlySorted!139 (toList!1548 lt!107600) (_1!2087 (tuple2!4153 k0!843 v!520)) (_2!2087 (tuple2!4153 k0!843 v!520))))))

(assert (=> d!57951 (= (+!551 lt!107600 (tuple2!4153 k0!843 v!520)) lt!107679)))

(declare-fun b!210306 () Bool)

(declare-fun res!102620 () Bool)

(assert (=> b!210306 (=> (not res!102620) (not e!136956))))

(assert (=> b!210306 (= res!102620 (= (getValueByKey!249 (toList!1548 lt!107679) (_1!2087 (tuple2!4153 k0!843 v!520))) (Some!254 (_2!2087 (tuple2!4153 k0!843 v!520)))))))

(declare-fun b!210307 () Bool)

(assert (=> b!210307 (= e!136956 (contains!1396 (toList!1548 lt!107679) (tuple2!4153 k0!843 v!520)))))

(assert (= (and d!57951 res!102621) b!210306))

(assert (= (and b!210306 res!102620) b!210307))

(declare-fun m!237841 () Bool)

(assert (=> d!57951 m!237841))

(declare-fun m!237843 () Bool)

(assert (=> d!57951 m!237843))

(declare-fun m!237845 () Bool)

(assert (=> d!57951 m!237845))

(declare-fun m!237847 () Bool)

(assert (=> d!57951 m!237847))

(declare-fun m!237849 () Bool)

(assert (=> b!210306 m!237849))

(declare-fun m!237851 () Bool)

(assert (=> b!210307 m!237851))

(assert (=> b!210212 d!57951))

(declare-fun b!210332 () Bool)

(declare-fun e!136975 () Bool)

(declare-fun e!136971 () Bool)

(assert (=> b!210332 (= e!136975 e!136971)))

(assert (=> b!210332 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun res!102633 () Bool)

(declare-fun lt!107699 () ListLongMap!3065)

(assert (=> b!210332 (= res!102633 (contains!1395 lt!107699 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210332 (=> (not res!102633) (not e!136971))))

(declare-fun b!210333 () Bool)

(declare-fun e!136974 () Bool)

(declare-fun isEmpty!492 (ListLongMap!3065) Bool)

(assert (=> b!210333 (= e!136974 (isEmpty!492 lt!107699))))

(declare-fun b!210335 () Bool)

(declare-fun e!136972 () ListLongMap!3065)

(declare-fun call!19873 () ListLongMap!3065)

(assert (=> b!210335 (= e!136972 call!19873)))

(declare-fun bm!19870 () Bool)

(assert (=> bm!19870 (= call!19873 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210336 () Bool)

(assert (=> b!210336 (= e!136974 (= lt!107699 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!210337 () Bool)

(declare-fun lt!107698 () Unit!6388)

(declare-fun lt!107695 () Unit!6388)

(assert (=> b!210337 (= lt!107698 lt!107695)))

(declare-fun lt!107700 () (_ BitVec 64))

(declare-fun lt!107701 () (_ BitVec 64))

(declare-fun lt!107696 () V!6851)

(declare-fun lt!107697 () ListLongMap!3065)

(assert (=> b!210337 (not (contains!1395 (+!551 lt!107697 (tuple2!4153 lt!107700 lt!107696)) lt!107701))))

(declare-fun addStillNotContains!100 (ListLongMap!3065 (_ BitVec 64) V!6851 (_ BitVec 64)) Unit!6388)

(assert (=> b!210337 (= lt!107695 (addStillNotContains!100 lt!107697 lt!107700 lt!107696 lt!107701))))

(assert (=> b!210337 (= lt!107701 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!2547 (ValueCell!2358 V!6851) V!6851)

(declare-fun dynLambda!534 (Int (_ BitVec 64)) V!6851)

(assert (=> b!210337 (= lt!107696 (get!2547 (select (arr!4751 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210337 (= lt!107700 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210337 (= lt!107697 call!19873)))

(assert (=> b!210337 (= e!136972 (+!551 call!19873 (tuple2!4153 (select (arr!4752 _keys!825) #b00000000000000000000000000000000) (get!2547 (select (arr!4751 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210338 () Bool)

(declare-fun e!136976 () ListLongMap!3065)

(assert (=> b!210338 (= e!136976 e!136972)))

(declare-fun c!35551 () Bool)

(assert (=> b!210338 (= c!35551 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210339 () Bool)

(assert (=> b!210339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(assert (=> b!210339 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _values!649)))))

(declare-fun apply!191 (ListLongMap!3065 (_ BitVec 64)) V!6851)

(assert (=> b!210339 (= e!136971 (= (apply!191 lt!107699 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)) (get!2547 (select (arr!4751 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210340 () Bool)

(declare-fun e!136977 () Bool)

(assert (=> b!210340 (= e!136977 e!136975)))

(declare-fun c!35550 () Bool)

(declare-fun e!136973 () Bool)

(assert (=> b!210340 (= c!35550 e!136973)))

(declare-fun res!102631 () Bool)

(assert (=> b!210340 (=> (not res!102631) (not e!136973))))

(assert (=> b!210340 (= res!102631 (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun b!210341 () Bool)

(assert (=> b!210341 (= e!136975 e!136974)))

(declare-fun c!35549 () Bool)

(assert (=> b!210341 (= c!35549 (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun b!210342 () Bool)

(assert (=> b!210342 (= e!136973 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210342 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210343 () Bool)

(declare-fun res!102630 () Bool)

(assert (=> b!210343 (=> (not res!102630) (not e!136977))))

(assert (=> b!210343 (= res!102630 (not (contains!1395 lt!107699 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!57953 () Bool)

(assert (=> d!57953 e!136977))

(declare-fun res!102632 () Bool)

(assert (=> d!57953 (=> (not res!102632) (not e!136977))))

(assert (=> d!57953 (= res!102632 (not (contains!1395 lt!107699 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57953 (= lt!107699 e!136976)))

(declare-fun c!35548 () Bool)

(assert (=> d!57953 (= c!35548 (bvsge #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(assert (=> d!57953 (validMask!0 mask!1149)))

(assert (=> d!57953 (= (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107699)))

(declare-fun b!210334 () Bool)

(assert (=> b!210334 (= e!136976 (ListLongMap!3066 Nil!3043))))

(assert (= (and d!57953 c!35548) b!210334))

(assert (= (and d!57953 (not c!35548)) b!210338))

(assert (= (and b!210338 c!35551) b!210337))

(assert (= (and b!210338 (not c!35551)) b!210335))

(assert (= (or b!210337 b!210335) bm!19870))

(assert (= (and d!57953 res!102632) b!210343))

(assert (= (and b!210343 res!102630) b!210340))

(assert (= (and b!210340 res!102631) b!210342))

(assert (= (and b!210340 c!35550) b!210332))

(assert (= (and b!210340 (not c!35550)) b!210341))

(assert (= (and b!210332 res!102633) b!210339))

(assert (= (and b!210341 c!35549) b!210336))

(assert (= (and b!210341 (not c!35549)) b!210333))

(declare-fun b_lambda!7587 () Bool)

(assert (=> (not b_lambda!7587) (not b!210337)))

(declare-fun t!7984 () Bool)

(declare-fun tb!2895 () Bool)

(assert (=> (and start!20928 (= defaultEntry!657 defaultEntry!657) t!7984) tb!2895))

(declare-fun result!4973 () Bool)

(assert (=> tb!2895 (= result!4973 tp_is_empty!5403)))

(assert (=> b!210337 t!7984))

(declare-fun b_and!12315 () Bool)

(assert (= b_and!12311 (and (=> t!7984 result!4973) b_and!12315)))

(declare-fun b_lambda!7589 () Bool)

(assert (=> (not b_lambda!7589) (not b!210339)))

(assert (=> b!210339 t!7984))

(declare-fun b_and!12317 () Bool)

(assert (= b_and!12315 (and (=> t!7984 result!4973) b_and!12317)))

(declare-fun m!237853 () Bool)

(assert (=> b!210333 m!237853))

(declare-fun m!237855 () Bool)

(assert (=> bm!19870 m!237855))

(assert (=> b!210336 m!237855))

(assert (=> b!210339 m!237825))

(assert (=> b!210339 m!237825))

(declare-fun m!237857 () Bool)

(assert (=> b!210339 m!237857))

(declare-fun m!237859 () Bool)

(assert (=> b!210339 m!237859))

(declare-fun m!237861 () Bool)

(assert (=> b!210339 m!237861))

(assert (=> b!210339 m!237859))

(assert (=> b!210339 m!237861))

(declare-fun m!237863 () Bool)

(assert (=> b!210339 m!237863))

(assert (=> b!210342 m!237825))

(assert (=> b!210342 m!237825))

(assert (=> b!210342 m!237829))

(declare-fun m!237865 () Bool)

(assert (=> d!57953 m!237865))

(assert (=> d!57953 m!237701))

(declare-fun m!237867 () Bool)

(assert (=> b!210337 m!237867))

(assert (=> b!210337 m!237825))

(declare-fun m!237869 () Bool)

(assert (=> b!210337 m!237869))

(declare-fun m!237871 () Bool)

(assert (=> b!210337 m!237871))

(declare-fun m!237873 () Bool)

(assert (=> b!210337 m!237873))

(assert (=> b!210337 m!237859))

(assert (=> b!210337 m!237861))

(assert (=> b!210337 m!237871))

(assert (=> b!210337 m!237859))

(assert (=> b!210337 m!237861))

(assert (=> b!210337 m!237863))

(assert (=> b!210338 m!237825))

(assert (=> b!210338 m!237825))

(assert (=> b!210338 m!237829))

(declare-fun m!237875 () Bool)

(assert (=> b!210343 m!237875))

(assert (=> b!210332 m!237825))

(assert (=> b!210332 m!237825))

(declare-fun m!237877 () Bool)

(assert (=> b!210332 m!237877))

(assert (=> b!210212 d!57953))

(declare-fun call!19878 () ListLongMap!3065)

(declare-fun bm!19875 () Bool)

(assert (=> bm!19875 (= call!19878 (getCurrentListMapNoExtraKeys!486 _keys!825 (array!10006 (store (arr!4751 _values!649) i!601 (ValueCellFull!2358 v!520)) (size!5076 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210352 () Bool)

(declare-fun e!136983 () Bool)

(declare-fun e!136982 () Bool)

(assert (=> b!210352 (= e!136983 e!136982)))

(declare-fun c!35554 () Bool)

(assert (=> b!210352 (= c!35554 (bvsle #b00000000000000000000000000000000 i!601))))

(declare-fun d!57955 () Bool)

(assert (=> d!57955 e!136983))

(declare-fun res!102636 () Bool)

(assert (=> d!57955 (=> (not res!102636) (not e!136983))))

(assert (=> d!57955 (= res!102636 (and (or (not (bvsle #b00000000000000000000000000000000 i!601)) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5076 _values!649)))) (or (bvsle #b00000000000000000000000000000000 i!601) (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5076 _values!649))))))))

(declare-fun lt!107704 () Unit!6388)

(declare-fun choose!1074 (array!10007 array!10005 (_ BitVec 32) (_ BitVec 32) V!6851 V!6851 (_ BitVec 32) (_ BitVec 64) V!6851 (_ BitVec 32) Int) Unit!6388)

(assert (=> d!57955 (= lt!107704 (choose!1074 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> d!57955 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(assert (=> d!57955 (= (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!201 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657) lt!107704)))

(declare-fun call!19879 () ListLongMap!3065)

(declare-fun bm!19876 () Bool)

(assert (=> bm!19876 (= call!19879 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210353 () Bool)

(assert (=> b!210353 (= e!136982 (= call!19878 (+!551 call!19879 (tuple2!4153 k0!843 v!520))))))

(declare-fun b!210354 () Bool)

(assert (=> b!210354 (= e!136982 (= call!19878 call!19879))))

(assert (= (and d!57955 res!102636) b!210352))

(assert (= (and b!210352 c!35554) b!210353))

(assert (= (and b!210352 (not c!35554)) b!210354))

(assert (= (or b!210353 b!210354) bm!19875))

(assert (= (or b!210353 b!210354) bm!19876))

(assert (=> bm!19875 m!237675))

(declare-fun m!237879 () Bool)

(assert (=> bm!19875 m!237879))

(declare-fun m!237881 () Bool)

(assert (=> d!57955 m!237881))

(assert (=> bm!19876 m!237681))

(declare-fun m!237883 () Bool)

(assert (=> b!210353 m!237883))

(assert (=> b!210212 d!57955))

(declare-fun b!210355 () Bool)

(declare-fun e!136988 () Bool)

(declare-fun e!136984 () Bool)

(assert (=> b!210355 (= e!136988 e!136984)))

(assert (=> b!210355 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun res!102640 () Bool)

(declare-fun lt!107709 () ListLongMap!3065)

(assert (=> b!210355 (= res!102640 (contains!1395 lt!107709 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210355 (=> (not res!102640) (not e!136984))))

(declare-fun b!210356 () Bool)

(declare-fun e!136987 () Bool)

(assert (=> b!210356 (= e!136987 (isEmpty!492 lt!107709))))

(declare-fun b!210358 () Bool)

(declare-fun e!136985 () ListLongMap!3065)

(declare-fun call!19880 () ListLongMap!3065)

(assert (=> b!210358 (= e!136985 call!19880)))

(declare-fun bm!19877 () Bool)

(assert (=> bm!19877 (= call!19880 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657))))

(declare-fun b!210359 () Bool)

(assert (=> b!210359 (= e!136987 (= lt!107709 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!657)))))

(declare-fun b!210360 () Bool)

(declare-fun lt!107708 () Unit!6388)

(declare-fun lt!107705 () Unit!6388)

(assert (=> b!210360 (= lt!107708 lt!107705)))

(declare-fun lt!107706 () V!6851)

(declare-fun lt!107710 () (_ BitVec 64))

(declare-fun lt!107711 () (_ BitVec 64))

(declare-fun lt!107707 () ListLongMap!3065)

(assert (=> b!210360 (not (contains!1395 (+!551 lt!107707 (tuple2!4153 lt!107710 lt!107706)) lt!107711))))

(assert (=> b!210360 (= lt!107705 (addStillNotContains!100 lt!107707 lt!107710 lt!107706 lt!107711))))

(assert (=> b!210360 (= lt!107711 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!210360 (= lt!107706 (get!2547 (select (arr!4751 lt!107602) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!210360 (= lt!107710 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210360 (= lt!107707 call!19880)))

(assert (=> b!210360 (= e!136985 (+!551 call!19880 (tuple2!4153 (select (arr!4752 _keys!825) #b00000000000000000000000000000000) (get!2547 (select (arr!4751 lt!107602) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!210361 () Bool)

(declare-fun e!136989 () ListLongMap!3065)

(assert (=> b!210361 (= e!136989 e!136985)))

(declare-fun c!35558 () Bool)

(assert (=> b!210361 (= c!35558 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210362 () Bool)

(assert (=> b!210362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(assert (=> b!210362 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 lt!107602)))))

(assert (=> b!210362 (= e!136984 (= (apply!191 lt!107709 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)) (get!2547 (select (arr!4751 lt!107602) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!210363 () Bool)

(declare-fun e!136990 () Bool)

(assert (=> b!210363 (= e!136990 e!136988)))

(declare-fun c!35557 () Bool)

(declare-fun e!136986 () Bool)

(assert (=> b!210363 (= c!35557 e!136986)))

(declare-fun res!102638 () Bool)

(assert (=> b!210363 (=> (not res!102638) (not e!136986))))

(assert (=> b!210363 (= res!102638 (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun b!210364 () Bool)

(assert (=> b!210364 (= e!136988 e!136987)))

(declare-fun c!35556 () Bool)

(assert (=> b!210364 (= c!35556 (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun b!210365 () Bool)

(assert (=> b!210365 (= e!136986 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210365 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!210366 () Bool)

(declare-fun res!102637 () Bool)

(assert (=> b!210366 (=> (not res!102637) (not e!136990))))

(assert (=> b!210366 (= res!102637 (not (contains!1395 lt!107709 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!57957 () Bool)

(assert (=> d!57957 e!136990))

(declare-fun res!102639 () Bool)

(assert (=> d!57957 (=> (not res!102639) (not e!136990))))

(assert (=> d!57957 (= res!102639 (not (contains!1395 lt!107709 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!57957 (= lt!107709 e!136989)))

(declare-fun c!35555 () Bool)

(assert (=> d!57957 (= c!35555 (bvsge #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(assert (=> d!57957 (validMask!0 mask!1149)))

(assert (=> d!57957 (= (getCurrentListMapNoExtraKeys!486 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107709)))

(declare-fun b!210357 () Bool)

(assert (=> b!210357 (= e!136989 (ListLongMap!3066 Nil!3043))))

(assert (= (and d!57957 c!35555) b!210357))

(assert (= (and d!57957 (not c!35555)) b!210361))

(assert (= (and b!210361 c!35558) b!210360))

(assert (= (and b!210361 (not c!35558)) b!210358))

(assert (= (or b!210360 b!210358) bm!19877))

(assert (= (and d!57957 res!102639) b!210366))

(assert (= (and b!210366 res!102637) b!210363))

(assert (= (and b!210363 res!102638) b!210365))

(assert (= (and b!210363 c!35557) b!210355))

(assert (= (and b!210363 (not c!35557)) b!210364))

(assert (= (and b!210355 res!102640) b!210362))

(assert (= (and b!210364 c!35556) b!210359))

(assert (= (and b!210364 (not c!35556)) b!210356))

(declare-fun b_lambda!7591 () Bool)

(assert (=> (not b_lambda!7591) (not b!210360)))

(assert (=> b!210360 t!7984))

(declare-fun b_and!12319 () Bool)

(assert (= b_and!12317 (and (=> t!7984 result!4973) b_and!12319)))

(declare-fun b_lambda!7593 () Bool)

(assert (=> (not b_lambda!7593) (not b!210362)))

(assert (=> b!210362 t!7984))

(declare-fun b_and!12321 () Bool)

(assert (= b_and!12319 (and (=> t!7984 result!4973) b_and!12321)))

(declare-fun m!237885 () Bool)

(assert (=> b!210356 m!237885))

(declare-fun m!237887 () Bool)

(assert (=> bm!19877 m!237887))

(assert (=> b!210359 m!237887))

(assert (=> b!210362 m!237825))

(assert (=> b!210362 m!237825))

(declare-fun m!237889 () Bool)

(assert (=> b!210362 m!237889))

(declare-fun m!237891 () Bool)

(assert (=> b!210362 m!237891))

(assert (=> b!210362 m!237861))

(assert (=> b!210362 m!237891))

(assert (=> b!210362 m!237861))

(declare-fun m!237893 () Bool)

(assert (=> b!210362 m!237893))

(assert (=> b!210365 m!237825))

(assert (=> b!210365 m!237825))

(assert (=> b!210365 m!237829))

(declare-fun m!237895 () Bool)

(assert (=> d!57957 m!237895))

(assert (=> d!57957 m!237701))

(declare-fun m!237897 () Bool)

(assert (=> b!210360 m!237897))

(assert (=> b!210360 m!237825))

(declare-fun m!237899 () Bool)

(assert (=> b!210360 m!237899))

(declare-fun m!237901 () Bool)

(assert (=> b!210360 m!237901))

(declare-fun m!237903 () Bool)

(assert (=> b!210360 m!237903))

(assert (=> b!210360 m!237891))

(assert (=> b!210360 m!237861))

(assert (=> b!210360 m!237901))

(assert (=> b!210360 m!237891))

(assert (=> b!210360 m!237861))

(assert (=> b!210360 m!237893))

(assert (=> b!210361 m!237825))

(assert (=> b!210361 m!237825))

(assert (=> b!210361 m!237829))

(declare-fun m!237905 () Bool)

(assert (=> b!210366 m!237905))

(assert (=> b!210355 m!237825))

(assert (=> b!210355 m!237825))

(declare-fun m!237907 () Bool)

(assert (=> b!210355 m!237907))

(assert (=> b!210212 d!57957))

(declare-fun b!210409 () Bool)

(declare-fun e!137023 () Unit!6388)

(declare-fun lt!107775 () Unit!6388)

(assert (=> b!210409 (= e!137023 lt!107775)))

(declare-fun lt!107762 () ListLongMap!3065)

(assert (=> b!210409 (= lt!107762 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107774 () (_ BitVec 64))

(assert (=> b!210409 (= lt!107774 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107764 () (_ BitVec 64))

(assert (=> b!210409 (= lt!107764 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107772 () Unit!6388)

(declare-fun addStillContains!167 (ListLongMap!3065 (_ BitVec 64) V!6851 (_ BitVec 64)) Unit!6388)

(assert (=> b!210409 (= lt!107772 (addStillContains!167 lt!107762 lt!107774 zeroValue!615 lt!107764))))

(assert (=> b!210409 (contains!1395 (+!551 lt!107762 (tuple2!4153 lt!107774 zeroValue!615)) lt!107764)))

(declare-fun lt!107773 () Unit!6388)

(assert (=> b!210409 (= lt!107773 lt!107772)))

(declare-fun lt!107756 () ListLongMap!3065)

(assert (=> b!210409 (= lt!107756 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107759 () (_ BitVec 64))

(assert (=> b!210409 (= lt!107759 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107771 () (_ BitVec 64))

(assert (=> b!210409 (= lt!107771 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107760 () Unit!6388)

(declare-fun addApplyDifferent!167 (ListLongMap!3065 (_ BitVec 64) V!6851 (_ BitVec 64)) Unit!6388)

(assert (=> b!210409 (= lt!107760 (addApplyDifferent!167 lt!107756 lt!107759 minValue!615 lt!107771))))

(assert (=> b!210409 (= (apply!191 (+!551 lt!107756 (tuple2!4153 lt!107759 minValue!615)) lt!107771) (apply!191 lt!107756 lt!107771))))

(declare-fun lt!107758 () Unit!6388)

(assert (=> b!210409 (= lt!107758 lt!107760)))

(declare-fun lt!107761 () ListLongMap!3065)

(assert (=> b!210409 (= lt!107761 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107766 () (_ BitVec 64))

(assert (=> b!210409 (= lt!107766 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107768 () (_ BitVec 64))

(assert (=> b!210409 (= lt!107768 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107770 () Unit!6388)

(assert (=> b!210409 (= lt!107770 (addApplyDifferent!167 lt!107761 lt!107766 zeroValue!615 lt!107768))))

(assert (=> b!210409 (= (apply!191 (+!551 lt!107761 (tuple2!4153 lt!107766 zeroValue!615)) lt!107768) (apply!191 lt!107761 lt!107768))))

(declare-fun lt!107763 () Unit!6388)

(assert (=> b!210409 (= lt!107763 lt!107770)))

(declare-fun lt!107767 () ListLongMap!3065)

(assert (=> b!210409 (= lt!107767 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107765 () (_ BitVec 64))

(assert (=> b!210409 (= lt!107765 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107777 () (_ BitVec 64))

(assert (=> b!210409 (= lt!107777 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210409 (= lt!107775 (addApplyDifferent!167 lt!107767 lt!107765 minValue!615 lt!107777))))

(assert (=> b!210409 (= (apply!191 (+!551 lt!107767 (tuple2!4153 lt!107765 minValue!615)) lt!107777) (apply!191 lt!107767 lt!107777))))

(declare-fun b!210410 () Bool)

(declare-fun e!137019 () Bool)

(declare-fun call!19897 () Bool)

(assert (=> b!210410 (= e!137019 (not call!19897))))

(declare-fun b!210411 () Bool)

(declare-fun e!137026 () Bool)

(declare-fun e!137020 () Bool)

(assert (=> b!210411 (= e!137026 e!137020)))

(declare-fun res!102665 () Bool)

(declare-fun call!19901 () Bool)

(assert (=> b!210411 (= res!102665 call!19901)))

(assert (=> b!210411 (=> (not res!102665) (not e!137020))))

(declare-fun b!210412 () Bool)

(declare-fun e!137027 () ListLongMap!3065)

(declare-fun call!19895 () ListLongMap!3065)

(assert (=> b!210412 (= e!137027 (+!551 call!19895 (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210413 () Bool)

(declare-fun e!137028 () ListLongMap!3065)

(declare-fun call!19899 () ListLongMap!3065)

(assert (=> b!210413 (= e!137028 call!19899)))

(declare-fun b!210414 () Bool)

(declare-fun e!137022 () Bool)

(assert (=> b!210414 (= e!137022 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun call!19900 () ListLongMap!3065)

(declare-fun call!19898 () ListLongMap!3065)

(declare-fun call!19896 () ListLongMap!3065)

(declare-fun c!35575 () Bool)

(declare-fun bm!19892 () Bool)

(declare-fun c!35572 () Bool)

(assert (=> bm!19892 (= call!19895 (+!551 (ite c!35575 call!19896 (ite c!35572 call!19900 call!19898)) (ite (or c!35575 c!35572) (tuple2!4153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210415 () Bool)

(declare-fun e!137024 () ListLongMap!3065)

(assert (=> b!210415 (= e!137024 call!19899)))

(declare-fun b!210416 () Bool)

(declare-fun e!137021 () Bool)

(assert (=> b!210416 (= e!137021 e!137026)))

(declare-fun c!35574 () Bool)

(assert (=> b!210416 (= c!35574 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210417 () Bool)

(declare-fun e!137025 () Bool)

(declare-fun lt!107757 () ListLongMap!3065)

(assert (=> b!210417 (= e!137025 (= (apply!191 lt!107757 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210418 () Bool)

(declare-fun res!102662 () Bool)

(assert (=> b!210418 (=> (not res!102662) (not e!137021))))

(declare-fun e!137018 () Bool)

(assert (=> b!210418 (= res!102662 e!137018)))

(declare-fun res!102667 () Bool)

(assert (=> b!210418 (=> res!102667 e!137018)))

(assert (=> b!210418 (= res!102667 (not e!137022))))

(declare-fun res!102661 () Bool)

(assert (=> b!210418 (=> (not res!102661) (not e!137022))))

(assert (=> b!210418 (= res!102661 (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun bm!19893 () Bool)

(assert (=> bm!19893 (= call!19900 call!19896)))

(declare-fun b!210419 () Bool)

(declare-fun c!35571 () Bool)

(assert (=> b!210419 (= c!35571 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!210419 (= e!137028 e!137024)))

(declare-fun b!210420 () Bool)

(declare-fun res!102664 () Bool)

(assert (=> b!210420 (=> (not res!102664) (not e!137021))))

(assert (=> b!210420 (= res!102664 e!137019)))

(declare-fun c!35576 () Bool)

(assert (=> b!210420 (= c!35576 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210421 () Bool)

(declare-fun e!137017 () Bool)

(assert (=> b!210421 (= e!137018 e!137017)))

(declare-fun res!102666 () Bool)

(assert (=> b!210421 (=> (not res!102666) (not e!137017))))

(assert (=> b!210421 (= res!102666 (contains!1395 lt!107757 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210421 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun bm!19894 () Bool)

(assert (=> bm!19894 (= call!19898 call!19900)))

(declare-fun bm!19895 () Bool)

(assert (=> bm!19895 (= call!19901 (contains!1395 lt!107757 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210422 () Bool)

(declare-fun e!137029 () Bool)

(assert (=> b!210422 (= e!137029 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210423 () Bool)

(assert (=> b!210423 (= e!137024 call!19898)))

(declare-fun b!210424 () Bool)

(assert (=> b!210424 (= e!137017 (= (apply!191 lt!107757 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)) (get!2547 (select (arr!4751 _values!649) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210424 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 _values!649)))))

(assert (=> b!210424 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun bm!19896 () Bool)

(assert (=> bm!19896 (= call!19899 call!19895)))

(declare-fun b!210425 () Bool)

(assert (=> b!210425 (= e!137020 (= (apply!191 lt!107757 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!210426 () Bool)

(assert (=> b!210426 (= e!137019 e!137025)))

(declare-fun res!102663 () Bool)

(assert (=> b!210426 (= res!102663 call!19897)))

(assert (=> b!210426 (=> (not res!102663) (not e!137025))))

(declare-fun b!210427 () Bool)

(assert (=> b!210427 (= e!137026 (not call!19901))))

(declare-fun bm!19897 () Bool)

(assert (=> bm!19897 (= call!19897 (contains!1395 lt!107757 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210428 () Bool)

(assert (=> b!210428 (= e!137027 e!137028)))

(assert (=> b!210428 (= c!35572 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!57959 () Bool)

(assert (=> d!57959 e!137021))

(declare-fun res!102659 () Bool)

(assert (=> d!57959 (=> (not res!102659) (not e!137021))))

(assert (=> d!57959 (= res!102659 (or (bvsge #b00000000000000000000000000000000 (size!5077 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))))

(declare-fun lt!107776 () ListLongMap!3065)

(assert (=> d!57959 (= lt!107757 lt!107776)))

(declare-fun lt!107769 () Unit!6388)

(assert (=> d!57959 (= lt!107769 e!137023)))

(declare-fun c!35573 () Bool)

(assert (=> d!57959 (= c!35573 e!137029)))

(declare-fun res!102660 () Bool)

(assert (=> d!57959 (=> (not res!102660) (not e!137029))))

(assert (=> d!57959 (= res!102660 (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(assert (=> d!57959 (= lt!107776 e!137027)))

(assert (=> d!57959 (= c!35575 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57959 (validMask!0 mask!1149)))

(assert (=> d!57959 (= (getCurrentListMap!1084 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107757)))

(declare-fun bm!19898 () Bool)

(assert (=> bm!19898 (= call!19896 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210429 () Bool)

(declare-fun Unit!6392 () Unit!6388)

(assert (=> b!210429 (= e!137023 Unit!6392)))

(assert (= (and d!57959 c!35575) b!210412))

(assert (= (and d!57959 (not c!35575)) b!210428))

(assert (= (and b!210428 c!35572) b!210413))

(assert (= (and b!210428 (not c!35572)) b!210419))

(assert (= (and b!210419 c!35571) b!210415))

(assert (= (and b!210419 (not c!35571)) b!210423))

(assert (= (or b!210415 b!210423) bm!19894))

(assert (= (or b!210413 bm!19894) bm!19893))

(assert (= (or b!210413 b!210415) bm!19896))

(assert (= (or b!210412 bm!19893) bm!19898))

(assert (= (or b!210412 bm!19896) bm!19892))

(assert (= (and d!57959 res!102660) b!210422))

(assert (= (and d!57959 c!35573) b!210409))

(assert (= (and d!57959 (not c!35573)) b!210429))

(assert (= (and d!57959 res!102659) b!210418))

(assert (= (and b!210418 res!102661) b!210414))

(assert (= (and b!210418 (not res!102667)) b!210421))

(assert (= (and b!210421 res!102666) b!210424))

(assert (= (and b!210418 res!102662) b!210420))

(assert (= (and b!210420 c!35576) b!210426))

(assert (= (and b!210420 (not c!35576)) b!210410))

(assert (= (and b!210426 res!102663) b!210417))

(assert (= (or b!210426 b!210410) bm!19897))

(assert (= (and b!210420 res!102664) b!210416))

(assert (= (and b!210416 c!35574) b!210411))

(assert (= (and b!210416 (not c!35574)) b!210427))

(assert (= (and b!210411 res!102665) b!210425))

(assert (= (or b!210411 b!210427) bm!19895))

(declare-fun b_lambda!7595 () Bool)

(assert (=> (not b_lambda!7595) (not b!210424)))

(assert (=> b!210424 t!7984))

(declare-fun b_and!12323 () Bool)

(assert (= b_and!12321 (and (=> t!7984 result!4973) b_and!12323)))

(assert (=> d!57959 m!237701))

(declare-fun m!237909 () Bool)

(assert (=> b!210409 m!237909))

(declare-fun m!237911 () Bool)

(assert (=> b!210409 m!237911))

(declare-fun m!237913 () Bool)

(assert (=> b!210409 m!237913))

(declare-fun m!237915 () Bool)

(assert (=> b!210409 m!237915))

(declare-fun m!237917 () Bool)

(assert (=> b!210409 m!237917))

(declare-fun m!237919 () Bool)

(assert (=> b!210409 m!237919))

(declare-fun m!237921 () Bool)

(assert (=> b!210409 m!237921))

(declare-fun m!237923 () Bool)

(assert (=> b!210409 m!237923))

(declare-fun m!237925 () Bool)

(assert (=> b!210409 m!237925))

(assert (=> b!210409 m!237911))

(declare-fun m!237927 () Bool)

(assert (=> b!210409 m!237927))

(assert (=> b!210409 m!237921))

(declare-fun m!237929 () Bool)

(assert (=> b!210409 m!237929))

(assert (=> b!210409 m!237681))

(assert (=> b!210409 m!237923))

(assert (=> b!210409 m!237825))

(declare-fun m!237931 () Bool)

(assert (=> b!210409 m!237931))

(declare-fun m!237933 () Bool)

(assert (=> b!210409 m!237933))

(assert (=> b!210409 m!237917))

(declare-fun m!237935 () Bool)

(assert (=> b!210409 m!237935))

(declare-fun m!237937 () Bool)

(assert (=> b!210409 m!237937))

(declare-fun m!237939 () Bool)

(assert (=> b!210417 m!237939))

(assert (=> b!210414 m!237825))

(assert (=> b!210414 m!237825))

(assert (=> b!210414 m!237829))

(declare-fun m!237941 () Bool)

(assert (=> b!210425 m!237941))

(assert (=> b!210421 m!237825))

(assert (=> b!210421 m!237825))

(declare-fun m!237943 () Bool)

(assert (=> b!210421 m!237943))

(assert (=> b!210422 m!237825))

(assert (=> b!210422 m!237825))

(assert (=> b!210422 m!237829))

(declare-fun m!237945 () Bool)

(assert (=> bm!19897 m!237945))

(declare-fun m!237947 () Bool)

(assert (=> b!210412 m!237947))

(assert (=> b!210424 m!237861))

(assert (=> b!210424 m!237859))

(assert (=> b!210424 m!237861))

(assert (=> b!210424 m!237863))

(assert (=> b!210424 m!237825))

(declare-fun m!237949 () Bool)

(assert (=> b!210424 m!237949))

(assert (=> b!210424 m!237825))

(assert (=> b!210424 m!237859))

(declare-fun m!237951 () Bool)

(assert (=> bm!19892 m!237951))

(assert (=> bm!19898 m!237681))

(declare-fun m!237953 () Bool)

(assert (=> bm!19895 m!237953))

(assert (=> b!210212 d!57959))

(declare-fun b!210430 () Bool)

(declare-fun e!137036 () Unit!6388)

(declare-fun lt!107797 () Unit!6388)

(assert (=> b!210430 (= e!137036 lt!107797)))

(declare-fun lt!107784 () ListLongMap!3065)

(assert (=> b!210430 (= lt!107784 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107796 () (_ BitVec 64))

(assert (=> b!210430 (= lt!107796 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107786 () (_ BitVec 64))

(assert (=> b!210430 (= lt!107786 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107794 () Unit!6388)

(assert (=> b!210430 (= lt!107794 (addStillContains!167 lt!107784 lt!107796 zeroValue!615 lt!107786))))

(assert (=> b!210430 (contains!1395 (+!551 lt!107784 (tuple2!4153 lt!107796 zeroValue!615)) lt!107786)))

(declare-fun lt!107795 () Unit!6388)

(assert (=> b!210430 (= lt!107795 lt!107794)))

(declare-fun lt!107778 () ListLongMap!3065)

(assert (=> b!210430 (= lt!107778 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107781 () (_ BitVec 64))

(assert (=> b!210430 (= lt!107781 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107793 () (_ BitVec 64))

(assert (=> b!210430 (= lt!107793 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107782 () Unit!6388)

(assert (=> b!210430 (= lt!107782 (addApplyDifferent!167 lt!107778 lt!107781 minValue!615 lt!107793))))

(assert (=> b!210430 (= (apply!191 (+!551 lt!107778 (tuple2!4153 lt!107781 minValue!615)) lt!107793) (apply!191 lt!107778 lt!107793))))

(declare-fun lt!107780 () Unit!6388)

(assert (=> b!210430 (= lt!107780 lt!107782)))

(declare-fun lt!107783 () ListLongMap!3065)

(assert (=> b!210430 (= lt!107783 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107788 () (_ BitVec 64))

(assert (=> b!210430 (= lt!107788 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107790 () (_ BitVec 64))

(assert (=> b!210430 (= lt!107790 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(declare-fun lt!107792 () Unit!6388)

(assert (=> b!210430 (= lt!107792 (addApplyDifferent!167 lt!107783 lt!107788 zeroValue!615 lt!107790))))

(assert (=> b!210430 (= (apply!191 (+!551 lt!107783 (tuple2!4153 lt!107788 zeroValue!615)) lt!107790) (apply!191 lt!107783 lt!107790))))

(declare-fun lt!107785 () Unit!6388)

(assert (=> b!210430 (= lt!107785 lt!107792)))

(declare-fun lt!107789 () ListLongMap!3065)

(assert (=> b!210430 (= lt!107789 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107787 () (_ BitVec 64))

(assert (=> b!210430 (= lt!107787 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!107799 () (_ BitVec 64))

(assert (=> b!210430 (= lt!107799 (select (arr!4752 _keys!825) #b00000000000000000000000000000000))))

(assert (=> b!210430 (= lt!107797 (addApplyDifferent!167 lt!107789 lt!107787 minValue!615 lt!107799))))

(assert (=> b!210430 (= (apply!191 (+!551 lt!107789 (tuple2!4153 lt!107787 minValue!615)) lt!107799) (apply!191 lt!107789 lt!107799))))

(declare-fun b!210431 () Bool)

(declare-fun e!137032 () Bool)

(declare-fun call!19904 () Bool)

(assert (=> b!210431 (= e!137032 (not call!19904))))

(declare-fun b!210432 () Bool)

(declare-fun e!137039 () Bool)

(declare-fun e!137033 () Bool)

(assert (=> b!210432 (= e!137039 e!137033)))

(declare-fun res!102674 () Bool)

(declare-fun call!19908 () Bool)

(assert (=> b!210432 (= res!102674 call!19908)))

(assert (=> b!210432 (=> (not res!102674) (not e!137033))))

(declare-fun b!210433 () Bool)

(declare-fun e!137040 () ListLongMap!3065)

(declare-fun call!19902 () ListLongMap!3065)

(assert (=> b!210433 (= e!137040 (+!551 call!19902 (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615)))))

(declare-fun b!210434 () Bool)

(declare-fun e!137041 () ListLongMap!3065)

(declare-fun call!19906 () ListLongMap!3065)

(assert (=> b!210434 (= e!137041 call!19906)))

(declare-fun b!210435 () Bool)

(declare-fun e!137035 () Bool)

(assert (=> b!210435 (= e!137035 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun c!35581 () Bool)

(declare-fun call!19907 () ListLongMap!3065)

(declare-fun call!19905 () ListLongMap!3065)

(declare-fun call!19903 () ListLongMap!3065)

(declare-fun bm!19899 () Bool)

(declare-fun c!35578 () Bool)

(assert (=> bm!19899 (= call!19902 (+!551 (ite c!35581 call!19903 (ite c!35578 call!19907 call!19905)) (ite (or c!35581 c!35578) (tuple2!4153 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615) (tuple2!4153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))))

(declare-fun b!210436 () Bool)

(declare-fun e!137037 () ListLongMap!3065)

(assert (=> b!210436 (= e!137037 call!19906)))

(declare-fun b!210437 () Bool)

(declare-fun e!137034 () Bool)

(assert (=> b!210437 (= e!137034 e!137039)))

(declare-fun c!35580 () Bool)

(assert (=> b!210437 (= c!35580 (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!210438 () Bool)

(declare-fun e!137038 () Bool)

(declare-fun lt!107779 () ListLongMap!3065)

(assert (=> b!210438 (= e!137038 (= (apply!191 lt!107779 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!615))))

(declare-fun b!210439 () Bool)

(declare-fun res!102671 () Bool)

(assert (=> b!210439 (=> (not res!102671) (not e!137034))))

(declare-fun e!137031 () Bool)

(assert (=> b!210439 (= res!102671 e!137031)))

(declare-fun res!102676 () Bool)

(assert (=> b!210439 (=> res!102676 e!137031)))

(assert (=> b!210439 (= res!102676 (not e!137035))))

(declare-fun res!102670 () Bool)

(assert (=> b!210439 (=> (not res!102670) (not e!137035))))

(assert (=> b!210439 (= res!102670 (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun bm!19900 () Bool)

(assert (=> bm!19900 (= call!19907 call!19903)))

(declare-fun b!210440 () Bool)

(declare-fun c!35577 () Bool)

(assert (=> b!210440 (= c!35577 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!210440 (= e!137041 e!137037)))

(declare-fun b!210441 () Bool)

(declare-fun res!102673 () Bool)

(assert (=> b!210441 (=> (not res!102673) (not e!137034))))

(assert (=> b!210441 (= res!102673 e!137032)))

(declare-fun c!35582 () Bool)

(assert (=> b!210441 (= c!35582 (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!210442 () Bool)

(declare-fun e!137030 () Bool)

(assert (=> b!210442 (= e!137031 e!137030)))

(declare-fun res!102675 () Bool)

(assert (=> b!210442 (=> (not res!102675) (not e!137030))))

(assert (=> b!210442 (= res!102675 (contains!1395 lt!107779 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(assert (=> b!210442 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun bm!19901 () Bool)

(assert (=> bm!19901 (= call!19905 call!19907)))

(declare-fun bm!19902 () Bool)

(assert (=> bm!19902 (= call!19908 (contains!1395 lt!107779 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210443 () Bool)

(declare-fun e!137042 () Bool)

(assert (=> b!210443 (= e!137042 (validKeyInArray!0 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun b!210444 () Bool)

(assert (=> b!210444 (= e!137037 call!19905)))

(declare-fun b!210445 () Bool)

(assert (=> b!210445 (= e!137030 (= (apply!191 lt!107779 (select (arr!4752 _keys!825) #b00000000000000000000000000000000)) (get!2547 (select (arr!4751 lt!107602) #b00000000000000000000000000000000) (dynLambda!534 defaultEntry!657 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!210445 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5076 lt!107602)))))

(assert (=> b!210445 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(declare-fun bm!19903 () Bool)

(assert (=> bm!19903 (= call!19906 call!19902)))

(declare-fun b!210446 () Bool)

(assert (=> b!210446 (= e!137033 (= (apply!191 lt!107779 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!615))))

(declare-fun b!210447 () Bool)

(assert (=> b!210447 (= e!137032 e!137038)))

(declare-fun res!102672 () Bool)

(assert (=> b!210447 (= res!102672 call!19904)))

(assert (=> b!210447 (=> (not res!102672) (not e!137038))))

(declare-fun b!210448 () Bool)

(assert (=> b!210448 (= e!137039 (not call!19908))))

(declare-fun bm!19904 () Bool)

(assert (=> bm!19904 (= call!19904 (contains!1395 lt!107779 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!210449 () Bool)

(assert (=> b!210449 (= e!137040 e!137041)))

(assert (=> b!210449 (= c!35578 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!57961 () Bool)

(assert (=> d!57961 e!137034))

(declare-fun res!102668 () Bool)

(assert (=> d!57961 (=> (not res!102668) (not e!137034))))

(assert (=> d!57961 (= res!102668 (or (bvsge #b00000000000000000000000000000000 (size!5077 _keys!825)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))))

(declare-fun lt!107798 () ListLongMap!3065)

(assert (=> d!57961 (= lt!107779 lt!107798)))

(declare-fun lt!107791 () Unit!6388)

(assert (=> d!57961 (= lt!107791 e!137036)))

(declare-fun c!35579 () Bool)

(assert (=> d!57961 (= c!35579 e!137042)))

(declare-fun res!102669 () Bool)

(assert (=> d!57961 (=> (not res!102669) (not e!137042))))

(assert (=> d!57961 (= res!102669 (bvslt #b00000000000000000000000000000000 (size!5077 _keys!825)))))

(assert (=> d!57961 (= lt!107798 e!137040)))

(assert (=> d!57961 (= c!35581 (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!57961 (validMask!0 mask!1149)))

(assert (=> d!57961 (= (getCurrentListMap!1084 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657) lt!107779)))

(declare-fun bm!19905 () Bool)

(assert (=> bm!19905 (= call!19903 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!107602 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210450 () Bool)

(declare-fun Unit!6393 () Unit!6388)

(assert (=> b!210450 (= e!137036 Unit!6393)))

(assert (= (and d!57961 c!35581) b!210433))

(assert (= (and d!57961 (not c!35581)) b!210449))

(assert (= (and b!210449 c!35578) b!210434))

(assert (= (and b!210449 (not c!35578)) b!210440))

(assert (= (and b!210440 c!35577) b!210436))

(assert (= (and b!210440 (not c!35577)) b!210444))

(assert (= (or b!210436 b!210444) bm!19901))

(assert (= (or b!210434 bm!19901) bm!19900))

(assert (= (or b!210434 b!210436) bm!19903))

(assert (= (or b!210433 bm!19900) bm!19905))

(assert (= (or b!210433 bm!19903) bm!19899))

(assert (= (and d!57961 res!102669) b!210443))

(assert (= (and d!57961 c!35579) b!210430))

(assert (= (and d!57961 (not c!35579)) b!210450))

(assert (= (and d!57961 res!102668) b!210439))

(assert (= (and b!210439 res!102670) b!210435))

(assert (= (and b!210439 (not res!102676)) b!210442))

(assert (= (and b!210442 res!102675) b!210445))

(assert (= (and b!210439 res!102671) b!210441))

(assert (= (and b!210441 c!35582) b!210447))

(assert (= (and b!210441 (not c!35582)) b!210431))

(assert (= (and b!210447 res!102672) b!210438))

(assert (= (or b!210447 b!210431) bm!19904))

(assert (= (and b!210441 res!102673) b!210437))

(assert (= (and b!210437 c!35580) b!210432))

(assert (= (and b!210437 (not c!35580)) b!210448))

(assert (= (and b!210432 res!102674) b!210446))

(assert (= (or b!210432 b!210448) bm!19902))

(declare-fun b_lambda!7597 () Bool)

(assert (=> (not b_lambda!7597) (not b!210445)))

(assert (=> b!210445 t!7984))

(declare-fun b_and!12325 () Bool)

(assert (= b_and!12323 (and (=> t!7984 result!4973) b_and!12325)))

(assert (=> d!57961 m!237701))

(declare-fun m!237955 () Bool)

(assert (=> b!210430 m!237955))

(declare-fun m!237957 () Bool)

(assert (=> b!210430 m!237957))

(declare-fun m!237959 () Bool)

(assert (=> b!210430 m!237959))

(declare-fun m!237961 () Bool)

(assert (=> b!210430 m!237961))

(declare-fun m!237963 () Bool)

(assert (=> b!210430 m!237963))

(declare-fun m!237965 () Bool)

(assert (=> b!210430 m!237965))

(declare-fun m!237967 () Bool)

(assert (=> b!210430 m!237967))

(declare-fun m!237969 () Bool)

(assert (=> b!210430 m!237969))

(declare-fun m!237971 () Bool)

(assert (=> b!210430 m!237971))

(assert (=> b!210430 m!237957))

(declare-fun m!237973 () Bool)

(assert (=> b!210430 m!237973))

(assert (=> b!210430 m!237967))

(declare-fun m!237975 () Bool)

(assert (=> b!210430 m!237975))

(assert (=> b!210430 m!237677))

(assert (=> b!210430 m!237969))

(assert (=> b!210430 m!237825))

(declare-fun m!237977 () Bool)

(assert (=> b!210430 m!237977))

(declare-fun m!237979 () Bool)

(assert (=> b!210430 m!237979))

(assert (=> b!210430 m!237963))

(declare-fun m!237981 () Bool)

(assert (=> b!210430 m!237981))

(declare-fun m!237983 () Bool)

(assert (=> b!210430 m!237983))

(declare-fun m!237985 () Bool)

(assert (=> b!210438 m!237985))

(assert (=> b!210435 m!237825))

(assert (=> b!210435 m!237825))

(assert (=> b!210435 m!237829))

(declare-fun m!237987 () Bool)

(assert (=> b!210446 m!237987))

(assert (=> b!210442 m!237825))

(assert (=> b!210442 m!237825))

(declare-fun m!237989 () Bool)

(assert (=> b!210442 m!237989))

(assert (=> b!210443 m!237825))

(assert (=> b!210443 m!237825))

(assert (=> b!210443 m!237829))

(declare-fun m!237991 () Bool)

(assert (=> bm!19904 m!237991))

(declare-fun m!237993 () Bool)

(assert (=> b!210433 m!237993))

(assert (=> b!210445 m!237861))

(assert (=> b!210445 m!237891))

(assert (=> b!210445 m!237861))

(assert (=> b!210445 m!237893))

(assert (=> b!210445 m!237825))

(declare-fun m!237995 () Bool)

(assert (=> b!210445 m!237995))

(assert (=> b!210445 m!237825))

(assert (=> b!210445 m!237891))

(declare-fun m!237997 () Bool)

(assert (=> bm!19899 m!237997))

(assert (=> bm!19905 m!237677))

(declare-fun m!237999 () Bool)

(assert (=> bm!19902 m!237999))

(assert (=> b!210212 d!57961))

(declare-fun b!210458 () Bool)

(declare-fun e!137048 () Bool)

(assert (=> b!210458 (= e!137048 tp_is_empty!5403)))

(declare-fun mapIsEmpty!9185 () Bool)

(declare-fun mapRes!9185 () Bool)

(assert (=> mapIsEmpty!9185 mapRes!9185))

(declare-fun condMapEmpty!9185 () Bool)

(declare-fun mapDefault!9185 () ValueCell!2358)

(assert (=> mapNonEmpty!9179 (= condMapEmpty!9185 (= mapRest!9179 ((as const (Array (_ BitVec 32) ValueCell!2358)) mapDefault!9185)))))

(assert (=> mapNonEmpty!9179 (= tp!19670 (and e!137048 mapRes!9185))))

(declare-fun b!210457 () Bool)

(declare-fun e!137047 () Bool)

(assert (=> b!210457 (= e!137047 tp_is_empty!5403)))

(declare-fun mapNonEmpty!9185 () Bool)

(declare-fun tp!19679 () Bool)

(assert (=> mapNonEmpty!9185 (= mapRes!9185 (and tp!19679 e!137047))))

(declare-fun mapKey!9185 () (_ BitVec 32))

(declare-fun mapRest!9185 () (Array (_ BitVec 32) ValueCell!2358))

(declare-fun mapValue!9185 () ValueCell!2358)

(assert (=> mapNonEmpty!9185 (= mapRest!9179 (store mapRest!9185 mapKey!9185 mapValue!9185))))

(assert (= (and mapNonEmpty!9179 condMapEmpty!9185) mapIsEmpty!9185))

(assert (= (and mapNonEmpty!9179 (not condMapEmpty!9185)) mapNonEmpty!9185))

(assert (= (and mapNonEmpty!9185 ((_ is ValueCellFull!2358) mapValue!9185)) b!210457))

(assert (= (and mapNonEmpty!9179 ((_ is ValueCellFull!2358) mapDefault!9185)) b!210458))

(declare-fun m!238001 () Bool)

(assert (=> mapNonEmpty!9185 m!238001))

(declare-fun b_lambda!7599 () Bool)

(assert (= b_lambda!7597 (or (and start!20928 b_free!5541) b_lambda!7599)))

(declare-fun b_lambda!7601 () Bool)

(assert (= b_lambda!7587 (or (and start!20928 b_free!5541) b_lambda!7601)))

(declare-fun b_lambda!7603 () Bool)

(assert (= b_lambda!7591 (or (and start!20928 b_free!5541) b_lambda!7603)))

(declare-fun b_lambda!7605 () Bool)

(assert (= b_lambda!7589 (or (and start!20928 b_free!5541) b_lambda!7605)))

(declare-fun b_lambda!7607 () Bool)

(assert (= b_lambda!7593 (or (and start!20928 b_free!5541) b_lambda!7607)))

(declare-fun b_lambda!7609 () Bool)

(assert (= b_lambda!7595 (or (and start!20928 b_free!5541) b_lambda!7609)))

(check-sat (not d!57943) (not b!210342) (not b_lambda!7609) (not b!210414) (not b_next!5541) (not bm!19864) (not b!210422) (not b!210303) (not b!210270) (not b!210276) (not b!210362) (not b!210366) (not b!210425) (not d!57933) (not b!210353) (not d!57959) (not bm!19904) (not b!210446) (not b!210359) (not b!210417) (not b!210443) (not b!210360) (not b!210337) (not b!210430) (not d!57951) (not bm!19892) (not d!57961) (not bm!19905) (not b!210293) (not d!57941) (not b!210268) (not b!210445) (not b!210333) (not b!210272) (not bm!19870) (not bm!19895) (not b!210442) (not b!210361) (not bm!19867) (not b!210412) (not b!210273) (not bm!19897) (not d!57953) (not b!210409) (not b!210424) (not b!210343) (not d!57939) (not b!210365) (not b!210269) (not b!210306) (not b!210435) (not b_lambda!7601) (not b!210277) (not bm!19902) (not b!210356) (not b!210278) (not b!210275) (not bm!19899) (not b!210336) (not b!210290) (not b!210339) (not b_lambda!7603) (not bm!19875) (not b_lambda!7605) (not mapNonEmpty!9185) (not b!210291) (not bm!19877) (not bm!19898) (not b!210271) (not b!210355) (not b_lambda!7599) (not b!210338) (not b!210421) (not b!210438) (not b!210307) (not d!57935) (not b!210433) (not b!210274) (not b!210304) tp_is_empty!5403 (not b!210267) (not d!57937) (not d!57957) (not d!57955) (not b!210332) (not b_lambda!7607) b_and!12325 (not bm!19876))
(check-sat b_and!12325 (not b_next!5541))
