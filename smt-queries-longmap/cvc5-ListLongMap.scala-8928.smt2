; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108256 () Bool)

(assert start!108256)

(declare-fun b!1278181 () Bool)

(declare-fun e!730084 () Bool)

(declare-datatypes ((array!84052 0))(
  ( (array!84053 (arr!40534 (Array (_ BitVec 32) (_ BitVec 64))) (size!41084 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84052)

(assert (=> b!1278181 (= e!730084 (bvsgt #b00000000000000000000000000000000 (size!41084 _keys!1741)))))

(declare-fun b!1278182 () Bool)

(declare-fun res!849210 () Bool)

(assert (=> b!1278182 (=> (not res!849210) (not e!730084))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!49745 0))(
  ( (V!49746 (val!16815 Int)) )
))
(declare-datatypes ((ValueCell!15842 0))(
  ( (ValueCellFull!15842 (v!19414 V!49745)) (EmptyCell!15842) )
))
(declare-datatypes ((array!84054 0))(
  ( (array!84055 (arr!40535 (Array (_ BitVec 32) ValueCell!15842)) (size!41085 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84054)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1278182 (= res!849210 (and (= (size!41085 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41084 _keys!1741) (size!41085 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!849209 () Bool)

(assert (=> start!108256 (=> (not res!849209) (not e!730084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108256 (= res!849209 (validMask!0 mask!2175))))

(assert (=> start!108256 e!730084))

(assert (=> start!108256 true))

(declare-fun e!730085 () Bool)

(declare-fun array_inv!30793 (array!84054) Bool)

(assert (=> start!108256 (and (array_inv!30793 _values!1445) e!730085)))

(declare-fun array_inv!30794 (array!84052) Bool)

(assert (=> start!108256 (array_inv!30794 _keys!1741)))

(declare-fun b!1278183 () Bool)

(declare-fun res!849208 () Bool)

(assert (=> b!1278183 (=> (not res!849208) (not e!730084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84052 (_ BitVec 32)) Bool)

(assert (=> b!1278183 (= res!849208 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1278184 () Bool)

(declare-fun e!730086 () Bool)

(declare-fun mapRes!51761 () Bool)

(assert (=> b!1278184 (= e!730085 (and e!730086 mapRes!51761))))

(declare-fun condMapEmpty!51761 () Bool)

(declare-fun mapDefault!51761 () ValueCell!15842)

