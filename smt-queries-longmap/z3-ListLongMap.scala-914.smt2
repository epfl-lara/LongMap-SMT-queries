; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20584 () Bool)

(assert start!20584)

(declare-fun b_free!5239 () Bool)

(declare-fun b_next!5239 () Bool)

(assert (=> start!20584 (= b_free!5239 (not b_next!5239))))

(declare-fun tp!18749 () Bool)

(declare-fun b_and!11959 () Bool)

(assert (=> start!20584 (= tp!18749 b_and!11959)))

(declare-fun b!204802 () Bool)

(declare-fun e!133961 () Bool)

(declare-fun e!133957 () Bool)

(assert (=> b!204802 (= e!133961 e!133957)))

(declare-fun res!98795 () Bool)

(assert (=> b!204802 (=> res!98795 e!133957)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!204802 (= res!98795 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6441 0))(
  ( (V!6442 (val!2592 Int)) )
))
(declare-datatypes ((tuple2!3916 0))(
  ( (tuple2!3917 (_1!1969 (_ BitVec 64)) (_2!1969 V!6441)) )
))
(declare-datatypes ((List!2818 0))(
  ( (Nil!2815) (Cons!2814 (h!3456 tuple2!3916) (t!7740 List!2818)) )
))
(declare-datatypes ((ListLongMap!2819 0))(
  ( (ListLongMap!2820 (toList!1425 List!2818)) )
))
(declare-fun lt!103904 () ListLongMap!2819)

(declare-fun lt!103902 () ListLongMap!2819)

(assert (=> b!204802 (= lt!103904 lt!103902)))

(declare-fun lt!103900 () ListLongMap!2819)

(declare-fun lt!103907 () tuple2!3916)

(declare-fun +!474 (ListLongMap!2819 tuple2!3916) ListLongMap!2819)

(assert (=> b!204802 (= lt!103902 (+!474 lt!103900 lt!103907))))

(declare-fun lt!103899 () ListLongMap!2819)

(declare-fun lt!103908 () ListLongMap!2819)

(assert (=> b!204802 (= lt!103899 lt!103908)))

(declare-fun lt!103906 () ListLongMap!2819)

(assert (=> b!204802 (= lt!103908 (+!474 lt!103906 lt!103907))))

(declare-fun lt!103905 () ListLongMap!2819)

(assert (=> b!204802 (= lt!103899 (+!474 lt!103905 lt!103907))))

(declare-fun minValue!615 () V!6441)

(assert (=> b!204802 (= lt!103907 (tuple2!3917 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204803 () Bool)

(assert (=> b!204803 (= e!133957 true)))

(declare-fun lt!103910 () tuple2!3916)

(assert (=> b!204803 (= lt!103908 (+!474 lt!103902 lt!103910))))

(declare-datatypes ((Unit!6190 0))(
  ( (Unit!6191) )
))
(declare-fun lt!103901 () Unit!6190)

(declare-fun v!520 () V!6441)

(declare-fun addCommutativeForDiffKeys!163 (ListLongMap!2819 (_ BitVec 64) V!6441 (_ BitVec 64) V!6441) Unit!6190)

(assert (=> b!204803 (= lt!103901 (addCommutativeForDiffKeys!163 lt!103900 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204804 () Bool)

(declare-fun res!98796 () Bool)

(declare-fun e!133958 () Bool)

(assert (=> b!204804 (=> (not res!98796) (not e!133958))))

(declare-datatypes ((array!9395 0))(
  ( (array!9396 (arr!4447 (Array (_ BitVec 32) (_ BitVec 64))) (size!4773 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9395)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204804 (= res!98796 (= (select (arr!4447 _keys!825) i!601) k0!843))))

(declare-fun b!204805 () Bool)

(declare-fun e!133956 () Bool)

(declare-fun tp_is_empty!5095 () Bool)

(assert (=> b!204805 (= e!133956 tp_is_empty!5095)))

(declare-fun b!204806 () Bool)

(assert (=> b!204806 (= e!133958 (not e!133961))))

(declare-fun res!98800 () Bool)

(assert (=> b!204806 (=> res!98800 e!133961)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204806 (= res!98800 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2204 0))(
  ( (ValueCellFull!2204 (v!4556 V!6441)) (EmptyCell!2204) )
))
(declare-datatypes ((array!9397 0))(
  ( (array!9398 (arr!4448 (Array (_ BitVec 32) ValueCell!2204)) (size!4774 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9397)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6441)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!970 (array!9395 array!9397 (_ BitVec 32) (_ BitVec 32) V!6441 V!6441 (_ BitVec 32) Int) ListLongMap!2819)

(assert (=> b!204806 (= lt!103904 (getCurrentListMap!970 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103903 () array!9397)

(assert (=> b!204806 (= lt!103899 (getCurrentListMap!970 _keys!825 lt!103903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204806 (and (= lt!103905 lt!103906) (= lt!103906 lt!103905))))

(assert (=> b!204806 (= lt!103906 (+!474 lt!103900 lt!103910))))

(assert (=> b!204806 (= lt!103910 (tuple2!3917 k0!843 v!520))))

(declare-fun lt!103909 () Unit!6190)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!129 (array!9395 array!9397 (_ BitVec 32) (_ BitVec 32) V!6441 V!6441 (_ BitVec 32) (_ BitVec 64) V!6441 (_ BitVec 32) Int) Unit!6190)

(assert (=> b!204806 (= lt!103909 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!129 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!380 (array!9395 array!9397 (_ BitVec 32) (_ BitVec 32) V!6441 V!6441 (_ BitVec 32) Int) ListLongMap!2819)

(assert (=> b!204806 (= lt!103905 (getCurrentListMapNoExtraKeys!380 _keys!825 lt!103903 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204806 (= lt!103903 (array!9398 (store (arr!4448 _values!649) i!601 (ValueCellFull!2204 v!520)) (size!4774 _values!649)))))

(assert (=> b!204806 (= lt!103900 (getCurrentListMapNoExtraKeys!380 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204807 () Bool)

(declare-fun res!98793 () Bool)

(assert (=> b!204807 (=> (not res!98793) (not e!133958))))

(assert (=> b!204807 (= res!98793 (and (= (size!4774 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4773 _keys!825) (size!4774 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8711 () Bool)

(declare-fun mapRes!8711 () Bool)

(assert (=> mapIsEmpty!8711 mapRes!8711))

(declare-fun b!204808 () Bool)

(declare-fun res!98798 () Bool)

(assert (=> b!204808 (=> (not res!98798) (not e!133958))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9395 (_ BitVec 32)) Bool)

(assert (=> b!204808 (= res!98798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!98794 () Bool)

(assert (=> start!20584 (=> (not res!98794) (not e!133958))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20584 (= res!98794 (validMask!0 mask!1149))))

(assert (=> start!20584 e!133958))

(declare-fun e!133962 () Bool)

(declare-fun array_inv!2925 (array!9397) Bool)

(assert (=> start!20584 (and (array_inv!2925 _values!649) e!133962)))

(assert (=> start!20584 true))

(assert (=> start!20584 tp_is_empty!5095))

(declare-fun array_inv!2926 (array!9395) Bool)

(assert (=> start!20584 (array_inv!2926 _keys!825)))

(assert (=> start!20584 tp!18749))

(declare-fun b!204801 () Bool)

(declare-fun res!98799 () Bool)

(assert (=> b!204801 (=> (not res!98799) (not e!133958))))

(declare-datatypes ((List!2819 0))(
  ( (Nil!2816) (Cons!2815 (h!3457 (_ BitVec 64)) (t!7741 List!2819)) )
))
(declare-fun arrayNoDuplicates!0 (array!9395 (_ BitVec 32) List!2819) Bool)

(assert (=> b!204801 (= res!98799 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2816))))

(declare-fun b!204809 () Bool)

(assert (=> b!204809 (= e!133962 (and e!133956 mapRes!8711))))

(declare-fun condMapEmpty!8711 () Bool)

(declare-fun mapDefault!8711 () ValueCell!2204)

(assert (=> b!204809 (= condMapEmpty!8711 (= (arr!4448 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2204)) mapDefault!8711)))))

(declare-fun b!204810 () Bool)

(declare-fun res!98801 () Bool)

(assert (=> b!204810 (=> (not res!98801) (not e!133958))))

(assert (=> b!204810 (= res!98801 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4773 _keys!825))))))

(declare-fun mapNonEmpty!8711 () Bool)

(declare-fun tp!18748 () Bool)

(declare-fun e!133959 () Bool)

(assert (=> mapNonEmpty!8711 (= mapRes!8711 (and tp!18748 e!133959))))

(declare-fun mapValue!8711 () ValueCell!2204)

(declare-fun mapKey!8711 () (_ BitVec 32))

(declare-fun mapRest!8711 () (Array (_ BitVec 32) ValueCell!2204))

(assert (=> mapNonEmpty!8711 (= (arr!4448 _values!649) (store mapRest!8711 mapKey!8711 mapValue!8711))))

(declare-fun b!204811 () Bool)

(declare-fun res!98797 () Bool)

(assert (=> b!204811 (=> (not res!98797) (not e!133958))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204811 (= res!98797 (validKeyInArray!0 k0!843))))

(declare-fun b!204812 () Bool)

(assert (=> b!204812 (= e!133959 tp_is_empty!5095)))

(assert (= (and start!20584 res!98794) b!204807))

(assert (= (and b!204807 res!98793) b!204808))

(assert (= (and b!204808 res!98798) b!204801))

(assert (= (and b!204801 res!98799) b!204810))

(assert (= (and b!204810 res!98801) b!204811))

(assert (= (and b!204811 res!98797) b!204804))

(assert (= (and b!204804 res!98796) b!204806))

(assert (= (and b!204806 (not res!98800)) b!204802))

(assert (= (and b!204802 (not res!98795)) b!204803))

(assert (= (and b!204809 condMapEmpty!8711) mapIsEmpty!8711))

(assert (= (and b!204809 (not condMapEmpty!8711)) mapNonEmpty!8711))

(get-info :version)

(assert (= (and mapNonEmpty!8711 ((_ is ValueCellFull!2204) mapValue!8711)) b!204812))

(assert (= (and b!204809 ((_ is ValueCellFull!2204) mapDefault!8711)) b!204805))

(assert (= start!20584 b!204809))

(declare-fun m!231903 () Bool)

(assert (=> b!204806 m!231903))

(declare-fun m!231905 () Bool)

(assert (=> b!204806 m!231905))

(declare-fun m!231907 () Bool)

(assert (=> b!204806 m!231907))

(declare-fun m!231909 () Bool)

(assert (=> b!204806 m!231909))

(declare-fun m!231911 () Bool)

(assert (=> b!204806 m!231911))

(declare-fun m!231913 () Bool)

(assert (=> b!204806 m!231913))

(declare-fun m!231915 () Bool)

(assert (=> b!204806 m!231915))

(declare-fun m!231917 () Bool)

(assert (=> b!204803 m!231917))

(declare-fun m!231919 () Bool)

(assert (=> b!204803 m!231919))

(declare-fun m!231921 () Bool)

(assert (=> b!204804 m!231921))

(declare-fun m!231923 () Bool)

(assert (=> b!204801 m!231923))

(declare-fun m!231925 () Bool)

(assert (=> b!204811 m!231925))

(declare-fun m!231927 () Bool)

(assert (=> mapNonEmpty!8711 m!231927))

(declare-fun m!231929 () Bool)

(assert (=> start!20584 m!231929))

(declare-fun m!231931 () Bool)

(assert (=> start!20584 m!231931))

(declare-fun m!231933 () Bool)

(assert (=> start!20584 m!231933))

(declare-fun m!231935 () Bool)

(assert (=> b!204808 m!231935))

(declare-fun m!231937 () Bool)

(assert (=> b!204802 m!231937))

(declare-fun m!231939 () Bool)

(assert (=> b!204802 m!231939))

(declare-fun m!231941 () Bool)

(assert (=> b!204802 m!231941))

(check-sat (not b!204808) (not mapNonEmpty!8711) (not b!204803) (not b!204801) tp_is_empty!5095 (not b_next!5239) (not start!20584) b_and!11959 (not b!204806) (not b!204811) (not b!204802))
(check-sat b_and!11959 (not b_next!5239))
