; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39878 () Bool)

(assert start!39878)

(declare-fun b_free!10145 () Bool)

(declare-fun b_next!10145 () Bool)

(assert (=> start!39878 (= b_free!10145 (not b_next!10145))))

(declare-fun tp!35963 () Bool)

(declare-fun b_and!17949 () Bool)

(assert (=> start!39878 (= tp!35963 b_and!17949)))

(declare-fun b!431696 () Bool)

(declare-fun res!253833 () Bool)

(declare-fun e!255435 () Bool)

(assert (=> b!431696 (=> (not res!253833) (not e!255435))))

(declare-datatypes ((array!26429 0))(
  ( (array!26430 (arr!12664 (Array (_ BitVec 32) (_ BitVec 64))) (size!13016 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26429)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!431696 (= res!253833 (or (= (select (arr!12664 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12664 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431697 () Bool)

(declare-datatypes ((Unit!12732 0))(
  ( (Unit!12733) )
))
(declare-fun e!255434 () Unit!12732)

(declare-fun Unit!12734 () Unit!12732)

(assert (=> b!431697 (= e!255434 Unit!12734)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!197775 () Unit!12732)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26429 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12732)

(assert (=> b!431697 (= lt!197775 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!431697 false))

(declare-fun b!431698 () Bool)

(declare-fun Unit!12735 () Unit!12732)

(assert (=> b!431698 (= e!255434 Unit!12735)))

(declare-fun b!431699 () Bool)

(declare-fun res!253835 () Bool)

(assert (=> b!431699 (=> (not res!253835) (not e!255435))))

(assert (=> b!431699 (= res!253835 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13016 _keys!709))))))

(declare-fun b!431700 () Bool)

(declare-fun res!253834 () Bool)

(assert (=> b!431700 (=> (not res!253834) (not e!255435))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16167 0))(
  ( (V!16168 (val!5693 Int)) )
))
(declare-datatypes ((ValueCell!5305 0))(
  ( (ValueCellFull!5305 (v!7940 V!16167)) (EmptyCell!5305) )
))
(declare-datatypes ((array!26431 0))(
  ( (array!26432 (arr!12665 (Array (_ BitVec 32) ValueCell!5305)) (size!13017 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26431)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!431700 (= res!253834 (and (= (size!13017 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13016 _keys!709) (size!13017 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!431701 () Bool)

(declare-fun res!253836 () Bool)

(declare-fun e!255432 () Bool)

(assert (=> b!431701 (=> (not res!253836) (not e!255432))))

(declare-fun lt!197778 () array!26429)

(declare-datatypes ((List!7524 0))(
  ( (Nil!7521) (Cons!7520 (h!8376 (_ BitVec 64)) (t!13118 List!7524)) )
))
(declare-fun arrayNoDuplicates!0 (array!26429 (_ BitVec 32) List!7524) Bool)

(assert (=> b!431701 (= res!253836 (arrayNoDuplicates!0 lt!197778 #b00000000000000000000000000000000 Nil!7521))))

(declare-fun b!431702 () Bool)

(declare-fun e!255441 () Bool)

(declare-fun e!255438 () Bool)

(assert (=> b!431702 (= e!255441 (not e!255438))))

(declare-fun res!253837 () Bool)

(assert (=> b!431702 (=> res!253837 e!255438)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!431702 (= res!253837 (not (validKeyInArray!0 (select (arr!12664 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7510 0))(
  ( (tuple2!7511 (_1!3766 (_ BitVec 64)) (_2!3766 V!16167)) )
))
(declare-datatypes ((List!7525 0))(
  ( (Nil!7522) (Cons!7521 (h!8377 tuple2!7510) (t!13119 List!7525)) )
))
(declare-datatypes ((ListLongMap!6423 0))(
  ( (ListLongMap!6424 (toList!3227 List!7525)) )
))
(declare-fun lt!197779 () ListLongMap!6423)

(declare-fun lt!197768 () ListLongMap!6423)

(assert (=> b!431702 (= lt!197779 lt!197768)))

(declare-fun lt!197771 () ListLongMap!6423)

(declare-fun lt!197774 () tuple2!7510)

(declare-fun +!1375 (ListLongMap!6423 tuple2!7510) ListLongMap!6423)

(assert (=> b!431702 (= lt!197768 (+!1375 lt!197771 lt!197774))))

(declare-fun minValue!515 () V!16167)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16167)

(declare-fun lt!197767 () array!26431)

(declare-fun getCurrentListMapNoExtraKeys!1425 (array!26429 array!26431 (_ BitVec 32) (_ BitVec 32) V!16167 V!16167 (_ BitVec 32) Int) ListLongMap!6423)

(assert (=> b!431702 (= lt!197779 (getCurrentListMapNoExtraKeys!1425 lt!197778 lt!197767 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16167)

(assert (=> b!431702 (= lt!197774 (tuple2!7511 k!794 v!412))))

(assert (=> b!431702 (= lt!197771 (getCurrentListMapNoExtraKeys!1425 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!197773 () Unit!12732)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!560 (array!26429 array!26431 (_ BitVec 32) (_ BitVec 32) V!16167 V!16167 (_ BitVec 32) (_ BitVec 64) V!16167 (_ BitVec 32) Int) Unit!12732)

(assert (=> b!431702 (= lt!197773 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!560 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18567 () Bool)

(declare-fun mapRes!18567 () Bool)

(assert (=> mapIsEmpty!18567 mapRes!18567))

(declare-fun b!431703 () Bool)

(assert (=> b!431703 (= e!255435 e!255432)))

(declare-fun res!253831 () Bool)

(assert (=> b!431703 (=> (not res!253831) (not e!255432))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26429 (_ BitVec 32)) Bool)

(assert (=> b!431703 (= res!253831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!197778 mask!1025))))

(assert (=> b!431703 (= lt!197778 (array!26430 (store (arr!12664 _keys!709) i!563 k!794) (size!13016 _keys!709)))))

(declare-fun b!431704 () Bool)

(assert (=> b!431704 (= e!255432 e!255441)))

(declare-fun res!253839 () Bool)

(assert (=> b!431704 (=> (not res!253839) (not e!255441))))

(assert (=> b!431704 (= res!253839 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!197777 () ListLongMap!6423)

(assert (=> b!431704 (= lt!197777 (getCurrentListMapNoExtraKeys!1425 lt!197778 lt!197767 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!431704 (= lt!197767 (array!26432 (store (arr!12665 _values!549) i!563 (ValueCellFull!5305 v!412)) (size!13017 _values!549)))))

(declare-fun lt!197772 () ListLongMap!6423)

(assert (=> b!431704 (= lt!197772 (getCurrentListMapNoExtraKeys!1425 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!431705 () Bool)

(declare-fun e!255436 () Bool)

(assert (=> b!431705 (= e!255436 true)))

(declare-fun lt!197776 () ListLongMap!6423)

(declare-fun lt!197780 () tuple2!7510)

(assert (=> b!431705 (= lt!197776 (+!1375 (+!1375 lt!197771 lt!197780) lt!197774))))

(declare-fun lt!197766 () V!16167)

(declare-fun lt!197770 () Unit!12732)

(declare-fun addCommutativeForDiffKeys!367 (ListLongMap!6423 (_ BitVec 64) V!16167 (_ BitVec 64) V!16167) Unit!12732)

(assert (=> b!431705 (= lt!197770 (addCommutativeForDiffKeys!367 lt!197771 k!794 v!412 (select (arr!12664 _keys!709) from!863) lt!197766))))

(declare-fun b!431706 () Bool)

(declare-fun res!253841 () Bool)

(assert (=> b!431706 (=> (not res!253841) (not e!255435))))

(assert (=> b!431706 (= res!253841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!431707 () Bool)

(declare-fun res!253845 () Bool)

(assert (=> b!431707 (=> (not res!253845) (not e!255432))))

(assert (=> b!431707 (= res!253845 (bvsle from!863 i!563))))

(declare-fun b!431708 () Bool)

(assert (=> b!431708 (= e!255438 e!255436)))

(declare-fun res!253842 () Bool)

(assert (=> b!431708 (=> res!253842 e!255436)))

(assert (=> b!431708 (= res!253842 (= k!794 (select (arr!12664 _keys!709) from!863)))))

(assert (=> b!431708 (not (= (select (arr!12664 _keys!709) from!863) k!794))))

(declare-fun lt!197769 () Unit!12732)

(assert (=> b!431708 (= lt!197769 e!255434)))

(declare-fun c!55553 () Bool)

(assert (=> b!431708 (= c!55553 (= (select (arr!12664 _keys!709) from!863) k!794))))

(assert (=> b!431708 (= lt!197777 lt!197776)))

(assert (=> b!431708 (= lt!197776 (+!1375 lt!197768 lt!197780))))

(assert (=> b!431708 (= lt!197780 (tuple2!7511 (select (arr!12664 _keys!709) from!863) lt!197766))))

(declare-fun get!6291 (ValueCell!5305 V!16167) V!16167)

(declare-fun dynLambda!796 (Int (_ BitVec 64)) V!16167)

(assert (=> b!431708 (= lt!197766 (get!6291 (select (arr!12665 _values!549) from!863) (dynLambda!796 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!431709 () Bool)

(declare-fun res!253840 () Bool)

(assert (=> b!431709 (=> (not res!253840) (not e!255435))))

(assert (=> b!431709 (= res!253840 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7521))))

(declare-fun b!431710 () Bool)

(declare-fun e!255440 () Bool)

(declare-fun e!255437 () Bool)

(assert (=> b!431710 (= e!255440 (and e!255437 mapRes!18567))))

(declare-fun condMapEmpty!18567 () Bool)

(declare-fun mapDefault!18567 () ValueCell!5305)

