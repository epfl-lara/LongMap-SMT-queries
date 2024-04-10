; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33474 () Bool)

(assert start!33474)

(declare-fun mapNonEmpty!11475 () Bool)

(declare-fun mapRes!11475 () Bool)

(declare-fun tp!23850 () Bool)

(declare-fun e!203988 () Bool)

(assert (=> mapNonEmpty!11475 (= mapRes!11475 (and tp!23850 e!203988))))

(declare-datatypes ((V!9947 0))(
  ( (V!9948 (val!3408 Int)) )
))
(declare-datatypes ((ValueCell!3020 0))(
  ( (ValueCellFull!3020 (v!5567 V!9947)) (EmptyCell!3020) )
))
(declare-fun mapValue!11475 () ValueCell!3020)

(declare-datatypes ((array!17049 0))(
  ( (array!17050 (arr!8059 (Array (_ BitVec 32) ValueCell!3020)) (size!8411 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17049)

(declare-fun mapRest!11475 () (Array (_ BitVec 32) ValueCell!3020))

(declare-fun mapKey!11475 () (_ BitVec 32))

(assert (=> mapNonEmpty!11475 (= (arr!8059 _values!1525) (store mapRest!11475 mapKey!11475 mapValue!11475))))

(declare-fun mapIsEmpty!11475 () Bool)

(assert (=> mapIsEmpty!11475 mapRes!11475))

(declare-fun b!332254 () Bool)

(declare-fun e!203990 () Bool)

(assert (=> b!332254 (= e!203990 false)))

(declare-fun lt!158986 () Bool)

(declare-datatypes ((array!17051 0))(
  ( (array!17052 (arr!8060 (Array (_ BitVec 32) (_ BitVec 64))) (size!8412 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17051)

(declare-datatypes ((List!4587 0))(
  ( (Nil!4584) (Cons!4583 (h!5439 (_ BitVec 64)) (t!9669 List!4587)) )
))
(declare-fun arrayNoDuplicates!0 (array!17051 (_ BitVec 32) List!4587) Bool)

(assert (=> b!332254 (= lt!158986 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4584))))

(declare-fun b!332255 () Bool)

(declare-fun tp_is_empty!6727 () Bool)

(assert (=> b!332255 (= e!203988 tp_is_empty!6727)))

(declare-fun b!332256 () Bool)

(declare-fun res!183040 () Bool)

(assert (=> b!332256 (=> (not res!183040) (not e!203990))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!332256 (= res!183040 (and (= (size!8411 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8412 _keys!1895) (size!8411 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun res!183041 () Bool)

(assert (=> start!33474 (=> (not res!183041) (not e!203990))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33474 (= res!183041 (validMask!0 mask!2385))))

(assert (=> start!33474 e!203990))

(assert (=> start!33474 true))

(declare-fun e!203989 () Bool)

(declare-fun array_inv!6002 (array!17049) Bool)

(assert (=> start!33474 (and (array_inv!6002 _values!1525) e!203989)))

(declare-fun array_inv!6003 (array!17051) Bool)

(assert (=> start!33474 (array_inv!6003 _keys!1895)))

(declare-fun b!332253 () Bool)

(declare-fun e!203987 () Bool)

(assert (=> b!332253 (= e!203989 (and e!203987 mapRes!11475))))

(declare-fun condMapEmpty!11475 () Bool)

(declare-fun mapDefault!11475 () ValueCell!3020)

