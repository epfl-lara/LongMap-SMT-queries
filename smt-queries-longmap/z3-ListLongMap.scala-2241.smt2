; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36894 () Bool)

(assert start!36894)

(declare-fun b_free!8035 () Bool)

(declare-fun b_next!8035 () Bool)

(assert (=> start!36894 (= b_free!8035 (not b_next!8035))))

(declare-fun tp!28820 () Bool)

(declare-fun b_and!15291 () Bool)

(assert (=> start!36894 (= tp!28820 b_and!15291)))

(declare-fun b!369673 () Bool)

(declare-fun e!225896 () Bool)

(assert (=> b!369673 (= e!225896 false)))

(declare-datatypes ((array!21296 0))(
  ( (array!21297 (arr!10116 (Array (_ BitVec 32) (_ BitVec 64))) (size!10468 (_ BitVec 32))) )
))
(declare-fun lt!169821 () array!21296)

(declare-datatypes ((V!12683 0))(
  ( (V!12684 (val!4386 Int)) )
))
(declare-datatypes ((ValueCell!3998 0))(
  ( (ValueCellFull!3998 (v!6584 V!12683)) (EmptyCell!3998) )
))
(declare-datatypes ((array!21298 0))(
  ( (array!21299 (arr!10117 (Array (_ BitVec 32) ValueCell!3998)) (size!10469 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21298)

(declare-datatypes ((tuple2!5724 0))(
  ( (tuple2!5725 (_1!2873 (_ BitVec 64)) (_2!2873 V!12683)) )
))
(declare-datatypes ((List!5552 0))(
  ( (Nil!5549) (Cons!5548 (h!6404 tuple2!5724) (t!10694 List!5552)) )
))
(declare-datatypes ((ListLongMap!4639 0))(
  ( (ListLongMap!4640 (toList!2335 List!5552)) )
))
(declare-fun lt!169822 () ListLongMap!4639)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12683)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12683)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12683)

(declare-fun getCurrentListMapNoExtraKeys!644 (array!21296 array!21298 (_ BitVec 32) (_ BitVec 32) V!12683 V!12683 (_ BitVec 32) Int) ListLongMap!4639)

(assert (=> b!369673 (= lt!169822 (getCurrentListMapNoExtraKeys!644 lt!169821 (array!21299 (store (arr!10117 _values!506) i!548 (ValueCellFull!3998 v!373)) (size!10469 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169820 () ListLongMap!4639)

(declare-fun _keys!658 () array!21296)

(assert (=> b!369673 (= lt!169820 (getCurrentListMapNoExtraKeys!644 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369674 () Bool)

(declare-fun res!207472 () Bool)

(declare-fun e!225895 () Bool)

(assert (=> b!369674 (=> (not res!207472) (not e!225895))))

(assert (=> b!369674 (= res!207472 (or (= (select (arr!10116 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10116 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369675 () Bool)

(assert (=> b!369675 (= e!225895 e!225896)))

(declare-fun res!207475 () Bool)

(assert (=> b!369675 (=> (not res!207475) (not e!225896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21296 (_ BitVec 32)) Bool)

(assert (=> b!369675 (= res!207475 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169821 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!369675 (= lt!169821 (array!21297 (store (arr!10116 _keys!658) i!548 k0!778) (size!10468 _keys!658)))))

(declare-fun b!369676 () Bool)

(declare-fun res!207476 () Bool)

(assert (=> b!369676 (=> (not res!207476) (not e!225895))))

(assert (=> b!369676 (= res!207476 (and (= (size!10469 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10468 _keys!658) (size!10469 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369677 () Bool)

(declare-fun res!207470 () Bool)

(assert (=> b!369677 (=> (not res!207470) (not e!225895))))

(declare-fun arrayContainsKey!0 (array!21296 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369677 (= res!207470 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369678 () Bool)

(declare-fun res!207467 () Bool)

(assert (=> b!369678 (=> (not res!207467) (not e!225895))))

(assert (=> b!369678 (= res!207467 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10468 _keys!658))))))

(declare-fun b!369679 () Bool)

(declare-fun res!207471 () Bool)

(assert (=> b!369679 (=> (not res!207471) (not e!225895))))

(assert (=> b!369679 (= res!207471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!14589 () Bool)

(declare-fun mapRes!14589 () Bool)

(assert (=> mapIsEmpty!14589 mapRes!14589))

(declare-fun b!369680 () Bool)

(declare-fun e!225894 () Bool)

(declare-fun tp_is_empty!8683 () Bool)

(assert (=> b!369680 (= e!225894 tp_is_empty!8683)))

(declare-fun res!207468 () Bool)

(assert (=> start!36894 (=> (not res!207468) (not e!225895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36894 (= res!207468 (validMask!0 mask!970))))

(assert (=> start!36894 e!225895))

(declare-fun e!225892 () Bool)

(declare-fun array_inv!7506 (array!21298) Bool)

(assert (=> start!36894 (and (array_inv!7506 _values!506) e!225892)))

(assert (=> start!36894 tp!28820))

(assert (=> start!36894 true))

(assert (=> start!36894 tp_is_empty!8683))

(declare-fun array_inv!7507 (array!21296) Bool)

(assert (=> start!36894 (array_inv!7507 _keys!658)))

(declare-fun b!369681 () Bool)

(declare-fun res!207473 () Bool)

(assert (=> b!369681 (=> (not res!207473) (not e!225895))))

(declare-datatypes ((List!5553 0))(
  ( (Nil!5550) (Cons!5549 (h!6405 (_ BitVec 64)) (t!10695 List!5553)) )
))
(declare-fun arrayNoDuplicates!0 (array!21296 (_ BitVec 32) List!5553) Bool)

(assert (=> b!369681 (= res!207473 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5550))))

(declare-fun mapNonEmpty!14589 () Bool)

(declare-fun tp!28821 () Bool)

(declare-fun e!225893 () Bool)

(assert (=> mapNonEmpty!14589 (= mapRes!14589 (and tp!28821 e!225893))))

(declare-fun mapValue!14589 () ValueCell!3998)

(declare-fun mapRest!14589 () (Array (_ BitVec 32) ValueCell!3998))

(declare-fun mapKey!14589 () (_ BitVec 32))

(assert (=> mapNonEmpty!14589 (= (arr!10117 _values!506) (store mapRest!14589 mapKey!14589 mapValue!14589))))

(declare-fun b!369682 () Bool)

(assert (=> b!369682 (= e!225892 (and e!225894 mapRes!14589))))

(declare-fun condMapEmpty!14589 () Bool)

(declare-fun mapDefault!14589 () ValueCell!3998)

(assert (=> b!369682 (= condMapEmpty!14589 (= (arr!10117 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3998)) mapDefault!14589)))))

(declare-fun b!369683 () Bool)

(declare-fun res!207469 () Bool)

(assert (=> b!369683 (=> (not res!207469) (not e!225895))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369683 (= res!207469 (validKeyInArray!0 k0!778))))

(declare-fun b!369684 () Bool)

(assert (=> b!369684 (= e!225893 tp_is_empty!8683)))

(declare-fun b!369685 () Bool)

(declare-fun res!207474 () Bool)

(assert (=> b!369685 (=> (not res!207474) (not e!225896))))

(assert (=> b!369685 (= res!207474 (arrayNoDuplicates!0 lt!169821 #b00000000000000000000000000000000 Nil!5550))))

(assert (= (and start!36894 res!207468) b!369676))

(assert (= (and b!369676 res!207476) b!369679))

(assert (= (and b!369679 res!207471) b!369681))

(assert (= (and b!369681 res!207473) b!369678))

(assert (= (and b!369678 res!207467) b!369683))

(assert (= (and b!369683 res!207469) b!369674))

(assert (= (and b!369674 res!207472) b!369677))

(assert (= (and b!369677 res!207470) b!369675))

(assert (= (and b!369675 res!207475) b!369685))

(assert (= (and b!369685 res!207474) b!369673))

(assert (= (and b!369682 condMapEmpty!14589) mapIsEmpty!14589))

(assert (= (and b!369682 (not condMapEmpty!14589)) mapNonEmpty!14589))

(get-info :version)

(assert (= (and mapNonEmpty!14589 ((_ is ValueCellFull!3998) mapValue!14589)) b!369684))

(assert (= (and b!369682 ((_ is ValueCellFull!3998) mapDefault!14589)) b!369680))

(assert (= start!36894 b!369682))

(declare-fun m!366263 () Bool)

(assert (=> b!369681 m!366263))

(declare-fun m!366265 () Bool)

(assert (=> b!369679 m!366265))

(declare-fun m!366267 () Bool)

(assert (=> b!369674 m!366267))

(declare-fun m!366269 () Bool)

(assert (=> b!369685 m!366269))

(declare-fun m!366271 () Bool)

(assert (=> mapNonEmpty!14589 m!366271))

(declare-fun m!366273 () Bool)

(assert (=> b!369673 m!366273))

(declare-fun m!366275 () Bool)

(assert (=> b!369673 m!366275))

(declare-fun m!366277 () Bool)

(assert (=> b!369673 m!366277))

(declare-fun m!366279 () Bool)

(assert (=> start!36894 m!366279))

(declare-fun m!366281 () Bool)

(assert (=> start!36894 m!366281))

(declare-fun m!366283 () Bool)

(assert (=> start!36894 m!366283))

(declare-fun m!366285 () Bool)

(assert (=> b!369675 m!366285))

(declare-fun m!366287 () Bool)

(assert (=> b!369675 m!366287))

(declare-fun m!366289 () Bool)

(assert (=> b!369677 m!366289))

(declare-fun m!366291 () Bool)

(assert (=> b!369683 m!366291))

(check-sat (not b!369685) (not b!369677) (not b!369683) tp_is_empty!8683 (not b!369681) (not b!369673) b_and!15291 (not b!369675) (not b_next!8035) (not mapNonEmpty!14589) (not start!36894) (not b!369679))
(check-sat b_and!15291 (not b_next!8035))
