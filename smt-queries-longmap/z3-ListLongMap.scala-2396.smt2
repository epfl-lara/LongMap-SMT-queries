; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37930 () Bool)

(assert start!37930)

(declare-fun b_free!8943 () Bool)

(declare-fun b_next!8943 () Bool)

(assert (=> start!37930 (= b_free!8943 (not b_next!8943))))

(declare-fun tp!31592 () Bool)

(declare-fun b_and!16233 () Bool)

(assert (=> start!37930 (= tp!31592 b_and!16233)))

(declare-fun b!390027 () Bool)

(declare-fun e!236283 () Bool)

(declare-fun tp_is_empty!9615 () Bool)

(assert (=> b!390027 (= e!236283 tp_is_empty!9615)))

(declare-fun b!390028 () Bool)

(declare-fun e!236279 () Bool)

(declare-fun e!236280 () Bool)

(declare-fun mapRes!15999 () Bool)

(assert (=> b!390028 (= e!236279 (and e!236280 mapRes!15999))))

(declare-fun condMapEmpty!15999 () Bool)

(declare-datatypes ((V!13925 0))(
  ( (V!13926 (val!4852 Int)) )
))
(declare-datatypes ((ValueCell!4464 0))(
  ( (ValueCellFull!4464 (v!7065 V!13925)) (EmptyCell!4464) )
))
(declare-datatypes ((array!23127 0))(
  ( (array!23128 (arr!11028 (Array (_ BitVec 32) ValueCell!4464)) (size!11380 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23127)

(declare-fun mapDefault!15999 () ValueCell!4464)

(assert (=> b!390028 (= condMapEmpty!15999 (= (arr!11028 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4464)) mapDefault!15999)))))

(declare-fun b!390029 () Bool)

(declare-fun e!236284 () Bool)

(declare-fun e!236286 () Bool)

(assert (=> b!390029 (= e!236284 e!236286)))

(declare-fun res!223137 () Bool)

(assert (=> b!390029 (=> (not res!223137) (not e!236286))))

(declare-datatypes ((array!23129 0))(
  ( (array!23130 (arr!11029 (Array (_ BitVec 32) (_ BitVec 64))) (size!11381 (_ BitVec 32))) )
))
(declare-fun lt!183657 () array!23129)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23129 (_ BitVec 32)) Bool)

(assert (=> b!390029 (= res!223137 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!183657 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23129)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390029 (= lt!183657 (array!23130 (store (arr!11029 _keys!658) i!548 k0!778) (size!11381 _keys!658)))))

(declare-fun b!390030 () Bool)

(declare-fun e!236285 () Bool)

(assert (=> b!390030 (= e!236285 (bvslt i!548 (size!11380 _values!506)))))

(declare-datatypes ((tuple2!6526 0))(
  ( (tuple2!6527 (_1!3274 (_ BitVec 64)) (_2!3274 V!13925)) )
))
(declare-datatypes ((List!6380 0))(
  ( (Nil!6377) (Cons!6376 (h!7232 tuple2!6526) (t!11538 List!6380)) )
))
(declare-datatypes ((ListLongMap!5439 0))(
  ( (ListLongMap!5440 (toList!2735 List!6380)) )
))
(declare-fun lt!183656 () ListLongMap!5439)

(declare-fun lt!183654 () tuple2!6526)

(declare-fun lt!183663 () tuple2!6526)

(declare-fun lt!183664 () ListLongMap!5439)

(declare-fun +!1030 (ListLongMap!5439 tuple2!6526) ListLongMap!5439)

(assert (=> b!390030 (= (+!1030 lt!183656 lt!183663) (+!1030 lt!183664 lt!183654))))

(declare-fun v!373 () V!13925)

(declare-fun lt!183666 () ListLongMap!5439)

(declare-datatypes ((Unit!11942 0))(
  ( (Unit!11943) )
))
(declare-fun lt!183653 () Unit!11942)

(declare-fun minValue!472 () V!13925)

(declare-fun addCommutativeForDiffKeys!333 (ListLongMap!5439 (_ BitVec 64) V!13925 (_ BitVec 64) V!13925) Unit!11942)

(assert (=> b!390030 (= lt!183653 (addCommutativeForDiffKeys!333 lt!183666 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!390031 () Bool)

(declare-fun res!223139 () Bool)

(assert (=> b!390031 (=> (not res!223139) (not e!236284))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390031 (= res!223139 (validKeyInArray!0 k0!778))))

(declare-fun b!390033 () Bool)

(declare-fun res!223133 () Bool)

(assert (=> b!390033 (=> (not res!223133) (not e!236284))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390033 (= res!223133 (and (= (size!11380 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11381 _keys!658) (size!11380 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390034 () Bool)

(declare-fun res!223136 () Bool)

(assert (=> b!390034 (=> (not res!223136) (not e!236286))))

(declare-datatypes ((List!6381 0))(
  ( (Nil!6378) (Cons!6377 (h!7233 (_ BitVec 64)) (t!11539 List!6381)) )
))
(declare-fun arrayNoDuplicates!0 (array!23129 (_ BitVec 32) List!6381) Bool)

(assert (=> b!390034 (= res!223136 (arrayNoDuplicates!0 lt!183657 #b00000000000000000000000000000000 Nil!6378))))

(declare-fun b!390035 () Bool)

(declare-fun res!223134 () Bool)

(assert (=> b!390035 (=> (not res!223134) (not e!236284))))

(assert (=> b!390035 (= res!223134 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6378))))

(declare-fun b!390036 () Bool)

(declare-fun e!236281 () Bool)

(assert (=> b!390036 (= e!236281 e!236285)))

(declare-fun res!223144 () Bool)

(assert (=> b!390036 (=> res!223144 e!236285)))

(assert (=> b!390036 (= res!223144 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!183667 () ListLongMap!5439)

(assert (=> b!390036 (= lt!183667 lt!183656)))

(assert (=> b!390036 (= lt!183656 (+!1030 lt!183666 lt!183654))))

(declare-fun lt!183655 () Unit!11942)

(declare-fun lt!183665 () ListLongMap!5439)

(declare-fun zeroValue!472 () V!13925)

(assert (=> b!390036 (= lt!183655 (addCommutativeForDiffKeys!333 lt!183665 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!183661 () ListLongMap!5439)

(assert (=> b!390036 (= lt!183661 (+!1030 lt!183667 lt!183663))))

(declare-fun lt!183658 () ListLongMap!5439)

(declare-fun lt!183668 () tuple2!6526)

(assert (=> b!390036 (= lt!183667 (+!1030 lt!183658 lt!183668))))

(declare-fun lt!183662 () ListLongMap!5439)

(assert (=> b!390036 (= lt!183662 lt!183664)))

(assert (=> b!390036 (= lt!183664 (+!1030 lt!183666 lt!183663))))

(assert (=> b!390036 (= lt!183666 (+!1030 lt!183665 lt!183668))))

(declare-fun lt!183659 () ListLongMap!5439)

(assert (=> b!390036 (= lt!183661 (+!1030 (+!1030 lt!183659 lt!183668) lt!183663))))

(assert (=> b!390036 (= lt!183663 (tuple2!6527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!390036 (= lt!183668 (tuple2!6527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390037 () Bool)

(declare-fun res!223135 () Bool)

(assert (=> b!390037 (=> (not res!223135) (not e!236284))))

(assert (=> b!390037 (= res!223135 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11381 _keys!658))))))

(declare-fun b!390038 () Bool)

(assert (=> b!390038 (= e!236286 (not e!236281))))

(declare-fun res!223140 () Bool)

(assert (=> b!390038 (=> res!223140 e!236281)))

(assert (=> b!390038 (= res!223140 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2084 (array!23129 array!23127 (_ BitVec 32) (_ BitVec 32) V!13925 V!13925 (_ BitVec 32) Int) ListLongMap!5439)

(assert (=> b!390038 (= lt!183662 (getCurrentListMap!2084 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!183660 () array!23127)

(assert (=> b!390038 (= lt!183661 (getCurrentListMap!2084 lt!183657 lt!183660 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390038 (and (= lt!183659 lt!183658) (= lt!183658 lt!183659))))

(assert (=> b!390038 (= lt!183658 (+!1030 lt!183665 lt!183654))))

(assert (=> b!390038 (= lt!183654 (tuple2!6527 k0!778 v!373))))

(declare-fun lt!183669 () Unit!11942)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!248 (array!23129 array!23127 (_ BitVec 32) (_ BitVec 32) V!13925 V!13925 (_ BitVec 32) (_ BitVec 64) V!13925 (_ BitVec 32) Int) Unit!11942)

(assert (=> b!390038 (= lt!183669 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!248 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!964 (array!23129 array!23127 (_ BitVec 32) (_ BitVec 32) V!13925 V!13925 (_ BitVec 32) Int) ListLongMap!5439)

(assert (=> b!390038 (= lt!183659 (getCurrentListMapNoExtraKeys!964 lt!183657 lt!183660 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390038 (= lt!183660 (array!23128 (store (arr!11028 _values!506) i!548 (ValueCellFull!4464 v!373)) (size!11380 _values!506)))))

(assert (=> b!390038 (= lt!183665 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390039 () Bool)

(assert (=> b!390039 (= e!236280 tp_is_empty!9615)))

(declare-fun b!390032 () Bool)

(declare-fun res!223143 () Bool)

(assert (=> b!390032 (=> (not res!223143) (not e!236284))))

(assert (=> b!390032 (= res!223143 (or (= (select (arr!11029 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11029 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!223141 () Bool)

(assert (=> start!37930 (=> (not res!223141) (not e!236284))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37930 (= res!223141 (validMask!0 mask!970))))

(assert (=> start!37930 e!236284))

(declare-fun array_inv!8104 (array!23127) Bool)

(assert (=> start!37930 (and (array_inv!8104 _values!506) e!236279)))

(assert (=> start!37930 tp!31592))

(assert (=> start!37930 true))

(assert (=> start!37930 tp_is_empty!9615))

(declare-fun array_inv!8105 (array!23129) Bool)

(assert (=> start!37930 (array_inv!8105 _keys!658)))

(declare-fun b!390040 () Bool)

(declare-fun res!223142 () Bool)

(assert (=> b!390040 (=> (not res!223142) (not e!236284))))

(declare-fun arrayContainsKey!0 (array!23129 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390040 (= res!223142 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!15999 () Bool)

(declare-fun tp!31593 () Bool)

(assert (=> mapNonEmpty!15999 (= mapRes!15999 (and tp!31593 e!236283))))

(declare-fun mapValue!15999 () ValueCell!4464)

(declare-fun mapKey!15999 () (_ BitVec 32))

(declare-fun mapRest!15999 () (Array (_ BitVec 32) ValueCell!4464))

(assert (=> mapNonEmpty!15999 (= (arr!11028 _values!506) (store mapRest!15999 mapKey!15999 mapValue!15999))))

(declare-fun b!390041 () Bool)

(declare-fun res!223138 () Bool)

(assert (=> b!390041 (=> (not res!223138) (not e!236284))))

(assert (=> b!390041 (= res!223138 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15999 () Bool)

(assert (=> mapIsEmpty!15999 mapRes!15999))

(assert (= (and start!37930 res!223141) b!390033))

(assert (= (and b!390033 res!223133) b!390041))

(assert (= (and b!390041 res!223138) b!390035))

(assert (= (and b!390035 res!223134) b!390037))

(assert (= (and b!390037 res!223135) b!390031))

(assert (= (and b!390031 res!223139) b!390032))

(assert (= (and b!390032 res!223143) b!390040))

(assert (= (and b!390040 res!223142) b!390029))

(assert (= (and b!390029 res!223137) b!390034))

(assert (= (and b!390034 res!223136) b!390038))

(assert (= (and b!390038 (not res!223140)) b!390036))

(assert (= (and b!390036 (not res!223144)) b!390030))

(assert (= (and b!390028 condMapEmpty!15999) mapIsEmpty!15999))

(assert (= (and b!390028 (not condMapEmpty!15999)) mapNonEmpty!15999))

(get-info :version)

(assert (= (and mapNonEmpty!15999 ((_ is ValueCellFull!4464) mapValue!15999)) b!390027))

(assert (= (and b!390028 ((_ is ValueCellFull!4464) mapDefault!15999)) b!390039))

(assert (= start!37930 b!390028))

(declare-fun m!386279 () Bool)

(assert (=> start!37930 m!386279))

(declare-fun m!386281 () Bool)

(assert (=> start!37930 m!386281))

(declare-fun m!386283 () Bool)

(assert (=> start!37930 m!386283))

(declare-fun m!386285 () Bool)

(assert (=> b!390035 m!386285))

(declare-fun m!386287 () Bool)

(assert (=> b!390040 m!386287))

(declare-fun m!386289 () Bool)

(assert (=> b!390041 m!386289))

(declare-fun m!386291 () Bool)

(assert (=> b!390031 m!386291))

(declare-fun m!386293 () Bool)

(assert (=> mapNonEmpty!15999 m!386293))

(declare-fun m!386295 () Bool)

(assert (=> b!390034 m!386295))

(declare-fun m!386297 () Bool)

(assert (=> b!390032 m!386297))

(declare-fun m!386299 () Bool)

(assert (=> b!390029 m!386299))

(declare-fun m!386301 () Bool)

(assert (=> b!390029 m!386301))

(declare-fun m!386303 () Bool)

(assert (=> b!390030 m!386303))

(declare-fun m!386305 () Bool)

(assert (=> b!390030 m!386305))

(declare-fun m!386307 () Bool)

(assert (=> b!390030 m!386307))

(declare-fun m!386309 () Bool)

(assert (=> b!390038 m!386309))

(declare-fun m!386311 () Bool)

(assert (=> b!390038 m!386311))

(declare-fun m!386313 () Bool)

(assert (=> b!390038 m!386313))

(declare-fun m!386315 () Bool)

(assert (=> b!390038 m!386315))

(declare-fun m!386317 () Bool)

(assert (=> b!390038 m!386317))

(declare-fun m!386319 () Bool)

(assert (=> b!390038 m!386319))

(declare-fun m!386321 () Bool)

(assert (=> b!390038 m!386321))

(declare-fun m!386323 () Bool)

(assert (=> b!390036 m!386323))

(declare-fun m!386325 () Bool)

(assert (=> b!390036 m!386325))

(declare-fun m!386327 () Bool)

(assert (=> b!390036 m!386327))

(declare-fun m!386329 () Bool)

(assert (=> b!390036 m!386329))

(declare-fun m!386331 () Bool)

(assert (=> b!390036 m!386331))

(declare-fun m!386333 () Bool)

(assert (=> b!390036 m!386333))

(assert (=> b!390036 m!386327))

(declare-fun m!386335 () Bool)

(assert (=> b!390036 m!386335))

(declare-fun m!386337 () Bool)

(assert (=> b!390036 m!386337))

(check-sat tp_is_empty!9615 (not b!390030) (not start!37930) (not mapNonEmpty!15999) (not b!390029) (not b!390041) (not b_next!8943) b_and!16233 (not b!390034) (not b!390040) (not b!390031) (not b!390038) (not b!390036) (not b!390035))
(check-sat b_and!16233 (not b_next!8943))
