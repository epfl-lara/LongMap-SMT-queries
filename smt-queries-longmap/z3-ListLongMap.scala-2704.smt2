; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40028 () Bool)

(assert start!40028)

(declare-fun b_free!10309 () Bool)

(declare-fun b_next!10309 () Bool)

(assert (=> start!40028 (= b_free!10309 (not b_next!10309))))

(declare-fun tp!36456 () Bool)

(declare-fun b_and!18251 () Bool)

(assert (=> start!40028 (= tp!36456 b_and!18251)))

(declare-fun b!436501 () Bool)

(declare-fun e!257712 () Bool)

(assert (=> b!436501 (= e!257712 (not true))))

(declare-datatypes ((V!16387 0))(
  ( (V!16388 (val!5775 Int)) )
))
(declare-fun minValue!515 () V!16387)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!26743 0))(
  ( (array!26744 (arr!12821 (Array (_ BitVec 32) (_ BitVec 64))) (size!13174 (_ BitVec 32))) )
))
(declare-fun lt!201205 () array!26743)

(declare-datatypes ((ValueCell!5387 0))(
  ( (ValueCellFull!5387 (v!8016 V!16387)) (EmptyCell!5387) )
))
(declare-datatypes ((array!26745 0))(
  ( (array!26746 (arr!12822 (Array (_ BitVec 32) ValueCell!5387)) (size!13175 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26745)

(declare-fun zeroValue!515 () V!16387)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!201202 () array!26745)

(declare-fun v!412 () V!16387)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26743)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7666 0))(
  ( (tuple2!7667 (_1!3844 (_ BitVec 64)) (_2!3844 V!16387)) )
))
(declare-datatypes ((List!7653 0))(
  ( (Nil!7650) (Cons!7649 (h!8505 tuple2!7666) (t!13400 List!7653)) )
))
(declare-datatypes ((ListLongMap!6569 0))(
  ( (ListLongMap!6570 (toList!3300 List!7653)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1499 (array!26743 array!26745 (_ BitVec 32) (_ BitVec 32) V!16387 V!16387 (_ BitVec 32) Int) ListLongMap!6569)

(declare-fun +!1474 (ListLongMap!6569 tuple2!7666) ListLongMap!6569)

(assert (=> b!436501 (= (getCurrentListMapNoExtraKeys!1499 lt!201205 lt!201202 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1474 (getCurrentListMapNoExtraKeys!1499 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7667 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!12965 0))(
  ( (Unit!12966) )
))
(declare-fun lt!201203 () Unit!12965)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!612 (array!26743 array!26745 (_ BitVec 32) (_ BitVec 32) V!16387 V!16387 (_ BitVec 32) (_ BitVec 64) V!16387 (_ BitVec 32) Int) Unit!12965)

(assert (=> b!436501 (= lt!201203 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!612 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!257394 () Bool)

(declare-fun e!257717 () Bool)

(assert (=> start!40028 (=> (not res!257394) (not e!257717))))

(assert (=> start!40028 (= res!257394 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13174 _keys!709))))))

(assert (=> start!40028 e!257717))

(declare-fun tp_is_empty!11461 () Bool)

(assert (=> start!40028 tp_is_empty!11461))

(assert (=> start!40028 tp!36456))

(assert (=> start!40028 true))

(declare-fun e!257718 () Bool)

(declare-fun array_inv!9366 (array!26745) Bool)

(assert (=> start!40028 (and (array_inv!9366 _values!549) e!257718)))

(declare-fun array_inv!9367 (array!26743) Bool)

(assert (=> start!40028 (array_inv!9367 _keys!709)))

(declare-fun b!436502 () Bool)

(declare-fun res!257395 () Bool)

(assert (=> b!436502 (=> (not res!257395) (not e!257717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436502 (= res!257395 (validKeyInArray!0 k0!794))))

(declare-fun b!436503 () Bool)

(declare-fun res!257398 () Bool)

(declare-fun e!257716 () Bool)

(assert (=> b!436503 (=> (not res!257398) (not e!257716))))

(declare-datatypes ((List!7654 0))(
  ( (Nil!7651) (Cons!7650 (h!8506 (_ BitVec 64)) (t!13401 List!7654)) )
))
(declare-fun arrayNoDuplicates!0 (array!26743 (_ BitVec 32) List!7654) Bool)

(assert (=> b!436503 (= res!257398 (arrayNoDuplicates!0 lt!201205 #b00000000000000000000000000000000 Nil!7651))))

(declare-fun b!436504 () Bool)

(declare-fun res!257396 () Bool)

(assert (=> b!436504 (=> (not res!257396) (not e!257717))))

(assert (=> b!436504 (= res!257396 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7651))))

(declare-fun mapIsEmpty!18813 () Bool)

(declare-fun mapRes!18813 () Bool)

(assert (=> mapIsEmpty!18813 mapRes!18813))

(declare-fun b!436505 () Bool)

(assert (=> b!436505 (= e!257717 e!257716)))

(declare-fun res!257399 () Bool)

(assert (=> b!436505 (=> (not res!257399) (not e!257716))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26743 (_ BitVec 32)) Bool)

(assert (=> b!436505 (= res!257399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201205 mask!1025))))

(assert (=> b!436505 (= lt!201205 (array!26744 (store (arr!12821 _keys!709) i!563 k0!794) (size!13174 _keys!709)))))

(declare-fun b!436506 () Bool)

(declare-fun res!257391 () Bool)

(assert (=> b!436506 (=> (not res!257391) (not e!257716))))

(assert (=> b!436506 (= res!257391 (bvsle from!863 i!563))))

(declare-fun b!436507 () Bool)

(declare-fun res!257388 () Bool)

(assert (=> b!436507 (=> (not res!257388) (not e!257717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436507 (= res!257388 (validMask!0 mask!1025))))

(declare-fun b!436508 () Bool)

(declare-fun res!257393 () Bool)

(assert (=> b!436508 (=> (not res!257393) (not e!257717))))

(assert (=> b!436508 (= res!257393 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13174 _keys!709))))))

(declare-fun b!436509 () Bool)

(declare-fun e!257713 () Bool)

(assert (=> b!436509 (= e!257718 (and e!257713 mapRes!18813))))

(declare-fun condMapEmpty!18813 () Bool)

(declare-fun mapDefault!18813 () ValueCell!5387)

(assert (=> b!436509 (= condMapEmpty!18813 (= (arr!12822 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5387)) mapDefault!18813)))))

(declare-fun b!436510 () Bool)

(assert (=> b!436510 (= e!257716 e!257712)))

(declare-fun res!257390 () Bool)

(assert (=> b!436510 (=> (not res!257390) (not e!257712))))

(assert (=> b!436510 (= res!257390 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201206 () ListLongMap!6569)

(assert (=> b!436510 (= lt!201206 (getCurrentListMapNoExtraKeys!1499 lt!201205 lt!201202 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436510 (= lt!201202 (array!26746 (store (arr!12822 _values!549) i!563 (ValueCellFull!5387 v!412)) (size!13175 _values!549)))))

(declare-fun lt!201204 () ListLongMap!6569)

(assert (=> b!436510 (= lt!201204 (getCurrentListMapNoExtraKeys!1499 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!436511 () Bool)

(declare-fun res!257397 () Bool)

(assert (=> b!436511 (=> (not res!257397) (not e!257717))))

(assert (=> b!436511 (= res!257397 (and (= (size!13175 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13174 _keys!709) (size!13175 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436512 () Bool)

(assert (=> b!436512 (= e!257713 tp_is_empty!11461)))

(declare-fun b!436513 () Bool)

(declare-fun res!257389 () Bool)

(assert (=> b!436513 (=> (not res!257389) (not e!257717))))

(assert (=> b!436513 (= res!257389 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436514 () Bool)

(declare-fun e!257715 () Bool)

(assert (=> b!436514 (= e!257715 tp_is_empty!11461)))

(declare-fun mapNonEmpty!18813 () Bool)

(declare-fun tp!36455 () Bool)

(assert (=> mapNonEmpty!18813 (= mapRes!18813 (and tp!36455 e!257715))))

(declare-fun mapRest!18813 () (Array (_ BitVec 32) ValueCell!5387))

(declare-fun mapKey!18813 () (_ BitVec 32))

(declare-fun mapValue!18813 () ValueCell!5387)

(assert (=> mapNonEmpty!18813 (= (arr!12822 _values!549) (store mapRest!18813 mapKey!18813 mapValue!18813))))

(declare-fun b!436515 () Bool)

(declare-fun res!257392 () Bool)

(assert (=> b!436515 (=> (not res!257392) (not e!257717))))

(declare-fun arrayContainsKey!0 (array!26743 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436515 (= res!257392 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436516 () Bool)

(declare-fun res!257400 () Bool)

(assert (=> b!436516 (=> (not res!257400) (not e!257717))))

(assert (=> b!436516 (= res!257400 (or (= (select (arr!12821 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12821 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40028 res!257394) b!436507))

(assert (= (and b!436507 res!257388) b!436511))

(assert (= (and b!436511 res!257397) b!436513))

(assert (= (and b!436513 res!257389) b!436504))

(assert (= (and b!436504 res!257396) b!436508))

(assert (= (and b!436508 res!257393) b!436502))

(assert (= (and b!436502 res!257395) b!436516))

(assert (= (and b!436516 res!257400) b!436515))

(assert (= (and b!436515 res!257392) b!436505))

(assert (= (and b!436505 res!257399) b!436503))

(assert (= (and b!436503 res!257398) b!436506))

(assert (= (and b!436506 res!257391) b!436510))

(assert (= (and b!436510 res!257390) b!436501))

(assert (= (and b!436509 condMapEmpty!18813) mapIsEmpty!18813))

(assert (= (and b!436509 (not condMapEmpty!18813)) mapNonEmpty!18813))

(get-info :version)

(assert (= (and mapNonEmpty!18813 ((_ is ValueCellFull!5387) mapValue!18813)) b!436514))

(assert (= (and b!436509 ((_ is ValueCellFull!5387) mapDefault!18813)) b!436512))

(assert (= start!40028 b!436509))

(declare-fun m!423849 () Bool)

(assert (=> b!436510 m!423849))

(declare-fun m!423851 () Bool)

(assert (=> b!436510 m!423851))

(declare-fun m!423853 () Bool)

(assert (=> b!436510 m!423853))

(declare-fun m!423855 () Bool)

(assert (=> b!436513 m!423855))

(declare-fun m!423857 () Bool)

(assert (=> b!436502 m!423857))

(declare-fun m!423859 () Bool)

(assert (=> b!436504 m!423859))

(declare-fun m!423861 () Bool)

(assert (=> b!436501 m!423861))

(declare-fun m!423863 () Bool)

(assert (=> b!436501 m!423863))

(assert (=> b!436501 m!423863))

(declare-fun m!423865 () Bool)

(assert (=> b!436501 m!423865))

(declare-fun m!423867 () Bool)

(assert (=> b!436501 m!423867))

(declare-fun m!423869 () Bool)

(assert (=> start!40028 m!423869))

(declare-fun m!423871 () Bool)

(assert (=> start!40028 m!423871))

(declare-fun m!423873 () Bool)

(assert (=> b!436505 m!423873))

(declare-fun m!423875 () Bool)

(assert (=> b!436505 m!423875))

(declare-fun m!423877 () Bool)

(assert (=> b!436515 m!423877))

(declare-fun m!423879 () Bool)

(assert (=> mapNonEmpty!18813 m!423879))

(declare-fun m!423881 () Bool)

(assert (=> b!436503 m!423881))

(declare-fun m!423883 () Bool)

(assert (=> b!436507 m!423883))

(declare-fun m!423885 () Bool)

(assert (=> b!436516 m!423885))

(check-sat (not b!436503) (not b!436507) (not start!40028) (not b_next!10309) (not b!436502) (not b!436510) (not mapNonEmpty!18813) (not b!436504) (not b!436513) (not b!436505) (not b!436501) b_and!18251 tp_is_empty!11461 (not b!436515))
(check-sat b_and!18251 (not b_next!10309))
