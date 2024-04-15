; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20368 () Bool)

(assert start!20368)

(declare-fun b_free!5023 () Bool)

(declare-fun b_next!5023 () Bool)

(assert (=> start!20368 (= b_free!5023 (not b_next!5023))))

(declare-fun tp!18101 () Bool)

(declare-fun b_and!11743 () Bool)

(assert (=> start!20368 (= tp!18101 b_and!11743)))

(declare-fun b!200895 () Bool)

(declare-fun res!95862 () Bool)

(declare-fun e!131688 () Bool)

(assert (=> b!200895 (=> (not res!95862) (not e!131688))))

(declare-datatypes ((array!8975 0))(
  ( (array!8976 (arr!4237 (Array (_ BitVec 32) (_ BitVec 64))) (size!4563 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8975)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8975 (_ BitVec 32)) Bool)

(assert (=> b!200895 (= res!95862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!200896 () Bool)

(declare-fun res!95859 () Bool)

(assert (=> b!200896 (=> (not res!95859) (not e!131688))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6153 0))(
  ( (V!6154 (val!2484 Int)) )
))
(declare-datatypes ((ValueCell!2096 0))(
  ( (ValueCellFull!2096 (v!4448 V!6153)) (EmptyCell!2096) )
))
(declare-datatypes ((array!8977 0))(
  ( (array!8978 (arr!4238 (Array (_ BitVec 32) ValueCell!2096)) (size!4564 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8977)

(assert (=> b!200896 (= res!95859 (and (= (size!4564 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4563 _keys!825) (size!4564 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!95863 () Bool)

(assert (=> start!20368 (=> (not res!95863) (not e!131688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20368 (= res!95863 (validMask!0 mask!1149))))

(assert (=> start!20368 e!131688))

(declare-fun e!131694 () Bool)

(declare-fun array_inv!2767 (array!8977) Bool)

(assert (=> start!20368 (and (array_inv!2767 _values!649) e!131694)))

(assert (=> start!20368 true))

(declare-fun tp_is_empty!4879 () Bool)

(assert (=> start!20368 tp_is_empty!4879))

(declare-fun array_inv!2768 (array!8975) Bool)

(assert (=> start!20368 (array_inv!2768 _keys!825)))

(assert (=> start!20368 tp!18101))

(declare-fun mapNonEmpty!8387 () Bool)

(declare-fun mapRes!8387 () Bool)

(declare-fun tp!18100 () Bool)

(declare-fun e!131692 () Bool)

(assert (=> mapNonEmpty!8387 (= mapRes!8387 (and tp!18100 e!131692))))

(declare-fun mapValue!8387 () ValueCell!2096)

(declare-fun mapRest!8387 () (Array (_ BitVec 32) ValueCell!2096))

(declare-fun mapKey!8387 () (_ BitVec 32))

(assert (=> mapNonEmpty!8387 (= (arr!4238 _values!649) (store mapRest!8387 mapKey!8387 mapValue!8387))))

(declare-fun b!200897 () Bool)

(declare-fun res!95864 () Bool)

(assert (=> b!200897 (=> (not res!95864) (not e!131688))))

(declare-datatypes ((List!2656 0))(
  ( (Nil!2653) (Cons!2652 (h!3294 (_ BitVec 64)) (t!7578 List!2656)) )
))
(declare-fun arrayNoDuplicates!0 (array!8975 (_ BitVec 32) List!2656) Bool)

(assert (=> b!200897 (= res!95864 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2653))))

(declare-fun b!200898 () Bool)

(declare-fun e!131691 () Bool)

(assert (=> b!200898 (= e!131688 (not e!131691))))

(declare-fun res!95861 () Bool)

(assert (=> b!200898 (=> res!95861 e!131691)))

(assert (=> b!200898 (= res!95861 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3734 0))(
  ( (tuple2!3735 (_1!1878 (_ BitVec 64)) (_2!1878 V!6153)) )
))
(declare-datatypes ((List!2657 0))(
  ( (Nil!2654) (Cons!2653 (h!3295 tuple2!3734) (t!7579 List!2657)) )
))
(declare-datatypes ((ListLongMap!2637 0))(
  ( (ListLongMap!2638 (toList!1334 List!2657)) )
))
(declare-fun lt!99665 () ListLongMap!2637)

(declare-fun zeroValue!615 () V!6153)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6153)

(declare-fun getCurrentListMap!899 (array!8975 array!8977 (_ BitVec 32) (_ BitVec 32) V!6153 V!6153 (_ BitVec 32) Int) ListLongMap!2637)

(assert (=> b!200898 (= lt!99665 (getCurrentListMap!899 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99664 () array!8977)

(declare-fun lt!99660 () ListLongMap!2637)

(assert (=> b!200898 (= lt!99660 (getCurrentListMap!899 _keys!825 lt!99664 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99666 () ListLongMap!2637)

(declare-fun lt!99668 () ListLongMap!2637)

(assert (=> b!200898 (and (= lt!99666 lt!99668) (= lt!99668 lt!99666))))

(declare-fun lt!99667 () ListLongMap!2637)

(declare-fun lt!99661 () tuple2!3734)

(declare-fun +!383 (ListLongMap!2637 tuple2!3734) ListLongMap!2637)

(assert (=> b!200898 (= lt!99668 (+!383 lt!99667 lt!99661))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6153)

(assert (=> b!200898 (= lt!99661 (tuple2!3735 k0!843 v!520))))

(declare-datatypes ((Unit!6018 0))(
  ( (Unit!6019) )
))
(declare-fun lt!99663 () Unit!6018)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!58 (array!8975 array!8977 (_ BitVec 32) (_ BitVec 32) V!6153 V!6153 (_ BitVec 32) (_ BitVec 64) V!6153 (_ BitVec 32) Int) Unit!6018)

(assert (=> b!200898 (= lt!99663 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!58 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!309 (array!8975 array!8977 (_ BitVec 32) (_ BitVec 32) V!6153 V!6153 (_ BitVec 32) Int) ListLongMap!2637)

(assert (=> b!200898 (= lt!99666 (getCurrentListMapNoExtraKeys!309 _keys!825 lt!99664 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200898 (= lt!99664 (array!8978 (store (arr!4238 _values!649) i!601 (ValueCellFull!2096 v!520)) (size!4564 _values!649)))))

(assert (=> b!200898 (= lt!99667 (getCurrentListMapNoExtraKeys!309 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!200899 () Bool)

(assert (=> b!200899 (= e!131692 tp_is_empty!4879)))

(declare-fun mapIsEmpty!8387 () Bool)

(assert (=> mapIsEmpty!8387 mapRes!8387))

(declare-fun b!200900 () Bool)

(declare-fun e!131689 () Bool)

(assert (=> b!200900 (= e!131691 e!131689)))

(declare-fun res!95866 () Bool)

(assert (=> b!200900 (=> res!95866 e!131689)))

(assert (=> b!200900 (= res!95866 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!99674 () ListLongMap!2637)

(declare-fun lt!99673 () ListLongMap!2637)

(assert (=> b!200900 (= lt!99674 lt!99673)))

(declare-fun lt!99659 () ListLongMap!2637)

(assert (=> b!200900 (= lt!99673 (+!383 lt!99659 lt!99661))))

(declare-fun lt!99662 () Unit!6018)

(declare-fun addCommutativeForDiffKeys!92 (ListLongMap!2637 (_ BitVec 64) V!6153 (_ BitVec 64) V!6153) Unit!6018)

(assert (=> b!200900 (= lt!99662 (addCommutativeForDiffKeys!92 lt!99667 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99671 () tuple2!3734)

(assert (=> b!200900 (= lt!99660 (+!383 lt!99674 lt!99671))))

(declare-fun lt!99672 () tuple2!3734)

(assert (=> b!200900 (= lt!99674 (+!383 lt!99668 lt!99672))))

(declare-fun lt!99669 () ListLongMap!2637)

(assert (=> b!200900 (= lt!99665 lt!99669)))

(assert (=> b!200900 (= lt!99669 (+!383 lt!99659 lt!99671))))

(assert (=> b!200900 (= lt!99659 (+!383 lt!99667 lt!99672))))

(assert (=> b!200900 (= lt!99660 (+!383 (+!383 lt!99666 lt!99672) lt!99671))))

(assert (=> b!200900 (= lt!99671 (tuple2!3735 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!200900 (= lt!99672 (tuple2!3735 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!200901 () Bool)

(declare-fun res!95867 () Bool)

(assert (=> b!200901 (=> (not res!95867) (not e!131688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200901 (= res!95867 (validKeyInArray!0 k0!843))))

(declare-fun b!200902 () Bool)

(declare-fun res!95865 () Bool)

(assert (=> b!200902 (=> (not res!95865) (not e!131688))))

(assert (=> b!200902 (= res!95865 (= (select (arr!4237 _keys!825) i!601) k0!843))))

(declare-fun b!200903 () Bool)

(declare-fun e!131693 () Bool)

(assert (=> b!200903 (= e!131693 tp_is_empty!4879)))

(declare-fun b!200904 () Bool)

(assert (=> b!200904 (= e!131694 (and e!131693 mapRes!8387))))

(declare-fun condMapEmpty!8387 () Bool)

(declare-fun mapDefault!8387 () ValueCell!2096)

(assert (=> b!200904 (= condMapEmpty!8387 (= (arr!4238 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2096)) mapDefault!8387)))))

(declare-fun b!200905 () Bool)

(assert (=> b!200905 (= e!131689 true)))

(assert (=> b!200905 (= (+!383 lt!99673 lt!99671) (+!383 lt!99669 lt!99661))))

(declare-fun lt!99670 () Unit!6018)

(assert (=> b!200905 (= lt!99670 (addCommutativeForDiffKeys!92 lt!99659 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!200906 () Bool)

(declare-fun res!95860 () Bool)

(assert (=> b!200906 (=> (not res!95860) (not e!131688))))

(assert (=> b!200906 (= res!95860 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4563 _keys!825))))))

(assert (= (and start!20368 res!95863) b!200896))

(assert (= (and b!200896 res!95859) b!200895))

(assert (= (and b!200895 res!95862) b!200897))

(assert (= (and b!200897 res!95864) b!200906))

(assert (= (and b!200906 res!95860) b!200901))

(assert (= (and b!200901 res!95867) b!200902))

(assert (= (and b!200902 res!95865) b!200898))

(assert (= (and b!200898 (not res!95861)) b!200900))

(assert (= (and b!200900 (not res!95866)) b!200905))

(assert (= (and b!200904 condMapEmpty!8387) mapIsEmpty!8387))

(assert (= (and b!200904 (not condMapEmpty!8387)) mapNonEmpty!8387))

(get-info :version)

(assert (= (and mapNonEmpty!8387 ((_ is ValueCellFull!2096) mapValue!8387)) b!200899))

(assert (= (and b!200904 ((_ is ValueCellFull!2096) mapDefault!8387)) b!200903))

(assert (= start!20368 b!200904))

(declare-fun m!227175 () Bool)

(assert (=> mapNonEmpty!8387 m!227175))

(declare-fun m!227177 () Bool)

(assert (=> b!200898 m!227177))

(declare-fun m!227179 () Bool)

(assert (=> b!200898 m!227179))

(declare-fun m!227181 () Bool)

(assert (=> b!200898 m!227181))

(declare-fun m!227183 () Bool)

(assert (=> b!200898 m!227183))

(declare-fun m!227185 () Bool)

(assert (=> b!200898 m!227185))

(declare-fun m!227187 () Bool)

(assert (=> b!200898 m!227187))

(declare-fun m!227189 () Bool)

(assert (=> b!200898 m!227189))

(declare-fun m!227191 () Bool)

(assert (=> b!200905 m!227191))

(declare-fun m!227193 () Bool)

(assert (=> b!200905 m!227193))

(declare-fun m!227195 () Bool)

(assert (=> b!200905 m!227195))

(declare-fun m!227197 () Bool)

(assert (=> b!200901 m!227197))

(declare-fun m!227199 () Bool)

(assert (=> b!200895 m!227199))

(declare-fun m!227201 () Bool)

(assert (=> b!200900 m!227201))

(declare-fun m!227203 () Bool)

(assert (=> b!200900 m!227203))

(declare-fun m!227205 () Bool)

(assert (=> b!200900 m!227205))

(declare-fun m!227207 () Bool)

(assert (=> b!200900 m!227207))

(declare-fun m!227209 () Bool)

(assert (=> b!200900 m!227209))

(declare-fun m!227211 () Bool)

(assert (=> b!200900 m!227211))

(declare-fun m!227213 () Bool)

(assert (=> b!200900 m!227213))

(declare-fun m!227215 () Bool)

(assert (=> b!200900 m!227215))

(assert (=> b!200900 m!227207))

(declare-fun m!227217 () Bool)

(assert (=> b!200902 m!227217))

(declare-fun m!227219 () Bool)

(assert (=> b!200897 m!227219))

(declare-fun m!227221 () Bool)

(assert (=> start!20368 m!227221))

(declare-fun m!227223 () Bool)

(assert (=> start!20368 m!227223))

(declare-fun m!227225 () Bool)

(assert (=> start!20368 m!227225))

(check-sat (not start!20368) (not b!200897) (not b!200901) (not mapNonEmpty!8387) (not b!200905) (not b!200900) b_and!11743 (not b!200898) (not b!200895) tp_is_empty!4879 (not b_next!5023))
(check-sat b_and!11743 (not b_next!5023))
