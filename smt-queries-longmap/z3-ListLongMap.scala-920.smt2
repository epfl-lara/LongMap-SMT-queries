; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20620 () Bool)

(assert start!20620)

(declare-fun b_free!5275 () Bool)

(declare-fun b_next!5275 () Bool)

(assert (=> start!20620 (= b_free!5275 (not b_next!5275))))

(declare-fun tp!18856 () Bool)

(declare-fun b_and!12035 () Bool)

(assert (=> start!20620 (= tp!18856 b_and!12035)))

(declare-fun mapNonEmpty!8765 () Bool)

(declare-fun mapRes!8765 () Bool)

(declare-fun tp!18857 () Bool)

(declare-fun e!134459 () Bool)

(assert (=> mapNonEmpty!8765 (= mapRes!8765 (and tp!18857 e!134459))))

(declare-datatypes ((V!6489 0))(
  ( (V!6490 (val!2610 Int)) )
))
(declare-datatypes ((ValueCell!2222 0))(
  ( (ValueCellFull!2222 (v!4581 V!6489)) (EmptyCell!2222) )
))
(declare-fun mapValue!8765 () ValueCell!2222)

(declare-fun mapKey!8765 () (_ BitVec 32))

(declare-datatypes ((array!9471 0))(
  ( (array!9472 (arr!4486 (Array (_ BitVec 32) ValueCell!2222)) (size!4811 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9471)

(declare-fun mapRest!8765 () (Array (_ BitVec 32) ValueCell!2222))

(assert (=> mapNonEmpty!8765 (= (arr!4486 _values!649) (store mapRest!8765 mapKey!8765 mapValue!8765))))

(declare-fun b!205643 () Bool)

(declare-fun e!134460 () Bool)

(declare-fun e!134465 () Bool)

(assert (=> b!205643 (= e!134460 (and e!134465 mapRes!8765))))

(declare-fun condMapEmpty!8765 () Bool)

(declare-fun mapDefault!8765 () ValueCell!2222)

(assert (=> b!205643 (= condMapEmpty!8765 (= (arr!4486 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2222)) mapDefault!8765)))))

(declare-fun b!205644 () Bool)

(declare-fun e!134461 () Bool)

(declare-fun e!134463 () Bool)

(assert (=> b!205644 (= e!134461 e!134463)))

(declare-fun res!99396 () Bool)

(assert (=> b!205644 (=> res!99396 e!134463)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!205644 (= res!99396 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3910 0))(
  ( (tuple2!3911 (_1!1966 (_ BitVec 64)) (_2!1966 V!6489)) )
))
(declare-datatypes ((List!2801 0))(
  ( (Nil!2798) (Cons!2797 (h!3439 tuple2!3910) (t!7724 List!2801)) )
))
(declare-datatypes ((ListLongMap!2825 0))(
  ( (ListLongMap!2826 (toList!1428 List!2801)) )
))
(declare-fun lt!104787 () ListLongMap!2825)

(declare-fun lt!104798 () ListLongMap!2825)

(assert (=> b!205644 (= lt!104787 lt!104798)))

(declare-fun lt!104796 () ListLongMap!2825)

(declare-fun lt!104797 () tuple2!3910)

(declare-fun +!482 (ListLongMap!2825 tuple2!3910) ListLongMap!2825)

(assert (=> b!205644 (= lt!104798 (+!482 lt!104796 lt!104797))))

(declare-fun lt!104793 () ListLongMap!2825)

(declare-fun lt!104789 () ListLongMap!2825)

(assert (=> b!205644 (= lt!104793 lt!104789)))

(declare-fun lt!104795 () ListLongMap!2825)

(assert (=> b!205644 (= lt!104789 (+!482 lt!104795 lt!104797))))

(declare-fun lt!104791 () ListLongMap!2825)

(assert (=> b!205644 (= lt!104793 (+!482 lt!104791 lt!104797))))

(declare-fun minValue!615 () V!6489)

(assert (=> b!205644 (= lt!104797 (tuple2!3911 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205645 () Bool)

(declare-fun e!134462 () Bool)

(assert (=> b!205645 (= e!134462 (not e!134461))))

(declare-fun res!99402 () Bool)

(assert (=> b!205645 (=> res!99402 e!134461)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205645 (= res!99402 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6489)

(declare-datatypes ((array!9473 0))(
  ( (array!9474 (arr!4487 (Array (_ BitVec 32) (_ BitVec 64))) (size!4812 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9473)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1001 (array!9473 array!9471 (_ BitVec 32) (_ BitVec 32) V!6489 V!6489 (_ BitVec 32) Int) ListLongMap!2825)

(assert (=> b!205645 (= lt!104787 (getCurrentListMap!1001 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104794 () array!9471)

(assert (=> b!205645 (= lt!104793 (getCurrentListMap!1001 _keys!825 lt!104794 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205645 (and (= lt!104791 lt!104795) (= lt!104795 lt!104791))))

(declare-fun lt!104790 () tuple2!3910)

(assert (=> b!205645 (= lt!104795 (+!482 lt!104796 lt!104790))))

(declare-fun v!520 () V!6489)

(assert (=> b!205645 (= lt!104790 (tuple2!3911 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6242 0))(
  ( (Unit!6243) )
))
(declare-fun lt!104792 () Unit!6242)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!137 (array!9473 array!9471 (_ BitVec 32) (_ BitVec 32) V!6489 V!6489 (_ BitVec 32) (_ BitVec 64) V!6489 (_ BitVec 32) Int) Unit!6242)

(assert (=> b!205645 (= lt!104792 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!137 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!394 (array!9473 array!9471 (_ BitVec 32) (_ BitVec 32) V!6489 V!6489 (_ BitVec 32) Int) ListLongMap!2825)

(assert (=> b!205645 (= lt!104791 (getCurrentListMapNoExtraKeys!394 _keys!825 lt!104794 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205645 (= lt!104794 (array!9472 (store (arr!4486 _values!649) i!601 (ValueCellFull!2222 v!520)) (size!4811 _values!649)))))

(assert (=> b!205645 (= lt!104796 (getCurrentListMapNoExtraKeys!394 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205646 () Bool)

(assert (=> b!205646 (= e!134463 true)))

(assert (=> b!205646 (= lt!104789 (+!482 lt!104798 lt!104790))))

(declare-fun lt!104788 () Unit!6242)

(declare-fun addCommutativeForDiffKeys!186 (ListLongMap!2825 (_ BitVec 64) V!6489 (_ BitVec 64) V!6489) Unit!6242)

(assert (=> b!205646 (= lt!104788 (addCommutativeForDiffKeys!186 lt!104796 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!99403 () Bool)

(assert (=> start!20620 (=> (not res!99403) (not e!134462))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20620 (= res!99403 (validMask!0 mask!1149))))

(assert (=> start!20620 e!134462))

(declare-fun array_inv!2939 (array!9471) Bool)

(assert (=> start!20620 (and (array_inv!2939 _values!649) e!134460)))

(assert (=> start!20620 true))

(declare-fun tp_is_empty!5131 () Bool)

(assert (=> start!20620 tp_is_empty!5131))

(declare-fun array_inv!2940 (array!9473) Bool)

(assert (=> start!20620 (array_inv!2940 _keys!825)))

(assert (=> start!20620 tp!18856))

(declare-fun b!205647 () Bool)

(assert (=> b!205647 (= e!134465 tp_is_empty!5131)))

(declare-fun b!205648 () Bool)

(declare-fun res!99399 () Bool)

(assert (=> b!205648 (=> (not res!99399) (not e!134462))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205648 (= res!99399 (validKeyInArray!0 k0!843))))

(declare-fun b!205649 () Bool)

(declare-fun res!99397 () Bool)

(assert (=> b!205649 (=> (not res!99397) (not e!134462))))

(assert (=> b!205649 (= res!99397 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4812 _keys!825))))))

(declare-fun b!205650 () Bool)

(declare-fun res!99398 () Bool)

(assert (=> b!205650 (=> (not res!99398) (not e!134462))))

(assert (=> b!205650 (= res!99398 (and (= (size!4811 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4812 _keys!825) (size!4811 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205651 () Bool)

(assert (=> b!205651 (= e!134459 tp_is_empty!5131)))

(declare-fun b!205652 () Bool)

(declare-fun res!99395 () Bool)

(assert (=> b!205652 (=> (not res!99395) (not e!134462))))

(declare-datatypes ((List!2802 0))(
  ( (Nil!2799) (Cons!2798 (h!3440 (_ BitVec 64)) (t!7725 List!2802)) )
))
(declare-fun arrayNoDuplicates!0 (array!9473 (_ BitVec 32) List!2802) Bool)

(assert (=> b!205652 (= res!99395 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2799))))

(declare-fun b!205653 () Bool)

(declare-fun res!99401 () Bool)

(assert (=> b!205653 (=> (not res!99401) (not e!134462))))

(assert (=> b!205653 (= res!99401 (= (select (arr!4487 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!8765 () Bool)

(assert (=> mapIsEmpty!8765 mapRes!8765))

(declare-fun b!205654 () Bool)

(declare-fun res!99400 () Bool)

(assert (=> b!205654 (=> (not res!99400) (not e!134462))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9473 (_ BitVec 32)) Bool)

(assert (=> b!205654 (= res!99400 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20620 res!99403) b!205650))

(assert (= (and b!205650 res!99398) b!205654))

(assert (= (and b!205654 res!99400) b!205652))

(assert (= (and b!205652 res!99395) b!205649))

(assert (= (and b!205649 res!99397) b!205648))

(assert (= (and b!205648 res!99399) b!205653))

(assert (= (and b!205653 res!99401) b!205645))

(assert (= (and b!205645 (not res!99402)) b!205644))

(assert (= (and b!205644 (not res!99396)) b!205646))

(assert (= (and b!205643 condMapEmpty!8765) mapIsEmpty!8765))

(assert (= (and b!205643 (not condMapEmpty!8765)) mapNonEmpty!8765))

(get-info :version)

(assert (= (and mapNonEmpty!8765 ((_ is ValueCellFull!2222) mapValue!8765)) b!205651))

(assert (= (and b!205643 ((_ is ValueCellFull!2222) mapDefault!8765)) b!205647))

(assert (= start!20620 b!205643))

(declare-fun m!233421 () Bool)

(assert (=> mapNonEmpty!8765 m!233421))

(declare-fun m!233423 () Bool)

(assert (=> b!205654 m!233423))

(declare-fun m!233425 () Bool)

(assert (=> b!205653 m!233425))

(declare-fun m!233427 () Bool)

(assert (=> b!205648 m!233427))

(declare-fun m!233429 () Bool)

(assert (=> b!205644 m!233429))

(declare-fun m!233431 () Bool)

(assert (=> b!205644 m!233431))

(declare-fun m!233433 () Bool)

(assert (=> b!205644 m!233433))

(declare-fun m!233435 () Bool)

(assert (=> start!20620 m!233435))

(declare-fun m!233437 () Bool)

(assert (=> start!20620 m!233437))

(declare-fun m!233439 () Bool)

(assert (=> start!20620 m!233439))

(declare-fun m!233441 () Bool)

(assert (=> b!205652 m!233441))

(declare-fun m!233443 () Bool)

(assert (=> b!205645 m!233443))

(declare-fun m!233445 () Bool)

(assert (=> b!205645 m!233445))

(declare-fun m!233447 () Bool)

(assert (=> b!205645 m!233447))

(declare-fun m!233449 () Bool)

(assert (=> b!205645 m!233449))

(declare-fun m!233451 () Bool)

(assert (=> b!205645 m!233451))

(declare-fun m!233453 () Bool)

(assert (=> b!205645 m!233453))

(declare-fun m!233455 () Bool)

(assert (=> b!205645 m!233455))

(declare-fun m!233457 () Bool)

(assert (=> b!205646 m!233457))

(declare-fun m!233459 () Bool)

(assert (=> b!205646 m!233459))

(check-sat b_and!12035 (not b!205646) (not b!205648) (not start!20620) (not b_next!5275) (not b!205644) (not b!205652) tp_is_empty!5131 (not b!205654) (not b!205645) (not mapNonEmpty!8765))
(check-sat b_and!12035 (not b_next!5275))
