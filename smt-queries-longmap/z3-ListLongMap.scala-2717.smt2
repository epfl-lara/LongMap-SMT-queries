; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40122 () Bool)

(assert start!40122)

(declare-fun b_free!10389 () Bool)

(declare-fun b_next!10389 () Bool)

(assert (=> start!40122 (= b_free!10389 (not b_next!10389))))

(declare-fun tp!36696 () Bool)

(declare-fun b_and!18357 () Bool)

(assert (=> start!40122 (= tp!36696 b_and!18357)))

(declare-fun b!438692 () Bool)

(declare-fun res!259077 () Bool)

(declare-fun e!258728 () Bool)

(assert (=> b!438692 (=> (not res!259077) (not e!258728))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438692 (= res!259077 (bvsle from!863 i!563))))

(declare-fun b!438693 () Bool)

(declare-fun res!259083 () Bool)

(declare-fun e!258727 () Bool)

(assert (=> b!438693 (=> (not res!259083) (not e!258727))))

(declare-datatypes ((array!26899 0))(
  ( (array!26900 (arr!12899 (Array (_ BitVec 32) (_ BitVec 64))) (size!13251 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26899)

(assert (=> b!438693 (= res!259083 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13251 _keys!709))))))

(declare-fun b!438694 () Bool)

(declare-fun e!258726 () Bool)

(assert (=> b!438694 (= e!258728 e!258726)))

(declare-fun res!259087 () Bool)

(assert (=> b!438694 (=> (not res!259087) (not e!258726))))

(assert (=> b!438694 (= res!259087 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!16493 0))(
  ( (V!16494 (val!5815 Int)) )
))
(declare-fun minValue!515 () V!16493)

(declare-fun zeroValue!515 () V!16493)

(declare-datatypes ((ValueCell!5427 0))(
  ( (ValueCellFull!5427 (v!8062 V!16493)) (EmptyCell!5427) )
))
(declare-datatypes ((array!26901 0))(
  ( (array!26902 (arr!12900 (Array (_ BitVec 32) ValueCell!5427)) (size!13252 (_ BitVec 32))) )
))
(declare-fun lt!202038 () array!26901)

(declare-datatypes ((tuple2!7716 0))(
  ( (tuple2!7717 (_1!3869 (_ BitVec 64)) (_2!3869 V!16493)) )
))
(declare-datatypes ((List!7714 0))(
  ( (Nil!7711) (Cons!7710 (h!8566 tuple2!7716) (t!13470 List!7714)) )
))
(declare-datatypes ((ListLongMap!6629 0))(
  ( (ListLongMap!6630 (toList!3330 List!7714)) )
))
(declare-fun lt!202039 () ListLongMap!6629)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!202040 () array!26899)

(declare-fun getCurrentListMapNoExtraKeys!1519 (array!26899 array!26901 (_ BitVec 32) (_ BitVec 32) V!16493 V!16493 (_ BitVec 32) Int) ListLongMap!6629)

(assert (=> b!438694 (= lt!202039 (getCurrentListMapNoExtraKeys!1519 lt!202040 lt!202038 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26901)

(declare-fun v!412 () V!16493)

(assert (=> b!438694 (= lt!202038 (array!26902 (store (arr!12900 _values!549) i!563 (ValueCellFull!5427 v!412)) (size!13252 _values!549)))))

(declare-fun lt!202036 () ListLongMap!6629)

(assert (=> b!438694 (= lt!202036 (getCurrentListMapNoExtraKeys!1519 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438695 () Bool)

(declare-fun res!259081 () Bool)

(assert (=> b!438695 (=> (not res!259081) (not e!258727))))

(declare-datatypes ((List!7715 0))(
  ( (Nil!7712) (Cons!7711 (h!8567 (_ BitVec 64)) (t!13471 List!7715)) )
))
(declare-fun arrayNoDuplicates!0 (array!26899 (_ BitVec 32) List!7715) Bool)

(assert (=> b!438695 (= res!259081 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7712))))

(declare-fun b!438696 () Bool)

(declare-fun res!259082 () Bool)

(assert (=> b!438696 (=> (not res!259082) (not e!258727))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26899 (_ BitVec 32)) Bool)

(assert (=> b!438696 (= res!259082 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438697 () Bool)

(assert (=> b!438697 (= e!258727 e!258728)))

(declare-fun res!259080 () Bool)

(assert (=> b!438697 (=> (not res!259080) (not e!258728))))

(assert (=> b!438697 (= res!259080 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202040 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!438697 (= lt!202040 (array!26900 (store (arr!12899 _keys!709) i!563 k0!794) (size!13251 _keys!709)))))

(declare-fun b!438698 () Bool)

(declare-fun e!258732 () Bool)

(declare-fun e!258729 () Bool)

(declare-fun mapRes!18933 () Bool)

(assert (=> b!438698 (= e!258732 (and e!258729 mapRes!18933))))

(declare-fun condMapEmpty!18933 () Bool)

(declare-fun mapDefault!18933 () ValueCell!5427)

(assert (=> b!438698 (= condMapEmpty!18933 (= (arr!12900 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5427)) mapDefault!18933)))))

(declare-fun b!438699 () Bool)

(declare-fun res!259088 () Bool)

(assert (=> b!438699 (=> (not res!259088) (not e!258727))))

(assert (=> b!438699 (= res!259088 (and (= (size!13252 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13251 _keys!709) (size!13252 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!259078 () Bool)

(assert (=> start!40122 (=> (not res!259078) (not e!258727))))

(assert (=> start!40122 (= res!259078 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13251 _keys!709))))))

(assert (=> start!40122 e!258727))

(declare-fun tp_is_empty!11541 () Bool)

(assert (=> start!40122 tp_is_empty!11541))

(assert (=> start!40122 tp!36696))

(assert (=> start!40122 true))

(declare-fun array_inv!9368 (array!26901) Bool)

(assert (=> start!40122 (and (array_inv!9368 _values!549) e!258732)))

(declare-fun array_inv!9369 (array!26899) Bool)

(assert (=> start!40122 (array_inv!9369 _keys!709)))

(declare-fun b!438700 () Bool)

(declare-fun e!258731 () Bool)

(assert (=> b!438700 (= e!258731 tp_is_empty!11541)))

(declare-fun b!438701 () Bool)

(declare-fun res!259085 () Bool)

(assert (=> b!438701 (=> (not res!259085) (not e!258727))))

(assert (=> b!438701 (= res!259085 (or (= (select (arr!12899 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12899 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438702 () Bool)

(declare-fun res!259086 () Bool)

(assert (=> b!438702 (=> (not res!259086) (not e!258727))))

(declare-fun arrayContainsKey!0 (array!26899 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438702 (= res!259086 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18933 () Bool)

(declare-fun tp!36695 () Bool)

(assert (=> mapNonEmpty!18933 (= mapRes!18933 (and tp!36695 e!258731))))

(declare-fun mapKey!18933 () (_ BitVec 32))

(declare-fun mapValue!18933 () ValueCell!5427)

(declare-fun mapRest!18933 () (Array (_ BitVec 32) ValueCell!5427))

(assert (=> mapNonEmpty!18933 (= (arr!12900 _values!549) (store mapRest!18933 mapKey!18933 mapValue!18933))))

(declare-fun mapIsEmpty!18933 () Bool)

(assert (=> mapIsEmpty!18933 mapRes!18933))

(declare-fun b!438703 () Bool)

(declare-fun res!259089 () Bool)

(assert (=> b!438703 (=> (not res!259089) (not e!258728))))

(assert (=> b!438703 (= res!259089 (arrayNoDuplicates!0 lt!202040 #b00000000000000000000000000000000 Nil!7712))))

(declare-fun b!438704 () Bool)

(assert (=> b!438704 (= e!258729 tp_is_empty!11541)))

(declare-fun b!438705 () Bool)

(declare-fun res!259084 () Bool)

(assert (=> b!438705 (=> (not res!259084) (not e!258727))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438705 (= res!259084 (validMask!0 mask!1025))))

(declare-fun b!438706 () Bool)

(assert (=> b!438706 (= e!258726 (not true))))

(declare-fun +!1473 (ListLongMap!6629 tuple2!7716) ListLongMap!6629)

(assert (=> b!438706 (= (getCurrentListMapNoExtraKeys!1519 lt!202040 lt!202038 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1473 (getCurrentListMapNoExtraKeys!1519 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7717 k0!794 v!412)))))

(declare-datatypes ((Unit!13050 0))(
  ( (Unit!13051) )
))
(declare-fun lt!202037 () Unit!13050)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!642 (array!26899 array!26901 (_ BitVec 32) (_ BitVec 32) V!16493 V!16493 (_ BitVec 32) (_ BitVec 64) V!16493 (_ BitVec 32) Int) Unit!13050)

(assert (=> b!438706 (= lt!202037 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!642 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438707 () Bool)

(declare-fun res!259079 () Bool)

(assert (=> b!438707 (=> (not res!259079) (not e!258727))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438707 (= res!259079 (validKeyInArray!0 k0!794))))

(assert (= (and start!40122 res!259078) b!438705))

(assert (= (and b!438705 res!259084) b!438699))

(assert (= (and b!438699 res!259088) b!438696))

(assert (= (and b!438696 res!259082) b!438695))

(assert (= (and b!438695 res!259081) b!438693))

(assert (= (and b!438693 res!259083) b!438707))

(assert (= (and b!438707 res!259079) b!438701))

(assert (= (and b!438701 res!259085) b!438702))

(assert (= (and b!438702 res!259086) b!438697))

(assert (= (and b!438697 res!259080) b!438703))

(assert (= (and b!438703 res!259089) b!438692))

(assert (= (and b!438692 res!259077) b!438694))

(assert (= (and b!438694 res!259087) b!438706))

(assert (= (and b!438698 condMapEmpty!18933) mapIsEmpty!18933))

(assert (= (and b!438698 (not condMapEmpty!18933)) mapNonEmpty!18933))

(get-info :version)

(assert (= (and mapNonEmpty!18933 ((_ is ValueCellFull!5427) mapValue!18933)) b!438700))

(assert (= (and b!438698 ((_ is ValueCellFull!5427) mapDefault!18933)) b!438704))

(assert (= start!40122 b!438698))

(declare-fun m!426101 () Bool)

(assert (=> b!438694 m!426101))

(declare-fun m!426103 () Bool)

(assert (=> b!438694 m!426103))

(declare-fun m!426105 () Bool)

(assert (=> b!438694 m!426105))

(declare-fun m!426107 () Bool)

(assert (=> start!40122 m!426107))

(declare-fun m!426109 () Bool)

(assert (=> start!40122 m!426109))

(declare-fun m!426111 () Bool)

(assert (=> b!438695 m!426111))

(declare-fun m!426113 () Bool)

(assert (=> b!438703 m!426113))

(declare-fun m!426115 () Bool)

(assert (=> b!438705 m!426115))

(declare-fun m!426117 () Bool)

(assert (=> b!438706 m!426117))

(declare-fun m!426119 () Bool)

(assert (=> b!438706 m!426119))

(assert (=> b!438706 m!426119))

(declare-fun m!426121 () Bool)

(assert (=> b!438706 m!426121))

(declare-fun m!426123 () Bool)

(assert (=> b!438706 m!426123))

(declare-fun m!426125 () Bool)

(assert (=> b!438702 m!426125))

(declare-fun m!426127 () Bool)

(assert (=> b!438697 m!426127))

(declare-fun m!426129 () Bool)

(assert (=> b!438697 m!426129))

(declare-fun m!426131 () Bool)

(assert (=> mapNonEmpty!18933 m!426131))

(declare-fun m!426133 () Bool)

(assert (=> b!438696 m!426133))

(declare-fun m!426135 () Bool)

(assert (=> b!438701 m!426135))

(declare-fun m!426137 () Bool)

(assert (=> b!438707 m!426137))

(check-sat (not start!40122) (not b!438695) (not b!438702) (not b!438706) (not b_next!10389) b_and!18357 (not b!438705) (not b!438703) (not b!438694) (not b!438707) (not b!438697) (not mapNonEmpty!18933) (not b!438696) tp_is_empty!11541)
(check-sat b_and!18357 (not b_next!10389))
