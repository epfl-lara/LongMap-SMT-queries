; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38480 () Bool)

(assert start!38480)

(declare-fun mapIsEmpty!16491 () Bool)

(declare-fun mapRes!16491 () Bool)

(assert (=> mapIsEmpty!16491 mapRes!16491))

(declare-fun b!397480 () Bool)

(declare-fun res!228268 () Bool)

(declare-fun e!240368 () Bool)

(assert (=> b!397480 (=> (not res!228268) (not e!240368))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23724 0))(
  ( (array!23725 (arr!11311 (Array (_ BitVec 32) (_ BitVec 64))) (size!11663 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23724)

(assert (=> b!397480 (= res!228268 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11663 _keys!709))))))

(declare-fun mapNonEmpty!16491 () Bool)

(declare-fun tp!32286 () Bool)

(declare-fun e!240369 () Bool)

(assert (=> mapNonEmpty!16491 (= mapRes!16491 (and tp!32286 e!240369))))

(declare-datatypes ((V!14323 0))(
  ( (V!14324 (val!5001 Int)) )
))
(declare-datatypes ((ValueCell!4613 0))(
  ( (ValueCellFull!4613 (v!7249 V!14323)) (EmptyCell!4613) )
))
(declare-fun mapValue!16491 () ValueCell!4613)

(declare-datatypes ((array!23726 0))(
  ( (array!23727 (arr!11312 (Array (_ BitVec 32) ValueCell!4613)) (size!11664 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23726)

(declare-fun mapKey!16491 () (_ BitVec 32))

(declare-fun mapRest!16491 () (Array (_ BitVec 32) ValueCell!4613))

(assert (=> mapNonEmpty!16491 (= (arr!11312 _values!549) (store mapRest!16491 mapKey!16491 mapValue!16491))))

(declare-fun res!228276 () Bool)

(assert (=> start!38480 (=> (not res!228276) (not e!240368))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38480 (= res!228276 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11663 _keys!709))))))

(assert (=> start!38480 e!240368))

(assert (=> start!38480 true))

(declare-fun e!240367 () Bool)

(declare-fun array_inv!8358 (array!23726) Bool)

(assert (=> start!38480 (and (array_inv!8358 _values!549) e!240367)))

(declare-fun array_inv!8359 (array!23724) Bool)

(assert (=> start!38480 (array_inv!8359 _keys!709)))

(declare-fun b!397481 () Bool)

(declare-fun e!240366 () Bool)

(assert (=> b!397481 (= e!240366 false)))

(declare-fun lt!187338 () Bool)

(declare-fun lt!187337 () array!23724)

(declare-datatypes ((List!6415 0))(
  ( (Nil!6412) (Cons!6411 (h!7267 (_ BitVec 64)) (t!11581 List!6415)) )
))
(declare-fun arrayNoDuplicates!0 (array!23724 (_ BitVec 32) List!6415) Bool)

(assert (=> b!397481 (= lt!187338 (arrayNoDuplicates!0 lt!187337 #b00000000000000000000000000000000 Nil!6412))))

(declare-fun b!397482 () Bool)

(declare-fun res!228273 () Bool)

(assert (=> b!397482 (=> (not res!228273) (not e!240368))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23724 (_ BitVec 32)) Bool)

(assert (=> b!397482 (= res!228273 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!397483 () Bool)

(assert (=> b!397483 (= e!240368 e!240366)))

(declare-fun res!228274 () Bool)

(assert (=> b!397483 (=> (not res!228274) (not e!240366))))

(assert (=> b!397483 (= res!228274 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187337 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!397483 (= lt!187337 (array!23725 (store (arr!11311 _keys!709) i!563 k0!794) (size!11663 _keys!709)))))

(declare-fun b!397484 () Bool)

(declare-fun tp_is_empty!9913 () Bool)

(assert (=> b!397484 (= e!240369 tp_is_empty!9913)))

(declare-fun b!397485 () Bool)

(declare-fun res!228271 () Bool)

(assert (=> b!397485 (=> (not res!228271) (not e!240368))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!397485 (= res!228271 (validMask!0 mask!1025))))

(declare-fun b!397486 () Bool)

(declare-fun res!228275 () Bool)

(assert (=> b!397486 (=> (not res!228275) (not e!240368))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397486 (= res!228275 (and (= (size!11664 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11663 _keys!709) (size!11664 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397487 () Bool)

(declare-fun e!240365 () Bool)

(assert (=> b!397487 (= e!240365 tp_is_empty!9913)))

(declare-fun b!397488 () Bool)

(declare-fun res!228270 () Bool)

(assert (=> b!397488 (=> (not res!228270) (not e!240368))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397488 (= res!228270 (validKeyInArray!0 k0!794))))

(declare-fun b!397489 () Bool)

(assert (=> b!397489 (= e!240367 (and e!240365 mapRes!16491))))

(declare-fun condMapEmpty!16491 () Bool)

(declare-fun mapDefault!16491 () ValueCell!4613)

(assert (=> b!397489 (= condMapEmpty!16491 (= (arr!11312 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4613)) mapDefault!16491)))))

(declare-fun b!397490 () Bool)

(declare-fun res!228267 () Bool)

(assert (=> b!397490 (=> (not res!228267) (not e!240368))))

(assert (=> b!397490 (= res!228267 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6412))))

(declare-fun b!397491 () Bool)

(declare-fun res!228272 () Bool)

(assert (=> b!397491 (=> (not res!228272) (not e!240368))))

(declare-fun arrayContainsKey!0 (array!23724 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!397491 (= res!228272 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!397492 () Bool)

(declare-fun res!228269 () Bool)

(assert (=> b!397492 (=> (not res!228269) (not e!240368))))

(assert (=> b!397492 (= res!228269 (or (= (select (arr!11311 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11311 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38480 res!228276) b!397485))

(assert (= (and b!397485 res!228271) b!397486))

(assert (= (and b!397486 res!228275) b!397482))

(assert (= (and b!397482 res!228273) b!397490))

(assert (= (and b!397490 res!228267) b!397480))

(assert (= (and b!397480 res!228268) b!397488))

(assert (= (and b!397488 res!228270) b!397492))

(assert (= (and b!397492 res!228269) b!397491))

(assert (= (and b!397491 res!228272) b!397483))

(assert (= (and b!397483 res!228274) b!397481))

(assert (= (and b!397489 condMapEmpty!16491) mapIsEmpty!16491))

(assert (= (and b!397489 (not condMapEmpty!16491)) mapNonEmpty!16491))

(get-info :version)

(assert (= (and mapNonEmpty!16491 ((_ is ValueCellFull!4613) mapValue!16491)) b!397484))

(assert (= (and b!397489 ((_ is ValueCellFull!4613) mapDefault!16491)) b!397487))

(assert (= start!38480 b!397489))

(declare-fun m!392973 () Bool)

(assert (=> mapNonEmpty!16491 m!392973))

(declare-fun m!392975 () Bool)

(assert (=> b!397485 m!392975))

(declare-fun m!392977 () Bool)

(assert (=> b!397488 m!392977))

(declare-fun m!392979 () Bool)

(assert (=> start!38480 m!392979))

(declare-fun m!392981 () Bool)

(assert (=> start!38480 m!392981))

(declare-fun m!392983 () Bool)

(assert (=> b!397481 m!392983))

(declare-fun m!392985 () Bool)

(assert (=> b!397492 m!392985))

(declare-fun m!392987 () Bool)

(assert (=> b!397490 m!392987))

(declare-fun m!392989 () Bool)

(assert (=> b!397491 m!392989))

(declare-fun m!392991 () Bool)

(assert (=> b!397483 m!392991))

(declare-fun m!392993 () Bool)

(assert (=> b!397483 m!392993))

(declare-fun m!392995 () Bool)

(assert (=> b!397482 m!392995))

(check-sat (not b!397482) (not b!397481) tp_is_empty!9913 (not mapNonEmpty!16491) (not b!397483) (not b!397490) (not b!397485) (not b!397488) (not b!397491) (not start!38480))
(check-sat)
