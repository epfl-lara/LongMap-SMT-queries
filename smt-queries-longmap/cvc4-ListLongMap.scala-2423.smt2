; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38278 () Bool)

(assert start!38278)

(declare-fun b!394896 () Bool)

(declare-fun e!239081 () Bool)

(declare-fun tp_is_empty!9779 () Bool)

(assert (=> b!394896 (= e!239081 tp_is_empty!9779)))

(declare-fun b!394897 () Bool)

(declare-fun res!226358 () Bool)

(declare-fun e!239078 () Bool)

(assert (=> b!394897 (=> (not res!226358) (not e!239078))))

(declare-datatypes ((array!23463 0))(
  ( (array!23464 (arr!11187 (Array (_ BitVec 32) (_ BitVec 64))) (size!11539 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23463)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14143 0))(
  ( (V!14144 (val!4934 Int)) )
))
(declare-datatypes ((ValueCell!4546 0))(
  ( (ValueCellFull!4546 (v!7179 V!14143)) (EmptyCell!4546) )
))
(declare-datatypes ((array!23465 0))(
  ( (array!23466 (arr!11188 (Array (_ BitVec 32) ValueCell!4546)) (size!11540 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23465)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!394897 (= res!226358 (and (= (size!11540 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11539 _keys!709) (size!11540 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394898 () Bool)

(declare-fun res!226356 () Bool)

(assert (=> b!394898 (=> (not res!226356) (not e!239078))))

(assert (=> b!394898 (= res!226356 (and (bvsle #b00000000000000000000000000000000 (size!11539 _keys!709)) (bvslt (size!11539 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun b!394899 () Bool)

(declare-fun res!226354 () Bool)

(assert (=> b!394899 (=> (not res!226354) (not e!239078))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23463 (_ BitVec 32)) Bool)

(assert (=> b!394899 (= res!226354 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!16272 () Bool)

(declare-fun mapRes!16272 () Bool)

(assert (=> mapIsEmpty!16272 mapRes!16272))

(declare-fun b!394900 () Bool)

(declare-datatypes ((List!6499 0))(
  ( (Nil!6496) (Cons!6495 (h!7351 (_ BitVec 64)) (t!11673 List!6499)) )
))
(declare-fun noDuplicate!195 (List!6499) Bool)

(assert (=> b!394900 (= e!239078 (not (noDuplicate!195 Nil!6496)))))

(declare-fun res!226357 () Bool)

(assert (=> start!38278 (=> (not res!226357) (not e!239078))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38278 (= res!226357 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11539 _keys!709))))))

(assert (=> start!38278 e!239078))

(assert (=> start!38278 true))

(declare-fun e!239079 () Bool)

(declare-fun array_inv!8210 (array!23465) Bool)

(assert (=> start!38278 (and (array_inv!8210 _values!549) e!239079)))

(declare-fun array_inv!8211 (array!23463) Bool)

(assert (=> start!38278 (array_inv!8211 _keys!709)))

(declare-fun b!394901 () Bool)

(declare-fun e!239077 () Bool)

(assert (=> b!394901 (= e!239077 tp_is_empty!9779)))

(declare-fun b!394902 () Bool)

(assert (=> b!394902 (= e!239079 (and e!239077 mapRes!16272))))

(declare-fun condMapEmpty!16272 () Bool)

(declare-fun mapDefault!16272 () ValueCell!4546)

