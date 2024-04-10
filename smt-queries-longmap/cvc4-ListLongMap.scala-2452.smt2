; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38534 () Bool)

(assert start!38534)

(declare-fun b!398309 () Bool)

(declare-fun res!228878 () Bool)

(declare-fun e!240762 () Bool)

(assert (=> b!398309 (=> (not res!228878) (not e!240762))))

(declare-datatypes ((array!23817 0))(
  ( (array!23818 (arr!11358 (Array (_ BitVec 32) (_ BitVec 64))) (size!11710 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23817)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!398309 (= res!228878 (or (= (select (arr!11358 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11358 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16551 () Bool)

(declare-fun mapRes!16551 () Bool)

(assert (=> mapIsEmpty!16551 mapRes!16551))

(declare-fun b!398310 () Bool)

(declare-fun res!228877 () Bool)

(assert (=> b!398310 (=> (not res!228877) (not e!240762))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398310 (= res!228877 (validKeyInArray!0 k!794))))

(declare-fun b!398311 () Bool)

(declare-fun res!228873 () Bool)

(assert (=> b!398311 (=> (not res!228873) (not e!240762))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398311 (= res!228873 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!16551 () Bool)

(declare-fun tp!32346 () Bool)

(declare-fun e!240761 () Bool)

(assert (=> mapNonEmpty!16551 (= mapRes!16551 (and tp!32346 e!240761))))

(declare-datatypes ((V!14375 0))(
  ( (V!14376 (val!5021 Int)) )
))
(declare-datatypes ((ValueCell!4633 0))(
  ( (ValueCellFull!4633 (v!7268 V!14375)) (EmptyCell!4633) )
))
(declare-datatypes ((array!23819 0))(
  ( (array!23820 (arr!11359 (Array (_ BitVec 32) ValueCell!4633)) (size!11711 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23819)

(declare-fun mapRest!16551 () (Array (_ BitVec 32) ValueCell!4633))

(declare-fun mapKey!16551 () (_ BitVec 32))

(declare-fun mapValue!16551 () ValueCell!4633)

(assert (=> mapNonEmpty!16551 (= (arr!11359 _values!549) (store mapRest!16551 mapKey!16551 mapValue!16551))))

(declare-fun b!398312 () Bool)

(declare-fun e!240760 () Bool)

(assert (=> b!398312 (= e!240762 e!240760)))

(declare-fun res!228875 () Bool)

(assert (=> b!398312 (=> (not res!228875) (not e!240760))))

(declare-fun lt!187439 () array!23817)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23817 (_ BitVec 32)) Bool)

(assert (=> b!398312 (= res!228875 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187439 mask!1025))))

(assert (=> b!398312 (= lt!187439 (array!23818 (store (arr!11358 _keys!709) i!563 k!794) (size!11710 _keys!709)))))

(declare-fun b!398313 () Bool)

(declare-fun res!228879 () Bool)

(assert (=> b!398313 (=> (not res!228879) (not e!240762))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!398313 (= res!228879 (and (= (size!11711 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11710 _keys!709) (size!11711 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!228871 () Bool)

(assert (=> start!38534 (=> (not res!228871) (not e!240762))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38534 (= res!228871 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11710 _keys!709))))))

(assert (=> start!38534 e!240762))

(assert (=> start!38534 true))

(declare-fun e!240759 () Bool)

(declare-fun array_inv!8324 (array!23819) Bool)

(assert (=> start!38534 (and (array_inv!8324 _values!549) e!240759)))

(declare-fun array_inv!8325 (array!23817) Bool)

(assert (=> start!38534 (array_inv!8325 _keys!709)))

(declare-fun b!398314 () Bool)

(declare-fun e!240758 () Bool)

(assert (=> b!398314 (= e!240759 (and e!240758 mapRes!16551))))

(declare-fun condMapEmpty!16551 () Bool)

(declare-fun mapDefault!16551 () ValueCell!4633)

