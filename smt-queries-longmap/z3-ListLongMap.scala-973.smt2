; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21080 () Bool)

(assert start!21080)

(declare-fun b_free!5587 () Bool)

(declare-fun b_next!5587 () Bool)

(assert (=> start!21080 (= b_free!5587 (not b_next!5587))))

(declare-fun tp!19822 () Bool)

(declare-fun b_and!12431 () Bool)

(assert (=> start!21080 (= tp!19822 b_and!12431)))

(declare-fun res!103597 () Bool)

(declare-fun e!137984 () Bool)

(assert (=> start!21080 (=> (not res!103597) (not e!137984))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21080 (= res!103597 (validMask!0 mask!1149))))

(assert (=> start!21080 e!137984))

(declare-datatypes ((V!6913 0))(
  ( (V!6914 (val!2769 Int)) )
))
(declare-datatypes ((ValueCell!2381 0))(
  ( (ValueCellFull!2381 (v!4768 V!6913)) (EmptyCell!2381) )
))
(declare-datatypes ((array!10099 0))(
  ( (array!10100 (arr!4793 (Array (_ BitVec 32) ValueCell!2381)) (size!5118 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10099)

(declare-fun e!137978 () Bool)

(declare-fun array_inv!3151 (array!10099) Bool)

(assert (=> start!21080 (and (array_inv!3151 _values!649) e!137978)))

(assert (=> start!21080 true))

(declare-fun tp_is_empty!5449 () Bool)

(assert (=> start!21080 tp_is_empty!5449))

(declare-datatypes ((array!10101 0))(
  ( (array!10102 (arr!4794 (Array (_ BitVec 32) (_ BitVec 64))) (size!5119 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10101)

(declare-fun array_inv!3152 (array!10101) Bool)

(assert (=> start!21080 (array_inv!3152 _keys!825)))

(assert (=> start!21080 tp!19822))

(declare-fun b!212030 () Bool)

(declare-fun res!103599 () Bool)

(assert (=> b!212030 (=> (not res!103599) (not e!137984))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212030 (= res!103599 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5119 _keys!825))))))

(declare-fun mapNonEmpty!9263 () Bool)

(declare-fun mapRes!9263 () Bool)

(declare-fun tp!19823 () Bool)

(declare-fun e!137980 () Bool)

(assert (=> mapNonEmpty!9263 (= mapRes!9263 (and tp!19823 e!137980))))

(declare-fun mapValue!9263 () ValueCell!2381)

(declare-fun mapKey!9263 () (_ BitVec 32))

(declare-fun mapRest!9263 () (Array (_ BitVec 32) ValueCell!2381))

(assert (=> mapNonEmpty!9263 (= (arr!4793 _values!649) (store mapRest!9263 mapKey!9263 mapValue!9263))))

(declare-fun b!212031 () Bool)

(declare-fun e!137983 () Bool)

(assert (=> b!212031 (= e!137983 tp_is_empty!5449)))

(declare-fun b!212032 () Bool)

(declare-fun e!137981 () Bool)

(assert (=> b!212032 (= e!137984 (not e!137981))))

(declare-fun res!103596 () Bool)

(assert (=> b!212032 (=> res!103596 e!137981)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212032 (= res!103596 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!4134 0))(
  ( (tuple2!4135 (_1!2078 (_ BitVec 64)) (_2!2078 V!6913)) )
))
(declare-datatypes ((List!3018 0))(
  ( (Nil!3015) (Cons!3014 (h!3656 tuple2!4134) (t!7955 List!3018)) )
))
(declare-datatypes ((ListLongMap!3049 0))(
  ( (ListLongMap!3050 (toList!1540 List!3018)) )
))
(declare-fun lt!109189 () ListLongMap!3049)

(declare-fun zeroValue!615 () V!6913)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6913)

(declare-fun getCurrentListMap!1076 (array!10101 array!10099 (_ BitVec 32) (_ BitVec 32) V!6913 V!6913 (_ BitVec 32) Int) ListLongMap!3049)

(assert (=> b!212032 (= lt!109189 (getCurrentListMap!1076 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109192 () ListLongMap!3049)

(declare-fun lt!109186 () array!10099)

(assert (=> b!212032 (= lt!109192 (getCurrentListMap!1076 _keys!825 lt!109186 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109183 () ListLongMap!3049)

(declare-fun lt!109185 () ListLongMap!3049)

(assert (=> b!212032 (and (= lt!109183 lt!109185) (= lt!109185 lt!109183))))

(declare-fun lt!109182 () ListLongMap!3049)

(declare-fun lt!109184 () tuple2!4134)

(declare-fun +!569 (ListLongMap!3049 tuple2!4134) ListLongMap!3049)

(assert (=> b!212032 (= lt!109185 (+!569 lt!109182 lt!109184))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6913)

(assert (=> b!212032 (= lt!109184 (tuple2!4135 k0!843 v!520))))

(declare-datatypes ((Unit!6424 0))(
  ( (Unit!6425) )
))
(declare-fun lt!109193 () Unit!6424)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!217 (array!10101 array!10099 (_ BitVec 32) (_ BitVec 32) V!6913 V!6913 (_ BitVec 32) (_ BitVec 64) V!6913 (_ BitVec 32) Int) Unit!6424)

(assert (=> b!212032 (= lt!109193 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!217 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!499 (array!10101 array!10099 (_ BitVec 32) (_ BitVec 32) V!6913 V!6913 (_ BitVec 32) Int) ListLongMap!3049)

(assert (=> b!212032 (= lt!109183 (getCurrentListMapNoExtraKeys!499 _keys!825 lt!109186 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212032 (= lt!109186 (array!10100 (store (arr!4793 _values!649) i!601 (ValueCellFull!2381 v!520)) (size!5118 _values!649)))))

(assert (=> b!212032 (= lt!109182 (getCurrentListMapNoExtraKeys!499 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!212033 () Bool)

(declare-fun res!103598 () Bool)

(assert (=> b!212033 (=> (not res!103598) (not e!137984))))

(assert (=> b!212033 (= res!103598 (= (select (arr!4794 _keys!825) i!601) k0!843))))

(declare-fun b!212034 () Bool)

(declare-fun res!103600 () Bool)

(assert (=> b!212034 (=> (not res!103600) (not e!137984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212034 (= res!103600 (validKeyInArray!0 k0!843))))

(declare-fun b!212035 () Bool)

(assert (=> b!212035 (= e!137978 (and e!137983 mapRes!9263))))

(declare-fun condMapEmpty!9263 () Bool)

(declare-fun mapDefault!9263 () ValueCell!2381)

(assert (=> b!212035 (= condMapEmpty!9263 (= (arr!4793 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2381)) mapDefault!9263)))))

(declare-fun b!212036 () Bool)

(declare-fun e!137982 () Bool)

(assert (=> b!212036 (= e!137982 (bvslt i!601 (size!5118 _values!649)))))

(declare-fun lt!109188 () ListLongMap!3049)

(declare-fun lt!109191 () ListLongMap!3049)

(assert (=> b!212036 (= lt!109188 (+!569 lt!109191 lt!109184))))

(declare-fun lt!109190 () Unit!6424)

(declare-fun addCommutativeForDiffKeys!208 (ListLongMap!3049 (_ BitVec 64) V!6913 (_ BitVec 64) V!6913) Unit!6424)

(assert (=> b!212036 (= lt!109190 (addCommutativeForDiffKeys!208 lt!109182 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!9263 () Bool)

(assert (=> mapIsEmpty!9263 mapRes!9263))

(declare-fun b!212037 () Bool)

(assert (=> b!212037 (= e!137981 e!137982)))

(declare-fun res!103595 () Bool)

(assert (=> b!212037 (=> res!103595 e!137982)))

(assert (=> b!212037 (= res!103595 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!212037 (= lt!109192 lt!109188)))

(declare-fun lt!109187 () tuple2!4134)

(assert (=> b!212037 (= lt!109188 (+!569 lt!109185 lt!109187))))

(assert (=> b!212037 (= lt!109189 lt!109191)))

(assert (=> b!212037 (= lt!109191 (+!569 lt!109182 lt!109187))))

(assert (=> b!212037 (= lt!109192 (+!569 lt!109183 lt!109187))))

(assert (=> b!212037 (= lt!109187 (tuple2!4135 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!212038 () Bool)

(declare-fun res!103602 () Bool)

(assert (=> b!212038 (=> (not res!103602) (not e!137984))))

(declare-datatypes ((List!3019 0))(
  ( (Nil!3016) (Cons!3015 (h!3657 (_ BitVec 64)) (t!7956 List!3019)) )
))
(declare-fun arrayNoDuplicates!0 (array!10101 (_ BitVec 32) List!3019) Bool)

(assert (=> b!212038 (= res!103602 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3016))))

(declare-fun b!212039 () Bool)

(declare-fun res!103603 () Bool)

(assert (=> b!212039 (=> (not res!103603) (not e!137984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10101 (_ BitVec 32)) Bool)

(assert (=> b!212039 (= res!103603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212040 () Bool)

(declare-fun res!103601 () Bool)

(assert (=> b!212040 (=> (not res!103601) (not e!137984))))

(assert (=> b!212040 (= res!103601 (and (= (size!5118 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5119 _keys!825) (size!5118 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212041 () Bool)

(assert (=> b!212041 (= e!137980 tp_is_empty!5449)))

(assert (= (and start!21080 res!103597) b!212040))

(assert (= (and b!212040 res!103601) b!212039))

(assert (= (and b!212039 res!103603) b!212038))

(assert (= (and b!212038 res!103602) b!212030))

(assert (= (and b!212030 res!103599) b!212034))

(assert (= (and b!212034 res!103600) b!212033))

(assert (= (and b!212033 res!103598) b!212032))

(assert (= (and b!212032 (not res!103596)) b!212037))

(assert (= (and b!212037 (not res!103595)) b!212036))

(assert (= (and b!212035 condMapEmpty!9263) mapIsEmpty!9263))

(assert (= (and b!212035 (not condMapEmpty!9263)) mapNonEmpty!9263))

(get-info :version)

(assert (= (and mapNonEmpty!9263 ((_ is ValueCellFull!2381) mapValue!9263)) b!212041))

(assert (= (and b!212035 ((_ is ValueCellFull!2381) mapDefault!9263)) b!212031))

(assert (= start!21080 b!212035))

(declare-fun m!239933 () Bool)

(assert (=> b!212034 m!239933))

(declare-fun m!239935 () Bool)

(assert (=> b!212032 m!239935))

(declare-fun m!239937 () Bool)

(assert (=> b!212032 m!239937))

(declare-fun m!239939 () Bool)

(assert (=> b!212032 m!239939))

(declare-fun m!239941 () Bool)

(assert (=> b!212032 m!239941))

(declare-fun m!239943 () Bool)

(assert (=> b!212032 m!239943))

(declare-fun m!239945 () Bool)

(assert (=> b!212032 m!239945))

(declare-fun m!239947 () Bool)

(assert (=> b!212032 m!239947))

(declare-fun m!239949 () Bool)

(assert (=> b!212033 m!239949))

(declare-fun m!239951 () Bool)

(assert (=> b!212036 m!239951))

(declare-fun m!239953 () Bool)

(assert (=> b!212036 m!239953))

(declare-fun m!239955 () Bool)

(assert (=> b!212038 m!239955))

(declare-fun m!239957 () Bool)

(assert (=> b!212039 m!239957))

(declare-fun m!239959 () Bool)

(assert (=> start!21080 m!239959))

(declare-fun m!239961 () Bool)

(assert (=> start!21080 m!239961))

(declare-fun m!239963 () Bool)

(assert (=> start!21080 m!239963))

(declare-fun m!239965 () Bool)

(assert (=> mapNonEmpty!9263 m!239965))

(declare-fun m!239967 () Bool)

(assert (=> b!212037 m!239967))

(declare-fun m!239969 () Bool)

(assert (=> b!212037 m!239969))

(declare-fun m!239971 () Bool)

(assert (=> b!212037 m!239971))

(check-sat (not b!212037) (not b!212032) (not b!212039) tp_is_empty!5449 b_and!12431 (not b!212038) (not b!212036) (not mapNonEmpty!9263) (not b_next!5587) (not b!212034) (not start!21080))
(check-sat b_and!12431 (not b_next!5587))
