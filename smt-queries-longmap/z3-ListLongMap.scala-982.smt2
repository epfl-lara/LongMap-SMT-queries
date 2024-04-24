; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21214 () Bool)

(assert start!21214)

(declare-fun b_free!5641 () Bool)

(declare-fun b_next!5641 () Bool)

(assert (=> start!21214 (= b_free!5641 (not b_next!5641))))

(declare-fun tp!19996 () Bool)

(declare-fun b_and!12533 () Bool)

(assert (=> start!21214 (= tp!19996 b_and!12533)))

(declare-fun b!213721 () Bool)

(declare-fun res!104612 () Bool)

(declare-fun e!138979 () Bool)

(assert (=> b!213721 (=> (not res!104612) (not e!138979))))

(declare-datatypes ((array!10211 0))(
  ( (array!10212 (arr!4845 (Array (_ BitVec 32) (_ BitVec 64))) (size!5170 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!10211)

(declare-datatypes ((List!3055 0))(
  ( (Nil!3052) (Cons!3051 (h!3693 (_ BitVec 64)) (t!8000 List!3055)) )
))
(declare-fun arrayNoDuplicates!0 (array!10211 (_ BitVec 32) List!3055) Bool)

(assert (=> b!213721 (= res!104612 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3052))))

(declare-fun b!213722 () Bool)

(declare-fun res!104615 () Bool)

(assert (=> b!213722 (=> (not res!104615) (not e!138979))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!213722 (= res!104615 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5170 _keys!825))))))

(declare-fun b!213723 () Bool)

(declare-fun res!104617 () Bool)

(assert (=> b!213723 (=> (not res!104617) (not e!138979))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!213723 (= res!104617 (validKeyInArray!0 k0!843))))

(declare-fun b!213724 () Bool)

(declare-fun e!138980 () Bool)

(declare-fun e!138978 () Bool)

(declare-fun mapRes!9356 () Bool)

(assert (=> b!213724 (= e!138980 (and e!138978 mapRes!9356))))

(declare-fun condMapEmpty!9356 () Bool)

(declare-datatypes ((V!6985 0))(
  ( (V!6986 (val!2796 Int)) )
))
(declare-datatypes ((ValueCell!2408 0))(
  ( (ValueCellFull!2408 (v!4811 V!6985)) (EmptyCell!2408) )
))
(declare-datatypes ((array!10213 0))(
  ( (array!10214 (arr!4846 (Array (_ BitVec 32) ValueCell!2408)) (size!5171 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!10213)

(declare-fun mapDefault!9356 () ValueCell!2408)

(assert (=> b!213724 (= condMapEmpty!9356 (= (arr!4846 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2408)) mapDefault!9356)))))

(declare-fun b!213725 () Bool)

(declare-fun tp_is_empty!5503 () Bool)

(assert (=> b!213725 (= e!138978 tp_is_empty!5503)))

(declare-fun b!213726 () Bool)

(declare-fun res!104614 () Bool)

(assert (=> b!213726 (=> (not res!104614) (not e!138979))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10211 (_ BitVec 32)) Bool)

(assert (=> b!213726 (= res!104614 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!104611 () Bool)

(assert (=> start!21214 (=> (not res!104611) (not e!138979))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!21214 (= res!104611 (validMask!0 mask!1149))))

(assert (=> start!21214 e!138979))

(declare-fun array_inv!3181 (array!10213) Bool)

(assert (=> start!21214 (and (array_inv!3181 _values!649) e!138980)))

(assert (=> start!21214 true))

(assert (=> start!21214 tp_is_empty!5503))

(declare-fun array_inv!3182 (array!10211) Bool)

(assert (=> start!21214 (array_inv!3182 _keys!825)))

(assert (=> start!21214 tp!19996))

(declare-fun b!213727 () Bool)

(declare-fun res!104616 () Bool)

(assert (=> b!213727 (=> (not res!104616) (not e!138979))))

(assert (=> b!213727 (= res!104616 (= (select (arr!4845 _keys!825) i!601) k0!843))))

(declare-fun b!213728 () Bool)

(declare-fun e!138977 () Bool)

(assert (=> b!213728 (= e!138977 tp_is_empty!5503)))

(declare-fun mapNonEmpty!9356 () Bool)

(declare-fun tp!19997 () Bool)

(assert (=> mapNonEmpty!9356 (= mapRes!9356 (and tp!19997 e!138977))))

(declare-fun mapRest!9356 () (Array (_ BitVec 32) ValueCell!2408))

(declare-fun mapKey!9356 () (_ BitVec 32))

(declare-fun mapValue!9356 () ValueCell!2408)

(assert (=> mapNonEmpty!9356 (= (arr!4846 _values!649) (store mapRest!9356 mapKey!9356 mapValue!9356))))

(declare-fun b!213729 () Bool)

(declare-fun res!104613 () Bool)

(assert (=> b!213729 (=> (not res!104613) (not e!138979))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!213729 (= res!104613 (and (= (size!5171 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5170 _keys!825) (size!5171 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!4172 0))(
  ( (tuple2!4173 (_1!2097 (_ BitVec 64)) (_2!2097 V!6985)) )
))
(declare-datatypes ((List!3056 0))(
  ( (Nil!3053) (Cons!3052 (h!3694 tuple2!4172) (t!8001 List!3056)) )
))
(declare-datatypes ((ListLongMap!3087 0))(
  ( (ListLongMap!3088 (toList!1559 List!3056)) )
))
(declare-fun lt!110549 () ListLongMap!3087)

(declare-fun b!213730 () Bool)

(declare-fun lt!110548 () Bool)

(declare-fun lt!110552 () ListLongMap!3087)

(assert (=> b!213730 (= e!138979 (not (or (and (not lt!110548) (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!110548) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!110548) (not (= lt!110552 lt!110549)) (bvslt i!601 (size!5171 _values!649)))))))

(assert (=> b!213730 (= lt!110548 (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!110546 () ListLongMap!3087)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6985)

(declare-fun zeroValue!615 () V!6985)

(declare-fun getCurrentListMap!1092 (array!10211 array!10213 (_ BitVec 32) (_ BitVec 32) V!6985 V!6985 (_ BitVec 32) Int) ListLongMap!3087)

(assert (=> b!213730 (= lt!110546 (getCurrentListMap!1092 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110545 () array!10213)

(assert (=> b!213730 (= lt!110552 (getCurrentListMap!1092 _keys!825 lt!110545 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!110550 () ListLongMap!3087)

(assert (=> b!213730 (and (= lt!110549 lt!110550) (= lt!110550 lt!110549))))

(declare-fun lt!110551 () ListLongMap!3087)

(declare-fun v!520 () V!6985)

(declare-fun +!588 (ListLongMap!3087 tuple2!4172) ListLongMap!3087)

(assert (=> b!213730 (= lt!110550 (+!588 lt!110551 (tuple2!4173 k0!843 v!520)))))

(declare-datatypes ((Unit!6468 0))(
  ( (Unit!6469) )
))
(declare-fun lt!110547 () Unit!6468)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!233 (array!10211 array!10213 (_ BitVec 32) (_ BitVec 32) V!6985 V!6985 (_ BitVec 32) (_ BitVec 64) V!6985 (_ BitVec 32) Int) Unit!6468)

(assert (=> b!213730 (= lt!110547 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!233 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!515 (array!10211 array!10213 (_ BitVec 32) (_ BitVec 32) V!6985 V!6985 (_ BitVec 32) Int) ListLongMap!3087)

(assert (=> b!213730 (= lt!110549 (getCurrentListMapNoExtraKeys!515 _keys!825 lt!110545 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!213730 (= lt!110545 (array!10214 (store (arr!4846 _values!649) i!601 (ValueCellFull!2408 v!520)) (size!5171 _values!649)))))

(assert (=> b!213730 (= lt!110551 (getCurrentListMapNoExtraKeys!515 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!9356 () Bool)

(assert (=> mapIsEmpty!9356 mapRes!9356))

(assert (= (and start!21214 res!104611) b!213729))

(assert (= (and b!213729 res!104613) b!213726))

(assert (= (and b!213726 res!104614) b!213721))

(assert (= (and b!213721 res!104612) b!213722))

(assert (= (and b!213722 res!104615) b!213723))

(assert (= (and b!213723 res!104617) b!213727))

(assert (= (and b!213727 res!104616) b!213730))

(assert (= (and b!213724 condMapEmpty!9356) mapIsEmpty!9356))

(assert (= (and b!213724 (not condMapEmpty!9356)) mapNonEmpty!9356))

(get-info :version)

(assert (= (and mapNonEmpty!9356 ((_ is ValueCellFull!2408) mapValue!9356)) b!213728))

(assert (= (and b!213724 ((_ is ValueCellFull!2408) mapDefault!9356)) b!213725))

(assert (= start!21214 b!213724))

(declare-fun m!241725 () Bool)

(assert (=> b!213721 m!241725))

(declare-fun m!241727 () Bool)

(assert (=> b!213723 m!241727))

(declare-fun m!241729 () Bool)

(assert (=> mapNonEmpty!9356 m!241729))

(declare-fun m!241731 () Bool)

(assert (=> b!213727 m!241731))

(declare-fun m!241733 () Bool)

(assert (=> b!213726 m!241733))

(declare-fun m!241735 () Bool)

(assert (=> start!21214 m!241735))

(declare-fun m!241737 () Bool)

(assert (=> start!21214 m!241737))

(declare-fun m!241739 () Bool)

(assert (=> start!21214 m!241739))

(declare-fun m!241741 () Bool)

(assert (=> b!213730 m!241741))

(declare-fun m!241743 () Bool)

(assert (=> b!213730 m!241743))

(declare-fun m!241745 () Bool)

(assert (=> b!213730 m!241745))

(declare-fun m!241747 () Bool)

(assert (=> b!213730 m!241747))

(declare-fun m!241749 () Bool)

(assert (=> b!213730 m!241749))

(declare-fun m!241751 () Bool)

(assert (=> b!213730 m!241751))

(declare-fun m!241753 () Bool)

(assert (=> b!213730 m!241753))

(check-sat (not b!213723) (not b_next!5641) b_and!12533 (not start!21214) tp_is_empty!5503 (not b!213730) (not b!213721) (not b!213726) (not mapNonEmpty!9356))
(check-sat b_and!12533 (not b_next!5641))
