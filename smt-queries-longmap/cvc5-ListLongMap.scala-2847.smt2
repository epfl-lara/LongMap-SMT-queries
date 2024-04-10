; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41068 () Bool)

(assert start!41068)

(declare-fun b_free!10981 () Bool)

(declare-fun b_next!10981 () Bool)

(assert (=> start!41068 (= b_free!10981 (not b_next!10981))))

(declare-fun tp!38773 () Bool)

(declare-fun b_and!19169 () Bool)

(assert (=> start!41068 (= tp!38773 b_and!19169)))

(declare-fun b!458038 () Bool)

(declare-fun res!273602 () Bool)

(declare-fun e!267448 () Bool)

(assert (=> b!458038 (=> (not res!273602) (not e!267448))))

(declare-datatypes ((array!28439 0))(
  ( (array!28440 (arr!13662 (Array (_ BitVec 32) (_ BitVec 64))) (size!14014 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28439)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17531 0))(
  ( (V!17532 (val!6204 Int)) )
))
(declare-datatypes ((ValueCell!5816 0))(
  ( (ValueCellFull!5816 (v!8474 V!17531)) (EmptyCell!5816) )
))
(declare-datatypes ((array!28441 0))(
  ( (array!28442 (arr!13663 (Array (_ BitVec 32) ValueCell!5816)) (size!14015 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28441)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!458038 (= res!273602 (and (= (size!14015 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14014 _keys!709) (size!14015 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!20122 () Bool)

(declare-fun mapRes!20122 () Bool)

(assert (=> mapIsEmpty!20122 mapRes!20122))

(declare-fun b!458039 () Bool)

(declare-fun e!267445 () Bool)

(declare-fun e!267444 () Bool)

(assert (=> b!458039 (= e!267445 (not e!267444))))

(declare-fun res!273607 () Bool)

(assert (=> b!458039 (=> res!273607 e!267444)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458039 (= res!273607 (not (validKeyInArray!0 (select (arr!13662 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8174 0))(
  ( (tuple2!8175 (_1!4098 (_ BitVec 64)) (_2!4098 V!17531)) )
))
(declare-datatypes ((List!8247 0))(
  ( (Nil!8244) (Cons!8243 (h!9099 tuple2!8174) (t!14107 List!8247)) )
))
(declare-datatypes ((ListLongMap!7087 0))(
  ( (ListLongMap!7088 (toList!3559 List!8247)) )
))
(declare-fun lt!207189 () ListLongMap!7087)

(declare-fun lt!207191 () ListLongMap!7087)

(assert (=> b!458039 (= lt!207189 lt!207191)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!17531)

(declare-fun lt!207190 () ListLongMap!7087)

(declare-fun +!1595 (ListLongMap!7087 tuple2!8174) ListLongMap!7087)

(assert (=> b!458039 (= lt!207191 (+!1595 lt!207190 (tuple2!8175 k!794 v!412)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!207188 () array!28439)

(declare-fun zeroValue!515 () V!17531)

(declare-fun lt!207192 () array!28441)

(declare-fun minValue!515 () V!17531)

(declare-fun getCurrentListMapNoExtraKeys!1741 (array!28439 array!28441 (_ BitVec 32) (_ BitVec 32) V!17531 V!17531 (_ BitVec 32) Int) ListLongMap!7087)

(assert (=> b!458039 (= lt!207189 (getCurrentListMapNoExtraKeys!1741 lt!207188 lt!207192 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458039 (= lt!207190 (getCurrentListMapNoExtraKeys!1741 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13310 0))(
  ( (Unit!13311) )
))
(declare-fun lt!207185 () Unit!13310)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!754 (array!28439 array!28441 (_ BitVec 32) (_ BitVec 32) V!17531 V!17531 (_ BitVec 32) (_ BitVec 64) V!17531 (_ BitVec 32) Int) Unit!13310)

(assert (=> b!458039 (= lt!207185 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!754 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458040 () Bool)

(declare-fun res!273600 () Bool)

(declare-fun e!267447 () Bool)

(assert (=> b!458040 (=> (not res!273600) (not e!267447))))

(assert (=> b!458040 (= res!273600 (bvsle from!863 i!563))))

(declare-fun b!458042 () Bool)

(declare-fun res!273601 () Bool)

(assert (=> b!458042 (=> (not res!273601) (not e!267448))))

(assert (=> b!458042 (= res!273601 (or (= (select (arr!13662 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13662 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!20122 () Bool)

(declare-fun tp!38772 () Bool)

(declare-fun e!267449 () Bool)

(assert (=> mapNonEmpty!20122 (= mapRes!20122 (and tp!38772 e!267449))))

(declare-fun mapRest!20122 () (Array (_ BitVec 32) ValueCell!5816))

(declare-fun mapKey!20122 () (_ BitVec 32))

(declare-fun mapValue!20122 () ValueCell!5816)

(assert (=> mapNonEmpty!20122 (= (arr!13663 _values!549) (store mapRest!20122 mapKey!20122 mapValue!20122))))

(declare-fun b!458043 () Bool)

(assert (=> b!458043 (= e!267447 e!267445)))

(declare-fun res!273611 () Bool)

(assert (=> b!458043 (=> (not res!273611) (not e!267445))))

(assert (=> b!458043 (= res!273611 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207186 () ListLongMap!7087)

(assert (=> b!458043 (= lt!207186 (getCurrentListMapNoExtraKeys!1741 lt!207188 lt!207192 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458043 (= lt!207192 (array!28442 (store (arr!13663 _values!549) i!563 (ValueCellFull!5816 v!412)) (size!14015 _values!549)))))

(declare-fun lt!207187 () ListLongMap!7087)

(assert (=> b!458043 (= lt!207187 (getCurrentListMapNoExtraKeys!1741 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458044 () Bool)

(declare-fun e!267443 () Bool)

(declare-fun tp_is_empty!12319 () Bool)

(assert (=> b!458044 (= e!267443 tp_is_empty!12319)))

(declare-fun b!458045 () Bool)

(declare-fun res!273605 () Bool)

(assert (=> b!458045 (=> (not res!273605) (not e!267448))))

(declare-fun arrayContainsKey!0 (array!28439 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458045 (= res!273605 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!458046 () Bool)

(declare-fun e!267446 () Bool)

(assert (=> b!458046 (= e!267446 (and e!267443 mapRes!20122))))

(declare-fun condMapEmpty!20122 () Bool)

(declare-fun mapDefault!20122 () ValueCell!5816)

