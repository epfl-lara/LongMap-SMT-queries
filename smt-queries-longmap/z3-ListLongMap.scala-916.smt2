; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20596 () Bool)

(assert start!20596)

(declare-fun b_free!5251 () Bool)

(declare-fun b_next!5251 () Bool)

(assert (=> start!20596 (= b_free!5251 (not b_next!5251))))

(declare-fun tp!18784 () Bool)

(declare-fun b_and!11971 () Bool)

(assert (=> start!20596 (= tp!18784 b_and!11971)))

(declare-fun b!205017 () Bool)

(declare-fun e!134088 () Bool)

(declare-fun e!134082 () Bool)

(assert (=> b!205017 (= e!134088 e!134082)))

(declare-fun res!98956 () Bool)

(assert (=> b!205017 (=> res!98956 e!134082)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!205017 (= res!98956 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6457 0))(
  ( (V!6458 (val!2598 Int)) )
))
(declare-datatypes ((tuple2!3924 0))(
  ( (tuple2!3925 (_1!1973 (_ BitVec 64)) (_2!1973 V!6457)) )
))
(declare-datatypes ((List!2826 0))(
  ( (Nil!2823) (Cons!2822 (h!3464 tuple2!3924) (t!7748 List!2826)) )
))
(declare-datatypes ((ListLongMap!2827 0))(
  ( (ListLongMap!2828 (toList!1429 List!2826)) )
))
(declare-fun lt!104118 () ListLongMap!2827)

(declare-fun lt!104121 () ListLongMap!2827)

(assert (=> b!205017 (= lt!104118 lt!104121)))

(declare-fun lt!104126 () ListLongMap!2827)

(declare-fun lt!104124 () tuple2!3924)

(declare-fun +!478 (ListLongMap!2827 tuple2!3924) ListLongMap!2827)

(assert (=> b!205017 (= lt!104121 (+!478 lt!104126 lt!104124))))

(declare-fun lt!104122 () ListLongMap!2827)

(declare-fun lt!104116 () ListLongMap!2827)

(assert (=> b!205017 (= lt!104122 lt!104116)))

(declare-fun lt!104120 () ListLongMap!2827)

(assert (=> b!205017 (= lt!104116 (+!478 lt!104120 lt!104124))))

(declare-fun lt!104119 () ListLongMap!2827)

(assert (=> b!205017 (= lt!104122 (+!478 lt!104119 lt!104124))))

(declare-fun minValue!615 () V!6457)

(assert (=> b!205017 (= lt!104124 (tuple2!3925 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!98957 () Bool)

(declare-fun e!134084 () Bool)

(assert (=> start!20596 (=> (not res!98957) (not e!134084))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20596 (= res!98957 (validMask!0 mask!1149))))

(assert (=> start!20596 e!134084))

(declare-datatypes ((ValueCell!2210 0))(
  ( (ValueCellFull!2210 (v!4562 V!6457)) (EmptyCell!2210) )
))
(declare-datatypes ((array!9415 0))(
  ( (array!9416 (arr!4457 (Array (_ BitVec 32) ValueCell!2210)) (size!4783 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9415)

(declare-fun e!134083 () Bool)

(declare-fun array_inv!2931 (array!9415) Bool)

(assert (=> start!20596 (and (array_inv!2931 _values!649) e!134083)))

(assert (=> start!20596 true))

(declare-fun tp_is_empty!5107 () Bool)

(assert (=> start!20596 tp_is_empty!5107))

(declare-datatypes ((array!9417 0))(
  ( (array!9418 (arr!4458 (Array (_ BitVec 32) (_ BitVec 64))) (size!4784 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9417)

(declare-fun array_inv!2932 (array!9417) Bool)

(assert (=> start!20596 (array_inv!2932 _keys!825)))

(assert (=> start!20596 tp!18784))

(declare-fun b!205018 () Bool)

(declare-fun res!98963 () Bool)

(assert (=> b!205018 (=> (not res!98963) (not e!134084))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205018 (= res!98963 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4784 _keys!825))))))

(declare-fun b!205019 () Bool)

(declare-fun res!98959 () Bool)

(assert (=> b!205019 (=> (not res!98959) (not e!134084))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205019 (= res!98959 (and (= (size!4783 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4784 _keys!825) (size!4783 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205020 () Bool)

(declare-fun e!134086 () Bool)

(assert (=> b!205020 (= e!134086 tp_is_empty!5107)))

(declare-fun b!205021 () Bool)

(declare-fun res!98961 () Bool)

(assert (=> b!205021 (=> (not res!98961) (not e!134084))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205021 (= res!98961 (validKeyInArray!0 k0!843))))

(declare-fun b!205022 () Bool)

(declare-fun res!98955 () Bool)

(assert (=> b!205022 (=> (not res!98955) (not e!134084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9417 (_ BitVec 32)) Bool)

(assert (=> b!205022 (= res!98955 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205023 () Bool)

(assert (=> b!205023 (= e!134084 (not e!134088))))

(declare-fun res!98962 () Bool)

(assert (=> b!205023 (=> res!98962 e!134088)))

(assert (=> b!205023 (= res!98962 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6457)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!974 (array!9417 array!9415 (_ BitVec 32) (_ BitVec 32) V!6457 V!6457 (_ BitVec 32) Int) ListLongMap!2827)

(assert (=> b!205023 (= lt!104118 (getCurrentListMap!974 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104125 () array!9415)

(assert (=> b!205023 (= lt!104122 (getCurrentListMap!974 _keys!825 lt!104125 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205023 (and (= lt!104119 lt!104120) (= lt!104120 lt!104119))))

(declare-fun lt!104115 () tuple2!3924)

(assert (=> b!205023 (= lt!104120 (+!478 lt!104126 lt!104115))))

(declare-fun v!520 () V!6457)

(assert (=> b!205023 (= lt!104115 (tuple2!3925 k0!843 v!520))))

(declare-datatypes ((Unit!6198 0))(
  ( (Unit!6199) )
))
(declare-fun lt!104117 () Unit!6198)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!133 (array!9417 array!9415 (_ BitVec 32) (_ BitVec 32) V!6457 V!6457 (_ BitVec 32) (_ BitVec 64) V!6457 (_ BitVec 32) Int) Unit!6198)

(assert (=> b!205023 (= lt!104117 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!133 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!384 (array!9417 array!9415 (_ BitVec 32) (_ BitVec 32) V!6457 V!6457 (_ BitVec 32) Int) ListLongMap!2827)

(assert (=> b!205023 (= lt!104119 (getCurrentListMapNoExtraKeys!384 _keys!825 lt!104125 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205023 (= lt!104125 (array!9416 (store (arr!4457 _values!649) i!601 (ValueCellFull!2210 v!520)) (size!4783 _values!649)))))

(assert (=> b!205023 (= lt!104126 (getCurrentListMapNoExtraKeys!384 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8729 () Bool)

(declare-fun mapRes!8729 () Bool)

(assert (=> mapIsEmpty!8729 mapRes!8729))

(declare-fun b!205024 () Bool)

(assert (=> b!205024 (= e!134083 (and e!134086 mapRes!8729))))

(declare-fun condMapEmpty!8729 () Bool)

(declare-fun mapDefault!8729 () ValueCell!2210)

(assert (=> b!205024 (= condMapEmpty!8729 (= (arr!4457 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2210)) mapDefault!8729)))))

(declare-fun mapNonEmpty!8729 () Bool)

(declare-fun tp!18785 () Bool)

(declare-fun e!134085 () Bool)

(assert (=> mapNonEmpty!8729 (= mapRes!8729 (and tp!18785 e!134085))))

(declare-fun mapKey!8729 () (_ BitVec 32))

(declare-fun mapValue!8729 () ValueCell!2210)

(declare-fun mapRest!8729 () (Array (_ BitVec 32) ValueCell!2210))

(assert (=> mapNonEmpty!8729 (= (arr!4457 _values!649) (store mapRest!8729 mapKey!8729 mapValue!8729))))

(declare-fun b!205025 () Bool)

(declare-fun res!98960 () Bool)

(assert (=> b!205025 (=> (not res!98960) (not e!134084))))

(assert (=> b!205025 (= res!98960 (= (select (arr!4458 _keys!825) i!601) k0!843))))

(declare-fun b!205026 () Bool)

(assert (=> b!205026 (= e!134082 true)))

(assert (=> b!205026 (= lt!104116 (+!478 lt!104121 lt!104115))))

(declare-fun lt!104123 () Unit!6198)

(declare-fun addCommutativeForDiffKeys!167 (ListLongMap!2827 (_ BitVec 64) V!6457 (_ BitVec 64) V!6457) Unit!6198)

(assert (=> b!205026 (= lt!104123 (addCommutativeForDiffKeys!167 lt!104126 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205027 () Bool)

(declare-fun res!98958 () Bool)

(assert (=> b!205027 (=> (not res!98958) (not e!134084))))

(declare-datatypes ((List!2827 0))(
  ( (Nil!2824) (Cons!2823 (h!3465 (_ BitVec 64)) (t!7749 List!2827)) )
))
(declare-fun arrayNoDuplicates!0 (array!9417 (_ BitVec 32) List!2827) Bool)

(assert (=> b!205027 (= res!98958 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2824))))

(declare-fun b!205028 () Bool)

(assert (=> b!205028 (= e!134085 tp_is_empty!5107)))

(assert (= (and start!20596 res!98957) b!205019))

(assert (= (and b!205019 res!98959) b!205022))

(assert (= (and b!205022 res!98955) b!205027))

(assert (= (and b!205027 res!98958) b!205018))

(assert (= (and b!205018 res!98963) b!205021))

(assert (= (and b!205021 res!98961) b!205025))

(assert (= (and b!205025 res!98960) b!205023))

(assert (= (and b!205023 (not res!98962)) b!205017))

(assert (= (and b!205017 (not res!98956)) b!205026))

(assert (= (and b!205024 condMapEmpty!8729) mapIsEmpty!8729))

(assert (= (and b!205024 (not condMapEmpty!8729)) mapNonEmpty!8729))

(get-info :version)

(assert (= (and mapNonEmpty!8729 ((_ is ValueCellFull!2210) mapValue!8729)) b!205028))

(assert (= (and b!205024 ((_ is ValueCellFull!2210) mapDefault!8729)) b!205020))

(assert (= start!20596 b!205024))

(declare-fun m!232143 () Bool)

(assert (=> b!205025 m!232143))

(declare-fun m!232145 () Bool)

(assert (=> b!205027 m!232145))

(declare-fun m!232147 () Bool)

(assert (=> b!205023 m!232147))

(declare-fun m!232149 () Bool)

(assert (=> b!205023 m!232149))

(declare-fun m!232151 () Bool)

(assert (=> b!205023 m!232151))

(declare-fun m!232153 () Bool)

(assert (=> b!205023 m!232153))

(declare-fun m!232155 () Bool)

(assert (=> b!205023 m!232155))

(declare-fun m!232157 () Bool)

(assert (=> b!205023 m!232157))

(declare-fun m!232159 () Bool)

(assert (=> b!205023 m!232159))

(declare-fun m!232161 () Bool)

(assert (=> start!20596 m!232161))

(declare-fun m!232163 () Bool)

(assert (=> start!20596 m!232163))

(declare-fun m!232165 () Bool)

(assert (=> start!20596 m!232165))

(declare-fun m!232167 () Bool)

(assert (=> b!205017 m!232167))

(declare-fun m!232169 () Bool)

(assert (=> b!205017 m!232169))

(declare-fun m!232171 () Bool)

(assert (=> b!205017 m!232171))

(declare-fun m!232173 () Bool)

(assert (=> b!205026 m!232173))

(declare-fun m!232175 () Bool)

(assert (=> b!205026 m!232175))

(declare-fun m!232177 () Bool)

(assert (=> mapNonEmpty!8729 m!232177))

(declare-fun m!232179 () Bool)

(assert (=> b!205021 m!232179))

(declare-fun m!232181 () Bool)

(assert (=> b!205022 m!232181))

(check-sat (not b!205022) (not b!205023) (not b!205027) (not start!20596) (not b!205021) (not mapNonEmpty!8729) b_and!11971 (not b_next!5251) (not b!205026) tp_is_empty!5107 (not b!205017))
(check-sat b_and!11971 (not b_next!5251))
