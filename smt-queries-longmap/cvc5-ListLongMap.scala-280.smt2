; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4546 () Bool)

(assert start!4546)

(declare-fun b_free!1267 () Bool)

(declare-fun b_next!1267 () Bool)

(assert (=> start!4546 (= b_free!1267 (not b_next!1267))))

(declare-fun tp!5244 () Bool)

(declare-fun b_and!2093 () Bool)

(assert (=> start!4546 (= tp!5244 b_and!2093)))

(declare-fun b!35498 () Bool)

(declare-fun e!22425 () Bool)

(declare-fun tp_is_empty!1621 () Bool)

(assert (=> b!35498 (= e!22425 tp_is_empty!1621)))

(declare-fun b!35499 () Bool)

(declare-fun res!21554 () Bool)

(declare-fun e!22428 () Bool)

(assert (=> b!35499 (=> (not res!21554) (not e!22428))))

(declare-datatypes ((V!1987 0))(
  ( (V!1988 (val!837 Int)) )
))
(declare-datatypes ((ValueCell!611 0))(
  ( (ValueCellFull!611 (v!1934 V!1987)) (EmptyCell!611) )
))
(declare-datatypes ((array!2459 0))(
  ( (array!2460 (arr!1175 (Array (_ BitVec 32) ValueCell!611)) (size!1276 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2459)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2461 0))(
  ( (array!2462 (arr!1176 (Array (_ BitVec 32) (_ BitVec 64))) (size!1277 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2461)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!35499 (= res!21554 (and (= (size!1276 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1277 _keys!1833) (size!1276 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1984 () Bool)

(declare-fun mapRes!1984 () Bool)

(assert (=> mapIsEmpty!1984 mapRes!1984))

(declare-fun b!35500 () Bool)

(declare-fun res!21548 () Bool)

(assert (=> b!35500 (=> (not res!21548) (not e!22428))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2461 (_ BitVec 32)) Bool)

(assert (=> b!35500 (= res!21548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35501 () Bool)

(declare-fun res!21551 () Bool)

(assert (=> b!35501 (=> (not res!21551) (not e!22428))))

(declare-datatypes ((List!942 0))(
  ( (Nil!939) (Cons!938 (h!1505 (_ BitVec 64)) (t!3651 List!942)) )
))
(declare-fun arrayNoDuplicates!0 (array!2461 (_ BitVec 32) List!942) Bool)

(assert (=> b!35501 (= res!21551 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!939))))

(declare-fun b!35502 () Bool)

(declare-fun e!22423 () Bool)

(declare-fun e!22424 () Bool)

(assert (=> b!35502 (= e!22423 (and e!22424 mapRes!1984))))

(declare-fun condMapEmpty!1984 () Bool)

(declare-fun mapDefault!1984 () ValueCell!611)

