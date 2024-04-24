; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39650 () Bool)

(assert start!39650)

(declare-fun b_free!9931 () Bool)

(declare-fun b_next!9931 () Bool)

(assert (=> start!39650 (= b_free!9931 (not b_next!9931))))

(declare-fun tp!35321 () Bool)

(declare-fun b_and!17601 () Bool)

(assert (=> start!39650 (= tp!35321 b_and!17601)))

(declare-fun b!425710 () Bool)

(declare-fun e!252675 () Bool)

(declare-fun tp_is_empty!11083 () Bool)

(assert (=> b!425710 (= e!252675 tp_is_empty!11083)))

(declare-fun b!425711 () Bool)

(declare-fun e!252671 () Bool)

(declare-fun e!252670 () Bool)

(assert (=> b!425711 (= e!252671 e!252670)))

(declare-fun res!249349 () Bool)

(assert (=> b!425711 (=> (not res!249349) (not e!252670))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!425711 (= res!249349 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15883 0))(
  ( (V!15884 (val!5586 Int)) )
))
(declare-datatypes ((ValueCell!5198 0))(
  ( (ValueCellFull!5198 (v!7834 V!15883)) (EmptyCell!5198) )
))
(declare-datatypes ((array!26012 0))(
  ( (array!26013 (arr!12455 (Array (_ BitVec 32) ValueCell!5198)) (size!12807 (_ BitVec 32))) )
))
(declare-fun lt!194771 () array!26012)

(declare-fun minValue!515 () V!15883)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7232 0))(
  ( (tuple2!7233 (_1!3627 (_ BitVec 64)) (_2!3627 V!15883)) )
))
(declare-datatypes ((List!7241 0))(
  ( (Nil!7238) (Cons!7237 (h!8093 tuple2!7232) (t!12677 List!7241)) )
))
(declare-datatypes ((ListLongMap!6147 0))(
  ( (ListLongMap!6148 (toList!3089 List!7241)) )
))
(declare-fun lt!194770 () ListLongMap!6147)

(declare-fun zeroValue!515 () V!15883)

(declare-datatypes ((array!26014 0))(
  ( (array!26015 (arr!12456 (Array (_ BitVec 32) (_ BitVec 64))) (size!12808 (_ BitVec 32))) )
))
(declare-fun lt!194769 () array!26014)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1335 (array!26014 array!26012 (_ BitVec 32) (_ BitVec 32) V!15883 V!15883 (_ BitVec 32) Int) ListLongMap!6147)

(assert (=> b!425711 (= lt!194770 (getCurrentListMapNoExtraKeys!1335 lt!194769 lt!194771 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26012)

(declare-fun v!412 () V!15883)

(assert (=> b!425711 (= lt!194771 (array!26013 (store (arr!12455 _values!549) i!563 (ValueCellFull!5198 v!412)) (size!12807 _values!549)))))

(declare-fun _keys!709 () array!26014)

(declare-fun lt!194768 () ListLongMap!6147)

(assert (=> b!425711 (= lt!194768 (getCurrentListMapNoExtraKeys!1335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!425713 () Bool)

(declare-fun e!252672 () Bool)

(assert (=> b!425713 (= e!252672 tp_is_empty!11083)))

(declare-fun b!425714 () Bool)

(declare-fun res!249354 () Bool)

(declare-fun e!252673 () Bool)

(assert (=> b!425714 (=> (not res!249354) (not e!252673))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!425714 (= res!249354 (validKeyInArray!0 k0!794))))

(declare-fun b!425715 () Bool)

(assert (=> b!425715 (= e!252670 (not true))))

(declare-fun +!1305 (ListLongMap!6147 tuple2!7232) ListLongMap!6147)

(assert (=> b!425715 (= (getCurrentListMapNoExtraKeys!1335 lt!194769 lt!194771 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1305 (getCurrentListMapNoExtraKeys!1335 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7233 k0!794 v!412)))))

(declare-datatypes ((Unit!12485 0))(
  ( (Unit!12486) )
))
(declare-fun lt!194772 () Unit!12485)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!489 (array!26014 array!26012 (_ BitVec 32) (_ BitVec 32) V!15883 V!15883 (_ BitVec 32) (_ BitVec 64) V!15883 (_ BitVec 32) Int) Unit!12485)

(assert (=> b!425715 (= lt!194772 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!489 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!425716 () Bool)

(declare-fun res!249345 () Bool)

(assert (=> b!425716 (=> (not res!249345) (not e!252673))))

(assert (=> b!425716 (= res!249345 (and (= (size!12807 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12808 _keys!709) (size!12807 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!425717 () Bool)

(declare-fun res!249351 () Bool)

(assert (=> b!425717 (=> (not res!249351) (not e!252671))))

(declare-datatypes ((List!7242 0))(
  ( (Nil!7239) (Cons!7238 (h!8094 (_ BitVec 64)) (t!12678 List!7242)) )
))
(declare-fun arrayNoDuplicates!0 (array!26014 (_ BitVec 32) List!7242) Bool)

(assert (=> b!425717 (= res!249351 (arrayNoDuplicates!0 lt!194769 #b00000000000000000000000000000000 Nil!7239))))

(declare-fun b!425718 () Bool)

(declare-fun res!249353 () Bool)

(assert (=> b!425718 (=> (not res!249353) (not e!252673))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!425718 (= res!249353 (validMask!0 mask!1025))))

(declare-fun b!425719 () Bool)

(declare-fun res!249346 () Bool)

(assert (=> b!425719 (=> (not res!249346) (not e!252673))))

(declare-fun arrayContainsKey!0 (array!26014 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!425719 (= res!249346 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!425720 () Bool)

(declare-fun res!249350 () Bool)

(assert (=> b!425720 (=> (not res!249350) (not e!252671))))

(assert (=> b!425720 (= res!249350 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!18246 () Bool)

(declare-fun mapRes!18246 () Bool)

(assert (=> mapIsEmpty!18246 mapRes!18246))

(declare-fun b!425721 () Bool)

(assert (=> b!425721 (= e!252673 e!252671)))

(declare-fun res!249344 () Bool)

(assert (=> b!425721 (=> (not res!249344) (not e!252671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26014 (_ BitVec 32)) Bool)

(assert (=> b!425721 (= res!249344 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194769 mask!1025))))

(assert (=> b!425721 (= lt!194769 (array!26015 (store (arr!12456 _keys!709) i!563 k0!794) (size!12808 _keys!709)))))

(declare-fun b!425722 () Bool)

(declare-fun res!249347 () Bool)

(assert (=> b!425722 (=> (not res!249347) (not e!252673))))

(assert (=> b!425722 (= res!249347 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12808 _keys!709))))))

(declare-fun b!425723 () Bool)

(declare-fun e!252674 () Bool)

(assert (=> b!425723 (= e!252674 (and e!252675 mapRes!18246))))

(declare-fun condMapEmpty!18246 () Bool)

(declare-fun mapDefault!18246 () ValueCell!5198)

(assert (=> b!425723 (= condMapEmpty!18246 (= (arr!12455 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5198)) mapDefault!18246)))))

(declare-fun mapNonEmpty!18246 () Bool)

(declare-fun tp!35322 () Bool)

(assert (=> mapNonEmpty!18246 (= mapRes!18246 (and tp!35322 e!252672))))

(declare-fun mapKey!18246 () (_ BitVec 32))

(declare-fun mapValue!18246 () ValueCell!5198)

(declare-fun mapRest!18246 () (Array (_ BitVec 32) ValueCell!5198))

(assert (=> mapNonEmpty!18246 (= (arr!12455 _values!549) (store mapRest!18246 mapKey!18246 mapValue!18246))))

(declare-fun b!425712 () Bool)

(declare-fun res!249342 () Bool)

(assert (=> b!425712 (=> (not res!249342) (not e!252673))))

(assert (=> b!425712 (= res!249342 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun res!249343 () Bool)

(assert (=> start!39650 (=> (not res!249343) (not e!252673))))

(assert (=> start!39650 (= res!249343 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12808 _keys!709))))))

(assert (=> start!39650 e!252673))

(assert (=> start!39650 tp_is_empty!11083))

(assert (=> start!39650 tp!35321))

(assert (=> start!39650 true))

(declare-fun array_inv!9150 (array!26012) Bool)

(assert (=> start!39650 (and (array_inv!9150 _values!549) e!252674)))

(declare-fun array_inv!9151 (array!26014) Bool)

(assert (=> start!39650 (array_inv!9151 _keys!709)))

(declare-fun b!425724 () Bool)

(declare-fun res!249348 () Bool)

(assert (=> b!425724 (=> (not res!249348) (not e!252673))))

(assert (=> b!425724 (= res!249348 (or (= (select (arr!12456 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12456 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!425725 () Bool)

(declare-fun res!249352 () Bool)

(assert (=> b!425725 (=> (not res!249352) (not e!252673))))

(assert (=> b!425725 (= res!249352 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7239))))

(assert (= (and start!39650 res!249343) b!425718))

(assert (= (and b!425718 res!249353) b!425716))

(assert (= (and b!425716 res!249345) b!425712))

(assert (= (and b!425712 res!249342) b!425725))

(assert (= (and b!425725 res!249352) b!425722))

(assert (= (and b!425722 res!249347) b!425714))

(assert (= (and b!425714 res!249354) b!425724))

(assert (= (and b!425724 res!249348) b!425719))

(assert (= (and b!425719 res!249346) b!425721))

(assert (= (and b!425721 res!249344) b!425717))

(assert (= (and b!425717 res!249351) b!425720))

(assert (= (and b!425720 res!249350) b!425711))

(assert (= (and b!425711 res!249349) b!425715))

(assert (= (and b!425723 condMapEmpty!18246) mapIsEmpty!18246))

(assert (= (and b!425723 (not condMapEmpty!18246)) mapNonEmpty!18246))

(get-info :version)

(assert (= (and mapNonEmpty!18246 ((_ is ValueCellFull!5198) mapValue!18246)) b!425713))

(assert (= (and b!425723 ((_ is ValueCellFull!5198) mapDefault!18246)) b!425710))

(assert (= start!39650 b!425723))

(declare-fun m!414809 () Bool)

(assert (=> b!425715 m!414809))

(declare-fun m!414811 () Bool)

(assert (=> b!425715 m!414811))

(assert (=> b!425715 m!414811))

(declare-fun m!414813 () Bool)

(assert (=> b!425715 m!414813))

(declare-fun m!414815 () Bool)

(assert (=> b!425715 m!414815))

(declare-fun m!414817 () Bool)

(assert (=> b!425718 m!414817))

(declare-fun m!414819 () Bool)

(assert (=> b!425724 m!414819))

(declare-fun m!414821 () Bool)

(assert (=> b!425712 m!414821))

(declare-fun m!414823 () Bool)

(assert (=> b!425725 m!414823))

(declare-fun m!414825 () Bool)

(assert (=> b!425721 m!414825))

(declare-fun m!414827 () Bool)

(assert (=> b!425721 m!414827))

(declare-fun m!414829 () Bool)

(assert (=> start!39650 m!414829))

(declare-fun m!414831 () Bool)

(assert (=> start!39650 m!414831))

(declare-fun m!414833 () Bool)

(assert (=> b!425711 m!414833))

(declare-fun m!414835 () Bool)

(assert (=> b!425711 m!414835))

(declare-fun m!414837 () Bool)

(assert (=> b!425711 m!414837))

(declare-fun m!414839 () Bool)

(assert (=> b!425717 m!414839))

(declare-fun m!414841 () Bool)

(assert (=> mapNonEmpty!18246 m!414841))

(declare-fun m!414843 () Bool)

(assert (=> b!425714 m!414843))

(declare-fun m!414845 () Bool)

(assert (=> b!425719 m!414845))

(check-sat (not mapNonEmpty!18246) tp_is_empty!11083 b_and!17601 (not b!425717) (not b!425719) (not start!39650) (not b!425714) (not b!425715) (not b!425718) (not b!425721) (not b!425711) (not b_next!9931) (not b!425725) (not b!425712))
(check-sat b_and!17601 (not b_next!9931))
