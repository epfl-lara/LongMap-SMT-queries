; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40100 () Bool)

(assert start!40100)

(declare-fun b_free!10367 () Bool)

(declare-fun b_next!10367 () Bool)

(assert (=> start!40100 (= b_free!10367 (not b_next!10367))))

(declare-fun tp!36630 () Bool)

(declare-fun b_and!18335 () Bool)

(assert (=> start!40100 (= tp!36630 b_and!18335)))

(declare-fun b!438164 () Bool)

(declare-fun e!258499 () Bool)

(assert (=> b!438164 (= e!258499 (not true))))

(declare-datatypes ((V!16463 0))(
  ( (V!16464 (val!5804 Int)) )
))
(declare-fun minValue!515 () V!16463)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5416 0))(
  ( (ValueCellFull!5416 (v!8051 V!16463)) (EmptyCell!5416) )
))
(declare-datatypes ((array!26855 0))(
  ( (array!26856 (arr!12877 (Array (_ BitVec 32) ValueCell!5416)) (size!13229 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26855)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!26857 0))(
  ( (array!26858 (arr!12878 (Array (_ BitVec 32) (_ BitVec 64))) (size!13230 (_ BitVec 32))) )
))
(declare-fun lt!201873 () array!26857)

(declare-fun v!412 () V!16463)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!26857)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!201872 () array!26855)

(declare-fun zeroValue!515 () V!16463)

(declare-datatypes ((tuple2!7694 0))(
  ( (tuple2!7695 (_1!3858 (_ BitVec 64)) (_2!3858 V!16463)) )
))
(declare-datatypes ((List!7693 0))(
  ( (Nil!7690) (Cons!7689 (h!8545 tuple2!7694) (t!13449 List!7693)) )
))
(declare-datatypes ((ListLongMap!6607 0))(
  ( (ListLongMap!6608 (toList!3319 List!7693)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1508 (array!26857 array!26855 (_ BitVec 32) (_ BitVec 32) V!16463 V!16463 (_ BitVec 32) Int) ListLongMap!6607)

(declare-fun +!1463 (ListLongMap!6607 tuple2!7694) ListLongMap!6607)

(assert (=> b!438164 (= (getCurrentListMapNoExtraKeys!1508 lt!201873 lt!201872 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1463 (getCurrentListMapNoExtraKeys!1508 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7695 k!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13030 0))(
  ( (Unit!13031) )
))
(declare-fun lt!201871 () Unit!13030)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!632 (array!26857 array!26855 (_ BitVec 32) (_ BitVec 32) V!16463 V!16463 (_ BitVec 32) (_ BitVec 64) V!16463 (_ BitVec 32) Int) Unit!13030)

(assert (=> b!438164 (= lt!201871 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!632 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438165 () Bool)

(declare-fun res!258649 () Bool)

(declare-fun e!258495 () Bool)

(assert (=> b!438165 (=> (not res!258649) (not e!258495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438165 (= res!258649 (validMask!0 mask!1025))))

(declare-fun b!438166 () Bool)

(declare-fun res!258653 () Bool)

(assert (=> b!438166 (=> (not res!258653) (not e!258495))))

(declare-datatypes ((List!7694 0))(
  ( (Nil!7691) (Cons!7690 (h!8546 (_ BitVec 64)) (t!13450 List!7694)) )
))
(declare-fun arrayNoDuplicates!0 (array!26857 (_ BitVec 32) List!7694) Bool)

(assert (=> b!438166 (= res!258653 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7691))))

(declare-fun b!438168 () Bool)

(declare-fun res!258660 () Bool)

(assert (=> b!438168 (=> (not res!258660) (not e!258495))))

(assert (=> b!438168 (= res!258660 (and (= (size!13229 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13230 _keys!709) (size!13229 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438169 () Bool)

(declare-fun res!258648 () Bool)

(assert (=> b!438169 (=> (not res!258648) (not e!258495))))

(assert (=> b!438169 (= res!258648 (or (= (select (arr!12878 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12878 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!438170 () Bool)

(declare-fun res!258654 () Bool)

(assert (=> b!438170 (=> (not res!258654) (not e!258495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26857 (_ BitVec 32)) Bool)

(assert (=> b!438170 (= res!258654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438171 () Bool)

(declare-fun res!258658 () Bool)

(assert (=> b!438171 (=> (not res!258658) (not e!258495))))

(assert (=> b!438171 (= res!258658 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13230 _keys!709))))))

(declare-fun b!438172 () Bool)

(declare-fun e!258500 () Bool)

(assert (=> b!438172 (= e!258500 e!258499)))

(declare-fun res!258656 () Bool)

(assert (=> b!438172 (=> (not res!258656) (not e!258499))))

(assert (=> b!438172 (= res!258656 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201875 () ListLongMap!6607)

(assert (=> b!438172 (= lt!201875 (getCurrentListMapNoExtraKeys!1508 lt!201873 lt!201872 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!438172 (= lt!201872 (array!26856 (store (arr!12877 _values!549) i!563 (ValueCellFull!5416 v!412)) (size!13229 _values!549)))))

(declare-fun lt!201874 () ListLongMap!6607)

(assert (=> b!438172 (= lt!201874 (getCurrentListMapNoExtraKeys!1508 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438173 () Bool)

(declare-fun res!258659 () Bool)

(assert (=> b!438173 (=> (not res!258659) (not e!258500))))

(assert (=> b!438173 (= res!258659 (arrayNoDuplicates!0 lt!201873 #b00000000000000000000000000000000 Nil!7691))))

(declare-fun b!438174 () Bool)

(assert (=> b!438174 (= e!258495 e!258500)))

(declare-fun res!258651 () Bool)

(assert (=> b!438174 (=> (not res!258651) (not e!258500))))

(assert (=> b!438174 (= res!258651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201873 mask!1025))))

(assert (=> b!438174 (= lt!201873 (array!26858 (store (arr!12878 _keys!709) i!563 k!794) (size!13230 _keys!709)))))

(declare-fun mapNonEmpty!18900 () Bool)

(declare-fun mapRes!18900 () Bool)

(declare-fun tp!36629 () Bool)

(declare-fun e!258496 () Bool)

(assert (=> mapNonEmpty!18900 (= mapRes!18900 (and tp!36629 e!258496))))

(declare-fun mapValue!18900 () ValueCell!5416)

(declare-fun mapRest!18900 () (Array (_ BitVec 32) ValueCell!5416))

(declare-fun mapKey!18900 () (_ BitVec 32))

(assert (=> mapNonEmpty!18900 (= (arr!12877 _values!549) (store mapRest!18900 mapKey!18900 mapValue!18900))))

(declare-fun mapIsEmpty!18900 () Bool)

(assert (=> mapIsEmpty!18900 mapRes!18900))

(declare-fun b!438175 () Bool)

(declare-fun res!258655 () Bool)

(assert (=> b!438175 (=> (not res!258655) (not e!258500))))

(assert (=> b!438175 (= res!258655 (bvsle from!863 i!563))))

(declare-fun b!438176 () Bool)

(declare-fun e!258497 () Bool)

(declare-fun tp_is_empty!11519 () Bool)

(assert (=> b!438176 (= e!258497 tp_is_empty!11519)))

(declare-fun b!438177 () Bool)

(declare-fun e!258498 () Bool)

(assert (=> b!438177 (= e!258498 (and e!258497 mapRes!18900))))

(declare-fun condMapEmpty!18900 () Bool)

(declare-fun mapDefault!18900 () ValueCell!5416)

