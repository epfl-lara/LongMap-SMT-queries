; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38426 () Bool)

(assert start!38426)

(declare-fun b!396427 () Bool)

(declare-fun res!227464 () Bool)

(declare-fun e!239883 () Bool)

(assert (=> b!396427 (=> (not res!227464) (not e!239883))))

(declare-datatypes ((array!23622 0))(
  ( (array!23623 (arr!11260 (Array (_ BitVec 32) (_ BitVec 64))) (size!11612 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23622)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396427 (= res!227464 (or (= (select (arr!11260 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11260 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396428 () Bool)

(declare-fun e!239884 () Bool)

(declare-fun tp_is_empty!9859 () Bool)

(assert (=> b!396428 (= e!239884 tp_is_empty!9859)))

(declare-fun b!396429 () Bool)

(declare-fun e!239879 () Bool)

(assert (=> b!396429 (= e!239883 e!239879)))

(declare-fun res!227459 () Bool)

(assert (=> b!396429 (=> (not res!227459) (not e!239879))))

(declare-fun lt!187176 () array!23622)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23622 (_ BitVec 32)) Bool)

(assert (=> b!396429 (= res!227459 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187176 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!396429 (= lt!187176 (array!23623 (store (arr!11260 _keys!709) i!563 k0!794) (size!11612 _keys!709)))))

(declare-fun b!396430 () Bool)

(declare-fun res!227463 () Bool)

(assert (=> b!396430 (=> (not res!227463) (not e!239883))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14251 0))(
  ( (V!14252 (val!4974 Int)) )
))
(declare-datatypes ((ValueCell!4586 0))(
  ( (ValueCellFull!4586 (v!7222 V!14251)) (EmptyCell!4586) )
))
(declare-datatypes ((array!23624 0))(
  ( (array!23625 (arr!11261 (Array (_ BitVec 32) ValueCell!4586)) (size!11613 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23624)

(assert (=> b!396430 (= res!227463 (and (= (size!11613 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11612 _keys!709) (size!11613 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!227465 () Bool)

(assert (=> start!38426 (=> (not res!227465) (not e!239883))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38426 (= res!227465 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11612 _keys!709))))))

(assert (=> start!38426 e!239883))

(assert (=> start!38426 true))

(declare-fun e!239880 () Bool)

(declare-fun array_inv!8320 (array!23624) Bool)

(assert (=> start!38426 (and (array_inv!8320 _values!549) e!239880)))

(declare-fun array_inv!8321 (array!23622) Bool)

(assert (=> start!38426 (array_inv!8321 _keys!709)))

(declare-fun b!396431 () Bool)

(declare-fun res!227460 () Bool)

(assert (=> b!396431 (=> (not res!227460) (not e!239883))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396431 (= res!227460 (validMask!0 mask!1025))))

(declare-fun b!396432 () Bool)

(declare-fun res!227458 () Bool)

(assert (=> b!396432 (=> (not res!227458) (not e!239883))))

(assert (=> b!396432 (= res!227458 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11612 _keys!709))))))

(declare-fun b!396433 () Bool)

(assert (=> b!396433 (= e!239879 false)))

(declare-fun lt!187175 () Bool)

(declare-datatypes ((List!6395 0))(
  ( (Nil!6392) (Cons!6391 (h!7247 (_ BitVec 64)) (t!11561 List!6395)) )
))
(declare-fun arrayNoDuplicates!0 (array!23622 (_ BitVec 32) List!6395) Bool)

(assert (=> b!396433 (= lt!187175 (arrayNoDuplicates!0 lt!187176 #b00000000000000000000000000000000 Nil!6392))))

(declare-fun b!396434 () Bool)

(declare-fun res!227462 () Bool)

(assert (=> b!396434 (=> (not res!227462) (not e!239883))))

(assert (=> b!396434 (= res!227462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396435 () Bool)

(declare-fun e!239882 () Bool)

(declare-fun mapRes!16410 () Bool)

(assert (=> b!396435 (= e!239880 (and e!239882 mapRes!16410))))

(declare-fun condMapEmpty!16410 () Bool)

(declare-fun mapDefault!16410 () ValueCell!4586)

(assert (=> b!396435 (= condMapEmpty!16410 (= (arr!11261 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4586)) mapDefault!16410)))))

(declare-fun b!396436 () Bool)

(declare-fun res!227461 () Bool)

(assert (=> b!396436 (=> (not res!227461) (not e!239883))))

(declare-fun arrayContainsKey!0 (array!23622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396436 (= res!227461 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16410 () Bool)

(declare-fun tp!32205 () Bool)

(assert (=> mapNonEmpty!16410 (= mapRes!16410 (and tp!32205 e!239884))))

(declare-fun mapRest!16410 () (Array (_ BitVec 32) ValueCell!4586))

(declare-fun mapValue!16410 () ValueCell!4586)

(declare-fun mapKey!16410 () (_ BitVec 32))

(assert (=> mapNonEmpty!16410 (= (arr!11261 _values!549) (store mapRest!16410 mapKey!16410 mapValue!16410))))

(declare-fun b!396437 () Bool)

(declare-fun res!227457 () Bool)

(assert (=> b!396437 (=> (not res!227457) (not e!239883))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396437 (= res!227457 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!16410 () Bool)

(assert (=> mapIsEmpty!16410 mapRes!16410))

(declare-fun b!396438 () Bool)

(assert (=> b!396438 (= e!239882 tp_is_empty!9859)))

(declare-fun b!396439 () Bool)

(declare-fun res!227466 () Bool)

(assert (=> b!396439 (=> (not res!227466) (not e!239883))))

(assert (=> b!396439 (= res!227466 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6392))))

(assert (= (and start!38426 res!227465) b!396431))

(assert (= (and b!396431 res!227460) b!396430))

(assert (= (and b!396430 res!227463) b!396434))

(assert (= (and b!396434 res!227462) b!396439))

(assert (= (and b!396439 res!227466) b!396432))

(assert (= (and b!396432 res!227458) b!396437))

(assert (= (and b!396437 res!227457) b!396427))

(assert (= (and b!396427 res!227464) b!396436))

(assert (= (and b!396436 res!227461) b!396429))

(assert (= (and b!396429 res!227459) b!396433))

(assert (= (and b!396435 condMapEmpty!16410) mapIsEmpty!16410))

(assert (= (and b!396435 (not condMapEmpty!16410)) mapNonEmpty!16410))

(get-info :version)

(assert (= (and mapNonEmpty!16410 ((_ is ValueCellFull!4586) mapValue!16410)) b!396428))

(assert (= (and b!396435 ((_ is ValueCellFull!4586) mapDefault!16410)) b!396438))

(assert (= start!38426 b!396435))

(declare-fun m!392325 () Bool)

(assert (=> b!396437 m!392325))

(declare-fun m!392327 () Bool)

(assert (=> b!396439 m!392327))

(declare-fun m!392329 () Bool)

(assert (=> mapNonEmpty!16410 m!392329))

(declare-fun m!392331 () Bool)

(assert (=> b!396436 m!392331))

(declare-fun m!392333 () Bool)

(assert (=> b!396434 m!392333))

(declare-fun m!392335 () Bool)

(assert (=> b!396433 m!392335))

(declare-fun m!392337 () Bool)

(assert (=> b!396427 m!392337))

(declare-fun m!392339 () Bool)

(assert (=> b!396431 m!392339))

(declare-fun m!392341 () Bool)

(assert (=> start!38426 m!392341))

(declare-fun m!392343 () Bool)

(assert (=> start!38426 m!392343))

(declare-fun m!392345 () Bool)

(assert (=> b!396429 m!392345))

(declare-fun m!392347 () Bool)

(assert (=> b!396429 m!392347))

(check-sat (not b!396429) (not b!396433) (not b!396434) (not b!396431) tp_is_empty!9859 (not mapNonEmpty!16410) (not start!38426) (not b!396439) (not b!396437) (not b!396436))
(check-sat)
