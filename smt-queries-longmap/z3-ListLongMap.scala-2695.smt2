; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39974 () Bool)

(assert start!39974)

(declare-fun b_free!10255 () Bool)

(declare-fun b_next!10255 () Bool)

(assert (=> start!39974 (= b_free!10255 (not b_next!10255))))

(declare-fun tp!36293 () Bool)

(declare-fun b_and!18143 () Bool)

(assert (=> start!39974 (= tp!36293 b_and!18143)))

(declare-fun b!434835 () Bool)

(declare-fun e!256916 () Bool)

(declare-fun e!256911 () Bool)

(assert (=> b!434835 (= e!256916 e!256911)))

(declare-fun res!256178 () Bool)

(assert (=> b!434835 (=> (not res!256178) (not e!256911))))

(declare-datatypes ((array!26637 0))(
  ( (array!26638 (arr!12768 (Array (_ BitVec 32) (_ BitVec 64))) (size!13121 (_ BitVec 32))) )
))
(declare-fun lt!200015 () array!26637)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26637 (_ BitVec 32)) Bool)

(assert (=> b!434835 (= res!256178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!200015 mask!1025))))

(declare-fun _keys!709 () array!26637)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434835 (= lt!200015 (array!26638 (store (arr!12768 _keys!709) i!563 k0!794) (size!13121 _keys!709)))))

(declare-fun b!434836 () Bool)

(declare-fun res!256183 () Bool)

(assert (=> b!434836 (=> (not res!256183) (not e!256916))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434836 (= res!256183 (validMask!0 mask!1025))))

(declare-fun b!434837 () Bool)

(declare-fun e!256913 () Bool)

(declare-fun e!256910 () Bool)

(declare-fun mapRes!18732 () Bool)

(assert (=> b!434837 (= e!256913 (and e!256910 mapRes!18732))))

(declare-fun condMapEmpty!18732 () Bool)

(declare-datatypes ((V!16315 0))(
  ( (V!16316 (val!5748 Int)) )
))
(declare-datatypes ((ValueCell!5360 0))(
  ( (ValueCellFull!5360 (v!7989 V!16315)) (EmptyCell!5360) )
))
(declare-datatypes ((array!26639 0))(
  ( (array!26640 (arr!12769 (Array (_ BitVec 32) ValueCell!5360)) (size!13122 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26639)

(declare-fun mapDefault!18732 () ValueCell!5360)

(assert (=> b!434837 (= condMapEmpty!18732 (= (arr!12769 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5360)) mapDefault!18732)))))

(declare-fun b!434838 () Bool)

(declare-fun res!256187 () Bool)

(assert (=> b!434838 (=> (not res!256187) (not e!256916))))

(assert (=> b!434838 (= res!256187 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13121 _keys!709))))))

(declare-fun b!434840 () Bool)

(declare-datatypes ((Unit!12881 0))(
  ( (Unit!12882) )
))
(declare-fun e!256915 () Unit!12881)

(declare-fun Unit!12883 () Unit!12881)

(assert (=> b!434840 (= e!256915 Unit!12883)))

(declare-fun b!434841 () Bool)

(declare-fun res!256190 () Bool)

(assert (=> b!434841 (=> (not res!256190) (not e!256916))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434841 (= res!256190 (validKeyInArray!0 k0!794))))

(declare-fun b!434842 () Bool)

(declare-fun e!256908 () Bool)

(declare-fun e!256912 () Bool)

(assert (=> b!434842 (= e!256908 (not e!256912))))

(declare-fun res!256177 () Bool)

(assert (=> b!434842 (=> res!256177 e!256912)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!434842 (= res!256177 (not (validKeyInArray!0 (select (arr!12768 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7618 0))(
  ( (tuple2!7619 (_1!3820 (_ BitVec 64)) (_2!3820 V!16315)) )
))
(declare-datatypes ((List!7606 0))(
  ( (Nil!7603) (Cons!7602 (h!8458 tuple2!7618) (t!13301 List!7606)) )
))
(declare-datatypes ((ListLongMap!6521 0))(
  ( (ListLongMap!6522 (toList!3276 List!7606)) )
))
(declare-fun lt!200018 () ListLongMap!6521)

(declare-fun lt!200013 () ListLongMap!6521)

(assert (=> b!434842 (= lt!200018 lt!200013)))

(declare-fun lt!200014 () ListLongMap!6521)

(declare-fun lt!200017 () tuple2!7618)

(declare-fun +!1451 (ListLongMap!6521 tuple2!7618) ListLongMap!6521)

(assert (=> b!434842 (= lt!200013 (+!1451 lt!200014 lt!200017))))

(declare-fun minValue!515 () V!16315)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!200010 () array!26639)

(declare-fun zeroValue!515 () V!16315)

(declare-fun getCurrentListMapNoExtraKeys!1477 (array!26637 array!26639 (_ BitVec 32) (_ BitVec 32) V!16315 V!16315 (_ BitVec 32) Int) ListLongMap!6521)

(assert (=> b!434842 (= lt!200018 (getCurrentListMapNoExtraKeys!1477 lt!200015 lt!200010 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16315)

(assert (=> b!434842 (= lt!200017 (tuple2!7619 k0!794 v!412))))

(assert (=> b!434842 (= lt!200014 (getCurrentListMapNoExtraKeys!1477 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200019 () Unit!12881)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!596 (array!26637 array!26639 (_ BitVec 32) (_ BitVec 32) V!16315 V!16315 (_ BitVec 32) (_ BitVec 64) V!16315 (_ BitVec 32) Int) Unit!12881)

(assert (=> b!434842 (= lt!200019 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!596 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18732 () Bool)

(assert (=> mapIsEmpty!18732 mapRes!18732))

(declare-fun b!434843 () Bool)

(declare-fun e!256914 () Bool)

(assert (=> b!434843 (= e!256914 true)))

(declare-fun lt!200009 () tuple2!7618)

(declare-fun lt!200011 () ListLongMap!6521)

(assert (=> b!434843 (= lt!200011 (+!1451 (+!1451 lt!200014 lt!200009) lt!200017))))

(declare-fun lt!200020 () Unit!12881)

(declare-fun lt!200021 () V!16315)

(declare-fun addCommutativeForDiffKeys!404 (ListLongMap!6521 (_ BitVec 64) V!16315 (_ BitVec 64) V!16315) Unit!12881)

(assert (=> b!434843 (= lt!200020 (addCommutativeForDiffKeys!404 lt!200014 k0!794 v!412 (select (arr!12768 _keys!709) from!863) lt!200021))))

(declare-fun b!434844 () Bool)

(declare-fun res!256182 () Bool)

(assert (=> b!434844 (=> (not res!256182) (not e!256916))))

(declare-fun arrayContainsKey!0 (array!26637 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434844 (= res!256182 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!434839 () Bool)

(assert (=> b!434839 (= e!256911 e!256908)))

(declare-fun res!256184 () Bool)

(assert (=> b!434839 (=> (not res!256184) (not e!256908))))

(assert (=> b!434839 (= res!256184 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!200016 () ListLongMap!6521)

(assert (=> b!434839 (= lt!200016 (getCurrentListMapNoExtraKeys!1477 lt!200015 lt!200010 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434839 (= lt!200010 (array!26640 (store (arr!12769 _values!549) i!563 (ValueCellFull!5360 v!412)) (size!13122 _values!549)))))

(declare-fun lt!200007 () ListLongMap!6521)

(assert (=> b!434839 (= lt!200007 (getCurrentListMapNoExtraKeys!1477 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!256188 () Bool)

(assert (=> start!39974 (=> (not res!256188) (not e!256916))))

(assert (=> start!39974 (= res!256188 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13121 _keys!709))))))

(assert (=> start!39974 e!256916))

(declare-fun tp_is_empty!11407 () Bool)

(assert (=> start!39974 tp_is_empty!11407))

(assert (=> start!39974 tp!36293))

(assert (=> start!39974 true))

(declare-fun array_inv!9318 (array!26639) Bool)

(assert (=> start!39974 (and (array_inv!9318 _values!549) e!256913)))

(declare-fun array_inv!9319 (array!26637) Bool)

(assert (=> start!39974 (array_inv!9319 _keys!709)))

(declare-fun b!434845 () Bool)

(declare-fun res!256179 () Bool)

(assert (=> b!434845 (=> (not res!256179) (not e!256911))))

(assert (=> b!434845 (= res!256179 (bvsle from!863 i!563))))

(declare-fun b!434846 () Bool)

(declare-fun res!256186 () Bool)

(assert (=> b!434846 (=> (not res!256186) (not e!256916))))

(assert (=> b!434846 (= res!256186 (or (= (select (arr!12768 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12768 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434847 () Bool)

(declare-fun res!256181 () Bool)

(assert (=> b!434847 (=> (not res!256181) (not e!256911))))

(declare-datatypes ((List!7607 0))(
  ( (Nil!7604) (Cons!7603 (h!8459 (_ BitVec 64)) (t!13302 List!7607)) )
))
(declare-fun arrayNoDuplicates!0 (array!26637 (_ BitVec 32) List!7607) Bool)

(assert (=> b!434847 (= res!256181 (arrayNoDuplicates!0 lt!200015 #b00000000000000000000000000000000 Nil!7604))))

(declare-fun b!434848 () Bool)

(declare-fun res!256185 () Bool)

(assert (=> b!434848 (=> (not res!256185) (not e!256916))))

(assert (=> b!434848 (= res!256185 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7604))))

(declare-fun b!434849 () Bool)

(assert (=> b!434849 (= e!256910 tp_is_empty!11407)))

(declare-fun b!434850 () Bool)

(declare-fun res!256189 () Bool)

(assert (=> b!434850 (=> (not res!256189) (not e!256916))))

(assert (=> b!434850 (= res!256189 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18732 () Bool)

(declare-fun tp!36294 () Bool)

(declare-fun e!256917 () Bool)

(assert (=> mapNonEmpty!18732 (= mapRes!18732 (and tp!36294 e!256917))))

(declare-fun mapKey!18732 () (_ BitVec 32))

(declare-fun mapValue!18732 () ValueCell!5360)

(declare-fun mapRest!18732 () (Array (_ BitVec 32) ValueCell!5360))

(assert (=> mapNonEmpty!18732 (= (arr!12769 _values!549) (store mapRest!18732 mapKey!18732 mapValue!18732))))

(declare-fun b!434851 () Bool)

(assert (=> b!434851 (= e!256917 tp_is_empty!11407)))

(declare-fun b!434852 () Bool)

(declare-fun res!256191 () Bool)

(assert (=> b!434852 (=> (not res!256191) (not e!256916))))

(assert (=> b!434852 (= res!256191 (and (= (size!13122 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13121 _keys!709) (size!13122 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434853 () Bool)

(declare-fun Unit!12884 () Unit!12881)

(assert (=> b!434853 (= e!256915 Unit!12884)))

(declare-fun lt!200012 () Unit!12881)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26637 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12881)

(assert (=> b!434853 (= lt!200012 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434853 false))

(declare-fun b!434854 () Bool)

(assert (=> b!434854 (= e!256912 e!256914)))

(declare-fun res!256180 () Bool)

(assert (=> b!434854 (=> res!256180 e!256914)))

(assert (=> b!434854 (= res!256180 (= k0!794 (select (arr!12768 _keys!709) from!863)))))

(assert (=> b!434854 (not (= (select (arr!12768 _keys!709) from!863) k0!794))))

(declare-fun lt!200008 () Unit!12881)

(assert (=> b!434854 (= lt!200008 e!256915)))

(declare-fun c!55647 () Bool)

(assert (=> b!434854 (= c!55647 (= (select (arr!12768 _keys!709) from!863) k0!794))))

(assert (=> b!434854 (= lt!200016 lt!200011)))

(assert (=> b!434854 (= lt!200011 (+!1451 lt!200013 lt!200009))))

(assert (=> b!434854 (= lt!200009 (tuple2!7619 (select (arr!12768 _keys!709) from!863) lt!200021))))

(declare-fun get!6365 (ValueCell!5360 V!16315) V!16315)

(declare-fun dynLambda!829 (Int (_ BitVec 64)) V!16315)

(assert (=> b!434854 (= lt!200021 (get!6365 (select (arr!12769 _values!549) from!863) (dynLambda!829 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39974 res!256188) b!434836))

(assert (= (and b!434836 res!256183) b!434852))

(assert (= (and b!434852 res!256191) b!434850))

(assert (= (and b!434850 res!256189) b!434848))

(assert (= (and b!434848 res!256185) b!434838))

(assert (= (and b!434838 res!256187) b!434841))

(assert (= (and b!434841 res!256190) b!434846))

(assert (= (and b!434846 res!256186) b!434844))

(assert (= (and b!434844 res!256182) b!434835))

(assert (= (and b!434835 res!256178) b!434847))

(assert (= (and b!434847 res!256181) b!434845))

(assert (= (and b!434845 res!256179) b!434839))

(assert (= (and b!434839 res!256184) b!434842))

(assert (= (and b!434842 (not res!256177)) b!434854))

(assert (= (and b!434854 c!55647) b!434853))

(assert (= (and b!434854 (not c!55647)) b!434840))

(assert (= (and b!434854 (not res!256180)) b!434843))

(assert (= (and b!434837 condMapEmpty!18732) mapIsEmpty!18732))

(assert (= (and b!434837 (not condMapEmpty!18732)) mapNonEmpty!18732))

(get-info :version)

(assert (= (and mapNonEmpty!18732 ((_ is ValueCellFull!5360) mapValue!18732)) b!434851))

(assert (= (and b!434837 ((_ is ValueCellFull!5360) mapDefault!18732)) b!434849))

(assert (= start!39974 b!434837))

(declare-fun b_lambda!9325 () Bool)

(assert (=> (not b_lambda!9325) (not b!434854)))

(declare-fun t!13300 () Bool)

(declare-fun tb!3653 () Bool)

(assert (=> (and start!39974 (= defaultEntry!557 defaultEntry!557) t!13300) tb!3653))

(declare-fun result!6841 () Bool)

(assert (=> tb!3653 (= result!6841 tp_is_empty!11407)))

(assert (=> b!434854 t!13300))

(declare-fun b_and!18145 () Bool)

(assert (= b_and!18143 (and (=> t!13300 result!6841) b_and!18145)))

(declare-fun m!422283 () Bool)

(assert (=> b!434843 m!422283))

(assert (=> b!434843 m!422283))

(declare-fun m!422285 () Bool)

(assert (=> b!434843 m!422285))

(declare-fun m!422287 () Bool)

(assert (=> b!434843 m!422287))

(assert (=> b!434843 m!422287))

(declare-fun m!422289 () Bool)

(assert (=> b!434843 m!422289))

(declare-fun m!422291 () Bool)

(assert (=> b!434836 m!422291))

(declare-fun m!422293 () Bool)

(assert (=> mapNonEmpty!18732 m!422293))

(declare-fun m!422295 () Bool)

(assert (=> b!434844 m!422295))

(assert (=> b!434842 m!422287))

(declare-fun m!422297 () Bool)

(assert (=> b!434842 m!422297))

(assert (=> b!434842 m!422287))

(declare-fun m!422299 () Bool)

(assert (=> b!434842 m!422299))

(declare-fun m!422301 () Bool)

(assert (=> b!434842 m!422301))

(declare-fun m!422303 () Bool)

(assert (=> b!434842 m!422303))

(declare-fun m!422305 () Bool)

(assert (=> b!434842 m!422305))

(declare-fun m!422307 () Bool)

(assert (=> b!434850 m!422307))

(assert (=> b!434854 m!422287))

(declare-fun m!422309 () Bool)

(assert (=> b!434854 m!422309))

(declare-fun m!422311 () Bool)

(assert (=> b!434854 m!422311))

(declare-fun m!422313 () Bool)

(assert (=> b!434854 m!422313))

(assert (=> b!434854 m!422311))

(assert (=> b!434854 m!422309))

(declare-fun m!422315 () Bool)

(assert (=> b!434854 m!422315))

(declare-fun m!422317 () Bool)

(assert (=> b!434839 m!422317))

(declare-fun m!422319 () Bool)

(assert (=> b!434839 m!422319))

(declare-fun m!422321 () Bool)

(assert (=> b!434839 m!422321))

(declare-fun m!422323 () Bool)

(assert (=> b!434841 m!422323))

(declare-fun m!422325 () Bool)

(assert (=> b!434853 m!422325))

(declare-fun m!422327 () Bool)

(assert (=> b!434835 m!422327))

(declare-fun m!422329 () Bool)

(assert (=> b!434835 m!422329))

(declare-fun m!422331 () Bool)

(assert (=> b!434846 m!422331))

(declare-fun m!422333 () Bool)

(assert (=> start!39974 m!422333))

(declare-fun m!422335 () Bool)

(assert (=> start!39974 m!422335))

(declare-fun m!422337 () Bool)

(assert (=> b!434847 m!422337))

(declare-fun m!422339 () Bool)

(assert (=> b!434848 m!422339))

(check-sat (not start!39974) (not b!434854) (not b_lambda!9325) b_and!18145 (not b!434850) (not b!434841) (not b!434835) (not b!434843) (not b!434853) tp_is_empty!11407 (not b!434836) (not b!434844) (not b!434842) (not b!434847) (not b!434839) (not mapNonEmpty!18732) (not b!434848) (not b_next!10255))
(check-sat b_and!18145 (not b_next!10255))
