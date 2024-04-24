; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39728 () Bool)

(assert start!39728)

(declare-fun b_free!10009 () Bool)

(declare-fun b_next!10009 () Bool)

(assert (=> start!39728 (= b_free!10009 (not b_next!10009))))

(declare-fun tp!35555 () Bool)

(declare-fun b_and!17691 () Bool)

(assert (=> start!39728 (= tp!35555 b_and!17691)))

(declare-fun res!250892 () Bool)

(declare-fun e!253524 () Bool)

(assert (=> start!39728 (=> (not res!250892) (not e!253524))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!26168 0))(
  ( (array!26169 (arr!12533 (Array (_ BitVec 32) (_ BitVec 64))) (size!12885 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26168)

(assert (=> start!39728 (= res!250892 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12885 _keys!709))))))

(assert (=> start!39728 e!253524))

(declare-fun tp_is_empty!11161 () Bool)

(assert (=> start!39728 tp_is_empty!11161))

(assert (=> start!39728 tp!35555))

(assert (=> start!39728 true))

(declare-datatypes ((V!15987 0))(
  ( (V!15988 (val!5625 Int)) )
))
(declare-datatypes ((ValueCell!5237 0))(
  ( (ValueCellFull!5237 (v!7873 V!15987)) (EmptyCell!5237) )
))
(declare-datatypes ((array!26170 0))(
  ( (array!26171 (arr!12534 (Array (_ BitVec 32) ValueCell!5237)) (size!12886 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26170)

(declare-fun e!253519 () Bool)

(declare-fun array_inv!9198 (array!26170) Bool)

(assert (=> start!39728 (and (array_inv!9198 _values!549) e!253519)))

(declare-fun array_inv!9199 (array!26168) Bool)

(assert (=> start!39728 (array_inv!9199 _keys!709)))

(declare-fun b!427623 () Bool)

(declare-fun res!250899 () Bool)

(assert (=> b!427623 (=> (not res!250899) (not e!253524))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26168 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427623 (= res!250899 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427624 () Bool)

(declare-fun res!250895 () Bool)

(assert (=> b!427624 (=> (not res!250895) (not e!253524))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!427624 (= res!250895 (and (= (size!12886 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12885 _keys!709) (size!12886 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427625 () Bool)

(declare-fun res!250898 () Bool)

(declare-fun e!253518 () Bool)

(assert (=> b!427625 (=> (not res!250898) (not e!253518))))

(declare-fun lt!195413 () array!26168)

(declare-datatypes ((List!7299 0))(
  ( (Nil!7296) (Cons!7295 (h!8151 (_ BitVec 64)) (t!12749 List!7299)) )
))
(declare-fun arrayNoDuplicates!0 (array!26168 (_ BitVec 32) List!7299) Bool)

(assert (=> b!427625 (= res!250898 (arrayNoDuplicates!0 lt!195413 #b00000000000000000000000000000000 Nil!7296))))

(declare-fun b!427626 () Bool)

(declare-fun res!250900 () Bool)

(assert (=> b!427626 (=> (not res!250900) (not e!253524))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427626 (= res!250900 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12885 _keys!709))))))

(declare-fun b!427627 () Bool)

(declare-fun res!250893 () Bool)

(assert (=> b!427627 (=> (not res!250893) (not e!253524))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427627 (= res!250893 (validKeyInArray!0 k0!794))))

(declare-fun b!427628 () Bool)

(assert (=> b!427628 (= e!253524 e!253518)))

(declare-fun res!250905 () Bool)

(assert (=> b!427628 (=> (not res!250905) (not e!253518))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26168 (_ BitVec 32)) Bool)

(assert (=> b!427628 (= res!250905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195413 mask!1025))))

(assert (=> b!427628 (= lt!195413 (array!26169 (store (arr!12533 _keys!709) i!563 k0!794) (size!12885 _keys!709)))))

(declare-fun b!427629 () Bool)

(declare-fun res!250902 () Bool)

(assert (=> b!427629 (=> (not res!250902) (not e!253524))))

(assert (=> b!427629 (= res!250902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!18363 () Bool)

(declare-fun mapRes!18363 () Bool)

(assert (=> mapIsEmpty!18363 mapRes!18363))

(declare-fun b!427630 () Bool)

(declare-fun res!250896 () Bool)

(assert (=> b!427630 (=> (not res!250896) (not e!253524))))

(assert (=> b!427630 (= res!250896 (or (= (select (arr!12533 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12533 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427631 () Bool)

(declare-fun e!253522 () Bool)

(assert (=> b!427631 (= e!253518 e!253522)))

(declare-fun res!250901 () Bool)

(assert (=> b!427631 (=> (not res!250901) (not e!253522))))

(assert (=> b!427631 (= res!250901 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15987)

(declare-datatypes ((tuple2!7296 0))(
  ( (tuple2!7297 (_1!3659 (_ BitVec 64)) (_2!3659 V!15987)) )
))
(declare-datatypes ((List!7300 0))(
  ( (Nil!7297) (Cons!7296 (h!8152 tuple2!7296) (t!12750 List!7300)) )
))
(declare-datatypes ((ListLongMap!6211 0))(
  ( (ListLongMap!6212 (toList!3121 List!7300)) )
))
(declare-fun lt!195418 () ListLongMap!6211)

(declare-fun lt!195419 () array!26170)

(declare-fun minValue!515 () V!15987)

(declare-fun getCurrentListMapNoExtraKeys!1367 (array!26168 array!26170 (_ BitVec 32) (_ BitVec 32) V!15987 V!15987 (_ BitVec 32) Int) ListLongMap!6211)

(assert (=> b!427631 (= lt!195418 (getCurrentListMapNoExtraKeys!1367 lt!195413 lt!195419 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15987)

(assert (=> b!427631 (= lt!195419 (array!26171 (store (arr!12534 _values!549) i!563 (ValueCellFull!5237 v!412)) (size!12886 _values!549)))))

(declare-fun lt!195415 () ListLongMap!6211)

(assert (=> b!427631 (= lt!195415 (getCurrentListMapNoExtraKeys!1367 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427632 () Bool)

(declare-fun res!250903 () Bool)

(assert (=> b!427632 (=> (not res!250903) (not e!253518))))

(assert (=> b!427632 (= res!250903 (bvsle from!863 i!563))))

(declare-fun b!427633 () Bool)

(declare-fun e!253525 () Bool)

(assert (=> b!427633 (= e!253525 true)))

(declare-fun lt!195416 () ListLongMap!6211)

(declare-fun +!1334 (ListLongMap!6211 tuple2!7296) ListLongMap!6211)

(declare-fun get!6208 (ValueCell!5237 V!15987) V!15987)

(declare-fun dynLambda!751 (Int (_ BitVec 64)) V!15987)

(assert (=> b!427633 (= lt!195418 (+!1334 lt!195416 (tuple2!7297 (select (arr!12533 _keys!709) from!863) (get!6208 (select (arr!12534 _values!549) from!863) (dynLambda!751 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427634 () Bool)

(declare-fun res!250897 () Bool)

(assert (=> b!427634 (=> (not res!250897) (not e!253524))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427634 (= res!250897 (validMask!0 mask!1025))))

(declare-fun b!427635 () Bool)

(declare-fun res!250904 () Bool)

(assert (=> b!427635 (=> (not res!250904) (not e!253524))))

(assert (=> b!427635 (= res!250904 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7296))))

(declare-fun mapNonEmpty!18363 () Bool)

(declare-fun tp!35556 () Bool)

(declare-fun e!253521 () Bool)

(assert (=> mapNonEmpty!18363 (= mapRes!18363 (and tp!35556 e!253521))))

(declare-fun mapRest!18363 () (Array (_ BitVec 32) ValueCell!5237))

(declare-fun mapKey!18363 () (_ BitVec 32))

(declare-fun mapValue!18363 () ValueCell!5237)

(assert (=> mapNonEmpty!18363 (= (arr!12534 _values!549) (store mapRest!18363 mapKey!18363 mapValue!18363))))

(declare-fun b!427636 () Bool)

(assert (=> b!427636 (= e!253521 tp_is_empty!11161)))

(declare-fun b!427637 () Bool)

(assert (=> b!427637 (= e!253522 (not e!253525))))

(declare-fun res!250894 () Bool)

(assert (=> b!427637 (=> res!250894 e!253525)))

(assert (=> b!427637 (= res!250894 (not (validKeyInArray!0 (select (arr!12533 _keys!709) from!863))))))

(declare-fun lt!195417 () ListLongMap!6211)

(assert (=> b!427637 (= lt!195417 lt!195416)))

(declare-fun lt!195414 () ListLongMap!6211)

(assert (=> b!427637 (= lt!195416 (+!1334 lt!195414 (tuple2!7297 k0!794 v!412)))))

(assert (=> b!427637 (= lt!195417 (getCurrentListMapNoExtraKeys!1367 lt!195413 lt!195419 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427637 (= lt!195414 (getCurrentListMapNoExtraKeys!1367 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12543 0))(
  ( (Unit!12544) )
))
(declare-fun lt!195420 () Unit!12543)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!518 (array!26168 array!26170 (_ BitVec 32) (_ BitVec 32) V!15987 V!15987 (_ BitVec 32) (_ BitVec 64) V!15987 (_ BitVec 32) Int) Unit!12543)

(assert (=> b!427637 (= lt!195420 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!518 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427638 () Bool)

(declare-fun e!253520 () Bool)

(assert (=> b!427638 (= e!253520 tp_is_empty!11161)))

(declare-fun b!427639 () Bool)

(assert (=> b!427639 (= e!253519 (and e!253520 mapRes!18363))))

(declare-fun condMapEmpty!18363 () Bool)

(declare-fun mapDefault!18363 () ValueCell!5237)

(assert (=> b!427639 (= condMapEmpty!18363 (= (arr!12534 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5237)) mapDefault!18363)))))

(assert (= (and start!39728 res!250892) b!427634))

(assert (= (and b!427634 res!250897) b!427624))

(assert (= (and b!427624 res!250895) b!427629))

(assert (= (and b!427629 res!250902) b!427635))

(assert (= (and b!427635 res!250904) b!427626))

(assert (= (and b!427626 res!250900) b!427627))

(assert (= (and b!427627 res!250893) b!427630))

(assert (= (and b!427630 res!250896) b!427623))

(assert (= (and b!427623 res!250899) b!427628))

(assert (= (and b!427628 res!250905) b!427625))

(assert (= (and b!427625 res!250898) b!427632))

(assert (= (and b!427632 res!250903) b!427631))

(assert (= (and b!427631 res!250901) b!427637))

(assert (= (and b!427637 (not res!250894)) b!427633))

(assert (= (and b!427639 condMapEmpty!18363) mapIsEmpty!18363))

(assert (= (and b!427639 (not condMapEmpty!18363)) mapNonEmpty!18363))

(get-info :version)

(assert (= (and mapNonEmpty!18363 ((_ is ValueCellFull!5237) mapValue!18363)) b!427636))

(assert (= (and b!427639 ((_ is ValueCellFull!5237) mapDefault!18363)) b!427638))

(assert (= start!39728 b!427639))

(declare-fun b_lambda!9119 () Bool)

(assert (=> (not b_lambda!9119) (not b!427633)))

(declare-fun t!12748 () Bool)

(declare-fun tb!3407 () Bool)

(assert (=> (and start!39728 (= defaultEntry!557 defaultEntry!557) t!12748) tb!3407))

(declare-fun result!6349 () Bool)

(assert (=> tb!3407 (= result!6349 tp_is_empty!11161)))

(assert (=> b!427633 t!12748))

(declare-fun b_and!17693 () Bool)

(assert (= b_and!17691 (and (=> t!12748 result!6349) b_and!17693)))

(declare-fun m!416375 () Bool)

(assert (=> b!427627 m!416375))

(declare-fun m!416377 () Bool)

(assert (=> b!427628 m!416377))

(declare-fun m!416379 () Bool)

(assert (=> b!427628 m!416379))

(declare-fun m!416381 () Bool)

(assert (=> b!427631 m!416381))

(declare-fun m!416383 () Bool)

(assert (=> b!427631 m!416383))

(declare-fun m!416385 () Bool)

(assert (=> b!427631 m!416385))

(declare-fun m!416387 () Bool)

(assert (=> b!427633 m!416387))

(declare-fun m!416389 () Bool)

(assert (=> b!427633 m!416389))

(declare-fun m!416391 () Bool)

(assert (=> b!427633 m!416391))

(declare-fun m!416393 () Bool)

(assert (=> b!427633 m!416393))

(assert (=> b!427633 m!416391))

(assert (=> b!427633 m!416389))

(declare-fun m!416395 () Bool)

(assert (=> b!427633 m!416395))

(declare-fun m!416397 () Bool)

(assert (=> start!39728 m!416397))

(declare-fun m!416399 () Bool)

(assert (=> start!39728 m!416399))

(declare-fun m!416401 () Bool)

(assert (=> b!427634 m!416401))

(declare-fun m!416403 () Bool)

(assert (=> b!427623 m!416403))

(declare-fun m!416405 () Bool)

(assert (=> b!427629 m!416405))

(assert (=> b!427637 m!416387))

(declare-fun m!416407 () Bool)

(assert (=> b!427637 m!416407))

(assert (=> b!427637 m!416387))

(declare-fun m!416409 () Bool)

(assert (=> b!427637 m!416409))

(declare-fun m!416411 () Bool)

(assert (=> b!427637 m!416411))

(declare-fun m!416413 () Bool)

(assert (=> b!427637 m!416413))

(declare-fun m!416415 () Bool)

(assert (=> b!427637 m!416415))

(declare-fun m!416417 () Bool)

(assert (=> b!427635 m!416417))

(declare-fun m!416419 () Bool)

(assert (=> mapNonEmpty!18363 m!416419))

(declare-fun m!416421 () Bool)

(assert (=> b!427630 m!416421))

(declare-fun m!416423 () Bool)

(assert (=> b!427625 m!416423))

(check-sat (not b!427633) (not b_next!10009) (not b!427634) (not b!427631) (not b!427625) (not b!427628) (not b!427623) tp_is_empty!11161 (not start!39728) (not b!427637) (not b!427629) (not mapNonEmpty!18363) (not b!427635) (not b!427627) (not b_lambda!9119) b_and!17693)
(check-sat b_and!17693 (not b_next!10009))
