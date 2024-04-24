; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40942 () Bool)

(assert start!40942)

(declare-fun b_free!10891 () Bool)

(declare-fun b_next!10891 () Bool)

(assert (=> start!40942 (= b_free!10891 (not b_next!10891))))

(declare-fun tp!38499 () Bool)

(declare-fun b_and!19043 () Bool)

(assert (=> start!40942 (= tp!38499 b_and!19043)))

(declare-fun b!455611 () Bool)

(declare-fun e!266333 () Bool)

(assert (=> b!455611 (= e!266333 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!17411 0))(
  ( (V!17412 (val!6159 Int)) )
))
(declare-fun minValue!515 () V!17411)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5771 0))(
  ( (ValueCellFull!5771 (v!8426 V!17411)) (EmptyCell!5771) )
))
(declare-datatypes ((array!28252 0))(
  ( (array!28253 (arr!13569 (Array (_ BitVec 32) ValueCell!5771)) (size!13921 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28252)

(declare-fun zeroValue!515 () V!17411)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!28254 0))(
  ( (array!28255 (arr!13570 (Array (_ BitVec 32) (_ BitVec 64))) (size!13922 (_ BitVec 32))) )
))
(declare-fun lt!206394 () array!28254)

(declare-fun v!412 () V!17411)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!8024 0))(
  ( (tuple2!8025 (_1!4023 (_ BitVec 64)) (_2!4023 V!17411)) )
))
(declare-datatypes ((List!8094 0))(
  ( (Nil!8091) (Cons!8090 (h!8946 tuple2!8024) (t!13914 List!8094)) )
))
(declare-datatypes ((ListLongMap!6939 0))(
  ( (ListLongMap!6940 (toList!3485 List!8094)) )
))
(declare-fun lt!206396 () ListLongMap!6939)

(declare-fun getCurrentListMapNoExtraKeys!1714 (array!28254 array!28252 (_ BitVec 32) (_ BitVec 32) V!17411 V!17411 (_ BitVec 32) Int) ListLongMap!6939)

(assert (=> b!455611 (= lt!206396 (getCurrentListMapNoExtraKeys!1714 lt!206394 (array!28253 (store (arr!13569 _values!549) i!563 (ValueCellFull!5771 v!412)) (size!13921 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206395 () ListLongMap!6939)

(declare-fun _keys!709 () array!28254)

(assert (=> b!455611 (= lt!206395 (getCurrentListMapNoExtraKeys!1714 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455613 () Bool)

(declare-fun res!271756 () Bool)

(declare-fun e!266334 () Bool)

(assert (=> b!455613 (=> (not res!271756) (not e!266334))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455613 (= res!271756 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!19984 () Bool)

(declare-fun mapRes!19984 () Bool)

(declare-fun tp!38500 () Bool)

(declare-fun e!266335 () Bool)

(assert (=> mapNonEmpty!19984 (= mapRes!19984 (and tp!38500 e!266335))))

(declare-fun mapRest!19984 () (Array (_ BitVec 32) ValueCell!5771))

(declare-fun mapValue!19984 () ValueCell!5771)

(declare-fun mapKey!19984 () (_ BitVec 32))

(assert (=> mapNonEmpty!19984 (= (arr!13569 _values!549) (store mapRest!19984 mapKey!19984 mapValue!19984))))

(declare-fun b!455614 () Bool)

(assert (=> b!455614 (= e!266334 e!266333)))

(declare-fun res!271746 () Bool)

(assert (=> b!455614 (=> (not res!271746) (not e!266333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28254 (_ BitVec 32)) Bool)

(assert (=> b!455614 (= res!271746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206394 mask!1025))))

(assert (=> b!455614 (= lt!206394 (array!28255 (store (arr!13570 _keys!709) i!563 k0!794) (size!13922 _keys!709)))))

(declare-fun b!455615 () Bool)

(declare-fun res!271745 () Bool)

(assert (=> b!455615 (=> (not res!271745) (not e!266334))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455615 (= res!271745 (validMask!0 mask!1025))))

(declare-fun b!455616 () Bool)

(declare-fun e!266337 () Bool)

(declare-fun e!266338 () Bool)

(assert (=> b!455616 (= e!266337 (and e!266338 mapRes!19984))))

(declare-fun condMapEmpty!19984 () Bool)

(declare-fun mapDefault!19984 () ValueCell!5771)

(assert (=> b!455616 (= condMapEmpty!19984 (= (arr!13569 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5771)) mapDefault!19984)))))

(declare-fun b!455617 () Bool)

(declare-fun tp_is_empty!12229 () Bool)

(assert (=> b!455617 (= e!266335 tp_is_empty!12229)))

(declare-fun b!455618 () Bool)

(declare-fun res!271755 () Bool)

(assert (=> b!455618 (=> (not res!271755) (not e!266333))))

(assert (=> b!455618 (= res!271755 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!19984 () Bool)

(assert (=> mapIsEmpty!19984 mapRes!19984))

(declare-fun b!455619 () Bool)

(assert (=> b!455619 (= e!266338 tp_is_empty!12229)))

(declare-fun b!455620 () Bool)

(declare-fun res!271748 () Bool)

(assert (=> b!455620 (=> (not res!271748) (not e!266334))))

(declare-datatypes ((List!8095 0))(
  ( (Nil!8092) (Cons!8091 (h!8947 (_ BitVec 64)) (t!13915 List!8095)) )
))
(declare-fun arrayNoDuplicates!0 (array!28254 (_ BitVec 32) List!8095) Bool)

(assert (=> b!455620 (= res!271748 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8092))))

(declare-fun b!455621 () Bool)

(declare-fun res!271750 () Bool)

(assert (=> b!455621 (=> (not res!271750) (not e!266334))))

(assert (=> b!455621 (= res!271750 (and (= (size!13921 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13922 _keys!709) (size!13921 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!271749 () Bool)

(assert (=> start!40942 (=> (not res!271749) (not e!266334))))

(assert (=> start!40942 (= res!271749 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13922 _keys!709))))))

(assert (=> start!40942 e!266334))

(assert (=> start!40942 tp_is_empty!12229))

(assert (=> start!40942 tp!38499))

(assert (=> start!40942 true))

(declare-fun array_inv!9904 (array!28252) Bool)

(assert (=> start!40942 (and (array_inv!9904 _values!549) e!266337)))

(declare-fun array_inv!9905 (array!28254) Bool)

(assert (=> start!40942 (array_inv!9905 _keys!709)))

(declare-fun b!455612 () Bool)

(declare-fun res!271747 () Bool)

(assert (=> b!455612 (=> (not res!271747) (not e!266333))))

(assert (=> b!455612 (= res!271747 (arrayNoDuplicates!0 lt!206394 #b00000000000000000000000000000000 Nil!8092))))

(declare-fun b!455622 () Bool)

(declare-fun res!271753 () Bool)

(assert (=> b!455622 (=> (not res!271753) (not e!266334))))

(assert (=> b!455622 (= res!271753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455623 () Bool)

(declare-fun res!271751 () Bool)

(assert (=> b!455623 (=> (not res!271751) (not e!266334))))

(assert (=> b!455623 (= res!271751 (or (= (select (arr!13570 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13570 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455624 () Bool)

(declare-fun res!271752 () Bool)

(assert (=> b!455624 (=> (not res!271752) (not e!266334))))

(declare-fun arrayContainsKey!0 (array!28254 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455624 (= res!271752 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455625 () Bool)

(declare-fun res!271754 () Bool)

(assert (=> b!455625 (=> (not res!271754) (not e!266334))))

(assert (=> b!455625 (= res!271754 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13922 _keys!709))))))

(assert (= (and start!40942 res!271749) b!455615))

(assert (= (and b!455615 res!271745) b!455621))

(assert (= (and b!455621 res!271750) b!455622))

(assert (= (and b!455622 res!271753) b!455620))

(assert (= (and b!455620 res!271748) b!455625))

(assert (= (and b!455625 res!271754) b!455613))

(assert (= (and b!455613 res!271756) b!455623))

(assert (= (and b!455623 res!271751) b!455624))

(assert (= (and b!455624 res!271752) b!455614))

(assert (= (and b!455614 res!271746) b!455612))

(assert (= (and b!455612 res!271747) b!455618))

(assert (= (and b!455618 res!271755) b!455611))

(assert (= (and b!455616 condMapEmpty!19984) mapIsEmpty!19984))

(assert (= (and b!455616 (not condMapEmpty!19984)) mapNonEmpty!19984))

(get-info :version)

(assert (= (and mapNonEmpty!19984 ((_ is ValueCellFull!5771) mapValue!19984)) b!455617))

(assert (= (and b!455616 ((_ is ValueCellFull!5771) mapDefault!19984)) b!455619))

(assert (= start!40942 b!455616))

(declare-fun m!439563 () Bool)

(assert (=> b!455624 m!439563))

(declare-fun m!439565 () Bool)

(assert (=> b!455615 m!439565))

(declare-fun m!439567 () Bool)

(assert (=> b!455622 m!439567))

(declare-fun m!439569 () Bool)

(assert (=> start!40942 m!439569))

(declare-fun m!439571 () Bool)

(assert (=> start!40942 m!439571))

(declare-fun m!439573 () Bool)

(assert (=> b!455614 m!439573))

(declare-fun m!439575 () Bool)

(assert (=> b!455614 m!439575))

(declare-fun m!439577 () Bool)

(assert (=> b!455620 m!439577))

(declare-fun m!439579 () Bool)

(assert (=> b!455612 m!439579))

(declare-fun m!439581 () Bool)

(assert (=> b!455611 m!439581))

(declare-fun m!439583 () Bool)

(assert (=> b!455611 m!439583))

(declare-fun m!439585 () Bool)

(assert (=> b!455611 m!439585))

(declare-fun m!439587 () Bool)

(assert (=> mapNonEmpty!19984 m!439587))

(declare-fun m!439589 () Bool)

(assert (=> b!455623 m!439589))

(declare-fun m!439591 () Bool)

(assert (=> b!455613 m!439591))

(check-sat (not b!455611) (not b!455613) (not b!455612) (not b!455614) (not b!455620) (not start!40942) tp_is_empty!12229 b_and!19043 (not b!455624) (not b!455622) (not mapNonEmpty!19984) (not b!455615) (not b_next!10891))
(check-sat b_and!19043 (not b_next!10891))
