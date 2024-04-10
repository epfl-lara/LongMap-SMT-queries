; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36934 () Bool)

(assert start!36934)

(declare-fun b_free!8061 () Bool)

(declare-fun b_next!8061 () Bool)

(assert (=> start!36934 (= b_free!8061 (not b_next!8061))))

(declare-fun tp!28898 () Bool)

(declare-fun b_and!15303 () Bool)

(assert (=> start!36934 (= tp!28898 b_and!15303)))

(declare-fun res!207863 () Bool)

(declare-fun e!226159 () Bool)

(assert (=> start!36934 (=> (not res!207863) (not e!226159))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36934 (= res!207863 (validMask!0 mask!970))))

(assert (=> start!36934 e!226159))

(declare-datatypes ((V!12717 0))(
  ( (V!12718 (val!4399 Int)) )
))
(declare-datatypes ((ValueCell!4011 0))(
  ( (ValueCellFull!4011 (v!6596 V!12717)) (EmptyCell!4011) )
))
(declare-datatypes ((array!21361 0))(
  ( (array!21362 (arr!10149 (Array (_ BitVec 32) ValueCell!4011)) (size!10501 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21361)

(declare-fun e!226163 () Bool)

(declare-fun array_inv!7498 (array!21361) Bool)

(assert (=> start!36934 (and (array_inv!7498 _values!506) e!226163)))

(assert (=> start!36934 tp!28898))

(assert (=> start!36934 true))

(declare-fun tp_is_empty!8709 () Bool)

(assert (=> start!36934 tp_is_empty!8709))

(declare-datatypes ((array!21363 0))(
  ( (array!21364 (arr!10150 (Array (_ BitVec 32) (_ BitVec 64))) (size!10502 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21363)

(declare-fun array_inv!7499 (array!21363) Bool)

(assert (=> start!36934 (array_inv!7499 _keys!658)))

(declare-fun b!370229 () Bool)

(declare-fun res!207869 () Bool)

(assert (=> b!370229 (=> (not res!207869) (not e!226159))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!370229 (= res!207869 (or (= (select (arr!10150 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10150 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!370230 () Bool)

(declare-fun e!226158 () Bool)

(assert (=> b!370230 (= e!226158 tp_is_empty!8709)))

(declare-fun b!370231 () Bool)

(declare-fun res!207868 () Bool)

(assert (=> b!370231 (=> (not res!207868) (not e!226159))))

(declare-datatypes ((List!5672 0))(
  ( (Nil!5669) (Cons!5668 (h!6524 (_ BitVec 64)) (t!10822 List!5672)) )
))
(declare-fun arrayNoDuplicates!0 (array!21363 (_ BitVec 32) List!5672) Bool)

(assert (=> b!370231 (= res!207868 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5669))))

(declare-fun b!370232 () Bool)

(declare-fun e!226160 () Bool)

(assert (=> b!370232 (= e!226160 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5834 0))(
  ( (tuple2!5835 (_1!2928 (_ BitVec 64)) (_2!2928 V!12717)) )
))
(declare-datatypes ((List!5673 0))(
  ( (Nil!5670) (Cons!5669 (h!6525 tuple2!5834) (t!10823 List!5673)) )
))
(declare-datatypes ((ListLongMap!4747 0))(
  ( (ListLongMap!4748 (toList!2389 List!5673)) )
))
(declare-fun lt!169918 () ListLongMap!4747)

(declare-fun zeroValue!472 () V!12717)

(declare-fun lt!169919 () array!21363)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12717)

(declare-fun minValue!472 () V!12717)

(declare-fun getCurrentListMapNoExtraKeys!666 (array!21363 array!21361 (_ BitVec 32) (_ BitVec 32) V!12717 V!12717 (_ BitVec 32) Int) ListLongMap!4747)

(assert (=> b!370232 (= lt!169918 (getCurrentListMapNoExtraKeys!666 lt!169919 (array!21362 (store (arr!10149 _values!506) i!548 (ValueCellFull!4011 v!373)) (size!10501 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169920 () ListLongMap!4747)

(assert (=> b!370232 (= lt!169920 (getCurrentListMapNoExtraKeys!666 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370233 () Bool)

(declare-fun res!207860 () Bool)

(assert (=> b!370233 (=> (not res!207860) (not e!226159))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21363 (_ BitVec 32)) Bool)

(assert (=> b!370233 (= res!207860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!14628 () Bool)

(declare-fun mapRes!14628 () Bool)

(declare-fun tp!28899 () Bool)

(assert (=> mapNonEmpty!14628 (= mapRes!14628 (and tp!28899 e!226158))))

(declare-fun mapRest!14628 () (Array (_ BitVec 32) ValueCell!4011))

(declare-fun mapValue!14628 () ValueCell!4011)

(declare-fun mapKey!14628 () (_ BitVec 32))

(assert (=> mapNonEmpty!14628 (= (arr!10149 _values!506) (store mapRest!14628 mapKey!14628 mapValue!14628))))

(declare-fun b!370234 () Bool)

(assert (=> b!370234 (= e!226159 e!226160)))

(declare-fun res!207866 () Bool)

(assert (=> b!370234 (=> (not res!207866) (not e!226160))))

(assert (=> b!370234 (= res!207866 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169919 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!370234 (= lt!169919 (array!21364 (store (arr!10150 _keys!658) i!548 k0!778) (size!10502 _keys!658)))))

(declare-fun b!370235 () Bool)

(declare-fun res!207862 () Bool)

(assert (=> b!370235 (=> (not res!207862) (not e!226159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370235 (= res!207862 (validKeyInArray!0 k0!778))))

(declare-fun b!370236 () Bool)

(declare-fun e!226161 () Bool)

(assert (=> b!370236 (= e!226163 (and e!226161 mapRes!14628))))

(declare-fun condMapEmpty!14628 () Bool)

(declare-fun mapDefault!14628 () ValueCell!4011)

(assert (=> b!370236 (= condMapEmpty!14628 (= (arr!10149 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4011)) mapDefault!14628)))))

(declare-fun b!370237 () Bool)

(assert (=> b!370237 (= e!226161 tp_is_empty!8709)))

(declare-fun b!370238 () Bool)

(declare-fun res!207865 () Bool)

(assert (=> b!370238 (=> (not res!207865) (not e!226159))))

(assert (=> b!370238 (= res!207865 (and (= (size!10501 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10502 _keys!658) (size!10501 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!370239 () Bool)

(declare-fun res!207867 () Bool)

(assert (=> b!370239 (=> (not res!207867) (not e!226159))))

(assert (=> b!370239 (= res!207867 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10502 _keys!658))))))

(declare-fun b!370240 () Bool)

(declare-fun res!207861 () Bool)

(assert (=> b!370240 (=> (not res!207861) (not e!226159))))

(declare-fun arrayContainsKey!0 (array!21363 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370240 (= res!207861 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14628 () Bool)

(assert (=> mapIsEmpty!14628 mapRes!14628))

(declare-fun b!370241 () Bool)

(declare-fun res!207864 () Bool)

(assert (=> b!370241 (=> (not res!207864) (not e!226160))))

(assert (=> b!370241 (= res!207864 (arrayNoDuplicates!0 lt!169919 #b00000000000000000000000000000000 Nil!5669))))

(assert (= (and start!36934 res!207863) b!370238))

(assert (= (and b!370238 res!207865) b!370233))

(assert (= (and b!370233 res!207860) b!370231))

(assert (= (and b!370231 res!207868) b!370239))

(assert (= (and b!370239 res!207867) b!370235))

(assert (= (and b!370235 res!207862) b!370229))

(assert (= (and b!370229 res!207869) b!370240))

(assert (= (and b!370240 res!207861) b!370234))

(assert (= (and b!370234 res!207866) b!370241))

(assert (= (and b!370241 res!207864) b!370232))

(assert (= (and b!370236 condMapEmpty!14628) mapIsEmpty!14628))

(assert (= (and b!370236 (not condMapEmpty!14628)) mapNonEmpty!14628))

(get-info :version)

(assert (= (and mapNonEmpty!14628 ((_ is ValueCellFull!4011) mapValue!14628)) b!370230))

(assert (= (and b!370236 ((_ is ValueCellFull!4011) mapDefault!14628)) b!370237))

(assert (= start!36934 b!370236))

(declare-fun m!366423 () Bool)

(assert (=> b!370235 m!366423))

(declare-fun m!366425 () Bool)

(assert (=> b!370231 m!366425))

(declare-fun m!366427 () Bool)

(assert (=> b!370241 m!366427))

(declare-fun m!366429 () Bool)

(assert (=> mapNonEmpty!14628 m!366429))

(declare-fun m!366431 () Bool)

(assert (=> b!370233 m!366431))

(declare-fun m!366433 () Bool)

(assert (=> b!370229 m!366433))

(declare-fun m!366435 () Bool)

(assert (=> b!370234 m!366435))

(declare-fun m!366437 () Bool)

(assert (=> b!370234 m!366437))

(declare-fun m!366439 () Bool)

(assert (=> b!370240 m!366439))

(declare-fun m!366441 () Bool)

(assert (=> start!36934 m!366441))

(declare-fun m!366443 () Bool)

(assert (=> start!36934 m!366443))

(declare-fun m!366445 () Bool)

(assert (=> start!36934 m!366445))

(declare-fun m!366447 () Bool)

(assert (=> b!370232 m!366447))

(declare-fun m!366449 () Bool)

(assert (=> b!370232 m!366449))

(declare-fun m!366451 () Bool)

(assert (=> b!370232 m!366451))

(check-sat (not b!370235) (not mapNonEmpty!14628) (not b!370241) (not b!370233) tp_is_empty!8709 (not b!370234) (not b!370232) b_and!15303 (not b!370240) (not start!36934) (not b_next!8061) (not b!370231))
(check-sat b_and!15303 (not b_next!8061))
