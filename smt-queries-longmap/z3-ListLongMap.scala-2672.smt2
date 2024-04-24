; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39836 () Bool)

(assert start!39836)

(declare-fun b_free!10117 () Bool)

(declare-fun b_next!10117 () Bool)

(assert (=> start!39836 (= b_free!10117 (not b_next!10117))))

(declare-fun tp!35879 () Bool)

(declare-fun b_and!17907 () Bool)

(assert (=> start!39836 (= tp!35879 b_and!17907)))

(declare-fun b!430779 () Bool)

(declare-fun res!253200 () Bool)

(declare-fun e!254984 () Bool)

(assert (=> b!430779 (=> (not res!253200) (not e!254984))))

(declare-datatypes ((array!26378 0))(
  ( (array!26379 (arr!12638 (Array (_ BitVec 32) (_ BitVec 64))) (size!12990 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26378)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430779 (= res!253200 (or (= (select (arr!12638 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12638 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430780 () Bool)

(declare-fun e!254981 () Bool)

(declare-fun e!254986 () Bool)

(assert (=> b!430780 (= e!254981 e!254986)))

(declare-fun res!253212 () Bool)

(assert (=> b!430780 (=> res!253212 e!254986)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!430780 (= res!253212 (= k0!794 (select (arr!12638 _keys!709) from!863)))))

(assert (=> b!430780 (not (= (select (arr!12638 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12692 0))(
  ( (Unit!12693) )
))
(declare-fun lt!197157 () Unit!12692)

(declare-fun e!254988 () Unit!12692)

(assert (=> b!430780 (= lt!197157 e!254988)))

(declare-fun c!55488 () Bool)

(assert (=> b!430780 (= c!55488 (= (select (arr!12638 _keys!709) from!863) k0!794))))

(declare-datatypes ((V!16131 0))(
  ( (V!16132 (val!5679 Int)) )
))
(declare-datatypes ((tuple2!7392 0))(
  ( (tuple2!7393 (_1!3707 (_ BitVec 64)) (_2!3707 V!16131)) )
))
(declare-datatypes ((List!7389 0))(
  ( (Nil!7386) (Cons!7385 (h!8241 tuple2!7392) (t!12947 List!7389)) )
))
(declare-datatypes ((ListLongMap!6307 0))(
  ( (ListLongMap!6308 (toList!3169 List!7389)) )
))
(declare-fun lt!197166 () ListLongMap!6307)

(declare-fun lt!197159 () ListLongMap!6307)

(assert (=> b!430780 (= lt!197166 lt!197159)))

(declare-fun lt!197163 () ListLongMap!6307)

(declare-fun lt!197168 () tuple2!7392)

(declare-fun +!1379 (ListLongMap!6307 tuple2!7392) ListLongMap!6307)

(assert (=> b!430780 (= lt!197159 (+!1379 lt!197163 lt!197168))))

(declare-fun lt!197161 () V!16131)

(assert (=> b!430780 (= lt!197168 (tuple2!7393 (select (arr!12638 _keys!709) from!863) lt!197161))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5291 0))(
  ( (ValueCellFull!5291 (v!7927 V!16131)) (EmptyCell!5291) )
))
(declare-datatypes ((array!26380 0))(
  ( (array!26381 (arr!12639 (Array (_ BitVec 32) ValueCell!5291)) (size!12991 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26380)

(declare-fun get!6284 (ValueCell!5291 V!16131) V!16131)

(declare-fun dynLambda!791 (Int (_ BitVec 64)) V!16131)

(assert (=> b!430780 (= lt!197161 (get!6284 (select (arr!12639 _values!549) from!863) (dynLambda!791 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430781 () Bool)

(declare-fun res!253206 () Bool)

(assert (=> b!430781 (=> (not res!253206) (not e!254984))))

(declare-fun arrayContainsKey!0 (array!26378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!430781 (= res!253206 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!430782 () Bool)

(declare-fun res!253201 () Bool)

(assert (=> b!430782 (=> (not res!253201) (not e!254984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430782 (= res!253201 (validKeyInArray!0 k0!794))))

(declare-fun b!430783 () Bool)

(declare-fun e!254989 () Bool)

(assert (=> b!430783 (= e!254989 (not e!254981))))

(declare-fun res!253207 () Bool)

(assert (=> b!430783 (=> res!253207 e!254981)))

(assert (=> b!430783 (= res!253207 (not (validKeyInArray!0 (select (arr!12638 _keys!709) from!863))))))

(declare-fun lt!197167 () ListLongMap!6307)

(assert (=> b!430783 (= lt!197167 lt!197163)))

(declare-fun lt!197165 () ListLongMap!6307)

(declare-fun lt!197160 () tuple2!7392)

(assert (=> b!430783 (= lt!197163 (+!1379 lt!197165 lt!197160))))

(declare-fun minValue!515 () V!16131)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!197169 () array!26378)

(declare-fun lt!197156 () array!26380)

(declare-fun zeroValue!515 () V!16131)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1412 (array!26378 array!26380 (_ BitVec 32) (_ BitVec 32) V!16131 V!16131 (_ BitVec 32) Int) ListLongMap!6307)

(assert (=> b!430783 (= lt!197167 (getCurrentListMapNoExtraKeys!1412 lt!197169 lt!197156 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16131)

(assert (=> b!430783 (= lt!197160 (tuple2!7393 k0!794 v!412))))

(assert (=> b!430783 (= lt!197165 (getCurrentListMapNoExtraKeys!1412 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197155 () Unit!12692)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!556 (array!26378 array!26380 (_ BitVec 32) (_ BitVec 32) V!16131 V!16131 (_ BitVec 32) (_ BitVec 64) V!16131 (_ BitVec 32) Int) Unit!12692)

(assert (=> b!430783 (= lt!197155 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!556 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!430784 () Bool)

(declare-fun res!253203 () Bool)

(declare-fun e!254982 () Bool)

(assert (=> b!430784 (=> (not res!253203) (not e!254982))))

(assert (=> b!430784 (= res!253203 (bvsle from!863 i!563))))

(declare-fun b!430786 () Bool)

(declare-fun res!253202 () Bool)

(assert (=> b!430786 (=> (not res!253202) (not e!254984))))

(declare-datatypes ((List!7390 0))(
  ( (Nil!7387) (Cons!7386 (h!8242 (_ BitVec 64)) (t!12948 List!7390)) )
))
(declare-fun arrayNoDuplicates!0 (array!26378 (_ BitVec 32) List!7390) Bool)

(assert (=> b!430786 (= res!253202 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7387))))

(declare-fun b!430787 () Bool)

(declare-fun Unit!12694 () Unit!12692)

(assert (=> b!430787 (= e!254988 Unit!12694)))

(declare-fun lt!197164 () Unit!12692)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26378 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12692)

(assert (=> b!430787 (= lt!197164 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430787 false))

(declare-fun mapIsEmpty!18525 () Bool)

(declare-fun mapRes!18525 () Bool)

(assert (=> mapIsEmpty!18525 mapRes!18525))

(declare-fun b!430788 () Bool)

(declare-fun e!254983 () Bool)

(declare-fun tp_is_empty!11269 () Bool)

(assert (=> b!430788 (= e!254983 tp_is_empty!11269)))

(declare-fun b!430789 () Bool)

(declare-fun res!253208 () Bool)

(assert (=> b!430789 (=> (not res!253208) (not e!254982))))

(assert (=> b!430789 (= res!253208 (arrayNoDuplicates!0 lt!197169 #b00000000000000000000000000000000 Nil!7387))))

(declare-fun b!430790 () Bool)

(declare-fun res!253199 () Bool)

(assert (=> b!430790 (=> (not res!253199) (not e!254984))))

(assert (=> b!430790 (= res!253199 (and (= (size!12991 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12990 _keys!709) (size!12991 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!430791 () Bool)

(assert (=> b!430791 (= e!254984 e!254982)))

(declare-fun res!253209 () Bool)

(assert (=> b!430791 (=> (not res!253209) (not e!254982))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26378 (_ BitVec 32)) Bool)

(assert (=> b!430791 (= res!253209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197169 mask!1025))))

(assert (=> b!430791 (= lt!197169 (array!26379 (store (arr!12638 _keys!709) i!563 k0!794) (size!12990 _keys!709)))))

(declare-fun b!430792 () Bool)

(declare-fun res!253198 () Bool)

(assert (=> b!430792 (=> (not res!253198) (not e!254984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!430792 (= res!253198 (validMask!0 mask!1025))))

(declare-fun b!430793 () Bool)

(declare-fun Unit!12695 () Unit!12692)

(assert (=> b!430793 (= e!254988 Unit!12695)))

(declare-fun res!253204 () Bool)

(assert (=> start!39836 (=> (not res!253204) (not e!254984))))

(assert (=> start!39836 (= res!253204 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12990 _keys!709))))))

(assert (=> start!39836 e!254984))

(assert (=> start!39836 tp_is_empty!11269))

(assert (=> start!39836 tp!35879))

(assert (=> start!39836 true))

(declare-fun e!254985 () Bool)

(declare-fun array_inv!9264 (array!26380) Bool)

(assert (=> start!39836 (and (array_inv!9264 _values!549) e!254985)))

(declare-fun array_inv!9265 (array!26378) Bool)

(assert (=> start!39836 (array_inv!9265 _keys!709)))

(declare-fun b!430785 () Bool)

(declare-fun res!253205 () Bool)

(assert (=> b!430785 (=> (not res!253205) (not e!254984))))

(assert (=> b!430785 (= res!253205 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12990 _keys!709))))))

(declare-fun b!430794 () Bool)

(assert (=> b!430794 (= e!254982 e!254989)))

(declare-fun res!253210 () Bool)

(assert (=> b!430794 (=> (not res!253210) (not e!254989))))

(assert (=> b!430794 (= res!253210 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!430794 (= lt!197166 (getCurrentListMapNoExtraKeys!1412 lt!197169 lt!197156 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430794 (= lt!197156 (array!26381 (store (arr!12639 _values!549) i!563 (ValueCellFull!5291 v!412)) (size!12991 _values!549)))))

(declare-fun lt!197162 () ListLongMap!6307)

(assert (=> b!430794 (= lt!197162 (getCurrentListMapNoExtraKeys!1412 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18525 () Bool)

(declare-fun tp!35880 () Bool)

(declare-fun e!254987 () Bool)

(assert (=> mapNonEmpty!18525 (= mapRes!18525 (and tp!35880 e!254987))))

(declare-fun mapRest!18525 () (Array (_ BitVec 32) ValueCell!5291))

(declare-fun mapKey!18525 () (_ BitVec 32))

(declare-fun mapValue!18525 () ValueCell!5291)

(assert (=> mapNonEmpty!18525 (= (arr!12639 _values!549) (store mapRest!18525 mapKey!18525 mapValue!18525))))

(declare-fun b!430795 () Bool)

(declare-fun res!253211 () Bool)

(assert (=> b!430795 (=> (not res!253211) (not e!254984))))

(assert (=> b!430795 (= res!253211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430796 () Bool)

(assert (=> b!430796 (= e!254985 (and e!254983 mapRes!18525))))

(declare-fun condMapEmpty!18525 () Bool)

(declare-fun mapDefault!18525 () ValueCell!5291)

(assert (=> b!430796 (= condMapEmpty!18525 (= (arr!12639 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5291)) mapDefault!18525)))))

(declare-fun b!430797 () Bool)

(assert (=> b!430797 (= e!254987 tp_is_empty!11269)))

(declare-fun b!430798 () Bool)

(assert (=> b!430798 (= e!254986 true)))

(assert (=> b!430798 (= lt!197159 (+!1379 (+!1379 lt!197165 lt!197168) lt!197160))))

(declare-fun lt!197158 () Unit!12692)

(declare-fun addCommutativeForDiffKeys!359 (ListLongMap!6307 (_ BitVec 64) V!16131 (_ BitVec 64) V!16131) Unit!12692)

(assert (=> b!430798 (= lt!197158 (addCommutativeForDiffKeys!359 lt!197165 k0!794 v!412 (select (arr!12638 _keys!709) from!863) lt!197161))))

(assert (= (and start!39836 res!253204) b!430792))

(assert (= (and b!430792 res!253198) b!430790))

(assert (= (and b!430790 res!253199) b!430795))

(assert (= (and b!430795 res!253211) b!430786))

(assert (= (and b!430786 res!253202) b!430785))

(assert (= (and b!430785 res!253205) b!430782))

(assert (= (and b!430782 res!253201) b!430779))

(assert (= (and b!430779 res!253200) b!430781))

(assert (= (and b!430781 res!253206) b!430791))

(assert (= (and b!430791 res!253209) b!430789))

(assert (= (and b!430789 res!253208) b!430784))

(assert (= (and b!430784 res!253203) b!430794))

(assert (= (and b!430794 res!253210) b!430783))

(assert (= (and b!430783 (not res!253207)) b!430780))

(assert (= (and b!430780 c!55488) b!430787))

(assert (= (and b!430780 (not c!55488)) b!430793))

(assert (= (and b!430780 (not res!253212)) b!430798))

(assert (= (and b!430796 condMapEmpty!18525) mapIsEmpty!18525))

(assert (= (and b!430796 (not condMapEmpty!18525)) mapNonEmpty!18525))

(get-info :version)

(assert (= (and mapNonEmpty!18525 ((_ is ValueCellFull!5291) mapValue!18525)) b!430797))

(assert (= (and b!430796 ((_ is ValueCellFull!5291) mapDefault!18525)) b!430788))

(assert (= start!39836 b!430796))

(declare-fun b_lambda!9227 () Bool)

(assert (=> (not b_lambda!9227) (not b!430780)))

(declare-fun t!12946 () Bool)

(declare-fun tb!3515 () Bool)

(assert (=> (and start!39836 (= defaultEntry!557 defaultEntry!557) t!12946) tb!3515))

(declare-fun result!6565 () Bool)

(assert (=> tb!3515 (= result!6565 tp_is_empty!11269)))

(assert (=> b!430780 t!12946))

(declare-fun b_and!17909 () Bool)

(assert (= b_and!17907 (and (=> t!12946 result!6565) b_and!17909)))

(declare-fun m!419231 () Bool)

(assert (=> b!430786 m!419231))

(declare-fun m!419233 () Bool)

(assert (=> b!430783 m!419233))

(declare-fun m!419235 () Bool)

(assert (=> b!430783 m!419235))

(declare-fun m!419237 () Bool)

(assert (=> b!430783 m!419237))

(declare-fun m!419239 () Bool)

(assert (=> b!430783 m!419239))

(assert (=> b!430783 m!419233))

(declare-fun m!419241 () Bool)

(assert (=> b!430783 m!419241))

(declare-fun m!419243 () Bool)

(assert (=> b!430783 m!419243))

(declare-fun m!419245 () Bool)

(assert (=> mapNonEmpty!18525 m!419245))

(declare-fun m!419247 () Bool)

(assert (=> b!430798 m!419247))

(assert (=> b!430798 m!419247))

(declare-fun m!419249 () Bool)

(assert (=> b!430798 m!419249))

(assert (=> b!430798 m!419233))

(assert (=> b!430798 m!419233))

(declare-fun m!419251 () Bool)

(assert (=> b!430798 m!419251))

(declare-fun m!419253 () Bool)

(assert (=> b!430789 m!419253))

(declare-fun m!419255 () Bool)

(assert (=> b!430791 m!419255))

(declare-fun m!419257 () Bool)

(assert (=> b!430791 m!419257))

(declare-fun m!419259 () Bool)

(assert (=> b!430792 m!419259))

(declare-fun m!419261 () Bool)

(assert (=> b!430781 m!419261))

(declare-fun m!419263 () Bool)

(assert (=> b!430787 m!419263))

(declare-fun m!419265 () Bool)

(assert (=> b!430782 m!419265))

(declare-fun m!419267 () Bool)

(assert (=> b!430779 m!419267))

(declare-fun m!419269 () Bool)

(assert (=> b!430794 m!419269))

(declare-fun m!419271 () Bool)

(assert (=> b!430794 m!419271))

(declare-fun m!419273 () Bool)

(assert (=> b!430794 m!419273))

(declare-fun m!419275 () Bool)

(assert (=> start!39836 m!419275))

(declare-fun m!419277 () Bool)

(assert (=> start!39836 m!419277))

(declare-fun m!419279 () Bool)

(assert (=> b!430795 m!419279))

(assert (=> b!430780 m!419233))

(declare-fun m!419281 () Bool)

(assert (=> b!430780 m!419281))

(declare-fun m!419283 () Bool)

(assert (=> b!430780 m!419283))

(declare-fun m!419285 () Bool)

(assert (=> b!430780 m!419285))

(assert (=> b!430780 m!419285))

(assert (=> b!430780 m!419283))

(declare-fun m!419287 () Bool)

(assert (=> b!430780 m!419287))

(check-sat (not b!430780) (not b_lambda!9227) (not start!39836) tp_is_empty!11269 (not b!430792) (not mapNonEmpty!18525) (not b!430786) (not b!430798) (not b!430794) (not b_next!10117) (not b!430787) (not b!430781) (not b!430783) (not b!430789) (not b!430782) b_and!17909 (not b!430791) (not b!430795))
(check-sat b_and!17909 (not b_next!10117))
