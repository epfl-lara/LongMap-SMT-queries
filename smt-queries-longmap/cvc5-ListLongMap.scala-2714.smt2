; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40102 () Bool)

(assert start!40102)

(declare-fun b_free!10369 () Bool)

(declare-fun b_next!10369 () Bool)

(assert (=> start!40102 (= b_free!10369 (not b_next!10369))))

(declare-fun tp!36635 () Bool)

(declare-fun b_and!18337 () Bool)

(assert (=> start!40102 (= tp!36635 b_and!18337)))

(declare-fun b!438212 () Bool)

(declare-fun res!258694 () Bool)

(declare-fun e!258520 () Bool)

(assert (=> b!438212 (=> (not res!258694) (not e!258520))))

(declare-datatypes ((array!26859 0))(
  ( (array!26860 (arr!12879 (Array (_ BitVec 32) (_ BitVec 64))) (size!13231 (_ BitVec 32))) )
))
(declare-fun lt!201887 () array!26859)

(declare-datatypes ((List!7695 0))(
  ( (Nil!7692) (Cons!7691 (h!8547 (_ BitVec 64)) (t!13451 List!7695)) )
))
(declare-fun arrayNoDuplicates!0 (array!26859 (_ BitVec 32) List!7695) Bool)

(assert (=> b!438212 (= res!258694 (arrayNoDuplicates!0 lt!201887 #b00000000000000000000000000000000 Nil!7692))))

(declare-fun b!438213 () Bool)

(declare-fun res!258689 () Bool)

(declare-fun e!258519 () Bool)

(assert (=> b!438213 (=> (not res!258689) (not e!258519))))

(declare-fun _keys!709 () array!26859)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438213 (= res!258689 (or (= (select (arr!12879 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12879 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438214 () Bool)

(declare-fun res!258691 () Bool)

(assert (=> b!438214 (=> (not res!258691) (not e!258519))))

(assert (=> b!438214 (= res!258691 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7692))))

(declare-fun b!438215 () Bool)

(declare-fun res!258697 () Bool)

(assert (=> b!438215 (=> (not res!258697) (not e!258519))))

(assert (=> b!438215 (= res!258697 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13231 _keys!709))))))

(declare-fun b!438216 () Bool)

(declare-fun e!258517 () Bool)

(assert (=> b!438216 (= e!258517 (not true))))

(declare-datatypes ((V!16467 0))(
  ( (V!16468 (val!5805 Int)) )
))
(declare-fun minValue!515 () V!16467)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5417 0))(
  ( (ValueCellFull!5417 (v!8052 V!16467)) (EmptyCell!5417) )
))
(declare-datatypes ((array!26861 0))(
  ( (array!26862 (arr!12880 (Array (_ BitVec 32) ValueCell!5417)) (size!13232 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26861)

(declare-fun zeroValue!515 () V!16467)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!201888 () array!26861)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun v!412 () V!16467)

(declare-datatypes ((tuple2!7696 0))(
  ( (tuple2!7697 (_1!3859 (_ BitVec 64)) (_2!3859 V!16467)) )
))
(declare-datatypes ((List!7696 0))(
  ( (Nil!7693) (Cons!7692 (h!8548 tuple2!7696) (t!13452 List!7696)) )
))
(declare-datatypes ((ListLongMap!6609 0))(
  ( (ListLongMap!6610 (toList!3320 List!7696)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1509 (array!26859 array!26861 (_ BitVec 32) (_ BitVec 32) V!16467 V!16467 (_ BitVec 32) Int) ListLongMap!6609)

(declare-fun +!1464 (ListLongMap!6609 tuple2!7696) ListLongMap!6609)

(assert (=> b!438216 (= (getCurrentListMapNoExtraKeys!1509 lt!201887 lt!201888 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1464 (getCurrentListMapNoExtraKeys!1509 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7697 k!794 v!412)))))

(declare-datatypes ((Unit!13032 0))(
  ( (Unit!13033) )
))
(declare-fun lt!201890 () Unit!13032)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!633 (array!26859 array!26861 (_ BitVec 32) (_ BitVec 32) V!16467 V!16467 (_ BitVec 32) (_ BitVec 64) V!16467 (_ BitVec 32) Int) Unit!13032)

(assert (=> b!438216 (= lt!201890 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!633 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438217 () Bool)

(declare-fun res!258692 () Bool)

(assert (=> b!438217 (=> (not res!258692) (not e!258520))))

(assert (=> b!438217 (= res!258692 (bvsle from!863 i!563))))

(declare-fun res!258693 () Bool)

(assert (=> start!40102 (=> (not res!258693) (not e!258519))))

(assert (=> start!40102 (= res!258693 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13231 _keys!709))))))

(assert (=> start!40102 e!258519))

(declare-fun tp_is_empty!11521 () Bool)

(assert (=> start!40102 tp_is_empty!11521))

(assert (=> start!40102 tp!36635))

(assert (=> start!40102 true))

(declare-fun e!258521 () Bool)

(declare-fun array_inv!9354 (array!26861) Bool)

(assert (=> start!40102 (and (array_inv!9354 _values!549) e!258521)))

(declare-fun array_inv!9355 (array!26859) Bool)

(assert (=> start!40102 (array_inv!9355 _keys!709)))

(declare-fun b!438218 () Bool)

(assert (=> b!438218 (= e!258519 e!258520)))

(declare-fun res!258699 () Bool)

(assert (=> b!438218 (=> (not res!258699) (not e!258520))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26859 (_ BitVec 32)) Bool)

(assert (=> b!438218 (= res!258699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201887 mask!1025))))

(assert (=> b!438218 (= lt!201887 (array!26860 (store (arr!12879 _keys!709) i!563 k!794) (size!13231 _keys!709)))))

(declare-fun b!438219 () Bool)

(declare-fun res!258687 () Bool)

(assert (=> b!438219 (=> (not res!258687) (not e!258519))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438219 (= res!258687 (validKeyInArray!0 k!794))))

(declare-fun b!438220 () Bool)

(declare-fun res!258688 () Bool)

(assert (=> b!438220 (=> (not res!258688) (not e!258519))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438220 (= res!258688 (validMask!0 mask!1025))))

(declare-fun b!438221 () Bool)

(declare-fun res!258696 () Bool)

(assert (=> b!438221 (=> (not res!258696) (not e!258519))))

(assert (=> b!438221 (= res!258696 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438222 () Bool)

(declare-fun res!258698 () Bool)

(assert (=> b!438222 (=> (not res!258698) (not e!258519))))

(declare-fun arrayContainsKey!0 (array!26859 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438222 (= res!258698 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!438223 () Bool)

(declare-fun res!258695 () Bool)

(assert (=> b!438223 (=> (not res!258695) (not e!258519))))

(assert (=> b!438223 (= res!258695 (and (= (size!13232 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13231 _keys!709) (size!13232 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438224 () Bool)

(declare-fun e!258518 () Bool)

(assert (=> b!438224 (= e!258518 tp_is_empty!11521)))

(declare-fun mapNonEmpty!18903 () Bool)

(declare-fun mapRes!18903 () Bool)

(declare-fun tp!36636 () Bool)

(declare-fun e!258516 () Bool)

(assert (=> mapNonEmpty!18903 (= mapRes!18903 (and tp!36636 e!258516))))

(declare-fun mapRest!18903 () (Array (_ BitVec 32) ValueCell!5417))

(declare-fun mapKey!18903 () (_ BitVec 32))

(declare-fun mapValue!18903 () ValueCell!5417)

(assert (=> mapNonEmpty!18903 (= (arr!12880 _values!549) (store mapRest!18903 mapKey!18903 mapValue!18903))))

(declare-fun b!438225 () Bool)

(assert (=> b!438225 (= e!258516 tp_is_empty!11521)))

(declare-fun b!438226 () Bool)

(assert (=> b!438226 (= e!258521 (and e!258518 mapRes!18903))))

(declare-fun condMapEmpty!18903 () Bool)

(declare-fun mapDefault!18903 () ValueCell!5417)

