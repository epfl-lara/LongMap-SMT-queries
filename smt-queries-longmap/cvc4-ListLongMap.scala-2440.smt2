; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38462 () Bool)

(assert start!38462)

(declare-fun b!396905 () Bool)

(declare-fun res!227795 () Bool)

(declare-fun e!240112 () Bool)

(assert (=> b!396905 (=> (not res!227795) (not e!240112))))

(declare-datatypes ((array!23675 0))(
  ( (array!23676 (arr!11287 (Array (_ BitVec 32) (_ BitVec 64))) (size!11639 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23675)

(declare-datatypes ((List!6536 0))(
  ( (Nil!6533) (Cons!6532 (h!7388 (_ BitVec 64)) (t!11710 List!6536)) )
))
(declare-fun arrayNoDuplicates!0 (array!23675 (_ BitVec 32) List!6536) Bool)

(assert (=> b!396905 (= res!227795 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6533))))

(declare-fun b!396906 () Bool)

(declare-fun res!227792 () Bool)

(assert (=> b!396906 (=> (not res!227792) (not e!240112))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396906 (= res!227792 (or (= (select (arr!11287 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11287 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16443 () Bool)

(declare-fun mapRes!16443 () Bool)

(declare-fun tp!32238 () Bool)

(declare-fun e!240113 () Bool)

(assert (=> mapNonEmpty!16443 (= mapRes!16443 (and tp!32238 e!240113))))

(declare-datatypes ((V!14279 0))(
  ( (V!14280 (val!4985 Int)) )
))
(declare-datatypes ((ValueCell!4597 0))(
  ( (ValueCellFull!4597 (v!7232 V!14279)) (EmptyCell!4597) )
))
(declare-fun mapRest!16443 () (Array (_ BitVec 32) ValueCell!4597))

(declare-datatypes ((array!23677 0))(
  ( (array!23678 (arr!11288 (Array (_ BitVec 32) ValueCell!4597)) (size!11640 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23677)

(declare-fun mapValue!16443 () ValueCell!4597)

(declare-fun mapKey!16443 () (_ BitVec 32))

(assert (=> mapNonEmpty!16443 (= (arr!11288 _values!549) (store mapRest!16443 mapKey!16443 mapValue!16443))))

(declare-fun b!396907 () Bool)

(declare-fun e!240110 () Bool)

(declare-fun e!240109 () Bool)

(assert (=> b!396907 (= e!240110 (and e!240109 mapRes!16443))))

(declare-fun condMapEmpty!16443 () Bool)

(declare-fun mapDefault!16443 () ValueCell!4597)

