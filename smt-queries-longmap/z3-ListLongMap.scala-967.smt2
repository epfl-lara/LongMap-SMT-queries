; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20984 () Bool)

(assert start!20984)

(declare-fun b_free!5551 () Bool)

(declare-fun b_next!5551 () Bool)

(assert (=> start!20984 (= b_free!5551 (not b_next!5551))))

(declare-fun tp!19706 () Bool)

(declare-fun b_and!12319 () Bool)

(assert (=> start!20984 (= tp!19706 b_and!12319)))

(declare-fun b!210633 () Bool)

(declare-fun e!137143 () Bool)

(declare-fun tp_is_empty!5413 () Bool)

(assert (=> b!210633 (= e!137143 tp_is_empty!5413)))

(declare-fun mapNonEmpty!9200 () Bool)

(declare-fun mapRes!9200 () Bool)

(declare-fun tp!19705 () Bool)

(declare-fun e!137145 () Bool)

(assert (=> mapNonEmpty!9200 (= mapRes!9200 (and tp!19705 e!137145))))

(declare-datatypes ((V!6865 0))(
  ( (V!6866 (val!2751 Int)) )
))
(declare-datatypes ((ValueCell!2363 0))(
  ( (ValueCellFull!2363 (v!4731 V!6865)) (EmptyCell!2363) )
))
(declare-fun mapValue!9200 () ValueCell!2363)

(declare-fun mapRest!9200 () (Array (_ BitVec 32) ValueCell!2363))

(declare-datatypes ((array!10017 0))(
  ( (array!10018 (arr!4754 (Array (_ BitVec 32) ValueCell!2363)) (size!5080 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10017)

(declare-fun mapKey!9200 () (_ BitVec 32))

(assert (=> mapNonEmpty!9200 (= (arr!4754 _values!649) (store mapRest!9200 mapKey!9200 mapValue!9200))))

(declare-fun b!210634 () Bool)

(declare-fun res!102768 () Bool)

(declare-fun e!137142 () Bool)

(assert (=> b!210634 (=> (not res!102768) (not e!137142))))

(declare-datatypes ((array!10019 0))(
  ( (array!10020 (arr!4755 (Array (_ BitVec 32) (_ BitVec 64))) (size!5081 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10019)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210634 (= res!102768 (= (select (arr!4755 _keys!825) i!601) k0!843))))

(declare-fun b!210635 () Bool)

(declare-fun e!137140 () Bool)

(assert (=> b!210635 (= e!137140 (and e!137143 mapRes!9200))))

(declare-fun condMapEmpty!9200 () Bool)

(declare-fun mapDefault!9200 () ValueCell!2363)

(assert (=> b!210635 (= condMapEmpty!9200 (= (arr!4754 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2363)) mapDefault!9200)))))

(declare-fun b!210636 () Bool)

(declare-fun res!102770 () Bool)

(assert (=> b!210636 (=> (not res!102770) (not e!137142))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10019 (_ BitVec 32)) Bool)

(assert (=> b!210636 (= res!102770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210637 () Bool)

(declare-fun res!102763 () Bool)

(assert (=> b!210637 (=> (not res!102763) (not e!137142))))

(declare-datatypes ((List!3044 0))(
  ( (Nil!3041) (Cons!3040 (h!3682 (_ BitVec 64)) (t!7974 List!3044)) )
))
(declare-fun arrayNoDuplicates!0 (array!10019 (_ BitVec 32) List!3044) Bool)

(assert (=> b!210637 (= res!102763 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3041))))

(declare-fun b!210638 () Bool)

(declare-fun e!137144 () Bool)

(assert (=> b!210638 (= e!137142 (not e!137144))))

(declare-fun res!102762 () Bool)

(assert (=> b!210638 (=> res!102762 e!137144)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210638 (= res!102762 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4136 0))(
  ( (tuple2!4137 (_1!2079 (_ BitVec 64)) (_2!2079 V!6865)) )
))
(declare-datatypes ((List!3045 0))(
  ( (Nil!3042) (Cons!3041 (h!3683 tuple2!4136) (t!7975 List!3045)) )
))
(declare-datatypes ((ListLongMap!3039 0))(
  ( (ListLongMap!3040 (toList!1535 List!3045)) )
))
(declare-fun lt!107946 () ListLongMap!3039)

(declare-fun zeroValue!615 () V!6865)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6865)

(declare-fun getCurrentListMap!1047 (array!10019 array!10017 (_ BitVec 32) (_ BitVec 32) V!6865 V!6865 (_ BitVec 32) Int) ListLongMap!3039)

(assert (=> b!210638 (= lt!107946 (getCurrentListMap!1047 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107952 () ListLongMap!3039)

(declare-fun lt!107940 () array!10017)

(assert (=> b!210638 (= lt!107952 (getCurrentListMap!1047 _keys!825 lt!107940 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107948 () ListLongMap!3039)

(declare-fun lt!107950 () ListLongMap!3039)

(assert (=> b!210638 (and (= lt!107948 lt!107950) (= lt!107950 lt!107948))))

(declare-fun lt!107941 () ListLongMap!3039)

(declare-fun lt!107943 () tuple2!4136)

(declare-fun +!559 (ListLongMap!3039 tuple2!4136) ListLongMap!3039)

(assert (=> b!210638 (= lt!107950 (+!559 lt!107941 lt!107943))))

(declare-fun v!520 () V!6865)

(assert (=> b!210638 (= lt!107943 (tuple2!4137 k0!843 v!520))))

(declare-datatypes ((Unit!6362 0))(
  ( (Unit!6363) )
))
(declare-fun lt!107951 () Unit!6362)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!208 (array!10019 array!10017 (_ BitVec 32) (_ BitVec 32) V!6865 V!6865 (_ BitVec 32) (_ BitVec 64) V!6865 (_ BitVec 32) Int) Unit!6362)

(assert (=> b!210638 (= lt!107951 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!208 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!484 (array!10019 array!10017 (_ BitVec 32) (_ BitVec 32) V!6865 V!6865 (_ BitVec 32) Int) ListLongMap!3039)

(assert (=> b!210638 (= lt!107948 (getCurrentListMapNoExtraKeys!484 _keys!825 lt!107940 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210638 (= lt!107940 (array!10018 (store (arr!4754 _values!649) i!601 (ValueCellFull!2363 v!520)) (size!5080 _values!649)))))

(assert (=> b!210638 (= lt!107941 (getCurrentListMapNoExtraKeys!484 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210639 () Bool)

(declare-fun e!137139 () Bool)

(assert (=> b!210639 (= e!137144 e!137139)))

(declare-fun res!102765 () Bool)

(assert (=> b!210639 (=> res!102765 e!137139)))

(assert (=> b!210639 (= res!102765 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!107947 () ListLongMap!3039)

(declare-fun lt!107945 () ListLongMap!3039)

(assert (=> b!210639 (= lt!107947 lt!107945)))

(declare-fun lt!107953 () ListLongMap!3039)

(assert (=> b!210639 (= lt!107945 (+!559 lt!107953 lt!107943))))

(declare-fun lt!107949 () Unit!6362)

(declare-fun addCommutativeForDiffKeys!194 (ListLongMap!3039 (_ BitVec 64) V!6865 (_ BitVec 64) V!6865) Unit!6362)

(assert (=> b!210639 (= lt!107949 (addCommutativeForDiffKeys!194 lt!107941 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!107942 () tuple2!4136)

(assert (=> b!210639 (= lt!107952 (+!559 lt!107947 lt!107942))))

(declare-fun lt!107939 () tuple2!4136)

(assert (=> b!210639 (= lt!107947 (+!559 lt!107950 lt!107939))))

(declare-fun lt!107954 () ListLongMap!3039)

(assert (=> b!210639 (= lt!107946 lt!107954)))

(assert (=> b!210639 (= lt!107954 (+!559 lt!107953 lt!107942))))

(assert (=> b!210639 (= lt!107953 (+!559 lt!107941 lt!107939))))

(assert (=> b!210639 (= lt!107952 (+!559 (+!559 lt!107948 lt!107939) lt!107942))))

(assert (=> b!210639 (= lt!107942 (tuple2!4137 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210639 (= lt!107939 (tuple2!4137 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210640 () Bool)

(declare-fun res!102766 () Bool)

(assert (=> b!210640 (=> (not res!102766) (not e!137142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210640 (= res!102766 (validKeyInArray!0 k0!843))))

(declare-fun b!210642 () Bool)

(declare-fun res!102764 () Bool)

(assert (=> b!210642 (=> (not res!102764) (not e!137142))))

(assert (=> b!210642 (= res!102764 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5081 _keys!825))))))

(declare-fun b!210643 () Bool)

(assert (=> b!210643 (= e!137139 (bvslt i!601 (size!5080 _values!649)))))

(assert (=> b!210643 (= (+!559 lt!107945 lt!107942) (+!559 lt!107954 lt!107943))))

(declare-fun lt!107944 () Unit!6362)

(assert (=> b!210643 (= lt!107944 (addCommutativeForDiffKeys!194 lt!107953 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapIsEmpty!9200 () Bool)

(assert (=> mapIsEmpty!9200 mapRes!9200))

(declare-fun b!210644 () Bool)

(declare-fun res!102769 () Bool)

(assert (=> b!210644 (=> (not res!102769) (not e!137142))))

(assert (=> b!210644 (= res!102769 (and (= (size!5080 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5081 _keys!825) (size!5080 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210641 () Bool)

(assert (=> b!210641 (= e!137145 tp_is_empty!5413)))

(declare-fun res!102767 () Bool)

(assert (=> start!20984 (=> (not res!102767) (not e!137142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20984 (= res!102767 (validMask!0 mask!1149))))

(assert (=> start!20984 e!137142))

(declare-fun array_inv!3123 (array!10017) Bool)

(assert (=> start!20984 (and (array_inv!3123 _values!649) e!137140)))

(assert (=> start!20984 true))

(assert (=> start!20984 tp_is_empty!5413))

(declare-fun array_inv!3124 (array!10019) Bool)

(assert (=> start!20984 (array_inv!3124 _keys!825)))

(assert (=> start!20984 tp!19706))

(assert (= (and start!20984 res!102767) b!210644))

(assert (= (and b!210644 res!102769) b!210636))

(assert (= (and b!210636 res!102770) b!210637))

(assert (= (and b!210637 res!102763) b!210642))

(assert (= (and b!210642 res!102764) b!210640))

(assert (= (and b!210640 res!102766) b!210634))

(assert (= (and b!210634 res!102768) b!210638))

(assert (= (and b!210638 (not res!102762)) b!210639))

(assert (= (and b!210639 (not res!102765)) b!210643))

(assert (= (and b!210635 condMapEmpty!9200) mapIsEmpty!9200))

(assert (= (and b!210635 (not condMapEmpty!9200)) mapNonEmpty!9200))

(get-info :version)

(assert (= (and mapNonEmpty!9200 ((_ is ValueCellFull!2363) mapValue!9200)) b!210641))

(assert (= (and b!210635 ((_ is ValueCellFull!2363) mapDefault!9200)) b!210633))

(assert (= start!20984 b!210635))

(declare-fun m!237797 () Bool)

(assert (=> start!20984 m!237797))

(declare-fun m!237799 () Bool)

(assert (=> start!20984 m!237799))

(declare-fun m!237801 () Bool)

(assert (=> start!20984 m!237801))

(declare-fun m!237803 () Bool)

(assert (=> b!210637 m!237803))

(declare-fun m!237805 () Bool)

(assert (=> b!210643 m!237805))

(declare-fun m!237807 () Bool)

(assert (=> b!210643 m!237807))

(declare-fun m!237809 () Bool)

(assert (=> b!210643 m!237809))

(declare-fun m!237811 () Bool)

(assert (=> b!210638 m!237811))

(declare-fun m!237813 () Bool)

(assert (=> b!210638 m!237813))

(declare-fun m!237815 () Bool)

(assert (=> b!210638 m!237815))

(declare-fun m!237817 () Bool)

(assert (=> b!210638 m!237817))

(declare-fun m!237819 () Bool)

(assert (=> b!210638 m!237819))

(declare-fun m!237821 () Bool)

(assert (=> b!210638 m!237821))

(declare-fun m!237823 () Bool)

(assert (=> b!210638 m!237823))

(declare-fun m!237825 () Bool)

(assert (=> b!210639 m!237825))

(declare-fun m!237827 () Bool)

(assert (=> b!210639 m!237827))

(declare-fun m!237829 () Bool)

(assert (=> b!210639 m!237829))

(declare-fun m!237831 () Bool)

(assert (=> b!210639 m!237831))

(declare-fun m!237833 () Bool)

(assert (=> b!210639 m!237833))

(declare-fun m!237835 () Bool)

(assert (=> b!210639 m!237835))

(declare-fun m!237837 () Bool)

(assert (=> b!210639 m!237837))

(assert (=> b!210639 m!237833))

(declare-fun m!237839 () Bool)

(assert (=> b!210639 m!237839))

(declare-fun m!237841 () Bool)

(assert (=> mapNonEmpty!9200 m!237841))

(declare-fun m!237843 () Bool)

(assert (=> b!210636 m!237843))

(declare-fun m!237845 () Bool)

(assert (=> b!210634 m!237845))

(declare-fun m!237847 () Bool)

(assert (=> b!210640 m!237847))

(check-sat tp_is_empty!5413 (not b!210639) (not b!210640) (not b!210637) b_and!12319 (not mapNonEmpty!9200) (not b!210643) (not b_next!5551) (not b!210636) (not b!210638) (not start!20984))
(check-sat b_and!12319 (not b_next!5551))
