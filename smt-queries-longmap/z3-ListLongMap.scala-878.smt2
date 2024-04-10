; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20366 () Bool)

(assert start!20366)

(declare-fun b_free!5025 () Bool)

(declare-fun b_next!5025 () Bool)

(assert (=> start!20366 (= b_free!5025 (not b_next!5025))))

(declare-fun tp!18106 () Bool)

(declare-fun b_and!11771 () Bool)

(assert (=> start!20366 (= tp!18106 b_and!11771)))

(declare-fun b!201078 () Bool)

(declare-fun res!95988 () Bool)

(declare-fun e!131815 () Bool)

(assert (=> b!201078 (=> (not res!95988) (not e!131815))))

(declare-datatypes ((array!8991 0))(
  ( (array!8992 (arr!4246 (Array (_ BitVec 32) (_ BitVec 64))) (size!4571 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8991)

(declare-datatypes ((List!2676 0))(
  ( (Nil!2673) (Cons!2672 (h!3314 (_ BitVec 64)) (t!7607 List!2676)) )
))
(declare-fun arrayNoDuplicates!0 (array!8991 (_ BitVec 32) List!2676) Bool)

(assert (=> b!201078 (= res!95988 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2673))))

(declare-fun b!201079 () Bool)

(declare-fun e!131811 () Bool)

(declare-fun e!131813 () Bool)

(assert (=> b!201079 (= e!131811 e!131813)))

(declare-fun res!95982 () Bool)

(assert (=> b!201079 (=> res!95982 e!131813)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!201079 (= res!95982 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6155 0))(
  ( (V!6156 (val!2485 Int)) )
))
(declare-datatypes ((tuple2!3760 0))(
  ( (tuple2!3761 (_1!1891 (_ BitVec 64)) (_2!1891 V!6155)) )
))
(declare-datatypes ((List!2677 0))(
  ( (Nil!2674) (Cons!2673 (h!3315 tuple2!3760) (t!7608 List!2677)) )
))
(declare-datatypes ((ListLongMap!2673 0))(
  ( (ListLongMap!2674 (toList!1352 List!2677)) )
))
(declare-fun lt!99891 () ListLongMap!2673)

(declare-fun lt!99894 () ListLongMap!2673)

(assert (=> b!201079 (= lt!99891 lt!99894)))

(declare-fun lt!99897 () ListLongMap!2673)

(declare-fun lt!99903 () tuple2!3760)

(declare-fun +!379 (ListLongMap!2673 tuple2!3760) ListLongMap!2673)

(assert (=> b!201079 (= lt!99894 (+!379 lt!99897 lt!99903))))

(declare-fun lt!99902 () ListLongMap!2673)

(declare-fun v!520 () V!6155)

(declare-fun zeroValue!615 () V!6155)

(declare-datatypes ((Unit!6058 0))(
  ( (Unit!6059) )
))
(declare-fun lt!99899 () Unit!6058)

(declare-fun addCommutativeForDiffKeys!100 (ListLongMap!2673 (_ BitVec 64) V!6155 (_ BitVec 64) V!6155) Unit!6058)

(assert (=> b!201079 (= lt!99899 (addCommutativeForDiffKeys!100 lt!99902 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!99893 () ListLongMap!2673)

(declare-fun lt!99896 () tuple2!3760)

(assert (=> b!201079 (= lt!99893 (+!379 lt!99891 lt!99896))))

(declare-fun lt!99892 () ListLongMap!2673)

(declare-fun lt!99898 () tuple2!3760)

(assert (=> b!201079 (= lt!99891 (+!379 lt!99892 lt!99898))))

(declare-fun lt!99888 () ListLongMap!2673)

(declare-fun lt!99901 () ListLongMap!2673)

(assert (=> b!201079 (= lt!99888 lt!99901)))

(assert (=> b!201079 (= lt!99901 (+!379 lt!99897 lt!99896))))

(assert (=> b!201079 (= lt!99897 (+!379 lt!99902 lt!99898))))

(declare-fun lt!99889 () ListLongMap!2673)

(assert (=> b!201079 (= lt!99893 (+!379 (+!379 lt!99889 lt!99898) lt!99896))))

(declare-fun minValue!615 () V!6155)

(assert (=> b!201079 (= lt!99896 (tuple2!3761 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201079 (= lt!99898 (tuple2!3761 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201080 () Bool)

(declare-fun e!131812 () Bool)

(declare-fun tp_is_empty!4881 () Bool)

(assert (=> b!201080 (= e!131812 tp_is_empty!4881)))

(declare-fun b!201081 () Bool)

(declare-fun res!95985 () Bool)

(assert (=> b!201081 (=> (not res!95985) (not e!131815))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201081 (= res!95985 (validKeyInArray!0 k0!843))))

(declare-fun b!201082 () Bool)

(declare-fun res!95987 () Bool)

(assert (=> b!201082 (=> (not res!95987) (not e!131815))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201082 (= res!95987 (= (select (arr!4246 _keys!825) i!601) k0!843))))

(declare-fun b!201083 () Bool)

(assert (=> b!201083 (= e!131815 (not e!131811))))

(declare-fun res!95983 () Bool)

(assert (=> b!201083 (=> res!95983 e!131811)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201083 (= res!95983 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((ValueCell!2097 0))(
  ( (ValueCellFull!2097 (v!4455 V!6155)) (EmptyCell!2097) )
))
(declare-datatypes ((array!8993 0))(
  ( (array!8994 (arr!4247 (Array (_ BitVec 32) ValueCell!2097)) (size!4572 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8993)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!941 (array!8991 array!8993 (_ BitVec 32) (_ BitVec 32) V!6155 V!6155 (_ BitVec 32) Int) ListLongMap!2673)

(assert (=> b!201083 (= lt!99888 (getCurrentListMap!941 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99895 () array!8993)

(assert (=> b!201083 (= lt!99893 (getCurrentListMap!941 _keys!825 lt!99895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201083 (and (= lt!99889 lt!99892) (= lt!99892 lt!99889))))

(assert (=> b!201083 (= lt!99892 (+!379 lt!99902 lt!99903))))

(assert (=> b!201083 (= lt!99903 (tuple2!3761 k0!843 v!520))))

(declare-fun lt!99890 () Unit!6058)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!54 (array!8991 array!8993 (_ BitVec 32) (_ BitVec 32) V!6155 V!6155 (_ BitVec 32) (_ BitVec 64) V!6155 (_ BitVec 32) Int) Unit!6058)

(assert (=> b!201083 (= lt!99890 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!54 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!315 (array!8991 array!8993 (_ BitVec 32) (_ BitVec 32) V!6155 V!6155 (_ BitVec 32) Int) ListLongMap!2673)

(assert (=> b!201083 (= lt!99889 (getCurrentListMapNoExtraKeys!315 _keys!825 lt!99895 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201083 (= lt!99895 (array!8994 (store (arr!4247 _values!649) i!601 (ValueCellFull!2097 v!520)) (size!4572 _values!649)))))

(assert (=> b!201083 (= lt!99902 (getCurrentListMapNoExtraKeys!315 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!95986 () Bool)

(assert (=> start!20366 (=> (not res!95986) (not e!131815))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20366 (= res!95986 (validMask!0 mask!1149))))

(assert (=> start!20366 e!131815))

(declare-fun e!131816 () Bool)

(declare-fun array_inv!2795 (array!8993) Bool)

(assert (=> start!20366 (and (array_inv!2795 _values!649) e!131816)))

(assert (=> start!20366 true))

(assert (=> start!20366 tp_is_empty!4881))

(declare-fun array_inv!2796 (array!8991) Bool)

(assert (=> start!20366 (array_inv!2796 _keys!825)))

(assert (=> start!20366 tp!18106))

(declare-fun b!201084 () Bool)

(declare-fun e!131814 () Bool)

(assert (=> b!201084 (= e!131814 tp_is_empty!4881)))

(declare-fun mapNonEmpty!8390 () Bool)

(declare-fun mapRes!8390 () Bool)

(declare-fun tp!18107 () Bool)

(assert (=> mapNonEmpty!8390 (= mapRes!8390 (and tp!18107 e!131814))))

(declare-fun mapValue!8390 () ValueCell!2097)

(declare-fun mapRest!8390 () (Array (_ BitVec 32) ValueCell!2097))

(declare-fun mapKey!8390 () (_ BitVec 32))

(assert (=> mapNonEmpty!8390 (= (arr!4247 _values!649) (store mapRest!8390 mapKey!8390 mapValue!8390))))

(declare-fun b!201085 () Bool)

(declare-fun res!95981 () Bool)

(assert (=> b!201085 (=> (not res!95981) (not e!131815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8991 (_ BitVec 32)) Bool)

(assert (=> b!201085 (= res!95981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201086 () Bool)

(assert (=> b!201086 (= e!131816 (and e!131812 mapRes!8390))))

(declare-fun condMapEmpty!8390 () Bool)

(declare-fun mapDefault!8390 () ValueCell!2097)

(assert (=> b!201086 (= condMapEmpty!8390 (= (arr!4247 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2097)) mapDefault!8390)))))

(declare-fun b!201087 () Bool)

(declare-fun res!95989 () Bool)

(assert (=> b!201087 (=> (not res!95989) (not e!131815))))

(assert (=> b!201087 (= res!95989 (and (= (size!4572 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4571 _keys!825) (size!4572 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8390 () Bool)

(assert (=> mapIsEmpty!8390 mapRes!8390))

(declare-fun b!201088 () Bool)

(declare-fun res!95984 () Bool)

(assert (=> b!201088 (=> (not res!95984) (not e!131815))))

(assert (=> b!201088 (= res!95984 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4571 _keys!825))))))

(declare-fun b!201089 () Bool)

(assert (=> b!201089 (= e!131813 true)))

(assert (=> b!201089 (= (+!379 lt!99894 lt!99896) (+!379 lt!99901 lt!99903))))

(declare-fun lt!99900 () Unit!6058)

(assert (=> b!201089 (= lt!99900 (addCommutativeForDiffKeys!100 lt!99897 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20366 res!95986) b!201087))

(assert (= (and b!201087 res!95989) b!201085))

(assert (= (and b!201085 res!95981) b!201078))

(assert (= (and b!201078 res!95988) b!201088))

(assert (= (and b!201088 res!95984) b!201081))

(assert (= (and b!201081 res!95985) b!201082))

(assert (= (and b!201082 res!95987) b!201083))

(assert (= (and b!201083 (not res!95983)) b!201079))

(assert (= (and b!201079 (not res!95982)) b!201089))

(assert (= (and b!201086 condMapEmpty!8390) mapIsEmpty!8390))

(assert (= (and b!201086 (not condMapEmpty!8390)) mapNonEmpty!8390))

(get-info :version)

(assert (= (and mapNonEmpty!8390 ((_ is ValueCellFull!2097) mapValue!8390)) b!201084))

(assert (= (and b!201086 ((_ is ValueCellFull!2097) mapDefault!8390)) b!201080))

(assert (= start!20366 b!201086))

(declare-fun m!227843 () Bool)

(assert (=> b!201081 m!227843))

(declare-fun m!227845 () Bool)

(assert (=> b!201085 m!227845))

(declare-fun m!227847 () Bool)

(assert (=> b!201089 m!227847))

(declare-fun m!227849 () Bool)

(assert (=> b!201089 m!227849))

(declare-fun m!227851 () Bool)

(assert (=> b!201089 m!227851))

(declare-fun m!227853 () Bool)

(assert (=> b!201079 m!227853))

(declare-fun m!227855 () Bool)

(assert (=> b!201079 m!227855))

(declare-fun m!227857 () Bool)

(assert (=> b!201079 m!227857))

(declare-fun m!227859 () Bool)

(assert (=> b!201079 m!227859))

(assert (=> b!201079 m!227859))

(declare-fun m!227861 () Bool)

(assert (=> b!201079 m!227861))

(declare-fun m!227863 () Bool)

(assert (=> b!201079 m!227863))

(declare-fun m!227865 () Bool)

(assert (=> b!201079 m!227865))

(declare-fun m!227867 () Bool)

(assert (=> b!201079 m!227867))

(declare-fun m!227869 () Bool)

(assert (=> b!201083 m!227869))

(declare-fun m!227871 () Bool)

(assert (=> b!201083 m!227871))

(declare-fun m!227873 () Bool)

(assert (=> b!201083 m!227873))

(declare-fun m!227875 () Bool)

(assert (=> b!201083 m!227875))

(declare-fun m!227877 () Bool)

(assert (=> b!201083 m!227877))

(declare-fun m!227879 () Bool)

(assert (=> b!201083 m!227879))

(declare-fun m!227881 () Bool)

(assert (=> b!201083 m!227881))

(declare-fun m!227883 () Bool)

(assert (=> b!201078 m!227883))

(declare-fun m!227885 () Bool)

(assert (=> start!20366 m!227885))

(declare-fun m!227887 () Bool)

(assert (=> start!20366 m!227887))

(declare-fun m!227889 () Bool)

(assert (=> start!20366 m!227889))

(declare-fun m!227891 () Bool)

(assert (=> b!201082 m!227891))

(declare-fun m!227893 () Bool)

(assert (=> mapNonEmpty!8390 m!227893))

(check-sat (not b!201083) (not b!201085) (not b!201081) (not b_next!5025) (not b!201078) b_and!11771 (not b!201089) tp_is_empty!4881 (not mapNonEmpty!8390) (not b!201079) (not start!20366))
(check-sat b_and!11771 (not b_next!5025))
