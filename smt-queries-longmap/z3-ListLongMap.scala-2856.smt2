; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41152 () Bool)

(assert start!41152)

(declare-fun b_free!11035 () Bool)

(declare-fun b_next!11035 () Bool)

(assert (=> start!41152 (= b_free!11035 (not b_next!11035))))

(declare-fun tp!38941 () Bool)

(declare-fun b_and!19319 () Bool)

(assert (=> start!41152 (= tp!38941 b_and!19319)))

(declare-fun b!459814 () Bool)

(declare-datatypes ((Unit!13361 0))(
  ( (Unit!13362) )
))
(declare-fun e!268318 () Unit!13361)

(declare-fun Unit!13363 () Unit!13361)

(assert (=> b!459814 (= e!268318 Unit!13363)))

(declare-fun lt!208116 () Unit!13361)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!28540 0))(
  ( (array!28541 (arr!13710 (Array (_ BitVec 32) (_ BitVec 64))) (size!14062 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28540)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28540 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13361)

(assert (=> b!459814 (= lt!208116 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!459814 false))

(declare-fun b!459815 () Bool)

(declare-fun e!268320 () Bool)

(declare-fun tp_is_empty!12373 () Bool)

(assert (=> b!459815 (= e!268320 tp_is_empty!12373)))

(declare-fun b!459816 () Bool)

(declare-fun e!268316 () Bool)

(declare-fun e!268313 () Bool)

(assert (=> b!459816 (= e!268316 (not e!268313))))

(declare-fun res!274876 () Bool)

(assert (=> b!459816 (=> res!274876 e!268313)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!459816 (= res!274876 (not (validKeyInArray!0 (select (arr!13710 _keys!709) from!863))))))

(declare-datatypes ((V!17603 0))(
  ( (V!17604 (val!6231 Int)) )
))
(declare-datatypes ((tuple2!8140 0))(
  ( (tuple2!8141 (_1!4081 (_ BitVec 64)) (_2!4081 V!17603)) )
))
(declare-datatypes ((List!8205 0))(
  ( (Nil!8202) (Cons!8201 (h!9057 tuple2!8140) (t!14111 List!8205)) )
))
(declare-datatypes ((ListLongMap!7055 0))(
  ( (ListLongMap!7056 (toList!3543 List!8205)) )
))
(declare-fun lt!208106 () ListLongMap!7055)

(declare-fun lt!208108 () ListLongMap!7055)

(assert (=> b!459816 (= lt!208106 lt!208108)))

(declare-fun lt!208107 () ListLongMap!7055)

(declare-fun lt!208112 () tuple2!8140)

(declare-fun +!1619 (ListLongMap!7055 tuple2!8140) ListLongMap!7055)

(assert (=> b!459816 (= lt!208108 (+!1619 lt!208107 lt!208112))))

(declare-fun minValue!515 () V!17603)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5843 0))(
  ( (ValueCellFull!5843 (v!8510 V!17603)) (EmptyCell!5843) )
))
(declare-datatypes ((array!28542 0))(
  ( (array!28543 (arr!13711 (Array (_ BitVec 32) ValueCell!5843)) (size!14063 (_ BitVec 32))) )
))
(declare-fun lt!208105 () array!28542)

(declare-fun zeroValue!515 () V!17603)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!208111 () array!28540)

(declare-fun getCurrentListMapNoExtraKeys!1772 (array!28540 array!28542 (_ BitVec 32) (_ BitVec 32) V!17603 V!17603 (_ BitVec 32) Int) ListLongMap!7055)

(assert (=> b!459816 (= lt!208106 (getCurrentListMapNoExtraKeys!1772 lt!208111 lt!208105 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!17603)

(assert (=> b!459816 (= lt!208112 (tuple2!8141 k0!794 v!412))))

(declare-fun _values!549 () array!28542)

(assert (=> b!459816 (= lt!208107 (getCurrentListMapNoExtraKeys!1772 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lt!208110 () Unit!13361)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!776 (array!28540 array!28542 (_ BitVec 32) (_ BitVec 32) V!17603 V!17603 (_ BitVec 32) (_ BitVec 64) V!17603 (_ BitVec 32) Int) Unit!13361)

(assert (=> b!459816 (= lt!208110 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!776 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!459817 () Bool)

(declare-fun e!268319 () Bool)

(assert (=> b!459817 (= e!268313 e!268319)))

(declare-fun res!274884 () Bool)

(assert (=> b!459817 (=> res!274884 e!268319)))

(assert (=> b!459817 (= res!274884 (= k0!794 (select (arr!13710 _keys!709) from!863)))))

(assert (=> b!459817 (not (= (select (arr!13710 _keys!709) from!863) k0!794))))

(declare-fun lt!208118 () Unit!13361)

(assert (=> b!459817 (= lt!208118 e!268318)))

(declare-fun c!56474 () Bool)

(assert (=> b!459817 (= c!56474 (= (select (arr!13710 _keys!709) from!863) k0!794))))

(declare-fun lt!208104 () ListLongMap!7055)

(declare-fun lt!208114 () ListLongMap!7055)

(assert (=> b!459817 (= lt!208104 lt!208114)))

(declare-fun lt!208115 () tuple2!8140)

(assert (=> b!459817 (= lt!208114 (+!1619 lt!208108 lt!208115))))

(declare-fun lt!208113 () V!17603)

(assert (=> b!459817 (= lt!208115 (tuple2!8141 (select (arr!13710 _keys!709) from!863) lt!208113))))

(declare-fun get!6769 (ValueCell!5843 V!17603) V!17603)

(declare-fun dynLambda!897 (Int (_ BitVec 64)) V!17603)

(assert (=> b!459817 (= lt!208113 (get!6769 (select (arr!13711 _values!549) from!863) (dynLambda!897 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!459818 () Bool)

(declare-fun res!274872 () Bool)

(declare-fun e!268311 () Bool)

(assert (=> b!459818 (=> (not res!274872) (not e!268311))))

(assert (=> b!459818 (= res!274872 (and (= (size!14063 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14062 _keys!709) (size!14063 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!459819 () Bool)

(declare-fun res!274879 () Bool)

(assert (=> b!459819 (=> (not res!274879) (not e!268311))))

(declare-fun arrayContainsKey!0 (array!28540 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!459819 (= res!274879 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!459820 () Bool)

(declare-fun res!274874 () Bool)

(assert (=> b!459820 (=> (not res!274874) (not e!268311))))

(assert (=> b!459820 (= res!274874 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14062 _keys!709))))))

(declare-fun b!459821 () Bool)

(declare-fun res!274880 () Bool)

(assert (=> b!459821 (=> (not res!274880) (not e!268311))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28540 (_ BitVec 32)) Bool)

(assert (=> b!459821 (= res!274880 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!459822 () Bool)

(declare-fun res!274882 () Bool)

(assert (=> b!459822 (=> (not res!274882) (not e!268311))))

(assert (=> b!459822 (= res!274882 (or (= (select (arr!13710 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13710 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20209 () Bool)

(declare-fun mapRes!20209 () Bool)

(assert (=> mapIsEmpty!20209 mapRes!20209))

(declare-fun b!459823 () Bool)

(declare-fun res!274883 () Bool)

(assert (=> b!459823 (=> (not res!274883) (not e!268311))))

(declare-datatypes ((List!8206 0))(
  ( (Nil!8203) (Cons!8202 (h!9058 (_ BitVec 64)) (t!14112 List!8206)) )
))
(declare-fun arrayNoDuplicates!0 (array!28540 (_ BitVec 32) List!8206) Bool)

(assert (=> b!459823 (= res!274883 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8203))))

(declare-fun b!459824 () Bool)

(declare-fun e!268317 () Bool)

(assert (=> b!459824 (= e!268317 e!268316)))

(declare-fun res!274878 () Bool)

(assert (=> b!459824 (=> (not res!274878) (not e!268316))))

(assert (=> b!459824 (= res!274878 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!459824 (= lt!208104 (getCurrentListMapNoExtraKeys!1772 lt!208111 lt!208105 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!459824 (= lt!208105 (array!28543 (store (arr!13711 _values!549) i!563 (ValueCellFull!5843 v!412)) (size!14063 _values!549)))))

(declare-fun lt!208117 () ListLongMap!7055)

(assert (=> b!459824 (= lt!208117 (getCurrentListMapNoExtraKeys!1772 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!459825 () Bool)

(declare-fun e!268314 () Bool)

(assert (=> b!459825 (= e!268314 tp_is_empty!12373)))

(declare-fun b!459827 () Bool)

(declare-fun Unit!13364 () Unit!13361)

(assert (=> b!459827 (= e!268318 Unit!13364)))

(declare-fun b!459828 () Bool)

(declare-fun res!274881 () Bool)

(assert (=> b!459828 (=> (not res!274881) (not e!268311))))

(assert (=> b!459828 (= res!274881 (validKeyInArray!0 k0!794))))

(declare-fun b!459829 () Bool)

(assert (=> b!459829 (= e!268311 e!268317)))

(declare-fun res!274873 () Bool)

(assert (=> b!459829 (=> (not res!274873) (not e!268317))))

(assert (=> b!459829 (= res!274873 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208111 mask!1025))))

(assert (=> b!459829 (= lt!208111 (array!28541 (store (arr!13710 _keys!709) i!563 k0!794) (size!14062 _keys!709)))))

(declare-fun b!459830 () Bool)

(declare-fun res!274870 () Bool)

(assert (=> b!459830 (=> (not res!274870) (not e!268311))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459830 (= res!274870 (validMask!0 mask!1025))))

(declare-fun b!459831 () Bool)

(assert (=> b!459831 (= e!268319 true)))

(assert (=> b!459831 (= lt!208114 (+!1619 (+!1619 lt!208107 lt!208115) lt!208112))))

(declare-fun lt!208109 () Unit!13361)

(declare-fun addCommutativeForDiffKeys!418 (ListLongMap!7055 (_ BitVec 64) V!17603 (_ BitVec 64) V!17603) Unit!13361)

(assert (=> b!459831 (= lt!208109 (addCommutativeForDiffKeys!418 lt!208107 k0!794 v!412 (select (arr!13710 _keys!709) from!863) lt!208113))))

(declare-fun b!459832 () Bool)

(declare-fun e!268312 () Bool)

(assert (=> b!459832 (= e!268312 (and e!268314 mapRes!20209))))

(declare-fun condMapEmpty!20209 () Bool)

(declare-fun mapDefault!20209 () ValueCell!5843)

(assert (=> b!459832 (= condMapEmpty!20209 (= (arr!13711 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5843)) mapDefault!20209)))))

(declare-fun mapNonEmpty!20209 () Bool)

(declare-fun tp!38940 () Bool)

(assert (=> mapNonEmpty!20209 (= mapRes!20209 (and tp!38940 e!268320))))

(declare-fun mapValue!20209 () ValueCell!5843)

(declare-fun mapRest!20209 () (Array (_ BitVec 32) ValueCell!5843))

(declare-fun mapKey!20209 () (_ BitVec 32))

(assert (=> mapNonEmpty!20209 (= (arr!13711 _values!549) (store mapRest!20209 mapKey!20209 mapValue!20209))))

(declare-fun b!459833 () Bool)

(declare-fun res!274871 () Bool)

(assert (=> b!459833 (=> (not res!274871) (not e!268317))))

(assert (=> b!459833 (= res!274871 (bvsle from!863 i!563))))

(declare-fun res!274875 () Bool)

(assert (=> start!41152 (=> (not res!274875) (not e!268311))))

(assert (=> start!41152 (= res!274875 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14062 _keys!709))))))

(assert (=> start!41152 e!268311))

(assert (=> start!41152 tp_is_empty!12373))

(assert (=> start!41152 tp!38941))

(assert (=> start!41152 true))

(declare-fun array_inv!9996 (array!28542) Bool)

(assert (=> start!41152 (and (array_inv!9996 _values!549) e!268312)))

(declare-fun array_inv!9997 (array!28540) Bool)

(assert (=> start!41152 (array_inv!9997 _keys!709)))

(declare-fun b!459826 () Bool)

(declare-fun res!274877 () Bool)

(assert (=> b!459826 (=> (not res!274877) (not e!268317))))

(assert (=> b!459826 (= res!274877 (arrayNoDuplicates!0 lt!208111 #b00000000000000000000000000000000 Nil!8203))))

(assert (= (and start!41152 res!274875) b!459830))

(assert (= (and b!459830 res!274870) b!459818))

(assert (= (and b!459818 res!274872) b!459821))

(assert (= (and b!459821 res!274880) b!459823))

(assert (= (and b!459823 res!274883) b!459820))

(assert (= (and b!459820 res!274874) b!459828))

(assert (= (and b!459828 res!274881) b!459822))

(assert (= (and b!459822 res!274882) b!459819))

(assert (= (and b!459819 res!274879) b!459829))

(assert (= (and b!459829 res!274873) b!459826))

(assert (= (and b!459826 res!274877) b!459833))

(assert (= (and b!459833 res!274871) b!459824))

(assert (= (and b!459824 res!274878) b!459816))

(assert (= (and b!459816 (not res!274876)) b!459817))

(assert (= (and b!459817 c!56474) b!459814))

(assert (= (and b!459817 (not c!56474)) b!459827))

(assert (= (and b!459817 (not res!274884)) b!459831))

(assert (= (and b!459832 condMapEmpty!20209) mapIsEmpty!20209))

(assert (= (and b!459832 (not condMapEmpty!20209)) mapNonEmpty!20209))

(get-info :version)

(assert (= (and mapNonEmpty!20209 ((_ is ValueCellFull!5843) mapValue!20209)) b!459815))

(assert (= (and b!459832 ((_ is ValueCellFull!5843) mapDefault!20209)) b!459825))

(assert (= start!41152 b!459832))

(declare-fun b_lambda!9883 () Bool)

(assert (=> (not b_lambda!9883) (not b!459817)))

(declare-fun t!14110 () Bool)

(declare-fun tb!3863 () Bool)

(assert (=> (and start!41152 (= defaultEntry!557 defaultEntry!557) t!14110) tb!3863))

(declare-fun result!7279 () Bool)

(assert (=> tb!3863 (= result!7279 tp_is_empty!12373)))

(assert (=> b!459817 t!14110))

(declare-fun b_and!19321 () Bool)

(assert (= b_and!19319 (and (=> t!14110 result!7279) b_and!19321)))

(declare-fun m!443285 () Bool)

(assert (=> b!459822 m!443285))

(declare-fun m!443287 () Bool)

(assert (=> b!459828 m!443287))

(declare-fun m!443289 () Bool)

(assert (=> start!41152 m!443289))

(declare-fun m!443291 () Bool)

(assert (=> start!41152 m!443291))

(declare-fun m!443293 () Bool)

(assert (=> b!459821 m!443293))

(declare-fun m!443295 () Bool)

(assert (=> b!459824 m!443295))

(declare-fun m!443297 () Bool)

(assert (=> b!459824 m!443297))

(declare-fun m!443299 () Bool)

(assert (=> b!459824 m!443299))

(declare-fun m!443301 () Bool)

(assert (=> b!459831 m!443301))

(assert (=> b!459831 m!443301))

(declare-fun m!443303 () Bool)

(assert (=> b!459831 m!443303))

(declare-fun m!443305 () Bool)

(assert (=> b!459831 m!443305))

(assert (=> b!459831 m!443305))

(declare-fun m!443307 () Bool)

(assert (=> b!459831 m!443307))

(assert (=> b!459817 m!443305))

(declare-fun m!443309 () Bool)

(assert (=> b!459817 m!443309))

(declare-fun m!443311 () Bool)

(assert (=> b!459817 m!443311))

(assert (=> b!459817 m!443311))

(assert (=> b!459817 m!443309))

(declare-fun m!443313 () Bool)

(assert (=> b!459817 m!443313))

(declare-fun m!443315 () Bool)

(assert (=> b!459817 m!443315))

(declare-fun m!443317 () Bool)

(assert (=> b!459826 m!443317))

(declare-fun m!443319 () Bool)

(assert (=> b!459829 m!443319))

(declare-fun m!443321 () Bool)

(assert (=> b!459829 m!443321))

(declare-fun m!443323 () Bool)

(assert (=> b!459819 m!443323))

(declare-fun m!443325 () Bool)

(assert (=> b!459814 m!443325))

(assert (=> b!459816 m!443305))

(declare-fun m!443327 () Bool)

(assert (=> b!459816 m!443327))

(declare-fun m!443329 () Bool)

(assert (=> b!459816 m!443329))

(declare-fun m!443331 () Bool)

(assert (=> b!459816 m!443331))

(assert (=> b!459816 m!443305))

(declare-fun m!443333 () Bool)

(assert (=> b!459816 m!443333))

(declare-fun m!443335 () Bool)

(assert (=> b!459816 m!443335))

(declare-fun m!443337 () Bool)

(assert (=> b!459823 m!443337))

(declare-fun m!443339 () Bool)

(assert (=> b!459830 m!443339))

(declare-fun m!443341 () Bool)

(assert (=> mapNonEmpty!20209 m!443341))

(check-sat (not b!459831) b_and!19321 (not b!459814) (not b!459817) (not b!459819) (not b!459816) (not mapNonEmpty!20209) (not b!459823) (not b!459829) (not b_next!11035) (not b!459826) (not b!459830) (not b!459824) (not b!459821) tp_is_empty!12373 (not b!459828) (not b_lambda!9883) (not start!41152))
(check-sat b_and!19321 (not b_next!11035))
