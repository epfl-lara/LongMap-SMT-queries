; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20464 () Bool)

(assert start!20464)

(declare-fun b_free!5119 () Bool)

(declare-fun b_next!5119 () Bool)

(assert (=> start!20464 (= b_free!5119 (not b_next!5119))))

(declare-fun tp!18389 () Bool)

(declare-fun b_and!11879 () Bool)

(assert (=> start!20464 (= tp!18389 b_and!11879)))

(declare-fun mapNonEmpty!8531 () Bool)

(declare-fun mapRes!8531 () Bool)

(declare-fun tp!18388 () Bool)

(declare-fun e!132824 () Bool)

(assert (=> mapNonEmpty!8531 (= mapRes!8531 (and tp!18388 e!132824))))

(declare-datatypes ((V!6281 0))(
  ( (V!6282 (val!2532 Int)) )
))
(declare-datatypes ((ValueCell!2144 0))(
  ( (ValueCellFull!2144 (v!4503 V!6281)) (EmptyCell!2144) )
))
(declare-datatypes ((array!9163 0))(
  ( (array!9164 (arr!4332 (Array (_ BitVec 32) ValueCell!2144)) (size!4657 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9163)

(declare-fun mapRest!8531 () (Array (_ BitVec 32) ValueCell!2144))

(declare-fun mapKey!8531 () (_ BitVec 32))

(declare-fun mapValue!8531 () ValueCell!2144)

(assert (=> mapNonEmpty!8531 (= (arr!4332 _values!649) (store mapRest!8531 mapKey!8531 mapValue!8531))))

(declare-fun b!202826 () Bool)

(declare-fun e!132827 () Bool)

(declare-fun tp_is_empty!4975 () Bool)

(assert (=> b!202826 (= e!132827 tp_is_empty!4975)))

(declare-fun b!202827 () Bool)

(declare-fun e!132823 () Bool)

(declare-fun e!132826 () Bool)

(assert (=> b!202827 (= e!132823 e!132826)))

(declare-fun res!97288 () Bool)

(assert (=> b!202827 (=> res!97288 e!132826)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!202827 (= res!97288 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3776 0))(
  ( (tuple2!3777 (_1!1899 (_ BitVec 64)) (_2!1899 V!6281)) )
))
(declare-datatypes ((List!2679 0))(
  ( (Nil!2676) (Cons!2675 (h!3317 tuple2!3776) (t!7602 List!2679)) )
))
(declare-datatypes ((ListLongMap!2691 0))(
  ( (ListLongMap!2692 (toList!1361 List!2679)) )
))
(declare-fun lt!102016 () ListLongMap!2691)

(declare-fun lt!102017 () ListLongMap!2691)

(assert (=> b!202827 (= lt!102016 lt!102017)))

(declare-fun lt!102025 () ListLongMap!2691)

(declare-fun lt!102026 () tuple2!3776)

(declare-fun +!415 (ListLongMap!2691 tuple2!3776) ListLongMap!2691)

(assert (=> b!202827 (= lt!102017 (+!415 lt!102025 lt!102026))))

(declare-fun lt!102024 () ListLongMap!2691)

(declare-fun lt!102020 () ListLongMap!2691)

(assert (=> b!202827 (= lt!102024 lt!102020)))

(declare-fun lt!102019 () ListLongMap!2691)

(assert (=> b!202827 (= lt!102020 (+!415 lt!102019 lt!102026))))

(declare-fun lt!102021 () ListLongMap!2691)

(assert (=> b!202827 (= lt!102016 (+!415 lt!102021 lt!102026))))

(declare-fun zeroValue!615 () V!6281)

(assert (=> b!202827 (= lt!102026 (tuple2!3777 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!97285 () Bool)

(declare-fun e!132822 () Bool)

(assert (=> start!20464 (=> (not res!97285) (not e!132822))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20464 (= res!97285 (validMask!0 mask!1149))))

(assert (=> start!20464 e!132822))

(declare-fun e!132825 () Bool)

(declare-fun array_inv!2829 (array!9163) Bool)

(assert (=> start!20464 (and (array_inv!2829 _values!649) e!132825)))

(assert (=> start!20464 true))

(assert (=> start!20464 tp_is_empty!4975))

(declare-datatypes ((array!9165 0))(
  ( (array!9166 (arr!4333 (Array (_ BitVec 32) (_ BitVec 64))) (size!4658 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9165)

(declare-fun array_inv!2830 (array!9165) Bool)

(assert (=> start!20464 (array_inv!2830 _keys!825)))

(assert (=> start!20464 tp!18389))

(declare-fun b!202828 () Bool)

(declare-fun res!97282 () Bool)

(assert (=> b!202828 (=> (not res!97282) (not e!132822))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!202828 (= res!97282 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4658 _keys!825))))))

(declare-fun b!202829 () Bool)

(declare-fun res!97280 () Bool)

(assert (=> b!202829 (=> (not res!97280) (not e!132822))))

(assert (=> b!202829 (= res!97280 (= (select (arr!4333 _keys!825) i!601) k0!843))))

(declare-fun b!202830 () Bool)

(declare-fun res!97286 () Bool)

(assert (=> b!202830 (=> (not res!97286) (not e!132822))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202830 (= res!97286 (validKeyInArray!0 k0!843))))

(declare-fun b!202831 () Bool)

(declare-fun res!97283 () Bool)

(assert (=> b!202831 (=> (not res!97283) (not e!132822))))

(declare-datatypes ((List!2680 0))(
  ( (Nil!2677) (Cons!2676 (h!3318 (_ BitVec 64)) (t!7603 List!2680)) )
))
(declare-fun arrayNoDuplicates!0 (array!9165 (_ BitVec 32) List!2680) Bool)

(assert (=> b!202831 (= res!97283 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2677))))

(declare-fun b!202832 () Bool)

(assert (=> b!202832 (= e!132825 (and e!132827 mapRes!8531))))

(declare-fun condMapEmpty!8531 () Bool)

(declare-fun mapDefault!8531 () ValueCell!2144)

(assert (=> b!202832 (= condMapEmpty!8531 (= (arr!4332 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2144)) mapDefault!8531)))))

(declare-fun mapIsEmpty!8531 () Bool)

(assert (=> mapIsEmpty!8531 mapRes!8531))

(declare-fun b!202833 () Bool)

(declare-fun res!97281 () Bool)

(assert (=> b!202833 (=> (not res!97281) (not e!132822))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202833 (= res!97281 (and (= (size!4657 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4658 _keys!825) (size!4657 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202834 () Bool)

(assert (=> b!202834 (= e!132826 true)))

(declare-fun lt!102015 () tuple2!3776)

(assert (=> b!202834 (= lt!102017 (+!415 lt!102020 lt!102015))))

(declare-datatypes ((Unit!6114 0))(
  ( (Unit!6115) )
))
(declare-fun lt!102023 () Unit!6114)

(declare-fun v!520 () V!6281)

(declare-fun addCommutativeForDiffKeys!134 (ListLongMap!2691 (_ BitVec 64) V!6281 (_ BitVec 64) V!6281) Unit!6114)

(assert (=> b!202834 (= lt!102023 (addCommutativeForDiffKeys!134 lt!102019 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202835 () Bool)

(assert (=> b!202835 (= e!132824 tp_is_empty!4975)))

(declare-fun b!202836 () Bool)

(declare-fun res!97287 () Bool)

(assert (=> b!202836 (=> (not res!97287) (not e!132822))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9165 (_ BitVec 32)) Bool)

(assert (=> b!202836 (= res!97287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202837 () Bool)

(assert (=> b!202837 (= e!132822 (not e!132823))))

(declare-fun res!97284 () Bool)

(assert (=> b!202837 (=> res!97284 e!132823)))

(assert (=> b!202837 (= res!97284 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6281)

(declare-fun getCurrentListMap!944 (array!9165 array!9163 (_ BitVec 32) (_ BitVec 32) V!6281 V!6281 (_ BitVec 32) Int) ListLongMap!2691)

(assert (=> b!202837 (= lt!102024 (getCurrentListMap!944 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102022 () array!9163)

(assert (=> b!202837 (= lt!102016 (getCurrentListMap!944 _keys!825 lt!102022 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202837 (and (= lt!102021 lt!102025) (= lt!102025 lt!102021))))

(assert (=> b!202837 (= lt!102025 (+!415 lt!102019 lt!102015))))

(assert (=> b!202837 (= lt!102015 (tuple2!3777 k0!843 v!520))))

(declare-fun lt!102018 () Unit!6114)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!80 (array!9165 array!9163 (_ BitVec 32) (_ BitVec 32) V!6281 V!6281 (_ BitVec 32) (_ BitVec 64) V!6281 (_ BitVec 32) Int) Unit!6114)

(assert (=> b!202837 (= lt!102018 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!80 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!337 (array!9165 array!9163 (_ BitVec 32) (_ BitVec 32) V!6281 V!6281 (_ BitVec 32) Int) ListLongMap!2691)

(assert (=> b!202837 (= lt!102021 (getCurrentListMapNoExtraKeys!337 _keys!825 lt!102022 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202837 (= lt!102022 (array!9164 (store (arr!4332 _values!649) i!601 (ValueCellFull!2144 v!520)) (size!4657 _values!649)))))

(assert (=> b!202837 (= lt!102019 (getCurrentListMapNoExtraKeys!337 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (= (and start!20464 res!97285) b!202833))

(assert (= (and b!202833 res!97281) b!202836))

(assert (= (and b!202836 res!97287) b!202831))

(assert (= (and b!202831 res!97283) b!202828))

(assert (= (and b!202828 res!97282) b!202830))

(assert (= (and b!202830 res!97286) b!202829))

(assert (= (and b!202829 res!97280) b!202837))

(assert (= (and b!202837 (not res!97284)) b!202827))

(assert (= (and b!202827 (not res!97288)) b!202834))

(assert (= (and b!202832 condMapEmpty!8531) mapIsEmpty!8531))

(assert (= (and b!202832 (not condMapEmpty!8531)) mapNonEmpty!8531))

(get-info :version)

(assert (= (and mapNonEmpty!8531 ((_ is ValueCellFull!2144) mapValue!8531)) b!202835))

(assert (= (and b!202832 ((_ is ValueCellFull!2144) mapDefault!8531)) b!202826))

(assert (= start!20464 b!202832))

(declare-fun m!230313 () Bool)

(assert (=> start!20464 m!230313))

(declare-fun m!230315 () Bool)

(assert (=> start!20464 m!230315))

(declare-fun m!230317 () Bool)

(assert (=> start!20464 m!230317))

(declare-fun m!230319 () Bool)

(assert (=> b!202830 m!230319))

(declare-fun m!230321 () Bool)

(assert (=> b!202829 m!230321))

(declare-fun m!230323 () Bool)

(assert (=> mapNonEmpty!8531 m!230323))

(declare-fun m!230325 () Bool)

(assert (=> b!202827 m!230325))

(declare-fun m!230327 () Bool)

(assert (=> b!202827 m!230327))

(declare-fun m!230329 () Bool)

(assert (=> b!202827 m!230329))

(declare-fun m!230331 () Bool)

(assert (=> b!202836 m!230331))

(declare-fun m!230333 () Bool)

(assert (=> b!202834 m!230333))

(declare-fun m!230335 () Bool)

(assert (=> b!202834 m!230335))

(declare-fun m!230337 () Bool)

(assert (=> b!202831 m!230337))

(declare-fun m!230339 () Bool)

(assert (=> b!202837 m!230339))

(declare-fun m!230341 () Bool)

(assert (=> b!202837 m!230341))

(declare-fun m!230343 () Bool)

(assert (=> b!202837 m!230343))

(declare-fun m!230345 () Bool)

(assert (=> b!202837 m!230345))

(declare-fun m!230347 () Bool)

(assert (=> b!202837 m!230347))

(declare-fun m!230349 () Bool)

(assert (=> b!202837 m!230349))

(declare-fun m!230351 () Bool)

(assert (=> b!202837 m!230351))

(check-sat (not start!20464) (not b!202836) (not b!202837) tp_is_empty!4975 (not b_next!5119) (not b!202834) b_and!11879 (not b!202831) (not mapNonEmpty!8531) (not b!202827) (not b!202830))
(check-sat b_and!11879 (not b_next!5119))
