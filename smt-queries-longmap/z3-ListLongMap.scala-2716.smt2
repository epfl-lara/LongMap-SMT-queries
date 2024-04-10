; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40116 () Bool)

(assert start!40116)

(declare-fun b_free!10383 () Bool)

(declare-fun b_next!10383 () Bool)

(assert (=> start!40116 (= b_free!10383 (not b_next!10383))))

(declare-fun tp!36677 () Bool)

(declare-fun b_and!18351 () Bool)

(assert (=> start!40116 (= tp!36677 b_and!18351)))

(declare-fun b!438548 () Bool)

(declare-fun res!258963 () Bool)

(declare-fun e!258663 () Bool)

(assert (=> b!438548 (=> (not res!258963) (not e!258663))))

(declare-datatypes ((array!26887 0))(
  ( (array!26888 (arr!12893 (Array (_ BitVec 32) (_ BitVec 64))) (size!13245 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26887)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26887 (_ BitVec 32)) Bool)

(assert (=> b!438548 (= res!258963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438549 () Bool)

(declare-fun res!258960 () Bool)

(declare-fun e!258664 () Bool)

(assert (=> b!438549 (=> (not res!258960) (not e!258664))))

(declare-fun lt!201991 () array!26887)

(declare-datatypes ((List!7708 0))(
  ( (Nil!7705) (Cons!7704 (h!8560 (_ BitVec 64)) (t!13464 List!7708)) )
))
(declare-fun arrayNoDuplicates!0 (array!26887 (_ BitVec 32) List!7708) Bool)

(assert (=> b!438549 (= res!258960 (arrayNoDuplicates!0 lt!201991 #b00000000000000000000000000000000 Nil!7705))))

(declare-fun res!258969 () Bool)

(assert (=> start!40116 (=> (not res!258969) (not e!258663))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40116 (= res!258969 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13245 _keys!709))))))

(assert (=> start!40116 e!258663))

(declare-fun tp_is_empty!11535 () Bool)

(assert (=> start!40116 tp_is_empty!11535))

(assert (=> start!40116 tp!36677))

(assert (=> start!40116 true))

(declare-datatypes ((V!16485 0))(
  ( (V!16486 (val!5812 Int)) )
))
(declare-datatypes ((ValueCell!5424 0))(
  ( (ValueCellFull!5424 (v!8059 V!16485)) (EmptyCell!5424) )
))
(declare-datatypes ((array!26889 0))(
  ( (array!26890 (arr!12894 (Array (_ BitVec 32) ValueCell!5424)) (size!13246 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26889)

(declare-fun e!258665 () Bool)

(declare-fun array_inv!9364 (array!26889) Bool)

(assert (=> start!40116 (and (array_inv!9364 _values!549) e!258665)))

(declare-fun array_inv!9365 (array!26887) Bool)

(assert (=> start!40116 (array_inv!9365 _keys!709)))

(declare-fun b!438550 () Bool)

(declare-fun res!258962 () Bool)

(assert (=> b!438550 (=> (not res!258962) (not e!258663))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438550 (= res!258962 (validMask!0 mask!1025))))

(declare-fun b!438551 () Bool)

(declare-fun e!258666 () Bool)

(assert (=> b!438551 (= e!258666 tp_is_empty!11535)))

(declare-fun b!438552 () Bool)

(declare-fun e!258667 () Bool)

(assert (=> b!438552 (= e!258667 tp_is_empty!11535)))

(declare-fun b!438553 () Bool)

(declare-fun e!258669 () Bool)

(assert (=> b!438553 (= e!258664 e!258669)))

(declare-fun res!258970 () Bool)

(assert (=> b!438553 (=> (not res!258970) (not e!258669))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438553 (= res!258970 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16485)

(declare-fun minValue!515 () V!16485)

(declare-fun lt!201993 () array!26889)

(declare-datatypes ((tuple2!7710 0))(
  ( (tuple2!7711 (_1!3866 (_ BitVec 64)) (_2!3866 V!16485)) )
))
(declare-datatypes ((List!7709 0))(
  ( (Nil!7706) (Cons!7705 (h!8561 tuple2!7710) (t!13465 List!7709)) )
))
(declare-datatypes ((ListLongMap!6623 0))(
  ( (ListLongMap!6624 (toList!3327 List!7709)) )
))
(declare-fun lt!201995 () ListLongMap!6623)

(declare-fun getCurrentListMapNoExtraKeys!1516 (array!26887 array!26889 (_ BitVec 32) (_ BitVec 32) V!16485 V!16485 (_ BitVec 32) Int) ListLongMap!6623)

(assert (=> b!438553 (= lt!201995 (getCurrentListMapNoExtraKeys!1516 lt!201991 lt!201993 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16485)

(assert (=> b!438553 (= lt!201993 (array!26890 (store (arr!12894 _values!549) i!563 (ValueCellFull!5424 v!412)) (size!13246 _values!549)))))

(declare-fun lt!201994 () ListLongMap!6623)

(assert (=> b!438553 (= lt!201994 (getCurrentListMapNoExtraKeys!1516 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438554 () Bool)

(declare-fun res!258972 () Bool)

(assert (=> b!438554 (=> (not res!258972) (not e!258663))))

(assert (=> b!438554 (= res!258972 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7705))))

(declare-fun b!438555 () Bool)

(assert (=> b!438555 (= e!258663 e!258664)))

(declare-fun res!258968 () Bool)

(assert (=> b!438555 (=> (not res!258968) (not e!258664))))

(assert (=> b!438555 (= res!258968 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201991 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!438555 (= lt!201991 (array!26888 (store (arr!12893 _keys!709) i!563 k0!794) (size!13245 _keys!709)))))

(declare-fun b!438556 () Bool)

(declare-fun res!258964 () Bool)

(assert (=> b!438556 (=> (not res!258964) (not e!258663))))

(assert (=> b!438556 (= res!258964 (and (= (size!13246 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13245 _keys!709) (size!13246 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18924 () Bool)

(declare-fun mapRes!18924 () Bool)

(assert (=> mapIsEmpty!18924 mapRes!18924))

(declare-fun b!438557 () Bool)

(declare-fun res!258967 () Bool)

(assert (=> b!438557 (=> (not res!258967) (not e!258663))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438557 (= res!258967 (validKeyInArray!0 k0!794))))

(declare-fun mapNonEmpty!18924 () Bool)

(declare-fun tp!36678 () Bool)

(assert (=> mapNonEmpty!18924 (= mapRes!18924 (and tp!36678 e!258667))))

(declare-fun mapRest!18924 () (Array (_ BitVec 32) ValueCell!5424))

(declare-fun mapValue!18924 () ValueCell!5424)

(declare-fun mapKey!18924 () (_ BitVec 32))

(assert (=> mapNonEmpty!18924 (= (arr!12894 _values!549) (store mapRest!18924 mapKey!18924 mapValue!18924))))

(declare-fun b!438558 () Bool)

(assert (=> b!438558 (= e!258669 (not true))))

(declare-fun +!1470 (ListLongMap!6623 tuple2!7710) ListLongMap!6623)

(assert (=> b!438558 (= (getCurrentListMapNoExtraKeys!1516 lt!201991 lt!201993 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1470 (getCurrentListMapNoExtraKeys!1516 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7711 k0!794 v!412)))))

(declare-datatypes ((Unit!13044 0))(
  ( (Unit!13045) )
))
(declare-fun lt!201992 () Unit!13044)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!639 (array!26887 array!26889 (_ BitVec 32) (_ BitVec 32) V!16485 V!16485 (_ BitVec 32) (_ BitVec 64) V!16485 (_ BitVec 32) Int) Unit!13044)

(assert (=> b!438558 (= lt!201992 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!639 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438559 () Bool)

(assert (=> b!438559 (= e!258665 (and e!258666 mapRes!18924))))

(declare-fun condMapEmpty!18924 () Bool)

(declare-fun mapDefault!18924 () ValueCell!5424)

(assert (=> b!438559 (= condMapEmpty!18924 (= (arr!12894 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5424)) mapDefault!18924)))))

(declare-fun b!438560 () Bool)

(declare-fun res!258966 () Bool)

(assert (=> b!438560 (=> (not res!258966) (not e!258664))))

(assert (=> b!438560 (= res!258966 (bvsle from!863 i!563))))

(declare-fun b!438561 () Bool)

(declare-fun res!258961 () Bool)

(assert (=> b!438561 (=> (not res!258961) (not e!258663))))

(assert (=> b!438561 (= res!258961 (or (= (select (arr!12893 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12893 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438562 () Bool)

(declare-fun res!258965 () Bool)

(assert (=> b!438562 (=> (not res!258965) (not e!258663))))

(assert (=> b!438562 (= res!258965 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13245 _keys!709))))))

(declare-fun b!438563 () Bool)

(declare-fun res!258971 () Bool)

(assert (=> b!438563 (=> (not res!258971) (not e!258663))))

(declare-fun arrayContainsKey!0 (array!26887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438563 (= res!258971 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40116 res!258969) b!438550))

(assert (= (and b!438550 res!258962) b!438556))

(assert (= (and b!438556 res!258964) b!438548))

(assert (= (and b!438548 res!258963) b!438554))

(assert (= (and b!438554 res!258972) b!438562))

(assert (= (and b!438562 res!258965) b!438557))

(assert (= (and b!438557 res!258967) b!438561))

(assert (= (and b!438561 res!258961) b!438563))

(assert (= (and b!438563 res!258971) b!438555))

(assert (= (and b!438555 res!258968) b!438549))

(assert (= (and b!438549 res!258960) b!438560))

(assert (= (and b!438560 res!258966) b!438553))

(assert (= (and b!438553 res!258970) b!438558))

(assert (= (and b!438559 condMapEmpty!18924) mapIsEmpty!18924))

(assert (= (and b!438559 (not condMapEmpty!18924)) mapNonEmpty!18924))

(get-info :version)

(assert (= (and mapNonEmpty!18924 ((_ is ValueCellFull!5424) mapValue!18924)) b!438552))

(assert (= (and b!438559 ((_ is ValueCellFull!5424) mapDefault!18924)) b!438551))

(assert (= start!40116 b!438559))

(declare-fun m!425987 () Bool)

(assert (=> b!438555 m!425987))

(declare-fun m!425989 () Bool)

(assert (=> b!438555 m!425989))

(declare-fun m!425991 () Bool)

(assert (=> b!438558 m!425991))

(declare-fun m!425993 () Bool)

(assert (=> b!438558 m!425993))

(assert (=> b!438558 m!425993))

(declare-fun m!425995 () Bool)

(assert (=> b!438558 m!425995))

(declare-fun m!425997 () Bool)

(assert (=> b!438558 m!425997))

(declare-fun m!425999 () Bool)

(assert (=> mapNonEmpty!18924 m!425999))

(declare-fun m!426001 () Bool)

(assert (=> b!438550 m!426001))

(declare-fun m!426003 () Bool)

(assert (=> b!438553 m!426003))

(declare-fun m!426005 () Bool)

(assert (=> b!438553 m!426005))

(declare-fun m!426007 () Bool)

(assert (=> b!438553 m!426007))

(declare-fun m!426009 () Bool)

(assert (=> b!438561 m!426009))

(declare-fun m!426011 () Bool)

(assert (=> b!438548 m!426011))

(declare-fun m!426013 () Bool)

(assert (=> b!438549 m!426013))

(declare-fun m!426015 () Bool)

(assert (=> b!438563 m!426015))

(declare-fun m!426017 () Bool)

(assert (=> start!40116 m!426017))

(declare-fun m!426019 () Bool)

(assert (=> start!40116 m!426019))

(declare-fun m!426021 () Bool)

(assert (=> b!438554 m!426021))

(declare-fun m!426023 () Bool)

(assert (=> b!438557 m!426023))

(check-sat (not b!438550) b_and!18351 (not b!438555) (not mapNonEmpty!18924) (not b!438557) (not b_next!10383) (not b!438553) (not b!438549) (not b!438548) (not b!438563) (not b!438554) (not b!438558) (not start!40116) tp_is_empty!11535)
(check-sat b_and!18351 (not b_next!10383))
