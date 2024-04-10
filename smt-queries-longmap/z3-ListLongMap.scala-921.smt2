; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20624 () Bool)

(assert start!20624)

(declare-fun b_free!5283 () Bool)

(declare-fun b_next!5283 () Bool)

(assert (=> start!20624 (= b_free!5283 (not b_next!5283))))

(declare-fun tp!18880 () Bool)

(declare-fun b_and!12029 () Bool)

(assert (=> start!20624 (= tp!18880 b_and!12029)))

(declare-fun res!99490 () Bool)

(declare-fun e!134525 () Bool)

(assert (=> start!20624 (=> (not res!99490) (not e!134525))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20624 (= res!99490 (validMask!0 mask!1149))))

(assert (=> start!20624 e!134525))

(declare-datatypes ((V!6499 0))(
  ( (V!6500 (val!2614 Int)) )
))
(declare-datatypes ((ValueCell!2226 0))(
  ( (ValueCellFull!2226 (v!4584 V!6499)) (EmptyCell!2226) )
))
(declare-datatypes ((array!9489 0))(
  ( (array!9490 (arr!4495 (Array (_ BitVec 32) ValueCell!2226)) (size!4820 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9489)

(declare-fun e!134523 () Bool)

(declare-fun array_inv!2973 (array!9489) Bool)

(assert (=> start!20624 (and (array_inv!2973 _values!649) e!134523)))

(assert (=> start!20624 true))

(declare-fun tp_is_empty!5139 () Bool)

(assert (=> start!20624 tp_is_empty!5139))

(declare-datatypes ((array!9491 0))(
  ( (array!9492 (arr!4496 (Array (_ BitVec 32) (_ BitVec 64))) (size!4821 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9491)

(declare-fun array_inv!2974 (array!9491) Bool)

(assert (=> start!20624 (array_inv!2974 _keys!825)))

(assert (=> start!20624 tp!18880))

(declare-fun b!205740 () Bool)

(declare-fun e!134524 () Bool)

(declare-fun e!134520 () Bool)

(assert (=> b!205740 (= e!134524 e!134520)))

(declare-fun res!99484 () Bool)

(assert (=> b!205740 (=> res!99484 e!134520)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!205740 (= res!99484 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3966 0))(
  ( (tuple2!3967 (_1!1994 (_ BitVec 64)) (_2!1994 V!6499)) )
))
(declare-datatypes ((List!2861 0))(
  ( (Nil!2858) (Cons!2857 (h!3499 tuple2!3966) (t!7792 List!2861)) )
))
(declare-datatypes ((ListLongMap!2879 0))(
  ( (ListLongMap!2880 (toList!1455 List!2861)) )
))
(declare-fun lt!104883 () ListLongMap!2879)

(declare-fun lt!104882 () ListLongMap!2879)

(assert (=> b!205740 (= lt!104883 lt!104882)))

(declare-fun lt!104874 () ListLongMap!2879)

(declare-fun lt!104872 () tuple2!3966)

(declare-fun +!482 (ListLongMap!2879 tuple2!3966) ListLongMap!2879)

(assert (=> b!205740 (= lt!104882 (+!482 lt!104874 lt!104872))))

(declare-fun lt!104875 () ListLongMap!2879)

(declare-fun lt!104879 () ListLongMap!2879)

(assert (=> b!205740 (= lt!104875 lt!104879)))

(declare-fun lt!104877 () ListLongMap!2879)

(assert (=> b!205740 (= lt!104879 (+!482 lt!104877 lt!104872))))

(declare-fun lt!104880 () ListLongMap!2879)

(assert (=> b!205740 (= lt!104875 (+!482 lt!104880 lt!104872))))

(declare-fun minValue!615 () V!6499)

(assert (=> b!205740 (= lt!104872 (tuple2!3967 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205741 () Bool)

(declare-fun res!99482 () Bool)

(assert (=> b!205741 (=> (not res!99482) (not e!134525))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205741 (= res!99482 (= (select (arr!4496 _keys!825) i!601) k0!843))))

(declare-fun b!205742 () Bool)

(assert (=> b!205742 (= e!134525 (not e!134524))))

(declare-fun res!99485 () Bool)

(assert (=> b!205742 (=> res!99485 e!134524)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205742 (= res!99485 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6499)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1025 (array!9491 array!9489 (_ BitVec 32) (_ BitVec 32) V!6499 V!6499 (_ BitVec 32) Int) ListLongMap!2879)

(assert (=> b!205742 (= lt!104883 (getCurrentListMap!1025 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104878 () array!9489)

(assert (=> b!205742 (= lt!104875 (getCurrentListMap!1025 _keys!825 lt!104878 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205742 (and (= lt!104880 lt!104877) (= lt!104877 lt!104880))))

(declare-fun lt!104873 () tuple2!3966)

(assert (=> b!205742 (= lt!104877 (+!482 lt!104874 lt!104873))))

(declare-fun v!520 () V!6499)

(assert (=> b!205742 (= lt!104873 (tuple2!3967 k0!843 v!520))))

(declare-datatypes ((Unit!6254 0))(
  ( (Unit!6255) )
))
(declare-fun lt!104881 () Unit!6254)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!138 (array!9491 array!9489 (_ BitVec 32) (_ BitVec 32) V!6499 V!6499 (_ BitVec 32) (_ BitVec 64) V!6499 (_ BitVec 32) Int) Unit!6254)

(assert (=> b!205742 (= lt!104881 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!138 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!399 (array!9491 array!9489 (_ BitVec 32) (_ BitVec 32) V!6499 V!6499 (_ BitVec 32) Int) ListLongMap!2879)

(assert (=> b!205742 (= lt!104880 (getCurrentListMapNoExtraKeys!399 _keys!825 lt!104878 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205742 (= lt!104878 (array!9490 (store (arr!4495 _values!649) i!601 (ValueCellFull!2226 v!520)) (size!4820 _values!649)))))

(assert (=> b!205742 (= lt!104874 (getCurrentListMapNoExtraKeys!399 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205743 () Bool)

(assert (=> b!205743 (= e!134520 true)))

(assert (=> b!205743 (= lt!104879 (+!482 lt!104882 lt!104873))))

(declare-fun lt!104876 () Unit!6254)

(declare-fun addCommutativeForDiffKeys!181 (ListLongMap!2879 (_ BitVec 64) V!6499 (_ BitVec 64) V!6499) Unit!6254)

(assert (=> b!205743 (= lt!104876 (addCommutativeForDiffKeys!181 lt!104874 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205744 () Bool)

(declare-fun res!99483 () Bool)

(assert (=> b!205744 (=> (not res!99483) (not e!134525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9491 (_ BitVec 32)) Bool)

(assert (=> b!205744 (= res!99483 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205745 () Bool)

(declare-fun res!99489 () Bool)

(assert (=> b!205745 (=> (not res!99489) (not e!134525))))

(declare-datatypes ((List!2862 0))(
  ( (Nil!2859) (Cons!2858 (h!3500 (_ BitVec 64)) (t!7793 List!2862)) )
))
(declare-fun arrayNoDuplicates!0 (array!9491 (_ BitVec 32) List!2862) Bool)

(assert (=> b!205745 (= res!99489 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2859))))

(declare-fun b!205746 () Bool)

(declare-fun e!134522 () Bool)

(declare-fun mapRes!8777 () Bool)

(assert (=> b!205746 (= e!134523 (and e!134522 mapRes!8777))))

(declare-fun condMapEmpty!8777 () Bool)

(declare-fun mapDefault!8777 () ValueCell!2226)

(assert (=> b!205746 (= condMapEmpty!8777 (= (arr!4495 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2226)) mapDefault!8777)))))

(declare-fun b!205747 () Bool)

(declare-fun res!99488 () Bool)

(assert (=> b!205747 (=> (not res!99488) (not e!134525))))

(assert (=> b!205747 (= res!99488 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4821 _keys!825))))))

(declare-fun mapNonEmpty!8777 () Bool)

(declare-fun tp!18881 () Bool)

(declare-fun e!134521 () Bool)

(assert (=> mapNonEmpty!8777 (= mapRes!8777 (and tp!18881 e!134521))))

(declare-fun mapKey!8777 () (_ BitVec 32))

(declare-fun mapValue!8777 () ValueCell!2226)

(declare-fun mapRest!8777 () (Array (_ BitVec 32) ValueCell!2226))

(assert (=> mapNonEmpty!8777 (= (arr!4495 _values!649) (store mapRest!8777 mapKey!8777 mapValue!8777))))

(declare-fun b!205748 () Bool)

(declare-fun res!99487 () Bool)

(assert (=> b!205748 (=> (not res!99487) (not e!134525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205748 (= res!99487 (validKeyInArray!0 k0!843))))

(declare-fun b!205749 () Bool)

(assert (=> b!205749 (= e!134522 tp_is_empty!5139)))

(declare-fun mapIsEmpty!8777 () Bool)

(assert (=> mapIsEmpty!8777 mapRes!8777))

(declare-fun b!205750 () Bool)

(declare-fun res!99486 () Bool)

(assert (=> b!205750 (=> (not res!99486) (not e!134525))))

(assert (=> b!205750 (= res!99486 (and (= (size!4820 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4821 _keys!825) (size!4820 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205751 () Bool)

(assert (=> b!205751 (= e!134521 tp_is_empty!5139)))

(assert (= (and start!20624 res!99490) b!205750))

(assert (= (and b!205750 res!99486) b!205744))

(assert (= (and b!205744 res!99483) b!205745))

(assert (= (and b!205745 res!99489) b!205747))

(assert (= (and b!205747 res!99488) b!205748))

(assert (= (and b!205748 res!99487) b!205741))

(assert (= (and b!205741 res!99482) b!205742))

(assert (= (and b!205742 (not res!99485)) b!205740))

(assert (= (and b!205740 (not res!99484)) b!205743))

(assert (= (and b!205746 condMapEmpty!8777) mapIsEmpty!8777))

(assert (= (and b!205746 (not condMapEmpty!8777)) mapNonEmpty!8777))

(get-info :version)

(assert (= (and mapNonEmpty!8777 ((_ is ValueCellFull!2226) mapValue!8777)) b!205751))

(assert (= (and b!205746 ((_ is ValueCellFull!2226) mapDefault!8777)) b!205749))

(assert (= start!20624 b!205746))

(declare-fun m!233399 () Bool)

(assert (=> b!205745 m!233399))

(declare-fun m!233401 () Bool)

(assert (=> b!205748 m!233401))

(declare-fun m!233403 () Bool)

(assert (=> b!205743 m!233403))

(declare-fun m!233405 () Bool)

(assert (=> b!205743 m!233405))

(declare-fun m!233407 () Bool)

(assert (=> b!205740 m!233407))

(declare-fun m!233409 () Bool)

(assert (=> b!205740 m!233409))

(declare-fun m!233411 () Bool)

(assert (=> b!205740 m!233411))

(declare-fun m!233413 () Bool)

(assert (=> b!205742 m!233413))

(declare-fun m!233415 () Bool)

(assert (=> b!205742 m!233415))

(declare-fun m!233417 () Bool)

(assert (=> b!205742 m!233417))

(declare-fun m!233419 () Bool)

(assert (=> b!205742 m!233419))

(declare-fun m!233421 () Bool)

(assert (=> b!205742 m!233421))

(declare-fun m!233423 () Bool)

(assert (=> b!205742 m!233423))

(declare-fun m!233425 () Bool)

(assert (=> b!205742 m!233425))

(declare-fun m!233427 () Bool)

(assert (=> start!20624 m!233427))

(declare-fun m!233429 () Bool)

(assert (=> start!20624 m!233429))

(declare-fun m!233431 () Bool)

(assert (=> start!20624 m!233431))

(declare-fun m!233433 () Bool)

(assert (=> b!205744 m!233433))

(declare-fun m!233435 () Bool)

(assert (=> b!205741 m!233435))

(declare-fun m!233437 () Bool)

(assert (=> mapNonEmpty!8777 m!233437))

(check-sat (not b_next!5283) (not b!205744) (not b!205740) (not b!205748) b_and!12029 (not b!205745) (not b!205742) (not b!205743) tp_is_empty!5139 (not mapNonEmpty!8777) (not start!20624))
(check-sat b_and!12029 (not b_next!5283))
