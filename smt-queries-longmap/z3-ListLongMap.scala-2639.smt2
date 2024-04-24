; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39638 () Bool)

(assert start!39638)

(declare-fun b_free!9919 () Bool)

(declare-fun b_next!9919 () Bool)

(assert (=> start!39638 (= b_free!9919 (not b_next!9919))))

(declare-fun tp!35285 () Bool)

(declare-fun b_and!17589 () Bool)

(assert (=> start!39638 (= tp!35285 b_and!17589)))

(declare-fun mapIsEmpty!18228 () Bool)

(declare-fun mapRes!18228 () Bool)

(assert (=> mapIsEmpty!18228 mapRes!18228))

(declare-fun b!425422 () Bool)

(declare-fun e!252547 () Bool)

(declare-fun tp_is_empty!11071 () Bool)

(assert (=> b!425422 (= e!252547 tp_is_empty!11071)))

(declare-fun mapNonEmpty!18228 () Bool)

(declare-fun tp!35286 () Bool)

(assert (=> mapNonEmpty!18228 (= mapRes!18228 (and tp!35286 e!252547))))

(declare-datatypes ((V!15867 0))(
  ( (V!15868 (val!5580 Int)) )
))
(declare-datatypes ((ValueCell!5192 0))(
  ( (ValueCellFull!5192 (v!7828 V!15867)) (EmptyCell!5192) )
))
(declare-fun mapValue!18228 () ValueCell!5192)

(declare-fun mapRest!18228 () (Array (_ BitVec 32) ValueCell!5192))

(declare-fun mapKey!18228 () (_ BitVec 32))

(declare-datatypes ((array!25988 0))(
  ( (array!25989 (arr!12443 (Array (_ BitVec 32) ValueCell!5192)) (size!12795 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25988)

(assert (=> mapNonEmpty!18228 (= (arr!12443 _values!549) (store mapRest!18228 mapKey!18228 mapValue!18228))))

(declare-fun b!425423 () Bool)

(declare-fun res!249108 () Bool)

(declare-fun e!252544 () Bool)

(assert (=> b!425423 (=> (not res!249108) (not e!252544))))

(declare-datatypes ((array!25990 0))(
  ( (array!25991 (arr!12444 (Array (_ BitVec 32) (_ BitVec 64))) (size!12796 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25990)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!425423 (= res!249108 (and (= (size!12795 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12796 _keys!709) (size!12795 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425424 () Bool)

(declare-fun res!249119 () Bool)

(declare-fun e!252545 () Bool)

(assert (=> b!425424 (=> (not res!249119) (not e!252545))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425424 (= res!249119 (bvsle from!863 i!563))))

(declare-fun b!425425 () Bool)

(declare-fun res!249115 () Bool)

(assert (=> b!425425 (=> (not res!249115) (not e!252544))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25990 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425425 (= res!249115 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425426 () Bool)

(declare-fun res!249116 () Bool)

(assert (=> b!425426 (=> (not res!249116) (not e!252544))))

(assert (=> b!425426 (= res!249116 (or (= (select (arr!12444 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12444 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425427 () Bool)

(declare-fun res!249110 () Bool)

(assert (=> b!425427 (=> (not res!249110) (not e!252544))))

(assert (=> b!425427 (= res!249110 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12796 _keys!709))))))

(declare-fun res!249111 () Bool)

(assert (=> start!39638 (=> (not res!249111) (not e!252544))))

(assert (=> start!39638 (= res!249111 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12796 _keys!709))))))

(assert (=> start!39638 e!252544))

(assert (=> start!39638 tp_is_empty!11071))

(assert (=> start!39638 tp!35285))

(assert (=> start!39638 true))

(declare-fun e!252550 () Bool)

(declare-fun array_inv!9142 (array!25988) Bool)

(assert (=> start!39638 (and (array_inv!9142 _values!549) e!252550)))

(declare-fun array_inv!9143 (array!25990) Bool)

(assert (=> start!39638 (array_inv!9143 _keys!709)))

(declare-fun b!425428 () Bool)

(assert (=> b!425428 (= e!252544 e!252545)))

(declare-fun res!249117 () Bool)

(assert (=> b!425428 (=> (not res!249117) (not e!252545))))

(declare-fun lt!194678 () array!25990)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25990 (_ BitVec 32)) Bool)

(assert (=> b!425428 (= res!249117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194678 mask!1025))))

(assert (=> b!425428 (= lt!194678 (array!25991 (store (arr!12444 _keys!709) i!563 k0!794) (size!12796 _keys!709)))))

(declare-fun b!425429 () Bool)

(declare-fun res!249113 () Bool)

(assert (=> b!425429 (=> (not res!249113) (not e!252545))))

(declare-datatypes ((List!7231 0))(
  ( (Nil!7228) (Cons!7227 (h!8083 (_ BitVec 64)) (t!12667 List!7231)) )
))
(declare-fun arrayNoDuplicates!0 (array!25990 (_ BitVec 32) List!7231) Bool)

(assert (=> b!425429 (= res!249113 (arrayNoDuplicates!0 lt!194678 #b00000000000000000000000000000000 Nil!7228))))

(declare-fun b!425430 () Bool)

(declare-fun res!249114 () Bool)

(assert (=> b!425430 (=> (not res!249114) (not e!252544))))

(assert (=> b!425430 (= res!249114 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7228))))

(declare-fun b!425431 () Bool)

(declare-fun res!249120 () Bool)

(assert (=> b!425431 (=> (not res!249120) (not e!252544))))

(assert (=> b!425431 (= res!249120 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!425432 () Bool)

(declare-fun res!249112 () Bool)

(assert (=> b!425432 (=> (not res!249112) (not e!252544))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425432 (= res!249112 (validMask!0 mask!1025))))

(declare-fun b!425433 () Bool)

(declare-fun res!249109 () Bool)

(assert (=> b!425433 (=> (not res!249109) (not e!252544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425433 (= res!249109 (validKeyInArray!0 k0!794))))

(declare-fun b!425434 () Bool)

(declare-fun e!252546 () Bool)

(assert (=> b!425434 (= e!252546 (not true))))

(declare-fun minValue!515 () V!15867)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!194679 () array!25988)

(declare-fun zeroValue!515 () V!15867)

(declare-fun v!412 () V!15867)

(declare-datatypes ((tuple2!7224 0))(
  ( (tuple2!7225 (_1!3623 (_ BitVec 64)) (_2!3623 V!15867)) )
))
(declare-datatypes ((List!7232 0))(
  ( (Nil!7229) (Cons!7228 (h!8084 tuple2!7224) (t!12668 List!7232)) )
))
(declare-datatypes ((ListLongMap!6139 0))(
  ( (ListLongMap!6140 (toList!3085 List!7232)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1331 (array!25990 array!25988 (_ BitVec 32) (_ BitVec 32) V!15867 V!15867 (_ BitVec 32) Int) ListLongMap!6139)

(declare-fun +!1302 (ListLongMap!6139 tuple2!7224) ListLongMap!6139)

(assert (=> b!425434 (= (getCurrentListMapNoExtraKeys!1331 lt!194678 lt!194679 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1302 (getCurrentListMapNoExtraKeys!1331 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7225 k0!794 v!412)))))

(declare-datatypes ((Unit!12479 0))(
  ( (Unit!12480) )
))
(declare-fun lt!194682 () Unit!12479)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!486 (array!25990 array!25988 (_ BitVec 32) (_ BitVec 32) V!15867 V!15867 (_ BitVec 32) (_ BitVec 64) V!15867 (_ BitVec 32) Int) Unit!12479)

(assert (=> b!425434 (= lt!194682 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!486 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425435 () Bool)

(declare-fun e!252549 () Bool)

(assert (=> b!425435 (= e!252549 tp_is_empty!11071)))

(declare-fun b!425436 () Bool)

(assert (=> b!425436 (= e!252550 (and e!252549 mapRes!18228))))

(declare-fun condMapEmpty!18228 () Bool)

(declare-fun mapDefault!18228 () ValueCell!5192)

(assert (=> b!425436 (= condMapEmpty!18228 (= (arr!12443 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5192)) mapDefault!18228)))))

(declare-fun b!425437 () Bool)

(assert (=> b!425437 (= e!252545 e!252546)))

(declare-fun res!249118 () Bool)

(assert (=> b!425437 (=> (not res!249118) (not e!252546))))

(assert (=> b!425437 (= res!249118 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!194681 () ListLongMap!6139)

(assert (=> b!425437 (= lt!194681 (getCurrentListMapNoExtraKeys!1331 lt!194678 lt!194679 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!425437 (= lt!194679 (array!25989 (store (arr!12443 _values!549) i!563 (ValueCellFull!5192 v!412)) (size!12795 _values!549)))))

(declare-fun lt!194680 () ListLongMap!6139)

(assert (=> b!425437 (= lt!194680 (getCurrentListMapNoExtraKeys!1331 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39638 res!249111) b!425432))

(assert (= (and b!425432 res!249112) b!425423))

(assert (= (and b!425423 res!249108) b!425431))

(assert (= (and b!425431 res!249120) b!425430))

(assert (= (and b!425430 res!249114) b!425427))

(assert (= (and b!425427 res!249110) b!425433))

(assert (= (and b!425433 res!249109) b!425426))

(assert (= (and b!425426 res!249116) b!425425))

(assert (= (and b!425425 res!249115) b!425428))

(assert (= (and b!425428 res!249117) b!425429))

(assert (= (and b!425429 res!249113) b!425424))

(assert (= (and b!425424 res!249119) b!425437))

(assert (= (and b!425437 res!249118) b!425434))

(assert (= (and b!425436 condMapEmpty!18228) mapIsEmpty!18228))

(assert (= (and b!425436 (not condMapEmpty!18228)) mapNonEmpty!18228))

(get-info :version)

(assert (= (and mapNonEmpty!18228 ((_ is ValueCellFull!5192) mapValue!18228)) b!425422))

(assert (= (and b!425436 ((_ is ValueCellFull!5192) mapDefault!18228)) b!425435))

(assert (= start!39638 b!425436))

(declare-fun m!414581 () Bool)

(assert (=> b!425428 m!414581))

(declare-fun m!414583 () Bool)

(assert (=> b!425428 m!414583))

(declare-fun m!414585 () Bool)

(assert (=> b!425437 m!414585))

(declare-fun m!414587 () Bool)

(assert (=> b!425437 m!414587))

(declare-fun m!414589 () Bool)

(assert (=> b!425437 m!414589))

(declare-fun m!414591 () Bool)

(assert (=> b!425425 m!414591))

(declare-fun m!414593 () Bool)

(assert (=> b!425426 m!414593))

(declare-fun m!414595 () Bool)

(assert (=> start!39638 m!414595))

(declare-fun m!414597 () Bool)

(assert (=> start!39638 m!414597))

(declare-fun m!414599 () Bool)

(assert (=> b!425430 m!414599))

(declare-fun m!414601 () Bool)

(assert (=> mapNonEmpty!18228 m!414601))

(declare-fun m!414603 () Bool)

(assert (=> b!425433 m!414603))

(declare-fun m!414605 () Bool)

(assert (=> b!425432 m!414605))

(declare-fun m!414607 () Bool)

(assert (=> b!425429 m!414607))

(declare-fun m!414609 () Bool)

(assert (=> b!425431 m!414609))

(declare-fun m!414611 () Bool)

(assert (=> b!425434 m!414611))

(declare-fun m!414613 () Bool)

(assert (=> b!425434 m!414613))

(assert (=> b!425434 m!414613))

(declare-fun m!414615 () Bool)

(assert (=> b!425434 m!414615))

(declare-fun m!414617 () Bool)

(assert (=> b!425434 m!414617))

(check-sat b_and!17589 (not b!425437) (not b!425432) (not b!425425) (not b!425429) (not b!425433) (not b_next!9919) (not b!425431) (not mapNonEmpty!18228) (not b!425428) tp_is_empty!11071 (not b!425430) (not b!425434) (not start!39638))
(check-sat b_and!17589 (not b_next!9919))
