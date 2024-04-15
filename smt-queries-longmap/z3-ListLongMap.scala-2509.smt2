; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38858 () Bool)

(assert start!38858)

(declare-fun b!405925 () Bool)

(declare-fun e!243950 () Bool)

(declare-fun e!243953 () Bool)

(declare-fun mapRes!17058 () Bool)

(assert (=> b!405925 (= e!243950 (and e!243953 mapRes!17058))))

(declare-fun condMapEmpty!17058 () Bool)

(declare-datatypes ((V!14827 0))(
  ( (V!14828 (val!5190 Int)) )
))
(declare-datatypes ((ValueCell!4802 0))(
  ( (ValueCellFull!4802 (v!7431 V!14827)) (EmptyCell!4802) )
))
(declare-datatypes ((array!24457 0))(
  ( (array!24458 (arr!11678 (Array (_ BitVec 32) ValueCell!4802)) (size!12031 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24457)

(declare-fun mapDefault!17058 () ValueCell!4802)

(assert (=> b!405925 (= condMapEmpty!17058 (= (arr!11678 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4802)) mapDefault!17058)))))

(declare-fun mapIsEmpty!17058 () Bool)

(assert (=> mapIsEmpty!17058 mapRes!17058))

(declare-fun b!405926 () Bool)

(declare-fun tp_is_empty!10291 () Bool)

(assert (=> b!405926 (= e!243953 tp_is_empty!10291)))

(declare-fun b!405927 () Bool)

(declare-fun res!234467 () Bool)

(declare-fun e!243951 () Bool)

(assert (=> b!405927 (=> (not res!234467) (not e!243951))))

(declare-datatypes ((array!24459 0))(
  ( (array!24460 (arr!11679 (Array (_ BitVec 32) (_ BitVec 64))) (size!12032 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24459)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!405927 (= res!234467 (and (= (size!12031 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12032 _keys!709) (size!12031 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!405928 () Bool)

(declare-fun res!234464 () Bool)

(assert (=> b!405928 (=> (not res!234464) (not e!243951))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!405928 (= res!234464 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!405929 () Bool)

(declare-fun res!234459 () Bool)

(assert (=> b!405929 (=> (not res!234459) (not e!243951))))

(declare-datatypes ((List!6762 0))(
  ( (Nil!6759) (Cons!6758 (h!7614 (_ BitVec 64)) (t!11927 List!6762)) )
))
(declare-fun arrayNoDuplicates!0 (array!24459 (_ BitVec 32) List!6762) Bool)

(assert (=> b!405929 (= res!234459 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6759))))

(declare-fun mapNonEmpty!17058 () Bool)

(declare-fun tp!33177 () Bool)

(declare-fun e!243949 () Bool)

(assert (=> mapNonEmpty!17058 (= mapRes!17058 (and tp!33177 e!243949))))

(declare-fun mapValue!17058 () ValueCell!4802)

(declare-fun mapKey!17058 () (_ BitVec 32))

(declare-fun mapRest!17058 () (Array (_ BitVec 32) ValueCell!4802))

(assert (=> mapNonEmpty!17058 (= (arr!11678 _values!549) (store mapRest!17058 mapKey!17058 mapValue!17058))))

(declare-fun b!405931 () Bool)

(declare-fun res!234463 () Bool)

(assert (=> b!405931 (=> (not res!234463) (not e!243951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!405931 (= res!234463 (validMask!0 mask!1025))))

(declare-fun b!405932 () Bool)

(declare-fun res!234468 () Bool)

(assert (=> b!405932 (=> (not res!234468) (not e!243951))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!405932 (= res!234468 (or (= (select (arr!11679 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11679 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!405933 () Bool)

(declare-fun res!234466 () Bool)

(assert (=> b!405933 (=> (not res!234466) (not e!243951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!405933 (= res!234466 (validKeyInArray!0 k0!794))))

(declare-fun b!405934 () Bool)

(declare-fun res!234465 () Bool)

(assert (=> b!405934 (=> (not res!234465) (not e!243951))))

(assert (=> b!405934 (= res!234465 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12032 _keys!709))))))

(declare-fun b!405935 () Bool)

(declare-fun e!243954 () Bool)

(assert (=> b!405935 (= e!243951 e!243954)))

(declare-fun res!234462 () Bool)

(assert (=> b!405935 (=> (not res!234462) (not e!243954))))

(declare-fun lt!188218 () array!24459)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24459 (_ BitVec 32)) Bool)

(assert (=> b!405935 (= res!234462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188218 mask!1025))))

(assert (=> b!405935 (= lt!188218 (array!24460 (store (arr!11679 _keys!709) i!563 k0!794) (size!12032 _keys!709)))))

(declare-fun res!234461 () Bool)

(assert (=> start!38858 (=> (not res!234461) (not e!243951))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38858 (= res!234461 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12032 _keys!709))))))

(assert (=> start!38858 e!243951))

(assert (=> start!38858 true))

(declare-fun array_inv!8568 (array!24457) Bool)

(assert (=> start!38858 (and (array_inv!8568 _values!549) e!243950)))

(declare-fun array_inv!8569 (array!24459) Bool)

(assert (=> start!38858 (array_inv!8569 _keys!709)))

(declare-fun b!405930 () Bool)

(assert (=> b!405930 (= e!243954 false)))

(declare-fun lt!188219 () Bool)

(assert (=> b!405930 (= lt!188219 (arrayNoDuplicates!0 lt!188218 #b00000000000000000000000000000000 Nil!6759))))

(declare-fun b!405936 () Bool)

(declare-fun res!234460 () Bool)

(assert (=> b!405936 (=> (not res!234460) (not e!243951))))

(assert (=> b!405936 (= res!234460 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!405937 () Bool)

(assert (=> b!405937 (= e!243949 tp_is_empty!10291)))

(assert (= (and start!38858 res!234461) b!405931))

(assert (= (and b!405931 res!234463) b!405927))

(assert (= (and b!405927 res!234467) b!405936))

(assert (= (and b!405936 res!234460) b!405929))

(assert (= (and b!405929 res!234459) b!405934))

(assert (= (and b!405934 res!234465) b!405933))

(assert (= (and b!405933 res!234466) b!405932))

(assert (= (and b!405932 res!234468) b!405928))

(assert (= (and b!405928 res!234464) b!405935))

(assert (= (and b!405935 res!234462) b!405930))

(assert (= (and b!405925 condMapEmpty!17058) mapIsEmpty!17058))

(assert (= (and b!405925 (not condMapEmpty!17058)) mapNonEmpty!17058))

(get-info :version)

(assert (= (and mapNonEmpty!17058 ((_ is ValueCellFull!4802) mapValue!17058)) b!405937))

(assert (= (and b!405925 ((_ is ValueCellFull!4802) mapDefault!17058)) b!405926))

(assert (= start!38858 b!405925))

(declare-fun m!397635 () Bool)

(assert (=> b!405936 m!397635))

(declare-fun m!397637 () Bool)

(assert (=> b!405931 m!397637))

(declare-fun m!397639 () Bool)

(assert (=> b!405935 m!397639))

(declare-fun m!397641 () Bool)

(assert (=> b!405935 m!397641))

(declare-fun m!397643 () Bool)

(assert (=> mapNonEmpty!17058 m!397643))

(declare-fun m!397645 () Bool)

(assert (=> b!405930 m!397645))

(declare-fun m!397647 () Bool)

(assert (=> start!38858 m!397647))

(declare-fun m!397649 () Bool)

(assert (=> start!38858 m!397649))

(declare-fun m!397651 () Bool)

(assert (=> b!405929 m!397651))

(declare-fun m!397653 () Bool)

(assert (=> b!405933 m!397653))

(declare-fun m!397655 () Bool)

(assert (=> b!405932 m!397655))

(declare-fun m!397657 () Bool)

(assert (=> b!405928 m!397657))

(check-sat (not b!405931) (not b!405929) (not b!405935) (not b!405933) tp_is_empty!10291 (not mapNonEmpty!17058) (not b!405928) (not b!405936) (not b!405930) (not start!38858))
(check-sat)
