; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33400 () Bool)

(assert start!33400)

(declare-fun b!331741 () Bool)

(declare-fun e!203584 () Bool)

(declare-fun tp_is_empty!6683 () Bool)

(assert (=> b!331741 (= e!203584 tp_is_empty!6683)))

(declare-fun b!331742 () Bool)

(declare-fun res!182769 () Bool)

(declare-fun e!203583 () Bool)

(assert (=> b!331742 (=> (not res!182769) (not e!203583))))

(declare-datatypes ((array!16961 0))(
  ( (array!16962 (arr!8018 (Array (_ BitVec 32) (_ BitVec 64))) (size!8370 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!16961)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!16961 (_ BitVec 32)) Bool)

(assert (=> b!331742 (= res!182769 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!331743 () Bool)

(assert (=> b!331743 (= e!203583 (and (bvsle #b00000000000000000000000000000000 (size!8370 _keys!1895)) (bvsge (size!8370 _keys!1895) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!11400 () Bool)

(declare-fun mapRes!11400 () Bool)

(declare-fun tp!23775 () Bool)

(declare-fun e!203587 () Bool)

(assert (=> mapNonEmpty!11400 (= mapRes!11400 (and tp!23775 e!203587))))

(declare-fun mapKey!11400 () (_ BitVec 32))

(declare-datatypes ((V!9887 0))(
  ( (V!9888 (val!3386 Int)) )
))
(declare-datatypes ((ValueCell!2998 0))(
  ( (ValueCellFull!2998 (v!5544 V!9887)) (EmptyCell!2998) )
))
(declare-datatypes ((array!16963 0))(
  ( (array!16964 (arr!8019 (Array (_ BitVec 32) ValueCell!2998)) (size!8371 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!16963)

(declare-fun mapValue!11400 () ValueCell!2998)

(declare-fun mapRest!11400 () (Array (_ BitVec 32) ValueCell!2998))

(assert (=> mapNonEmpty!11400 (= (arr!8019 _values!1525) (store mapRest!11400 mapKey!11400 mapValue!11400))))

(declare-fun b!331744 () Bool)

(declare-fun e!203585 () Bool)

(assert (=> b!331744 (= e!203585 (and e!203584 mapRes!11400))))

(declare-fun condMapEmpty!11400 () Bool)

(declare-fun mapDefault!11400 () ValueCell!2998)

