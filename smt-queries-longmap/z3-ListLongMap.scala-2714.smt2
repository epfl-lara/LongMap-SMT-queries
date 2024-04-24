; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40088 () Bool)

(assert start!40088)

(declare-fun b_free!10369 () Bool)

(declare-fun b_next!10369 () Bool)

(assert (=> start!40088 (= b_free!10369 (not b_next!10369))))

(declare-fun tp!36635 () Bool)

(declare-fun b_and!18351 () Bool)

(assert (=> start!40088 (= tp!36635 b_and!18351)))

(declare-fun b!438163 () Bool)

(declare-fun e!258486 () Bool)

(declare-fun e!258485 () Bool)

(assert (=> b!438163 (= e!258486 e!258485)))

(declare-fun res!258690 () Bool)

(assert (=> b!438163 (=> (not res!258690) (not e!258485))))

(declare-datatypes ((array!26864 0))(
  ( (array!26865 (arr!12881 (Array (_ BitVec 32) (_ BitVec 64))) (size!13233 (_ BitVec 32))) )
))
(declare-fun lt!201907 () array!26864)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26864 (_ BitVec 32)) Bool)

(assert (=> b!438163 (= res!258690 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201907 mask!1025))))

(declare-fun _keys!709 () array!26864)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438163 (= lt!201907 (array!26865 (store (arr!12881 _keys!709) i!563 k0!794) (size!13233 _keys!709)))))

(declare-fun mapNonEmpty!18903 () Bool)

(declare-fun mapRes!18903 () Bool)

(declare-fun tp!36636 () Bool)

(declare-fun e!258484 () Bool)

(assert (=> mapNonEmpty!18903 (= mapRes!18903 (and tp!36636 e!258484))))

(declare-datatypes ((V!16467 0))(
  ( (V!16468 (val!5805 Int)) )
))
(declare-datatypes ((ValueCell!5417 0))(
  ( (ValueCellFull!5417 (v!8053 V!16467)) (EmptyCell!5417) )
))
(declare-fun mapRest!18903 () (Array (_ BitVec 32) ValueCell!5417))

(declare-datatypes ((array!26866 0))(
  ( (array!26867 (arr!12882 (Array (_ BitVec 32) ValueCell!5417)) (size!13234 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26866)

(declare-fun mapValue!18903 () ValueCell!5417)

(declare-fun mapKey!18903 () (_ BitVec 32))

(assert (=> mapNonEmpty!18903 (= (arr!12882 _values!549) (store mapRest!18903 mapKey!18903 mapValue!18903))))

(declare-fun b!438164 () Bool)

(declare-fun e!258487 () Bool)

(assert (=> b!438164 (= e!258485 e!258487)))

(declare-fun res!258688 () Bool)

(assert (=> b!438164 (=> (not res!258688) (not e!258487))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!438164 (= res!258688 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16467)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7604 0))(
  ( (tuple2!7605 (_1!3813 (_ BitVec 64)) (_2!3813 V!16467)) )
))
(declare-datatypes ((List!7591 0))(
  ( (Nil!7588) (Cons!7587 (h!8443 tuple2!7604) (t!13339 List!7591)) )
))
(declare-datatypes ((ListLongMap!6519 0))(
  ( (ListLongMap!6520 (toList!3275 List!7591)) )
))
(declare-fun lt!201906 () ListLongMap!6519)

(declare-fun zeroValue!515 () V!16467)

(declare-fun lt!201908 () array!26866)

(declare-fun getCurrentListMapNoExtraKeys!1508 (array!26864 array!26866 (_ BitVec 32) (_ BitVec 32) V!16467 V!16467 (_ BitVec 32) Int) ListLongMap!6519)

(assert (=> b!438164 (= lt!201906 (getCurrentListMapNoExtraKeys!1508 lt!201907 lt!201908 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16467)

(assert (=> b!438164 (= lt!201908 (array!26867 (store (arr!12882 _values!549) i!563 (ValueCellFull!5417 v!412)) (size!13234 _values!549)))))

(declare-fun lt!201909 () ListLongMap!6519)

(assert (=> b!438164 (= lt!201909 (getCurrentListMapNoExtraKeys!1508 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438165 () Bool)

(declare-fun res!258685 () Bool)

(assert (=> b!438165 (=> (not res!258685) (not e!258486))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438165 (= res!258685 (validKeyInArray!0 k0!794))))

(declare-fun b!438166 () Bool)

(declare-fun res!258692 () Bool)

(assert (=> b!438166 (=> (not res!258692) (not e!258486))))

(assert (=> b!438166 (= res!258692 (or (= (select (arr!12881 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12881 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18903 () Bool)

(assert (=> mapIsEmpty!18903 mapRes!18903))

(declare-fun b!438167 () Bool)

(declare-fun res!258687 () Bool)

(assert (=> b!438167 (=> (not res!258687) (not e!258486))))

(assert (=> b!438167 (= res!258687 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438168 () Bool)

(declare-fun tp_is_empty!11521 () Bool)

(assert (=> b!438168 (= e!258484 tp_is_empty!11521)))

(declare-fun b!438169 () Bool)

(declare-fun res!258693 () Bool)

(assert (=> b!438169 (=> (not res!258693) (not e!258486))))

(declare-datatypes ((List!7592 0))(
  ( (Nil!7589) (Cons!7588 (h!8444 (_ BitVec 64)) (t!13340 List!7592)) )
))
(declare-fun arrayNoDuplicates!0 (array!26864 (_ BitVec 32) List!7592) Bool)

(assert (=> b!438169 (= res!258693 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7589))))

(declare-fun b!438170 () Bool)

(declare-fun res!258691 () Bool)

(assert (=> b!438170 (=> (not res!258691) (not e!258486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438170 (= res!258691 (validMask!0 mask!1025))))

(declare-fun b!438172 () Bool)

(assert (=> b!438172 (= e!258487 (not true))))

(declare-fun +!1472 (ListLongMap!6519 tuple2!7604) ListLongMap!6519)

(assert (=> b!438172 (= (getCurrentListMapNoExtraKeys!1508 lt!201907 lt!201908 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1472 (getCurrentListMapNoExtraKeys!1508 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7605 k0!794 v!412)))))

(declare-datatypes ((Unit!13019 0))(
  ( (Unit!13020) )
))
(declare-fun lt!201905 () Unit!13019)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!632 (array!26864 array!26866 (_ BitVec 32) (_ BitVec 32) V!16467 V!16467 (_ BitVec 32) (_ BitVec 64) V!16467 (_ BitVec 32) Int) Unit!13019)

(assert (=> b!438172 (= lt!201905 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!632 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438173 () Bool)

(declare-fun res!258696 () Bool)

(assert (=> b!438173 (=> (not res!258696) (not e!258486))))

(declare-fun arrayContainsKey!0 (array!26864 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438173 (= res!258696 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438174 () Bool)

(declare-fun res!258689 () Bool)

(assert (=> b!438174 (=> (not res!258689) (not e!258485))))

(assert (=> b!438174 (= res!258689 (bvsle from!863 i!563))))

(declare-fun b!438175 () Bool)

(declare-fun e!258488 () Bool)

(assert (=> b!438175 (= e!258488 tp_is_empty!11521)))

(declare-fun b!438176 () Bool)

(declare-fun res!258695 () Bool)

(assert (=> b!438176 (=> (not res!258695) (not e!258486))))

(assert (=> b!438176 (= res!258695 (and (= (size!13234 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13233 _keys!709) (size!13234 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438177 () Bool)

(declare-fun res!258686 () Bool)

(assert (=> b!438177 (=> (not res!258686) (not e!258485))))

(assert (=> b!438177 (= res!258686 (arrayNoDuplicates!0 lt!201907 #b00000000000000000000000000000000 Nil!7589))))

(declare-fun b!438178 () Bool)

(declare-fun res!258684 () Bool)

(assert (=> b!438178 (=> (not res!258684) (not e!258486))))

(assert (=> b!438178 (= res!258684 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13233 _keys!709))))))

(declare-fun res!258694 () Bool)

(assert (=> start!40088 (=> (not res!258694) (not e!258486))))

(assert (=> start!40088 (= res!258694 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13233 _keys!709))))))

(assert (=> start!40088 e!258486))

(assert (=> start!40088 tp_is_empty!11521))

(assert (=> start!40088 tp!36635))

(assert (=> start!40088 true))

(declare-fun e!258489 () Bool)

(declare-fun array_inv!9420 (array!26866) Bool)

(assert (=> start!40088 (and (array_inv!9420 _values!549) e!258489)))

(declare-fun array_inv!9421 (array!26864) Bool)

(assert (=> start!40088 (array_inv!9421 _keys!709)))

(declare-fun b!438171 () Bool)

(assert (=> b!438171 (= e!258489 (and e!258488 mapRes!18903))))

(declare-fun condMapEmpty!18903 () Bool)

(declare-fun mapDefault!18903 () ValueCell!5417)

(assert (=> b!438171 (= condMapEmpty!18903 (= (arr!12882 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5417)) mapDefault!18903)))))

(assert (= (and start!40088 res!258694) b!438170))

(assert (= (and b!438170 res!258691) b!438176))

(assert (= (and b!438176 res!258695) b!438167))

(assert (= (and b!438167 res!258687) b!438169))

(assert (= (and b!438169 res!258693) b!438178))

(assert (= (and b!438178 res!258684) b!438165))

(assert (= (and b!438165 res!258685) b!438166))

(assert (= (and b!438166 res!258692) b!438173))

(assert (= (and b!438173 res!258696) b!438163))

(assert (= (and b!438163 res!258690) b!438177))

(assert (= (and b!438177 res!258686) b!438174))

(assert (= (and b!438174 res!258689) b!438164))

(assert (= (and b!438164 res!258688) b!438172))

(assert (= (and b!438171 condMapEmpty!18903) mapIsEmpty!18903))

(assert (= (and b!438171 (not condMapEmpty!18903)) mapNonEmpty!18903))

(get-info :version)

(assert (= (and mapNonEmpty!18903 ((_ is ValueCellFull!5417) mapValue!18903)) b!438168))

(assert (= (and b!438171 ((_ is ValueCellFull!5417) mapDefault!18903)) b!438175))

(assert (= start!40088 b!438171))

(declare-fun m!425939 () Bool)

(assert (=> b!438172 m!425939))

(declare-fun m!425941 () Bool)

(assert (=> b!438172 m!425941))

(assert (=> b!438172 m!425941))

(declare-fun m!425943 () Bool)

(assert (=> b!438172 m!425943))

(declare-fun m!425945 () Bool)

(assert (=> b!438172 m!425945))

(declare-fun m!425947 () Bool)

(assert (=> start!40088 m!425947))

(declare-fun m!425949 () Bool)

(assert (=> start!40088 m!425949))

(declare-fun m!425951 () Bool)

(assert (=> b!438164 m!425951))

(declare-fun m!425953 () Bool)

(assert (=> b!438164 m!425953))

(declare-fun m!425955 () Bool)

(assert (=> b!438164 m!425955))

(declare-fun m!425957 () Bool)

(assert (=> b!438167 m!425957))

(declare-fun m!425959 () Bool)

(assert (=> b!438165 m!425959))

(declare-fun m!425961 () Bool)

(assert (=> b!438163 m!425961))

(declare-fun m!425963 () Bool)

(assert (=> b!438163 m!425963))

(declare-fun m!425965 () Bool)

(assert (=> b!438177 m!425965))

(declare-fun m!425967 () Bool)

(assert (=> b!438173 m!425967))

(declare-fun m!425969 () Bool)

(assert (=> b!438170 m!425969))

(declare-fun m!425971 () Bool)

(assert (=> b!438169 m!425971))

(declare-fun m!425973 () Bool)

(assert (=> mapNonEmpty!18903 m!425973))

(declare-fun m!425975 () Bool)

(assert (=> b!438166 m!425975))

(check-sat (not b!438173) (not b_next!10369) (not b!438169) b_and!18351 (not b!438172) (not mapNonEmpty!18903) (not b!438163) (not b!438167) (not b!438164) (not b!438165) tp_is_empty!11521 (not b!438177) (not start!40088) (not b!438170))
(check-sat b_and!18351 (not b_next!10369))
