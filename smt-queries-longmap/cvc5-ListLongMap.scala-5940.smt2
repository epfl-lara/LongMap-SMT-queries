; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77456 () Bool)

(assert start!77456)

(declare-fun b!902686 () Bool)

(declare-fun res!609138 () Bool)

(declare-fun e!505606 () Bool)

(assert (=> b!902686 (=> (not res!609138) (not e!505606))))

(declare-datatypes ((V!29591 0))(
  ( (V!29592 (val!9285 Int)) )
))
(declare-datatypes ((ValueCell!8753 0))(
  ( (ValueCellFull!8753 (v!11790 V!29591)) (EmptyCell!8753) )
))
(declare-datatypes ((array!52998 0))(
  ( (array!52999 (arr!25459 (Array (_ BitVec 32) ValueCell!8753)) (size!25918 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!52998)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53000 0))(
  ( (array!53001 (arr!25460 (Array (_ BitVec 32) (_ BitVec 64))) (size!25919 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53000)

(assert (=> b!902686 (= res!609138 (and (= (size!25918 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25919 _keys!1386) (size!25918 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!29413 () Bool)

(declare-fun mapRes!29413 () Bool)

(declare-fun tp!56472 () Bool)

(declare-fun e!505607 () Bool)

(assert (=> mapNonEmpty!29413 (= mapRes!29413 (and tp!56472 e!505607))))

(declare-fun mapValue!29413 () ValueCell!8753)

(declare-fun mapRest!29413 () (Array (_ BitVec 32) ValueCell!8753))

(declare-fun mapKey!29413 () (_ BitVec 32))

(assert (=> mapNonEmpty!29413 (= (arr!25459 _values!1152) (store mapRest!29413 mapKey!29413 mapValue!29413))))

(declare-fun b!902687 () Bool)

(declare-fun e!505608 () Bool)

(declare-fun e!505604 () Bool)

(assert (=> b!902687 (= e!505608 (and e!505604 mapRes!29413))))

(declare-fun condMapEmpty!29413 () Bool)

(declare-fun mapDefault!29413 () ValueCell!8753)

