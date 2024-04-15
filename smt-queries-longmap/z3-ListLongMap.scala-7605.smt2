; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!95944 () Bool)

(assert start!95944)

(declare-fun b_free!22603 () Bool)

(declare-fun b_next!22603 () Bool)

(assert (=> start!95944 (= b_free!22603 (not b_next!22603))))

(declare-fun tp!79657 () Bool)

(declare-fun b_and!35855 () Bool)

(assert (=> start!95944 (= tp!79657 b_and!35855)))

(declare-fun b!1086844 () Bool)

(declare-fun e!620831 () Bool)

(declare-fun e!620832 () Bool)

(assert (=> b!1086844 (= e!620831 e!620832)))

(declare-fun res!724797 () Bool)

(assert (=> b!1086844 (=> (not res!724797) (not e!620832))))

(declare-datatypes ((array!70062 0))(
  ( (array!70063 (arr!33705 (Array (_ BitVec 32) (_ BitVec 64))) (size!34243 (_ BitVec 32))) )
))
(declare-fun lt!483299 () array!70062)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70062 (_ BitVec 32)) Bool)

(assert (=> b!1086844 (= res!724797 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483299 mask!1414))))

(declare-fun _keys!1070 () array!70062)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1086844 (= lt!483299 (array!70063 (store (arr!33705 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34243 _keys!1070)))))

(declare-fun b!1086845 () Bool)

(declare-fun e!620833 () Bool)

(declare-fun e!620830 () Bool)

(declare-fun mapRes!41662 () Bool)

(assert (=> b!1086845 (= e!620833 (and e!620830 mapRes!41662))))

(declare-fun condMapEmpty!41662 () Bool)

(declare-datatypes ((V!40601 0))(
  ( (V!40602 (val!13359 Int)) )
))
(declare-datatypes ((ValueCell!12593 0))(
  ( (ValueCellFull!12593 (v!15979 V!40601)) (EmptyCell!12593) )
))
(declare-datatypes ((array!70064 0))(
  ( (array!70065 (arr!33706 (Array (_ BitVec 32) ValueCell!12593)) (size!34244 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70064)

(declare-fun mapDefault!41662 () ValueCell!12593)

(assert (=> b!1086845 (= condMapEmpty!41662 (= (arr!33706 _values!874) ((as const (Array (_ BitVec 32) ValueCell!12593)) mapDefault!41662)))))

(declare-fun b!1086846 () Bool)

(declare-fun res!724806 () Bool)

(assert (=> b!1086846 (=> (not res!724806) (not e!620831))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1086846 (= res!724806 (and (= (size!34244 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34243 _keys!1070) (size!34244 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1086847 () Bool)

(declare-fun res!724798 () Bool)

(assert (=> b!1086847 (=> (not res!724798) (not e!620831))))

(declare-fun k0!904 () (_ BitVec 64))

(assert (=> b!1086847 (= res!724798 (= (select (arr!33705 _keys!1070) i!650) k0!904))))

(declare-fun b!1086848 () Bool)

(declare-fun e!620834 () Bool)

(declare-fun e!620836 () Bool)

(assert (=> b!1086848 (= e!620834 e!620836)))

(declare-fun res!724802 () Bool)

(assert (=> b!1086848 (=> res!724802 e!620836)))

(assert (=> b!1086848 (= res!724802 (= #b1000000000000000000000000000000000000000000000000000000000000000 k0!904))))

(declare-datatypes ((tuple2!17006 0))(
  ( (tuple2!17007 (_1!8514 (_ BitVec 64)) (_2!8514 V!40601)) )
))
(declare-datatypes ((List!23575 0))(
  ( (Nil!23572) (Cons!23571 (h!24780 tuple2!17006) (t!33227 List!23575)) )
))
(declare-datatypes ((ListLongMap!14975 0))(
  ( (ListLongMap!14976 (toList!7503 List!23575)) )
))
(declare-fun lt!483297 () ListLongMap!14975)

(declare-fun lt!483292 () ListLongMap!14975)

(assert (=> b!1086848 (= lt!483297 lt!483292)))

(declare-fun lt!483301 () ListLongMap!14975)

(declare-fun -!782 (ListLongMap!14975 (_ BitVec 64)) ListLongMap!14975)

(assert (=> b!1086848 (= lt!483297 (-!782 lt!483301 k0!904))))

(declare-fun zeroValue!831 () V!40601)

(declare-fun lt!483305 () ListLongMap!14975)

(declare-datatypes ((Unit!35599 0))(
  ( (Unit!35600) )
))
(declare-fun lt!483295 () Unit!35599)

(declare-fun addRemoveCommutativeForDiffKeys!38 (ListLongMap!14975 (_ BitVec 64) V!40601 (_ BitVec 64)) Unit!35599)

(assert (=> b!1086848 (= lt!483295 (addRemoveCommutativeForDiffKeys!38 lt!483305 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k0!904))))

(declare-fun lt!483290 () ListLongMap!14975)

(declare-fun lt!483302 () tuple2!17006)

(declare-fun +!3309 (ListLongMap!14975 tuple2!17006) ListLongMap!14975)

(assert (=> b!1086848 (= lt!483290 (+!3309 lt!483292 lt!483302))))

(declare-fun lt!483300 () ListLongMap!14975)

(declare-fun lt!483291 () tuple2!17006)

(assert (=> b!1086848 (= lt!483292 (+!3309 lt!483300 lt!483291))))

(declare-fun lt!483303 () ListLongMap!14975)

(declare-fun lt!483304 () ListLongMap!14975)

(assert (=> b!1086848 (= lt!483303 lt!483304)))

(assert (=> b!1086848 (= lt!483304 (+!3309 lt!483301 lt!483302))))

(assert (=> b!1086848 (= lt!483301 (+!3309 lt!483305 lt!483291))))

(declare-fun lt!483293 () ListLongMap!14975)

(assert (=> b!1086848 (= lt!483290 (+!3309 (+!3309 lt!483293 lt!483291) lt!483302))))

(declare-fun minValue!831 () V!40601)

(assert (=> b!1086848 (= lt!483302 (tuple2!17007 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1086848 (= lt!483291 (tuple2!17007 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1086849 () Bool)

(declare-fun res!724799 () Bool)

(assert (=> b!1086849 (=> (not res!724799) (not e!620831))))

(assert (=> b!1086849 (= res!724799 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34243 _keys!1070))))))

(declare-fun b!1086850 () Bool)

(declare-fun tp_is_empty!26605 () Bool)

(assert (=> b!1086850 (= e!620830 tp_is_empty!26605)))

(declare-fun b!1086851 () Bool)

(declare-fun e!620837 () Bool)

(assert (=> b!1086851 (= e!620837 tp_is_empty!26605)))

(declare-fun b!1086852 () Bool)

(assert (=> b!1086852 (= e!620832 (not e!620834))))

(declare-fun res!724803 () Bool)

(assert (=> b!1086852 (=> res!724803 e!620834)))

(assert (=> b!1086852 (= res!724803 (or (= (bvand extraKeys!811 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!811 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!882 () Int)

(declare-fun getCurrentListMap!4187 (array!70062 array!70064 (_ BitVec 32) (_ BitVec 32) V!40601 V!40601 (_ BitVec 32) Int) ListLongMap!14975)

(assert (=> b!1086852 (= lt!483303 (getCurrentListMap!4187 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun lt!483298 () array!70064)

(assert (=> b!1086852 (= lt!483290 (getCurrentListMap!4187 lt!483299 lt!483298 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(assert (=> b!1086852 (and (= lt!483293 lt!483300) (= lt!483300 lt!483293))))

(assert (=> b!1086852 (= lt!483300 (-!782 lt!483305 k0!904))))

(declare-fun lt!483294 () Unit!35599)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!71 (array!70062 array!70064 (_ BitVec 32) (_ BitVec 32) V!40601 V!40601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!35599)

(assert (=> b!1086852 (= lt!483294 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!71 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 i!650 k0!904 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun getCurrentListMapNoExtraKeys!4057 (array!70062 array!70064 (_ BitVec 32) (_ BitVec 32) V!40601 V!40601 (_ BitVec 32) Int) ListLongMap!14975)

(assert (=> b!1086852 (= lt!483293 (getCurrentListMapNoExtraKeys!4057 lt!483299 lt!483298 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun dynLambda!2128 (Int (_ BitVec 64)) V!40601)

(assert (=> b!1086852 (= lt!483298 (array!70065 (store (arr!33706 _values!874) i!650 (ValueCellFull!12593 (dynLambda!2128 defaultEntry!882 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!34244 _values!874)))))

(assert (=> b!1086852 (= lt!483305 (getCurrentListMapNoExtraKeys!4057 _keys!1070 _values!874 mask!1414 extraKeys!811 zeroValue!831 minValue!831 #b00000000000000000000000000000000 defaultEntry!882))))

(declare-fun arrayContainsKey!0 (array!70062 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1086852 (arrayContainsKey!0 _keys!1070 k0!904 #b00000000000000000000000000000000)))

(declare-fun lt!483296 () Unit!35599)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!70062 (_ BitVec 64) (_ BitVec 32)) Unit!35599)

(assert (=> b!1086852 (= lt!483296 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1070 k0!904 i!650))))

(declare-fun b!1086853 () Bool)

(declare-fun res!724796 () Bool)

(assert (=> b!1086853 (=> (not res!724796) (not e!620832))))

(declare-datatypes ((List!23576 0))(
  ( (Nil!23573) (Cons!23572 (h!24781 (_ BitVec 64)) (t!33228 List!23576)) )
))
(declare-fun arrayNoDuplicates!0 (array!70062 (_ BitVec 32) List!23576) Bool)

(assert (=> b!1086853 (= res!724796 (arrayNoDuplicates!0 lt!483299 #b00000000000000000000000000000000 Nil!23573))))

(declare-fun b!1086854 () Bool)

(declare-fun res!724805 () Bool)

(assert (=> b!1086854 (=> (not res!724805) (not e!620831))))

(assert (=> b!1086854 (= res!724805 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1086855 () Bool)

(declare-fun res!724801 () Bool)

(assert (=> b!1086855 (=> (not res!724801) (not e!620831))))

(assert (=> b!1086855 (= res!724801 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23573))))

(declare-fun res!724800 () Bool)

(assert (=> start!95944 (=> (not res!724800) (not e!620831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95944 (= res!724800 (validMask!0 mask!1414))))

(assert (=> start!95944 e!620831))

(assert (=> start!95944 tp!79657))

(assert (=> start!95944 true))

(assert (=> start!95944 tp_is_empty!26605))

(declare-fun array_inv!26048 (array!70062) Bool)

(assert (=> start!95944 (array_inv!26048 _keys!1070)))

(declare-fun array_inv!26049 (array!70064) Bool)

(assert (=> start!95944 (and (array_inv!26049 _values!874) e!620833)))

(declare-fun mapIsEmpty!41662 () Bool)

(assert (=> mapIsEmpty!41662 mapRes!41662))

(declare-fun mapNonEmpty!41662 () Bool)

(declare-fun tp!79658 () Bool)

(assert (=> mapNonEmpty!41662 (= mapRes!41662 (and tp!79658 e!620837))))

(declare-fun mapKey!41662 () (_ BitVec 32))

(declare-fun mapValue!41662 () ValueCell!12593)

(declare-fun mapRest!41662 () (Array (_ BitVec 32) ValueCell!12593))

(assert (=> mapNonEmpty!41662 (= (arr!33706 _values!874) (store mapRest!41662 mapKey!41662 mapValue!41662))))

(declare-fun b!1086856 () Bool)

(declare-fun res!724804 () Bool)

(assert (=> b!1086856 (=> (not res!724804) (not e!620831))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1086856 (= res!724804 (validKeyInArray!0 k0!904))))

(declare-fun b!1086857 () Bool)

(assert (=> b!1086857 (= e!620836 true)))

(assert (=> b!1086857 (= (-!782 lt!483304 k0!904) (+!3309 lt!483297 lt!483302))))

(declare-fun lt!483289 () Unit!35599)

(assert (=> b!1086857 (= lt!483289 (addRemoveCommutativeForDiffKeys!38 lt!483301 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831 k0!904))))

(assert (= (and start!95944 res!724800) b!1086846))

(assert (= (and b!1086846 res!724806) b!1086854))

(assert (= (and b!1086854 res!724805) b!1086855))

(assert (= (and b!1086855 res!724801) b!1086849))

(assert (= (and b!1086849 res!724799) b!1086856))

(assert (= (and b!1086856 res!724804) b!1086847))

(assert (= (and b!1086847 res!724798) b!1086844))

(assert (= (and b!1086844 res!724797) b!1086853))

(assert (= (and b!1086853 res!724796) b!1086852))

(assert (= (and b!1086852 (not res!724803)) b!1086848))

(assert (= (and b!1086848 (not res!724802)) b!1086857))

(assert (= (and b!1086845 condMapEmpty!41662) mapIsEmpty!41662))

(assert (= (and b!1086845 (not condMapEmpty!41662)) mapNonEmpty!41662))

(get-info :version)

(assert (= (and mapNonEmpty!41662 ((_ is ValueCellFull!12593) mapValue!41662)) b!1086851))

(assert (= (and b!1086845 ((_ is ValueCellFull!12593) mapDefault!41662)) b!1086850))

(assert (= start!95944 b!1086845))

(declare-fun b_lambda!17251 () Bool)

(assert (=> (not b_lambda!17251) (not b!1086852)))

(declare-fun t!33226 () Bool)

(declare-fun tb!7473 () Bool)

(assert (=> (and start!95944 (= defaultEntry!882 defaultEntry!882) t!33226) tb!7473))

(declare-fun result!15473 () Bool)

(assert (=> tb!7473 (= result!15473 tp_is_empty!26605)))

(assert (=> b!1086852 t!33226))

(declare-fun b_and!35857 () Bool)

(assert (= b_and!35855 (and (=> t!33226 result!15473) b_and!35857)))

(declare-fun m!1005125 () Bool)

(assert (=> b!1086844 m!1005125))

(declare-fun m!1005127 () Bool)

(assert (=> b!1086844 m!1005127))

(declare-fun m!1005129 () Bool)

(assert (=> b!1086854 m!1005129))

(declare-fun m!1005131 () Bool)

(assert (=> b!1086856 m!1005131))

(declare-fun m!1005133 () Bool)

(assert (=> b!1086855 m!1005133))

(declare-fun m!1005135 () Bool)

(assert (=> b!1086848 m!1005135))

(declare-fun m!1005137 () Bool)

(assert (=> b!1086848 m!1005137))

(declare-fun m!1005139 () Bool)

(assert (=> b!1086848 m!1005139))

(declare-fun m!1005141 () Bool)

(assert (=> b!1086848 m!1005141))

(declare-fun m!1005143 () Bool)

(assert (=> b!1086848 m!1005143))

(declare-fun m!1005145 () Bool)

(assert (=> b!1086848 m!1005145))

(assert (=> b!1086848 m!1005145))

(declare-fun m!1005147 () Bool)

(assert (=> b!1086848 m!1005147))

(declare-fun m!1005149 () Bool)

(assert (=> b!1086848 m!1005149))

(declare-fun m!1005151 () Bool)

(assert (=> start!95944 m!1005151))

(declare-fun m!1005153 () Bool)

(assert (=> start!95944 m!1005153))

(declare-fun m!1005155 () Bool)

(assert (=> start!95944 m!1005155))

(declare-fun m!1005157 () Bool)

(assert (=> b!1086852 m!1005157))

(declare-fun m!1005159 () Bool)

(assert (=> b!1086852 m!1005159))

(declare-fun m!1005161 () Bool)

(assert (=> b!1086852 m!1005161))

(declare-fun m!1005163 () Bool)

(assert (=> b!1086852 m!1005163))

(declare-fun m!1005165 () Bool)

(assert (=> b!1086852 m!1005165))

(declare-fun m!1005167 () Bool)

(assert (=> b!1086852 m!1005167))

(declare-fun m!1005169 () Bool)

(assert (=> b!1086852 m!1005169))

(declare-fun m!1005171 () Bool)

(assert (=> b!1086852 m!1005171))

(declare-fun m!1005173 () Bool)

(assert (=> b!1086852 m!1005173))

(declare-fun m!1005175 () Bool)

(assert (=> b!1086852 m!1005175))

(declare-fun m!1005177 () Bool)

(assert (=> mapNonEmpty!41662 m!1005177))

(declare-fun m!1005179 () Bool)

(assert (=> b!1086853 m!1005179))

(declare-fun m!1005181 () Bool)

(assert (=> b!1086847 m!1005181))

(declare-fun m!1005183 () Bool)

(assert (=> b!1086857 m!1005183))

(declare-fun m!1005185 () Bool)

(assert (=> b!1086857 m!1005185))

(declare-fun m!1005187 () Bool)

(assert (=> b!1086857 m!1005187))

(check-sat (not b!1086852) (not mapNonEmpty!41662) (not b!1086844) b_and!35857 (not b!1086848) tp_is_empty!26605 (not b!1086855) (not b_lambda!17251) (not b!1086854) (not b_next!22603) (not b!1086857) (not start!95944) (not b!1086856) (not b!1086853))
(check-sat b_and!35857 (not b_next!22603))
