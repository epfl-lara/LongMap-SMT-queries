; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36946 () Bool)

(assert start!36946)

(declare-fun b_free!8073 () Bool)

(declare-fun b_next!8073 () Bool)

(assert (=> start!36946 (= b_free!8073 (not b_next!8073))))

(declare-fun tp!28934 () Bool)

(declare-fun b_and!15315 () Bool)

(assert (=> start!36946 (= tp!28934 b_and!15315)))

(declare-fun b!370463 () Bool)

(declare-fun res!208042 () Bool)

(declare-fun e!226266 () Bool)

(assert (=> b!370463 (=> (not res!208042) (not e!226266))))

(declare-datatypes ((array!21385 0))(
  ( (array!21386 (arr!10161 (Array (_ BitVec 32) (_ BitVec 64))) (size!10513 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21385)

(declare-datatypes ((List!5681 0))(
  ( (Nil!5678) (Cons!5677 (h!6533 (_ BitVec 64)) (t!10831 List!5681)) )
))
(declare-fun arrayNoDuplicates!0 (array!21385 (_ BitVec 32) List!5681) Bool)

(assert (=> b!370463 (= res!208042 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5678))))

(declare-fun b!370464 () Bool)

(declare-fun e!226269 () Bool)

(assert (=> b!370464 (= e!226266 e!226269)))

(declare-fun res!208046 () Bool)

(assert (=> b!370464 (=> (not res!208046) (not e!226269))))

(declare-fun lt!169972 () array!21385)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21385 (_ BitVec 32)) Bool)

(assert (=> b!370464 (= res!208046 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169972 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370464 (= lt!169972 (array!21386 (store (arr!10161 _keys!658) i!548 k0!778) (size!10513 _keys!658)))))

(declare-fun b!370465 () Bool)

(declare-fun e!226270 () Bool)

(declare-fun tp_is_empty!8721 () Bool)

(assert (=> b!370465 (= e!226270 tp_is_empty!8721)))

(declare-fun b!370466 () Bool)

(declare-fun res!208041 () Bool)

(assert (=> b!370466 (=> (not res!208041) (not e!226269))))

(assert (=> b!370466 (= res!208041 (arrayNoDuplicates!0 lt!169972 #b00000000000000000000000000000000 Nil!5678))))

(declare-fun b!370467 () Bool)

(declare-fun res!208048 () Bool)

(assert (=> b!370467 (=> (not res!208048) (not e!226266))))

(assert (=> b!370467 (= res!208048 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14646 () Bool)

(declare-fun mapRes!14646 () Bool)

(declare-fun tp!28935 () Bool)

(assert (=> mapNonEmpty!14646 (= mapRes!14646 (and tp!28935 e!226270))))

(declare-datatypes ((V!12733 0))(
  ( (V!12734 (val!4405 Int)) )
))
(declare-datatypes ((ValueCell!4017 0))(
  ( (ValueCellFull!4017 (v!6602 V!12733)) (EmptyCell!4017) )
))
(declare-datatypes ((array!21387 0))(
  ( (array!21388 (arr!10162 (Array (_ BitVec 32) ValueCell!4017)) (size!10514 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21387)

(declare-fun mapKey!14646 () (_ BitVec 32))

(declare-fun mapRest!14646 () (Array (_ BitVec 32) ValueCell!4017))

(declare-fun mapValue!14646 () ValueCell!4017)

(assert (=> mapNonEmpty!14646 (= (arr!10162 _values!506) (store mapRest!14646 mapKey!14646 mapValue!14646))))

(declare-fun b!370468 () Bool)

(declare-fun res!208043 () Bool)

(assert (=> b!370468 (=> (not res!208043) (not e!226266))))

(assert (=> b!370468 (= res!208043 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10513 _keys!658))))))

(declare-fun res!208044 () Bool)

(assert (=> start!36946 (=> (not res!208044) (not e!226266))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36946 (= res!208044 (validMask!0 mask!970))))

(assert (=> start!36946 e!226266))

(declare-fun e!226267 () Bool)

(declare-fun array_inv!7506 (array!21387) Bool)

(assert (=> start!36946 (and (array_inv!7506 _values!506) e!226267)))

(assert (=> start!36946 tp!28934))

(assert (=> start!36946 true))

(assert (=> start!36946 tp_is_empty!8721))

(declare-fun array_inv!7507 (array!21385) Bool)

(assert (=> start!36946 (array_inv!7507 _keys!658)))

(declare-fun mapIsEmpty!14646 () Bool)

(assert (=> mapIsEmpty!14646 mapRes!14646))

(declare-fun b!370469 () Bool)

(declare-fun res!208049 () Bool)

(assert (=> b!370469 (=> (not res!208049) (not e!226266))))

(declare-fun arrayContainsKey!0 (array!21385 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370469 (= res!208049 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370470 () Bool)

(declare-fun e!226271 () Bool)

(assert (=> b!370470 (= e!226267 (and e!226271 mapRes!14646))))

(declare-fun condMapEmpty!14646 () Bool)

(declare-fun mapDefault!14646 () ValueCell!4017)

(assert (=> b!370470 (= condMapEmpty!14646 (= (arr!10162 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4017)) mapDefault!14646)))))

(declare-fun b!370471 () Bool)

(declare-fun res!208040 () Bool)

(assert (=> b!370471 (=> (not res!208040) (not e!226266))))

(assert (=> b!370471 (= res!208040 (or (= (select (arr!10161 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10161 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370472 () Bool)

(declare-fun res!208047 () Bool)

(assert (=> b!370472 (=> (not res!208047) (not e!226266))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370472 (= res!208047 (validKeyInArray!0 k0!778))))

(declare-fun b!370473 () Bool)

(assert (=> b!370473 (= e!226269 false)))

(declare-datatypes ((tuple2!5842 0))(
  ( (tuple2!5843 (_1!2932 (_ BitVec 64)) (_2!2932 V!12733)) )
))
(declare-datatypes ((List!5682 0))(
  ( (Nil!5679) (Cons!5678 (h!6534 tuple2!5842) (t!10832 List!5682)) )
))
(declare-datatypes ((ListLongMap!4755 0))(
  ( (ListLongMap!4756 (toList!2393 List!5682)) )
))
(declare-fun lt!169974 () ListLongMap!4755)

(declare-fun defaultEntry!514 () Int)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12733)

(declare-fun zeroValue!472 () V!12733)

(declare-fun minValue!472 () V!12733)

(declare-fun getCurrentListMapNoExtraKeys!670 (array!21385 array!21387 (_ BitVec 32) (_ BitVec 32) V!12733 V!12733 (_ BitVec 32) Int) ListLongMap!4755)

(assert (=> b!370473 (= lt!169974 (getCurrentListMapNoExtraKeys!670 lt!169972 (array!21388 (store (arr!10162 _values!506) i!548 (ValueCellFull!4017 v!373)) (size!10514 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169973 () ListLongMap!4755)

(assert (=> b!370473 (= lt!169973 (getCurrentListMapNoExtraKeys!670 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370474 () Bool)

(declare-fun res!208045 () Bool)

(assert (=> b!370474 (=> (not res!208045) (not e!226266))))

(assert (=> b!370474 (= res!208045 (and (= (size!10514 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10513 _keys!658) (size!10514 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370475 () Bool)

(assert (=> b!370475 (= e!226271 tp_is_empty!8721)))

(assert (= (and start!36946 res!208044) b!370474))

(assert (= (and b!370474 res!208045) b!370467))

(assert (= (and b!370467 res!208048) b!370463))

(assert (= (and b!370463 res!208042) b!370468))

(assert (= (and b!370468 res!208043) b!370472))

(assert (= (and b!370472 res!208047) b!370471))

(assert (= (and b!370471 res!208040) b!370469))

(assert (= (and b!370469 res!208049) b!370464))

(assert (= (and b!370464 res!208046) b!370466))

(assert (= (and b!370466 res!208041) b!370473))

(assert (= (and b!370470 condMapEmpty!14646) mapIsEmpty!14646))

(assert (= (and b!370470 (not condMapEmpty!14646)) mapNonEmpty!14646))

(get-info :version)

(assert (= (and mapNonEmpty!14646 ((_ is ValueCellFull!4017) mapValue!14646)) b!370465))

(assert (= (and b!370470 ((_ is ValueCellFull!4017) mapDefault!14646)) b!370475))

(assert (= start!36946 b!370470))

(declare-fun m!366603 () Bool)

(assert (=> b!370473 m!366603))

(declare-fun m!366605 () Bool)

(assert (=> b!370473 m!366605))

(declare-fun m!366607 () Bool)

(assert (=> b!370473 m!366607))

(declare-fun m!366609 () Bool)

(assert (=> b!370466 m!366609))

(declare-fun m!366611 () Bool)

(assert (=> b!370472 m!366611))

(declare-fun m!366613 () Bool)

(assert (=> b!370471 m!366613))

(declare-fun m!366615 () Bool)

(assert (=> start!36946 m!366615))

(declare-fun m!366617 () Bool)

(assert (=> start!36946 m!366617))

(declare-fun m!366619 () Bool)

(assert (=> start!36946 m!366619))

(declare-fun m!366621 () Bool)

(assert (=> b!370469 m!366621))

(declare-fun m!366623 () Bool)

(assert (=> mapNonEmpty!14646 m!366623))

(declare-fun m!366625 () Bool)

(assert (=> b!370464 m!366625))

(declare-fun m!366627 () Bool)

(assert (=> b!370464 m!366627))

(declare-fun m!366629 () Bool)

(assert (=> b!370463 m!366629))

(declare-fun m!366631 () Bool)

(assert (=> b!370467 m!366631))

(check-sat (not b!370469) (not b!370467) (not b!370464) (not b!370472) (not b!370473) (not mapNonEmpty!14646) (not b_next!8073) tp_is_empty!8721 (not b!370466) (not b!370463) b_and!15315 (not start!36946))
(check-sat b_and!15315 (not b_next!8073))
