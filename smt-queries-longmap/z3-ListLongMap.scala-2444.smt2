; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38484 () Bool)

(assert start!38484)

(declare-fun mapIsEmpty!16476 () Bool)

(declare-fun mapRes!16476 () Bool)

(assert (=> mapIsEmpty!16476 mapRes!16476))

(declare-fun b!397334 () Bool)

(declare-fun res!228120 () Bool)

(declare-fun e!240311 () Bool)

(assert (=> b!397334 (=> (not res!228120) (not e!240311))))

(declare-datatypes ((array!23719 0))(
  ( (array!23720 (arr!11309 (Array (_ BitVec 32) (_ BitVec 64))) (size!11661 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23719)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397334 (= res!228120 (or (= (select (arr!11309 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11309 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397335 () Bool)

(declare-fun res!228123 () Bool)

(assert (=> b!397335 (=> (not res!228123) (not e!240311))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397335 (= res!228123 (validKeyInArray!0 k0!794))))

(declare-fun b!397336 () Bool)

(declare-fun res!228129 () Bool)

(assert (=> b!397336 (=> (not res!228129) (not e!240311))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397336 (= res!228129 (validMask!0 mask!1025))))

(declare-fun b!397337 () Bool)

(declare-fun res!228125 () Bool)

(assert (=> b!397337 (=> (not res!228125) (not e!240311))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14309 0))(
  ( (V!14310 (val!4996 Int)) )
))
(declare-datatypes ((ValueCell!4608 0))(
  ( (ValueCellFull!4608 (v!7243 V!14309)) (EmptyCell!4608) )
))
(declare-datatypes ((array!23721 0))(
  ( (array!23722 (arr!11310 (Array (_ BitVec 32) ValueCell!4608)) (size!11662 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23721)

(assert (=> b!397337 (= res!228125 (and (= (size!11662 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11661 _keys!709) (size!11662 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397339 () Bool)

(declare-fun e!240312 () Bool)

(assert (=> b!397339 (= e!240311 e!240312)))

(declare-fun res!228127 () Bool)

(assert (=> b!397339 (=> (not res!228127) (not e!240312))))

(declare-fun lt!187288 () array!23719)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23719 (_ BitVec 32)) Bool)

(assert (=> b!397339 (= res!228127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187288 mask!1025))))

(assert (=> b!397339 (= lt!187288 (array!23720 (store (arr!11309 _keys!709) i!563 k0!794) (size!11661 _keys!709)))))

(declare-fun b!397340 () Bool)

(declare-fun res!228128 () Bool)

(assert (=> b!397340 (=> (not res!228128) (not e!240311))))

(declare-datatypes ((List!6546 0))(
  ( (Nil!6543) (Cons!6542 (h!7398 (_ BitVec 64)) (t!11720 List!6546)) )
))
(declare-fun arrayNoDuplicates!0 (array!23719 (_ BitVec 32) List!6546) Bool)

(assert (=> b!397340 (= res!228128 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6543))))

(declare-fun b!397341 () Bool)

(declare-fun e!240310 () Bool)

(declare-fun e!240308 () Bool)

(assert (=> b!397341 (= e!240310 (and e!240308 mapRes!16476))))

(declare-fun condMapEmpty!16476 () Bool)

(declare-fun mapDefault!16476 () ValueCell!4608)

(assert (=> b!397341 (= condMapEmpty!16476 (= (arr!11310 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4608)) mapDefault!16476)))))

(declare-fun b!397342 () Bool)

(assert (=> b!397342 (= e!240312 false)))

(declare-fun lt!187289 () Bool)

(assert (=> b!397342 (= lt!187289 (arrayNoDuplicates!0 lt!187288 #b00000000000000000000000000000000 Nil!6543))))

(declare-fun b!397343 () Bool)

(declare-fun tp_is_empty!9903 () Bool)

(assert (=> b!397343 (= e!240308 tp_is_empty!9903)))

(declare-fun mapNonEmpty!16476 () Bool)

(declare-fun tp!32271 () Bool)

(declare-fun e!240309 () Bool)

(assert (=> mapNonEmpty!16476 (= mapRes!16476 (and tp!32271 e!240309))))

(declare-fun mapKey!16476 () (_ BitVec 32))

(declare-fun mapRest!16476 () (Array (_ BitVec 32) ValueCell!4608))

(declare-fun mapValue!16476 () ValueCell!4608)

(assert (=> mapNonEmpty!16476 (= (arr!11310 _values!549) (store mapRest!16476 mapKey!16476 mapValue!16476))))

(declare-fun b!397344 () Bool)

(declare-fun res!228121 () Bool)

(assert (=> b!397344 (=> (not res!228121) (not e!240311))))

(assert (=> b!397344 (= res!228121 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!228122 () Bool)

(assert (=> start!38484 (=> (not res!228122) (not e!240311))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38484 (= res!228122 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11661 _keys!709))))))

(assert (=> start!38484 e!240311))

(assert (=> start!38484 true))

(declare-fun array_inv!8288 (array!23721) Bool)

(assert (=> start!38484 (and (array_inv!8288 _values!549) e!240310)))

(declare-fun array_inv!8289 (array!23719) Bool)

(assert (=> start!38484 (array_inv!8289 _keys!709)))

(declare-fun b!397338 () Bool)

(declare-fun res!228126 () Bool)

(assert (=> b!397338 (=> (not res!228126) (not e!240311))))

(declare-fun arrayContainsKey!0 (array!23719 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397338 (= res!228126 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397345 () Bool)

(declare-fun res!228124 () Bool)

(assert (=> b!397345 (=> (not res!228124) (not e!240311))))

(assert (=> b!397345 (= res!228124 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11661 _keys!709))))))

(declare-fun b!397346 () Bool)

(assert (=> b!397346 (= e!240309 tp_is_empty!9903)))

(assert (= (and start!38484 res!228122) b!397336))

(assert (= (and b!397336 res!228129) b!397337))

(assert (= (and b!397337 res!228125) b!397344))

(assert (= (and b!397344 res!228121) b!397340))

(assert (= (and b!397340 res!228128) b!397345))

(assert (= (and b!397345 res!228124) b!397335))

(assert (= (and b!397335 res!228123) b!397334))

(assert (= (and b!397334 res!228120) b!397338))

(assert (= (and b!397338 res!228126) b!397339))

(assert (= (and b!397339 res!228127) b!397342))

(assert (= (and b!397341 condMapEmpty!16476) mapIsEmpty!16476))

(assert (= (and b!397341 (not condMapEmpty!16476)) mapNonEmpty!16476))

(get-info :version)

(assert (= (and mapNonEmpty!16476 ((_ is ValueCellFull!4608) mapValue!16476)) b!397346))

(assert (= (and b!397341 ((_ is ValueCellFull!4608) mapDefault!16476)) b!397343))

(assert (= start!38484 b!397341))

(declare-fun m!392623 () Bool)

(assert (=> b!397340 m!392623))

(declare-fun m!392625 () Bool)

(assert (=> b!397342 m!392625))

(declare-fun m!392627 () Bool)

(assert (=> b!397334 m!392627))

(declare-fun m!392629 () Bool)

(assert (=> b!397344 m!392629))

(declare-fun m!392631 () Bool)

(assert (=> b!397336 m!392631))

(declare-fun m!392633 () Bool)

(assert (=> b!397339 m!392633))

(declare-fun m!392635 () Bool)

(assert (=> b!397339 m!392635))

(declare-fun m!392637 () Bool)

(assert (=> b!397338 m!392637))

(declare-fun m!392639 () Bool)

(assert (=> start!38484 m!392639))

(declare-fun m!392641 () Bool)

(assert (=> start!38484 m!392641))

(declare-fun m!392643 () Bool)

(assert (=> b!397335 m!392643))

(declare-fun m!392645 () Bool)

(assert (=> mapNonEmpty!16476 m!392645))

(check-sat (not b!397340) (not b!397339) (not b!397336) (not mapNonEmpty!16476) (not start!38484) tp_is_empty!9903 (not b!397344) (not b!397335) (not b!397342) (not b!397338))
(check-sat)
