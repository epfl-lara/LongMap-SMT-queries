; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39918 () Bool)

(assert start!39918)

(declare-fun b_free!10185 () Bool)

(declare-fun b_next!10185 () Bool)

(assert (=> start!39918 (= b_free!10185 (not b_next!10185))))

(declare-fun tp!36084 () Bool)

(declare-fun b_and!18029 () Bool)

(assert (=> start!39918 (= tp!36084 b_and!18029)))

(declare-fun b!432936 () Bool)

(declare-fun res!254745 () Bool)

(declare-fun e!256033 () Bool)

(assert (=> b!432936 (=> (not res!254745) (not e!256033))))

(declare-datatypes ((array!26507 0))(
  ( (array!26508 (arr!12703 (Array (_ BitVec 32) (_ BitVec 64))) (size!13055 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26507)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26507 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432936 (= res!254745 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432937 () Bool)

(declare-fun res!254733 () Bool)

(declare-fun e!256036 () Bool)

(assert (=> b!432937 (=> (not res!254733) (not e!256036))))

(declare-fun lt!198673 () array!26507)

(declare-datatypes ((List!7556 0))(
  ( (Nil!7553) (Cons!7552 (h!8408 (_ BitVec 64)) (t!13190 List!7556)) )
))
(declare-fun arrayNoDuplicates!0 (array!26507 (_ BitVec 32) List!7556) Bool)

(assert (=> b!432937 (= res!254733 (arrayNoDuplicates!0 lt!198673 #b00000000000000000000000000000000 Nil!7553))))

(declare-fun b!432938 () Bool)

(declare-fun res!254734 () Bool)

(assert (=> b!432938 (=> (not res!254734) (not e!256033))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16221 0))(
  ( (V!16222 (val!5713 Int)) )
))
(declare-datatypes ((ValueCell!5325 0))(
  ( (ValueCellFull!5325 (v!7960 V!16221)) (EmptyCell!5325) )
))
(declare-datatypes ((array!26509 0))(
  ( (array!26510 (arr!12704 (Array (_ BitVec 32) ValueCell!5325)) (size!13056 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26509)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!432938 (= res!254734 (and (= (size!13056 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13055 _keys!709) (size!13056 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!254742 () Bool)

(assert (=> start!39918 (=> (not res!254742) (not e!256033))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39918 (= res!254742 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13055 _keys!709))))))

(assert (=> start!39918 e!256033))

(declare-fun tp_is_empty!11337 () Bool)

(assert (=> start!39918 tp_is_empty!11337))

(assert (=> start!39918 tp!36084))

(assert (=> start!39918 true))

(declare-fun e!256035 () Bool)

(declare-fun array_inv!9242 (array!26509) Bool)

(assert (=> start!39918 (and (array_inv!9242 _values!549) e!256035)))

(declare-fun array_inv!9243 (array!26507) Bool)

(assert (=> start!39918 (array_inv!9243 _keys!709)))

(declare-fun b!432939 () Bool)

(declare-fun e!256038 () Bool)

(assert (=> b!432939 (= e!256038 tp_is_empty!11337)))

(declare-fun b!432940 () Bool)

(declare-fun res!254737 () Bool)

(assert (=> b!432940 (=> (not res!254737) (not e!256036))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432940 (= res!254737 (bvsle from!863 i!563))))

(declare-fun b!432941 () Bool)

(declare-fun res!254741 () Bool)

(assert (=> b!432941 (=> (not res!254741) (not e!256033))))

(assert (=> b!432941 (= res!254741 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7553))))

(declare-fun b!432942 () Bool)

(declare-fun res!254732 () Bool)

(assert (=> b!432942 (=> (not res!254732) (not e!256033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432942 (= res!254732 (validMask!0 mask!1025))))

(declare-fun b!432943 () Bool)

(assert (=> b!432943 (= e!256033 e!256036)))

(declare-fun res!254743 () Bool)

(assert (=> b!432943 (=> (not res!254743) (not e!256036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26507 (_ BitVec 32)) Bool)

(assert (=> b!432943 (= res!254743 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198673 mask!1025))))

(assert (=> b!432943 (= lt!198673 (array!26508 (store (arr!12703 _keys!709) i!563 k0!794) (size!13055 _keys!709)))))

(declare-fun b!432944 () Bool)

(declare-fun e!256032 () Bool)

(assert (=> b!432944 (= e!256032 tp_is_empty!11337)))

(declare-fun b!432945 () Bool)

(declare-fun e!256037 () Bool)

(declare-fun e!256039 () Bool)

(assert (=> b!432945 (= e!256037 e!256039)))

(declare-fun res!254739 () Bool)

(assert (=> b!432945 (=> res!254739 e!256039)))

(assert (=> b!432945 (= res!254739 (= k0!794 (select (arr!12703 _keys!709) from!863)))))

(assert (=> b!432945 (not (= (select (arr!12703 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12800 0))(
  ( (Unit!12801) )
))
(declare-fun lt!198674 () Unit!12800)

(declare-fun e!256040 () Unit!12800)

(assert (=> b!432945 (= lt!198674 e!256040)))

(declare-fun c!55613 () Bool)

(assert (=> b!432945 (= c!55613 (= (select (arr!12703 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!7544 0))(
  ( (tuple2!7545 (_1!3783 (_ BitVec 64)) (_2!3783 V!16221)) )
))
(declare-datatypes ((List!7557 0))(
  ( (Nil!7554) (Cons!7553 (h!8409 tuple2!7544) (t!13191 List!7557)) )
))
(declare-datatypes ((ListLongMap!6457 0))(
  ( (ListLongMap!6458 (toList!3244 List!7557)) )
))
(declare-fun lt!198670 () ListLongMap!6457)

(declare-fun lt!198677 () ListLongMap!6457)

(assert (=> b!432945 (= lt!198670 lt!198677)))

(declare-fun lt!198666 () ListLongMap!6457)

(declare-fun lt!198672 () tuple2!7544)

(declare-fun +!1392 (ListLongMap!6457 tuple2!7544) ListLongMap!6457)

(assert (=> b!432945 (= lt!198677 (+!1392 lt!198666 lt!198672))))

(declare-fun lt!198675 () V!16221)

(assert (=> b!432945 (= lt!198672 (tuple2!7545 (select (arr!12703 _keys!709) from!863) lt!198675))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6317 (ValueCell!5325 V!16221) V!16221)

(declare-fun dynLambda!808 (Int (_ BitVec 64)) V!16221)

(assert (=> b!432945 (= lt!198675 (get!6317 (select (arr!12704 _values!549) from!863) (dynLambda!808 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432946 () Bool)

(declare-fun Unit!12802 () Unit!12800)

(assert (=> b!432946 (= e!256040 Unit!12802)))

(declare-fun lt!198671 () Unit!12800)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26507 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12800)

(assert (=> b!432946 (= lt!198671 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432946 false))

(declare-fun b!432947 () Bool)

(declare-fun e!256034 () Bool)

(assert (=> b!432947 (= e!256034 (not e!256037))))

(declare-fun res!254738 () Bool)

(assert (=> b!432947 (=> res!254738 e!256037)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432947 (= res!254738 (not (validKeyInArray!0 (select (arr!12703 _keys!709) from!863))))))

(declare-fun lt!198680 () ListLongMap!6457)

(assert (=> b!432947 (= lt!198680 lt!198666)))

(declare-fun lt!198667 () ListLongMap!6457)

(declare-fun lt!198676 () tuple2!7544)

(assert (=> b!432947 (= lt!198666 (+!1392 lt!198667 lt!198676))))

(declare-fun minValue!515 () V!16221)

(declare-fun zeroValue!515 () V!16221)

(declare-fun lt!198668 () array!26509)

(declare-fun getCurrentListMapNoExtraKeys!1441 (array!26507 array!26509 (_ BitVec 32) (_ BitVec 32) V!16221 V!16221 (_ BitVec 32) Int) ListLongMap!6457)

(assert (=> b!432947 (= lt!198680 (getCurrentListMapNoExtraKeys!1441 lt!198673 lt!198668 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16221)

(assert (=> b!432947 (= lt!198676 (tuple2!7545 k0!794 v!412))))

(assert (=> b!432947 (= lt!198667 (getCurrentListMapNoExtraKeys!1441 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198679 () Unit!12800)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!574 (array!26507 array!26509 (_ BitVec 32) (_ BitVec 32) V!16221 V!16221 (_ BitVec 32) (_ BitVec 64) V!16221 (_ BitVec 32) Int) Unit!12800)

(assert (=> b!432947 (= lt!198679 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!574 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432948 () Bool)

(declare-fun Unit!12803 () Unit!12800)

(assert (=> b!432948 (= e!256040 Unit!12803)))

(declare-fun b!432949 () Bool)

(declare-fun res!254735 () Bool)

(assert (=> b!432949 (=> (not res!254735) (not e!256033))))

(assert (=> b!432949 (= res!254735 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13055 _keys!709))))))

(declare-fun b!432950 () Bool)

(declare-fun res!254744 () Bool)

(assert (=> b!432950 (=> (not res!254744) (not e!256033))))

(assert (=> b!432950 (= res!254744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432951 () Bool)

(declare-fun res!254736 () Bool)

(assert (=> b!432951 (=> (not res!254736) (not e!256033))))

(assert (=> b!432951 (= res!254736 (validKeyInArray!0 k0!794))))

(declare-fun b!432952 () Bool)

(assert (=> b!432952 (= e!256039 true)))

(assert (=> b!432952 (= lt!198677 (+!1392 (+!1392 lt!198667 lt!198672) lt!198676))))

(declare-fun lt!198678 () Unit!12800)

(declare-fun addCommutativeForDiffKeys!381 (ListLongMap!6457 (_ BitVec 64) V!16221 (_ BitVec 64) V!16221) Unit!12800)

(assert (=> b!432952 (= lt!198678 (addCommutativeForDiffKeys!381 lt!198667 k0!794 v!412 (select (arr!12703 _keys!709) from!863) lt!198675))))

(declare-fun b!432953 () Bool)

(declare-fun mapRes!18627 () Bool)

(assert (=> b!432953 (= e!256035 (and e!256032 mapRes!18627))))

(declare-fun condMapEmpty!18627 () Bool)

(declare-fun mapDefault!18627 () ValueCell!5325)

(assert (=> b!432953 (= condMapEmpty!18627 (= (arr!12704 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5325)) mapDefault!18627)))))

(declare-fun b!432954 () Bool)

(declare-fun res!254731 () Bool)

(assert (=> b!432954 (=> (not res!254731) (not e!256033))))

(assert (=> b!432954 (= res!254731 (or (= (select (arr!12703 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12703 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432955 () Bool)

(assert (=> b!432955 (= e!256036 e!256034)))

(declare-fun res!254740 () Bool)

(assert (=> b!432955 (=> (not res!254740) (not e!256034))))

(assert (=> b!432955 (= res!254740 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!432955 (= lt!198670 (getCurrentListMapNoExtraKeys!1441 lt!198673 lt!198668 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432955 (= lt!198668 (array!26510 (store (arr!12704 _values!549) i!563 (ValueCellFull!5325 v!412)) (size!13056 _values!549)))))

(declare-fun lt!198669 () ListLongMap!6457)

(assert (=> b!432955 (= lt!198669 (getCurrentListMapNoExtraKeys!1441 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18627 () Bool)

(declare-fun tp!36083 () Bool)

(assert (=> mapNonEmpty!18627 (= mapRes!18627 (and tp!36083 e!256038))))

(declare-fun mapValue!18627 () ValueCell!5325)

(declare-fun mapRest!18627 () (Array (_ BitVec 32) ValueCell!5325))

(declare-fun mapKey!18627 () (_ BitVec 32))

(assert (=> mapNonEmpty!18627 (= (arr!12704 _values!549) (store mapRest!18627 mapKey!18627 mapValue!18627))))

(declare-fun mapIsEmpty!18627 () Bool)

(assert (=> mapIsEmpty!18627 mapRes!18627))

(assert (= (and start!39918 res!254742) b!432942))

(assert (= (and b!432942 res!254732) b!432938))

(assert (= (and b!432938 res!254734) b!432950))

(assert (= (and b!432950 res!254744) b!432941))

(assert (= (and b!432941 res!254741) b!432949))

(assert (= (and b!432949 res!254735) b!432951))

(assert (= (and b!432951 res!254736) b!432954))

(assert (= (and b!432954 res!254731) b!432936))

(assert (= (and b!432936 res!254745) b!432943))

(assert (= (and b!432943 res!254743) b!432937))

(assert (= (and b!432937 res!254733) b!432940))

(assert (= (and b!432940 res!254737) b!432955))

(assert (= (and b!432955 res!254740) b!432947))

(assert (= (and b!432947 (not res!254738)) b!432945))

(assert (= (and b!432945 c!55613) b!432946))

(assert (= (and b!432945 (not c!55613)) b!432948))

(assert (= (and b!432945 (not res!254739)) b!432952))

(assert (= (and b!432953 condMapEmpty!18627) mapIsEmpty!18627))

(assert (= (and b!432953 (not condMapEmpty!18627)) mapNonEmpty!18627))

(get-info :version)

(assert (= (and mapNonEmpty!18627 ((_ is ValueCellFull!5325) mapValue!18627)) b!432939))

(assert (= (and b!432953 ((_ is ValueCellFull!5325) mapDefault!18627)) b!432944))

(assert (= start!39918 b!432953))

(declare-fun b_lambda!9273 () Bool)

(assert (=> (not b_lambda!9273) (not b!432945)))

(declare-fun t!13189 () Bool)

(declare-fun tb!3591 () Bool)

(assert (=> (and start!39918 (= defaultEntry!557 defaultEntry!557) t!13189) tb!3591))

(declare-fun result!6709 () Bool)

(assert (=> tb!3591 (= result!6709 tp_is_empty!11337)))

(assert (=> b!432945 t!13189))

(declare-fun b_and!18031 () Bool)

(assert (= b_and!18029 (and (=> t!13189 result!6709) b_and!18031)))

(declare-fun m!420985 () Bool)

(assert (=> b!432954 m!420985))

(declare-fun m!420987 () Bool)

(assert (=> b!432947 m!420987))

(declare-fun m!420989 () Bool)

(assert (=> b!432947 m!420989))

(declare-fun m!420991 () Bool)

(assert (=> b!432947 m!420991))

(declare-fun m!420993 () Bool)

(assert (=> b!432947 m!420993))

(assert (=> b!432947 m!420987))

(declare-fun m!420995 () Bool)

(assert (=> b!432947 m!420995))

(declare-fun m!420997 () Bool)

(assert (=> b!432947 m!420997))

(declare-fun m!420999 () Bool)

(assert (=> b!432952 m!420999))

(assert (=> b!432952 m!420999))

(declare-fun m!421001 () Bool)

(assert (=> b!432952 m!421001))

(assert (=> b!432952 m!420987))

(assert (=> b!432952 m!420987))

(declare-fun m!421003 () Bool)

(assert (=> b!432952 m!421003))

(declare-fun m!421005 () Bool)

(assert (=> mapNonEmpty!18627 m!421005))

(declare-fun m!421007 () Bool)

(assert (=> b!432946 m!421007))

(declare-fun m!421009 () Bool)

(assert (=> b!432937 m!421009))

(declare-fun m!421011 () Bool)

(assert (=> b!432942 m!421011))

(declare-fun m!421013 () Bool)

(assert (=> b!432951 m!421013))

(declare-fun m!421015 () Bool)

(assert (=> b!432955 m!421015))

(declare-fun m!421017 () Bool)

(assert (=> b!432955 m!421017))

(declare-fun m!421019 () Bool)

(assert (=> b!432955 m!421019))

(declare-fun m!421021 () Bool)

(assert (=> b!432941 m!421021))

(declare-fun m!421023 () Bool)

(assert (=> b!432943 m!421023))

(declare-fun m!421025 () Bool)

(assert (=> b!432943 m!421025))

(declare-fun m!421027 () Bool)

(assert (=> b!432936 m!421027))

(assert (=> b!432945 m!420987))

(declare-fun m!421029 () Bool)

(assert (=> b!432945 m!421029))

(declare-fun m!421031 () Bool)

(assert (=> b!432945 m!421031))

(assert (=> b!432945 m!421031))

(assert (=> b!432945 m!421029))

(declare-fun m!421033 () Bool)

(assert (=> b!432945 m!421033))

(declare-fun m!421035 () Bool)

(assert (=> b!432945 m!421035))

(declare-fun m!421037 () Bool)

(assert (=> start!39918 m!421037))

(declare-fun m!421039 () Bool)

(assert (=> start!39918 m!421039))

(declare-fun m!421041 () Bool)

(assert (=> b!432950 m!421041))

(check-sat (not b!432946) (not b!432955) (not b!432942) (not b!432952) b_and!18031 (not b!432936) (not b!432937) (not b!432951) (not mapNonEmpty!18627) (not start!39918) (not b!432947) (not b!432950) (not b!432941) (not b_lambda!9273) tp_is_empty!11337 (not b_next!10185) (not b!432943) (not b!432945))
(check-sat b_and!18031 (not b_next!10185))
