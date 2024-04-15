; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20446 () Bool)

(assert start!20446)

(declare-fun b_free!5101 () Bool)

(declare-fun b_next!5101 () Bool)

(assert (=> start!20446 (= b_free!5101 (not b_next!5101))))

(declare-fun tp!18334 () Bool)

(declare-fun b_and!11821 () Bool)

(assert (=> start!20446 (= tp!18334 b_and!11821)))

(declare-fun b!202308 () Bool)

(declare-fun res!96922 () Bool)

(declare-fun e!132507 () Bool)

(assert (=> b!202308 (=> (not res!96922) (not e!132507))))

(declare-datatypes ((array!9127 0))(
  ( (array!9128 (arr!4313 (Array (_ BitVec 32) (_ BitVec 64))) (size!4639 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9127)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9127 (_ BitVec 32)) Bool)

(assert (=> b!202308 (= res!96922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202309 () Bool)

(declare-fun e!132512 () Bool)

(declare-fun e!132509 () Bool)

(declare-fun mapRes!8504 () Bool)

(assert (=> b!202309 (= e!132512 (and e!132509 mapRes!8504))))

(declare-fun condMapEmpty!8504 () Bool)

(declare-datatypes ((V!6257 0))(
  ( (V!6258 (val!2523 Int)) )
))
(declare-datatypes ((ValueCell!2135 0))(
  ( (ValueCellFull!2135 (v!4487 V!6257)) (EmptyCell!2135) )
))
(declare-datatypes ((array!9129 0))(
  ( (array!9130 (arr!4314 (Array (_ BitVec 32) ValueCell!2135)) (size!4640 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9129)

(declare-fun mapDefault!8504 () ValueCell!2135)

(assert (=> b!202309 (= condMapEmpty!8504 (= (arr!4314 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2135)) mapDefault!8504)))))

(declare-fun b!202310 () Bool)

(declare-fun res!96925 () Bool)

(assert (=> b!202310 (=> (not res!96925) (not e!132507))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202310 (= res!96925 (validKeyInArray!0 k0!843))))

(declare-fun b!202311 () Bool)

(declare-fun e!132513 () Bool)

(assert (=> b!202311 (= e!132513 true)))

(declare-datatypes ((tuple2!3800 0))(
  ( (tuple2!3801 (_1!1911 (_ BitVec 64)) (_2!1911 V!6257)) )
))
(declare-datatypes ((List!2714 0))(
  ( (Nil!2711) (Cons!2710 (h!3352 tuple2!3800) (t!7636 List!2714)) )
))
(declare-datatypes ((ListLongMap!2703 0))(
  ( (ListLongMap!2704 (toList!1367 List!2714)) )
))
(declare-fun lt!101453 () ListLongMap!2703)

(declare-fun lt!101451 () ListLongMap!2703)

(declare-fun lt!101459 () tuple2!3800)

(declare-fun +!416 (ListLongMap!2703 tuple2!3800) ListLongMap!2703)

(assert (=> b!202311 (= lt!101453 (+!416 lt!101451 lt!101459))))

(declare-datatypes ((Unit!6084 0))(
  ( (Unit!6085) )
))
(declare-fun lt!101460 () Unit!6084)

(declare-fun v!520 () V!6257)

(declare-fun zeroValue!615 () V!6257)

(declare-fun lt!101458 () ListLongMap!2703)

(declare-fun addCommutativeForDiffKeys!122 (ListLongMap!2703 (_ BitVec 64) V!6257 (_ BitVec 64) V!6257) Unit!6084)

(assert (=> b!202311 (= lt!101460 (addCommutativeForDiffKeys!122 lt!101458 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!202312 () Bool)

(declare-fun e!132510 () Bool)

(assert (=> b!202312 (= e!132510 e!132513)))

(declare-fun res!96926 () Bool)

(assert (=> b!202312 (=> res!96926 e!132513)))

(assert (=> b!202312 (= res!96926 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101452 () ListLongMap!2703)

(assert (=> b!202312 (= lt!101452 lt!101453)))

(declare-fun lt!101461 () ListLongMap!2703)

(declare-fun lt!101457 () tuple2!3800)

(assert (=> b!202312 (= lt!101453 (+!416 lt!101461 lt!101457))))

(declare-fun lt!101462 () ListLongMap!2703)

(assert (=> b!202312 (= lt!101462 lt!101451)))

(assert (=> b!202312 (= lt!101451 (+!416 lt!101458 lt!101457))))

(declare-fun lt!101456 () ListLongMap!2703)

(assert (=> b!202312 (= lt!101452 (+!416 lt!101456 lt!101457))))

(assert (=> b!202312 (= lt!101457 (tuple2!3801 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun res!96928 () Bool)

(assert (=> start!20446 (=> (not res!96928) (not e!132507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20446 (= res!96928 (validMask!0 mask!1149))))

(assert (=> start!20446 e!132507))

(declare-fun array_inv!2831 (array!9129) Bool)

(assert (=> start!20446 (and (array_inv!2831 _values!649) e!132512)))

(assert (=> start!20446 true))

(declare-fun tp_is_empty!4957 () Bool)

(assert (=> start!20446 tp_is_empty!4957))

(declare-fun array_inv!2832 (array!9127) Bool)

(assert (=> start!20446 (array_inv!2832 _keys!825)))

(assert (=> start!20446 tp!18334))

(declare-fun b!202313 () Bool)

(assert (=> b!202313 (= e!132507 (not e!132510))))

(declare-fun res!96927 () Bool)

(assert (=> b!202313 (=> res!96927 e!132510)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202313 (= res!96927 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6257)

(declare-fun getCurrentListMap!923 (array!9127 array!9129 (_ BitVec 32) (_ BitVec 32) V!6257 V!6257 (_ BitVec 32) Int) ListLongMap!2703)

(assert (=> b!202313 (= lt!101462 (getCurrentListMap!923 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101454 () array!9129)

(assert (=> b!202313 (= lt!101452 (getCurrentListMap!923 _keys!825 lt!101454 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202313 (and (= lt!101456 lt!101461) (= lt!101461 lt!101456))))

(assert (=> b!202313 (= lt!101461 (+!416 lt!101458 lt!101459))))

(assert (=> b!202313 (= lt!101459 (tuple2!3801 k0!843 v!520))))

(declare-fun lt!101455 () Unit!6084)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!82 (array!9127 array!9129 (_ BitVec 32) (_ BitVec 32) V!6257 V!6257 (_ BitVec 32) (_ BitVec 64) V!6257 (_ BitVec 32) Int) Unit!6084)

(assert (=> b!202313 (= lt!101455 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!82 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!333 (array!9127 array!9129 (_ BitVec 32) (_ BitVec 32) V!6257 V!6257 (_ BitVec 32) Int) ListLongMap!2703)

(assert (=> b!202313 (= lt!101456 (getCurrentListMapNoExtraKeys!333 _keys!825 lt!101454 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202313 (= lt!101454 (array!9130 (store (arr!4314 _values!649) i!601 (ValueCellFull!2135 v!520)) (size!4640 _values!649)))))

(assert (=> b!202313 (= lt!101458 (getCurrentListMapNoExtraKeys!333 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8504 () Bool)

(assert (=> mapIsEmpty!8504 mapRes!8504))

(declare-fun b!202314 () Bool)

(declare-fun res!96923 () Bool)

(assert (=> b!202314 (=> (not res!96923) (not e!132507))))

(assert (=> b!202314 (= res!96923 (and (= (size!4640 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4639 _keys!825) (size!4640 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8504 () Bool)

(declare-fun tp!18335 () Bool)

(declare-fun e!132511 () Bool)

(assert (=> mapNonEmpty!8504 (= mapRes!8504 (and tp!18335 e!132511))))

(declare-fun mapValue!8504 () ValueCell!2135)

(declare-fun mapKey!8504 () (_ BitVec 32))

(declare-fun mapRest!8504 () (Array (_ BitVec 32) ValueCell!2135))

(assert (=> mapNonEmpty!8504 (= (arr!4314 _values!649) (store mapRest!8504 mapKey!8504 mapValue!8504))))

(declare-fun b!202315 () Bool)

(declare-fun res!96929 () Bool)

(assert (=> b!202315 (=> (not res!96929) (not e!132507))))

(assert (=> b!202315 (= res!96929 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4639 _keys!825))))))

(declare-fun b!202316 () Bool)

(assert (=> b!202316 (= e!132511 tp_is_empty!4957)))

(declare-fun b!202317 () Bool)

(assert (=> b!202317 (= e!132509 tp_is_empty!4957)))

(declare-fun b!202318 () Bool)

(declare-fun res!96924 () Bool)

(assert (=> b!202318 (=> (not res!96924) (not e!132507))))

(assert (=> b!202318 (= res!96924 (= (select (arr!4313 _keys!825) i!601) k0!843))))

(declare-fun b!202319 () Bool)

(declare-fun res!96921 () Bool)

(assert (=> b!202319 (=> (not res!96921) (not e!132507))))

(declare-datatypes ((List!2715 0))(
  ( (Nil!2712) (Cons!2711 (h!3353 (_ BitVec 64)) (t!7637 List!2715)) )
))
(declare-fun arrayNoDuplicates!0 (array!9127 (_ BitVec 32) List!2715) Bool)

(assert (=> b!202319 (= res!96921 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2712))))

(assert (= (and start!20446 res!96928) b!202314))

(assert (= (and b!202314 res!96923) b!202308))

(assert (= (and b!202308 res!96922) b!202319))

(assert (= (and b!202319 res!96921) b!202315))

(assert (= (and b!202315 res!96929) b!202310))

(assert (= (and b!202310 res!96925) b!202318))

(assert (= (and b!202318 res!96924) b!202313))

(assert (= (and b!202313 (not res!96927)) b!202312))

(assert (= (and b!202312 (not res!96926)) b!202311))

(assert (= (and b!202309 condMapEmpty!8504) mapIsEmpty!8504))

(assert (= (and b!202309 (not condMapEmpty!8504)) mapNonEmpty!8504))

(get-info :version)

(assert (= (and mapNonEmpty!8504 ((_ is ValueCellFull!2135) mapValue!8504)) b!202316))

(assert (= (and b!202309 ((_ is ValueCellFull!2135) mapDefault!8504)) b!202317))

(assert (= start!20446 b!202309))

(declare-fun m!229155 () Bool)

(assert (=> mapNonEmpty!8504 m!229155))

(declare-fun m!229157 () Bool)

(assert (=> b!202312 m!229157))

(declare-fun m!229159 () Bool)

(assert (=> b!202312 m!229159))

(declare-fun m!229161 () Bool)

(assert (=> b!202312 m!229161))

(declare-fun m!229163 () Bool)

(assert (=> b!202318 m!229163))

(declare-fun m!229165 () Bool)

(assert (=> b!202310 m!229165))

(declare-fun m!229167 () Bool)

(assert (=> b!202313 m!229167))

(declare-fun m!229169 () Bool)

(assert (=> b!202313 m!229169))

(declare-fun m!229171 () Bool)

(assert (=> b!202313 m!229171))

(declare-fun m!229173 () Bool)

(assert (=> b!202313 m!229173))

(declare-fun m!229175 () Bool)

(assert (=> b!202313 m!229175))

(declare-fun m!229177 () Bool)

(assert (=> b!202313 m!229177))

(declare-fun m!229179 () Bool)

(assert (=> b!202313 m!229179))

(declare-fun m!229181 () Bool)

(assert (=> b!202311 m!229181))

(declare-fun m!229183 () Bool)

(assert (=> b!202311 m!229183))

(declare-fun m!229185 () Bool)

(assert (=> start!20446 m!229185))

(declare-fun m!229187 () Bool)

(assert (=> start!20446 m!229187))

(declare-fun m!229189 () Bool)

(assert (=> start!20446 m!229189))

(declare-fun m!229191 () Bool)

(assert (=> b!202308 m!229191))

(declare-fun m!229193 () Bool)

(assert (=> b!202319 m!229193))

(check-sat (not b!202312) (not b!202313) tp_is_empty!4957 b_and!11821 (not b_next!5101) (not b!202308) (not b!202319) (not b!202310) (not start!20446) (not mapNonEmpty!8504) (not b!202311))
(check-sat b_and!11821 (not b_next!5101))
