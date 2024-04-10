; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20516 () Bool)

(assert start!20516)

(declare-fun b_free!5175 () Bool)

(declare-fun b_next!5175 () Bool)

(assert (=> start!20516 (= b_free!5175 (not b_next!5175))))

(declare-fun tp!18556 () Bool)

(declare-fun b_and!11921 () Bool)

(assert (=> start!20516 (= tp!18556 b_and!11921)))

(declare-fun b!203787 () Bool)

(declare-fun e!133391 () Bool)

(declare-fun e!133387 () Bool)

(assert (=> b!203787 (= e!133391 e!133387)))

(declare-fun res!98018 () Bool)

(assert (=> b!203787 (=> res!98018 e!133387)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203787 (= res!98018 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6355 0))(
  ( (V!6356 (val!2560 Int)) )
))
(declare-datatypes ((tuple2!3884 0))(
  ( (tuple2!3885 (_1!1953 (_ BitVec 64)) (_2!1953 V!6355)) )
))
(declare-datatypes ((List!2784 0))(
  ( (Nil!2781) (Cons!2780 (h!3422 tuple2!3884) (t!7715 List!2784)) )
))
(declare-datatypes ((ListLongMap!2797 0))(
  ( (ListLongMap!2798 (toList!1414 List!2784)) )
))
(declare-fun lt!102964 () ListLongMap!2797)

(declare-fun lt!102966 () ListLongMap!2797)

(assert (=> b!203787 (= lt!102964 lt!102966)))

(declare-fun lt!102968 () ListLongMap!2797)

(declare-fun lt!102975 () tuple2!3884)

(declare-fun +!441 (ListLongMap!2797 tuple2!3884) ListLongMap!2797)

(assert (=> b!203787 (= lt!102966 (+!441 lt!102968 lt!102975))))

(declare-fun lt!102971 () ListLongMap!2797)

(declare-fun lt!102972 () ListLongMap!2797)

(assert (=> b!203787 (= lt!102971 lt!102972)))

(declare-fun lt!102967 () ListLongMap!2797)

(assert (=> b!203787 (= lt!102972 (+!441 lt!102967 lt!102975))))

(declare-fun lt!102970 () ListLongMap!2797)

(assert (=> b!203787 (= lt!102964 (+!441 lt!102970 lt!102975))))

(declare-fun zeroValue!615 () V!6355)

(assert (=> b!203787 (= lt!102975 (tuple2!3885 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203788 () Bool)

(declare-fun res!98019 () Bool)

(declare-fun e!133386 () Bool)

(assert (=> b!203788 (=> (not res!98019) (not e!133386))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9285 0))(
  ( (array!9286 (arr!4393 (Array (_ BitVec 32) (_ BitVec 64))) (size!4718 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9285)

(assert (=> b!203788 (= res!98019 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4718 _keys!825))))))

(declare-fun mapNonEmpty!8615 () Bool)

(declare-fun mapRes!8615 () Bool)

(declare-fun tp!18557 () Bool)

(declare-fun e!133390 () Bool)

(assert (=> mapNonEmpty!8615 (= mapRes!8615 (and tp!18557 e!133390))))

(declare-fun mapKey!8615 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2172 0))(
  ( (ValueCellFull!2172 (v!4530 V!6355)) (EmptyCell!2172) )
))
(declare-fun mapRest!8615 () (Array (_ BitVec 32) ValueCell!2172))

(declare-datatypes ((array!9287 0))(
  ( (array!9288 (arr!4394 (Array (_ BitVec 32) ValueCell!2172)) (size!4719 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9287)

(declare-fun mapValue!8615 () ValueCell!2172)

(assert (=> mapNonEmpty!8615 (= (arr!4394 _values!649) (store mapRest!8615 mapKey!8615 mapValue!8615))))

(declare-fun b!203789 () Bool)

(declare-fun res!98022 () Bool)

(assert (=> b!203789 (=> (not res!98022) (not e!133386))))

(assert (=> b!203789 (= res!98022 (= (select (arr!4393 _keys!825) i!601) k0!843))))

(declare-fun b!203790 () Bool)

(declare-fun res!98017 () Bool)

(assert (=> b!203790 (=> (not res!98017) (not e!133386))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9285 (_ BitVec 32)) Bool)

(assert (=> b!203790 (= res!98017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203791 () Bool)

(declare-fun tp_is_empty!5031 () Bool)

(assert (=> b!203791 (= e!133390 tp_is_empty!5031)))

(declare-fun res!98021 () Bool)

(assert (=> start!20516 (=> (not res!98021) (not e!133386))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20516 (= res!98021 (validMask!0 mask!1149))))

(assert (=> start!20516 e!133386))

(declare-fun e!133385 () Bool)

(declare-fun array_inv!2901 (array!9287) Bool)

(assert (=> start!20516 (and (array_inv!2901 _values!649) e!133385)))

(assert (=> start!20516 true))

(assert (=> start!20516 tp_is_empty!5031))

(declare-fun array_inv!2902 (array!9285) Bool)

(assert (=> start!20516 (array_inv!2902 _keys!825)))

(assert (=> start!20516 tp!18556))

(declare-fun b!203792 () Bool)

(assert (=> b!203792 (= e!133386 (not e!133391))))

(declare-fun res!98016 () Bool)

(assert (=> b!203792 (=> res!98016 e!133391)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203792 (= res!98016 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6355)

(declare-fun getCurrentListMap!988 (array!9285 array!9287 (_ BitVec 32) (_ BitVec 32) V!6355 V!6355 (_ BitVec 32) Int) ListLongMap!2797)

(assert (=> b!203792 (= lt!102971 (getCurrentListMap!988 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102974 () array!9287)

(assert (=> b!203792 (= lt!102964 (getCurrentListMap!988 _keys!825 lt!102974 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203792 (and (= lt!102970 lt!102968) (= lt!102968 lt!102970))))

(declare-fun lt!102965 () tuple2!3884)

(assert (=> b!203792 (= lt!102968 (+!441 lt!102967 lt!102965))))

(declare-fun v!520 () V!6355)

(assert (=> b!203792 (= lt!102965 (tuple2!3885 k0!843 v!520))))

(declare-datatypes ((Unit!6176 0))(
  ( (Unit!6177) )
))
(declare-fun lt!102969 () Unit!6176)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!101 (array!9285 array!9287 (_ BitVec 32) (_ BitVec 32) V!6355 V!6355 (_ BitVec 32) (_ BitVec 64) V!6355 (_ BitVec 32) Int) Unit!6176)

(assert (=> b!203792 (= lt!102969 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!101 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!362 (array!9285 array!9287 (_ BitVec 32) (_ BitVec 32) V!6355 V!6355 (_ BitVec 32) Int) ListLongMap!2797)

(assert (=> b!203792 (= lt!102970 (getCurrentListMapNoExtraKeys!362 _keys!825 lt!102974 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203792 (= lt!102974 (array!9288 (store (arr!4394 _values!649) i!601 (ValueCellFull!2172 v!520)) (size!4719 _values!649)))))

(assert (=> b!203792 (= lt!102967 (getCurrentListMapNoExtraKeys!362 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203793 () Bool)

(assert (=> b!203793 (= e!133387 true)))

(assert (=> b!203793 (= lt!102966 (+!441 lt!102972 lt!102965))))

(declare-fun lt!102973 () Unit!6176)

(declare-fun addCommutativeForDiffKeys!152 (ListLongMap!2797 (_ BitVec 64) V!6355 (_ BitVec 64) V!6355) Unit!6176)

(assert (=> b!203793 (= lt!102973 (addCommutativeForDiffKeys!152 lt!102967 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203794 () Bool)

(declare-fun e!133388 () Bool)

(assert (=> b!203794 (= e!133388 tp_is_empty!5031)))

(declare-fun b!203795 () Bool)

(assert (=> b!203795 (= e!133385 (and e!133388 mapRes!8615))))

(declare-fun condMapEmpty!8615 () Bool)

(declare-fun mapDefault!8615 () ValueCell!2172)

(assert (=> b!203795 (= condMapEmpty!8615 (= (arr!4394 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2172)) mapDefault!8615)))))

(declare-fun b!203796 () Bool)

(declare-fun res!98023 () Bool)

(assert (=> b!203796 (=> (not res!98023) (not e!133386))))

(declare-datatypes ((List!2785 0))(
  ( (Nil!2782) (Cons!2781 (h!3423 (_ BitVec 64)) (t!7716 List!2785)) )
))
(declare-fun arrayNoDuplicates!0 (array!9285 (_ BitVec 32) List!2785) Bool)

(assert (=> b!203796 (= res!98023 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2782))))

(declare-fun b!203797 () Bool)

(declare-fun res!98015 () Bool)

(assert (=> b!203797 (=> (not res!98015) (not e!133386))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203797 (= res!98015 (validKeyInArray!0 k0!843))))

(declare-fun mapIsEmpty!8615 () Bool)

(assert (=> mapIsEmpty!8615 mapRes!8615))

(declare-fun b!203798 () Bool)

(declare-fun res!98020 () Bool)

(assert (=> b!203798 (=> (not res!98020) (not e!133386))))

(assert (=> b!203798 (= res!98020 (and (= (size!4719 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4718 _keys!825) (size!4719 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20516 res!98021) b!203798))

(assert (= (and b!203798 res!98020) b!203790))

(assert (= (and b!203790 res!98017) b!203796))

(assert (= (and b!203796 res!98023) b!203788))

(assert (= (and b!203788 res!98019) b!203797))

(assert (= (and b!203797 res!98015) b!203789))

(assert (= (and b!203789 res!98022) b!203792))

(assert (= (and b!203792 (not res!98016)) b!203787))

(assert (= (and b!203787 (not res!98018)) b!203793))

(assert (= (and b!203795 condMapEmpty!8615) mapIsEmpty!8615))

(assert (= (and b!203795 (not condMapEmpty!8615)) mapNonEmpty!8615))

(get-info :version)

(assert (= (and mapNonEmpty!8615 ((_ is ValueCellFull!2172) mapValue!8615)) b!203791))

(assert (= (and b!203795 ((_ is ValueCellFull!2172) mapDefault!8615)) b!203794))

(assert (= start!20516 b!203795))

(declare-fun m!231251 () Bool)

(assert (=> b!203790 m!231251))

(declare-fun m!231253 () Bool)

(assert (=> b!203787 m!231253))

(declare-fun m!231255 () Bool)

(assert (=> b!203787 m!231255))

(declare-fun m!231257 () Bool)

(assert (=> b!203787 m!231257))

(declare-fun m!231259 () Bool)

(assert (=> start!20516 m!231259))

(declare-fun m!231261 () Bool)

(assert (=> start!20516 m!231261))

(declare-fun m!231263 () Bool)

(assert (=> start!20516 m!231263))

(declare-fun m!231265 () Bool)

(assert (=> b!203792 m!231265))

(declare-fun m!231267 () Bool)

(assert (=> b!203792 m!231267))

(declare-fun m!231269 () Bool)

(assert (=> b!203792 m!231269))

(declare-fun m!231271 () Bool)

(assert (=> b!203792 m!231271))

(declare-fun m!231273 () Bool)

(assert (=> b!203792 m!231273))

(declare-fun m!231275 () Bool)

(assert (=> b!203792 m!231275))

(declare-fun m!231277 () Bool)

(assert (=> b!203792 m!231277))

(declare-fun m!231279 () Bool)

(assert (=> b!203789 m!231279))

(declare-fun m!231281 () Bool)

(assert (=> b!203796 m!231281))

(declare-fun m!231283 () Bool)

(assert (=> b!203793 m!231283))

(declare-fun m!231285 () Bool)

(assert (=> b!203793 m!231285))

(declare-fun m!231287 () Bool)

(assert (=> mapNonEmpty!8615 m!231287))

(declare-fun m!231289 () Bool)

(assert (=> b!203797 m!231289))

(check-sat b_and!11921 (not b!203790) (not b!203787) (not b!203797) tp_is_empty!5031 (not b!203796) (not b_next!5175) (not b!203793) (not mapNonEmpty!8615) (not b!203792) (not start!20516))
(check-sat b_and!11921 (not b_next!5175))
