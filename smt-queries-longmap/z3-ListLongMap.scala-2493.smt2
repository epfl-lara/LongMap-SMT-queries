; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38778 () Bool)

(assert start!38778)

(declare-fun b!404363 () Bool)

(declare-fun e!243282 () Bool)

(assert (=> b!404363 (= e!243282 false)))

(declare-fun lt!188170 () Bool)

(declare-datatypes ((array!24289 0))(
  ( (array!24290 (arr!11594 (Array (_ BitVec 32) (_ BitVec 64))) (size!11946 (_ BitVec 32))) )
))
(declare-fun lt!188171 () array!24289)

(declare-datatypes ((List!6751 0))(
  ( (Nil!6748) (Cons!6747 (h!7603 (_ BitVec 64)) (t!11925 List!6751)) )
))
(declare-fun arrayNoDuplicates!0 (array!24289 (_ BitVec 32) List!6751) Bool)

(assert (=> b!404363 (= lt!188170 (arrayNoDuplicates!0 lt!188171 #b00000000000000000000000000000000 Nil!6748))))

(declare-fun b!404364 () Bool)

(declare-fun e!243278 () Bool)

(declare-fun tp_is_empty!10197 () Bool)

(assert (=> b!404364 (= e!243278 tp_is_empty!10197)))

(declare-fun b!404365 () Bool)

(declare-fun e!243280 () Bool)

(declare-fun mapRes!16917 () Bool)

(assert (=> b!404365 (= e!243280 (and e!243278 mapRes!16917))))

(declare-fun condMapEmpty!16917 () Bool)

(declare-datatypes ((V!14701 0))(
  ( (V!14702 (val!5143 Int)) )
))
(declare-datatypes ((ValueCell!4755 0))(
  ( (ValueCellFull!4755 (v!7390 V!14701)) (EmptyCell!4755) )
))
(declare-datatypes ((array!24291 0))(
  ( (array!24292 (arr!11595 (Array (_ BitVec 32) ValueCell!4755)) (size!11947 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24291)

(declare-fun mapDefault!16917 () ValueCell!4755)

(assert (=> b!404365 (= condMapEmpty!16917 (= (arr!11595 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4755)) mapDefault!16917)))))

(declare-fun b!404366 () Bool)

(declare-fun res!233180 () Bool)

(declare-fun e!243279 () Bool)

(assert (=> b!404366 (=> (not res!233180) (not e!243279))))

(declare-fun _keys!709 () array!24289)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24289 (_ BitVec 32)) Bool)

(assert (=> b!404366 (= res!233180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!233179 () Bool)

(assert (=> start!38778 (=> (not res!233179) (not e!243279))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38778 (= res!233179 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11946 _keys!709))))))

(assert (=> start!38778 e!243279))

(assert (=> start!38778 true))

(declare-fun array_inv!8480 (array!24291) Bool)

(assert (=> start!38778 (and (array_inv!8480 _values!549) e!243280)))

(declare-fun array_inv!8481 (array!24289) Bool)

(assert (=> start!38778 (array_inv!8481 _keys!709)))

(declare-fun b!404367 () Bool)

(declare-fun res!233178 () Bool)

(assert (=> b!404367 (=> (not res!233178) (not e!243279))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24289 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404367 (= res!233178 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!404368 () Bool)

(declare-fun res!233184 () Bool)

(assert (=> b!404368 (=> (not res!233184) (not e!243279))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404368 (= res!233184 (and (= (size!11947 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11946 _keys!709) (size!11947 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!16917 () Bool)

(assert (=> mapIsEmpty!16917 mapRes!16917))

(declare-fun b!404369 () Bool)

(declare-fun res!233181 () Bool)

(assert (=> b!404369 (=> (not res!233181) (not e!243279))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404369 (= res!233181 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11946 _keys!709))))))

(declare-fun b!404370 () Bool)

(declare-fun res!233185 () Bool)

(assert (=> b!404370 (=> (not res!233185) (not e!243279))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404370 (= res!233185 (validKeyInArray!0 k0!794))))

(declare-fun b!404371 () Bool)

(declare-fun res!233187 () Bool)

(assert (=> b!404371 (=> (not res!233187) (not e!243279))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404371 (= res!233187 (validMask!0 mask!1025))))

(declare-fun b!404372 () Bool)

(declare-fun res!233183 () Bool)

(assert (=> b!404372 (=> (not res!233183) (not e!243279))))

(assert (=> b!404372 (= res!233183 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6748))))

(declare-fun b!404373 () Bool)

(declare-fun e!243277 () Bool)

(assert (=> b!404373 (= e!243277 tp_is_empty!10197)))

(declare-fun b!404374 () Bool)

(assert (=> b!404374 (= e!243279 e!243282)))

(declare-fun res!233186 () Bool)

(assert (=> b!404374 (=> (not res!233186) (not e!243282))))

(assert (=> b!404374 (= res!233186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188171 mask!1025))))

(assert (=> b!404374 (= lt!188171 (array!24290 (store (arr!11594 _keys!709) i!563 k0!794) (size!11946 _keys!709)))))

(declare-fun b!404375 () Bool)

(declare-fun res!233182 () Bool)

(assert (=> b!404375 (=> (not res!233182) (not e!243279))))

(assert (=> b!404375 (= res!233182 (or (= (select (arr!11594 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11594 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16917 () Bool)

(declare-fun tp!33036 () Bool)

(assert (=> mapNonEmpty!16917 (= mapRes!16917 (and tp!33036 e!243277))))

(declare-fun mapKey!16917 () (_ BitVec 32))

(declare-fun mapValue!16917 () ValueCell!4755)

(declare-fun mapRest!16917 () (Array (_ BitVec 32) ValueCell!4755))

(assert (=> mapNonEmpty!16917 (= (arr!11595 _values!549) (store mapRest!16917 mapKey!16917 mapValue!16917))))

(assert (= (and start!38778 res!233179) b!404371))

(assert (= (and b!404371 res!233187) b!404368))

(assert (= (and b!404368 res!233184) b!404366))

(assert (= (and b!404366 res!233180) b!404372))

(assert (= (and b!404372 res!233183) b!404369))

(assert (= (and b!404369 res!233181) b!404370))

(assert (= (and b!404370 res!233185) b!404375))

(assert (= (and b!404375 res!233182) b!404367))

(assert (= (and b!404367 res!233178) b!404374))

(assert (= (and b!404374 res!233186) b!404363))

(assert (= (and b!404365 condMapEmpty!16917) mapIsEmpty!16917))

(assert (= (and b!404365 (not condMapEmpty!16917)) mapNonEmpty!16917))

(get-info :version)

(assert (= (and mapNonEmpty!16917 ((_ is ValueCellFull!4755) mapValue!16917)) b!404373))

(assert (= (and b!404365 ((_ is ValueCellFull!4755) mapDefault!16917)) b!404364))

(assert (= start!38778 b!404365))

(declare-fun m!397231 () Bool)

(assert (=> b!404367 m!397231))

(declare-fun m!397233 () Bool)

(assert (=> mapNonEmpty!16917 m!397233))

(declare-fun m!397235 () Bool)

(assert (=> b!404375 m!397235))

(declare-fun m!397237 () Bool)

(assert (=> b!404363 m!397237))

(declare-fun m!397239 () Bool)

(assert (=> b!404374 m!397239))

(declare-fun m!397241 () Bool)

(assert (=> b!404374 m!397241))

(declare-fun m!397243 () Bool)

(assert (=> b!404371 m!397243))

(declare-fun m!397245 () Bool)

(assert (=> b!404366 m!397245))

(declare-fun m!397247 () Bool)

(assert (=> start!38778 m!397247))

(declare-fun m!397249 () Bool)

(assert (=> start!38778 m!397249))

(declare-fun m!397251 () Bool)

(assert (=> b!404370 m!397251))

(declare-fun m!397253 () Bool)

(assert (=> b!404372 m!397253))

(check-sat (not b!404372) (not b!404363) (not mapNonEmpty!16917) (not b!404374) (not b!404367) (not b!404371) (not start!38778) tp_is_empty!10197 (not b!404366) (not b!404370))
(check-sat)
