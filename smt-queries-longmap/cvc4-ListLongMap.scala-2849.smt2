; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41106 () Bool)

(assert start!41106)

(declare-fun b_free!10997 () Bool)

(declare-fun b_next!10997 () Bool)

(assert (=> start!41106 (= b_free!10997 (not b_next!10997))))

(declare-fun tp!38824 () Bool)

(declare-fun b_and!19217 () Bool)

(assert (=> start!41106 (= tp!38824 b_and!19217)))

(declare-fun b!458615 () Bool)

(declare-fun res!274009 () Bool)

(declare-fun e!267742 () Bool)

(assert (=> b!458615 (=> (not res!274009) (not e!267742))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458615 (= res!274009 (bvsle from!863 i!563))))

(declare-fun b!458616 () Bool)

(declare-fun e!267746 () Bool)

(declare-fun e!267743 () Bool)

(assert (=> b!458616 (= e!267746 (not e!267743))))

(declare-fun res!274006 () Bool)

(assert (=> b!458616 (=> res!274006 e!267743)))

(declare-datatypes ((array!28471 0))(
  ( (array!28472 (arr!13677 (Array (_ BitVec 32) (_ BitVec 64))) (size!14029 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28471)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458616 (= res!274006 (not (validKeyInArray!0 (select (arr!13677 _keys!709) from!863))))))

(declare-datatypes ((V!17551 0))(
  ( (V!17552 (val!6212 Int)) )
))
(declare-datatypes ((tuple2!8188 0))(
  ( (tuple2!8189 (_1!4105 (_ BitVec 64)) (_2!4105 V!17551)) )
))
(declare-datatypes ((List!8259 0))(
  ( (Nil!8256) (Cons!8255 (h!9111 tuple2!8188) (t!14135 List!8259)) )
))
(declare-datatypes ((ListLongMap!7101 0))(
  ( (ListLongMap!7102 (toList!3566 List!8259)) )
))
(declare-fun lt!207452 () ListLongMap!7101)

(declare-fun lt!207451 () ListLongMap!7101)

(assert (=> b!458616 (= lt!207452 lt!207451)))

(declare-fun lt!207455 () ListLongMap!7101)

(declare-fun v!412 () V!17551)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun +!1602 (ListLongMap!7101 tuple2!8188) ListLongMap!7101)

(assert (=> b!458616 (= lt!207451 (+!1602 lt!207455 (tuple2!8189 k!794 v!412)))))

(declare-fun lt!207456 () array!28471)

(declare-fun minValue!515 () V!17551)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17551)

(declare-datatypes ((ValueCell!5824 0))(
  ( (ValueCellFull!5824 (v!8486 V!17551)) (EmptyCell!5824) )
))
(declare-datatypes ((array!28473 0))(
  ( (array!28474 (arr!13678 (Array (_ BitVec 32) ValueCell!5824)) (size!14030 (_ BitVec 32))) )
))
(declare-fun lt!207454 () array!28473)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1748 (array!28471 array!28473 (_ BitVec 32) (_ BitVec 32) V!17551 V!17551 (_ BitVec 32) Int) ListLongMap!7101)

(assert (=> b!458616 (= lt!207452 (getCurrentListMapNoExtraKeys!1748 lt!207456 lt!207454 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!28473)

(assert (=> b!458616 (= lt!207455 (getCurrentListMapNoExtraKeys!1748 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13324 0))(
  ( (Unit!13325) )
))
(declare-fun lt!207457 () Unit!13324)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!761 (array!28471 array!28473 (_ BitVec 32) (_ BitVec 32) V!17551 V!17551 (_ BitVec 32) (_ BitVec 64) V!17551 (_ BitVec 32) Int) Unit!13324)

(assert (=> b!458616 (= lt!207457 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!761 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458617 () Bool)

(declare-fun res!274012 () Bool)

(assert (=> b!458617 (=> (not res!274012) (not e!267742))))

(declare-datatypes ((List!8260 0))(
  ( (Nil!8257) (Cons!8256 (h!9112 (_ BitVec 64)) (t!14136 List!8260)) )
))
(declare-fun arrayNoDuplicates!0 (array!28471 (_ BitVec 32) List!8260) Bool)

(assert (=> b!458617 (= res!274012 (arrayNoDuplicates!0 lt!207456 #b00000000000000000000000000000000 Nil!8257))))

(declare-fun b!458618 () Bool)

(declare-fun res!274015 () Bool)

(declare-fun e!267739 () Bool)

(assert (=> b!458618 (=> (not res!274015) (not e!267739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28471 (_ BitVec 32)) Bool)

(assert (=> b!458618 (= res!274015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458619 () Bool)

(declare-fun e!267740 () Bool)

(declare-fun tp_is_empty!12335 () Bool)

(assert (=> b!458619 (= e!267740 tp_is_empty!12335)))

(declare-fun b!458620 () Bool)

(declare-fun e!267738 () Bool)

(declare-fun mapRes!20149 () Bool)

(assert (=> b!458620 (= e!267738 (and e!267740 mapRes!20149))))

(declare-fun condMapEmpty!20149 () Bool)

(declare-fun mapDefault!20149 () ValueCell!5824)

