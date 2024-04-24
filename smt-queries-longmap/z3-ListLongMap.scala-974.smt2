; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21086 () Bool)

(assert start!21086)

(declare-fun b_free!5593 () Bool)

(declare-fun b_next!5593 () Bool)

(assert (=> start!21086 (= b_free!5593 (not b_next!5593))))

(declare-fun tp!19840 () Bool)

(declare-fun b_and!12437 () Bool)

(assert (=> start!21086 (= tp!19840 b_and!12437)))

(declare-fun b!212138 () Bool)

(declare-fun res!103684 () Bool)

(declare-fun e!138045 () Bool)

(assert (=> b!212138 (=> (not res!103684) (not e!138045))))

(declare-datatypes ((array!10111 0))(
  ( (array!10112 (arr!4799 (Array (_ BitVec 32) (_ BitVec 64))) (size!5124 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10111)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!212138 (= res!103684 (= (select (arr!4799 _keys!825) i!601) k0!843))))

(declare-fun res!103678 () Bool)

(assert (=> start!21086 (=> (not res!103678) (not e!138045))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21086 (= res!103678 (validMask!0 mask!1149))))

(assert (=> start!21086 e!138045))

(declare-datatypes ((V!6921 0))(
  ( (V!6922 (val!2772 Int)) )
))
(declare-datatypes ((ValueCell!2384 0))(
  ( (ValueCellFull!2384 (v!4771 V!6921)) (EmptyCell!2384) )
))
(declare-datatypes ((array!10113 0))(
  ( (array!10114 (arr!4800 (Array (_ BitVec 32) ValueCell!2384)) (size!5125 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10113)

(declare-fun e!138041 () Bool)

(declare-fun array_inv!3153 (array!10113) Bool)

(assert (=> start!21086 (and (array_inv!3153 _values!649) e!138041)))

(assert (=> start!21086 true))

(declare-fun tp_is_empty!5455 () Bool)

(assert (=> start!21086 tp_is_empty!5455))

(declare-fun array_inv!3154 (array!10111) Bool)

(assert (=> start!21086 (array_inv!3154 _keys!825)))

(assert (=> start!21086 tp!19840))

(declare-fun b!212139 () Bool)

(declare-fun res!103682 () Bool)

(assert (=> b!212139 (=> (not res!103682) (not e!138045))))

(assert (=> b!212139 (= res!103682 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5124 _keys!825))))))

(declare-datatypes ((tuple2!4140 0))(
  ( (tuple2!4141 (_1!2081 (_ BitVec 64)) (_2!2081 V!6921)) )
))
(declare-fun lt!109295 () tuple2!4140)

(declare-datatypes ((List!3022 0))(
  ( (Nil!3019) (Cons!3018 (h!3660 tuple2!4140) (t!7959 List!3022)) )
))
(declare-datatypes ((ListLongMap!3055 0))(
  ( (ListLongMap!3056 (toList!1543 List!3022)) )
))
(declare-fun lt!109299 () ListLongMap!3055)

(declare-fun e!138044 () Bool)

(declare-fun b!212140 () Bool)

(declare-fun lt!109290 () ListLongMap!3055)

(declare-fun +!572 (ListLongMap!3055 tuple2!4140) ListLongMap!3055)

(assert (=> b!212140 (= e!138044 (= (+!572 lt!109290 lt!109295) lt!109299))))

(declare-fun lt!109301 () ListLongMap!3055)

(declare-fun lt!109300 () ListLongMap!3055)

(assert (=> b!212140 (= lt!109301 (+!572 lt!109300 lt!109295))))

(declare-fun lt!109298 () ListLongMap!3055)

(declare-fun v!520 () V!6921)

(declare-datatypes ((Unit!6430 0))(
  ( (Unit!6431) )
))
(declare-fun lt!109297 () Unit!6430)

(declare-fun zeroValue!615 () V!6921)

(declare-fun addCommutativeForDiffKeys!210 (ListLongMap!3055 (_ BitVec 64) V!6921 (_ BitVec 64) V!6921) Unit!6430)

(assert (=> b!212140 (= lt!109297 (addCommutativeForDiffKeys!210 lt!109298 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!212141 () Bool)

(declare-fun e!138043 () Bool)

(assert (=> b!212141 (= e!138043 tp_is_empty!5455)))

(declare-fun mapIsEmpty!9272 () Bool)

(declare-fun mapRes!9272 () Bool)

(assert (=> mapIsEmpty!9272 mapRes!9272))

(declare-fun b!212142 () Bool)

(declare-fun e!138047 () Bool)

(assert (=> b!212142 (= e!138047 e!138044)))

(declare-fun res!103683 () Bool)

(assert (=> b!212142 (=> res!103683 e!138044)))

(assert (=> b!212142 (= res!103683 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!212142 (= lt!109299 lt!109301)))

(declare-fun lt!109293 () ListLongMap!3055)

(declare-fun lt!109296 () tuple2!4140)

(assert (=> b!212142 (= lt!109301 (+!572 lt!109293 lt!109296))))

(assert (=> b!212142 (= lt!109290 lt!109300)))

(assert (=> b!212142 (= lt!109300 (+!572 lt!109298 lt!109296))))

(declare-fun lt!109291 () ListLongMap!3055)

(assert (=> b!212142 (= lt!109299 (+!572 lt!109291 lt!109296))))

(assert (=> b!212142 (= lt!109296 (tuple2!4141 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!212143 () Bool)

(declare-fun e!138046 () Bool)

(assert (=> b!212143 (= e!138046 tp_is_empty!5455)))

(declare-fun b!212144 () Bool)

(declare-fun res!103680 () Bool)

(assert (=> b!212144 (=> (not res!103680) (not e!138045))))

(declare-datatypes ((List!3023 0))(
  ( (Nil!3020) (Cons!3019 (h!3661 (_ BitVec 64)) (t!7960 List!3023)) )
))
(declare-fun arrayNoDuplicates!0 (array!10111 (_ BitVec 32) List!3023) Bool)

(assert (=> b!212144 (= res!103680 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3020))))

(declare-fun b!212145 () Bool)

(declare-fun res!103679 () Bool)

(assert (=> b!212145 (=> (not res!103679) (not e!138045))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!212145 (= res!103679 (validKeyInArray!0 k0!843))))

(declare-fun b!212146 () Bool)

(assert (=> b!212146 (= e!138045 (not e!138047))))

(declare-fun res!103681 () Bool)

(assert (=> b!212146 (=> res!103681 e!138047)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!212146 (= res!103681 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6921)

(declare-fun getCurrentListMap!1079 (array!10111 array!10113 (_ BitVec 32) (_ BitVec 32) V!6921 V!6921 (_ BitVec 32) Int) ListLongMap!3055)

(assert (=> b!212146 (= lt!109290 (getCurrentListMap!1079 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!109292 () array!10113)

(assert (=> b!212146 (= lt!109299 (getCurrentListMap!1079 _keys!825 lt!109292 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212146 (and (= lt!109291 lt!109293) (= lt!109293 lt!109291))))

(assert (=> b!212146 (= lt!109293 (+!572 lt!109298 lt!109295))))

(assert (=> b!212146 (= lt!109295 (tuple2!4141 k0!843 v!520))))

(declare-fun lt!109294 () Unit!6430)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!220 (array!10111 array!10113 (_ BitVec 32) (_ BitVec 32) V!6921 V!6921 (_ BitVec 32) (_ BitVec 64) V!6921 (_ BitVec 32) Int) Unit!6430)

(assert (=> b!212146 (= lt!109294 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!220 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!502 (array!10111 array!10113 (_ BitVec 32) (_ BitVec 32) V!6921 V!6921 (_ BitVec 32) Int) ListLongMap!3055)

(assert (=> b!212146 (= lt!109291 (getCurrentListMapNoExtraKeys!502 _keys!825 lt!109292 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!212146 (= lt!109292 (array!10114 (store (arr!4800 _values!649) i!601 (ValueCellFull!2384 v!520)) (size!5125 _values!649)))))

(assert (=> b!212146 (= lt!109298 (getCurrentListMapNoExtraKeys!502 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!9272 () Bool)

(declare-fun tp!19841 () Bool)

(assert (=> mapNonEmpty!9272 (= mapRes!9272 (and tp!19841 e!138046))))

(declare-fun mapValue!9272 () ValueCell!2384)

(declare-fun mapKey!9272 () (_ BitVec 32))

(declare-fun mapRest!9272 () (Array (_ BitVec 32) ValueCell!2384))

(assert (=> mapNonEmpty!9272 (= (arr!4800 _values!649) (store mapRest!9272 mapKey!9272 mapValue!9272))))

(declare-fun b!212147 () Bool)

(declare-fun res!103676 () Bool)

(assert (=> b!212147 (=> (not res!103676) (not e!138045))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10111 (_ BitVec 32)) Bool)

(assert (=> b!212147 (= res!103676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!212148 () Bool)

(declare-fun res!103677 () Bool)

(assert (=> b!212148 (=> (not res!103677) (not e!138045))))

(assert (=> b!212148 (= res!103677 (and (= (size!5125 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5124 _keys!825) (size!5125 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!212149 () Bool)

(assert (=> b!212149 (= e!138041 (and e!138043 mapRes!9272))))

(declare-fun condMapEmpty!9272 () Bool)

(declare-fun mapDefault!9272 () ValueCell!2384)

(assert (=> b!212149 (= condMapEmpty!9272 (= (arr!4800 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2384)) mapDefault!9272)))))

(assert (= (and start!21086 res!103678) b!212148))

(assert (= (and b!212148 res!103677) b!212147))

(assert (= (and b!212147 res!103676) b!212144))

(assert (= (and b!212144 res!103680) b!212139))

(assert (= (and b!212139 res!103682) b!212145))

(assert (= (and b!212145 res!103679) b!212138))

(assert (= (and b!212138 res!103684) b!212146))

(assert (= (and b!212146 (not res!103681)) b!212142))

(assert (= (and b!212142 (not res!103683)) b!212140))

(assert (= (and b!212149 condMapEmpty!9272) mapIsEmpty!9272))

(assert (= (and b!212149 (not condMapEmpty!9272)) mapNonEmpty!9272))

(get-info :version)

(assert (= (and mapNonEmpty!9272 ((_ is ValueCellFull!2384) mapValue!9272)) b!212143))

(assert (= (and b!212149 ((_ is ValueCellFull!2384) mapDefault!9272)) b!212141))

(assert (= start!21086 b!212149))

(declare-fun m!240053 () Bool)

(assert (=> b!212146 m!240053))

(declare-fun m!240055 () Bool)

(assert (=> b!212146 m!240055))

(declare-fun m!240057 () Bool)

(assert (=> b!212146 m!240057))

(declare-fun m!240059 () Bool)

(assert (=> b!212146 m!240059))

(declare-fun m!240061 () Bool)

(assert (=> b!212146 m!240061))

(declare-fun m!240063 () Bool)

(assert (=> b!212146 m!240063))

(declare-fun m!240065 () Bool)

(assert (=> b!212146 m!240065))

(declare-fun m!240067 () Bool)

(assert (=> b!212140 m!240067))

(declare-fun m!240069 () Bool)

(assert (=> b!212140 m!240069))

(declare-fun m!240071 () Bool)

(assert (=> b!212140 m!240071))

(declare-fun m!240073 () Bool)

(assert (=> b!212138 m!240073))

(declare-fun m!240075 () Bool)

(assert (=> b!212144 m!240075))

(declare-fun m!240077 () Bool)

(assert (=> b!212142 m!240077))

(declare-fun m!240079 () Bool)

(assert (=> b!212142 m!240079))

(declare-fun m!240081 () Bool)

(assert (=> b!212142 m!240081))

(declare-fun m!240083 () Bool)

(assert (=> b!212147 m!240083))

(declare-fun m!240085 () Bool)

(assert (=> b!212145 m!240085))

(declare-fun m!240087 () Bool)

(assert (=> start!21086 m!240087))

(declare-fun m!240089 () Bool)

(assert (=> start!21086 m!240089))

(declare-fun m!240091 () Bool)

(assert (=> start!21086 m!240091))

(declare-fun m!240093 () Bool)

(assert (=> mapNonEmpty!9272 m!240093))

(check-sat (not b_next!5593) tp_is_empty!5455 (not b!212140) (not b!212142) b_and!12437 (not b!212145) (not b!212147) (not start!21086) (not b!212144) (not mapNonEmpty!9272) (not b!212146))
(check-sat b_and!12437 (not b_next!5593))
