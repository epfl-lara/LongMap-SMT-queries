; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!84260 () Bool)

(assert start!84260)

(declare-fun mapIsEmpty!36623 () Bool)

(declare-fun mapRes!36623 () Bool)

(assert (=> mapIsEmpty!36623 mapRes!36623))

(declare-fun b!985813 () Bool)

(declare-fun res!659666 () Bool)

(declare-fun e!555683 () Bool)

(assert (=> b!985813 (=> (not res!659666) (not e!555683))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35733 0))(
  ( (V!35734 (val!11582 Int)) )
))
(declare-datatypes ((ValueCell!11050 0))(
  ( (ValueCellFull!11050 (v!14144 V!35733)) (EmptyCell!11050) )
))
(declare-datatypes ((array!62101 0))(
  ( (array!62102 (arr!29908 (Array (_ BitVec 32) ValueCell!11050)) (size!30387 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62101)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!62103 0))(
  ( (array!62104 (arr!29909 (Array (_ BitVec 32) (_ BitVec 64))) (size!30388 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62103)

(assert (=> b!985813 (= res!659666 (and (= (size!30387 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30388 _keys!1544) (size!30387 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985814 () Bool)

(declare-fun res!659664 () Bool)

(assert (=> b!985814 (=> (not res!659664) (not e!555683))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62103 (_ BitVec 32)) Bool)

(assert (=> b!985814 (= res!659664 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!36623 () Bool)

(declare-fun tp!69478 () Bool)

(declare-fun e!555686 () Bool)

(assert (=> mapNonEmpty!36623 (= mapRes!36623 (and tp!69478 e!555686))))

(declare-fun mapKey!36623 () (_ BitVec 32))

(declare-fun mapValue!36623 () ValueCell!11050)

(declare-fun mapRest!36623 () (Array (_ BitVec 32) ValueCell!11050))

(assert (=> mapNonEmpty!36623 (= (arr!29908 _values!1278) (store mapRest!36623 mapKey!36623 mapValue!36623))))

(declare-fun res!659665 () Bool)

(assert (=> start!84260 (=> (not res!659665) (not e!555683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84260 (= res!659665 (validMask!0 mask!1948))))

(assert (=> start!84260 e!555683))

(assert (=> start!84260 true))

(declare-fun e!555684 () Bool)

(declare-fun array_inv!23115 (array!62101) Bool)

(assert (=> start!84260 (and (array_inv!23115 _values!1278) e!555684)))

(declare-fun array_inv!23116 (array!62103) Bool)

(assert (=> start!84260 (array_inv!23116 _keys!1544)))

(declare-fun b!985815 () Bool)

(assert (=> b!985815 (= e!555683 false)))

(declare-fun lt!437390 () Bool)

(declare-datatypes ((List!20716 0))(
  ( (Nil!20713) (Cons!20712 (h!21874 (_ BitVec 64)) (t!29615 List!20716)) )
))
(declare-fun arrayNoDuplicates!0 (array!62103 (_ BitVec 32) List!20716) Bool)

(assert (=> b!985815 (= lt!437390 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20713))))

(declare-fun b!985816 () Bool)

(declare-fun tp_is_empty!23063 () Bool)

(assert (=> b!985816 (= e!555686 tp_is_empty!23063)))

(declare-fun b!985817 () Bool)

(declare-fun e!555687 () Bool)

(assert (=> b!985817 (= e!555687 tp_is_empty!23063)))

(declare-fun b!985818 () Bool)

(assert (=> b!985818 (= e!555684 (and e!555687 mapRes!36623))))

(declare-fun condMapEmpty!36623 () Bool)

(declare-fun mapDefault!36623 () ValueCell!11050)

