; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39734 () Bool)

(assert start!39734)

(declare-fun b_free!10015 () Bool)

(declare-fun b_next!10015 () Bool)

(assert (=> start!39734 (= b_free!10015 (not b_next!10015))))

(declare-fun tp!35573 () Bool)

(declare-fun b_and!17663 () Bool)

(assert (=> start!39734 (= tp!35573 b_and!17663)))

(declare-fun b!427560 () Bool)

(declare-fun e!253449 () Bool)

(declare-fun e!253453 () Bool)

(assert (=> b!427560 (= e!253449 e!253453)))

(declare-fun res!250896 () Bool)

(assert (=> b!427560 (=> (not res!250896) (not e!253453))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427560 (= res!250896 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15995 0))(
  ( (V!15996 (val!5628 Int)) )
))
(declare-fun minValue!515 () V!15995)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!26163 0))(
  ( (array!26164 (arr!12531 (Array (_ BitVec 32) (_ BitVec 64))) (size!12884 (_ BitVec 32))) )
))
(declare-fun lt!195235 () array!26163)

(declare-datatypes ((ValueCell!5240 0))(
  ( (ValueCellFull!5240 (v!7869 V!15995)) (EmptyCell!5240) )
))
(declare-datatypes ((array!26165 0))(
  ( (array!26166 (arr!12532 (Array (_ BitVec 32) ValueCell!5240)) (size!12885 (_ BitVec 32))) )
))
(declare-fun lt!195233 () array!26165)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7400 0))(
  ( (tuple2!7401 (_1!3711 (_ BitVec 64)) (_2!3711 V!15995)) )
))
(declare-datatypes ((List!7403 0))(
  ( (Nil!7400) (Cons!7399 (h!8255 tuple2!7400) (t!12858 List!7403)) )
))
(declare-datatypes ((ListLongMap!6303 0))(
  ( (ListLongMap!6304 (toList!3167 List!7403)) )
))
(declare-fun lt!195239 () ListLongMap!6303)

(declare-fun zeroValue!515 () V!15995)

(declare-fun getCurrentListMapNoExtraKeys!1375 (array!26163 array!26165 (_ BitVec 32) (_ BitVec 32) V!15995 V!15995 (_ BitVec 32) Int) ListLongMap!6303)

(assert (=> b!427560 (= lt!195239 (getCurrentListMapNoExtraKeys!1375 lt!195235 lt!195233 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26165)

(declare-fun v!412 () V!15995)

(assert (=> b!427560 (= lt!195233 (array!26166 (store (arr!12532 _values!549) i!563 (ValueCellFull!5240 v!412)) (size!12885 _values!549)))))

(declare-fun lt!195236 () ListLongMap!6303)

(declare-fun _keys!709 () array!26163)

(assert (=> b!427560 (= lt!195236 (getCurrentListMapNoExtraKeys!1375 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18372 () Bool)

(declare-fun mapRes!18372 () Bool)

(declare-fun tp!35574 () Bool)

(declare-fun e!253455 () Bool)

(assert (=> mapNonEmpty!18372 (= mapRes!18372 (and tp!35574 e!253455))))

(declare-fun mapRest!18372 () (Array (_ BitVec 32) ValueCell!5240))

(declare-fun mapValue!18372 () ValueCell!5240)

(declare-fun mapKey!18372 () (_ BitVec 32))

(assert (=> mapNonEmpty!18372 (= (arr!12532 _values!549) (store mapRest!18372 mapKey!18372 mapValue!18372))))

(declare-fun b!427561 () Bool)

(declare-fun res!250898 () Bool)

(declare-fun e!253452 () Bool)

(assert (=> b!427561 (=> (not res!250898) (not e!253452))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26163 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427561 (= res!250898 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427562 () Bool)

(declare-fun res!250900 () Bool)

(assert (=> b!427562 (=> (not res!250900) (not e!253449))))

(declare-datatypes ((List!7404 0))(
  ( (Nil!7401) (Cons!7400 (h!8256 (_ BitVec 64)) (t!12859 List!7404)) )
))
(declare-fun arrayNoDuplicates!0 (array!26163 (_ BitVec 32) List!7404) Bool)

(assert (=> b!427562 (= res!250900 (arrayNoDuplicates!0 lt!195235 #b00000000000000000000000000000000 Nil!7401))))

(declare-fun b!427563 () Bool)

(declare-fun res!250897 () Bool)

(assert (=> b!427563 (=> (not res!250897) (not e!253452))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427563 (= res!250897 (validMask!0 mask!1025))))

(declare-fun b!427564 () Bool)

(declare-fun res!250893 () Bool)

(assert (=> b!427564 (=> (not res!250893) (not e!253452))))

(assert (=> b!427564 (= res!250893 (or (= (select (arr!12531 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12531 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!250904 () Bool)

(assert (=> start!39734 (=> (not res!250904) (not e!253452))))

(assert (=> start!39734 (= res!250904 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12884 _keys!709))))))

(assert (=> start!39734 e!253452))

(declare-fun tp_is_empty!11167 () Bool)

(assert (=> start!39734 tp_is_empty!11167))

(assert (=> start!39734 tp!35573))

(assert (=> start!39734 true))

(declare-fun e!253451 () Bool)

(declare-fun array_inv!9160 (array!26165) Bool)

(assert (=> start!39734 (and (array_inv!9160 _values!549) e!253451)))

(declare-fun array_inv!9161 (array!26163) Bool)

(assert (=> start!39734 (array_inv!9161 _keys!709)))

(declare-fun b!427565 () Bool)

(declare-fun res!250905 () Bool)

(assert (=> b!427565 (=> (not res!250905) (not e!253452))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26163 (_ BitVec 32)) Bool)

(assert (=> b!427565 (= res!250905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18372 () Bool)

(assert (=> mapIsEmpty!18372 mapRes!18372))

(declare-fun b!427566 () Bool)

(declare-fun res!250902 () Bool)

(assert (=> b!427566 (=> (not res!250902) (not e!253452))))

(assert (=> b!427566 (= res!250902 (and (= (size!12885 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12884 _keys!709) (size!12885 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427567 () Bool)

(declare-fun e!253450 () Bool)

(assert (=> b!427567 (= e!253450 true)))

(declare-fun lt!195238 () ListLongMap!6303)

(declare-fun +!1346 (ListLongMap!6303 tuple2!7400) ListLongMap!6303)

(declare-fun get!6201 (ValueCell!5240 V!15995) V!15995)

(declare-fun dynLambda!745 (Int (_ BitVec 64)) V!15995)

(assert (=> b!427567 (= lt!195239 (+!1346 lt!195238 (tuple2!7401 (select (arr!12531 _keys!709) from!863) (get!6201 (select (arr!12532 _values!549) from!863) (dynLambda!745 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427568 () Bool)

(declare-fun res!250903 () Bool)

(assert (=> b!427568 (=> (not res!250903) (not e!253452))))

(assert (=> b!427568 (= res!250903 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7401))))

(declare-fun b!427569 () Bool)

(declare-fun res!250901 () Bool)

(assert (=> b!427569 (=> (not res!250901) (not e!253452))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427569 (= res!250901 (validKeyInArray!0 k0!794))))

(declare-fun b!427570 () Bool)

(assert (=> b!427570 (= e!253455 tp_is_empty!11167)))

(declare-fun b!427571 () Bool)

(declare-fun res!250892 () Bool)

(assert (=> b!427571 (=> (not res!250892) (not e!253452))))

(assert (=> b!427571 (= res!250892 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12884 _keys!709))))))

(declare-fun b!427572 () Bool)

(assert (=> b!427572 (= e!253453 (not e!253450))))

(declare-fun res!250899 () Bool)

(assert (=> b!427572 (=> res!250899 e!253450)))

(assert (=> b!427572 (= res!250899 (not (validKeyInArray!0 (select (arr!12531 _keys!709) from!863))))))

(declare-fun lt!195237 () ListLongMap!6303)

(assert (=> b!427572 (= lt!195237 lt!195238)))

(declare-fun lt!195232 () ListLongMap!6303)

(assert (=> b!427572 (= lt!195238 (+!1346 lt!195232 (tuple2!7401 k0!794 v!412)))))

(assert (=> b!427572 (= lt!195237 (getCurrentListMapNoExtraKeys!1375 lt!195235 lt!195233 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427572 (= lt!195232 (getCurrentListMapNoExtraKeys!1375 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12534 0))(
  ( (Unit!12535) )
))
(declare-fun lt!195234 () Unit!12534)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!515 (array!26163 array!26165 (_ BitVec 32) (_ BitVec 32) V!15995 V!15995 (_ BitVec 32) (_ BitVec 64) V!15995 (_ BitVec 32) Int) Unit!12534)

(assert (=> b!427572 (= lt!195234 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!515 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427573 () Bool)

(declare-fun res!250895 () Bool)

(assert (=> b!427573 (=> (not res!250895) (not e!253449))))

(assert (=> b!427573 (= res!250895 (bvsle from!863 i!563))))

(declare-fun b!427574 () Bool)

(assert (=> b!427574 (= e!253452 e!253449)))

(declare-fun res!250894 () Bool)

(assert (=> b!427574 (=> (not res!250894) (not e!253449))))

(assert (=> b!427574 (= res!250894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195235 mask!1025))))

(assert (=> b!427574 (= lt!195235 (array!26164 (store (arr!12531 _keys!709) i!563 k0!794) (size!12884 _keys!709)))))

(declare-fun b!427575 () Bool)

(declare-fun e!253448 () Bool)

(assert (=> b!427575 (= e!253448 tp_is_empty!11167)))

(declare-fun b!427576 () Bool)

(assert (=> b!427576 (= e!253451 (and e!253448 mapRes!18372))))

(declare-fun condMapEmpty!18372 () Bool)

(declare-fun mapDefault!18372 () ValueCell!5240)

(assert (=> b!427576 (= condMapEmpty!18372 (= (arr!12532 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5240)) mapDefault!18372)))))

(assert (= (and start!39734 res!250904) b!427563))

(assert (= (and b!427563 res!250897) b!427566))

(assert (= (and b!427566 res!250902) b!427565))

(assert (= (and b!427565 res!250905) b!427568))

(assert (= (and b!427568 res!250903) b!427571))

(assert (= (and b!427571 res!250892) b!427569))

(assert (= (and b!427569 res!250901) b!427564))

(assert (= (and b!427564 res!250893) b!427561))

(assert (= (and b!427561 res!250898) b!427574))

(assert (= (and b!427574 res!250894) b!427562))

(assert (= (and b!427562 res!250900) b!427573))

(assert (= (and b!427573 res!250895) b!427560))

(assert (= (and b!427560 res!250896) b!427572))

(assert (= (and b!427572 (not res!250899)) b!427567))

(assert (= (and b!427576 condMapEmpty!18372) mapIsEmpty!18372))

(assert (= (and b!427576 (not condMapEmpty!18372)) mapNonEmpty!18372))

(get-info :version)

(assert (= (and mapNonEmpty!18372 ((_ is ValueCellFull!5240) mapValue!18372)) b!427570))

(assert (= (and b!427576 ((_ is ValueCellFull!5240) mapDefault!18372)) b!427575))

(assert (= start!39734 b!427576))

(declare-fun b_lambda!9085 () Bool)

(assert (=> (not b_lambda!9085) (not b!427567)))

(declare-fun t!12857 () Bool)

(declare-fun tb!3413 () Bool)

(assert (=> (and start!39734 (= defaultEntry!557 defaultEntry!557) t!12857) tb!3413))

(declare-fun result!6361 () Bool)

(assert (=> tb!3413 (= result!6361 tp_is_empty!11167)))

(assert (=> b!427567 t!12857))

(declare-fun b_and!17665 () Bool)

(assert (= b_and!17663 (and (=> t!12857 result!6361) b_and!17665)))

(declare-fun m!415575 () Bool)

(assert (=> b!427568 m!415575))

(declare-fun m!415577 () Bool)

(assert (=> b!427562 m!415577))

(declare-fun m!415579 () Bool)

(assert (=> b!427564 m!415579))

(declare-fun m!415581 () Bool)

(assert (=> b!427569 m!415581))

(declare-fun m!415583 () Bool)

(assert (=> b!427567 m!415583))

(declare-fun m!415585 () Bool)

(assert (=> b!427567 m!415585))

(declare-fun m!415587 () Bool)

(assert (=> b!427567 m!415587))

(assert (=> b!427567 m!415587))

(assert (=> b!427567 m!415585))

(declare-fun m!415589 () Bool)

(assert (=> b!427567 m!415589))

(declare-fun m!415591 () Bool)

(assert (=> b!427567 m!415591))

(declare-fun m!415593 () Bool)

(assert (=> b!427561 m!415593))

(assert (=> b!427572 m!415583))

(declare-fun m!415595 () Bool)

(assert (=> b!427572 m!415595))

(declare-fun m!415597 () Bool)

(assert (=> b!427572 m!415597))

(declare-fun m!415599 () Bool)

(assert (=> b!427572 m!415599))

(assert (=> b!427572 m!415583))

(declare-fun m!415601 () Bool)

(assert (=> b!427572 m!415601))

(declare-fun m!415603 () Bool)

(assert (=> b!427572 m!415603))

(declare-fun m!415605 () Bool)

(assert (=> b!427560 m!415605))

(declare-fun m!415607 () Bool)

(assert (=> b!427560 m!415607))

(declare-fun m!415609 () Bool)

(assert (=> b!427560 m!415609))

(declare-fun m!415611 () Bool)

(assert (=> mapNonEmpty!18372 m!415611))

(declare-fun m!415613 () Bool)

(assert (=> b!427563 m!415613))

(declare-fun m!415615 () Bool)

(assert (=> b!427565 m!415615))

(declare-fun m!415617 () Bool)

(assert (=> b!427574 m!415617))

(declare-fun m!415619 () Bool)

(assert (=> b!427574 m!415619))

(declare-fun m!415621 () Bool)

(assert (=> start!39734 m!415621))

(declare-fun m!415623 () Bool)

(assert (=> start!39734 m!415623))

(check-sat (not b!427563) b_and!17665 (not b!427574) (not b_next!10015) (not b!427567) (not start!39734) (not b!427561) (not b_lambda!9085) tp_is_empty!11167 (not b!427569) (not mapNonEmpty!18372) (not b!427568) (not b!427565) (not b!427560) (not b!427562) (not b!427572))
(check-sat b_and!17665 (not b_next!10015))
