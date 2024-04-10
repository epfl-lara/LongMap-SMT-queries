; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38350 () Bool)

(assert start!38350)

(declare-fun res!226757 () Bool)

(declare-fun e!239451 () Bool)

(assert (=> start!38350 (=> (not res!226757) (not e!239451))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23541 0))(
  ( (array!23542 (arr!11223 (Array (_ BitVec 32) (_ BitVec 64))) (size!11575 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23541)

(assert (=> start!38350 (= res!226757 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11575 _keys!709))))))

(assert (=> start!38350 e!239451))

(assert (=> start!38350 true))

(declare-datatypes ((V!14195 0))(
  ( (V!14196 (val!4953 Int)) )
))
(declare-datatypes ((ValueCell!4565 0))(
  ( (ValueCellFull!4565 (v!7199 V!14195)) (EmptyCell!4565) )
))
(declare-datatypes ((array!23543 0))(
  ( (array!23544 (arr!11224 (Array (_ BitVec 32) ValueCell!4565)) (size!11576 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23543)

(declare-fun e!239448 () Bool)

(declare-fun array_inv!8240 (array!23543) Bool)

(assert (=> start!38350 (and (array_inv!8240 _values!549) e!239448)))

(declare-fun array_inv!8241 (array!23541) Bool)

(assert (=> start!38350 (array_inv!8241 _keys!709)))

(declare-fun b!395517 () Bool)

(declare-fun e!239452 () Bool)

(declare-fun tp_is_empty!9817 () Bool)

(assert (=> b!395517 (= e!239452 tp_is_empty!9817)))

(declare-fun b!395518 () Bool)

(declare-fun res!226758 () Bool)

(assert (=> b!395518 (=> (not res!226758) (not e!239451))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395518 (= res!226758 (validMask!0 mask!1025))))

(declare-fun b!395519 () Bool)

(declare-fun e!239450 () Bool)

(assert (=> b!395519 (= e!239450 tp_is_empty!9817)))

(declare-fun b!395520 () Bool)

(declare-fun res!226759 () Bool)

(assert (=> b!395520 (=> (not res!226759) (not e!239451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23541 (_ BitVec 32)) Bool)

(assert (=> b!395520 (= res!226759 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!395521 () Bool)

(declare-fun mapRes!16338 () Bool)

(assert (=> b!395521 (= e!239448 (and e!239450 mapRes!16338))))

(declare-fun condMapEmpty!16338 () Bool)

(declare-fun mapDefault!16338 () ValueCell!4565)

