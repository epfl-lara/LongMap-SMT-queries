; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39914 () Bool)

(assert start!39914)

(declare-fun b_free!10195 () Bool)

(declare-fun b_next!10195 () Bool)

(assert (=> start!39914 (= b_free!10195 (not b_next!10195))))

(declare-fun tp!36113 () Bool)

(declare-fun b_and!18023 () Bool)

(assert (=> start!39914 (= tp!36113 b_and!18023)))

(declare-fun b!432975 () Bool)

(declare-fun res!254830 () Bool)

(declare-fun e!256010 () Bool)

(assert (=> b!432975 (=> (not res!254830) (not e!256010))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432975 (= res!254830 (bvsle from!863 i!563))))

(declare-fun b!432976 () Bool)

(declare-fun res!254836 () Bool)

(assert (=> b!432976 (=> (not res!254836) (not e!256010))))

(declare-datatypes ((array!26521 0))(
  ( (array!26522 (arr!12710 (Array (_ BitVec 32) (_ BitVec 64))) (size!13063 (_ BitVec 32))) )
))
(declare-fun lt!198665 () array!26521)

(declare-datatypes ((List!7557 0))(
  ( (Nil!7554) (Cons!7553 (h!8409 (_ BitVec 64)) (t!13192 List!7557)) )
))
(declare-fun arrayNoDuplicates!0 (array!26521 (_ BitVec 32) List!7557) Bool)

(assert (=> b!432976 (= res!254836 (arrayNoDuplicates!0 lt!198665 #b00000000000000000000000000000000 Nil!7554))))

(declare-fun b!432977 () Bool)

(declare-fun e!256013 () Bool)

(assert (=> b!432977 (= e!256013 true)))

(declare-datatypes ((V!16235 0))(
  ( (V!16236 (val!5718 Int)) )
))
(declare-datatypes ((tuple2!7564 0))(
  ( (tuple2!7565 (_1!3793 (_ BitVec 64)) (_2!3793 V!16235)) )
))
(declare-datatypes ((List!7558 0))(
  ( (Nil!7555) (Cons!7554 (h!8410 tuple2!7564) (t!13193 List!7558)) )
))
(declare-datatypes ((ListLongMap!6467 0))(
  ( (ListLongMap!6468 (toList!3249 List!7558)) )
))
(declare-fun lt!198660 () ListLongMap!6467)

(declare-fun lt!198661 () tuple2!7564)

(declare-fun lt!198667 () ListLongMap!6467)

(declare-fun lt!198666 () tuple2!7564)

(declare-fun +!1424 (ListLongMap!6467 tuple2!7564) ListLongMap!6467)

(assert (=> b!432977 (= lt!198660 (+!1424 (+!1424 lt!198667 lt!198666) lt!198661))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12789 0))(
  ( (Unit!12790) )
))
(declare-fun lt!198670 () Unit!12789)

(declare-fun lt!198671 () V!16235)

(declare-fun v!412 () V!16235)

(declare-fun _keys!709 () array!26521)

(declare-fun addCommutativeForDiffKeys!381 (ListLongMap!6467 (_ BitVec 64) V!16235 (_ BitVec 64) V!16235) Unit!12789)

(assert (=> b!432977 (= lt!198670 (addCommutativeForDiffKeys!381 lt!198667 k0!794 v!412 (select (arr!12710 _keys!709) from!863) lt!198671))))

(declare-fun b!432978 () Bool)

(declare-fun res!254839 () Bool)

(declare-fun e!256008 () Bool)

(assert (=> b!432978 (=> (not res!254839) (not e!256008))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5330 0))(
  ( (ValueCellFull!5330 (v!7959 V!16235)) (EmptyCell!5330) )
))
(declare-datatypes ((array!26523 0))(
  ( (array!26524 (arr!12711 (Array (_ BitVec 32) ValueCell!5330)) (size!13064 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26523)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!432978 (= res!254839 (and (= (size!13064 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13063 _keys!709) (size!13064 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432979 () Bool)

(declare-fun res!254832 () Bool)

(assert (=> b!432979 (=> (not res!254832) (not e!256008))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432979 (= res!254832 (validKeyInArray!0 k0!794))))

(declare-fun res!254835 () Bool)

(assert (=> start!39914 (=> (not res!254835) (not e!256008))))

(assert (=> start!39914 (= res!254835 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13063 _keys!709))))))

(assert (=> start!39914 e!256008))

(declare-fun tp_is_empty!11347 () Bool)

(assert (=> start!39914 tp_is_empty!11347))

(assert (=> start!39914 tp!36113))

(assert (=> start!39914 true))

(declare-fun e!256017 () Bool)

(declare-fun array_inv!9282 (array!26523) Bool)

(assert (=> start!39914 (and (array_inv!9282 _values!549) e!256017)))

(declare-fun array_inv!9283 (array!26521) Bool)

(assert (=> start!39914 (array_inv!9283 _keys!709)))

(declare-fun b!432980 () Bool)

(declare-fun e!256015 () Unit!12789)

(declare-fun Unit!12791 () Unit!12789)

(assert (=> b!432980 (= e!256015 Unit!12791)))

(declare-fun lt!198669 () Unit!12789)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26521 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12789)

(assert (=> b!432980 (= lt!198669 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432980 false))

(declare-fun mapIsEmpty!18642 () Bool)

(declare-fun mapRes!18642 () Bool)

(assert (=> mapIsEmpty!18642 mapRes!18642))

(declare-fun b!432981 () Bool)

(declare-fun e!256009 () Bool)

(assert (=> b!432981 (= e!256017 (and e!256009 mapRes!18642))))

(declare-fun condMapEmpty!18642 () Bool)

(declare-fun mapDefault!18642 () ValueCell!5330)

(assert (=> b!432981 (= condMapEmpty!18642 (= (arr!12711 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5330)) mapDefault!18642)))))

(declare-fun b!432982 () Bool)

(declare-fun Unit!12792 () Unit!12789)

(assert (=> b!432982 (= e!256015 Unit!12792)))

(declare-fun mapNonEmpty!18642 () Bool)

(declare-fun tp!36114 () Bool)

(declare-fun e!256012 () Bool)

(assert (=> mapNonEmpty!18642 (= mapRes!18642 (and tp!36114 e!256012))))

(declare-fun mapValue!18642 () ValueCell!5330)

(declare-fun mapKey!18642 () (_ BitVec 32))

(declare-fun mapRest!18642 () (Array (_ BitVec 32) ValueCell!5330))

(assert (=> mapNonEmpty!18642 (= (arr!12711 _values!549) (store mapRest!18642 mapKey!18642 mapValue!18642))))

(declare-fun b!432983 () Bool)

(declare-fun e!256014 () Bool)

(assert (=> b!432983 (= e!256010 e!256014)))

(declare-fun res!254828 () Bool)

(assert (=> b!432983 (=> (not res!254828) (not e!256014))))

(assert (=> b!432983 (= res!254828 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16235)

(declare-fun lt!198664 () array!26523)

(declare-fun lt!198663 () ListLongMap!6467)

(declare-fun minValue!515 () V!16235)

(declare-fun getCurrentListMapNoExtraKeys!1452 (array!26521 array!26523 (_ BitVec 32) (_ BitVec 32) V!16235 V!16235 (_ BitVec 32) Int) ListLongMap!6467)

(assert (=> b!432983 (= lt!198663 (getCurrentListMapNoExtraKeys!1452 lt!198665 lt!198664 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432983 (= lt!198664 (array!26524 (store (arr!12711 _values!549) i!563 (ValueCellFull!5330 v!412)) (size!13064 _values!549)))))

(declare-fun lt!198659 () ListLongMap!6467)

(assert (=> b!432983 (= lt!198659 (getCurrentListMapNoExtraKeys!1452 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432984 () Bool)

(declare-fun res!254827 () Bool)

(assert (=> b!432984 (=> (not res!254827) (not e!256008))))

(assert (=> b!432984 (= res!254827 (or (= (select (arr!12710 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12710 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432985 () Bool)

(declare-fun res!254837 () Bool)

(assert (=> b!432985 (=> (not res!254837) (not e!256008))))

(assert (=> b!432985 (= res!254837 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7554))))

(declare-fun b!432986 () Bool)

(assert (=> b!432986 (= e!256012 tp_is_empty!11347)))

(declare-fun b!432987 () Bool)

(declare-fun res!254829 () Bool)

(assert (=> b!432987 (=> (not res!254829) (not e!256008))))

(declare-fun arrayContainsKey!0 (array!26521 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432987 (= res!254829 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432988 () Bool)

(declare-fun res!254841 () Bool)

(assert (=> b!432988 (=> (not res!254841) (not e!256008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26521 (_ BitVec 32)) Bool)

(assert (=> b!432988 (= res!254841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432989 () Bool)

(declare-fun res!254838 () Bool)

(assert (=> b!432989 (=> (not res!254838) (not e!256008))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432989 (= res!254838 (validMask!0 mask!1025))))

(declare-fun b!432990 () Bool)

(assert (=> b!432990 (= e!256008 e!256010)))

(declare-fun res!254834 () Bool)

(assert (=> b!432990 (=> (not res!254834) (not e!256010))))

(assert (=> b!432990 (= res!254834 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198665 mask!1025))))

(assert (=> b!432990 (= lt!198665 (array!26522 (store (arr!12710 _keys!709) i!563 k0!794) (size!13063 _keys!709)))))

(declare-fun b!432991 () Bool)

(declare-fun e!256016 () Bool)

(assert (=> b!432991 (= e!256016 e!256013)))

(declare-fun res!254833 () Bool)

(assert (=> b!432991 (=> res!254833 e!256013)))

(assert (=> b!432991 (= res!254833 (= k0!794 (select (arr!12710 _keys!709) from!863)))))

(assert (=> b!432991 (not (= (select (arr!12710 _keys!709) from!863) k0!794))))

(declare-fun lt!198668 () Unit!12789)

(assert (=> b!432991 (= lt!198668 e!256015)))

(declare-fun c!55557 () Bool)

(assert (=> b!432991 (= c!55557 (= (select (arr!12710 _keys!709) from!863) k0!794))))

(assert (=> b!432991 (= lt!198663 lt!198660)))

(declare-fun lt!198662 () ListLongMap!6467)

(assert (=> b!432991 (= lt!198660 (+!1424 lt!198662 lt!198666))))

(assert (=> b!432991 (= lt!198666 (tuple2!7565 (select (arr!12710 _keys!709) from!863) lt!198671))))

(declare-fun get!6324 (ValueCell!5330 V!16235) V!16235)

(declare-fun dynLambda!808 (Int (_ BitVec 64)) V!16235)

(assert (=> b!432991 (= lt!198671 (get!6324 (select (arr!12711 _values!549) from!863) (dynLambda!808 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432992 () Bool)

(declare-fun res!254831 () Bool)

(assert (=> b!432992 (=> (not res!254831) (not e!256008))))

(assert (=> b!432992 (= res!254831 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13063 _keys!709))))))

(declare-fun b!432993 () Bool)

(assert (=> b!432993 (= e!256014 (not e!256016))))

(declare-fun res!254840 () Bool)

(assert (=> b!432993 (=> res!254840 e!256016)))

(assert (=> b!432993 (= res!254840 (not (validKeyInArray!0 (select (arr!12710 _keys!709) from!863))))))

(declare-fun lt!198657 () ListLongMap!6467)

(assert (=> b!432993 (= lt!198657 lt!198662)))

(assert (=> b!432993 (= lt!198662 (+!1424 lt!198667 lt!198661))))

(assert (=> b!432993 (= lt!198657 (getCurrentListMapNoExtraKeys!1452 lt!198665 lt!198664 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432993 (= lt!198661 (tuple2!7565 k0!794 v!412))))

(assert (=> b!432993 (= lt!198667 (getCurrentListMapNoExtraKeys!1452 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198658 () Unit!12789)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!576 (array!26521 array!26523 (_ BitVec 32) (_ BitVec 32) V!16235 V!16235 (_ BitVec 32) (_ BitVec 64) V!16235 (_ BitVec 32) Int) Unit!12789)

(assert (=> b!432993 (= lt!198658 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!576 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432994 () Bool)

(assert (=> b!432994 (= e!256009 tp_is_empty!11347)))

(assert (= (and start!39914 res!254835) b!432989))

(assert (= (and b!432989 res!254838) b!432978))

(assert (= (and b!432978 res!254839) b!432988))

(assert (= (and b!432988 res!254841) b!432985))

(assert (= (and b!432985 res!254837) b!432992))

(assert (= (and b!432992 res!254831) b!432979))

(assert (= (and b!432979 res!254832) b!432984))

(assert (= (and b!432984 res!254827) b!432987))

(assert (= (and b!432987 res!254829) b!432990))

(assert (= (and b!432990 res!254834) b!432976))

(assert (= (and b!432976 res!254836) b!432975))

(assert (= (and b!432975 res!254830) b!432983))

(assert (= (and b!432983 res!254828) b!432993))

(assert (= (and b!432993 (not res!254840)) b!432991))

(assert (= (and b!432991 c!55557) b!432980))

(assert (= (and b!432991 (not c!55557)) b!432982))

(assert (= (and b!432991 (not res!254833)) b!432977))

(assert (= (and b!432981 condMapEmpty!18642) mapIsEmpty!18642))

(assert (= (and b!432981 (not condMapEmpty!18642)) mapNonEmpty!18642))

(get-info :version)

(assert (= (and mapNonEmpty!18642 ((_ is ValueCellFull!5330) mapValue!18642)) b!432986))

(assert (= (and b!432981 ((_ is ValueCellFull!5330) mapDefault!18642)) b!432994))

(assert (= start!39914 b!432981))

(declare-fun b_lambda!9265 () Bool)

(assert (=> (not b_lambda!9265) (not b!432991)))

(declare-fun t!13191 () Bool)

(declare-fun tb!3593 () Bool)

(assert (=> (and start!39914 (= defaultEntry!557 defaultEntry!557) t!13191) tb!3593))

(declare-fun result!6721 () Bool)

(assert (=> tb!3593 (= result!6721 tp_is_empty!11347)))

(assert (=> b!432991 t!13191))

(declare-fun b_and!18025 () Bool)

(assert (= b_and!18023 (and (=> t!13191 result!6721) b_and!18025)))

(declare-fun m!420543 () Bool)

(assert (=> b!432989 m!420543))

(declare-fun m!420545 () Bool)

(assert (=> b!432980 m!420545))

(declare-fun m!420547 () Bool)

(assert (=> b!432983 m!420547))

(declare-fun m!420549 () Bool)

(assert (=> b!432983 m!420549))

(declare-fun m!420551 () Bool)

(assert (=> b!432983 m!420551))

(declare-fun m!420553 () Bool)

(assert (=> b!432985 m!420553))

(declare-fun m!420555 () Bool)

(assert (=> b!432991 m!420555))

(declare-fun m!420557 () Bool)

(assert (=> b!432991 m!420557))

(declare-fun m!420559 () Bool)

(assert (=> b!432991 m!420559))

(declare-fun m!420561 () Bool)

(assert (=> b!432991 m!420561))

(assert (=> b!432991 m!420559))

(assert (=> b!432991 m!420557))

(declare-fun m!420563 () Bool)

(assert (=> b!432991 m!420563))

(declare-fun m!420565 () Bool)

(assert (=> b!432979 m!420565))

(declare-fun m!420567 () Bool)

(assert (=> start!39914 m!420567))

(declare-fun m!420569 () Bool)

(assert (=> start!39914 m!420569))

(declare-fun m!420571 () Bool)

(assert (=> b!432990 m!420571))

(declare-fun m!420573 () Bool)

(assert (=> b!432990 m!420573))

(declare-fun m!420575 () Bool)

(assert (=> b!432976 m!420575))

(declare-fun m!420577 () Bool)

(assert (=> b!432984 m!420577))

(declare-fun m!420579 () Bool)

(assert (=> b!432988 m!420579))

(assert (=> b!432993 m!420555))

(declare-fun m!420581 () Bool)

(assert (=> b!432993 m!420581))

(declare-fun m!420583 () Bool)

(assert (=> b!432993 m!420583))

(assert (=> b!432993 m!420555))

(declare-fun m!420585 () Bool)

(assert (=> b!432993 m!420585))

(declare-fun m!420587 () Bool)

(assert (=> b!432993 m!420587))

(declare-fun m!420589 () Bool)

(assert (=> b!432993 m!420589))

(declare-fun m!420591 () Bool)

(assert (=> b!432977 m!420591))

(assert (=> b!432977 m!420591))

(declare-fun m!420593 () Bool)

(assert (=> b!432977 m!420593))

(assert (=> b!432977 m!420555))

(assert (=> b!432977 m!420555))

(declare-fun m!420595 () Bool)

(assert (=> b!432977 m!420595))

(declare-fun m!420597 () Bool)

(assert (=> b!432987 m!420597))

(declare-fun m!420599 () Bool)

(assert (=> mapNonEmpty!18642 m!420599))

(check-sat (not b!432979) (not b_lambda!9265) (not b!432989) (not b_next!10195) (not b!432993) (not b!432976) (not b!432987) (not b!432991) (not b!432980) (not b!432990) (not mapNonEmpty!18642) (not b!432985) tp_is_empty!11347 b_and!18025 (not b!432988) (not b!432983) (not b!432977) (not start!39914))
(check-sat b_and!18025 (not b_next!10195))
