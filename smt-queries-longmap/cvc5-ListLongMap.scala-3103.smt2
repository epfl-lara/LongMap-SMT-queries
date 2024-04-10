; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43580 () Bool)

(assert start!43580)

(declare-fun b_free!12337 () Bool)

(declare-fun b_next!12337 () Bool)

(assert (=> start!43580 (= b_free!12337 (not b_next!12337))))

(declare-fun tp!43296 () Bool)

(declare-fun b_and!21099 () Bool)

(assert (=> start!43580 (= tp!43296 b_and!21099)))

(declare-fun b!482837 () Bool)

(declare-fun res!287786 () Bool)

(declare-fun e!284147 () Bool)

(assert (=> b!482837 (=> (not res!287786) (not e!284147))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482837 (= res!287786 (validKeyInArray!0 k!1332))))

(declare-fun b!482838 () Bool)

(declare-fun e!284148 () Bool)

(declare-fun tp_is_empty!13849 () Bool)

(assert (=> b!482838 (= e!284148 tp_is_empty!13849)))

(declare-fun res!287784 () Bool)

(assert (=> start!43580 (=> (not res!287784) (not e!284147))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43580 (= res!287784 (validMask!0 mask!2352))))

(assert (=> start!43580 e!284147))

(assert (=> start!43580 true))

(assert (=> start!43580 tp_is_empty!13849))

(declare-datatypes ((V!19537 0))(
  ( (V!19538 (val!6972 Int)) )
))
(declare-datatypes ((ValueCell!6563 0))(
  ( (ValueCellFull!6563 (v!9266 V!19537)) (EmptyCell!6563) )
))
(declare-datatypes ((array!31357 0))(
  ( (array!31358 (arr!15080 (Array (_ BitVec 32) ValueCell!6563)) (size!15438 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31357)

(declare-fun e!284144 () Bool)

(declare-fun array_inv!10878 (array!31357) Bool)

(assert (=> start!43580 (and (array_inv!10878 _values!1516) e!284144)))

(assert (=> start!43580 tp!43296))

(declare-datatypes ((array!31359 0))(
  ( (array!31360 (arr!15081 (Array (_ BitVec 32) (_ BitVec 64))) (size!15439 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31359)

(declare-fun array_inv!10879 (array!31359) Bool)

(assert (=> start!43580 (array_inv!10879 _keys!1874)))

(declare-fun b!482839 () Bool)

(declare-fun res!287788 () Bool)

(assert (=> b!482839 (=> (not res!287788) (not e!284147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31359 (_ BitVec 32)) Bool)

(assert (=> b!482839 (= res!287788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482840 () Bool)

(declare-fun res!287787 () Bool)

(assert (=> b!482840 (=> (not res!287787) (not e!284147))))

(declare-datatypes ((List!9232 0))(
  ( (Nil!9229) (Cons!9228 (h!10084 (_ BitVec 64)) (t!15448 List!9232)) )
))
(declare-fun arrayNoDuplicates!0 (array!31359 (_ BitVec 32) List!9232) Bool)

(assert (=> b!482840 (= res!287787 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9229))))

(declare-fun mapNonEmpty!22486 () Bool)

(declare-fun mapRes!22486 () Bool)

(declare-fun tp!43297 () Bool)

(declare-fun e!284143 () Bool)

(assert (=> mapNonEmpty!22486 (= mapRes!22486 (and tp!43297 e!284143))))

(declare-fun mapRest!22486 () (Array (_ BitVec 32) ValueCell!6563))

(declare-fun mapKey!22486 () (_ BitVec 32))

(declare-fun mapValue!22486 () ValueCell!6563)

(assert (=> mapNonEmpty!22486 (= (arr!15080 _values!1516) (store mapRest!22486 mapKey!22486 mapValue!22486))))

(declare-fun b!482841 () Bool)

(declare-fun lt!218866 () (_ BitVec 32))

(assert (=> b!482841 (= e!284147 (not (or (not (= (size!15439 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))) (bvsgt #b00000000000000000000000000000000 (size!15439 _keys!1874)) (and (bvsge lt!218866 #b00000000000000000000000000000000) (bvsle lt!218866 (size!15439 _keys!1874))))))))

(declare-fun arrayScanForKey!0 (array!31359 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482841 (= lt!218866 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!284145 () Bool)

(assert (=> b!482841 e!284145))

(declare-fun c!58011 () Bool)

(assert (=> b!482841 (= c!58011 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19537)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19537)

(declare-datatypes ((Unit!14156 0))(
  ( (Unit!14157) )
))
(declare-fun lt!218865 () Unit!14156)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!148 (array!31359 array!31357 (_ BitVec 32) (_ BitVec 32) V!19537 V!19537 (_ BitVec 64) Int) Unit!14156)

(assert (=> b!482841 (= lt!218865 (lemmaKeyInListMapIsInArray!148 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!482842 () Bool)

(declare-fun arrayContainsKey!0 (array!31359 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482842 (= e!284145 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!22486 () Bool)

(assert (=> mapIsEmpty!22486 mapRes!22486))

(declare-fun b!482843 () Bool)

(assert (=> b!482843 (= e!284144 (and e!284148 mapRes!22486))))

(declare-fun condMapEmpty!22486 () Bool)

(declare-fun mapDefault!22486 () ValueCell!6563)

