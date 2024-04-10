; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20618 () Bool)

(assert start!20618)

(declare-fun b_free!5277 () Bool)

(declare-fun b_next!5277 () Bool)

(assert (=> start!20618 (= b_free!5277 (not b_next!5277))))

(declare-fun tp!18863 () Bool)

(declare-fun b_and!12023 () Bool)

(assert (=> start!20618 (= tp!18863 b_and!12023)))

(declare-fun mapNonEmpty!8768 () Bool)

(declare-fun mapRes!8768 () Bool)

(declare-fun tp!18862 () Bool)

(declare-fun e!134462 () Bool)

(assert (=> mapNonEmpty!8768 (= mapRes!8768 (and tp!18862 e!134462))))

(declare-datatypes ((V!6491 0))(
  ( (V!6492 (val!2611 Int)) )
))
(declare-datatypes ((ValueCell!2223 0))(
  ( (ValueCellFull!2223 (v!4581 V!6491)) (EmptyCell!2223) )
))
(declare-fun mapValue!8768 () ValueCell!2223)

(declare-datatypes ((array!9479 0))(
  ( (array!9480 (arr!4490 (Array (_ BitVec 32) ValueCell!2223)) (size!4815 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9479)

(declare-fun mapRest!8768 () (Array (_ BitVec 32) ValueCell!2223))

(declare-fun mapKey!8768 () (_ BitVec 32))

(assert (=> mapNonEmpty!8768 (= (arr!4490 _values!649) (store mapRest!8768 mapKey!8768 mapValue!8768))))

(declare-fun b!205632 () Bool)

(declare-fun res!99409 () Bool)

(declare-fun e!134456 () Bool)

(assert (=> b!205632 (=> (not res!99409) (not e!134456))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205632 (= res!99409 (validKeyInArray!0 k0!843))))

(declare-fun b!205633 () Bool)

(declare-fun e!134461 () Bool)

(declare-fun e!134458 () Bool)

(assert (=> b!205633 (= e!134461 (and e!134458 mapRes!8768))))

(declare-fun condMapEmpty!8768 () Bool)

(declare-fun mapDefault!8768 () ValueCell!2223)

(assert (=> b!205633 (= condMapEmpty!8768 (= (arr!4490 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2223)) mapDefault!8768)))))

(declare-fun b!205634 () Bool)

(declare-fun tp_is_empty!5133 () Bool)

(assert (=> b!205634 (= e!134462 tp_is_empty!5133)))

(declare-fun b!205635 () Bool)

(declare-fun e!134457 () Bool)

(declare-fun e!134459 () Bool)

(assert (=> b!205635 (= e!134457 e!134459)))

(declare-fun res!99406 () Bool)

(assert (=> b!205635 (=> res!99406 e!134459)))

(assert (=> b!205635 (= res!99406 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3962 0))(
  ( (tuple2!3963 (_1!1992 (_ BitVec 64)) (_2!1992 V!6491)) )
))
(declare-datatypes ((List!2858 0))(
  ( (Nil!2855) (Cons!2854 (h!3496 tuple2!3962) (t!7789 List!2858)) )
))
(declare-datatypes ((ListLongMap!2875 0))(
  ( (ListLongMap!2876 (toList!1453 List!2858)) )
))
(declare-fun lt!104773 () ListLongMap!2875)

(declare-fun lt!104764 () ListLongMap!2875)

(assert (=> b!205635 (= lt!104773 lt!104764)))

(declare-fun lt!104767 () ListLongMap!2875)

(declare-fun lt!104772 () tuple2!3962)

(declare-fun +!480 (ListLongMap!2875 tuple2!3962) ListLongMap!2875)

(assert (=> b!205635 (= lt!104764 (+!480 lt!104767 lt!104772))))

(declare-fun lt!104769 () ListLongMap!2875)

(declare-fun lt!104771 () ListLongMap!2875)

(assert (=> b!205635 (= lt!104769 lt!104771)))

(declare-fun lt!104775 () ListLongMap!2875)

(assert (=> b!205635 (= lt!104771 (+!480 lt!104775 lt!104772))))

(declare-fun lt!104766 () ListLongMap!2875)

(assert (=> b!205635 (= lt!104769 (+!480 lt!104766 lt!104772))))

(declare-fun minValue!615 () V!6491)

(assert (=> b!205635 (= lt!104772 (tuple2!3963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205636 () Bool)

(assert (=> b!205636 (= e!134459 true)))

(declare-fun lt!104774 () tuple2!3962)

(assert (=> b!205636 (= lt!104771 (+!480 lt!104764 lt!104774))))

(declare-fun v!520 () V!6491)

(declare-datatypes ((Unit!6252 0))(
  ( (Unit!6253) )
))
(declare-fun lt!104770 () Unit!6252)

(declare-fun addCommutativeForDiffKeys!180 (ListLongMap!2875 (_ BitVec 64) V!6491 (_ BitVec 64) V!6491) Unit!6252)

(assert (=> b!205636 (= lt!104770 (addCommutativeForDiffKeys!180 lt!104767 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205637 () Bool)

(declare-fun res!99401 () Bool)

(assert (=> b!205637 (=> (not res!99401) (not e!134456))))

(declare-datatypes ((array!9481 0))(
  ( (array!9482 (arr!4491 (Array (_ BitVec 32) (_ BitVec 64))) (size!4816 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9481)

(declare-datatypes ((List!2859 0))(
  ( (Nil!2856) (Cons!2855 (h!3497 (_ BitVec 64)) (t!7790 List!2859)) )
))
(declare-fun arrayNoDuplicates!0 (array!9481 (_ BitVec 32) List!2859) Bool)

(assert (=> b!205637 (= res!99401 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2856))))

(declare-fun b!205638 () Bool)

(declare-fun res!99404 () Bool)

(assert (=> b!205638 (=> (not res!99404) (not e!134456))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205638 (= res!99404 (and (= (size!4815 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4816 _keys!825) (size!4815 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205639 () Bool)

(declare-fun res!99408 () Bool)

(assert (=> b!205639 (=> (not res!99408) (not e!134456))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205639 (= res!99408 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4816 _keys!825))))))

(declare-fun b!205640 () Bool)

(assert (=> b!205640 (= e!134458 tp_is_empty!5133)))

(declare-fun res!99403 () Bool)

(assert (=> start!20618 (=> (not res!99403) (not e!134456))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20618 (= res!99403 (validMask!0 mask!1149))))

(assert (=> start!20618 e!134456))

(declare-fun array_inv!2971 (array!9479) Bool)

(assert (=> start!20618 (and (array_inv!2971 _values!649) e!134461)))

(assert (=> start!20618 true))

(assert (=> start!20618 tp_is_empty!5133))

(declare-fun array_inv!2972 (array!9481) Bool)

(assert (=> start!20618 (array_inv!2972 _keys!825)))

(assert (=> start!20618 tp!18863))

(declare-fun b!205641 () Bool)

(assert (=> b!205641 (= e!134456 (not e!134457))))

(declare-fun res!99402 () Bool)

(assert (=> b!205641 (=> res!99402 e!134457)))

(assert (=> b!205641 (= res!99402 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6491)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1024 (array!9481 array!9479 (_ BitVec 32) (_ BitVec 32) V!6491 V!6491 (_ BitVec 32) Int) ListLongMap!2875)

(assert (=> b!205641 (= lt!104773 (getCurrentListMap!1024 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104768 () array!9479)

(assert (=> b!205641 (= lt!104769 (getCurrentListMap!1024 _keys!825 lt!104768 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205641 (and (= lt!104766 lt!104775) (= lt!104775 lt!104766))))

(assert (=> b!205641 (= lt!104775 (+!480 lt!104767 lt!104774))))

(assert (=> b!205641 (= lt!104774 (tuple2!3963 k0!843 v!520))))

(declare-fun lt!104765 () Unit!6252)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!137 (array!9481 array!9479 (_ BitVec 32) (_ BitVec 32) V!6491 V!6491 (_ BitVec 32) (_ BitVec 64) V!6491 (_ BitVec 32) Int) Unit!6252)

(assert (=> b!205641 (= lt!104765 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!137 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!398 (array!9481 array!9479 (_ BitVec 32) (_ BitVec 32) V!6491 V!6491 (_ BitVec 32) Int) ListLongMap!2875)

(assert (=> b!205641 (= lt!104766 (getCurrentListMapNoExtraKeys!398 _keys!825 lt!104768 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205641 (= lt!104768 (array!9480 (store (arr!4490 _values!649) i!601 (ValueCellFull!2223 v!520)) (size!4815 _values!649)))))

(assert (=> b!205641 (= lt!104767 (getCurrentListMapNoExtraKeys!398 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8768 () Bool)

(assert (=> mapIsEmpty!8768 mapRes!8768))

(declare-fun b!205642 () Bool)

(declare-fun res!99407 () Bool)

(assert (=> b!205642 (=> (not res!99407) (not e!134456))))

(assert (=> b!205642 (= res!99407 (= (select (arr!4491 _keys!825) i!601) k0!843))))

(declare-fun b!205643 () Bool)

(declare-fun res!99405 () Bool)

(assert (=> b!205643 (=> (not res!99405) (not e!134456))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9481 (_ BitVec 32)) Bool)

(assert (=> b!205643 (= res!99405 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20618 res!99403) b!205638))

(assert (= (and b!205638 res!99404) b!205643))

(assert (= (and b!205643 res!99405) b!205637))

(assert (= (and b!205637 res!99401) b!205639))

(assert (= (and b!205639 res!99408) b!205632))

(assert (= (and b!205632 res!99409) b!205642))

(assert (= (and b!205642 res!99407) b!205641))

(assert (= (and b!205641 (not res!99402)) b!205635))

(assert (= (and b!205635 (not res!99406)) b!205636))

(assert (= (and b!205633 condMapEmpty!8768) mapIsEmpty!8768))

(assert (= (and b!205633 (not condMapEmpty!8768)) mapNonEmpty!8768))

(get-info :version)

(assert (= (and mapNonEmpty!8768 ((_ is ValueCellFull!2223) mapValue!8768)) b!205634))

(assert (= (and b!205633 ((_ is ValueCellFull!2223) mapDefault!8768)) b!205640))

(assert (= start!20618 b!205633))

(declare-fun m!233279 () Bool)

(assert (=> b!205641 m!233279))

(declare-fun m!233281 () Bool)

(assert (=> b!205641 m!233281))

(declare-fun m!233283 () Bool)

(assert (=> b!205641 m!233283))

(declare-fun m!233285 () Bool)

(assert (=> b!205641 m!233285))

(declare-fun m!233287 () Bool)

(assert (=> b!205641 m!233287))

(declare-fun m!233289 () Bool)

(assert (=> b!205641 m!233289))

(declare-fun m!233291 () Bool)

(assert (=> b!205641 m!233291))

(declare-fun m!233293 () Bool)

(assert (=> mapNonEmpty!8768 m!233293))

(declare-fun m!233295 () Bool)

(assert (=> b!205642 m!233295))

(declare-fun m!233297 () Bool)

(assert (=> b!205635 m!233297))

(declare-fun m!233299 () Bool)

(assert (=> b!205635 m!233299))

(declare-fun m!233301 () Bool)

(assert (=> b!205635 m!233301))

(declare-fun m!233303 () Bool)

(assert (=> b!205637 m!233303))

(declare-fun m!233305 () Bool)

(assert (=> start!20618 m!233305))

(declare-fun m!233307 () Bool)

(assert (=> start!20618 m!233307))

(declare-fun m!233309 () Bool)

(assert (=> start!20618 m!233309))

(declare-fun m!233311 () Bool)

(assert (=> b!205643 m!233311))

(declare-fun m!233313 () Bool)

(assert (=> b!205632 m!233313))

(declare-fun m!233315 () Bool)

(assert (=> b!205636 m!233315))

(declare-fun m!233317 () Bool)

(assert (=> b!205636 m!233317))

(check-sat b_and!12023 (not b!205632) tp_is_empty!5133 (not start!20618) (not mapNonEmpty!8768) (not b!205635) (not b!205636) (not b!205637) (not b!205641) (not b!205643) (not b_next!5277))
(check-sat b_and!12023 (not b_next!5277))
