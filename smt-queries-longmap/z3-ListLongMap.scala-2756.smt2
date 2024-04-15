; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40374 () Bool)

(assert start!40374)

(declare-fun b!443642 () Bool)

(declare-fun e!260958 () Bool)

(declare-fun tp_is_empty!11773 () Bool)

(assert (=> b!443642 (= e!260958 tp_is_empty!11773)))

(declare-fun b!443643 () Bool)

(declare-fun res!263007 () Bool)

(declare-fun e!260955 () Bool)

(assert (=> b!443643 (=> (not res!263007) (not e!260955))))

(declare-datatypes ((array!27359 0))(
  ( (array!27360 (arr!13127 (Array (_ BitVec 32) (_ BitVec 64))) (size!13480 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27359)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27359 (_ BitVec 32)) Bool)

(assert (=> b!443643 (= res!263007 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443644 () Bool)

(declare-fun res!263006 () Bool)

(assert (=> b!443644 (=> (not res!263006) (not e!260955))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!443644 (= res!263006 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!19287 () Bool)

(declare-fun mapRes!19287 () Bool)

(assert (=> mapIsEmpty!19287 mapRes!19287))

(declare-fun b!443645 () Bool)

(declare-fun e!260960 () Bool)

(assert (=> b!443645 (= e!260960 tp_is_empty!11773)))

(declare-fun b!443646 () Bool)

(declare-fun res!263011 () Bool)

(assert (=> b!443646 (=> (not res!263011) (not e!260955))))

(declare-datatypes ((List!7865 0))(
  ( (Nil!7862) (Cons!7861 (h!8717 (_ BitVec 64)) (t!13614 List!7865)) )
))
(declare-fun arrayNoDuplicates!0 (array!27359 (_ BitVec 32) List!7865) Bool)

(assert (=> b!443646 (= res!263011 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7862))))

(declare-fun b!443647 () Bool)

(declare-fun res!263002 () Bool)

(assert (=> b!443647 (=> (not res!263002) (not e!260955))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443647 (= res!263002 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13480 _keys!709))))))

(declare-fun b!443648 () Bool)

(declare-fun res!263010 () Bool)

(assert (=> b!443648 (=> (not res!263010) (not e!260955))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16803 0))(
  ( (V!16804 (val!5931 Int)) )
))
(declare-datatypes ((ValueCell!5543 0))(
  ( (ValueCellFull!5543 (v!8176 V!16803)) (EmptyCell!5543) )
))
(declare-datatypes ((array!27361 0))(
  ( (array!27362 (arr!13128 (Array (_ BitVec 32) ValueCell!5543)) (size!13481 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27361)

(assert (=> b!443648 (= res!263010 (and (= (size!13481 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13480 _keys!709) (size!13481 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!443649 () Bool)

(declare-fun res!263004 () Bool)

(assert (=> b!443649 (=> (not res!263004) (not e!260955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443649 (= res!263004 (validKeyInArray!0 k0!794))))

(declare-fun b!443641 () Bool)

(declare-fun res!263009 () Bool)

(assert (=> b!443641 (=> (not res!263009) (not e!260955))))

(assert (=> b!443641 (= res!263009 (or (= (select (arr!13127 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13127 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!263005 () Bool)

(assert (=> start!40374 (=> (not res!263005) (not e!260955))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40374 (= res!263005 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13480 _keys!709))))))

(assert (=> start!40374 e!260955))

(assert (=> start!40374 true))

(declare-fun e!260956 () Bool)

(declare-fun array_inv!9570 (array!27361) Bool)

(assert (=> start!40374 (and (array_inv!9570 _values!549) e!260956)))

(declare-fun array_inv!9571 (array!27359) Bool)

(assert (=> start!40374 (array_inv!9571 _keys!709)))

(declare-fun b!443650 () Bool)

(declare-fun e!260959 () Bool)

(assert (=> b!443650 (= e!260955 e!260959)))

(declare-fun res!263008 () Bool)

(assert (=> b!443650 (=> (not res!263008) (not e!260959))))

(declare-fun lt!203176 () array!27359)

(assert (=> b!443650 (= res!263008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203176 mask!1025))))

(assert (=> b!443650 (= lt!203176 (array!27360 (store (arr!13127 _keys!709) i!563 k0!794) (size!13480 _keys!709)))))

(declare-fun mapNonEmpty!19287 () Bool)

(declare-fun tp!37269 () Bool)

(assert (=> mapNonEmpty!19287 (= mapRes!19287 (and tp!37269 e!260960))))

(declare-fun mapRest!19287 () (Array (_ BitVec 32) ValueCell!5543))

(declare-fun mapValue!19287 () ValueCell!5543)

(declare-fun mapKey!19287 () (_ BitVec 32))

(assert (=> mapNonEmpty!19287 (= (arr!13128 _values!549) (store mapRest!19287 mapKey!19287 mapValue!19287))))

(declare-fun b!443651 () Bool)

(assert (=> b!443651 (= e!260956 (and e!260958 mapRes!19287))))

(declare-fun condMapEmpty!19287 () Bool)

(declare-fun mapDefault!19287 () ValueCell!5543)

(assert (=> b!443651 (= condMapEmpty!19287 (= (arr!13128 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5543)) mapDefault!19287)))))

(declare-fun b!443652 () Bool)

(assert (=> b!443652 (= e!260959 false)))

(declare-fun lt!203177 () Bool)

(assert (=> b!443652 (= lt!203177 (arrayNoDuplicates!0 lt!203176 #b00000000000000000000000000000000 Nil!7862))))

(declare-fun b!443653 () Bool)

(declare-fun res!263003 () Bool)

(assert (=> b!443653 (=> (not res!263003) (not e!260955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443653 (= res!263003 (validMask!0 mask!1025))))

(assert (= (and start!40374 res!263005) b!443653))

(assert (= (and b!443653 res!263003) b!443648))

(assert (= (and b!443648 res!263010) b!443643))

(assert (= (and b!443643 res!263007) b!443646))

(assert (= (and b!443646 res!263011) b!443647))

(assert (= (and b!443647 res!263002) b!443649))

(assert (= (and b!443649 res!263004) b!443641))

(assert (= (and b!443641 res!263009) b!443644))

(assert (= (and b!443644 res!263006) b!443650))

(assert (= (and b!443650 res!263008) b!443652))

(assert (= (and b!443651 condMapEmpty!19287) mapIsEmpty!19287))

(assert (= (and b!443651 (not condMapEmpty!19287)) mapNonEmpty!19287))

(get-info :version)

(assert (= (and mapNonEmpty!19287 ((_ is ValueCellFull!5543) mapValue!19287)) b!443645))

(assert (= (and b!443651 ((_ is ValueCellFull!5543) mapDefault!19287)) b!443642))

(assert (= start!40374 b!443651))

(declare-fun m!429265 () Bool)

(assert (=> b!443641 m!429265))

(declare-fun m!429267 () Bool)

(assert (=> b!443643 m!429267))

(declare-fun m!429269 () Bool)

(assert (=> start!40374 m!429269))

(declare-fun m!429271 () Bool)

(assert (=> start!40374 m!429271))

(declare-fun m!429273 () Bool)

(assert (=> b!443653 m!429273))

(declare-fun m!429275 () Bool)

(assert (=> b!443644 m!429275))

(declare-fun m!429277 () Bool)

(assert (=> b!443649 m!429277))

(declare-fun m!429279 () Bool)

(assert (=> b!443650 m!429279))

(declare-fun m!429281 () Bool)

(assert (=> b!443650 m!429281))

(declare-fun m!429283 () Bool)

(assert (=> mapNonEmpty!19287 m!429283))

(declare-fun m!429285 () Bool)

(assert (=> b!443646 m!429285))

(declare-fun m!429287 () Bool)

(assert (=> b!443652 m!429287))

(check-sat (not b!443650) (not b!443649) (not b!443643) (not start!40374) (not b!443653) tp_is_empty!11773 (not mapNonEmpty!19287) (not b!443646) (not b!443644) (not b!443652))
(check-sat)
