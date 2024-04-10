; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40022 () Bool)

(assert start!40022)

(declare-fun b_free!10289 () Bool)

(declare-fun b_next!10289 () Bool)

(assert (=> start!40022 (= b_free!10289 (not b_next!10289))))

(declare-fun tp!36396 () Bool)

(declare-fun b_and!18237 () Bool)

(assert (=> start!40022 (= tp!36396 b_and!18237)))

(declare-fun b!436160 () Bool)

(declare-fun res!257072 () Bool)

(declare-fun e!257596 () Bool)

(assert (=> b!436160 (=> (not res!257072) (not e!257596))))

(declare-datatypes ((array!26707 0))(
  ( (array!26708 (arr!12803 (Array (_ BitVec 32) (_ BitVec 64))) (size!13155 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26707)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!16359 0))(
  ( (V!16360 (val!5765 Int)) )
))
(declare-datatypes ((ValueCell!5377 0))(
  ( (ValueCellFull!5377 (v!8012 V!16359)) (EmptyCell!5377) )
))
(declare-datatypes ((array!26709 0))(
  ( (array!26710 (arr!12804 (Array (_ BitVec 32) ValueCell!5377)) (size!13156 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26709)

(assert (=> b!436160 (= res!257072 (and (= (size!13156 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13155 _keys!709) (size!13156 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!436161 () Bool)

(declare-fun e!257594 () Bool)

(declare-fun e!257597 () Bool)

(assert (=> b!436161 (= e!257594 (not e!257597))))

(declare-fun res!257085 () Bool)

(assert (=> b!436161 (=> res!257085 e!257597)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436161 (= res!257085 (not (validKeyInArray!0 (select (arr!12803 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7636 0))(
  ( (tuple2!7637 (_1!3829 (_ BitVec 64)) (_2!3829 V!16359)) )
))
(declare-datatypes ((List!7637 0))(
  ( (Nil!7634) (Cons!7633 (h!8489 tuple2!7636) (t!13375 List!7637)) )
))
(declare-datatypes ((ListLongMap!6549 0))(
  ( (ListLongMap!6550 (toList!3290 List!7637)) )
))
(declare-fun lt!201012 () ListLongMap!6549)

(declare-fun lt!201008 () ListLongMap!6549)

(assert (=> b!436161 (= lt!201012 lt!201008)))

(declare-fun lt!201018 () ListLongMap!6549)

(declare-fun lt!201007 () tuple2!7636)

(declare-fun +!1438 (ListLongMap!6549 tuple2!7636) ListLongMap!6549)

(assert (=> b!436161 (= lt!201008 (+!1438 lt!201018 lt!201007))))

(declare-fun minValue!515 () V!16359)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16359)

(declare-fun lt!201015 () array!26707)

(declare-fun lt!201017 () array!26709)

(declare-fun getCurrentListMapNoExtraKeys!1480 (array!26707 array!26709 (_ BitVec 32) (_ BitVec 32) V!16359 V!16359 (_ BitVec 32) Int) ListLongMap!6549)

(assert (=> b!436161 (= lt!201012 (getCurrentListMapNoExtraKeys!1480 lt!201015 lt!201017 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!16359)

(assert (=> b!436161 (= lt!201007 (tuple2!7637 k!794 v!412))))

(assert (=> b!436161 (= lt!201018 (getCurrentListMapNoExtraKeys!1480 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12965 0))(
  ( (Unit!12966) )
))
(declare-fun lt!201013 () Unit!12965)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!609 (array!26707 array!26709 (_ BitVec 32) (_ BitVec 32) V!16359 V!16359 (_ BitVec 32) (_ BitVec 64) V!16359 (_ BitVec 32) Int) Unit!12965)

(assert (=> b!436161 (= lt!201013 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!609 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436162 () Bool)

(declare-fun e!257595 () Bool)

(assert (=> b!436162 (= e!257597 e!257595)))

(declare-fun res!257082 () Bool)

(assert (=> b!436162 (=> res!257082 e!257595)))

(assert (=> b!436162 (= res!257082 (= k!794 (select (arr!12803 _keys!709) from!863)))))

(assert (=> b!436162 (not (= (select (arr!12803 _keys!709) from!863) k!794))))

(declare-fun lt!201006 () Unit!12965)

(declare-fun e!257598 () Unit!12965)

(assert (=> b!436162 (= lt!201006 e!257598)))

(declare-fun c!55769 () Bool)

(assert (=> b!436162 (= c!55769 (= (select (arr!12803 _keys!709) from!863) k!794))))

(declare-fun lt!201011 () ListLongMap!6549)

(declare-fun lt!201016 () ListLongMap!6549)

(assert (=> b!436162 (= lt!201011 lt!201016)))

(declare-fun lt!201019 () tuple2!7636)

(assert (=> b!436162 (= lt!201016 (+!1438 lt!201008 lt!201019))))

(declare-fun lt!201010 () V!16359)

(assert (=> b!436162 (= lt!201019 (tuple2!7637 (select (arr!12803 _keys!709) from!863) lt!201010))))

(declare-fun get!6386 (ValueCell!5377 V!16359) V!16359)

(declare-fun dynLambda!843 (Int (_ BitVec 64)) V!16359)

(assert (=> b!436162 (= lt!201010 (get!6386 (select (arr!12804 _values!549) from!863) (dynLambda!843 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436163 () Bool)

(declare-fun res!257071 () Bool)

(declare-fun e!257601 () Bool)

(assert (=> b!436163 (=> (not res!257071) (not e!257601))))

(assert (=> b!436163 (= res!257071 (bvsle from!863 i!563))))

(declare-fun b!436164 () Bool)

(assert (=> b!436164 (= e!257601 e!257594)))

(declare-fun res!257073 () Bool)

(assert (=> b!436164 (=> (not res!257073) (not e!257594))))

(assert (=> b!436164 (= res!257073 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!436164 (= lt!201011 (getCurrentListMapNoExtraKeys!1480 lt!201015 lt!201017 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436164 (= lt!201017 (array!26710 (store (arr!12804 _values!549) i!563 (ValueCellFull!5377 v!412)) (size!13156 _values!549)))))

(declare-fun lt!201009 () ListLongMap!6549)

(assert (=> b!436164 (= lt!201009 (getCurrentListMapNoExtraKeys!1480 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!257080 () Bool)

(assert (=> start!40022 (=> (not res!257080) (not e!257596))))

(assert (=> start!40022 (= res!257080 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13155 _keys!709))))))

(assert (=> start!40022 e!257596))

(declare-fun tp_is_empty!11441 () Bool)

(assert (=> start!40022 tp_is_empty!11441))

(assert (=> start!40022 tp!36396))

(assert (=> start!40022 true))

(declare-fun e!257593 () Bool)

(declare-fun array_inv!9306 (array!26709) Bool)

(assert (=> start!40022 (and (array_inv!9306 _values!549) e!257593)))

(declare-fun array_inv!9307 (array!26707) Bool)

(assert (=> start!40022 (array_inv!9307 _keys!709)))

(declare-fun b!436165 () Bool)

(declare-fun res!257079 () Bool)

(assert (=> b!436165 (=> (not res!257079) (not e!257596))))

(declare-fun arrayContainsKey!0 (array!26707 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436165 (= res!257079 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!436166 () Bool)

(declare-fun res!257081 () Bool)

(assert (=> b!436166 (=> (not res!257081) (not e!257596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26707 (_ BitVec 32)) Bool)

(assert (=> b!436166 (= res!257081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436167 () Bool)

(declare-fun res!257074 () Bool)

(assert (=> b!436167 (=> (not res!257074) (not e!257596))))

(assert (=> b!436167 (= res!257074 (or (= (select (arr!12803 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12803 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436168 () Bool)

(declare-fun res!257076 () Bool)

(assert (=> b!436168 (=> (not res!257076) (not e!257596))))

(assert (=> b!436168 (= res!257076 (validKeyInArray!0 k!794))))

(declare-fun b!436169 () Bool)

(assert (=> b!436169 (= e!257595 true)))

(assert (=> b!436169 (= lt!201016 (+!1438 (+!1438 lt!201018 lt!201019) lt!201007))))

(declare-fun lt!201020 () Unit!12965)

(declare-fun addCommutativeForDiffKeys!420 (ListLongMap!6549 (_ BitVec 64) V!16359 (_ BitVec 64) V!16359) Unit!12965)

(assert (=> b!436169 (= lt!201020 (addCommutativeForDiffKeys!420 lt!201018 k!794 v!412 (select (arr!12803 _keys!709) from!863) lt!201010))))

(declare-fun b!436170 () Bool)

(declare-fun e!257600 () Bool)

(assert (=> b!436170 (= e!257600 tp_is_empty!11441)))

(declare-fun b!436171 () Bool)

(declare-fun e!257592 () Bool)

(assert (=> b!436171 (= e!257592 tp_is_empty!11441)))

(declare-fun b!436172 () Bool)

(declare-fun res!257077 () Bool)

(assert (=> b!436172 (=> (not res!257077) (not e!257596))))

(assert (=> b!436172 (= res!257077 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13155 _keys!709))))))

(declare-fun mapIsEmpty!18783 () Bool)

(declare-fun mapRes!18783 () Bool)

(assert (=> mapIsEmpty!18783 mapRes!18783))

(declare-fun b!436173 () Bool)

(declare-fun res!257075 () Bool)

(assert (=> b!436173 (=> (not res!257075) (not e!257596))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436173 (= res!257075 (validMask!0 mask!1025))))

(declare-fun b!436174 () Bool)

(assert (=> b!436174 (= e!257596 e!257601)))

(declare-fun res!257078 () Bool)

(assert (=> b!436174 (=> (not res!257078) (not e!257601))))

(assert (=> b!436174 (= res!257078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201015 mask!1025))))

(assert (=> b!436174 (= lt!201015 (array!26708 (store (arr!12803 _keys!709) i!563 k!794) (size!13155 _keys!709)))))

(declare-fun b!436175 () Bool)

(declare-fun res!257084 () Bool)

(assert (=> b!436175 (=> (not res!257084) (not e!257601))))

(declare-datatypes ((List!7638 0))(
  ( (Nil!7635) (Cons!7634 (h!8490 (_ BitVec 64)) (t!13376 List!7638)) )
))
(declare-fun arrayNoDuplicates!0 (array!26707 (_ BitVec 32) List!7638) Bool)

(assert (=> b!436175 (= res!257084 (arrayNoDuplicates!0 lt!201015 #b00000000000000000000000000000000 Nil!7635))))

(declare-fun mapNonEmpty!18783 () Bool)

(declare-fun tp!36395 () Bool)

(assert (=> mapNonEmpty!18783 (= mapRes!18783 (and tp!36395 e!257600))))

(declare-fun mapKey!18783 () (_ BitVec 32))

(declare-fun mapValue!18783 () ValueCell!5377)

(declare-fun mapRest!18783 () (Array (_ BitVec 32) ValueCell!5377))

(assert (=> mapNonEmpty!18783 (= (arr!12804 _values!549) (store mapRest!18783 mapKey!18783 mapValue!18783))))

(declare-fun b!436176 () Bool)

(declare-fun Unit!12967 () Unit!12965)

(assert (=> b!436176 (= e!257598 Unit!12967)))

(declare-fun b!436177 () Bool)

(declare-fun Unit!12968 () Unit!12965)

(assert (=> b!436177 (= e!257598 Unit!12968)))

(declare-fun lt!201014 () Unit!12965)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26707 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12965)

(assert (=> b!436177 (= lt!201014 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!436177 false))

(declare-fun b!436178 () Bool)

(declare-fun res!257083 () Bool)

(assert (=> b!436178 (=> (not res!257083) (not e!257596))))

(assert (=> b!436178 (= res!257083 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7635))))

(declare-fun b!436179 () Bool)

(assert (=> b!436179 (= e!257593 (and e!257592 mapRes!18783))))

(declare-fun condMapEmpty!18783 () Bool)

(declare-fun mapDefault!18783 () ValueCell!5377)

