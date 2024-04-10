; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36856 () Bool)

(assert start!36856)

(declare-fun b_free!7983 () Bool)

(declare-fun b_next!7983 () Bool)

(assert (=> start!36856 (= b_free!7983 (not b_next!7983))))

(declare-fun tp!28664 () Bool)

(declare-fun b_and!15225 () Bool)

(assert (=> start!36856 (= tp!28664 b_and!15225)))

(declare-fun b!368708 () Bool)

(declare-fun res!206697 () Bool)

(declare-fun e!225458 () Bool)

(assert (=> b!368708 (=> (not res!206697) (not e!225458))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368708 (= res!206697 (validKeyInArray!0 k0!778))))

(declare-fun b!368709 () Bool)

(declare-fun res!206694 () Bool)

(assert (=> b!368709 (=> (not res!206694) (not e!225458))))

(declare-datatypes ((array!21217 0))(
  ( (array!21218 (arr!10077 (Array (_ BitVec 32) (_ BitVec 64))) (size!10429 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21217)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21217 (_ BitVec 32)) Bool)

(assert (=> b!368709 (= res!206694 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368710 () Bool)

(declare-fun res!206693 () Bool)

(assert (=> b!368710 (=> (not res!206693) (not e!225458))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!368710 (= res!206693 (or (= (select (arr!10077 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10077 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368711 () Bool)

(declare-fun res!206699 () Bool)

(assert (=> b!368711 (=> (not res!206699) (not e!225458))))

(assert (=> b!368711 (= res!206699 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10429 _keys!658))))))

(declare-fun b!368712 () Bool)

(declare-fun e!225461 () Bool)

(assert (=> b!368712 (= e!225458 e!225461)))

(declare-fun res!206698 () Bool)

(assert (=> b!368712 (=> (not res!206698) (not e!225461))))

(declare-fun lt!169572 () array!21217)

(assert (=> b!368712 (= res!206698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169572 mask!970))))

(assert (=> b!368712 (= lt!169572 (array!21218 (store (arr!10077 _keys!658) i!548 k0!778) (size!10429 _keys!658)))))

(declare-fun b!368713 () Bool)

(declare-fun e!225460 () Bool)

(declare-fun tp_is_empty!8631 () Bool)

(assert (=> b!368713 (= e!225460 tp_is_empty!8631)))

(declare-fun b!368714 () Bool)

(declare-fun res!206690 () Bool)

(assert (=> b!368714 (=> (not res!206690) (not e!225461))))

(declare-datatypes ((List!5613 0))(
  ( (Nil!5610) (Cons!5609 (h!6465 (_ BitVec 64)) (t!10763 List!5613)) )
))
(declare-fun arrayNoDuplicates!0 (array!21217 (_ BitVec 32) List!5613) Bool)

(assert (=> b!368714 (= res!206690 (arrayNoDuplicates!0 lt!169572 #b00000000000000000000000000000000 Nil!5610))))

(declare-fun mapNonEmpty!14511 () Bool)

(declare-fun mapRes!14511 () Bool)

(declare-fun tp!28665 () Bool)

(declare-fun e!225456 () Bool)

(assert (=> mapNonEmpty!14511 (= mapRes!14511 (and tp!28665 e!225456))))

(declare-datatypes ((V!12613 0))(
  ( (V!12614 (val!4360 Int)) )
))
(declare-datatypes ((ValueCell!3972 0))(
  ( (ValueCellFull!3972 (v!6557 V!12613)) (EmptyCell!3972) )
))
(declare-datatypes ((array!21219 0))(
  ( (array!21220 (arr!10078 (Array (_ BitVec 32) ValueCell!3972)) (size!10430 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21219)

(declare-fun mapRest!14511 () (Array (_ BitVec 32) ValueCell!3972))

(declare-fun mapKey!14511 () (_ BitVec 32))

(declare-fun mapValue!14511 () ValueCell!3972)

(assert (=> mapNonEmpty!14511 (= (arr!10078 _values!506) (store mapRest!14511 mapKey!14511 mapValue!14511))))

(declare-fun b!368715 () Bool)

(declare-fun res!206692 () Bool)

(assert (=> b!368715 (=> (not res!206692) (not e!225458))))

(assert (=> b!368715 (= res!206692 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5610))))

(declare-fun b!368716 () Bool)

(assert (=> b!368716 (= e!225456 tp_is_empty!8631)))

(declare-fun b!368717 () Bool)

(assert (=> b!368717 (= e!225461 (bvsgt #b00000000000000000000000000000000 (size!10429 _keys!658)))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5780 0))(
  ( (tuple2!5781 (_1!2901 (_ BitVec 64)) (_2!2901 V!12613)) )
))
(declare-datatypes ((List!5614 0))(
  ( (Nil!5611) (Cons!5610 (h!6466 tuple2!5780) (t!10764 List!5614)) )
))
(declare-datatypes ((ListLongMap!4693 0))(
  ( (ListLongMap!4694 (toList!2362 List!5614)) )
))
(declare-fun lt!169571 () ListLongMap!4693)

(declare-fun zeroValue!472 () V!12613)

(declare-fun minValue!472 () V!12613)

(declare-fun getCurrentListMapNoExtraKeys!639 (array!21217 array!21219 (_ BitVec 32) (_ BitVec 32) V!12613 V!12613 (_ BitVec 32) Int) ListLongMap!4693)

(assert (=> b!368717 (= lt!169571 (getCurrentListMapNoExtraKeys!639 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368718 () Bool)

(declare-fun res!206691 () Bool)

(assert (=> b!368718 (=> (not res!206691) (not e!225458))))

(assert (=> b!368718 (= res!206691 (and (= (size!10430 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10429 _keys!658) (size!10430 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368720 () Bool)

(declare-fun res!206695 () Bool)

(assert (=> b!368720 (=> (not res!206695) (not e!225458))))

(declare-fun arrayContainsKey!0 (array!21217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368720 (= res!206695 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14511 () Bool)

(assert (=> mapIsEmpty!14511 mapRes!14511))

(declare-fun b!368719 () Bool)

(declare-fun e!225457 () Bool)

(assert (=> b!368719 (= e!225457 (and e!225460 mapRes!14511))))

(declare-fun condMapEmpty!14511 () Bool)

(declare-fun mapDefault!14511 () ValueCell!3972)

(assert (=> b!368719 (= condMapEmpty!14511 (= (arr!10078 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3972)) mapDefault!14511)))))

(declare-fun res!206696 () Bool)

(assert (=> start!36856 (=> (not res!206696) (not e!225458))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36856 (= res!206696 (validMask!0 mask!970))))

(assert (=> start!36856 e!225458))

(assert (=> start!36856 true))

(declare-fun array_inv!7450 (array!21219) Bool)

(assert (=> start!36856 (and (array_inv!7450 _values!506) e!225457)))

(assert (=> start!36856 tp!28664))

(assert (=> start!36856 tp_is_empty!8631))

(declare-fun array_inv!7451 (array!21217) Bool)

(assert (=> start!36856 (array_inv!7451 _keys!658)))

(assert (= (and start!36856 res!206696) b!368718))

(assert (= (and b!368718 res!206691) b!368709))

(assert (= (and b!368709 res!206694) b!368715))

(assert (= (and b!368715 res!206692) b!368711))

(assert (= (and b!368711 res!206699) b!368708))

(assert (= (and b!368708 res!206697) b!368710))

(assert (= (and b!368710 res!206693) b!368720))

(assert (= (and b!368720 res!206695) b!368712))

(assert (= (and b!368712 res!206698) b!368714))

(assert (= (and b!368714 res!206690) b!368717))

(assert (= (and b!368719 condMapEmpty!14511) mapIsEmpty!14511))

(assert (= (and b!368719 (not condMapEmpty!14511)) mapNonEmpty!14511))

(get-info :version)

(assert (= (and mapNonEmpty!14511 ((_ is ValueCellFull!3972) mapValue!14511)) b!368716))

(assert (= (and b!368719 ((_ is ValueCellFull!3972) mapDefault!14511)) b!368713))

(assert (= start!36856 b!368719))

(declare-fun m!365261 () Bool)

(assert (=> b!368712 m!365261))

(declare-fun m!365263 () Bool)

(assert (=> b!368712 m!365263))

(declare-fun m!365265 () Bool)

(assert (=> start!36856 m!365265))

(declare-fun m!365267 () Bool)

(assert (=> start!36856 m!365267))

(declare-fun m!365269 () Bool)

(assert (=> start!36856 m!365269))

(declare-fun m!365271 () Bool)

(assert (=> b!368720 m!365271))

(declare-fun m!365273 () Bool)

(assert (=> b!368709 m!365273))

(declare-fun m!365275 () Bool)

(assert (=> b!368708 m!365275))

(declare-fun m!365277 () Bool)

(assert (=> b!368710 m!365277))

(declare-fun m!365279 () Bool)

(assert (=> b!368714 m!365279))

(declare-fun m!365281 () Bool)

(assert (=> b!368717 m!365281))

(declare-fun m!365283 () Bool)

(assert (=> mapNonEmpty!14511 m!365283))

(declare-fun m!365285 () Bool)

(assert (=> b!368715 m!365285))

(check-sat (not b!368720) (not start!36856) (not b!368709) (not b!368712) (not mapNonEmpty!14511) (not b_next!7983) (not b!368714) (not b!368715) tp_is_empty!8631 b_and!15225 (not b!368717) (not b!368708))
(check-sat b_and!15225 (not b_next!7983))
