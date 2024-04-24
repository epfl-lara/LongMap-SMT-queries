; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20578 () Bool)

(assert start!20578)

(declare-fun b_free!5233 () Bool)

(declare-fun b_next!5233 () Bool)

(assert (=> start!20578 (= b_free!5233 (not b_next!5233))))

(declare-fun tp!18730 () Bool)

(declare-fun b_and!11993 () Bool)

(assert (=> start!20578 (= tp!18730 b_and!11993)))

(declare-fun b!204887 () Bool)

(declare-fun e!134021 () Bool)

(declare-fun tp_is_empty!5089 () Bool)

(assert (=> b!204887 (= e!134021 tp_is_empty!5089)))

(declare-fun b!204888 () Bool)

(declare-fun e!134020 () Bool)

(assert (=> b!204888 (= e!134020 tp_is_empty!5089)))

(declare-fun b!204889 () Bool)

(declare-fun res!98829 () Bool)

(declare-fun e!134022 () Bool)

(assert (=> b!204889 (=> (not res!98829) (not e!134022))))

(declare-datatypes ((array!9387 0))(
  ( (array!9388 (arr!4444 (Array (_ BitVec 32) (_ BitVec 64))) (size!4769 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9387)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9387 (_ BitVec 32)) Bool)

(assert (=> b!204889 (= res!98829 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!204890 () Bool)

(declare-fun e!134019 () Bool)

(assert (=> b!204890 (= e!134022 (not e!134019))))

(declare-fun res!98831 () Bool)

(assert (=> b!204890 (=> res!98831 e!134019)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204890 (= res!98831 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6433 0))(
  ( (V!6434 (val!2589 Int)) )
))
(declare-datatypes ((ValueCell!2201 0))(
  ( (ValueCellFull!2201 (v!4560 V!6433)) (EmptyCell!2201) )
))
(declare-datatypes ((array!9389 0))(
  ( (array!9390 (arr!4445 (Array (_ BitVec 32) ValueCell!2201)) (size!4770 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9389)

(declare-fun zeroValue!615 () V!6433)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!3874 0))(
  ( (tuple2!3875 (_1!1948 (_ BitVec 64)) (_2!1948 V!6433)) )
))
(declare-datatypes ((List!2769 0))(
  ( (Nil!2766) (Cons!2765 (h!3407 tuple2!3874) (t!7692 List!2769)) )
))
(declare-datatypes ((ListLongMap!2789 0))(
  ( (ListLongMap!2790 (toList!1410 List!2769)) )
))
(declare-fun lt!104031 () ListLongMap!2789)

(declare-fun minValue!615 () V!6433)

(declare-fun getCurrentListMap!985 (array!9387 array!9389 (_ BitVec 32) (_ BitVec 32) V!6433 V!6433 (_ BitVec 32) Int) ListLongMap!2789)

(assert (=> b!204890 (= lt!104031 (getCurrentListMap!985 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104037 () ListLongMap!2789)

(declare-fun lt!104041 () array!9389)

(assert (=> b!204890 (= lt!104037 (getCurrentListMap!985 _keys!825 lt!104041 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104032 () ListLongMap!2789)

(declare-fun lt!104035 () ListLongMap!2789)

(assert (=> b!204890 (and (= lt!104032 lt!104035) (= lt!104035 lt!104032))))

(declare-fun lt!104039 () ListLongMap!2789)

(declare-fun lt!104033 () tuple2!3874)

(declare-fun +!464 (ListLongMap!2789 tuple2!3874) ListLongMap!2789)

(assert (=> b!204890 (= lt!104035 (+!464 lt!104039 lt!104033))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun v!520 () V!6433)

(assert (=> b!204890 (= lt!104033 (tuple2!3875 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6206 0))(
  ( (Unit!6207) )
))
(declare-fun lt!104038 () Unit!6206)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!121 (array!9387 array!9389 (_ BitVec 32) (_ BitVec 32) V!6433 V!6433 (_ BitVec 32) (_ BitVec 64) V!6433 (_ BitVec 32) Int) Unit!6206)

(assert (=> b!204890 (= lt!104038 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!121 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!378 (array!9387 array!9389 (_ BitVec 32) (_ BitVec 32) V!6433 V!6433 (_ BitVec 32) Int) ListLongMap!2789)

(assert (=> b!204890 (= lt!104032 (getCurrentListMapNoExtraKeys!378 _keys!825 lt!104041 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204890 (= lt!104041 (array!9390 (store (arr!4445 _values!649) i!601 (ValueCellFull!2201 v!520)) (size!4770 _values!649)))))

(assert (=> b!204890 (= lt!104039 (getCurrentListMapNoExtraKeys!378 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204891 () Bool)

(declare-fun res!98834 () Bool)

(assert (=> b!204891 (=> (not res!98834) (not e!134022))))

(assert (=> b!204891 (= res!98834 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4769 _keys!825))))))

(declare-fun b!204892 () Bool)

(declare-fun e!134023 () Bool)

(declare-fun mapRes!8702 () Bool)

(assert (=> b!204892 (= e!134023 (and e!134021 mapRes!8702))))

(declare-fun condMapEmpty!8702 () Bool)

(declare-fun mapDefault!8702 () ValueCell!2201)

(assert (=> b!204892 (= condMapEmpty!8702 (= (arr!4445 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2201)) mapDefault!8702)))))

(declare-fun b!204893 () Bool)

(declare-fun res!98836 () Bool)

(assert (=> b!204893 (=> (not res!98836) (not e!134022))))

(assert (=> b!204893 (= res!98836 (= (select (arr!4444 _keys!825) i!601) k0!843))))

(declare-fun b!204894 () Bool)

(declare-fun e!134024 () Bool)

(assert (=> b!204894 (= e!134019 e!134024)))

(declare-fun res!98828 () Bool)

(assert (=> b!204894 (=> res!98828 e!134024)))

(assert (=> b!204894 (= res!98828 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104040 () ListLongMap!2789)

(assert (=> b!204894 (= lt!104031 lt!104040)))

(declare-fun lt!104042 () tuple2!3874)

(assert (=> b!204894 (= lt!104040 (+!464 lt!104039 lt!104042))))

(declare-fun lt!104036 () ListLongMap!2789)

(assert (=> b!204894 (= lt!104037 lt!104036)))

(assert (=> b!204894 (= lt!104036 (+!464 lt!104035 lt!104042))))

(assert (=> b!204894 (= lt!104037 (+!464 lt!104032 lt!104042))))

(assert (=> b!204894 (= lt!104042 (tuple2!3875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!98832 () Bool)

(assert (=> start!20578 (=> (not res!98832) (not e!134022))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20578 (= res!98832 (validMask!0 mask!1149))))

(assert (=> start!20578 e!134022))

(declare-fun array_inv!2909 (array!9389) Bool)

(assert (=> start!20578 (and (array_inv!2909 _values!649) e!134023)))

(assert (=> start!20578 true))

(assert (=> start!20578 tp_is_empty!5089))

(declare-fun array_inv!2910 (array!9387) Bool)

(assert (=> start!20578 (array_inv!2910 _keys!825)))

(assert (=> start!20578 tp!18730))

(declare-fun mapIsEmpty!8702 () Bool)

(assert (=> mapIsEmpty!8702 mapRes!8702))

(declare-fun mapNonEmpty!8702 () Bool)

(declare-fun tp!18731 () Bool)

(assert (=> mapNonEmpty!8702 (= mapRes!8702 (and tp!18731 e!134020))))

(declare-fun mapValue!8702 () ValueCell!2201)

(declare-fun mapKey!8702 () (_ BitVec 32))

(declare-fun mapRest!8702 () (Array (_ BitVec 32) ValueCell!2201))

(assert (=> mapNonEmpty!8702 (= (arr!4445 _values!649) (store mapRest!8702 mapKey!8702 mapValue!8702))))

(declare-fun b!204895 () Bool)

(assert (=> b!204895 (= e!134024 true)))

(assert (=> b!204895 (= lt!104036 (+!464 lt!104040 lt!104033))))

(declare-fun lt!104034 () Unit!6206)

(declare-fun addCommutativeForDiffKeys!172 (ListLongMap!2789 (_ BitVec 64) V!6433 (_ BitVec 64) V!6433) Unit!6206)

(assert (=> b!204895 (= lt!104034 (addCommutativeForDiffKeys!172 lt!104039 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204896 () Bool)

(declare-fun res!98830 () Bool)

(assert (=> b!204896 (=> (not res!98830) (not e!134022))))

(declare-datatypes ((List!2770 0))(
  ( (Nil!2767) (Cons!2766 (h!3408 (_ BitVec 64)) (t!7693 List!2770)) )
))
(declare-fun arrayNoDuplicates!0 (array!9387 (_ BitVec 32) List!2770) Bool)

(assert (=> b!204896 (= res!98830 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2767))))

(declare-fun b!204897 () Bool)

(declare-fun res!98833 () Bool)

(assert (=> b!204897 (=> (not res!98833) (not e!134022))))

(assert (=> b!204897 (= res!98833 (and (= (size!4770 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4769 _keys!825) (size!4770 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204898 () Bool)

(declare-fun res!98835 () Bool)

(assert (=> b!204898 (=> (not res!98835) (not e!134022))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204898 (= res!98835 (validKeyInArray!0 k0!843))))

(assert (= (and start!20578 res!98832) b!204897))

(assert (= (and b!204897 res!98833) b!204889))

(assert (= (and b!204889 res!98829) b!204896))

(assert (= (and b!204896 res!98830) b!204891))

(assert (= (and b!204891 res!98834) b!204898))

(assert (= (and b!204898 res!98835) b!204893))

(assert (= (and b!204893 res!98836) b!204890))

(assert (= (and b!204890 (not res!98831)) b!204894))

(assert (= (and b!204894 (not res!98828)) b!204895))

(assert (= (and b!204892 condMapEmpty!8702) mapIsEmpty!8702))

(assert (= (and b!204892 (not condMapEmpty!8702)) mapNonEmpty!8702))

(get-info :version)

(assert (= (and mapNonEmpty!8702 ((_ is ValueCellFull!2201) mapValue!8702)) b!204888))

(assert (= (and b!204892 ((_ is ValueCellFull!2201) mapDefault!8702)) b!204887))

(assert (= start!20578 b!204892))

(declare-fun m!232581 () Bool)

(assert (=> b!204896 m!232581))

(declare-fun m!232583 () Bool)

(assert (=> mapNonEmpty!8702 m!232583))

(declare-fun m!232585 () Bool)

(assert (=> b!204898 m!232585))

(declare-fun m!232587 () Bool)

(assert (=> b!204895 m!232587))

(declare-fun m!232589 () Bool)

(assert (=> b!204895 m!232589))

(declare-fun m!232591 () Bool)

(assert (=> start!20578 m!232591))

(declare-fun m!232593 () Bool)

(assert (=> start!20578 m!232593))

(declare-fun m!232595 () Bool)

(assert (=> start!20578 m!232595))

(declare-fun m!232597 () Bool)

(assert (=> b!204894 m!232597))

(declare-fun m!232599 () Bool)

(assert (=> b!204894 m!232599))

(declare-fun m!232601 () Bool)

(assert (=> b!204894 m!232601))

(declare-fun m!232603 () Bool)

(assert (=> b!204889 m!232603))

(declare-fun m!232605 () Bool)

(assert (=> b!204893 m!232605))

(declare-fun m!232607 () Bool)

(assert (=> b!204890 m!232607))

(declare-fun m!232609 () Bool)

(assert (=> b!204890 m!232609))

(declare-fun m!232611 () Bool)

(assert (=> b!204890 m!232611))

(declare-fun m!232613 () Bool)

(assert (=> b!204890 m!232613))

(declare-fun m!232615 () Bool)

(assert (=> b!204890 m!232615))

(declare-fun m!232617 () Bool)

(assert (=> b!204890 m!232617))

(declare-fun m!232619 () Bool)

(assert (=> b!204890 m!232619))

(check-sat (not b!204889) (not b!204898) (not b!204896) (not b_next!5233) (not b!204890) tp_is_empty!5089 (not b!204895) (not b!204894) b_and!11993 (not start!20578) (not mapNonEmpty!8702))
(check-sat b_and!11993 (not b_next!5233))
