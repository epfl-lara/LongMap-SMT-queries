; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20410 () Bool)

(assert start!20410)

(declare-fun b_free!5065 () Bool)

(declare-fun b_next!5065 () Bool)

(assert (=> start!20410 (= b_free!5065 (not b_next!5065))))

(declare-fun tp!18227 () Bool)

(declare-fun b_and!11785 () Bool)

(assert (=> start!20410 (= tp!18227 b_and!11785)))

(declare-fun b!201651 () Bool)

(declare-fun e!132130 () Bool)

(declare-fun tp_is_empty!4921 () Bool)

(assert (=> b!201651 (= e!132130 tp_is_empty!4921)))

(declare-fun b!201652 () Bool)

(declare-fun res!96428 () Bool)

(declare-fun e!132132 () Bool)

(assert (=> b!201652 (=> (not res!96428) (not e!132132))))

(declare-datatypes ((array!9055 0))(
  ( (array!9056 (arr!4277 (Array (_ BitVec 32) (_ BitVec 64))) (size!4603 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9055)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201652 (= res!96428 (= (select (arr!4277 _keys!825) i!601) k0!843))))

(declare-fun b!201653 () Bool)

(declare-fun e!132133 () Bool)

(assert (=> b!201653 (= e!132133 true)))

(declare-datatypes ((V!6209 0))(
  ( (V!6210 (val!2505 Int)) )
))
(declare-datatypes ((tuple2!3768 0))(
  ( (tuple2!3769 (_1!1895 (_ BitVec 64)) (_2!1895 V!6209)) )
))
(declare-fun lt!100669 () tuple2!3768)

(declare-datatypes ((List!2686 0))(
  ( (Nil!2683) (Cons!2682 (h!3324 tuple2!3768) (t!7608 List!2686)) )
))
(declare-datatypes ((ListLongMap!2671 0))(
  ( (ListLongMap!2672 (toList!1351 List!2686)) )
))
(declare-fun lt!100675 () ListLongMap!2671)

(declare-fun lt!100679 () tuple2!3768)

(declare-fun lt!100670 () ListLongMap!2671)

(declare-fun +!400 (ListLongMap!2671 tuple2!3768) ListLongMap!2671)

(assert (=> b!201653 (= (+!400 lt!100675 lt!100669) (+!400 lt!100670 lt!100679))))

(declare-fun minValue!615 () V!6209)

(declare-fun lt!100678 () ListLongMap!2671)

(declare-fun v!520 () V!6209)

(declare-datatypes ((Unit!6052 0))(
  ( (Unit!6053) )
))
(declare-fun lt!100681 () Unit!6052)

(declare-fun addCommutativeForDiffKeys!109 (ListLongMap!2671 (_ BitVec 64) V!6209 (_ BitVec 64) V!6209) Unit!6052)

(assert (=> b!201653 (= lt!100681 (addCommutativeForDiffKeys!109 lt!100678 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201654 () Bool)

(declare-fun e!132131 () Bool)

(assert (=> b!201654 (= e!132131 e!132133)))

(declare-fun res!96427 () Bool)

(assert (=> b!201654 (=> res!96427 e!132133)))

(assert (=> b!201654 (= res!96427 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!100682 () ListLongMap!2671)

(assert (=> b!201654 (= lt!100682 lt!100675)))

(assert (=> b!201654 (= lt!100675 (+!400 lt!100678 lt!100679))))

(declare-fun lt!100674 () Unit!6052)

(declare-fun lt!100676 () ListLongMap!2671)

(declare-fun zeroValue!615 () V!6209)

(assert (=> b!201654 (= lt!100674 (addCommutativeForDiffKeys!109 lt!100676 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!100673 () ListLongMap!2671)

(assert (=> b!201654 (= lt!100673 (+!400 lt!100682 lt!100669))))

(declare-fun lt!100677 () ListLongMap!2671)

(declare-fun lt!100668 () tuple2!3768)

(assert (=> b!201654 (= lt!100682 (+!400 lt!100677 lt!100668))))

(declare-fun lt!100680 () ListLongMap!2671)

(assert (=> b!201654 (= lt!100680 lt!100670)))

(assert (=> b!201654 (= lt!100670 (+!400 lt!100678 lt!100669))))

(assert (=> b!201654 (= lt!100678 (+!400 lt!100676 lt!100668))))

(declare-fun lt!100667 () ListLongMap!2671)

(assert (=> b!201654 (= lt!100673 (+!400 (+!400 lt!100667 lt!100668) lt!100669))))

(assert (=> b!201654 (= lt!100669 (tuple2!3769 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201654 (= lt!100668 (tuple2!3769 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201655 () Bool)

(declare-fun res!96429 () Bool)

(assert (=> b!201655 (=> (not res!96429) (not e!132132))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201655 (= res!96429 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8450 () Bool)

(declare-fun mapRes!8450 () Bool)

(declare-fun tp!18226 () Bool)

(assert (=> mapNonEmpty!8450 (= mapRes!8450 (and tp!18226 e!132130))))

(declare-fun mapKey!8450 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2117 0))(
  ( (ValueCellFull!2117 (v!4469 V!6209)) (EmptyCell!2117) )
))
(declare-datatypes ((array!9057 0))(
  ( (array!9058 (arr!4278 (Array (_ BitVec 32) ValueCell!2117)) (size!4604 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9057)

(declare-fun mapValue!8450 () ValueCell!2117)

(declare-fun mapRest!8450 () (Array (_ BitVec 32) ValueCell!2117))

(assert (=> mapNonEmpty!8450 (= (arr!4278 _values!649) (store mapRest!8450 mapKey!8450 mapValue!8450))))

(declare-fun b!201656 () Bool)

(declare-fun res!96430 () Bool)

(assert (=> b!201656 (=> (not res!96430) (not e!132132))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!201656 (= res!96430 (and (= (size!4604 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4603 _keys!825) (size!4604 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!96434 () Bool)

(assert (=> start!20410 (=> (not res!96434) (not e!132132))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20410 (= res!96434 (validMask!0 mask!1149))))

(assert (=> start!20410 e!132132))

(declare-fun e!132129 () Bool)

(declare-fun array_inv!2803 (array!9057) Bool)

(assert (=> start!20410 (and (array_inv!2803 _values!649) e!132129)))

(assert (=> start!20410 true))

(assert (=> start!20410 tp_is_empty!4921))

(declare-fun array_inv!2804 (array!9055) Bool)

(assert (=> start!20410 (array_inv!2804 _keys!825)))

(assert (=> start!20410 tp!18227))

(declare-fun mapIsEmpty!8450 () Bool)

(assert (=> mapIsEmpty!8450 mapRes!8450))

(declare-fun b!201657 () Bool)

(declare-fun res!96431 () Bool)

(assert (=> b!201657 (=> (not res!96431) (not e!132132))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9055 (_ BitVec 32)) Bool)

(assert (=> b!201657 (= res!96431 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!201658 () Bool)

(declare-fun e!132135 () Bool)

(assert (=> b!201658 (= e!132135 tp_is_empty!4921)))

(declare-fun b!201659 () Bool)

(assert (=> b!201659 (= e!132132 (not e!132131))))

(declare-fun res!96432 () Bool)

(assert (=> b!201659 (=> res!96432 e!132131)))

(assert (=> b!201659 (= res!96432 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!911 (array!9055 array!9057 (_ BitVec 32) (_ BitVec 32) V!6209 V!6209 (_ BitVec 32) Int) ListLongMap!2671)

(assert (=> b!201659 (= lt!100680 (getCurrentListMap!911 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!100671 () array!9057)

(assert (=> b!201659 (= lt!100673 (getCurrentListMap!911 _keys!825 lt!100671 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201659 (and (= lt!100667 lt!100677) (= lt!100677 lt!100667))))

(assert (=> b!201659 (= lt!100677 (+!400 lt!100676 lt!100679))))

(assert (=> b!201659 (= lt!100679 (tuple2!3769 k0!843 v!520))))

(declare-fun lt!100672 () Unit!6052)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!70 (array!9055 array!9057 (_ BitVec 32) (_ BitVec 32) V!6209 V!6209 (_ BitVec 32) (_ BitVec 64) V!6209 (_ BitVec 32) Int) Unit!6052)

(assert (=> b!201659 (= lt!100672 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!70 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!321 (array!9055 array!9057 (_ BitVec 32) (_ BitVec 32) V!6209 V!6209 (_ BitVec 32) Int) ListLongMap!2671)

(assert (=> b!201659 (= lt!100667 (getCurrentListMapNoExtraKeys!321 _keys!825 lt!100671 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201659 (= lt!100671 (array!9058 (store (arr!4278 _values!649) i!601 (ValueCellFull!2117 v!520)) (size!4604 _values!649)))))

(assert (=> b!201659 (= lt!100676 (getCurrentListMapNoExtraKeys!321 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201660 () Bool)

(declare-fun res!96426 () Bool)

(assert (=> b!201660 (=> (not res!96426) (not e!132132))))

(assert (=> b!201660 (= res!96426 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4603 _keys!825))))))

(declare-fun b!201661 () Bool)

(declare-fun res!96433 () Bool)

(assert (=> b!201661 (=> (not res!96433) (not e!132132))))

(declare-datatypes ((List!2687 0))(
  ( (Nil!2684) (Cons!2683 (h!3325 (_ BitVec 64)) (t!7609 List!2687)) )
))
(declare-fun arrayNoDuplicates!0 (array!9055 (_ BitVec 32) List!2687) Bool)

(assert (=> b!201661 (= res!96433 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2684))))

(declare-fun b!201662 () Bool)

(assert (=> b!201662 (= e!132129 (and e!132135 mapRes!8450))))

(declare-fun condMapEmpty!8450 () Bool)

(declare-fun mapDefault!8450 () ValueCell!2117)

(assert (=> b!201662 (= condMapEmpty!8450 (= (arr!4278 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2117)) mapDefault!8450)))))

(assert (= (and start!20410 res!96434) b!201656))

(assert (= (and b!201656 res!96430) b!201657))

(assert (= (and b!201657 res!96431) b!201661))

(assert (= (and b!201661 res!96433) b!201660))

(assert (= (and b!201660 res!96426) b!201655))

(assert (= (and b!201655 res!96429) b!201652))

(assert (= (and b!201652 res!96428) b!201659))

(assert (= (and b!201659 (not res!96432)) b!201654))

(assert (= (and b!201654 (not res!96427)) b!201653))

(assert (= (and b!201662 condMapEmpty!8450) mapIsEmpty!8450))

(assert (= (and b!201662 (not condMapEmpty!8450)) mapNonEmpty!8450))

(get-info :version)

(assert (= (and mapNonEmpty!8450 ((_ is ValueCellFull!2117) mapValue!8450)) b!201651))

(assert (= (and b!201662 ((_ is ValueCellFull!2117) mapDefault!8450)) b!201658))

(assert (= start!20410 b!201662))

(declare-fun m!228267 () Bool)

(assert (=> b!201657 m!228267))

(declare-fun m!228269 () Bool)

(assert (=> start!20410 m!228269))

(declare-fun m!228271 () Bool)

(assert (=> start!20410 m!228271))

(declare-fun m!228273 () Bool)

(assert (=> start!20410 m!228273))

(declare-fun m!228275 () Bool)

(assert (=> b!201661 m!228275))

(declare-fun m!228277 () Bool)

(assert (=> b!201659 m!228277))

(declare-fun m!228279 () Bool)

(assert (=> b!201659 m!228279))

(declare-fun m!228281 () Bool)

(assert (=> b!201659 m!228281))

(declare-fun m!228283 () Bool)

(assert (=> b!201659 m!228283))

(declare-fun m!228285 () Bool)

(assert (=> b!201659 m!228285))

(declare-fun m!228287 () Bool)

(assert (=> b!201659 m!228287))

(declare-fun m!228289 () Bool)

(assert (=> b!201659 m!228289))

(declare-fun m!228291 () Bool)

(assert (=> b!201652 m!228291))

(declare-fun m!228293 () Bool)

(assert (=> b!201655 m!228293))

(declare-fun m!228295 () Bool)

(assert (=> b!201654 m!228295))

(declare-fun m!228297 () Bool)

(assert (=> b!201654 m!228297))

(declare-fun m!228299 () Bool)

(assert (=> b!201654 m!228299))

(assert (=> b!201654 m!228299))

(declare-fun m!228301 () Bool)

(assert (=> b!201654 m!228301))

(declare-fun m!228303 () Bool)

(assert (=> b!201654 m!228303))

(declare-fun m!228305 () Bool)

(assert (=> b!201654 m!228305))

(declare-fun m!228307 () Bool)

(assert (=> b!201654 m!228307))

(declare-fun m!228309 () Bool)

(assert (=> b!201654 m!228309))

(declare-fun m!228311 () Bool)

(assert (=> b!201653 m!228311))

(declare-fun m!228313 () Bool)

(assert (=> b!201653 m!228313))

(declare-fun m!228315 () Bool)

(assert (=> b!201653 m!228315))

(declare-fun m!228317 () Bool)

(assert (=> mapNonEmpty!8450 m!228317))

(check-sat (not b!201657) (not start!20410) (not b_next!5065) (not mapNonEmpty!8450) (not b!201654) b_and!11785 tp_is_empty!4921 (not b!201653) (not b!201655) (not b!201661) (not b!201659))
(check-sat b_and!11785 (not b_next!5065))
