; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38444 () Bool)

(assert start!38444)

(declare-fun b!396554 () Bool)

(declare-fun e!239948 () Bool)

(declare-fun e!239947 () Bool)

(assert (=> b!396554 (= e!239948 e!239947)))

(declare-fun res!227522 () Bool)

(assert (=> b!396554 (=> (not res!227522) (not e!239947))))

(declare-datatypes ((array!23639 0))(
  ( (array!23640 (arr!11269 (Array (_ BitVec 32) (_ BitVec 64))) (size!11621 (_ BitVec 32))) )
))
(declare-fun lt!187168 () array!23639)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23639 (_ BitVec 32)) Bool)

(assert (=> b!396554 (= res!227522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187168 mask!1025))))

(declare-fun _keys!709 () array!23639)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396554 (= lt!187168 (array!23640 (store (arr!11269 _keys!709) i!563 k!794) (size!11621 _keys!709)))))

(declare-fun b!396555 () Bool)

(declare-fun res!227529 () Bool)

(assert (=> b!396555 (=> (not res!227529) (not e!239948))))

(declare-fun arrayContainsKey!0 (array!23639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396555 (= res!227529 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!396556 () Bool)

(declare-fun e!239952 () Bool)

(declare-fun tp_is_empty!9863 () Bool)

(assert (=> b!396556 (= e!239952 tp_is_empty!9863)))

(declare-fun b!396557 () Bool)

(declare-fun res!227526 () Bool)

(assert (=> b!396557 (=> (not res!227526) (not e!239948))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396557 (= res!227526 (validKeyInArray!0 k!794))))

(declare-fun b!396558 () Bool)

(assert (=> b!396558 (= e!239947 false)))

(declare-fun lt!187169 () Bool)

(declare-datatypes ((List!6529 0))(
  ( (Nil!6526) (Cons!6525 (h!7381 (_ BitVec 64)) (t!11703 List!6529)) )
))
(declare-fun arrayNoDuplicates!0 (array!23639 (_ BitVec 32) List!6529) Bool)

(assert (=> b!396558 (= lt!187169 (arrayNoDuplicates!0 lt!187168 #b00000000000000000000000000000000 Nil!6526))))

(declare-fun b!396559 () Bool)

(declare-fun res!227520 () Bool)

(assert (=> b!396559 (=> (not res!227520) (not e!239948))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396559 (= res!227520 (validMask!0 mask!1025))))

(declare-fun b!396560 () Bool)

(declare-fun res!227528 () Bool)

(assert (=> b!396560 (=> (not res!227528) (not e!239948))))

(assert (=> b!396560 (= res!227528 (or (= (select (arr!11269 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11269 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!396561 () Bool)

(declare-fun res!227525 () Bool)

(assert (=> b!396561 (=> (not res!227525) (not e!239948))))

(assert (=> b!396561 (= res!227525 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6526))))

(declare-fun mapNonEmpty!16416 () Bool)

(declare-fun mapRes!16416 () Bool)

(declare-fun tp!32211 () Bool)

(assert (=> mapNonEmpty!16416 (= mapRes!16416 (and tp!32211 e!239952))))

(declare-datatypes ((V!14255 0))(
  ( (V!14256 (val!4976 Int)) )
))
(declare-datatypes ((ValueCell!4588 0))(
  ( (ValueCellFull!4588 (v!7223 V!14255)) (EmptyCell!4588) )
))
(declare-fun mapRest!16416 () (Array (_ BitVec 32) ValueCell!4588))

(declare-fun mapKey!16416 () (_ BitVec 32))

(declare-datatypes ((array!23641 0))(
  ( (array!23642 (arr!11270 (Array (_ BitVec 32) ValueCell!4588)) (size!11622 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23641)

(declare-fun mapValue!16416 () ValueCell!4588)

(assert (=> mapNonEmpty!16416 (= (arr!11270 _values!549) (store mapRest!16416 mapKey!16416 mapValue!16416))))

(declare-fun b!396562 () Bool)

(declare-fun e!239950 () Bool)

(assert (=> b!396562 (= e!239950 tp_is_empty!9863)))

(declare-fun b!396563 () Bool)

(declare-fun res!227527 () Bool)

(assert (=> b!396563 (=> (not res!227527) (not e!239948))))

(assert (=> b!396563 (= res!227527 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396564 () Bool)

(declare-fun res!227523 () Bool)

(assert (=> b!396564 (=> (not res!227523) (not e!239948))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396564 (= res!227523 (and (= (size!11622 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11621 _keys!709) (size!11622 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396565 () Bool)

(declare-fun res!227524 () Bool)

(assert (=> b!396565 (=> (not res!227524) (not e!239948))))

(assert (=> b!396565 (= res!227524 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11621 _keys!709))))))

(declare-fun b!396566 () Bool)

(declare-fun e!239951 () Bool)

(assert (=> b!396566 (= e!239951 (and e!239950 mapRes!16416))))

(declare-fun condMapEmpty!16416 () Bool)

(declare-fun mapDefault!16416 () ValueCell!4588)

