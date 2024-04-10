; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38248 () Bool)

(assert start!38248)

(declare-fun b!394651 () Bool)

(declare-fun e!238901 () Bool)

(declare-fun tp_is_empty!9757 () Bool)

(assert (=> b!394651 (= e!238901 tp_is_empty!9757)))

(declare-fun mapIsEmpty!16236 () Bool)

(declare-fun mapRes!16236 () Bool)

(assert (=> mapIsEmpty!16236 mapRes!16236))

(declare-datatypes ((array!23421 0))(
  ( (array!23422 (arr!11167 (Array (_ BitVec 32) (_ BitVec 64))) (size!11519 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23421)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun b!394652 () Bool)

(declare-fun e!238897 () Bool)

(declare-datatypes ((V!14115 0))(
  ( (V!14116 (val!4923 Int)) )
))
(declare-datatypes ((ValueCell!4535 0))(
  ( (ValueCellFull!4535 (v!7168 V!14115)) (EmptyCell!4535) )
))
(declare-datatypes ((array!23423 0))(
  ( (array!23424 (arr!11168 (Array (_ BitVec 32) ValueCell!4535)) (size!11520 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23423)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394652 (= e!238897 (and (= (size!11520 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11519 _keys!709) (size!11520 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011) (= (size!11519 _keys!709) (bvadd #b00000000000000000000000000000001 mask!1025)) (bvsgt #b00000000000000000000000000000000 (size!11519 _keys!709))))))

(declare-fun res!226223 () Bool)

(assert (=> start!38248 (=> (not res!226223) (not e!238897))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38248 (= res!226223 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11519 _keys!709))))))

(assert (=> start!38248 e!238897))

(assert (=> start!38248 true))

(declare-fun e!238899 () Bool)

(declare-fun array_inv!8200 (array!23423) Bool)

(assert (=> start!38248 (and (array_inv!8200 _values!549) e!238899)))

(declare-fun array_inv!8201 (array!23421) Bool)

(assert (=> start!38248 (array_inv!8201 _keys!709)))

(declare-fun mapNonEmpty!16236 () Bool)

(declare-fun tp!32031 () Bool)

(declare-fun e!238898 () Bool)

(assert (=> mapNonEmpty!16236 (= mapRes!16236 (and tp!32031 e!238898))))

(declare-fun mapValue!16236 () ValueCell!4535)

(declare-fun mapRest!16236 () (Array (_ BitVec 32) ValueCell!4535))

(declare-fun mapKey!16236 () (_ BitVec 32))

(assert (=> mapNonEmpty!16236 (= (arr!11168 _values!549) (store mapRest!16236 mapKey!16236 mapValue!16236))))

(declare-fun b!394653 () Bool)

(assert (=> b!394653 (= e!238898 tp_is_empty!9757)))

(declare-fun b!394654 () Bool)

(declare-fun res!226222 () Bool)

(assert (=> b!394654 (=> (not res!226222) (not e!238897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394654 (= res!226222 (validMask!0 mask!1025))))

(declare-fun b!394655 () Bool)

(assert (=> b!394655 (= e!238899 (and e!238901 mapRes!16236))))

(declare-fun condMapEmpty!16236 () Bool)

(declare-fun mapDefault!16236 () ValueCell!4535)

