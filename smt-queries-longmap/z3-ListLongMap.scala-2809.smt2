; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40766 () Bool)

(assert start!40766)

(declare-fun b_free!10755 () Bool)

(declare-fun b_next!10755 () Bool)

(assert (=> start!40766 (= b_free!10755 (not b_next!10755))))

(declare-fun tp!38087 () Bool)

(declare-fun b_and!18797 () Bool)

(assert (=> start!40766 (= tp!38087 b_and!18797)))

(declare-fun b!451645 () Bool)

(declare-fun res!268930 () Bool)

(declare-fun e!264550 () Bool)

(assert (=> b!451645 (=> (not res!268930) (not e!264550))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!27993 0))(
  ( (array!27994 (arr!13441 (Array (_ BitVec 32) (_ BitVec 64))) (size!13793 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27993)

(assert (=> b!451645 (= res!268930 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13793 _keys!709))))))

(declare-fun res!268919 () Bool)

(assert (=> start!40766 (=> (not res!268919) (not e!264550))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40766 (= res!268919 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13793 _keys!709))))))

(assert (=> start!40766 e!264550))

(declare-fun tp_is_empty!12093 () Bool)

(assert (=> start!40766 tp_is_empty!12093))

(assert (=> start!40766 tp!38087))

(assert (=> start!40766 true))

(declare-datatypes ((V!17229 0))(
  ( (V!17230 (val!6091 Int)) )
))
(declare-datatypes ((ValueCell!5703 0))(
  ( (ValueCellFull!5703 (v!8350 V!17229)) (EmptyCell!5703) )
))
(declare-datatypes ((array!27995 0))(
  ( (array!27996 (arr!13442 (Array (_ BitVec 32) ValueCell!5703)) (size!13794 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27995)

(declare-fun e!264547 () Bool)

(declare-fun array_inv!9734 (array!27995) Bool)

(assert (=> start!40766 (and (array_inv!9734 _values!549) e!264547)))

(declare-fun array_inv!9735 (array!27993) Bool)

(assert (=> start!40766 (array_inv!9735 _keys!709)))

(declare-fun b!451646 () Bool)

(declare-fun res!268921 () Bool)

(assert (=> b!451646 (=> (not res!268921) (not e!264550))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!451646 (= res!268921 (and (= (size!13794 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13793 _keys!709) (size!13794 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!451647 () Bool)

(declare-fun e!264546 () Bool)

(assert (=> b!451647 (= e!264546 tp_is_empty!12093)))

(declare-fun b!451648 () Bool)

(declare-fun mapRes!19776 () Bool)

(assert (=> b!451648 (= e!264547 (and e!264546 mapRes!19776))))

(declare-fun condMapEmpty!19776 () Bool)

(declare-fun mapDefault!19776 () ValueCell!5703)

(assert (=> b!451648 (= condMapEmpty!19776 (= (arr!13442 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5703)) mapDefault!19776)))))

(declare-fun e!264554 () Bool)

(declare-fun b!451649 () Bool)

(declare-datatypes ((tuple2!8010 0))(
  ( (tuple2!8011 (_1!4016 (_ BitVec 64)) (_2!4016 V!17229)) )
))
(declare-datatypes ((List!8071 0))(
  ( (Nil!8068) (Cons!8067 (h!8923 tuple2!8010) (t!13849 List!8071)) )
))
(declare-datatypes ((ListLongMap!6923 0))(
  ( (ListLongMap!6924 (toList!3477 List!8071)) )
))
(declare-fun call!29878 () ListLongMap!6923)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!29879 () ListLongMap!6923)

(declare-fun v!412 () V!17229)

(declare-fun +!1556 (ListLongMap!6923 tuple2!8010) ListLongMap!6923)

(assert (=> b!451649 (= e!264554 (= call!29879 (+!1556 call!29878 (tuple2!8011 k0!794 v!412))))))

(declare-fun b!451650 () Bool)

(declare-fun res!268931 () Bool)

(assert (=> b!451650 (=> (not res!268931) (not e!264550))))

(declare-datatypes ((List!8072 0))(
  ( (Nil!8069) (Cons!8068 (h!8924 (_ BitVec 64)) (t!13850 List!8072)) )
))
(declare-fun arrayNoDuplicates!0 (array!27993 (_ BitVec 32) List!8072) Bool)

(assert (=> b!451650 (= res!268931 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8069))))

(declare-fun lt!204979 () array!27993)

(declare-fun minValue!515 () V!17229)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!56081 () Bool)

(declare-fun lt!204980 () array!27995)

(declare-fun bm!29875 () Bool)

(declare-fun zeroValue!515 () V!17229)

(declare-fun getCurrentListMapNoExtraKeys!1661 (array!27993 array!27995 (_ BitVec 32) (_ BitVec 32) V!17229 V!17229 (_ BitVec 32) Int) ListLongMap!6923)

(assert (=> bm!29875 (= call!29878 (getCurrentListMapNoExtraKeys!1661 (ite c!56081 _keys!709 lt!204979) (ite c!56081 _values!549 lt!204980) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29876 () Bool)

(assert (=> bm!29876 (= call!29879 (getCurrentListMapNoExtraKeys!1661 (ite c!56081 lt!204979 _keys!709) (ite c!56081 lt!204980 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451651 () Bool)

(declare-fun res!268920 () Bool)

(declare-fun e!264548 () Bool)

(assert (=> b!451651 (=> (not res!268920) (not e!264548))))

(assert (=> b!451651 (= res!268920 (arrayNoDuplicates!0 lt!204979 #b00000000000000000000000000000000 Nil!8069))))

(declare-fun b!451652 () Bool)

(assert (=> b!451652 (= e!264550 e!264548)))

(declare-fun res!268926 () Bool)

(assert (=> b!451652 (=> (not res!268926) (not e!264548))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27993 (_ BitVec 32)) Bool)

(assert (=> b!451652 (= res!268926 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204979 mask!1025))))

(assert (=> b!451652 (= lt!204979 (array!27994 (store (arr!13441 _keys!709) i!563 k0!794) (size!13793 _keys!709)))))

(declare-fun b!451653 () Bool)

(declare-fun res!268918 () Bool)

(assert (=> b!451653 (=> (not res!268918) (not e!264550))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!451653 (= res!268918 (validMask!0 mask!1025))))

(declare-fun b!451654 () Bool)

(declare-fun res!268923 () Bool)

(assert (=> b!451654 (=> (not res!268923) (not e!264550))))

(assert (=> b!451654 (= res!268923 (or (= (select (arr!13441 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13441 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!451655 () Bool)

(declare-fun e!264552 () Bool)

(assert (=> b!451655 (= e!264552 true)))

(declare-fun lt!204981 () ListLongMap!6923)

(declare-fun get!6619 (ValueCell!5703 V!17229) V!17229)

(declare-fun dynLambda!856 (Int (_ BitVec 64)) V!17229)

(assert (=> b!451655 (= lt!204981 (+!1556 (getCurrentListMapNoExtraKeys!1661 lt!204979 lt!204980 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8011 (select (arr!13441 lt!204979) from!863) (get!6619 (select (arr!13442 lt!204980) from!863) (dynLambda!856 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!451656 () Bool)

(declare-fun res!268928 () Bool)

(assert (=> b!451656 (=> (not res!268928) (not e!264550))))

(declare-fun arrayContainsKey!0 (array!27993 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!451656 (= res!268928 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!451657 () Bool)

(declare-fun res!268929 () Bool)

(assert (=> b!451657 (=> (not res!268929) (not e!264548))))

(assert (=> b!451657 (= res!268929 (bvsle from!863 i!563))))

(declare-fun b!451658 () Bool)

(declare-fun e!264549 () Bool)

(assert (=> b!451658 (= e!264549 tp_is_empty!12093)))

(declare-fun b!451659 () Bool)

(declare-fun e!264551 () Bool)

(assert (=> b!451659 (= e!264551 (not e!264552))))

(declare-fun res!268925 () Bool)

(assert (=> b!451659 (=> res!268925 e!264552)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!451659 (= res!268925 (validKeyInArray!0 (select (arr!13441 _keys!709) from!863)))))

(assert (=> b!451659 e!264554))

(assert (=> b!451659 (= c!56081 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13214 0))(
  ( (Unit!13215) )
))
(declare-fun lt!204982 () Unit!13214)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!722 (array!27993 array!27995 (_ BitVec 32) (_ BitVec 32) V!17229 V!17229 (_ BitVec 32) (_ BitVec 64) V!17229 (_ BitVec 32) Int) Unit!13214)

(assert (=> b!451659 (= lt!204982 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!722 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!451660 () Bool)

(assert (=> b!451660 (= e!264554 (= call!29878 call!29879))))

(declare-fun b!451661 () Bool)

(declare-fun res!268924 () Bool)

(assert (=> b!451661 (=> (not res!268924) (not e!264550))))

(assert (=> b!451661 (= res!268924 (validKeyInArray!0 k0!794))))

(declare-fun b!451662 () Bool)

(assert (=> b!451662 (= e!264548 e!264551)))

(declare-fun res!268922 () Bool)

(assert (=> b!451662 (=> (not res!268922) (not e!264551))))

(assert (=> b!451662 (= res!268922 (= from!863 i!563))))

(assert (=> b!451662 (= lt!204981 (getCurrentListMapNoExtraKeys!1661 lt!204979 lt!204980 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!451662 (= lt!204980 (array!27996 (store (arr!13442 _values!549) i!563 (ValueCellFull!5703 v!412)) (size!13794 _values!549)))))

(declare-fun lt!204983 () ListLongMap!6923)

(assert (=> b!451662 (= lt!204983 (getCurrentListMapNoExtraKeys!1661 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19776 () Bool)

(declare-fun tp!38088 () Bool)

(assert (=> mapNonEmpty!19776 (= mapRes!19776 (and tp!38088 e!264549))))

(declare-fun mapRest!19776 () (Array (_ BitVec 32) ValueCell!5703))

(declare-fun mapValue!19776 () ValueCell!5703)

(declare-fun mapKey!19776 () (_ BitVec 32))

(assert (=> mapNonEmpty!19776 (= (arr!13442 _values!549) (store mapRest!19776 mapKey!19776 mapValue!19776))))

(declare-fun mapIsEmpty!19776 () Bool)

(assert (=> mapIsEmpty!19776 mapRes!19776))

(declare-fun b!451663 () Bool)

(declare-fun res!268927 () Bool)

(assert (=> b!451663 (=> (not res!268927) (not e!264550))))

(assert (=> b!451663 (= res!268927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!40766 res!268919) b!451653))

(assert (= (and b!451653 res!268918) b!451646))

(assert (= (and b!451646 res!268921) b!451663))

(assert (= (and b!451663 res!268927) b!451650))

(assert (= (and b!451650 res!268931) b!451645))

(assert (= (and b!451645 res!268930) b!451661))

(assert (= (and b!451661 res!268924) b!451654))

(assert (= (and b!451654 res!268923) b!451656))

(assert (= (and b!451656 res!268928) b!451652))

(assert (= (and b!451652 res!268926) b!451651))

(assert (= (and b!451651 res!268920) b!451657))

(assert (= (and b!451657 res!268929) b!451662))

(assert (= (and b!451662 res!268922) b!451659))

(assert (= (and b!451659 c!56081) b!451649))

(assert (= (and b!451659 (not c!56081)) b!451660))

(assert (= (or b!451649 b!451660) bm!29876))

(assert (= (or b!451649 b!451660) bm!29875))

(assert (= (and b!451659 (not res!268925)) b!451655))

(assert (= (and b!451648 condMapEmpty!19776) mapIsEmpty!19776))

(assert (= (and b!451648 (not condMapEmpty!19776)) mapNonEmpty!19776))

(get-info :version)

(assert (= (and mapNonEmpty!19776 ((_ is ValueCellFull!5703) mapValue!19776)) b!451658))

(assert (= (and b!451648 ((_ is ValueCellFull!5703) mapDefault!19776)) b!451647))

(assert (= start!40766 b!451648))

(declare-fun b_lambda!9533 () Bool)

(assert (=> (not b_lambda!9533) (not b!451655)))

(declare-fun t!13848 () Bool)

(declare-fun tb!3735 () Bool)

(assert (=> (and start!40766 (= defaultEntry!557 defaultEntry!557) t!13848) tb!3735))

(declare-fun result!7007 () Bool)

(assert (=> tb!3735 (= result!7007 tp_is_empty!12093)))

(assert (=> b!451655 t!13848))

(declare-fun b_and!18799 () Bool)

(assert (= b_and!18797 (and (=> t!13848 result!7007) b_and!18799)))

(declare-fun m!435401 () Bool)

(assert (=> b!451653 m!435401))

(declare-fun m!435403 () Bool)

(assert (=> b!451652 m!435403))

(declare-fun m!435405 () Bool)

(assert (=> b!451652 m!435405))

(declare-fun m!435407 () Bool)

(assert (=> b!451650 m!435407))

(declare-fun m!435409 () Bool)

(assert (=> bm!29875 m!435409))

(declare-fun m!435411 () Bool)

(assert (=> b!451663 m!435411))

(declare-fun m!435413 () Bool)

(assert (=> b!451662 m!435413))

(declare-fun m!435415 () Bool)

(assert (=> b!451662 m!435415))

(declare-fun m!435417 () Bool)

(assert (=> b!451662 m!435417))

(declare-fun m!435419 () Bool)

(assert (=> b!451651 m!435419))

(declare-fun m!435421 () Bool)

(assert (=> start!40766 m!435421))

(declare-fun m!435423 () Bool)

(assert (=> start!40766 m!435423))

(declare-fun m!435425 () Bool)

(assert (=> b!451655 m!435425))

(declare-fun m!435427 () Bool)

(assert (=> b!451655 m!435427))

(declare-fun m!435429 () Bool)

(assert (=> b!451655 m!435429))

(declare-fun m!435431 () Bool)

(assert (=> b!451655 m!435431))

(declare-fun m!435433 () Bool)

(assert (=> b!451655 m!435433))

(assert (=> b!451655 m!435427))

(assert (=> b!451655 m!435429))

(assert (=> b!451655 m!435433))

(declare-fun m!435435 () Bool)

(assert (=> b!451655 m!435435))

(declare-fun m!435437 () Bool)

(assert (=> bm!29876 m!435437))

(declare-fun m!435439 () Bool)

(assert (=> b!451661 m!435439))

(declare-fun m!435441 () Bool)

(assert (=> b!451649 m!435441))

(declare-fun m!435443 () Bool)

(assert (=> b!451656 m!435443))

(declare-fun m!435445 () Bool)

(assert (=> mapNonEmpty!19776 m!435445))

(declare-fun m!435447 () Bool)

(assert (=> b!451659 m!435447))

(assert (=> b!451659 m!435447))

(declare-fun m!435449 () Bool)

(assert (=> b!451659 m!435449))

(declare-fun m!435451 () Bool)

(assert (=> b!451659 m!435451))

(declare-fun m!435453 () Bool)

(assert (=> b!451654 m!435453))

(check-sat (not bm!29876) (not b!451663) (not b_next!10755) (not bm!29875) tp_is_empty!12093 (not b!451655) b_and!18799 (not mapNonEmpty!19776) (not b!451662) (not b!451650) (not b!451652) (not b!451659) (not b!451651) (not b!451656) (not b!451649) (not b!451661) (not b!451653) (not start!40766) (not b_lambda!9533))
(check-sat b_and!18799 (not b_next!10755))
