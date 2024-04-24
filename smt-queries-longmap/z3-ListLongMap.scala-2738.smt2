; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40232 () Bool)

(assert start!40232)

(declare-fun b_free!10513 () Bool)

(declare-fun b_next!10513 () Bool)

(assert (=> start!40232 (= b_free!10513 (not b_next!10513))))

(declare-fun tp!37068 () Bool)

(declare-fun b_and!18495 () Bool)

(assert (=> start!40232 (= tp!37068 b_and!18495)))

(declare-fun b!441619 () Bool)

(declare-fun res!261495 () Bool)

(declare-fun e!260002 () Bool)

(assert (=> b!441619 (=> (not res!261495) (not e!260002))))

(declare-datatypes ((array!27148 0))(
  ( (array!27149 (arr!13023 (Array (_ BitVec 32) (_ BitVec 64))) (size!13375 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27148)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27148 (_ BitVec 32)) Bool)

(assert (=> b!441619 (= res!261495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!441620 () Bool)

(declare-fun res!261501 () Bool)

(assert (=> b!441620 (=> (not res!261501) (not e!260002))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27148 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!441620 (= res!261501 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!441621 () Bool)

(declare-fun e!259998 () Bool)

(declare-fun tp_is_empty!11665 () Bool)

(assert (=> b!441621 (= e!259998 tp_is_empty!11665)))

(declare-fun b!441622 () Bool)

(declare-fun e!259997 () Bool)

(assert (=> b!441622 (= e!260002 e!259997)))

(declare-fun res!261504 () Bool)

(assert (=> b!441622 (=> (not res!261504) (not e!259997))))

(declare-fun lt!202989 () array!27148)

(assert (=> b!441622 (= res!261504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202989 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!441622 (= lt!202989 (array!27149 (store (arr!13023 _keys!709) i!563 k0!794) (size!13375 _keys!709)))))

(declare-fun b!441623 () Bool)

(declare-fun e!259999 () Bool)

(assert (=> b!441623 (= e!259997 e!259999)))

(declare-fun res!261493 () Bool)

(assert (=> b!441623 (=> (not res!261493) (not e!259999))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!441623 (= res!261493 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16659 0))(
  ( (V!16660 (val!5877 Int)) )
))
(declare-datatypes ((tuple2!7724 0))(
  ( (tuple2!7725 (_1!3873 (_ BitVec 64)) (_2!3873 V!16659)) )
))
(declare-datatypes ((List!7714 0))(
  ( (Nil!7711) (Cons!7710 (h!8566 tuple2!7724) (t!13462 List!7714)) )
))
(declare-datatypes ((ListLongMap!6639 0))(
  ( (ListLongMap!6640 (toList!3335 List!7714)) )
))
(declare-fun lt!202985 () ListLongMap!6639)

(declare-fun minValue!515 () V!16659)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5489 0))(
  ( (ValueCellFull!5489 (v!8125 V!16659)) (EmptyCell!5489) )
))
(declare-datatypes ((array!27150 0))(
  ( (array!27151 (arr!13024 (Array (_ BitVec 32) ValueCell!5489)) (size!13376 (_ BitVec 32))) )
))
(declare-fun lt!202988 () array!27150)

(declare-fun zeroValue!515 () V!16659)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1568 (array!27148 array!27150 (_ BitVec 32) (_ BitVec 32) V!16659 V!16659 (_ BitVec 32) Int) ListLongMap!6639)

(assert (=> b!441623 (= lt!202985 (getCurrentListMapNoExtraKeys!1568 lt!202989 lt!202988 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!27150)

(declare-fun v!412 () V!16659)

(assert (=> b!441623 (= lt!202988 (array!27151 (store (arr!13024 _values!549) i!563 (ValueCellFull!5489 v!412)) (size!13376 _values!549)))))

(declare-fun lt!202987 () ListLongMap!6639)

(assert (=> b!441623 (= lt!202987 (getCurrentListMapNoExtraKeys!1568 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!441624 () Bool)

(declare-fun res!261494 () Bool)

(assert (=> b!441624 (=> (not res!261494) (not e!260002))))

(assert (=> b!441624 (= res!261494 (or (= (select (arr!13023 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13023 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!441625 () Bool)

(declare-fun res!261496 () Bool)

(assert (=> b!441625 (=> (not res!261496) (not e!260002))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!441625 (= res!261496 (validMask!0 mask!1025))))

(declare-fun b!441626 () Bool)

(declare-fun res!261502 () Bool)

(assert (=> b!441626 (=> (not res!261502) (not e!260002))))

(assert (=> b!441626 (= res!261502 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13375 _keys!709))))))

(declare-fun b!441627 () Bool)

(declare-fun res!261499 () Bool)

(assert (=> b!441627 (=> (not res!261499) (not e!260002))))

(declare-datatypes ((List!7715 0))(
  ( (Nil!7712) (Cons!7711 (h!8567 (_ BitVec 64)) (t!13463 List!7715)) )
))
(declare-fun arrayNoDuplicates!0 (array!27148 (_ BitVec 32) List!7715) Bool)

(assert (=> b!441627 (= res!261499 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7712))))

(declare-fun mapIsEmpty!19119 () Bool)

(declare-fun mapRes!19119 () Bool)

(assert (=> mapIsEmpty!19119 mapRes!19119))

(declare-fun b!441628 () Bool)

(declare-fun e!259996 () Bool)

(assert (=> b!441628 (= e!259996 tp_is_empty!11665)))

(declare-fun b!441630 () Bool)

(declare-fun res!261498 () Bool)

(assert (=> b!441630 (=> (not res!261498) (not e!259997))))

(assert (=> b!441630 (= res!261498 (bvsle from!863 i!563))))

(declare-fun b!441631 () Bool)

(declare-fun res!261503 () Bool)

(assert (=> b!441631 (=> (not res!261503) (not e!259997))))

(assert (=> b!441631 (= res!261503 (arrayNoDuplicates!0 lt!202989 #b00000000000000000000000000000000 Nil!7712))))

(declare-fun b!441632 () Bool)

(declare-fun e!260000 () Bool)

(assert (=> b!441632 (= e!260000 (and e!259998 mapRes!19119))))

(declare-fun condMapEmpty!19119 () Bool)

(declare-fun mapDefault!19119 () ValueCell!5489)

(assert (=> b!441632 (= condMapEmpty!19119 (= (arr!13024 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5489)) mapDefault!19119)))))

(declare-fun b!441633 () Bool)

(declare-fun res!261500 () Bool)

(assert (=> b!441633 (=> (not res!261500) (not e!260002))))

(assert (=> b!441633 (= res!261500 (and (= (size!13376 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13375 _keys!709) (size!13376 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19119 () Bool)

(declare-fun tp!37067 () Bool)

(assert (=> mapNonEmpty!19119 (= mapRes!19119 (and tp!37067 e!259996))))

(declare-fun mapValue!19119 () ValueCell!5489)

(declare-fun mapRest!19119 () (Array (_ BitVec 32) ValueCell!5489))

(declare-fun mapKey!19119 () (_ BitVec 32))

(assert (=> mapNonEmpty!19119 (= (arr!13024 _values!549) (store mapRest!19119 mapKey!19119 mapValue!19119))))

(declare-fun b!441634 () Bool)

(assert (=> b!441634 (= e!259999 (not true))))

(declare-fun +!1522 (ListLongMap!6639 tuple2!7724) ListLongMap!6639)

(assert (=> b!441634 (= (getCurrentListMapNoExtraKeys!1568 lt!202989 lt!202988 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1522 (getCurrentListMapNoExtraKeys!1568 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7725 k0!794 v!412)))))

(declare-datatypes ((Unit!13119 0))(
  ( (Unit!13120) )
))
(declare-fun lt!202986 () Unit!13119)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!682 (array!27148 array!27150 (_ BitVec 32) (_ BitVec 32) V!16659 V!16659 (_ BitVec 32) (_ BitVec 64) V!16659 (_ BitVec 32) Int) Unit!13119)

(assert (=> b!441634 (= lt!202986 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!682 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!441629 () Bool)

(declare-fun res!261492 () Bool)

(assert (=> b!441629 (=> (not res!261492) (not e!260002))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!441629 (= res!261492 (validKeyInArray!0 k0!794))))

(declare-fun res!261497 () Bool)

(assert (=> start!40232 (=> (not res!261497) (not e!260002))))

(assert (=> start!40232 (= res!261497 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13375 _keys!709))))))

(assert (=> start!40232 e!260002))

(assert (=> start!40232 tp_is_empty!11665))

(assert (=> start!40232 tp!37068))

(assert (=> start!40232 true))

(declare-fun array_inv!9516 (array!27150) Bool)

(assert (=> start!40232 (and (array_inv!9516 _values!549) e!260000)))

(declare-fun array_inv!9517 (array!27148) Bool)

(assert (=> start!40232 (array_inv!9517 _keys!709)))

(assert (= (and start!40232 res!261497) b!441625))

(assert (= (and b!441625 res!261496) b!441633))

(assert (= (and b!441633 res!261500) b!441619))

(assert (= (and b!441619 res!261495) b!441627))

(assert (= (and b!441627 res!261499) b!441626))

(assert (= (and b!441626 res!261502) b!441629))

(assert (= (and b!441629 res!261492) b!441624))

(assert (= (and b!441624 res!261494) b!441620))

(assert (= (and b!441620 res!261501) b!441622))

(assert (= (and b!441622 res!261504) b!441631))

(assert (= (and b!441631 res!261503) b!441630))

(assert (= (and b!441630 res!261498) b!441623))

(assert (= (and b!441623 res!261493) b!441634))

(assert (= (and b!441632 condMapEmpty!19119) mapIsEmpty!19119))

(assert (= (and b!441632 (not condMapEmpty!19119)) mapNonEmpty!19119))

(get-info :version)

(assert (= (and mapNonEmpty!19119 ((_ is ValueCellFull!5489) mapValue!19119)) b!441628))

(assert (= (and b!441632 ((_ is ValueCellFull!5489) mapDefault!19119)) b!441621))

(assert (= start!40232 b!441632))

(declare-fun m!428675 () Bool)

(assert (=> b!441623 m!428675))

(declare-fun m!428677 () Bool)

(assert (=> b!441623 m!428677))

(declare-fun m!428679 () Bool)

(assert (=> b!441623 m!428679))

(declare-fun m!428681 () Bool)

(assert (=> start!40232 m!428681))

(declare-fun m!428683 () Bool)

(assert (=> start!40232 m!428683))

(declare-fun m!428685 () Bool)

(assert (=> b!441627 m!428685))

(declare-fun m!428687 () Bool)

(assert (=> b!441625 m!428687))

(declare-fun m!428689 () Bool)

(assert (=> b!441619 m!428689))

(declare-fun m!428691 () Bool)

(assert (=> b!441629 m!428691))

(declare-fun m!428693 () Bool)

(assert (=> b!441622 m!428693))

(declare-fun m!428695 () Bool)

(assert (=> b!441622 m!428695))

(declare-fun m!428697 () Bool)

(assert (=> b!441634 m!428697))

(declare-fun m!428699 () Bool)

(assert (=> b!441634 m!428699))

(assert (=> b!441634 m!428699))

(declare-fun m!428701 () Bool)

(assert (=> b!441634 m!428701))

(declare-fun m!428703 () Bool)

(assert (=> b!441634 m!428703))

(declare-fun m!428705 () Bool)

(assert (=> b!441624 m!428705))

(declare-fun m!428707 () Bool)

(assert (=> b!441620 m!428707))

(declare-fun m!428709 () Bool)

(assert (=> b!441631 m!428709))

(declare-fun m!428711 () Bool)

(assert (=> mapNonEmpty!19119 m!428711))

(check-sat (not b!441627) tp_is_empty!11665 (not mapNonEmpty!19119) (not b!441620) (not b!441634) (not b!441623) (not b!441622) (not b_next!10513) (not b!441625) (not start!40232) (not b!441629) (not b!441619) b_and!18495 (not b!441631))
(check-sat b_and!18495 (not b_next!10513))
