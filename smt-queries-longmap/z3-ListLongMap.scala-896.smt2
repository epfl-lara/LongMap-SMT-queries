; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20476 () Bool)

(assert start!20476)

(declare-fun b_free!5131 () Bool)

(declare-fun b_next!5131 () Bool)

(assert (=> start!20476 (= b_free!5131 (not b_next!5131))))

(declare-fun tp!18424 () Bool)

(declare-fun b_and!11891 () Bool)

(assert (=> start!20476 (= tp!18424 b_and!11891)))

(declare-fun b!203042 () Bool)

(declare-fun res!97443 () Bool)

(declare-fun e!132950 () Bool)

(assert (=> b!203042 (=> (not res!97443) (not e!132950))))

(declare-datatypes ((array!9187 0))(
  ( (array!9188 (arr!4344 (Array (_ BitVec 32) (_ BitVec 64))) (size!4669 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9187)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9187 (_ BitVec 32)) Bool)

(assert (=> b!203042 (= res!97443 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203043 () Bool)

(declare-fun res!97450 () Bool)

(assert (=> b!203043 (=> (not res!97450) (not e!132950))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203043 (= res!97450 (validKeyInArray!0 k0!843))))

(declare-fun b!203044 () Bool)

(declare-fun e!132947 () Bool)

(assert (=> b!203044 (= e!132947 true)))

(declare-datatypes ((V!6297 0))(
  ( (V!6298 (val!2538 Int)) )
))
(declare-datatypes ((tuple2!3786 0))(
  ( (tuple2!3787 (_1!1904 (_ BitVec 64)) (_2!1904 V!6297)) )
))
(declare-datatypes ((List!2688 0))(
  ( (Nil!2685) (Cons!2684 (h!3326 tuple2!3786) (t!7611 List!2688)) )
))
(declare-datatypes ((ListLongMap!2701 0))(
  ( (ListLongMap!2702 (toList!1366 List!2688)) )
))
(declare-fun lt!102236 () ListLongMap!2701)

(declare-fun lt!102240 () ListLongMap!2701)

(declare-fun lt!102242 () tuple2!3786)

(declare-fun +!420 (ListLongMap!2701 tuple2!3786) ListLongMap!2701)

(assert (=> b!203044 (= lt!102236 (+!420 lt!102240 lt!102242))))

(declare-datatypes ((Unit!6124 0))(
  ( (Unit!6125) )
))
(declare-fun lt!102238 () Unit!6124)

(declare-fun lt!102231 () ListLongMap!2701)

(declare-fun v!520 () V!6297)

(declare-fun zeroValue!615 () V!6297)

(declare-fun addCommutativeForDiffKeys!139 (ListLongMap!2701 (_ BitVec 64) V!6297 (_ BitVec 64) V!6297) Unit!6124)

(assert (=> b!203044 (= lt!102238 (addCommutativeForDiffKeys!139 lt!102231 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203045 () Bool)

(declare-fun res!97448 () Bool)

(assert (=> b!203045 (=> (not res!97448) (not e!132950))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203045 (= res!97448 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4669 _keys!825))))))

(declare-fun b!203046 () Bool)

(declare-fun e!132951 () Bool)

(declare-fun tp_is_empty!4987 () Bool)

(assert (=> b!203046 (= e!132951 tp_is_empty!4987)))

(declare-fun b!203047 () Bool)

(declare-fun e!132948 () Bool)

(assert (=> b!203047 (= e!132948 e!132947)))

(declare-fun res!97442 () Bool)

(assert (=> b!203047 (=> res!97442 e!132947)))

(assert (=> b!203047 (= res!97442 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!102234 () ListLongMap!2701)

(assert (=> b!203047 (= lt!102234 lt!102236)))

(declare-fun lt!102239 () ListLongMap!2701)

(declare-fun lt!102241 () tuple2!3786)

(assert (=> b!203047 (= lt!102236 (+!420 lt!102239 lt!102241))))

(declare-fun lt!102232 () ListLongMap!2701)

(assert (=> b!203047 (= lt!102232 lt!102240)))

(assert (=> b!203047 (= lt!102240 (+!420 lt!102231 lt!102241))))

(declare-fun lt!102235 () ListLongMap!2701)

(assert (=> b!203047 (= lt!102234 (+!420 lt!102235 lt!102241))))

(assert (=> b!203047 (= lt!102241 (tuple2!3787 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapNonEmpty!8549 () Bool)

(declare-fun mapRes!8549 () Bool)

(declare-fun tp!18425 () Bool)

(declare-fun e!132952 () Bool)

(assert (=> mapNonEmpty!8549 (= mapRes!8549 (and tp!18425 e!132952))))

(declare-fun mapKey!8549 () (_ BitVec 32))

(declare-datatypes ((ValueCell!2150 0))(
  ( (ValueCellFull!2150 (v!4509 V!6297)) (EmptyCell!2150) )
))
(declare-datatypes ((array!9189 0))(
  ( (array!9190 (arr!4345 (Array (_ BitVec 32) ValueCell!2150)) (size!4670 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9189)

(declare-fun mapValue!8549 () ValueCell!2150)

(declare-fun mapRest!8549 () (Array (_ BitVec 32) ValueCell!2150))

(assert (=> mapNonEmpty!8549 (= (arr!4345 _values!649) (store mapRest!8549 mapKey!8549 mapValue!8549))))

(declare-fun b!203048 () Bool)

(declare-fun res!97447 () Bool)

(assert (=> b!203048 (=> (not res!97447) (not e!132950))))

(assert (=> b!203048 (= res!97447 (= (select (arr!4344 _keys!825) i!601) k0!843))))

(declare-fun b!203049 () Bool)

(assert (=> b!203049 (= e!132952 tp_is_empty!4987)))

(declare-fun b!203050 () Bool)

(assert (=> b!203050 (= e!132950 (not e!132948))))

(declare-fun res!97444 () Bool)

(assert (=> b!203050 (=> res!97444 e!132948)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203050 (= res!97444 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6297)

(declare-fun getCurrentListMap!948 (array!9187 array!9189 (_ BitVec 32) (_ BitVec 32) V!6297 V!6297 (_ BitVec 32) Int) ListLongMap!2701)

(assert (=> b!203050 (= lt!102232 (getCurrentListMap!948 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102237 () array!9189)

(assert (=> b!203050 (= lt!102234 (getCurrentListMap!948 _keys!825 lt!102237 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203050 (and (= lt!102235 lt!102239) (= lt!102239 lt!102235))))

(assert (=> b!203050 (= lt!102239 (+!420 lt!102231 lt!102242))))

(assert (=> b!203050 (= lt!102242 (tuple2!3787 k0!843 v!520))))

(declare-fun lt!102233 () Unit!6124)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!84 (array!9187 array!9189 (_ BitVec 32) (_ BitVec 32) V!6297 V!6297 (_ BitVec 32) (_ BitVec 64) V!6297 (_ BitVec 32) Int) Unit!6124)

(assert (=> b!203050 (= lt!102233 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!84 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!341 (array!9187 array!9189 (_ BitVec 32) (_ BitVec 32) V!6297 V!6297 (_ BitVec 32) Int) ListLongMap!2701)

(assert (=> b!203050 (= lt!102235 (getCurrentListMapNoExtraKeys!341 _keys!825 lt!102237 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203050 (= lt!102237 (array!9190 (store (arr!4345 _values!649) i!601 (ValueCellFull!2150 v!520)) (size!4670 _values!649)))))

(assert (=> b!203050 (= lt!102231 (getCurrentListMapNoExtraKeys!341 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203051 () Bool)

(declare-fun res!97445 () Bool)

(assert (=> b!203051 (=> (not res!97445) (not e!132950))))

(assert (=> b!203051 (= res!97445 (and (= (size!4670 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4669 _keys!825) (size!4670 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8549 () Bool)

(assert (=> mapIsEmpty!8549 mapRes!8549))

(declare-fun res!97446 () Bool)

(assert (=> start!20476 (=> (not res!97446) (not e!132950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20476 (= res!97446 (validMask!0 mask!1149))))

(assert (=> start!20476 e!132950))

(declare-fun e!132953 () Bool)

(declare-fun array_inv!2837 (array!9189) Bool)

(assert (=> start!20476 (and (array_inv!2837 _values!649) e!132953)))

(assert (=> start!20476 true))

(assert (=> start!20476 tp_is_empty!4987))

(declare-fun array_inv!2838 (array!9187) Bool)

(assert (=> start!20476 (array_inv!2838 _keys!825)))

(assert (=> start!20476 tp!18424))

(declare-fun b!203052 () Bool)

(assert (=> b!203052 (= e!132953 (and e!132951 mapRes!8549))))

(declare-fun condMapEmpty!8549 () Bool)

(declare-fun mapDefault!8549 () ValueCell!2150)

(assert (=> b!203052 (= condMapEmpty!8549 (= (arr!4345 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2150)) mapDefault!8549)))))

(declare-fun b!203053 () Bool)

(declare-fun res!97449 () Bool)

(assert (=> b!203053 (=> (not res!97449) (not e!132950))))

(declare-datatypes ((List!2689 0))(
  ( (Nil!2686) (Cons!2685 (h!3327 (_ BitVec 64)) (t!7612 List!2689)) )
))
(declare-fun arrayNoDuplicates!0 (array!9187 (_ BitVec 32) List!2689) Bool)

(assert (=> b!203053 (= res!97449 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2686))))

(assert (= (and start!20476 res!97446) b!203051))

(assert (= (and b!203051 res!97445) b!203042))

(assert (= (and b!203042 res!97443) b!203053))

(assert (= (and b!203053 res!97449) b!203045))

(assert (= (and b!203045 res!97448) b!203043))

(assert (= (and b!203043 res!97450) b!203048))

(assert (= (and b!203048 res!97447) b!203050))

(assert (= (and b!203050 (not res!97444)) b!203047))

(assert (= (and b!203047 (not res!97442)) b!203044))

(assert (= (and b!203052 condMapEmpty!8549) mapIsEmpty!8549))

(assert (= (and b!203052 (not condMapEmpty!8549)) mapNonEmpty!8549))

(get-info :version)

(assert (= (and mapNonEmpty!8549 ((_ is ValueCellFull!2150) mapValue!8549)) b!203049))

(assert (= (and b!203052 ((_ is ValueCellFull!2150) mapDefault!8549)) b!203046))

(assert (= start!20476 b!203052))

(declare-fun m!230553 () Bool)

(assert (=> b!203053 m!230553))

(declare-fun m!230555 () Bool)

(assert (=> b!203042 m!230555))

(declare-fun m!230557 () Bool)

(assert (=> b!203050 m!230557))

(declare-fun m!230559 () Bool)

(assert (=> b!203050 m!230559))

(declare-fun m!230561 () Bool)

(assert (=> b!203050 m!230561))

(declare-fun m!230563 () Bool)

(assert (=> b!203050 m!230563))

(declare-fun m!230565 () Bool)

(assert (=> b!203050 m!230565))

(declare-fun m!230567 () Bool)

(assert (=> b!203050 m!230567))

(declare-fun m!230569 () Bool)

(assert (=> b!203050 m!230569))

(declare-fun m!230571 () Bool)

(assert (=> mapNonEmpty!8549 m!230571))

(declare-fun m!230573 () Bool)

(assert (=> start!20476 m!230573))

(declare-fun m!230575 () Bool)

(assert (=> start!20476 m!230575))

(declare-fun m!230577 () Bool)

(assert (=> start!20476 m!230577))

(declare-fun m!230579 () Bool)

(assert (=> b!203047 m!230579))

(declare-fun m!230581 () Bool)

(assert (=> b!203047 m!230581))

(declare-fun m!230583 () Bool)

(assert (=> b!203047 m!230583))

(declare-fun m!230585 () Bool)

(assert (=> b!203048 m!230585))

(declare-fun m!230587 () Bool)

(assert (=> b!203043 m!230587))

(declare-fun m!230589 () Bool)

(assert (=> b!203044 m!230589))

(declare-fun m!230591 () Bool)

(assert (=> b!203044 m!230591))

(check-sat (not start!20476) b_and!11891 (not b!203044) (not b!203042) (not b!203047) (not b!203050) tp_is_empty!4987 (not b!203043) (not b_next!5131) (not mapNonEmpty!8549) (not b!203053))
(check-sat b_and!11891 (not b_next!5131))
