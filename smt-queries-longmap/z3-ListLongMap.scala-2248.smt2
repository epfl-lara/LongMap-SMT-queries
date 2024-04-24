; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36936 () Bool)

(assert start!36936)

(declare-fun b_free!8077 () Bool)

(declare-fun b_next!8077 () Bool)

(assert (=> start!36936 (= b_free!8077 (not b_next!8077))))

(declare-fun tp!28946 () Bool)

(declare-fun b_and!15333 () Bool)

(assert (=> start!36936 (= tp!28946 b_and!15333)))

(declare-fun res!208106 () Bool)

(declare-fun e!226270 () Bool)

(assert (=> start!36936 (=> (not res!208106) (not e!226270))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36936 (= res!208106 (validMask!0 mask!970))))

(assert (=> start!36936 e!226270))

(declare-datatypes ((V!12739 0))(
  ( (V!12740 (val!4407 Int)) )
))
(declare-datatypes ((ValueCell!4019 0))(
  ( (ValueCellFull!4019 (v!6605 V!12739)) (EmptyCell!4019) )
))
(declare-datatypes ((array!21378 0))(
  ( (array!21379 (arr!10157 (Array (_ BitVec 32) ValueCell!4019)) (size!10509 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21378)

(declare-fun e!226274 () Bool)

(declare-fun array_inv!7536 (array!21378) Bool)

(assert (=> start!36936 (and (array_inv!7536 _values!506) e!226274)))

(assert (=> start!36936 tp!28946))

(assert (=> start!36936 true))

(declare-fun tp_is_empty!8725 () Bool)

(assert (=> start!36936 tp_is_empty!8725))

(declare-datatypes ((array!21380 0))(
  ( (array!21381 (arr!10158 (Array (_ BitVec 32) (_ BitVec 64))) (size!10510 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21380)

(declare-fun array_inv!7537 (array!21380) Bool)

(assert (=> start!36936 (array_inv!7537 _keys!658)))

(declare-fun b!370492 () Bool)

(declare-fun res!208100 () Bool)

(assert (=> b!370492 (=> (not res!208100) (not e!226270))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!370492 (= res!208100 (and (= (size!10509 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10510 _keys!658) (size!10509 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14652 () Bool)

(declare-fun mapRes!14652 () Bool)

(declare-fun tp!28947 () Bool)

(declare-fun e!226271 () Bool)

(assert (=> mapNonEmpty!14652 (= mapRes!14652 (and tp!28947 e!226271))))

(declare-fun mapRest!14652 () (Array (_ BitVec 32) ValueCell!4019))

(declare-fun mapValue!14652 () ValueCell!4019)

(declare-fun mapKey!14652 () (_ BitVec 32))

(assert (=> mapNonEmpty!14652 (= (arr!10157 _values!506) (store mapRest!14652 mapKey!14652 mapValue!14652))))

(declare-fun b!370493 () Bool)

(declare-fun res!208099 () Bool)

(assert (=> b!370493 (=> (not res!208099) (not e!226270))))

(declare-datatypes ((List!5583 0))(
  ( (Nil!5580) (Cons!5579 (h!6435 (_ BitVec 64)) (t!10725 List!5583)) )
))
(declare-fun arrayNoDuplicates!0 (array!21380 (_ BitVec 32) List!5583) Bool)

(assert (=> b!370493 (= res!208099 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5580))))

(declare-fun b!370494 () Bool)

(declare-fun res!208105 () Bool)

(declare-fun e!226275 () Bool)

(assert (=> b!370494 (=> (not res!208105) (not e!226275))))

(declare-fun lt!170009 () array!21380)

(assert (=> b!370494 (= res!208105 (arrayNoDuplicates!0 lt!170009 #b00000000000000000000000000000000 Nil!5580))))

(declare-fun b!370495 () Bool)

(declare-fun res!208102 () Bool)

(assert (=> b!370495 (=> (not res!208102) (not e!226270))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21380 (_ BitVec 32)) Bool)

(assert (=> b!370495 (= res!208102 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370496 () Bool)

(assert (=> b!370496 (= e!226271 tp_is_empty!8725)))

(declare-fun b!370497 () Bool)

(declare-fun e!226272 () Bool)

(assert (=> b!370497 (= e!226272 tp_is_empty!8725)))

(declare-fun b!370498 () Bool)

(declare-fun res!208104 () Bool)

(assert (=> b!370498 (=> (not res!208104) (not e!226270))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370498 (= res!208104 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10510 _keys!658))))))

(declare-fun b!370499 () Bool)

(declare-fun res!208097 () Bool)

(assert (=> b!370499 (=> (not res!208097) (not e!226270))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21380 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370499 (= res!208097 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370500 () Bool)

(declare-fun res!208101 () Bool)

(assert (=> b!370500 (=> (not res!208101) (not e!226270))))

(assert (=> b!370500 (= res!208101 (or (= (select (arr!10158 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10158 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370501 () Bool)

(assert (=> b!370501 (= e!226270 e!226275)))

(declare-fun res!208103 () Bool)

(assert (=> b!370501 (=> (not res!208103) (not e!226275))))

(assert (=> b!370501 (= res!208103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170009 mask!970))))

(assert (=> b!370501 (= lt!170009 (array!21381 (store (arr!10158 _keys!658) i!548 k0!778) (size!10510 _keys!658)))))

(declare-fun b!370502 () Bool)

(declare-fun res!208098 () Bool)

(assert (=> b!370502 (=> (not res!208098) (not e!226270))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370502 (= res!208098 (validKeyInArray!0 k0!778))))

(declare-fun b!370503 () Bool)

(assert (=> b!370503 (= e!226275 false)))

(declare-datatypes ((tuple2!5752 0))(
  ( (tuple2!5753 (_1!2887 (_ BitVec 64)) (_2!2887 V!12739)) )
))
(declare-datatypes ((List!5584 0))(
  ( (Nil!5581) (Cons!5580 (h!6436 tuple2!5752) (t!10726 List!5584)) )
))
(declare-datatypes ((ListLongMap!4667 0))(
  ( (ListLongMap!4668 (toList!2349 List!5584)) )
))
(declare-fun lt!170010 () ListLongMap!4667)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12739)

(declare-fun v!373 () V!12739)

(declare-fun minValue!472 () V!12739)

(declare-fun getCurrentListMapNoExtraKeys!658 (array!21380 array!21378 (_ BitVec 32) (_ BitVec 32) V!12739 V!12739 (_ BitVec 32) Int) ListLongMap!4667)

(assert (=> b!370503 (= lt!170010 (getCurrentListMapNoExtraKeys!658 lt!170009 (array!21379 (store (arr!10157 _values!506) i!548 (ValueCellFull!4019 v!373)) (size!10509 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!170011 () ListLongMap!4667)

(assert (=> b!370503 (= lt!170011 (getCurrentListMapNoExtraKeys!658 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14652 () Bool)

(assert (=> mapIsEmpty!14652 mapRes!14652))

(declare-fun b!370504 () Bool)

(assert (=> b!370504 (= e!226274 (and e!226272 mapRes!14652))))

(declare-fun condMapEmpty!14652 () Bool)

(declare-fun mapDefault!14652 () ValueCell!4019)

(assert (=> b!370504 (= condMapEmpty!14652 (= (arr!10157 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4019)) mapDefault!14652)))))

(assert (= (and start!36936 res!208106) b!370492))

(assert (= (and b!370492 res!208100) b!370495))

(assert (= (and b!370495 res!208102) b!370493))

(assert (= (and b!370493 res!208099) b!370498))

(assert (= (and b!370498 res!208104) b!370502))

(assert (= (and b!370502 res!208098) b!370500))

(assert (= (and b!370500 res!208101) b!370499))

(assert (= (and b!370499 res!208097) b!370501))

(assert (= (and b!370501 res!208103) b!370494))

(assert (= (and b!370494 res!208105) b!370503))

(assert (= (and b!370504 condMapEmpty!14652) mapIsEmpty!14652))

(assert (= (and b!370504 (not condMapEmpty!14652)) mapNonEmpty!14652))

(get-info :version)

(assert (= (and mapNonEmpty!14652 ((_ is ValueCellFull!4019) mapValue!14652)) b!370496))

(assert (= (and b!370504 ((_ is ValueCellFull!4019) mapDefault!14652)) b!370497))

(assert (= start!36936 b!370504))

(declare-fun m!366893 () Bool)

(assert (=> b!370502 m!366893))

(declare-fun m!366895 () Bool)

(assert (=> b!370495 m!366895))

(declare-fun m!366897 () Bool)

(assert (=> start!36936 m!366897))

(declare-fun m!366899 () Bool)

(assert (=> start!36936 m!366899))

(declare-fun m!366901 () Bool)

(assert (=> start!36936 m!366901))

(declare-fun m!366903 () Bool)

(assert (=> b!370503 m!366903))

(declare-fun m!366905 () Bool)

(assert (=> b!370503 m!366905))

(declare-fun m!366907 () Bool)

(assert (=> b!370503 m!366907))

(declare-fun m!366909 () Bool)

(assert (=> b!370493 m!366909))

(declare-fun m!366911 () Bool)

(assert (=> b!370494 m!366911))

(declare-fun m!366913 () Bool)

(assert (=> b!370501 m!366913))

(declare-fun m!366915 () Bool)

(assert (=> b!370501 m!366915))

(declare-fun m!366917 () Bool)

(assert (=> mapNonEmpty!14652 m!366917))

(declare-fun m!366919 () Bool)

(assert (=> b!370500 m!366919))

(declare-fun m!366921 () Bool)

(assert (=> b!370499 m!366921))

(check-sat (not b!370499) (not start!36936) (not b!370502) (not mapNonEmpty!14652) (not b!370495) (not b!370501) (not b!370494) tp_is_empty!8725 (not b!370493) b_and!15333 (not b!370503) (not b_next!8077))
(check-sat b_and!15333 (not b_next!8077))
