; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38478 () Bool)

(assert start!38478)

(declare-fun b!397217 () Bool)

(declare-fun e!240258 () Bool)

(declare-fun e!240253 () Bool)

(assert (=> b!397217 (= e!240258 e!240253)))

(declare-fun res!228036 () Bool)

(assert (=> b!397217 (=> (not res!228036) (not e!240253))))

(declare-datatypes ((array!23707 0))(
  ( (array!23708 (arr!11303 (Array (_ BitVec 32) (_ BitVec 64))) (size!11655 (_ BitVec 32))) )
))
(declare-fun lt!187271 () array!23707)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23707 (_ BitVec 32)) Bool)

(assert (=> b!397217 (= res!228036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187271 mask!1025))))

(declare-fun _keys!709 () array!23707)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397217 (= lt!187271 (array!23708 (store (arr!11303 _keys!709) i!563 k0!794) (size!11655 _keys!709)))))

(declare-fun b!397218 () Bool)

(declare-fun res!228034 () Bool)

(assert (=> b!397218 (=> (not res!228034) (not e!240258))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397218 (= res!228034 (validMask!0 mask!1025))))

(declare-fun b!397219 () Bool)

(declare-fun res!228035 () Bool)

(assert (=> b!397219 (=> (not res!228035) (not e!240258))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14301 0))(
  ( (V!14302 (val!4993 Int)) )
))
(declare-datatypes ((ValueCell!4605 0))(
  ( (ValueCellFull!4605 (v!7240 V!14301)) (EmptyCell!4605) )
))
(declare-datatypes ((array!23709 0))(
  ( (array!23710 (arr!11304 (Array (_ BitVec 32) ValueCell!4605)) (size!11656 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23709)

(assert (=> b!397219 (= res!228035 (and (= (size!11656 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11655 _keys!709) (size!11656 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397220 () Bool)

(declare-fun res!228030 () Bool)

(assert (=> b!397220 (=> (not res!228030) (not e!240258))))

(assert (=> b!397220 (= res!228030 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!228039 () Bool)

(assert (=> start!38478 (=> (not res!228039) (not e!240258))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38478 (= res!228039 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11655 _keys!709))))))

(assert (=> start!38478 e!240258))

(assert (=> start!38478 true))

(declare-fun e!240254 () Bool)

(declare-fun array_inv!8284 (array!23709) Bool)

(assert (=> start!38478 (and (array_inv!8284 _values!549) e!240254)))

(declare-fun array_inv!8285 (array!23707) Bool)

(assert (=> start!38478 (array_inv!8285 _keys!709)))

(declare-fun b!397221 () Bool)

(assert (=> b!397221 (= e!240253 false)))

(declare-fun lt!187270 () Bool)

(declare-datatypes ((List!6543 0))(
  ( (Nil!6540) (Cons!6539 (h!7395 (_ BitVec 64)) (t!11717 List!6543)) )
))
(declare-fun arrayNoDuplicates!0 (array!23707 (_ BitVec 32) List!6543) Bool)

(assert (=> b!397221 (= lt!187270 (arrayNoDuplicates!0 lt!187271 #b00000000000000000000000000000000 Nil!6540))))

(declare-fun b!397222 () Bool)

(declare-fun res!228031 () Bool)

(assert (=> b!397222 (=> (not res!228031) (not e!240258))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397222 (= res!228031 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!16467 () Bool)

(declare-fun mapRes!16467 () Bool)

(declare-fun tp!32262 () Bool)

(declare-fun e!240257 () Bool)

(assert (=> mapNonEmpty!16467 (= mapRes!16467 (and tp!32262 e!240257))))

(declare-fun mapRest!16467 () (Array (_ BitVec 32) ValueCell!4605))

(declare-fun mapKey!16467 () (_ BitVec 32))

(declare-fun mapValue!16467 () ValueCell!4605)

(assert (=> mapNonEmpty!16467 (= (arr!11304 _values!549) (store mapRest!16467 mapKey!16467 mapValue!16467))))

(declare-fun b!397223 () Bool)

(declare-fun res!228037 () Bool)

(assert (=> b!397223 (=> (not res!228037) (not e!240258))))

(assert (=> b!397223 (= res!228037 (or (= (select (arr!11303 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11303 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397224 () Bool)

(declare-fun tp_is_empty!9897 () Bool)

(assert (=> b!397224 (= e!240257 tp_is_empty!9897)))

(declare-fun b!397225 () Bool)

(declare-fun res!228032 () Bool)

(assert (=> b!397225 (=> (not res!228032) (not e!240258))))

(assert (=> b!397225 (= res!228032 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6540))))

(declare-fun b!397226 () Bool)

(declare-fun e!240256 () Bool)

(assert (=> b!397226 (= e!240254 (and e!240256 mapRes!16467))))

(declare-fun condMapEmpty!16467 () Bool)

(declare-fun mapDefault!16467 () ValueCell!4605)

(assert (=> b!397226 (= condMapEmpty!16467 (= (arr!11304 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4605)) mapDefault!16467)))))

(declare-fun mapIsEmpty!16467 () Bool)

(assert (=> mapIsEmpty!16467 mapRes!16467))

(declare-fun b!397227 () Bool)

(declare-fun res!228033 () Bool)

(assert (=> b!397227 (=> (not res!228033) (not e!240258))))

(declare-fun arrayContainsKey!0 (array!23707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397227 (= res!228033 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397228 () Bool)

(declare-fun res!228038 () Bool)

(assert (=> b!397228 (=> (not res!228038) (not e!240258))))

(assert (=> b!397228 (= res!228038 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11655 _keys!709))))))

(declare-fun b!397229 () Bool)

(assert (=> b!397229 (= e!240256 tp_is_empty!9897)))

(assert (= (and start!38478 res!228039) b!397218))

(assert (= (and b!397218 res!228034) b!397219))

(assert (= (and b!397219 res!228035) b!397220))

(assert (= (and b!397220 res!228030) b!397225))

(assert (= (and b!397225 res!228032) b!397228))

(assert (= (and b!397228 res!228038) b!397222))

(assert (= (and b!397222 res!228031) b!397223))

(assert (= (and b!397223 res!228037) b!397227))

(assert (= (and b!397227 res!228033) b!397217))

(assert (= (and b!397217 res!228036) b!397221))

(assert (= (and b!397226 condMapEmpty!16467) mapIsEmpty!16467))

(assert (= (and b!397226 (not condMapEmpty!16467)) mapNonEmpty!16467))

(get-info :version)

(assert (= (and mapNonEmpty!16467 ((_ is ValueCellFull!4605) mapValue!16467)) b!397224))

(assert (= (and b!397226 ((_ is ValueCellFull!4605) mapDefault!16467)) b!397229))

(assert (= start!38478 b!397226))

(declare-fun m!392551 () Bool)

(assert (=> b!397225 m!392551))

(declare-fun m!392553 () Bool)

(assert (=> b!397218 m!392553))

(declare-fun m!392555 () Bool)

(assert (=> b!397221 m!392555))

(declare-fun m!392557 () Bool)

(assert (=> b!397217 m!392557))

(declare-fun m!392559 () Bool)

(assert (=> b!397217 m!392559))

(declare-fun m!392561 () Bool)

(assert (=> b!397223 m!392561))

(declare-fun m!392563 () Bool)

(assert (=> start!38478 m!392563))

(declare-fun m!392565 () Bool)

(assert (=> start!38478 m!392565))

(declare-fun m!392567 () Bool)

(assert (=> b!397220 m!392567))

(declare-fun m!392569 () Bool)

(assert (=> b!397222 m!392569))

(declare-fun m!392571 () Bool)

(assert (=> mapNonEmpty!16467 m!392571))

(declare-fun m!392573 () Bool)

(assert (=> b!397227 m!392573))

(check-sat (not start!38478) (not b!397222) (not b!397227) (not b!397221) (not mapNonEmpty!16467) (not b!397220) (not b!397217) (not b!397225) (not b!397218) tp_is_empty!9897)
(check-sat)
