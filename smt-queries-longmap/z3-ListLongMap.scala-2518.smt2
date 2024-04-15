; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38912 () Bool)

(assert start!38912)

(declare-fun mapNonEmpty!17139 () Bool)

(declare-fun mapRes!17139 () Bool)

(declare-fun tp!33258 () Bool)

(declare-fun e!244439 () Bool)

(assert (=> mapNonEmpty!17139 (= mapRes!17139 (and tp!33258 e!244439))))

(declare-datatypes ((V!14899 0))(
  ( (V!14900 (val!5217 Int)) )
))
(declare-datatypes ((ValueCell!4829 0))(
  ( (ValueCellFull!4829 (v!7458 V!14899)) (EmptyCell!4829) )
))
(declare-fun mapValue!17139 () ValueCell!4829)

(declare-datatypes ((array!24561 0))(
  ( (array!24562 (arr!11730 (Array (_ BitVec 32) ValueCell!4829)) (size!12083 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24561)

(declare-fun mapKey!17139 () (_ BitVec 32))

(declare-fun mapRest!17139 () (Array (_ BitVec 32) ValueCell!4829))

(assert (=> mapNonEmpty!17139 (= (arr!11730 _values!549) (store mapRest!17139 mapKey!17139 mapValue!17139))))

(declare-fun b!406978 () Bool)

(declare-fun tp_is_empty!10345 () Bool)

(assert (=> b!406978 (= e!244439 tp_is_empty!10345)))

(declare-fun b!406979 () Bool)

(declare-fun res!235270 () Bool)

(declare-fun e!244437 () Bool)

(assert (=> b!406979 (=> (not res!235270) (not e!244437))))

(declare-datatypes ((array!24563 0))(
  ( (array!24564 (arr!11731 (Array (_ BitVec 32) (_ BitVec 64))) (size!12084 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24563)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24563 (_ BitVec 32)) Bool)

(assert (=> b!406979 (= res!235270 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406980 () Bool)

(declare-fun e!244440 () Bool)

(assert (=> b!406980 (= e!244437 e!244440)))

(declare-fun res!235278 () Bool)

(assert (=> b!406980 (=> (not res!235278) (not e!244440))))

(declare-fun lt!188381 () array!24563)

(assert (=> b!406980 (= res!235278 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188381 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406980 (= lt!188381 (array!24564 (store (arr!11731 _keys!709) i!563 k0!794) (size!12084 _keys!709)))))

(declare-fun b!406981 () Bool)

(declare-fun res!235275 () Bool)

(assert (=> b!406981 (=> (not res!235275) (not e!244437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406981 (= res!235275 (validMask!0 mask!1025))))

(declare-fun b!406982 () Bool)

(declare-fun e!244436 () Bool)

(assert (=> b!406982 (= e!244436 tp_is_empty!10345)))

(declare-fun res!235273 () Bool)

(assert (=> start!38912 (=> (not res!235273) (not e!244437))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38912 (= res!235273 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12084 _keys!709))))))

(assert (=> start!38912 e!244437))

(assert (=> start!38912 true))

(declare-fun e!244435 () Bool)

(declare-fun array_inv!8602 (array!24561) Bool)

(assert (=> start!38912 (and (array_inv!8602 _values!549) e!244435)))

(declare-fun array_inv!8603 (array!24563) Bool)

(assert (=> start!38912 (array_inv!8603 _keys!709)))

(declare-fun b!406983 () Bool)

(declare-fun res!235272 () Bool)

(assert (=> b!406983 (=> (not res!235272) (not e!244437))))

(declare-fun arrayContainsKey!0 (array!24563 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406983 (= res!235272 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406984 () Bool)

(declare-fun res!235274 () Bool)

(assert (=> b!406984 (=> (not res!235274) (not e!244437))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406984 (= res!235274 (and (= (size!12083 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12084 _keys!709) (size!12083 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!17139 () Bool)

(assert (=> mapIsEmpty!17139 mapRes!17139))

(declare-fun b!406985 () Bool)

(declare-fun res!235276 () Bool)

(assert (=> b!406985 (=> (not res!235276) (not e!244437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406985 (= res!235276 (validKeyInArray!0 k0!794))))

(declare-fun b!406986 () Bool)

(declare-fun res!235271 () Bool)

(assert (=> b!406986 (=> (not res!235271) (not e!244437))))

(declare-datatypes ((List!6784 0))(
  ( (Nil!6781) (Cons!6780 (h!7636 (_ BitVec 64)) (t!11949 List!6784)) )
))
(declare-fun arrayNoDuplicates!0 (array!24563 (_ BitVec 32) List!6784) Bool)

(assert (=> b!406986 (= res!235271 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6781))))

(declare-fun b!406987 () Bool)

(declare-fun res!235269 () Bool)

(assert (=> b!406987 (=> (not res!235269) (not e!244437))))

(assert (=> b!406987 (= res!235269 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12084 _keys!709))))))

(declare-fun b!406988 () Bool)

(assert (=> b!406988 (= e!244435 (and e!244436 mapRes!17139))))

(declare-fun condMapEmpty!17139 () Bool)

(declare-fun mapDefault!17139 () ValueCell!4829)

(assert (=> b!406988 (= condMapEmpty!17139 (= (arr!11730 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4829)) mapDefault!17139)))))

(declare-fun b!406989 () Bool)

(assert (=> b!406989 (= e!244440 false)))

(declare-fun lt!188380 () Bool)

(assert (=> b!406989 (= lt!188380 (arrayNoDuplicates!0 lt!188381 #b00000000000000000000000000000000 Nil!6781))))

(declare-fun b!406990 () Bool)

(declare-fun res!235277 () Bool)

(assert (=> b!406990 (=> (not res!235277) (not e!244437))))

(assert (=> b!406990 (= res!235277 (or (= (select (arr!11731 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11731 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38912 res!235273) b!406981))

(assert (= (and b!406981 res!235275) b!406984))

(assert (= (and b!406984 res!235274) b!406979))

(assert (= (and b!406979 res!235270) b!406986))

(assert (= (and b!406986 res!235271) b!406987))

(assert (= (and b!406987 res!235269) b!406985))

(assert (= (and b!406985 res!235276) b!406990))

(assert (= (and b!406990 res!235277) b!406983))

(assert (= (and b!406983 res!235272) b!406980))

(assert (= (and b!406980 res!235278) b!406989))

(assert (= (and b!406988 condMapEmpty!17139) mapIsEmpty!17139))

(assert (= (and b!406988 (not condMapEmpty!17139)) mapNonEmpty!17139))

(get-info :version)

(assert (= (and mapNonEmpty!17139 ((_ is ValueCellFull!4829) mapValue!17139)) b!406978))

(assert (= (and b!406988 ((_ is ValueCellFull!4829) mapDefault!17139)) b!406982))

(assert (= start!38912 b!406988))

(declare-fun m!398283 () Bool)

(assert (=> b!406981 m!398283))

(declare-fun m!398285 () Bool)

(assert (=> start!38912 m!398285))

(declare-fun m!398287 () Bool)

(assert (=> start!38912 m!398287))

(declare-fun m!398289 () Bool)

(assert (=> b!406989 m!398289))

(declare-fun m!398291 () Bool)

(assert (=> b!406979 m!398291))

(declare-fun m!398293 () Bool)

(assert (=> b!406983 m!398293))

(declare-fun m!398295 () Bool)

(assert (=> b!406980 m!398295))

(declare-fun m!398297 () Bool)

(assert (=> b!406980 m!398297))

(declare-fun m!398299 () Bool)

(assert (=> b!406990 m!398299))

(declare-fun m!398301 () Bool)

(assert (=> b!406985 m!398301))

(declare-fun m!398303 () Bool)

(assert (=> b!406986 m!398303))

(declare-fun m!398305 () Bool)

(assert (=> mapNonEmpty!17139 m!398305))

(check-sat (not b!406979) tp_is_empty!10345 (not b!406989) (not b!406983) (not b!406986) (not mapNonEmpty!17139) (not start!38912) (not b!406985) (not b!406981) (not b!406980))
(check-sat)
