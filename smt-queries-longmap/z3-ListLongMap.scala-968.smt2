; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20990 () Bool)

(assert start!20990)

(declare-fun b_free!5557 () Bool)

(declare-fun b_next!5557 () Bool)

(assert (=> start!20990 (= b_free!5557 (not b_next!5557))))

(declare-fun tp!19724 () Bool)

(declare-fun b_and!12325 () Bool)

(assert (=> start!20990 (= tp!19724 b_and!12325)))

(declare-fun b!210741 () Bool)

(declare-fun e!137206 () Bool)

(declare-fun tp_is_empty!5419 () Bool)

(assert (=> b!210741 (= e!137206 tp_is_empty!5419)))

(declare-fun b!210742 () Bool)

(declare-fun res!102849 () Bool)

(declare-fun e!137208 () Bool)

(assert (=> b!210742 (=> (not res!102849) (not e!137208))))

(declare-datatypes ((array!10027 0))(
  ( (array!10028 (arr!4759 (Array (_ BitVec 32) (_ BitVec 64))) (size!5085 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10027)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6873 0))(
  ( (V!6874 (val!2754 Int)) )
))
(declare-datatypes ((ValueCell!2366 0))(
  ( (ValueCellFull!2366 (v!4734 V!6873)) (EmptyCell!2366) )
))
(declare-datatypes ((array!10029 0))(
  ( (array!10030 (arr!4760 (Array (_ BitVec 32) ValueCell!2366)) (size!5086 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10029)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!210742 (= res!102849 (and (= (size!5086 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5085 _keys!825) (size!5086 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!210743 () Bool)

(declare-fun res!102850 () Bool)

(assert (=> b!210743 (=> (not res!102850) (not e!137208))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!210743 (= res!102850 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!9209 () Bool)

(declare-fun mapRes!9209 () Bool)

(declare-fun tp!19723 () Bool)

(declare-fun e!137204 () Bool)

(assert (=> mapNonEmpty!9209 (= mapRes!9209 (and tp!19723 e!137204))))

(declare-fun mapRest!9209 () (Array (_ BitVec 32) ValueCell!2366))

(declare-fun mapValue!9209 () ValueCell!2366)

(declare-fun mapKey!9209 () (_ BitVec 32))

(assert (=> mapNonEmpty!9209 (= (arr!4760 _values!649) (store mapRest!9209 mapKey!9209 mapValue!9209))))

(declare-fun b!210744 () Bool)

(declare-fun e!137207 () Bool)

(assert (=> b!210744 (= e!137208 (not e!137207))))

(declare-fun res!102851 () Bool)

(assert (=> b!210744 (=> res!102851 e!137207)))

(assert (=> b!210744 (= res!102851 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6873)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6873)

(declare-datatypes ((tuple2!4140 0))(
  ( (tuple2!4141 (_1!2081 (_ BitVec 64)) (_2!2081 V!6873)) )
))
(declare-datatypes ((List!3048 0))(
  ( (Nil!3045) (Cons!3044 (h!3686 tuple2!4140) (t!7978 List!3048)) )
))
(declare-datatypes ((ListLongMap!3043 0))(
  ( (ListLongMap!3044 (toList!1537 List!3048)) )
))
(declare-fun lt!108086 () ListLongMap!3043)

(declare-fun getCurrentListMap!1049 (array!10027 array!10029 (_ BitVec 32) (_ BitVec 32) V!6873 V!6873 (_ BitVec 32) Int) ListLongMap!3043)

(assert (=> b!210744 (= lt!108086 (getCurrentListMap!1049 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108093 () ListLongMap!3043)

(declare-fun lt!108087 () array!10029)

(assert (=> b!210744 (= lt!108093 (getCurrentListMap!1049 _keys!825 lt!108087 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!108084 () ListLongMap!3043)

(declare-fun lt!108094 () ListLongMap!3043)

(assert (=> b!210744 (and (= lt!108084 lt!108094) (= lt!108094 lt!108084))))

(declare-fun lt!108096 () ListLongMap!3043)

(declare-fun lt!108083 () tuple2!4140)

(declare-fun +!561 (ListLongMap!3043 tuple2!4140) ListLongMap!3043)

(assert (=> b!210744 (= lt!108094 (+!561 lt!108096 lt!108083))))

(declare-fun v!520 () V!6873)

(assert (=> b!210744 (= lt!108083 (tuple2!4141 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6366 0))(
  ( (Unit!6367) )
))
(declare-fun lt!108091 () Unit!6366)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!210 (array!10027 array!10029 (_ BitVec 32) (_ BitVec 32) V!6873 V!6873 (_ BitVec 32) (_ BitVec 64) V!6873 (_ BitVec 32) Int) Unit!6366)

(assert (=> b!210744 (= lt!108091 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!210 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!486 (array!10027 array!10029 (_ BitVec 32) (_ BitVec 32) V!6873 V!6873 (_ BitVec 32) Int) ListLongMap!3043)

(assert (=> b!210744 (= lt!108084 (getCurrentListMapNoExtraKeys!486 _keys!825 lt!108087 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!210744 (= lt!108087 (array!10030 (store (arr!4760 _values!649) i!601 (ValueCellFull!2366 v!520)) (size!5086 _values!649)))))

(assert (=> b!210744 (= lt!108096 (getCurrentListMapNoExtraKeys!486 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!210746 () Bool)

(declare-fun res!102848 () Bool)

(assert (=> b!210746 (=> (not res!102848) (not e!137208))))

(declare-datatypes ((List!3049 0))(
  ( (Nil!3046) (Cons!3045 (h!3687 (_ BitVec 64)) (t!7979 List!3049)) )
))
(declare-fun arrayNoDuplicates!0 (array!10027 (_ BitVec 32) List!3049) Bool)

(assert (=> b!210746 (= res!102848 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3046))))

(declare-fun b!210747 () Bool)

(declare-fun res!102843 () Bool)

(assert (=> b!210747 (=> (not res!102843) (not e!137208))))

(assert (=> b!210747 (= res!102843 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5085 _keys!825))))))

(declare-fun b!210748 () Bool)

(declare-fun res!102844 () Bool)

(assert (=> b!210748 (=> (not res!102844) (not e!137208))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10027 (_ BitVec 32)) Bool)

(assert (=> b!210748 (= res!102844 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!210749 () Bool)

(assert (=> b!210749 (= e!137204 tp_is_empty!5419)))

(declare-fun b!210750 () Bool)

(declare-fun e!137202 () Bool)

(assert (=> b!210750 (= e!137207 e!137202)))

(declare-fun res!102846 () Bool)

(assert (=> b!210750 (=> res!102846 e!137202)))

(assert (=> b!210750 (= res!102846 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!108097 () ListLongMap!3043)

(declare-fun lt!108095 () ListLongMap!3043)

(assert (=> b!210750 (= lt!108097 lt!108095)))

(declare-fun lt!108092 () ListLongMap!3043)

(assert (=> b!210750 (= lt!108095 (+!561 lt!108092 lt!108083))))

(declare-fun lt!108088 () Unit!6366)

(declare-fun addCommutativeForDiffKeys!196 (ListLongMap!3043 (_ BitVec 64) V!6873 (_ BitVec 64) V!6873) Unit!6366)

(assert (=> b!210750 (= lt!108088 (addCommutativeForDiffKeys!196 lt!108096 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!108098 () tuple2!4140)

(assert (=> b!210750 (= lt!108093 (+!561 lt!108097 lt!108098))))

(declare-fun lt!108089 () tuple2!4140)

(assert (=> b!210750 (= lt!108097 (+!561 lt!108094 lt!108089))))

(declare-fun lt!108085 () ListLongMap!3043)

(assert (=> b!210750 (= lt!108086 lt!108085)))

(assert (=> b!210750 (= lt!108085 (+!561 lt!108092 lt!108098))))

(assert (=> b!210750 (= lt!108092 (+!561 lt!108096 lt!108089))))

(assert (=> b!210750 (= lt!108093 (+!561 (+!561 lt!108084 lt!108089) lt!108098))))

(assert (=> b!210750 (= lt!108098 (tuple2!4141 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!210750 (= lt!108089 (tuple2!4141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!210751 () Bool)

(declare-fun res!102845 () Bool)

(assert (=> b!210751 (=> (not res!102845) (not e!137208))))

(assert (=> b!210751 (= res!102845 (= (select (arr!4759 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9209 () Bool)

(assert (=> mapIsEmpty!9209 mapRes!9209))

(declare-fun b!210752 () Bool)

(declare-fun e!137203 () Bool)

(assert (=> b!210752 (= e!137203 (and e!137206 mapRes!9209))))

(declare-fun condMapEmpty!9209 () Bool)

(declare-fun mapDefault!9209 () ValueCell!2366)

(assert (=> b!210752 (= condMapEmpty!9209 (= (arr!4760 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2366)) mapDefault!9209)))))

(declare-fun res!102847 () Bool)

(assert (=> start!20990 (=> (not res!102847) (not e!137208))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20990 (= res!102847 (validMask!0 mask!1149))))

(assert (=> start!20990 e!137208))

(declare-fun array_inv!3125 (array!10029) Bool)

(assert (=> start!20990 (and (array_inv!3125 _values!649) e!137203)))

(assert (=> start!20990 true))

(assert (=> start!20990 tp_is_empty!5419))

(declare-fun array_inv!3126 (array!10027) Bool)

(assert (=> start!20990 (array_inv!3126 _keys!825)))

(assert (=> start!20990 tp!19724))

(declare-fun b!210745 () Bool)

(assert (=> b!210745 (= e!137202 (= (+!561 lt!108086 lt!108083) lt!108093))))

(assert (=> b!210745 (= (+!561 lt!108095 lt!108098) (+!561 lt!108085 lt!108083))))

(declare-fun lt!108090 () Unit!6366)

(assert (=> b!210745 (= lt!108090 (addCommutativeForDiffKeys!196 lt!108092 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (= (and start!20990 res!102847) b!210742))

(assert (= (and b!210742 res!102849) b!210748))

(assert (= (and b!210748 res!102844) b!210746))

(assert (= (and b!210746 res!102848) b!210747))

(assert (= (and b!210747 res!102843) b!210743))

(assert (= (and b!210743 res!102850) b!210751))

(assert (= (and b!210751 res!102845) b!210744))

(assert (= (and b!210744 (not res!102851)) b!210750))

(assert (= (and b!210750 (not res!102846)) b!210745))

(assert (= (and b!210752 condMapEmpty!9209) mapIsEmpty!9209))

(assert (= (and b!210752 (not condMapEmpty!9209)) mapNonEmpty!9209))

(get-info :version)

(assert (= (and mapNonEmpty!9209 ((_ is ValueCellFull!2366) mapValue!9209)) b!210749))

(assert (= (and b!210752 ((_ is ValueCellFull!2366) mapDefault!9209)) b!210741))

(assert (= start!20990 b!210752))

(declare-fun m!237953 () Bool)

(assert (=> b!210743 m!237953))

(declare-fun m!237955 () Bool)

(assert (=> start!20990 m!237955))

(declare-fun m!237957 () Bool)

(assert (=> start!20990 m!237957))

(declare-fun m!237959 () Bool)

(assert (=> start!20990 m!237959))

(declare-fun m!237961 () Bool)

(assert (=> b!210751 m!237961))

(declare-fun m!237963 () Bool)

(assert (=> b!210748 m!237963))

(declare-fun m!237965 () Bool)

(assert (=> mapNonEmpty!9209 m!237965))

(declare-fun m!237967 () Bool)

(assert (=> b!210746 m!237967))

(declare-fun m!237969 () Bool)

(assert (=> b!210750 m!237969))

(declare-fun m!237971 () Bool)

(assert (=> b!210750 m!237971))

(declare-fun m!237973 () Bool)

(assert (=> b!210750 m!237973))

(declare-fun m!237975 () Bool)

(assert (=> b!210750 m!237975))

(declare-fun m!237977 () Bool)

(assert (=> b!210750 m!237977))

(declare-fun m!237979 () Bool)

(assert (=> b!210750 m!237979))

(declare-fun m!237981 () Bool)

(assert (=> b!210750 m!237981))

(assert (=> b!210750 m!237975))

(declare-fun m!237983 () Bool)

(assert (=> b!210750 m!237983))

(declare-fun m!237985 () Bool)

(assert (=> b!210745 m!237985))

(declare-fun m!237987 () Bool)

(assert (=> b!210745 m!237987))

(declare-fun m!237989 () Bool)

(assert (=> b!210745 m!237989))

(declare-fun m!237991 () Bool)

(assert (=> b!210745 m!237991))

(declare-fun m!237993 () Bool)

(assert (=> b!210744 m!237993))

(declare-fun m!237995 () Bool)

(assert (=> b!210744 m!237995))

(declare-fun m!237997 () Bool)

(assert (=> b!210744 m!237997))

(declare-fun m!237999 () Bool)

(assert (=> b!210744 m!237999))

(declare-fun m!238001 () Bool)

(assert (=> b!210744 m!238001))

(declare-fun m!238003 () Bool)

(assert (=> b!210744 m!238003))

(declare-fun m!238005 () Bool)

(assert (=> b!210744 m!238005))

(check-sat b_and!12325 (not b!210744) (not mapNonEmpty!9209) (not b!210748) (not b!210745) (not b!210750) (not b!210743) (not b!210746) tp_is_empty!5419 (not start!20990) (not b_next!5557))
(check-sat b_and!12325 (not b_next!5557))
