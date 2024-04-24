; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20984 () Bool)

(assert start!20984)

(declare-fun b_free!5551 () Bool)

(declare-fun b_next!5551 () Bool)

(assert (=> start!20984 (= b_free!5551 (not b_next!5551))))

(declare-fun tp!19705 () Bool)

(declare-fun b_and!12359 () Bool)

(assert (=> start!20984 (= tp!19705 b_and!12359)))

(declare-fun b!210827 () Bool)

(declare-fun res!102885 () Bool)

(declare-fun e!137269 () Bool)

(assert (=> b!210827 (=> (not res!102885) (not e!137269))))

(declare-datatypes ((array!10021 0))(
  ( (array!10022 (arr!4757 (Array (_ BitVec 32) (_ BitVec 64))) (size!5082 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10021)

(declare-datatypes ((List!2987 0))(
  ( (Nil!2984) (Cons!2983 (h!3625 (_ BitVec 64)) (t!7918 List!2987)) )
))
(declare-fun arrayNoDuplicates!0 (array!10021 (_ BitVec 32) List!2987) Bool)

(assert (=> b!210827 (= res!102885 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2984))))

(declare-fun b!210828 () Bool)

(declare-fun res!102881 () Bool)

(assert (=> b!210828 (=> (not res!102881) (not e!137269))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210828 (= res!102881 (validKeyInArray!0 k0!843))))

(declare-fun b!210829 () Bool)

(declare-fun e!137264 () Bool)

(declare-fun e!137267 () Bool)

(declare-fun mapRes!9200 () Bool)

(assert (=> b!210829 (= e!137264 (and e!137267 mapRes!9200))))

(declare-fun condMapEmpty!9200 () Bool)

(declare-datatypes ((V!6865 0))(
  ( (V!6866 (val!2751 Int)) )
))
(declare-datatypes ((ValueCell!2363 0))(
  ( (ValueCellFull!2363 (v!4738 V!6865)) (EmptyCell!2363) )
))
(declare-datatypes ((array!10023 0))(
  ( (array!10024 (arr!4758 (Array (_ BitVec 32) ValueCell!2363)) (size!5083 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10023)

(declare-fun mapDefault!9200 () ValueCell!2363)

(assert (=> b!210829 (= condMapEmpty!9200 (= (arr!4758 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2363)) mapDefault!9200)))))

(declare-fun b!210830 () Bool)

(declare-fun res!102886 () Bool)

(assert (=> b!210830 (=> (not res!102886) (not e!137269))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!210830 (= res!102886 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5082 _keys!825))))))

(declare-fun b!210831 () Bool)

(declare-fun res!102883 () Bool)

(assert (=> b!210831 (=> (not res!102883) (not e!137269))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10021 (_ BitVec 32)) Bool)

(assert (=> b!210831 (= res!102883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210832 () Bool)

(declare-fun e!137265 () Bool)

(declare-fun e!137268 () Bool)

(assert (=> b!210832 (= e!137265 e!137268)))

(declare-fun res!102878 () Bool)

(assert (=> b!210832 (=> res!102878 e!137268)))

(assert (=> b!210832 (= res!102878 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!4102 0))(
  ( (tuple2!4103 (_1!2062 (_ BitVec 64)) (_2!2062 V!6865)) )
))
(declare-datatypes ((List!2988 0))(
  ( (Nil!2985) (Cons!2984 (h!3626 tuple2!4102) (t!7919 List!2988)) )
))
(declare-datatypes ((ListLongMap!3017 0))(
  ( (ListLongMap!3018 (toList!1524 List!2988)) )
))
(declare-fun lt!108191 () ListLongMap!3017)

(declare-fun lt!108185 () ListLongMap!3017)

(assert (=> b!210832 (= lt!108191 lt!108185)))

(declare-fun lt!108192 () ListLongMap!3017)

(declare-fun lt!108186 () tuple2!4102)

(declare-fun +!553 (ListLongMap!3017 tuple2!4102) ListLongMap!3017)

(assert (=> b!210832 (= lt!108185 (+!553 lt!108192 lt!108186))))

(declare-datatypes ((Unit!6388 0))(
  ( (Unit!6389) )
))
(declare-fun lt!108183 () Unit!6388)

(declare-fun lt!108180 () ListLongMap!3017)

(declare-fun v!520 () V!6865)

(declare-fun zeroValue!615 () V!6865)

(declare-fun addCommutativeForDiffKeys!203 (ListLongMap!3017 (_ BitVec 64) V!6865 (_ BitVec 64) V!6865) Unit!6388)

(assert (=> b!210832 (= lt!108183 (addCommutativeForDiffKeys!203 lt!108180 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!108187 () ListLongMap!3017)

(declare-fun lt!108182 () tuple2!4102)

(assert (=> b!210832 (= lt!108187 (+!553 lt!108191 lt!108182))))

(declare-fun lt!108179 () ListLongMap!3017)

(declare-fun lt!108188 () tuple2!4102)

(assert (=> b!210832 (= lt!108191 (+!553 lt!108179 lt!108188))))

(declare-fun lt!108184 () ListLongMap!3017)

(declare-fun lt!108193 () ListLongMap!3017)

(assert (=> b!210832 (= lt!108184 lt!108193)))

(assert (=> b!210832 (= lt!108193 (+!553 lt!108192 lt!108182))))

(assert (=> b!210832 (= lt!108192 (+!553 lt!108180 lt!108188))))

(declare-fun lt!108181 () ListLongMap!3017)

(assert (=> b!210832 (= lt!108187 (+!553 (+!553 lt!108181 lt!108188) lt!108182))))

(declare-fun minValue!615 () V!6865)

(assert (=> b!210832 (= lt!108182 (tuple2!4103 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210832 (= lt!108188 (tuple2!4103 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210833 () Bool)

(declare-fun tp_is_empty!5413 () Bool)

(assert (=> b!210833 (= e!137267 tp_is_empty!5413)))

(declare-fun b!210834 () Bool)

(declare-fun res!102880 () Bool)

(assert (=> b!210834 (=> (not res!102880) (not e!137269))))

(assert (=> b!210834 (= res!102880 (= (select (arr!4757 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9200 () Bool)

(assert (=> mapIsEmpty!9200 mapRes!9200))

(declare-fun b!210835 () Bool)

(assert (=> b!210835 (= e!137269 (not e!137265))))

(declare-fun res!102879 () Bool)

(assert (=> b!210835 (=> res!102879 e!137265)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!210835 (= res!102879 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1063 (array!10021 array!10023 (_ BitVec 32) (_ BitVec 32) V!6865 V!6865 (_ BitVec 32) Int) ListLongMap!3017)

(assert (=> b!210835 (= lt!108184 (getCurrentListMap!1063 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108194 () array!10023)

(assert (=> b!210835 (= lt!108187 (getCurrentListMap!1063 _keys!825 lt!108194 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210835 (and (= lt!108181 lt!108179) (= lt!108179 lt!108181))))

(assert (=> b!210835 (= lt!108179 (+!553 lt!108180 lt!108186))))

(assert (=> b!210835 (= lt!108186 (tuple2!4103 k0!843 v!520))))

(declare-fun lt!108189 () Unit!6388)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!204 (array!10021 array!10023 (_ BitVec 32) (_ BitVec 32) V!6865 V!6865 (_ BitVec 32) (_ BitVec 64) V!6865 (_ BitVec 32) Int) Unit!6388)

(assert (=> b!210835 (= lt!108189 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!204 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!486 (array!10021 array!10023 (_ BitVec 32) (_ BitVec 32) V!6865 V!6865 (_ BitVec 32) Int) ListLongMap!3017)

(assert (=> b!210835 (= lt!108181 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!108194 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210835 (= lt!108194 (array!10024 (store (arr!4758 _values!649) i!601 (ValueCellFull!2363 v!520)) (size!5083 _values!649)))))

(assert (=> b!210835 (= lt!108180 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210836 () Bool)

(declare-fun e!137270 () Bool)

(assert (=> b!210836 (= e!137270 tp_is_empty!5413)))

(declare-fun b!210837 () Bool)

(assert (=> b!210837 (= e!137268 (bvslt i!601 (size!5083 _values!649)))))

(assert (=> b!210837 (= (+!553 lt!108185 lt!108182) (+!553 lt!108193 lt!108186))))

(declare-fun lt!108190 () Unit!6388)

(assert (=> b!210837 (= lt!108190 (addCommutativeForDiffKeys!203 lt!108192 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!102882 () Bool)

(assert (=> start!20984 (=> (not res!102882) (not e!137269))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20984 (= res!102882 (validMask!0 mask!1149))))

(assert (=> start!20984 e!137269))

(declare-fun array_inv!3119 (array!10023) Bool)

(assert (=> start!20984 (and (array_inv!3119 _values!649) e!137264)))

(assert (=> start!20984 true))

(assert (=> start!20984 tp_is_empty!5413))

(declare-fun array_inv!3120 (array!10021) Bool)

(assert (=> start!20984 (array_inv!3120 _keys!825)))

(assert (=> start!20984 tp!19705))

(declare-fun b!210838 () Bool)

(declare-fun res!102884 () Bool)

(assert (=> b!210838 (=> (not res!102884) (not e!137269))))

(assert (=> b!210838 (= res!102884 (and (= (size!5083 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5082 _keys!825) (size!5083 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9200 () Bool)

(declare-fun tp!19706 () Bool)

(assert (=> mapNonEmpty!9200 (= mapRes!9200 (and tp!19706 e!137270))))

(declare-fun mapKey!9200 () (_ BitVec 32))

(declare-fun mapValue!9200 () ValueCell!2363)

(declare-fun mapRest!9200 () (Array (_ BitVec 32) ValueCell!2363))

(assert (=> mapNonEmpty!9200 (= (arr!4758 _values!649) (store mapRest!9200 mapKey!9200 mapValue!9200))))

(assert (= (and start!20984 res!102882) b!210838))

(assert (= (and b!210838 res!102884) b!210831))

(assert (= (and b!210831 res!102883) b!210827))

(assert (= (and b!210827 res!102885) b!210830))

(assert (= (and b!210830 res!102886) b!210828))

(assert (= (and b!210828 res!102881) b!210834))

(assert (= (and b!210834 res!102880) b!210835))

(assert (= (and b!210835 (not res!102879)) b!210832))

(assert (= (and b!210832 (not res!102878)) b!210837))

(assert (= (and b!210829 condMapEmpty!9200) mapIsEmpty!9200))

(assert (= (and b!210829 (not condMapEmpty!9200)) mapNonEmpty!9200))

(get-info :version)

(assert (= (and mapNonEmpty!9200 ((_ is ValueCellFull!2363) mapValue!9200)) b!210836))

(assert (= (and b!210829 ((_ is ValueCellFull!2363) mapDefault!9200)) b!210833))

(assert (= start!20984 b!210829))

(declare-fun m!238595 () Bool)

(assert (=> b!210837 m!238595))

(declare-fun m!238597 () Bool)

(assert (=> b!210837 m!238597))

(declare-fun m!238599 () Bool)

(assert (=> b!210837 m!238599))

(declare-fun m!238601 () Bool)

(assert (=> b!210831 m!238601))

(declare-fun m!238603 () Bool)

(assert (=> b!210832 m!238603))

(declare-fun m!238605 () Bool)

(assert (=> b!210832 m!238605))

(declare-fun m!238607 () Bool)

(assert (=> b!210832 m!238607))

(declare-fun m!238609 () Bool)

(assert (=> b!210832 m!238609))

(assert (=> b!210832 m!238609))

(declare-fun m!238611 () Bool)

(assert (=> b!210832 m!238611))

(declare-fun m!238613 () Bool)

(assert (=> b!210832 m!238613))

(declare-fun m!238615 () Bool)

(assert (=> b!210832 m!238615))

(declare-fun m!238617 () Bool)

(assert (=> b!210832 m!238617))

(declare-fun m!238619 () Bool)

(assert (=> b!210827 m!238619))

(declare-fun m!238621 () Bool)

(assert (=> mapNonEmpty!9200 m!238621))

(declare-fun m!238623 () Bool)

(assert (=> b!210828 m!238623))

(declare-fun m!238625 () Bool)

(assert (=> start!20984 m!238625))

(declare-fun m!238627 () Bool)

(assert (=> start!20984 m!238627))

(declare-fun m!238629 () Bool)

(assert (=> start!20984 m!238629))

(declare-fun m!238631 () Bool)

(assert (=> b!210834 m!238631))

(declare-fun m!238633 () Bool)

(assert (=> b!210835 m!238633))

(declare-fun m!238635 () Bool)

(assert (=> b!210835 m!238635))

(declare-fun m!238637 () Bool)

(assert (=> b!210835 m!238637))

(declare-fun m!238639 () Bool)

(assert (=> b!210835 m!238639))

(declare-fun m!238641 () Bool)

(assert (=> b!210835 m!238641))

(declare-fun m!238643 () Bool)

(assert (=> b!210835 m!238643))

(declare-fun m!238645 () Bool)

(assert (=> b!210835 m!238645))

(check-sat (not mapNonEmpty!9200) (not b!210831) (not b!210835) b_and!12359 tp_is_empty!5413 (not b!210828) (not b_next!5551) (not b!210827) (not start!20984) (not b!210837) (not b!210832))
(check-sat b_and!12359 (not b_next!5551))
