; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39512 () Bool)

(assert start!39512)

(declare-fun b_free!9793 () Bool)

(declare-fun b_next!9793 () Bool)

(assert (=> start!39512 (= b_free!9793 (not b_next!9793))))

(declare-fun tp!34907 () Bool)

(declare-fun b_and!17423 () Bool)

(assert (=> start!39512 (= tp!34907 b_and!17423)))

(declare-fun b!422319 () Bool)

(declare-fun e!251226 () Bool)

(declare-fun e!251225 () Bool)

(assert (=> b!422319 (= e!251226 e!251225)))

(declare-fun res!246667 () Bool)

(assert (=> b!422319 (=> (not res!246667) (not e!251225))))

(declare-datatypes ((array!25719 0))(
  ( (array!25720 (arr!12309 (Array (_ BitVec 32) (_ BitVec 64))) (size!12662 (_ BitVec 32))) )
))
(declare-fun lt!193765 () array!25719)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25719 (_ BitVec 32)) Bool)

(assert (=> b!422319 (= res!246667 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193765 mask!1025))))

(declare-fun _keys!709 () array!25719)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422319 (= lt!193765 (array!25720 (store (arr!12309 _keys!709) i!563 k0!794) (size!12662 _keys!709)))))

(declare-fun b!422320 () Bool)

(declare-fun res!246673 () Bool)

(assert (=> b!422320 (=> (not res!246673) (not e!251226))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422320 (= res!246673 (validMask!0 mask!1025))))

(declare-fun b!422321 () Bool)

(declare-fun res!246674 () Bool)

(assert (=> b!422321 (=> (not res!246674) (not e!251226))))

(assert (=> b!422321 (= res!246674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422322 () Bool)

(declare-fun res!246671 () Bool)

(assert (=> b!422322 (=> (not res!246671) (not e!251226))))

(declare-fun arrayContainsKey!0 (array!25719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422322 (= res!246671 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422323 () Bool)

(declare-fun e!251224 () Bool)

(declare-fun tp_is_empty!10945 () Bool)

(assert (=> b!422323 (= e!251224 tp_is_empty!10945)))

(declare-fun b!422324 () Bool)

(declare-fun res!246678 () Bool)

(assert (=> b!422324 (=> (not res!246678) (not e!251226))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422324 (= res!246678 (validKeyInArray!0 k0!794))))

(declare-fun b!422325 () Bool)

(declare-fun res!246669 () Bool)

(assert (=> b!422325 (=> (not res!246669) (not e!251226))))

(declare-datatypes ((List!7221 0))(
  ( (Nil!7218) (Cons!7217 (h!8073 (_ BitVec 64)) (t!12656 List!7221)) )
))
(declare-fun arrayNoDuplicates!0 (array!25719 (_ BitVec 32) List!7221) Bool)

(assert (=> b!422325 (= res!246669 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7218))))

(declare-fun mapNonEmpty!18039 () Bool)

(declare-fun mapRes!18039 () Bool)

(declare-fun tp!34908 () Bool)

(declare-fun e!251221 () Bool)

(assert (=> mapNonEmpty!18039 (= mapRes!18039 (and tp!34908 e!251221))))

(declare-fun mapKey!18039 () (_ BitVec 32))

(declare-datatypes ((V!15699 0))(
  ( (V!15700 (val!5517 Int)) )
))
(declare-datatypes ((ValueCell!5129 0))(
  ( (ValueCellFull!5129 (v!7758 V!15699)) (EmptyCell!5129) )
))
(declare-fun mapValue!18039 () ValueCell!5129)

(declare-datatypes ((array!25721 0))(
  ( (array!25722 (arr!12310 (Array (_ BitVec 32) ValueCell!5129)) (size!12663 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25721)

(declare-fun mapRest!18039 () (Array (_ BitVec 32) ValueCell!5129))

(assert (=> mapNonEmpty!18039 (= (arr!12310 _values!549) (store mapRest!18039 mapKey!18039 mapValue!18039))))

(declare-fun b!422326 () Bool)

(assert (=> b!422326 (= e!251221 tp_is_empty!10945)))

(declare-fun b!422327 () Bool)

(declare-fun res!246676 () Bool)

(assert (=> b!422327 (=> (not res!246676) (not e!251225))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!422327 (= res!246676 (bvsle from!863 i!563))))

(declare-fun res!246677 () Bool)

(assert (=> start!39512 (=> (not res!246677) (not e!251226))))

(assert (=> start!39512 (= res!246677 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12662 _keys!709))))))

(assert (=> start!39512 e!251226))

(assert (=> start!39512 tp_is_empty!10945))

(assert (=> start!39512 tp!34907))

(assert (=> start!39512 true))

(declare-fun e!251222 () Bool)

(declare-fun array_inv!9006 (array!25721) Bool)

(assert (=> start!39512 (and (array_inv!9006 _values!549) e!251222)))

(declare-fun array_inv!9007 (array!25719) Bool)

(assert (=> start!39512 (array_inv!9007 _keys!709)))

(declare-fun b!422318 () Bool)

(declare-fun res!246668 () Bool)

(assert (=> b!422318 (=> (not res!246668) (not e!251226))))

(assert (=> b!422318 (= res!246668 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12662 _keys!709))))))

(declare-fun b!422328 () Bool)

(assert (=> b!422328 (= e!251225 false)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7230 0))(
  ( (tuple2!7231 (_1!3626 (_ BitVec 64)) (_2!3626 V!15699)) )
))
(declare-datatypes ((List!7222 0))(
  ( (Nil!7219) (Cons!7218 (h!8074 tuple2!7230) (t!12657 List!7222)) )
))
(declare-datatypes ((ListLongMap!6133 0))(
  ( (ListLongMap!6134 (toList!3082 List!7222)) )
))
(declare-fun lt!193766 () ListLongMap!6133)

(declare-fun v!412 () V!15699)

(declare-fun minValue!515 () V!15699)

(declare-fun zeroValue!515 () V!15699)

(declare-fun getCurrentListMapNoExtraKeys!1290 (array!25719 array!25721 (_ BitVec 32) (_ BitVec 32) V!15699 V!15699 (_ BitVec 32) Int) ListLongMap!6133)

(assert (=> b!422328 (= lt!193766 (getCurrentListMapNoExtraKeys!1290 lt!193765 (array!25722 (store (arr!12310 _values!549) i!563 (ValueCellFull!5129 v!412)) (size!12663 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!193764 () ListLongMap!6133)

(assert (=> b!422328 (= lt!193764 (getCurrentListMapNoExtraKeys!1290 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422329 () Bool)

(declare-fun res!246672 () Bool)

(assert (=> b!422329 (=> (not res!246672) (not e!251226))))

(assert (=> b!422329 (= res!246672 (and (= (size!12663 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12662 _keys!709) (size!12663 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422330 () Bool)

(declare-fun res!246670 () Bool)

(assert (=> b!422330 (=> (not res!246670) (not e!251225))))

(assert (=> b!422330 (= res!246670 (arrayNoDuplicates!0 lt!193765 #b00000000000000000000000000000000 Nil!7218))))

(declare-fun b!422331 () Bool)

(assert (=> b!422331 (= e!251222 (and e!251224 mapRes!18039))))

(declare-fun condMapEmpty!18039 () Bool)

(declare-fun mapDefault!18039 () ValueCell!5129)

(assert (=> b!422331 (= condMapEmpty!18039 (= (arr!12310 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5129)) mapDefault!18039)))))

(declare-fun b!422332 () Bool)

(declare-fun res!246675 () Bool)

(assert (=> b!422332 (=> (not res!246675) (not e!251226))))

(assert (=> b!422332 (= res!246675 (or (= (select (arr!12309 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12309 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18039 () Bool)

(assert (=> mapIsEmpty!18039 mapRes!18039))

(assert (= (and start!39512 res!246677) b!422320))

(assert (= (and b!422320 res!246673) b!422329))

(assert (= (and b!422329 res!246672) b!422321))

(assert (= (and b!422321 res!246674) b!422325))

(assert (= (and b!422325 res!246669) b!422318))

(assert (= (and b!422318 res!246668) b!422324))

(assert (= (and b!422324 res!246678) b!422332))

(assert (= (and b!422332 res!246675) b!422322))

(assert (= (and b!422322 res!246671) b!422319))

(assert (= (and b!422319 res!246667) b!422330))

(assert (= (and b!422330 res!246670) b!422327))

(assert (= (and b!422327 res!246676) b!422328))

(assert (= (and b!422331 condMapEmpty!18039) mapIsEmpty!18039))

(assert (= (and b!422331 (not condMapEmpty!18039)) mapNonEmpty!18039))

(get-info :version)

(assert (= (and mapNonEmpty!18039 ((_ is ValueCellFull!5129) mapValue!18039)) b!422326))

(assert (= (and b!422331 ((_ is ValueCellFull!5129) mapDefault!18039)) b!422323))

(assert (= start!39512 b!422331))

(declare-fun m!411621 () Bool)

(assert (=> b!422321 m!411621))

(declare-fun m!411623 () Bool)

(assert (=> b!422319 m!411623))

(declare-fun m!411625 () Bool)

(assert (=> b!422319 m!411625))

(declare-fun m!411627 () Bool)

(assert (=> b!422332 m!411627))

(declare-fun m!411629 () Bool)

(assert (=> b!422322 m!411629))

(declare-fun m!411631 () Bool)

(assert (=> b!422325 m!411631))

(declare-fun m!411633 () Bool)

(assert (=> b!422320 m!411633))

(declare-fun m!411635 () Bool)

(assert (=> mapNonEmpty!18039 m!411635))

(declare-fun m!411637 () Bool)

(assert (=> start!39512 m!411637))

(declare-fun m!411639 () Bool)

(assert (=> start!39512 m!411639))

(declare-fun m!411641 () Bool)

(assert (=> b!422328 m!411641))

(declare-fun m!411643 () Bool)

(assert (=> b!422328 m!411643))

(declare-fun m!411645 () Bool)

(assert (=> b!422328 m!411645))

(declare-fun m!411647 () Bool)

(assert (=> b!422324 m!411647))

(declare-fun m!411649 () Bool)

(assert (=> b!422330 m!411649))

(check-sat (not b!422328) b_and!17423 (not b!422320) tp_is_empty!10945 (not b!422321) (not b!422330) (not b!422324) (not b!422319) (not b_next!9793) (not b!422322) (not mapNonEmpty!18039) (not b!422325) (not start!39512))
(check-sat b_and!17423 (not b_next!9793))
