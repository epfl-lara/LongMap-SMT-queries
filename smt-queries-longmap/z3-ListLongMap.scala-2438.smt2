; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38448 () Bool)

(assert start!38448)

(declare-fun b!396632 () Bool)

(declare-fun e!239988 () Bool)

(assert (=> b!396632 (= e!239988 false)))

(declare-fun lt!187181 () Bool)

(declare-datatypes ((array!23647 0))(
  ( (array!23648 (arr!11273 (Array (_ BitVec 32) (_ BitVec 64))) (size!11625 (_ BitVec 32))) )
))
(declare-fun lt!187180 () array!23647)

(declare-datatypes ((List!6531 0))(
  ( (Nil!6528) (Cons!6527 (h!7383 (_ BitVec 64)) (t!11705 List!6531)) )
))
(declare-fun arrayNoDuplicates!0 (array!23647 (_ BitVec 32) List!6531) Bool)

(assert (=> b!396632 (= lt!187181 (arrayNoDuplicates!0 lt!187180 #b00000000000000000000000000000000 Nil!6528))))

(declare-fun b!396633 () Bool)

(declare-fun res!227580 () Bool)

(declare-fun e!239987 () Bool)

(assert (=> b!396633 (=> (not res!227580) (not e!239987))))

(declare-fun _keys!709 () array!23647)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23647 (_ BitVec 32)) Bool)

(assert (=> b!396633 (= res!227580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396634 () Bool)

(declare-fun res!227588 () Bool)

(assert (=> b!396634 (=> (not res!227588) (not e!239987))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396634 (= res!227588 (or (= (select (arr!11273 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11273 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396635 () Bool)

(declare-fun res!227586 () Bool)

(assert (=> b!396635 (=> (not res!227586) (not e!239987))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23647 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396635 (= res!227586 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16422 () Bool)

(declare-fun mapRes!16422 () Bool)

(declare-fun tp!32217 () Bool)

(declare-fun e!239983 () Bool)

(assert (=> mapNonEmpty!16422 (= mapRes!16422 (and tp!32217 e!239983))))

(declare-datatypes ((V!14261 0))(
  ( (V!14262 (val!4978 Int)) )
))
(declare-datatypes ((ValueCell!4590 0))(
  ( (ValueCellFull!4590 (v!7225 V!14261)) (EmptyCell!4590) )
))
(declare-datatypes ((array!23649 0))(
  ( (array!23650 (arr!11274 (Array (_ BitVec 32) ValueCell!4590)) (size!11626 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23649)

(declare-fun mapRest!16422 () (Array (_ BitVec 32) ValueCell!4590))

(declare-fun mapValue!16422 () ValueCell!4590)

(declare-fun mapKey!16422 () (_ BitVec 32))

(assert (=> mapNonEmpty!16422 (= (arr!11274 _values!549) (store mapRest!16422 mapKey!16422 mapValue!16422))))

(declare-fun b!396636 () Bool)

(declare-fun res!227582 () Bool)

(assert (=> b!396636 (=> (not res!227582) (not e!239987))))

(assert (=> b!396636 (= res!227582 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11625 _keys!709))))))

(declare-fun b!396637 () Bool)

(declare-fun e!239986 () Bool)

(declare-fun e!239985 () Bool)

(assert (=> b!396637 (= e!239986 (and e!239985 mapRes!16422))))

(declare-fun condMapEmpty!16422 () Bool)

(declare-fun mapDefault!16422 () ValueCell!4590)

(assert (=> b!396637 (= condMapEmpty!16422 (= (arr!11274 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4590)) mapDefault!16422)))))

(declare-fun b!396638 () Bool)

(declare-fun res!227583 () Bool)

(assert (=> b!396638 (=> (not res!227583) (not e!239987))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396638 (= res!227583 (validMask!0 mask!1025))))

(declare-fun res!227584 () Bool)

(assert (=> start!38448 (=> (not res!227584) (not e!239987))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38448 (= res!227584 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11625 _keys!709))))))

(assert (=> start!38448 e!239987))

(assert (=> start!38448 true))

(declare-fun array_inv!8268 (array!23649) Bool)

(assert (=> start!38448 (and (array_inv!8268 _values!549) e!239986)))

(declare-fun array_inv!8269 (array!23647) Bool)

(assert (=> start!38448 (array_inv!8269 _keys!709)))

(declare-fun b!396639 () Bool)

(declare-fun res!227589 () Bool)

(assert (=> b!396639 (=> (not res!227589) (not e!239987))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396639 (= res!227589 (and (= (size!11626 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11625 _keys!709) (size!11626 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396640 () Bool)

(declare-fun res!227585 () Bool)

(assert (=> b!396640 (=> (not res!227585) (not e!239987))))

(assert (=> b!396640 (= res!227585 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6528))))

(declare-fun b!396641 () Bool)

(declare-fun res!227587 () Bool)

(assert (=> b!396641 (=> (not res!227587) (not e!239987))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396641 (= res!227587 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!16422 () Bool)

(assert (=> mapIsEmpty!16422 mapRes!16422))

(declare-fun b!396642 () Bool)

(declare-fun tp_is_empty!9867 () Bool)

(assert (=> b!396642 (= e!239985 tp_is_empty!9867)))

(declare-fun b!396643 () Bool)

(assert (=> b!396643 (= e!239983 tp_is_empty!9867)))

(declare-fun b!396644 () Bool)

(assert (=> b!396644 (= e!239987 e!239988)))

(declare-fun res!227581 () Bool)

(assert (=> b!396644 (=> (not res!227581) (not e!239988))))

(assert (=> b!396644 (= res!227581 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187180 mask!1025))))

(assert (=> b!396644 (= lt!187180 (array!23648 (store (arr!11273 _keys!709) i!563 k0!794) (size!11625 _keys!709)))))

(assert (= (and start!38448 res!227584) b!396638))

(assert (= (and b!396638 res!227583) b!396639))

(assert (= (and b!396639 res!227589) b!396633))

(assert (= (and b!396633 res!227580) b!396640))

(assert (= (and b!396640 res!227585) b!396636))

(assert (= (and b!396636 res!227582) b!396641))

(assert (= (and b!396641 res!227587) b!396634))

(assert (= (and b!396634 res!227588) b!396635))

(assert (= (and b!396635 res!227586) b!396644))

(assert (= (and b!396644 res!227581) b!396632))

(assert (= (and b!396637 condMapEmpty!16422) mapIsEmpty!16422))

(assert (= (and b!396637 (not condMapEmpty!16422)) mapNonEmpty!16422))

(get-info :version)

(assert (= (and mapNonEmpty!16422 ((_ is ValueCellFull!4590) mapValue!16422)) b!396643))

(assert (= (and b!396637 ((_ is ValueCellFull!4590) mapDefault!16422)) b!396642))

(assert (= start!38448 b!396637))

(declare-fun m!392191 () Bool)

(assert (=> b!396634 m!392191))

(declare-fun m!392193 () Bool)

(assert (=> b!396644 m!392193))

(declare-fun m!392195 () Bool)

(assert (=> b!396644 m!392195))

(declare-fun m!392197 () Bool)

(assert (=> b!396638 m!392197))

(declare-fun m!392199 () Bool)

(assert (=> b!396640 m!392199))

(declare-fun m!392201 () Bool)

(assert (=> b!396633 m!392201))

(declare-fun m!392203 () Bool)

(assert (=> mapNonEmpty!16422 m!392203))

(declare-fun m!392205 () Bool)

(assert (=> b!396641 m!392205))

(declare-fun m!392207 () Bool)

(assert (=> b!396632 m!392207))

(declare-fun m!392209 () Bool)

(assert (=> b!396635 m!392209))

(declare-fun m!392211 () Bool)

(assert (=> start!38448 m!392211))

(declare-fun m!392213 () Bool)

(assert (=> start!38448 m!392213))

(check-sat (not b!396632) (not start!38448) (not b!396640) (not b!396633) (not b!396644) (not b!396638) (not mapNonEmpty!16422) (not b!396641) tp_is_empty!9867 (not b!396635))
(check-sat)
