; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39980 () Bool)

(assert start!39980)

(declare-fun b_free!10247 () Bool)

(declare-fun b_next!10247 () Bool)

(assert (=> start!39980 (= b_free!10247 (not b_next!10247))))

(declare-fun tp!36269 () Bool)

(declare-fun b_and!18153 () Bool)

(assert (=> start!39980 (= tp!36269 b_and!18153)))

(declare-fun b!434858 () Bool)

(declare-fun e!256965 () Bool)

(declare-fun tp_is_empty!11399 () Bool)

(assert (=> b!434858 (= e!256965 tp_is_empty!11399)))

(declare-fun b!434859 () Bool)

(declare-fun res!256136 () Bool)

(declare-fun e!256966 () Bool)

(assert (=> b!434859 (=> (not res!256136) (not e!256966))))

(declare-datatypes ((array!26629 0))(
  ( (array!26630 (arr!12764 (Array (_ BitVec 32) (_ BitVec 64))) (size!13116 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26629)

(declare-datatypes ((List!7607 0))(
  ( (Nil!7604) (Cons!7603 (h!8459 (_ BitVec 64)) (t!13303 List!7607)) )
))
(declare-fun arrayNoDuplicates!0 (array!26629 (_ BitVec 32) List!7607) Bool)

(assert (=> b!434859 (= res!256136 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7604))))

(declare-fun b!434860 () Bool)

(declare-fun res!256132 () Bool)

(assert (=> b!434860 (=> (not res!256132) (not e!256966))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16303 0))(
  ( (V!16304 (val!5744 Int)) )
))
(declare-datatypes ((ValueCell!5356 0))(
  ( (ValueCellFull!5356 (v!7991 V!16303)) (EmptyCell!5356) )
))
(declare-datatypes ((array!26631 0))(
  ( (array!26632 (arr!12765 (Array (_ BitVec 32) ValueCell!5356)) (size!13117 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26631)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!434860 (= res!256132 (and (= (size!13117 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13116 _keys!709) (size!13117 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!434861 () Bool)

(declare-fun e!256967 () Bool)

(assert (=> b!434861 (= e!256967 tp_is_empty!11399)))

(declare-fun b!434862 () Bool)

(declare-fun res!256139 () Bool)

(assert (=> b!434862 (=> (not res!256139) (not e!256966))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!434862 (= res!256139 (validKeyInArray!0 k!794))))

(declare-fun b!434863 () Bool)

(declare-fun res!256134 () Bool)

(assert (=> b!434863 (=> (not res!256134) (not e!256966))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!434863 (= res!256134 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13116 _keys!709))))))

(declare-fun b!434864 () Bool)

(declare-fun res!256138 () Bool)

(declare-fun e!256971 () Bool)

(assert (=> b!434864 (=> (not res!256138) (not e!256971))))

(declare-fun lt!200064 () array!26629)

(assert (=> b!434864 (= res!256138 (arrayNoDuplicates!0 lt!200064 #b00000000000000000000000000000000 Nil!7604))))

(declare-fun b!434865 () Bool)

(declare-fun e!256963 () Bool)

(assert (=> b!434865 (= e!256963 true)))

(declare-datatypes ((tuple2!7604 0))(
  ( (tuple2!7605 (_1!3813 (_ BitVec 64)) (_2!3813 V!16303)) )
))
(declare-fun lt!200072 () tuple2!7604)

(declare-datatypes ((List!7608 0))(
  ( (Nil!7605) (Cons!7604 (h!8460 tuple2!7604) (t!13304 List!7608)) )
))
(declare-datatypes ((ListLongMap!6517 0))(
  ( (ListLongMap!6518 (toList!3274 List!7608)) )
))
(declare-fun lt!200070 () ListLongMap!6517)

(declare-fun lt!200067 () ListLongMap!6517)

(declare-fun lt!200073 () tuple2!7604)

(declare-fun +!1422 (ListLongMap!6517 tuple2!7604) ListLongMap!6517)

(assert (=> b!434865 (= lt!200067 (+!1422 (+!1422 lt!200070 lt!200073) lt!200072))))

(declare-fun lt!200068 () V!16303)

(declare-datatypes ((Unit!12903 0))(
  ( (Unit!12904) )
))
(declare-fun lt!200061 () Unit!12903)

(declare-fun v!412 () V!16303)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!406 (ListLongMap!6517 (_ BitVec 64) V!16303 (_ BitVec 64) V!16303) Unit!12903)

(assert (=> b!434865 (= lt!200061 (addCommutativeForDiffKeys!406 lt!200070 k!794 v!412 (select (arr!12764 _keys!709) from!863) lt!200068))))

(declare-fun b!434866 () Bool)

(declare-fun e!256968 () Unit!12903)

(declare-fun Unit!12905 () Unit!12903)

(assert (=> b!434866 (= e!256968 Unit!12905)))

(declare-fun b!434867 () Bool)

(declare-fun e!256964 () Bool)

(assert (=> b!434867 (= e!256971 e!256964)))

(declare-fun res!256128 () Bool)

(assert (=> b!434867 (=> (not res!256128) (not e!256964))))

(assert (=> b!434867 (= res!256128 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16303)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16303)

(declare-fun lt!200069 () ListLongMap!6517)

(declare-fun lt!200071 () array!26631)

(declare-fun getCurrentListMapNoExtraKeys!1465 (array!26629 array!26631 (_ BitVec 32) (_ BitVec 32) V!16303 V!16303 (_ BitVec 32) Int) ListLongMap!6517)

(assert (=> b!434867 (= lt!200069 (getCurrentListMapNoExtraKeys!1465 lt!200064 lt!200071 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!434867 (= lt!200071 (array!26632 (store (arr!12765 _values!549) i!563 (ValueCellFull!5356 v!412)) (size!13117 _values!549)))))

(declare-fun lt!200066 () ListLongMap!6517)

(assert (=> b!434867 (= lt!200066 (getCurrentListMapNoExtraKeys!1465 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!434868 () Bool)

(declare-fun res!256129 () Bool)

(assert (=> b!434868 (=> (not res!256129) (not e!256966))))

(declare-fun arrayContainsKey!0 (array!26629 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!434868 (= res!256129 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!434869 () Bool)

(declare-fun e!256962 () Bool)

(assert (=> b!434869 (= e!256962 e!256963)))

(declare-fun res!256140 () Bool)

(assert (=> b!434869 (=> res!256140 e!256963)))

(assert (=> b!434869 (= res!256140 (= k!794 (select (arr!12764 _keys!709) from!863)))))

(assert (=> b!434869 (not (= (select (arr!12764 _keys!709) from!863) k!794))))

(declare-fun lt!200074 () Unit!12903)

(assert (=> b!434869 (= lt!200074 e!256968)))

(declare-fun c!55706 () Bool)

(assert (=> b!434869 (= c!55706 (= (select (arr!12764 _keys!709) from!863) k!794))))

(assert (=> b!434869 (= lt!200069 lt!200067)))

(declare-fun lt!200075 () ListLongMap!6517)

(assert (=> b!434869 (= lt!200067 (+!1422 lt!200075 lt!200073))))

(assert (=> b!434869 (= lt!200073 (tuple2!7605 (select (arr!12764 _keys!709) from!863) lt!200068))))

(declare-fun get!6359 (ValueCell!5356 V!16303) V!16303)

(declare-fun dynLambda!830 (Int (_ BitVec 64)) V!16303)

(assert (=> b!434869 (= lt!200068 (get!6359 (select (arr!12765 _values!549) from!863) (dynLambda!830 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434870 () Bool)

(declare-fun res!256126 () Bool)

(assert (=> b!434870 (=> (not res!256126) (not e!256966))))

(assert (=> b!434870 (= res!256126 (or (= (select (arr!12764 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12764 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!434871 () Bool)

(declare-fun res!256133 () Bool)

(assert (=> b!434871 (=> (not res!256133) (not e!256971))))

(assert (=> b!434871 (= res!256133 (bvsle from!863 i!563))))

(declare-fun b!434872 () Bool)

(declare-fun Unit!12906 () Unit!12903)

(assert (=> b!434872 (= e!256968 Unit!12906)))

(declare-fun lt!200065 () Unit!12903)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26629 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12903)

(assert (=> b!434872 (= lt!200065 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!434872 false))

(declare-fun mapIsEmpty!18720 () Bool)

(declare-fun mapRes!18720 () Bool)

(assert (=> mapIsEmpty!18720 mapRes!18720))

(declare-fun b!434873 () Bool)

(assert (=> b!434873 (= e!256964 (not e!256962))))

(declare-fun res!256131 () Bool)

(assert (=> b!434873 (=> res!256131 e!256962)))

(assert (=> b!434873 (= res!256131 (not (validKeyInArray!0 (select (arr!12764 _keys!709) from!863))))))

(declare-fun lt!200062 () ListLongMap!6517)

(assert (=> b!434873 (= lt!200062 lt!200075)))

(assert (=> b!434873 (= lt!200075 (+!1422 lt!200070 lt!200072))))

(assert (=> b!434873 (= lt!200062 (getCurrentListMapNoExtraKeys!1465 lt!200064 lt!200071 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!434873 (= lt!200072 (tuple2!7605 k!794 v!412))))

(assert (=> b!434873 (= lt!200070 (getCurrentListMapNoExtraKeys!1465 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!200063 () Unit!12903)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!595 (array!26629 array!26631 (_ BitVec 32) (_ BitVec 32) V!16303 V!16303 (_ BitVec 32) (_ BitVec 64) V!16303 (_ BitVec 32) Int) Unit!12903)

(assert (=> b!434873 (= lt!200063 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!595 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!434874 () Bool)

(declare-fun res!256135 () Bool)

(assert (=> b!434874 (=> (not res!256135) (not e!256966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!434874 (= res!256135 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18720 () Bool)

(declare-fun tp!36270 () Bool)

(assert (=> mapNonEmpty!18720 (= mapRes!18720 (and tp!36270 e!256965))))

(declare-fun mapRest!18720 () (Array (_ BitVec 32) ValueCell!5356))

(declare-fun mapKey!18720 () (_ BitVec 32))

(declare-fun mapValue!18720 () ValueCell!5356)

(assert (=> mapNonEmpty!18720 (= (arr!12765 _values!549) (store mapRest!18720 mapKey!18720 mapValue!18720))))

(declare-fun b!434875 () Bool)

(declare-fun e!256969 () Bool)

(assert (=> b!434875 (= e!256969 (and e!256967 mapRes!18720))))

(declare-fun condMapEmpty!18720 () Bool)

(declare-fun mapDefault!18720 () ValueCell!5356)

