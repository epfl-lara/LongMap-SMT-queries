; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41102 () Bool)

(assert start!41102)

(declare-fun b_free!10993 () Bool)

(declare-fun b_next!10993 () Bool)

(assert (=> start!41102 (= b_free!10993 (not b_next!10993))))

(declare-fun tp!38812 () Bool)

(declare-fun b_and!19209 () Bool)

(assert (=> start!41102 (= tp!38812 b_and!19209)))

(declare-fun b!458503 () Bool)

(declare-fun e!267691 () Bool)

(declare-fun e!267685 () Bool)

(assert (=> b!458503 (= e!267691 e!267685)))

(declare-fun res!273917 () Bool)

(assert (=> b!458503 (=> (not res!273917) (not e!267685))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458503 (= res!273917 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17547 0))(
  ( (V!17548 (val!6210 Int)) )
))
(declare-fun minValue!515 () V!17547)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8184 0))(
  ( (tuple2!8185 (_1!4103 (_ BitVec 64)) (_2!4103 V!17547)) )
))
(declare-datatypes ((List!8256 0))(
  ( (Nil!8253) (Cons!8252 (h!9108 tuple2!8184) (t!14128 List!8256)) )
))
(declare-datatypes ((ListLongMap!7097 0))(
  ( (ListLongMap!7098 (toList!3564 List!8256)) )
))
(declare-fun lt!207403 () ListLongMap!7097)

(declare-fun zeroValue!515 () V!17547)

(declare-datatypes ((array!28463 0))(
  ( (array!28464 (arr!13673 (Array (_ BitVec 32) (_ BitVec 64))) (size!14025 (_ BitVec 32))) )
))
(declare-fun lt!207405 () array!28463)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5822 0))(
  ( (ValueCellFull!5822 (v!8484 V!17547)) (EmptyCell!5822) )
))
(declare-datatypes ((array!28465 0))(
  ( (array!28466 (arr!13674 (Array (_ BitVec 32) ValueCell!5822)) (size!14026 (_ BitVec 32))) )
))
(declare-fun lt!207407 () array!28465)

(declare-fun getCurrentListMapNoExtraKeys!1746 (array!28463 array!28465 (_ BitVec 32) (_ BitVec 32) V!17547 V!17547 (_ BitVec 32) Int) ListLongMap!7097)

(assert (=> b!458503 (= lt!207403 (getCurrentListMapNoExtraKeys!1746 lt!207405 lt!207407 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28465)

(declare-fun v!412 () V!17547)

(assert (=> b!458503 (= lt!207407 (array!28466 (store (arr!13674 _values!549) i!563 (ValueCellFull!5822 v!412)) (size!14026 _values!549)))))

(declare-fun lt!207406 () ListLongMap!7097)

(declare-fun _keys!709 () array!28463)

(assert (=> b!458503 (= lt!207406 (getCurrentListMapNoExtraKeys!1746 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!20143 () Bool)

(declare-fun mapRes!20143 () Bool)

(assert (=> mapIsEmpty!20143 mapRes!20143))

(declare-fun b!458504 () Bool)

(declare-fun e!267687 () Bool)

(assert (=> b!458504 (= e!267685 (not e!267687))))

(declare-fun res!273916 () Bool)

(assert (=> b!458504 (=> res!273916 e!267687)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458504 (= res!273916 (not (validKeyInArray!0 (select (arr!13673 _keys!709) from!863))))))

(declare-fun lt!207402 () ListLongMap!7097)

(declare-fun lt!207409 () ListLongMap!7097)

(assert (=> b!458504 (= lt!207402 lt!207409)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!207408 () ListLongMap!7097)

(declare-fun +!1600 (ListLongMap!7097 tuple2!8184) ListLongMap!7097)

(assert (=> b!458504 (= lt!207409 (+!1600 lt!207408 (tuple2!8185 k!794 v!412)))))

(assert (=> b!458504 (= lt!207402 (getCurrentListMapNoExtraKeys!1746 lt!207405 lt!207407 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458504 (= lt!207408 (getCurrentListMapNoExtraKeys!1746 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13320 0))(
  ( (Unit!13321) )
))
(declare-fun lt!207404 () Unit!13320)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!759 (array!28463 array!28465 (_ BitVec 32) (_ BitVec 32) V!17547 V!17547 (_ BitVec 32) (_ BitVec 64) V!17547 (_ BitVec 32) Int) Unit!13320)

(assert (=> b!458504 (= lt!207404 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!759 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458505 () Bool)

(declare-fun e!267692 () Bool)

(assert (=> b!458505 (= e!267692 e!267691)))

(declare-fun res!273928 () Bool)

(assert (=> b!458505 (=> (not res!273928) (not e!267691))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28463 (_ BitVec 32)) Bool)

(assert (=> b!458505 (= res!273928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207405 mask!1025))))

(assert (=> b!458505 (= lt!207405 (array!28464 (store (arr!13673 _keys!709) i!563 k!794) (size!14025 _keys!709)))))

(declare-fun b!458506 () Bool)

(declare-fun res!273923 () Bool)

(assert (=> b!458506 (=> (not res!273923) (not e!267692))))

(assert (=> b!458506 (= res!273923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458507 () Bool)

(declare-fun e!267690 () Bool)

(declare-fun e!267684 () Bool)

(assert (=> b!458507 (= e!267690 (and e!267684 mapRes!20143))))

(declare-fun condMapEmpty!20143 () Bool)

(declare-fun mapDefault!20143 () ValueCell!5822)

