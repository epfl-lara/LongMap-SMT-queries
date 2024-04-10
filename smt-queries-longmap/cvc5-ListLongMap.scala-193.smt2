; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3778 () Bool)

(assert start!3778)

(declare-fun b!26396 () Bool)

(declare-fun res!15674 () Bool)

(declare-fun e!17189 () Bool)

(assert (=> b!26396 (=> (not res!15674) (not e!17189))))

(declare-datatypes ((array!1441 0))(
  ( (array!1442 (arr!678 (Array (_ BitVec 32) (_ BitVec 64))) (size!779 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1441)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1441 (_ BitVec 32)) Bool)

(assert (=> b!26396 (= res!15674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapIsEmpty!1165 () Bool)

(declare-fun mapRes!1165 () Bool)

(assert (=> mapIsEmpty!1165 mapRes!1165))

(declare-fun b!26397 () Bool)

(declare-fun res!15673 () Bool)

(assert (=> b!26397 (=> (not res!15673) (not e!17189))))

(declare-datatypes ((V!1291 0))(
  ( (V!1292 (val!576 Int)) )
))
(declare-datatypes ((ValueCell!350 0))(
  ( (ValueCellFull!350 (v!1662 V!1291)) (EmptyCell!350) )
))
(declare-datatypes ((array!1443 0))(
  ( (array!1444 (arr!679 (Array (_ BitVec 32) ValueCell!350)) (size!780 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1443)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26397 (= res!15673 (and (= (size!780 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!779 _keys!1833) (size!780 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26398 () Bool)

(declare-fun e!17186 () Bool)

(declare-fun tp_is_empty!1099 () Bool)

(assert (=> b!26398 (= e!17186 tp_is_empty!1099)))

(declare-fun b!26399 () Bool)

(declare-fun e!17185 () Bool)

(assert (=> b!26399 (= e!17185 tp_is_empty!1099)))

(declare-fun mapNonEmpty!1165 () Bool)

(declare-fun tp!3685 () Bool)

(assert (=> mapNonEmpty!1165 (= mapRes!1165 (and tp!3685 e!17185))))

(declare-fun mapRest!1165 () (Array (_ BitVec 32) ValueCell!350))

(declare-fun mapKey!1165 () (_ BitVec 32))

(declare-fun mapValue!1165 () ValueCell!350)

(assert (=> mapNonEmpty!1165 (= (arr!679 _values!1501) (store mapRest!1165 mapKey!1165 mapValue!1165))))

(declare-fun b!26401 () Bool)

(declare-fun e!17188 () Bool)

(assert (=> b!26401 (= e!17188 (and e!17186 mapRes!1165))))

(declare-fun condMapEmpty!1165 () Bool)

(declare-fun mapDefault!1165 () ValueCell!350)

