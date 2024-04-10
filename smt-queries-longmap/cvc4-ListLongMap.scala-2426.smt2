; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38318 () Bool)

(assert start!38318)

(declare-fun b!395197 () Bool)

(declare-fun e!239271 () Bool)

(declare-datatypes ((array!23499 0))(
  ( (array!23500 (arr!11203 (Array (_ BitVec 32) (_ BitVec 64))) (size!11555 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23499)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!395197 (= e!239271 (and (or (= (select (arr!11203 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11203 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)) (bvsge #b00000000000000000000000000000000 (size!11555 _keys!709))))))

(declare-fun mapIsEmpty!16305 () Bool)

(declare-fun mapRes!16305 () Bool)

(assert (=> mapIsEmpty!16305 mapRes!16305))

(declare-fun b!395198 () Bool)

(declare-fun res!226549 () Bool)

(assert (=> b!395198 (=> (not res!226549) (not e!239271))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!395198 (= res!226549 (validKeyInArray!0 k!794))))

(declare-fun b!395199 () Bool)

(declare-fun res!226551 () Bool)

(assert (=> b!395199 (=> (not res!226551) (not e!239271))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!395199 (= res!226551 (validMask!0 mask!1025))))

(declare-fun res!226548 () Bool)

(assert (=> start!38318 (=> (not res!226548) (not e!239271))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38318 (= res!226548 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11555 _keys!709))))))

(assert (=> start!38318 e!239271))

(assert (=> start!38318 true))

(declare-datatypes ((V!14167 0))(
  ( (V!14168 (val!4943 Int)) )
))
(declare-datatypes ((ValueCell!4555 0))(
  ( (ValueCellFull!4555 (v!7189 V!14167)) (EmptyCell!4555) )
))
(declare-datatypes ((array!23501 0))(
  ( (array!23502 (arr!11204 (Array (_ BitVec 32) ValueCell!4555)) (size!11556 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23501)

(declare-fun e!239275 () Bool)

(declare-fun array_inv!8222 (array!23501) Bool)

(assert (=> start!38318 (and (array_inv!8222 _values!549) e!239275)))

(declare-fun array_inv!8223 (array!23499) Bool)

(assert (=> start!38318 (array_inv!8223 _keys!709)))

(declare-fun b!395200 () Bool)

(declare-fun res!226547 () Bool)

(assert (=> b!395200 (=> (not res!226547) (not e!239271))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!395200 (= res!226547 (and (= (size!11556 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11555 _keys!709) (size!11556 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!395201 () Bool)

(declare-fun res!226550 () Bool)

(assert (=> b!395201 (=> (not res!226550) (not e!239271))))

(assert (=> b!395201 (= res!226550 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11555 _keys!709))))))

(declare-fun mapNonEmpty!16305 () Bool)

(declare-fun tp!32100 () Bool)

(declare-fun e!239273 () Bool)

(assert (=> mapNonEmpty!16305 (= mapRes!16305 (and tp!32100 e!239273))))

(declare-fun mapValue!16305 () ValueCell!4555)

(declare-fun mapRest!16305 () (Array (_ BitVec 32) ValueCell!4555))

(declare-fun mapKey!16305 () (_ BitVec 32))

(assert (=> mapNonEmpty!16305 (= (arr!11204 _values!549) (store mapRest!16305 mapKey!16305 mapValue!16305))))

(declare-fun b!395202 () Bool)

(declare-fun e!239274 () Bool)

(assert (=> b!395202 (= e!239275 (and e!239274 mapRes!16305))))

(declare-fun condMapEmpty!16305 () Bool)

(declare-fun mapDefault!16305 () ValueCell!4555)

