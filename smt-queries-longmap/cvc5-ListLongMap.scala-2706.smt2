; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40054 () Bool)

(assert start!40054)

(declare-fun b_free!10321 () Bool)

(declare-fun b_next!10321 () Bool)

(assert (=> start!40054 (= b_free!10321 (not b_next!10321))))

(declare-fun tp!36492 () Bool)

(declare-fun b_and!18289 () Bool)

(assert (=> start!40054 (= tp!36492 b_and!18289)))

(declare-fun b!437060 () Bool)

(declare-fun res!257763 () Bool)

(declare-fun e!258016 () Bool)

(assert (=> b!437060 (=> (not res!257763) (not e!258016))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!26769 0))(
  ( (array!26770 (arr!12834 (Array (_ BitVec 32) (_ BitVec 64))) (size!13186 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26769)

(assert (=> b!437060 (= res!257763 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13186 _keys!709))))))

(declare-fun b!437061 () Bool)

(declare-fun e!258017 () Bool)

(declare-fun tp_is_empty!11473 () Bool)

(assert (=> b!437061 (= e!258017 tp_is_empty!11473)))

(declare-fun b!437062 () Bool)

(declare-fun res!257752 () Bool)

(assert (=> b!437062 (=> (not res!257752) (not e!258016))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437062 (= res!257752 (validKeyInArray!0 k!794))))

(declare-fun b!437063 () Bool)

(declare-fun e!258018 () Bool)

(assert (=> b!437063 (= e!258016 e!258018)))

(declare-fun res!257757 () Bool)

(assert (=> b!437063 (=> (not res!257757) (not e!258018))))

(declare-fun lt!201529 () array!26769)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26769 (_ BitVec 32)) Bool)

(assert (=> b!437063 (= res!257757 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201529 mask!1025))))

(assert (=> b!437063 (= lt!201529 (array!26770 (store (arr!12834 _keys!709) i!563 k!794) (size!13186 _keys!709)))))

(declare-fun b!437064 () Bool)

(declare-fun e!258015 () Bool)

(declare-fun mapRes!18831 () Bool)

(assert (=> b!437064 (= e!258015 (and e!258017 mapRes!18831))))

(declare-fun condMapEmpty!18831 () Bool)

(declare-datatypes ((V!16403 0))(
  ( (V!16404 (val!5781 Int)) )
))
(declare-datatypes ((ValueCell!5393 0))(
  ( (ValueCellFull!5393 (v!8028 V!16403)) (EmptyCell!5393) )
))
(declare-datatypes ((array!26771 0))(
  ( (array!26772 (arr!12835 (Array (_ BitVec 32) ValueCell!5393)) (size!13187 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26771)

(declare-fun mapDefault!18831 () ValueCell!5393)

