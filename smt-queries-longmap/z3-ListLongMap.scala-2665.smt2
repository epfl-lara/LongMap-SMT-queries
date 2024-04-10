; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39810 () Bool)

(assert start!39810)

(declare-fun b_free!10077 () Bool)

(declare-fun b_next!10077 () Bool)

(assert (=> start!39810 (= b_free!10077 (not b_next!10077))))

(declare-fun tp!35760 () Bool)

(declare-fun b_and!17813 () Bool)

(assert (=> start!39810 (= tp!35760 b_and!17813)))

(declare-fun b!429610 () Bool)

(declare-fun res!252325 () Bool)

(declare-fun e!254437 () Bool)

(assert (=> b!429610 (=> (not res!252325) (not e!254437))))

(declare-datatypes ((array!26293 0))(
  ( (array!26294 (arr!12596 (Array (_ BitVec 32) (_ BitVec 64))) (size!12948 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26293)

(declare-datatypes ((List!7468 0))(
  ( (Nil!7465) (Cons!7464 (h!8320 (_ BitVec 64)) (t!12994 List!7468)) )
))
(declare-fun arrayNoDuplicates!0 (array!26293 (_ BitVec 32) List!7468) Bool)

(assert (=> b!429610 (= res!252325 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7465))))

(declare-fun b!429611 () Bool)

(declare-fun res!252329 () Bool)

(assert (=> b!429611 (=> (not res!252329) (not e!254437))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429611 (= res!252329 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12948 _keys!709))))))

(declare-fun res!252326 () Bool)

(assert (=> start!39810 (=> (not res!252326) (not e!254437))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39810 (= res!252326 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12948 _keys!709))))))

(assert (=> start!39810 e!254437))

(declare-fun tp_is_empty!11229 () Bool)

(assert (=> start!39810 tp_is_empty!11229))

(assert (=> start!39810 tp!35760))

(assert (=> start!39810 true))

(declare-datatypes ((V!16077 0))(
  ( (V!16078 (val!5659 Int)) )
))
(declare-datatypes ((ValueCell!5271 0))(
  ( (ValueCellFull!5271 (v!7906 V!16077)) (EmptyCell!5271) )
))
(declare-datatypes ((array!26295 0))(
  ( (array!26296 (arr!12597 (Array (_ BitVec 32) ValueCell!5271)) (size!12949 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26295)

(declare-fun e!254439 () Bool)

(declare-fun array_inv!9174 (array!26295) Bool)

(assert (=> start!39810 (and (array_inv!9174 _values!549) e!254439)))

(declare-fun array_inv!9175 (array!26293) Bool)

(assert (=> start!39810 (array_inv!9175 _keys!709)))

(declare-fun b!429612 () Bool)

(declare-fun e!254434 () Bool)

(assert (=> b!429612 (= e!254434 true)))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!429612 (not (= (select (arr!12596 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12625 0))(
  ( (Unit!12626) )
))
(declare-fun lt!196355 () Unit!12625)

(declare-fun e!254441 () Unit!12625)

(assert (=> b!429612 (= lt!196355 e!254441)))

(declare-fun c!55451 () Bool)

(assert (=> b!429612 (= c!55451 (= (select (arr!12596 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7452 0))(
  ( (tuple2!7453 (_1!3737 (_ BitVec 64)) (_2!3737 V!16077)) )
))
(declare-datatypes ((List!7469 0))(
  ( (Nil!7466) (Cons!7465 (h!8321 tuple2!7452) (t!12995 List!7469)) )
))
(declare-datatypes ((ListLongMap!6365 0))(
  ( (ListLongMap!6366 (toList!3198 List!7469)) )
))
(declare-fun lt!196350 () ListLongMap!6365)

(declare-fun lt!196352 () ListLongMap!6365)

(declare-fun +!1347 (ListLongMap!6365 tuple2!7452) ListLongMap!6365)

(declare-fun get!6247 (ValueCell!5271 V!16077) V!16077)

(declare-fun dynLambda!774 (Int (_ BitVec 64)) V!16077)

(assert (=> b!429612 (= lt!196350 (+!1347 lt!196352 (tuple2!7453 (select (arr!12596 _keys!709) from!863) (get!6247 (select (arr!12597 _values!549) from!863) (dynLambda!774 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429613 () Bool)

(declare-fun e!254435 () Bool)

(assert (=> b!429613 (= e!254435 tp_is_empty!11229)))

(declare-fun b!429614 () Bool)

(declare-fun Unit!12627 () Unit!12625)

(assert (=> b!429614 (= e!254441 Unit!12627)))

(declare-fun b!429615 () Bool)

(declare-fun Unit!12628 () Unit!12625)

(assert (=> b!429615 (= e!254441 Unit!12628)))

(declare-fun lt!196347 () Unit!12625)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26293 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12625)

(assert (=> b!429615 (= lt!196347 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429615 false))

(declare-fun b!429616 () Bool)

(declare-fun res!252327 () Bool)

(declare-fun e!254440 () Bool)

(assert (=> b!429616 (=> (not res!252327) (not e!254440))))

(assert (=> b!429616 (= res!252327 (bvsle from!863 i!563))))

(declare-fun b!429617 () Bool)

(declare-fun res!252323 () Bool)

(assert (=> b!429617 (=> (not res!252323) (not e!254437))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26293 (_ BitVec 32)) Bool)

(assert (=> b!429617 (= res!252323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429618 () Bool)

(declare-fun e!254438 () Bool)

(assert (=> b!429618 (= e!254440 e!254438)))

(declare-fun res!252328 () Bool)

(assert (=> b!429618 (=> (not res!252328) (not e!254438))))

(assert (=> b!429618 (= res!252328 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16077)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!196349 () array!26293)

(declare-fun zeroValue!515 () V!16077)

(declare-fun lt!196351 () array!26295)

(declare-fun getCurrentListMapNoExtraKeys!1400 (array!26293 array!26295 (_ BitVec 32) (_ BitVec 32) V!16077 V!16077 (_ BitVec 32) Int) ListLongMap!6365)

(assert (=> b!429618 (= lt!196350 (getCurrentListMapNoExtraKeys!1400 lt!196349 lt!196351 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16077)

(assert (=> b!429618 (= lt!196351 (array!26296 (store (arr!12597 _values!549) i!563 (ValueCellFull!5271 v!412)) (size!12949 _values!549)))))

(declare-fun lt!196348 () ListLongMap!6365)

(assert (=> b!429618 (= lt!196348 (getCurrentListMapNoExtraKeys!1400 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429619 () Bool)

(declare-fun res!252331 () Bool)

(assert (=> b!429619 (=> (not res!252331) (not e!254440))))

(assert (=> b!429619 (= res!252331 (arrayNoDuplicates!0 lt!196349 #b00000000000000000000000000000000 Nil!7465))))

(declare-fun b!429620 () Bool)

(declare-fun res!252330 () Bool)

(assert (=> b!429620 (=> (not res!252330) (not e!254437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429620 (= res!252330 (validMask!0 mask!1025))))

(declare-fun b!429621 () Bool)

(declare-fun res!252335 () Bool)

(assert (=> b!429621 (=> (not res!252335) (not e!254437))))

(assert (=> b!429621 (= res!252335 (or (= (select (arr!12596 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12596 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18465 () Bool)

(declare-fun mapRes!18465 () Bool)

(assert (=> mapIsEmpty!18465 mapRes!18465))

(declare-fun mapNonEmpty!18465 () Bool)

(declare-fun tp!35759 () Bool)

(assert (=> mapNonEmpty!18465 (= mapRes!18465 (and tp!35759 e!254435))))

(declare-fun mapRest!18465 () (Array (_ BitVec 32) ValueCell!5271))

(declare-fun mapValue!18465 () ValueCell!5271)

(declare-fun mapKey!18465 () (_ BitVec 32))

(assert (=> mapNonEmpty!18465 (= (arr!12597 _values!549) (store mapRest!18465 mapKey!18465 mapValue!18465))))

(declare-fun b!429622 () Bool)

(declare-fun res!252333 () Bool)

(assert (=> b!429622 (=> (not res!252333) (not e!254437))))

(declare-fun arrayContainsKey!0 (array!26293 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429622 (= res!252333 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429623 () Bool)

(declare-fun res!252332 () Bool)

(assert (=> b!429623 (=> (not res!252332) (not e!254437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429623 (= res!252332 (validKeyInArray!0 k0!794))))

(declare-fun b!429624 () Bool)

(declare-fun e!254436 () Bool)

(assert (=> b!429624 (= e!254436 tp_is_empty!11229)))

(declare-fun b!429625 () Bool)

(declare-fun res!252334 () Bool)

(assert (=> b!429625 (=> (not res!252334) (not e!254437))))

(assert (=> b!429625 (= res!252334 (and (= (size!12949 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12948 _keys!709) (size!12949 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!429626 () Bool)

(assert (=> b!429626 (= e!254438 (not e!254434))))

(declare-fun res!252336 () Bool)

(assert (=> b!429626 (=> res!252336 e!254434)))

(assert (=> b!429626 (= res!252336 (not (validKeyInArray!0 (select (arr!12596 _keys!709) from!863))))))

(declare-fun lt!196354 () ListLongMap!6365)

(assert (=> b!429626 (= lt!196354 lt!196352)))

(declare-fun lt!196346 () ListLongMap!6365)

(assert (=> b!429626 (= lt!196352 (+!1347 lt!196346 (tuple2!7453 k0!794 v!412)))))

(assert (=> b!429626 (= lt!196354 (getCurrentListMapNoExtraKeys!1400 lt!196349 lt!196351 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!429626 (= lt!196346 (getCurrentListMapNoExtraKeys!1400 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196353 () Unit!12625)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!536 (array!26293 array!26295 (_ BitVec 32) (_ BitVec 32) V!16077 V!16077 (_ BitVec 32) (_ BitVec 64) V!16077 (_ BitVec 32) Int) Unit!12625)

(assert (=> b!429626 (= lt!196353 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!536 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429627 () Bool)

(assert (=> b!429627 (= e!254437 e!254440)))

(declare-fun res!252324 () Bool)

(assert (=> b!429627 (=> (not res!252324) (not e!254440))))

(assert (=> b!429627 (= res!252324 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196349 mask!1025))))

(assert (=> b!429627 (= lt!196349 (array!26294 (store (arr!12596 _keys!709) i!563 k0!794) (size!12948 _keys!709)))))

(declare-fun b!429628 () Bool)

(assert (=> b!429628 (= e!254439 (and e!254436 mapRes!18465))))

(declare-fun condMapEmpty!18465 () Bool)

(declare-fun mapDefault!18465 () ValueCell!5271)

(assert (=> b!429628 (= condMapEmpty!18465 (= (arr!12597 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5271)) mapDefault!18465)))))

(assert (= (and start!39810 res!252326) b!429620))

(assert (= (and b!429620 res!252330) b!429625))

(assert (= (and b!429625 res!252334) b!429617))

(assert (= (and b!429617 res!252323) b!429610))

(assert (= (and b!429610 res!252325) b!429611))

(assert (= (and b!429611 res!252329) b!429623))

(assert (= (and b!429623 res!252332) b!429621))

(assert (= (and b!429621 res!252335) b!429622))

(assert (= (and b!429622 res!252333) b!429627))

(assert (= (and b!429627 res!252324) b!429619))

(assert (= (and b!429619 res!252331) b!429616))

(assert (= (and b!429616 res!252327) b!429618))

(assert (= (and b!429618 res!252328) b!429626))

(assert (= (and b!429626 (not res!252336)) b!429612))

(assert (= (and b!429612 c!55451) b!429615))

(assert (= (and b!429612 (not c!55451)) b!429614))

(assert (= (and b!429628 condMapEmpty!18465) mapIsEmpty!18465))

(assert (= (and b!429628 (not condMapEmpty!18465)) mapNonEmpty!18465))

(get-info :version)

(assert (= (and mapNonEmpty!18465 ((_ is ValueCellFull!5271) mapValue!18465)) b!429613))

(assert (= (and b!429628 ((_ is ValueCellFull!5271) mapDefault!18465)) b!429624))

(assert (= start!39810 b!429628))

(declare-fun b_lambda!9165 () Bool)

(assert (=> (not b_lambda!9165) (not b!429612)))

(declare-fun t!12993 () Bool)

(declare-fun tb!3483 () Bool)

(assert (=> (and start!39810 (= defaultEntry!557 defaultEntry!557) t!12993) tb!3483))

(declare-fun result!6493 () Bool)

(assert (=> tb!3483 (= result!6493 tp_is_empty!11229)))

(assert (=> b!429612 t!12993))

(declare-fun b_and!17815 () Bool)

(assert (= b_and!17813 (and (=> t!12993 result!6493) b_and!17815)))

(declare-fun m!417901 () Bool)

(assert (=> b!429615 m!417901))

(declare-fun m!417903 () Bool)

(assert (=> b!429622 m!417903))

(declare-fun m!417905 () Bool)

(assert (=> b!429610 m!417905))

(declare-fun m!417907 () Bool)

(assert (=> start!39810 m!417907))

(declare-fun m!417909 () Bool)

(assert (=> start!39810 m!417909))

(declare-fun m!417911 () Bool)

(assert (=> b!429626 m!417911))

(declare-fun m!417913 () Bool)

(assert (=> b!429626 m!417913))

(declare-fun m!417915 () Bool)

(assert (=> b!429626 m!417915))

(declare-fun m!417917 () Bool)

(assert (=> b!429626 m!417917))

(assert (=> b!429626 m!417911))

(declare-fun m!417919 () Bool)

(assert (=> b!429626 m!417919))

(declare-fun m!417921 () Bool)

(assert (=> b!429626 m!417921))

(declare-fun m!417923 () Bool)

(assert (=> b!429618 m!417923))

(declare-fun m!417925 () Bool)

(assert (=> b!429618 m!417925))

(declare-fun m!417927 () Bool)

(assert (=> b!429618 m!417927))

(declare-fun m!417929 () Bool)

(assert (=> b!429627 m!417929))

(declare-fun m!417931 () Bool)

(assert (=> b!429627 m!417931))

(declare-fun m!417933 () Bool)

(assert (=> b!429621 m!417933))

(declare-fun m!417935 () Bool)

(assert (=> b!429620 m!417935))

(assert (=> b!429612 m!417911))

(declare-fun m!417937 () Bool)

(assert (=> b!429612 m!417937))

(declare-fun m!417939 () Bool)

(assert (=> b!429612 m!417939))

(declare-fun m!417941 () Bool)

(assert (=> b!429612 m!417941))

(assert (=> b!429612 m!417939))

(assert (=> b!429612 m!417937))

(declare-fun m!417943 () Bool)

(assert (=> b!429612 m!417943))

(declare-fun m!417945 () Bool)

(assert (=> b!429619 m!417945))

(declare-fun m!417947 () Bool)

(assert (=> b!429623 m!417947))

(declare-fun m!417949 () Bool)

(assert (=> mapNonEmpty!18465 m!417949))

(declare-fun m!417951 () Bool)

(assert (=> b!429617 m!417951))

(check-sat (not b!429620) (not b!429610) (not b!429622) b_and!17815 (not mapNonEmpty!18465) (not b!429615) (not b_lambda!9165) (not b!429618) (not b!429612) tp_is_empty!11229 (not b!429623) (not b!429619) (not b!429627) (not b!429626) (not b!429617) (not b_next!10077) (not start!39810))
(check-sat b_and!17815 (not b_next!10077))
