; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39872 () Bool)

(assert start!39872)

(declare-fun b_free!10153 () Bool)

(declare-fun b_next!10153 () Bool)

(assert (=> start!39872 (= b_free!10153 (not b_next!10153))))

(declare-fun tp!35987 () Bool)

(declare-fun b_and!17979 () Bool)

(assert (=> start!39872 (= tp!35987 b_and!17979)))

(declare-fun b!431895 () Bool)

(declare-fun e!255526 () Bool)

(declare-fun e!255524 () Bool)

(declare-fun mapRes!18579 () Bool)

(assert (=> b!431895 (= e!255526 (and e!255524 mapRes!18579))))

(declare-fun condMapEmpty!18579 () Bool)

(declare-datatypes ((V!16179 0))(
  ( (V!16180 (val!5697 Int)) )
))
(declare-datatypes ((ValueCell!5309 0))(
  ( (ValueCellFull!5309 (v!7945 V!16179)) (EmptyCell!5309) )
))
(declare-datatypes ((array!26448 0))(
  ( (array!26449 (arr!12673 (Array (_ BitVec 32) ValueCell!5309)) (size!13025 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26448)

(declare-fun mapDefault!18579 () ValueCell!5309)

(assert (=> b!431895 (= condMapEmpty!18579 (= (arr!12673 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5309)) mapDefault!18579)))))

(declare-fun b!431896 () Bool)

(declare-fun e!255525 () Bool)

(declare-fun e!255521 () Bool)

(assert (=> b!431896 (= e!255525 e!255521)))

(declare-fun res!254015 () Bool)

(assert (=> b!431896 (=> (not res!254015) (not e!255521))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431896 (= res!254015 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7426 0))(
  ( (tuple2!7427 (_1!3724 (_ BitVec 64)) (_2!3724 V!16179)) )
))
(declare-datatypes ((List!7421 0))(
  ( (Nil!7418) (Cons!7417 (h!8273 tuple2!7426) (t!13015 List!7421)) )
))
(declare-datatypes ((ListLongMap!6341 0))(
  ( (ListLongMap!6342 (toList!3186 List!7421)) )
))
(declare-fun lt!197978 () ListLongMap!6341)

(declare-fun zeroValue!515 () V!16179)

(declare-fun lt!197970 () array!26448)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!26450 0))(
  ( (array!26451 (arr!12674 (Array (_ BitVec 32) (_ BitVec 64))) (size!13026 (_ BitVec 32))) )
))
(declare-fun lt!197973 () array!26450)

(declare-fun minValue!515 () V!16179)

(declare-fun getCurrentListMapNoExtraKeys!1426 (array!26450 array!26448 (_ BitVec 32) (_ BitVec 32) V!16179 V!16179 (_ BitVec 32) Int) ListLongMap!6341)

(assert (=> b!431896 (= lt!197978 (getCurrentListMapNoExtraKeys!1426 lt!197973 lt!197970 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16179)

(assert (=> b!431896 (= lt!197970 (array!26449 (store (arr!12673 _values!549) i!563 (ValueCellFull!5309 v!412)) (size!13025 _values!549)))))

(declare-fun _keys!709 () array!26450)

(declare-fun lt!197979 () ListLongMap!6341)

(assert (=> b!431896 (= lt!197979 (getCurrentListMapNoExtraKeys!1426 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431897 () Bool)

(declare-fun res!254011 () Bool)

(declare-fun e!255520 () Bool)

(assert (=> b!431897 (=> (not res!254011) (not e!255520))))

(assert (=> b!431897 (= res!254011 (and (= (size!13025 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13026 _keys!709) (size!13025 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431898 () Bool)

(declare-datatypes ((Unit!12750 0))(
  ( (Unit!12751) )
))
(declare-fun e!255527 () Unit!12750)

(declare-fun Unit!12752 () Unit!12750)

(assert (=> b!431898 (= e!255527 Unit!12752)))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!197969 () Unit!12750)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26450 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12750)

(assert (=> b!431898 (= lt!197969 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431898 false))

(declare-fun b!431899 () Bool)

(declare-fun res!254010 () Bool)

(assert (=> b!431899 (=> (not res!254010) (not e!255520))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!431899 (= res!254010 (validMask!0 mask!1025))))

(declare-fun b!431900 () Bool)

(declare-fun res!254009 () Bool)

(assert (=> b!431900 (=> (not res!254009) (not e!255520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26450 (_ BitVec 32)) Bool)

(assert (=> b!431900 (= res!254009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431901 () Bool)

(declare-fun res!254008 () Bool)

(assert (=> b!431901 (=> (not res!254008) (not e!255525))))

(declare-datatypes ((List!7422 0))(
  ( (Nil!7419) (Cons!7418 (h!8274 (_ BitVec 64)) (t!13016 List!7422)) )
))
(declare-fun arrayNoDuplicates!0 (array!26450 (_ BitVec 32) List!7422) Bool)

(assert (=> b!431901 (= res!254008 (arrayNoDuplicates!0 lt!197973 #b00000000000000000000000000000000 Nil!7419))))

(declare-fun res!254016 () Bool)

(assert (=> start!39872 (=> (not res!254016) (not e!255520))))

(assert (=> start!39872 (= res!254016 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13026 _keys!709))))))

(assert (=> start!39872 e!255520))

(declare-fun tp_is_empty!11305 () Bool)

(assert (=> start!39872 tp_is_empty!11305))

(assert (=> start!39872 tp!35987))

(assert (=> start!39872 true))

(declare-fun array_inv!9282 (array!26448) Bool)

(assert (=> start!39872 (and (array_inv!9282 _values!549) e!255526)))

(declare-fun array_inv!9283 (array!26450) Bool)

(assert (=> start!39872 (array_inv!9283 _keys!709)))

(declare-fun b!431902 () Bool)

(declare-fun e!255523 () Bool)

(assert (=> b!431902 (= e!255521 (not e!255523))))

(declare-fun res!254018 () Bool)

(assert (=> b!431902 (=> res!254018 e!255523)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431902 (= res!254018 (not (validKeyInArray!0 (select (arr!12674 _keys!709) from!863))))))

(declare-fun lt!197968 () ListLongMap!6341)

(declare-fun lt!197976 () ListLongMap!6341)

(assert (=> b!431902 (= lt!197968 lt!197976)))

(declare-fun lt!197966 () ListLongMap!6341)

(declare-fun lt!197975 () tuple2!7426)

(declare-fun +!1394 (ListLongMap!6341 tuple2!7426) ListLongMap!6341)

(assert (=> b!431902 (= lt!197976 (+!1394 lt!197966 lt!197975))))

(assert (=> b!431902 (= lt!197968 (getCurrentListMapNoExtraKeys!1426 lt!197973 lt!197970 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!431902 (= lt!197975 (tuple2!7427 k0!794 v!412))))

(assert (=> b!431902 (= lt!197966 (getCurrentListMapNoExtraKeys!1426 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197972 () Unit!12750)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!567 (array!26450 array!26448 (_ BitVec 32) (_ BitVec 32) V!16179 V!16179 (_ BitVec 32) (_ BitVec 64) V!16179 (_ BitVec 32) Int) Unit!12750)

(assert (=> b!431902 (= lt!197972 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!567 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!431903 () Bool)

(declare-fun e!255522 () Bool)

(assert (=> b!431903 (= e!255522 true)))

(declare-fun lt!197974 () ListLongMap!6341)

(declare-fun lt!197971 () tuple2!7426)

(assert (=> b!431903 (= lt!197974 (+!1394 (+!1394 lt!197966 lt!197971) lt!197975))))

(declare-fun lt!197965 () V!16179)

(declare-fun lt!197967 () Unit!12750)

(declare-fun addCommutativeForDiffKeys!373 (ListLongMap!6341 (_ BitVec 64) V!16179 (_ BitVec 64) V!16179) Unit!12750)

(assert (=> b!431903 (= lt!197967 (addCommutativeForDiffKeys!373 lt!197966 k0!794 v!412 (select (arr!12674 _keys!709) from!863) lt!197965))))

(declare-fun b!431904 () Bool)

(declare-fun e!255528 () Bool)

(assert (=> b!431904 (= e!255528 tp_is_empty!11305)))

(declare-fun b!431905 () Bool)

(declare-fun res!254014 () Bool)

(assert (=> b!431905 (=> (not res!254014) (not e!255520))))

(assert (=> b!431905 (= res!254014 (or (= (select (arr!12674 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12674 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431906 () Bool)

(declare-fun res!254012 () Bool)

(assert (=> b!431906 (=> (not res!254012) (not e!255520))))

(assert (=> b!431906 (= res!254012 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7419))))

(declare-fun b!431907 () Bool)

(declare-fun res!254021 () Bool)

(assert (=> b!431907 (=> (not res!254021) (not e!255520))))

(assert (=> b!431907 (= res!254021 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!18579 () Bool)

(assert (=> mapIsEmpty!18579 mapRes!18579))

(declare-fun b!431908 () Bool)

(declare-fun res!254020 () Bool)

(assert (=> b!431908 (=> (not res!254020) (not e!255520))))

(declare-fun arrayContainsKey!0 (array!26450 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!431908 (= res!254020 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18579 () Bool)

(declare-fun tp!35988 () Bool)

(assert (=> mapNonEmpty!18579 (= mapRes!18579 (and tp!35988 e!255528))))

(declare-fun mapRest!18579 () (Array (_ BitVec 32) ValueCell!5309))

(declare-fun mapKey!18579 () (_ BitVec 32))

(declare-fun mapValue!18579 () ValueCell!5309)

(assert (=> mapNonEmpty!18579 (= (arr!12673 _values!549) (store mapRest!18579 mapKey!18579 mapValue!18579))))

(declare-fun b!431909 () Bool)

(declare-fun Unit!12753 () Unit!12750)

(assert (=> b!431909 (= e!255527 Unit!12753)))

(declare-fun b!431910 () Bool)

(declare-fun res!254017 () Bool)

(assert (=> b!431910 (=> (not res!254017) (not e!255520))))

(assert (=> b!431910 (= res!254017 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13026 _keys!709))))))

(declare-fun b!431911 () Bool)

(declare-fun res!254019 () Bool)

(assert (=> b!431911 (=> (not res!254019) (not e!255525))))

(assert (=> b!431911 (= res!254019 (bvsle from!863 i!563))))

(declare-fun b!431912 () Bool)

(assert (=> b!431912 (= e!255523 e!255522)))

(declare-fun res!254022 () Bool)

(assert (=> b!431912 (=> res!254022 e!255522)))

(assert (=> b!431912 (= res!254022 (= k0!794 (select (arr!12674 _keys!709) from!863)))))

(assert (=> b!431912 (not (= (select (arr!12674 _keys!709) from!863) k0!794))))

(declare-fun lt!197977 () Unit!12750)

(assert (=> b!431912 (= lt!197977 e!255527)))

(declare-fun c!55542 () Bool)

(assert (=> b!431912 (= c!55542 (= (select (arr!12674 _keys!709) from!863) k0!794))))

(assert (=> b!431912 (= lt!197978 lt!197974)))

(assert (=> b!431912 (= lt!197974 (+!1394 lt!197976 lt!197971))))

(assert (=> b!431912 (= lt!197971 (tuple2!7427 (select (arr!12674 _keys!709) from!863) lt!197965))))

(declare-fun get!6307 (ValueCell!5309 V!16179) V!16179)

(declare-fun dynLambda!802 (Int (_ BitVec 64)) V!16179)

(assert (=> b!431912 (= lt!197965 (get!6307 (select (arr!12673 _values!549) from!863) (dynLambda!802 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431913 () Bool)

(assert (=> b!431913 (= e!255520 e!255525)))

(declare-fun res!254013 () Bool)

(assert (=> b!431913 (=> (not res!254013) (not e!255525))))

(assert (=> b!431913 (= res!254013 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197973 mask!1025))))

(assert (=> b!431913 (= lt!197973 (array!26451 (store (arr!12674 _keys!709) i!563 k0!794) (size!13026 _keys!709)))))

(declare-fun b!431914 () Bool)

(assert (=> b!431914 (= e!255524 tp_is_empty!11305)))

(assert (= (and start!39872 res!254016) b!431899))

(assert (= (and b!431899 res!254010) b!431897))

(assert (= (and b!431897 res!254011) b!431900))

(assert (= (and b!431900 res!254009) b!431906))

(assert (= (and b!431906 res!254012) b!431910))

(assert (= (and b!431910 res!254017) b!431907))

(assert (= (and b!431907 res!254021) b!431905))

(assert (= (and b!431905 res!254014) b!431908))

(assert (= (and b!431908 res!254020) b!431913))

(assert (= (and b!431913 res!254013) b!431901))

(assert (= (and b!431901 res!254008) b!431911))

(assert (= (and b!431911 res!254019) b!431896))

(assert (= (and b!431896 res!254015) b!431902))

(assert (= (and b!431902 (not res!254018)) b!431912))

(assert (= (and b!431912 c!55542) b!431898))

(assert (= (and b!431912 (not c!55542)) b!431909))

(assert (= (and b!431912 (not res!254022)) b!431903))

(assert (= (and b!431895 condMapEmpty!18579) mapIsEmpty!18579))

(assert (= (and b!431895 (not condMapEmpty!18579)) mapNonEmpty!18579))

(get-info :version)

(assert (= (and mapNonEmpty!18579 ((_ is ValueCellFull!5309) mapValue!18579)) b!431904))

(assert (= (and b!431895 ((_ is ValueCellFull!5309) mapDefault!18579)) b!431914))

(assert (= start!39872 b!431895))

(declare-fun b_lambda!9263 () Bool)

(assert (=> (not b_lambda!9263) (not b!431912)))

(declare-fun t!13014 () Bool)

(declare-fun tb!3551 () Bool)

(assert (=> (and start!39872 (= defaultEntry!557 defaultEntry!557) t!13014) tb!3551))

(declare-fun result!6637 () Bool)

(assert (=> tb!3551 (= result!6637 tp_is_empty!11305)))

(assert (=> b!431912 t!13014))

(declare-fun b_and!17981 () Bool)

(assert (= b_and!17979 (and (=> t!13014 result!6637) b_and!17981)))

(declare-fun m!420275 () Bool)

(assert (=> b!431896 m!420275))

(declare-fun m!420277 () Bool)

(assert (=> b!431896 m!420277))

(declare-fun m!420279 () Bool)

(assert (=> b!431896 m!420279))

(declare-fun m!420281 () Bool)

(assert (=> b!431907 m!420281))

(declare-fun m!420283 () Bool)

(assert (=> b!431908 m!420283))

(declare-fun m!420285 () Bool)

(assert (=> b!431899 m!420285))

(declare-fun m!420287 () Bool)

(assert (=> mapNonEmpty!18579 m!420287))

(declare-fun m!420289 () Bool)

(assert (=> b!431906 m!420289))

(declare-fun m!420291 () Bool)

(assert (=> b!431912 m!420291))

(declare-fun m!420293 () Bool)

(assert (=> b!431912 m!420293))

(declare-fun m!420295 () Bool)

(assert (=> b!431912 m!420295))

(declare-fun m!420297 () Bool)

(assert (=> b!431912 m!420297))

(assert (=> b!431912 m!420297))

(assert (=> b!431912 m!420293))

(declare-fun m!420299 () Bool)

(assert (=> b!431912 m!420299))

(declare-fun m!420301 () Bool)

(assert (=> b!431905 m!420301))

(declare-fun m!420303 () Bool)

(assert (=> b!431898 m!420303))

(assert (=> b!431902 m!420291))

(declare-fun m!420305 () Bool)

(assert (=> b!431902 m!420305))

(declare-fun m!420307 () Bool)

(assert (=> b!431902 m!420307))

(assert (=> b!431902 m!420291))

(declare-fun m!420309 () Bool)

(assert (=> b!431902 m!420309))

(declare-fun m!420311 () Bool)

(assert (=> b!431902 m!420311))

(declare-fun m!420313 () Bool)

(assert (=> b!431902 m!420313))

(declare-fun m!420315 () Bool)

(assert (=> b!431901 m!420315))

(declare-fun m!420317 () Bool)

(assert (=> b!431903 m!420317))

(assert (=> b!431903 m!420317))

(declare-fun m!420319 () Bool)

(assert (=> b!431903 m!420319))

(assert (=> b!431903 m!420291))

(assert (=> b!431903 m!420291))

(declare-fun m!420321 () Bool)

(assert (=> b!431903 m!420321))

(declare-fun m!420323 () Bool)

(assert (=> b!431900 m!420323))

(declare-fun m!420325 () Bool)

(assert (=> b!431913 m!420325))

(declare-fun m!420327 () Bool)

(assert (=> b!431913 m!420327))

(declare-fun m!420329 () Bool)

(assert (=> start!39872 m!420329))

(declare-fun m!420331 () Bool)

(assert (=> start!39872 m!420331))

(check-sat tp_is_empty!11305 (not b!431898) (not b!431901) (not b!431906) (not b!431900) (not b!431903) (not start!39872) (not b!431902) (not b!431913) b_and!17981 (not b!431908) (not mapNonEmpty!18579) (not b!431907) (not b_lambda!9263) (not b!431912) (not b!431896) (not b_next!10153) (not b!431899))
(check-sat b_and!17981 (not b_next!10153))
