; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4114 () Bool)

(assert start!4114)

(declare-fun b_free!1019 () Bool)

(declare-fun b_next!1019 () Bool)

(assert (=> start!4114 (= b_free!1019 (not b_next!1019))))

(declare-fun tp!4476 () Bool)

(declare-fun b_and!1829 () Bool)

(assert (=> start!4114 (= tp!4476 b_and!1829)))

(declare-fun b!30675 () Bool)

(declare-fun e!19653 () Bool)

(declare-fun tp_is_empty!1373 () Bool)

(assert (=> b!30675 (= e!19653 tp_is_empty!1373)))

(declare-fun b!30676 () Bool)

(declare-fun res!18508 () Bool)

(declare-fun e!19652 () Bool)

(assert (=> b!30676 (=> (not res!18508) (not e!19652))))

(declare-datatypes ((array!1973 0))(
  ( (array!1974 (arr!940 (Array (_ BitVec 32) (_ BitVec 64))) (size!1041 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1973)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1973 (_ BitVec 32)) Bool)

(assert (=> b!30676 (= res!18508 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30677 () Bool)

(declare-fun res!18509 () Bool)

(assert (=> b!30677 (=> (not res!18509) (not e!19652))))

(declare-datatypes ((List!768 0))(
  ( (Nil!765) (Cons!764 (h!1331 (_ BitVec 64)) (t!3461 List!768)) )
))
(declare-fun arrayNoDuplicates!0 (array!1973 (_ BitVec 32) List!768) Bool)

(assert (=> b!30677 (= res!18509 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!765))))

(declare-fun b!30678 () Bool)

(declare-fun e!19654 () Bool)

(declare-fun e!19655 () Bool)

(declare-fun mapRes!1588 () Bool)

(assert (=> b!30678 (= e!19654 (and e!19655 mapRes!1588))))

(declare-fun condMapEmpty!1588 () Bool)

(declare-datatypes ((V!1655 0))(
  ( (V!1656 (val!713 Int)) )
))
(declare-datatypes ((ValueCell!487 0))(
  ( (ValueCellFull!487 (v!1802 V!1655)) (EmptyCell!487) )
))
(declare-datatypes ((array!1975 0))(
  ( (array!1976 (arr!941 (Array (_ BitVec 32) ValueCell!487)) (size!1042 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1975)

(declare-fun mapDefault!1588 () ValueCell!487)

