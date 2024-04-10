; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20462 () Bool)

(assert start!20462)

(declare-fun b_free!5121 () Bool)

(declare-fun b_next!5121 () Bool)

(assert (=> start!20462 (= b_free!5121 (not b_next!5121))))

(declare-fun tp!18394 () Bool)

(declare-fun b_and!11867 () Bool)

(assert (=> start!20462 (= tp!18394 b_and!11867)))

(declare-fun b!202815 () Bool)

(declare-fun res!97288 () Bool)

(declare-fun e!132823 () Bool)

(assert (=> b!202815 (=> (not res!97288) (not e!132823))))

(declare-datatypes ((array!9179 0))(
  ( (array!9180 (arr!4340 (Array (_ BitVec 32) (_ BitVec 64))) (size!4665 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9179)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9179 (_ BitVec 32)) Bool)

(assert (=> b!202815 (= res!97288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8534 () Bool)

(declare-fun mapRes!8534 () Bool)

(declare-fun tp!18395 () Bool)

(declare-fun e!132819 () Bool)

(assert (=> mapNonEmpty!8534 (= mapRes!8534 (and tp!18395 e!132819))))

(declare-fun mapKey!8534 () (_ BitVec 32))

(declare-datatypes ((V!6283 0))(
  ( (V!6284 (val!2533 Int)) )
))
(declare-datatypes ((ValueCell!2145 0))(
  ( (ValueCellFull!2145 (v!4503 V!6283)) (EmptyCell!2145) )
))
(declare-fun mapRest!8534 () (Array (_ BitVec 32) ValueCell!2145))

(declare-fun mapValue!8534 () ValueCell!2145)

(declare-datatypes ((array!9181 0))(
  ( (array!9182 (arr!4341 (Array (_ BitVec 32) ValueCell!2145)) (size!4666 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9181)

(assert (=> mapNonEmpty!8534 (= (arr!4341 _values!649) (store mapRest!8534 mapKey!8534 mapValue!8534))))

(declare-fun b!202816 () Bool)

(declare-fun res!97292 () Bool)

(assert (=> b!202816 (=> (not res!97292) (not e!132823))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202816 (= res!97292 (and (= (size!4666 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4665 _keys!825) (size!4666 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202817 () Bool)

(declare-fun e!132820 () Bool)

(declare-fun e!132818 () Bool)

(assert (=> b!202817 (= e!132820 (and e!132818 mapRes!8534))))

(declare-fun condMapEmpty!8534 () Bool)

(declare-fun mapDefault!8534 () ValueCell!2145)

(assert (=> b!202817 (= condMapEmpty!8534 (= (arr!4341 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2145)) mapDefault!8534)))))

(declare-fun res!97291 () Bool)

(assert (=> start!20462 (=> (not res!97291) (not e!132823))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20462 (= res!97291 (validMask!0 mask!1149))))

(assert (=> start!20462 e!132823))

(declare-fun array_inv!2863 (array!9181) Bool)

(assert (=> start!20462 (and (array_inv!2863 _values!649) e!132820)))

(assert (=> start!20462 true))

(declare-fun tp_is_empty!4977 () Bool)

(assert (=> start!20462 tp_is_empty!4977))

(declare-fun array_inv!2864 (array!9179) Bool)

(assert (=> start!20462 (array_inv!2864 _keys!825)))

(assert (=> start!20462 tp!18394))

(declare-fun b!202818 () Bool)

(declare-fun res!97294 () Bool)

(assert (=> b!202818 (=> (not res!97294) (not e!132823))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202818 (= res!97294 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4665 _keys!825))))))

(declare-fun mapIsEmpty!8534 () Bool)

(assert (=> mapIsEmpty!8534 mapRes!8534))

(declare-fun b!202819 () Bool)

(declare-fun e!132821 () Bool)

(declare-fun e!132822 () Bool)

(assert (=> b!202819 (= e!132821 e!132822)))

(declare-fun res!97286 () Bool)

(assert (=> b!202819 (=> res!97286 e!132822)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!202819 (= res!97286 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3842 0))(
  ( (tuple2!3843 (_1!1932 (_ BitVec 64)) (_2!1932 V!6283)) )
))
(declare-datatypes ((List!2746 0))(
  ( (Nil!2743) (Cons!2742 (h!3384 tuple2!3842) (t!7677 List!2746)) )
))
(declare-datatypes ((ListLongMap!2755 0))(
  ( (ListLongMap!2756 (toList!1393 List!2746)) )
))
(declare-fun lt!101996 () ListLongMap!2755)

(declare-fun lt!101998 () ListLongMap!2755)

(assert (=> b!202819 (= lt!101996 lt!101998)))

(declare-fun lt!102003 () ListLongMap!2755)

(declare-fun lt!101993 () tuple2!3842)

(declare-fun +!420 (ListLongMap!2755 tuple2!3842) ListLongMap!2755)

(assert (=> b!202819 (= lt!101998 (+!420 lt!102003 lt!101993))))

(declare-fun lt!101999 () ListLongMap!2755)

(declare-fun lt!101995 () ListLongMap!2755)

(assert (=> b!202819 (= lt!101999 lt!101995)))

(declare-fun lt!101992 () ListLongMap!2755)

(assert (=> b!202819 (= lt!101995 (+!420 lt!101992 lt!101993))))

(declare-fun lt!101997 () ListLongMap!2755)

(assert (=> b!202819 (= lt!101996 (+!420 lt!101997 lt!101993))))

(declare-fun zeroValue!615 () V!6283)

(assert (=> b!202819 (= lt!101993 (tuple2!3843 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202820 () Bool)

(assert (=> b!202820 (= e!132822 true)))

(declare-fun lt!102000 () tuple2!3842)

(assert (=> b!202820 (= lt!101998 (+!420 lt!101995 lt!102000))))

(declare-fun v!520 () V!6283)

(declare-datatypes ((Unit!6134 0))(
  ( (Unit!6135) )
))
(declare-fun lt!102001 () Unit!6134)

(declare-fun addCommutativeForDiffKeys!136 (ListLongMap!2755 (_ BitVec 64) V!6283 (_ BitVec 64) V!6283) Unit!6134)

(assert (=> b!202820 (= lt!102001 (addCommutativeForDiffKeys!136 lt!101992 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202821 () Bool)

(assert (=> b!202821 (= e!132823 (not e!132821))))

(declare-fun res!97289 () Bool)

(assert (=> b!202821 (=> res!97289 e!132821)))

(assert (=> b!202821 (= res!97289 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6283)

(declare-fun getCurrentListMap!972 (array!9179 array!9181 (_ BitVec 32) (_ BitVec 32) V!6283 V!6283 (_ BitVec 32) Int) ListLongMap!2755)

(assert (=> b!202821 (= lt!101999 (getCurrentListMap!972 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102002 () array!9181)

(assert (=> b!202821 (= lt!101996 (getCurrentListMap!972 _keys!825 lt!102002 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202821 (and (= lt!101997 lt!102003) (= lt!102003 lt!101997))))

(assert (=> b!202821 (= lt!102003 (+!420 lt!101992 lt!102000))))

(assert (=> b!202821 (= lt!102000 (tuple2!3843 k0!843 v!520))))

(declare-fun lt!101994 () Unit!6134)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!85 (array!9179 array!9181 (_ BitVec 32) (_ BitVec 32) V!6283 V!6283 (_ BitVec 32) (_ BitVec 64) V!6283 (_ BitVec 32) Int) Unit!6134)

(assert (=> b!202821 (= lt!101994 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!85 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!346 (array!9179 array!9181 (_ BitVec 32) (_ BitVec 32) V!6283 V!6283 (_ BitVec 32) Int) ListLongMap!2755)

(assert (=> b!202821 (= lt!101997 (getCurrentListMapNoExtraKeys!346 _keys!825 lt!102002 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202821 (= lt!102002 (array!9182 (store (arr!4341 _values!649) i!601 (ValueCellFull!2145 v!520)) (size!4666 _values!649)))))

(assert (=> b!202821 (= lt!101992 (getCurrentListMapNoExtraKeys!346 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202822 () Bool)

(assert (=> b!202822 (= e!132819 tp_is_empty!4977)))

(declare-fun b!202823 () Bool)

(assert (=> b!202823 (= e!132818 tp_is_empty!4977)))

(declare-fun b!202824 () Bool)

(declare-fun res!97293 () Bool)

(assert (=> b!202824 (=> (not res!97293) (not e!132823))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202824 (= res!97293 (validKeyInArray!0 k0!843))))

(declare-fun b!202825 () Bool)

(declare-fun res!97290 () Bool)

(assert (=> b!202825 (=> (not res!97290) (not e!132823))))

(assert (=> b!202825 (= res!97290 (= (select (arr!4340 _keys!825) i!601) k0!843))))

(declare-fun b!202826 () Bool)

(declare-fun res!97287 () Bool)

(assert (=> b!202826 (=> (not res!97287) (not e!132823))))

(declare-datatypes ((List!2747 0))(
  ( (Nil!2744) (Cons!2743 (h!3385 (_ BitVec 64)) (t!7678 List!2747)) )
))
(declare-fun arrayNoDuplicates!0 (array!9179 (_ BitVec 32) List!2747) Bool)

(assert (=> b!202826 (= res!97287 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2744))))

(assert (= (and start!20462 res!97291) b!202816))

(assert (= (and b!202816 res!97292) b!202815))

(assert (= (and b!202815 res!97288) b!202826))

(assert (= (and b!202826 res!97287) b!202818))

(assert (= (and b!202818 res!97294) b!202824))

(assert (= (and b!202824 res!97293) b!202825))

(assert (= (and b!202825 res!97290) b!202821))

(assert (= (and b!202821 (not res!97289)) b!202819))

(assert (= (and b!202819 (not res!97286)) b!202820))

(assert (= (and b!202817 condMapEmpty!8534) mapIsEmpty!8534))

(assert (= (and b!202817 (not condMapEmpty!8534)) mapNonEmpty!8534))

(get-info :version)

(assert (= (and mapNonEmpty!8534 ((_ is ValueCellFull!2145) mapValue!8534)) b!202822))

(assert (= (and b!202817 ((_ is ValueCellFull!2145) mapDefault!8534)) b!202823))

(assert (= start!20462 b!202817))

(declare-fun m!230171 () Bool)

(assert (=> mapNonEmpty!8534 m!230171))

(declare-fun m!230173 () Bool)

(assert (=> b!202821 m!230173))

(declare-fun m!230175 () Bool)

(assert (=> b!202821 m!230175))

(declare-fun m!230177 () Bool)

(assert (=> b!202821 m!230177))

(declare-fun m!230179 () Bool)

(assert (=> b!202821 m!230179))

(declare-fun m!230181 () Bool)

(assert (=> b!202821 m!230181))

(declare-fun m!230183 () Bool)

(assert (=> b!202821 m!230183))

(declare-fun m!230185 () Bool)

(assert (=> b!202821 m!230185))

(declare-fun m!230187 () Bool)

(assert (=> start!20462 m!230187))

(declare-fun m!230189 () Bool)

(assert (=> start!20462 m!230189))

(declare-fun m!230191 () Bool)

(assert (=> start!20462 m!230191))

(declare-fun m!230193 () Bool)

(assert (=> b!202820 m!230193))

(declare-fun m!230195 () Bool)

(assert (=> b!202820 m!230195))

(declare-fun m!230197 () Bool)

(assert (=> b!202826 m!230197))

(declare-fun m!230199 () Bool)

(assert (=> b!202819 m!230199))

(declare-fun m!230201 () Bool)

(assert (=> b!202819 m!230201))

(declare-fun m!230203 () Bool)

(assert (=> b!202819 m!230203))

(declare-fun m!230205 () Bool)

(assert (=> b!202815 m!230205))

(declare-fun m!230207 () Bool)

(assert (=> b!202824 m!230207))

(declare-fun m!230209 () Bool)

(assert (=> b!202825 m!230209))

(check-sat (not b!202824) (not b!202815) tp_is_empty!4977 (not start!20462) (not b!202820) (not b_next!5121) (not mapNonEmpty!8534) (not b!202819) (not b!202826) (not b!202821) b_and!11867)
(check-sat b_and!11867 (not b_next!5121))
