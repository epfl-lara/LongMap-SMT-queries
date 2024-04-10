; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4120 () Bool)

(assert start!4120)

(declare-fun b_free!1025 () Bool)

(declare-fun b_next!1025 () Bool)

(assert (=> start!4120 (= b_free!1025 (not b_next!1025))))

(declare-fun tp!4495 () Bool)

(declare-fun b_and!1835 () Bool)

(assert (=> start!4120 (= tp!4495 b_and!1835)))

(declare-fun mapNonEmpty!1597 () Bool)

(declare-fun mapRes!1597 () Bool)

(declare-fun tp!4494 () Bool)

(declare-fun e!19716 () Bool)

(assert (=> mapNonEmpty!1597 (= mapRes!1597 (and tp!4494 e!19716))))

(declare-datatypes ((V!1663 0))(
  ( (V!1664 (val!716 Int)) )
))
(declare-datatypes ((ValueCell!490 0))(
  ( (ValueCellFull!490 (v!1805 V!1663)) (EmptyCell!490) )
))
(declare-datatypes ((array!1985 0))(
  ( (array!1986 (arr!946 (Array (_ BitVec 32) ValueCell!490)) (size!1047 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1985)

(declare-fun mapRest!1597 () (Array (_ BitVec 32) ValueCell!490))

(declare-fun mapValue!1597 () ValueCell!490)

(declare-fun mapKey!1597 () (_ BitVec 32))

(assert (=> mapNonEmpty!1597 (= (arr!946 _values!1501) (store mapRest!1597 mapKey!1597 mapValue!1597))))

(declare-fun b!30773 () Bool)

(declare-fun res!18583 () Bool)

(declare-fun e!19718 () Bool)

(assert (=> b!30773 (=> (not res!18583) (not e!19718))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1987 0))(
  ( (array!1988 (arr!947 (Array (_ BitVec 32) (_ BitVec 64))) (size!1048 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1987)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!30773 (= res!18583 (and (= (size!1047 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1048 _keys!1833) (size!1047 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30774 () Bool)

(declare-fun e!19713 () Bool)

(declare-fun e!19712 () Bool)

(assert (=> b!30774 (= e!19713 e!19712)))

(declare-fun res!18580 () Bool)

(assert (=> b!30774 (=> (not res!18580) (not e!19712))))

(declare-datatypes ((SeekEntryResult!110 0))(
  ( (MissingZero!110 (index!2562 (_ BitVec 32))) (Found!110 (index!2563 (_ BitVec 32))) (Intermediate!110 (undefined!922 Bool) (index!2564 (_ BitVec 32)) (x!6564 (_ BitVec 32))) (Undefined!110) (MissingVacant!110 (index!2565 (_ BitVec 32))) )
))
(declare-fun lt!11470 () SeekEntryResult!110)

(assert (=> b!30774 (= res!18580 (is-Found!110 lt!11470))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1987 (_ BitVec 32)) SeekEntryResult!110)

(assert (=> b!30774 (= lt!11470 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!30775 () Bool)

(declare-fun e!19714 () Bool)

(declare-fun e!19717 () Bool)

(assert (=> b!30775 (= e!19714 (and e!19717 mapRes!1597))))

(declare-fun condMapEmpty!1597 () Bool)

(declare-fun mapDefault!1597 () ValueCell!490)

