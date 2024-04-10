; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39772 () Bool)

(assert start!39772)

(declare-fun b_free!10039 () Bool)

(declare-fun b_next!10039 () Bool)

(assert (=> start!39772 (= b_free!10039 (not b_next!10039))))

(declare-fun tp!35646 () Bool)

(declare-fun b_and!17737 () Bool)

(assert (=> start!39772 (= tp!35646 b_and!17737)))

(declare-fun b!428489 () Bool)

(declare-fun res!251531 () Bool)

(declare-fun e!253923 () Bool)

(assert (=> b!428489 (=> (not res!251531) (not e!253923))))

(declare-datatypes ((array!26219 0))(
  ( (array!26220 (arr!12559 (Array (_ BitVec 32) (_ BitVec 64))) (size!12911 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26219)

(declare-datatypes ((List!7437 0))(
  ( (Nil!7434) (Cons!7433 (h!8289 (_ BitVec 64)) (t!12925 List!7437)) )
))
(declare-fun arrayNoDuplicates!0 (array!26219 (_ BitVec 32) List!7437) Bool)

(assert (=> b!428489 (= res!251531 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7434))))

(declare-fun b!428490 () Bool)

(declare-fun e!253929 () Bool)

(assert (=> b!428490 (= e!253923 e!253929)))

(declare-fun res!251532 () Bool)

(assert (=> b!428490 (=> (not res!251532) (not e!253929))))

(declare-fun lt!195778 () array!26219)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26219 (_ BitVec 32)) Bool)

(assert (=> b!428490 (= res!251532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195778 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428490 (= lt!195778 (array!26220 (store (arr!12559 _keys!709) i!563 k!794) (size!12911 _keys!709)))))

(declare-fun b!428491 () Bool)

(declare-fun res!251535 () Bool)

(assert (=> b!428491 (=> (not res!251535) (not e!253929))))

(assert (=> b!428491 (= res!251535 (arrayNoDuplicates!0 lt!195778 #b00000000000000000000000000000000 Nil!7434))))

(declare-fun b!428492 () Bool)

(declare-fun res!251537 () Bool)

(assert (=> b!428492 (=> (not res!251537) (not e!253923))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428492 (= res!251537 (validMask!0 mask!1025))))

(declare-fun b!428493 () Bool)

(declare-fun e!253927 () Bool)

(assert (=> b!428493 (= e!253927 true)))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!428493 (not (= (select (arr!12559 _keys!709) from!863) k!794))))

(declare-datatypes ((Unit!12575 0))(
  ( (Unit!12576) )
))
(declare-fun lt!195782 () Unit!12575)

(declare-fun e!253928 () Unit!12575)

(assert (=> b!428493 (= lt!195782 e!253928)))

(declare-fun c!55394 () Bool)

(assert (=> b!428493 (= c!55394 (= (select (arr!12559 _keys!709) from!863) k!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!16027 0))(
  ( (V!16028 (val!5640 Int)) )
))
(declare-datatypes ((tuple2!7424 0))(
  ( (tuple2!7425 (_1!3723 (_ BitVec 64)) (_2!3723 V!16027)) )
))
(declare-datatypes ((List!7438 0))(
  ( (Nil!7435) (Cons!7434 (h!8290 tuple2!7424) (t!12926 List!7438)) )
))
(declare-datatypes ((ListLongMap!6337 0))(
  ( (ListLongMap!6338 (toList!3184 List!7438)) )
))
(declare-fun lt!195780 () ListLongMap!6337)

(declare-datatypes ((ValueCell!5252 0))(
  ( (ValueCellFull!5252 (v!7887 V!16027)) (EmptyCell!5252) )
))
(declare-datatypes ((array!26221 0))(
  ( (array!26222 (arr!12560 (Array (_ BitVec 32) ValueCell!5252)) (size!12912 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26221)

(declare-fun lt!195781 () ListLongMap!6337)

(declare-fun +!1337 (ListLongMap!6337 tuple2!7424) ListLongMap!6337)

(declare-fun get!6225 (ValueCell!5252 V!16027) V!16027)

(declare-fun dynLambda!764 (Int (_ BitVec 64)) V!16027)

(assert (=> b!428493 (= lt!195780 (+!1337 lt!195781 (tuple2!7425 (select (arr!12559 _keys!709) from!863) (get!6225 (select (arr!12560 _values!549) from!863) (dynLambda!764 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428494 () Bool)

(declare-fun e!253921 () Bool)

(declare-fun tp_is_empty!11191 () Bool)

(assert (=> b!428494 (= e!253921 tp_is_empty!11191)))

(declare-fun b!428495 () Bool)

(declare-fun e!253926 () Bool)

(assert (=> b!428495 (= e!253929 e!253926)))

(declare-fun res!251525 () Bool)

(assert (=> b!428495 (=> (not res!251525) (not e!253926))))

(assert (=> b!428495 (= res!251525 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!16027)

(declare-fun lt!195785 () array!26221)

(declare-fun zeroValue!515 () V!16027)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1386 (array!26219 array!26221 (_ BitVec 32) (_ BitVec 32) V!16027 V!16027 (_ BitVec 32) Int) ListLongMap!6337)

(assert (=> b!428495 (= lt!195780 (getCurrentListMapNoExtraKeys!1386 lt!195778 lt!195785 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16027)

(assert (=> b!428495 (= lt!195785 (array!26222 (store (arr!12560 _values!549) i!563 (ValueCellFull!5252 v!412)) (size!12912 _values!549)))))

(declare-fun lt!195784 () ListLongMap!6337)

(assert (=> b!428495 (= lt!195784 (getCurrentListMapNoExtraKeys!1386 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428496 () Bool)

(assert (=> b!428496 (= e!253926 (not e!253927))))

(declare-fun res!251538 () Bool)

(assert (=> b!428496 (=> res!251538 e!253927)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428496 (= res!251538 (not (validKeyInArray!0 (select (arr!12559 _keys!709) from!863))))))

(declare-fun lt!195779 () ListLongMap!6337)

(assert (=> b!428496 (= lt!195779 lt!195781)))

(declare-fun lt!195783 () ListLongMap!6337)

(assert (=> b!428496 (= lt!195781 (+!1337 lt!195783 (tuple2!7425 k!794 v!412)))))

(assert (=> b!428496 (= lt!195779 (getCurrentListMapNoExtraKeys!1386 lt!195778 lt!195785 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428496 (= lt!195783 (getCurrentListMapNoExtraKeys!1386 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195776 () Unit!12575)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!528 (array!26219 array!26221 (_ BitVec 32) (_ BitVec 32) V!16027 V!16027 (_ BitVec 32) (_ BitVec 64) V!16027 (_ BitVec 32) Int) Unit!12575)

(assert (=> b!428496 (= lt!195776 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!528 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428497 () Bool)

(declare-fun res!251526 () Bool)

(assert (=> b!428497 (=> (not res!251526) (not e!253923))))

(assert (=> b!428497 (= res!251526 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12911 _keys!709))))))

(declare-fun b!428498 () Bool)

(declare-fun Unit!12577 () Unit!12575)

(assert (=> b!428498 (= e!253928 Unit!12577)))

(declare-fun lt!195777 () Unit!12575)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26219 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12575)

(assert (=> b!428498 (= lt!195777 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428498 false))

(declare-fun b!428499 () Bool)

(declare-fun res!251536 () Bool)

(assert (=> b!428499 (=> (not res!251536) (not e!253923))))

(assert (=> b!428499 (= res!251536 (validKeyInArray!0 k!794))))

(declare-fun b!428500 () Bool)

(declare-fun e!253924 () Bool)

(assert (=> b!428500 (= e!253924 tp_is_empty!11191)))

(declare-fun mapNonEmpty!18408 () Bool)

(declare-fun mapRes!18408 () Bool)

(declare-fun tp!35645 () Bool)

(assert (=> mapNonEmpty!18408 (= mapRes!18408 (and tp!35645 e!253924))))

(declare-fun mapKey!18408 () (_ BitVec 32))

(declare-fun mapValue!18408 () ValueCell!5252)

(declare-fun mapRest!18408 () (Array (_ BitVec 32) ValueCell!5252))

(assert (=> mapNonEmpty!18408 (= (arr!12560 _values!549) (store mapRest!18408 mapKey!18408 mapValue!18408))))

(declare-fun b!428501 () Bool)

(declare-fun res!251527 () Bool)

(assert (=> b!428501 (=> (not res!251527) (not e!253923))))

(assert (=> b!428501 (= res!251527 (and (= (size!12912 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12911 _keys!709) (size!12912 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428502 () Bool)

(declare-fun res!251529 () Bool)

(assert (=> b!428502 (=> (not res!251529) (not e!253923))))

(assert (=> b!428502 (= res!251529 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428504 () Bool)

(declare-fun res!251534 () Bool)

(assert (=> b!428504 (=> (not res!251534) (not e!253923))))

(declare-fun arrayContainsKey!0 (array!26219 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428504 (= res!251534 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!428505 () Bool)

(declare-fun res!251533 () Bool)

(assert (=> b!428505 (=> (not res!251533) (not e!253929))))

(assert (=> b!428505 (= res!251533 (bvsle from!863 i!563))))

(declare-fun b!428506 () Bool)

(declare-fun e!253922 () Bool)

(assert (=> b!428506 (= e!253922 (and e!253921 mapRes!18408))))

(declare-fun condMapEmpty!18408 () Bool)

(declare-fun mapDefault!18408 () ValueCell!5252)

