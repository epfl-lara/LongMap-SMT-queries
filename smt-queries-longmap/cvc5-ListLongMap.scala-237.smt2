; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4104 () Bool)

(assert start!4104)

(declare-fun b_free!1009 () Bool)

(declare-fun b_next!1009 () Bool)

(assert (=> start!4104 (= b_free!1009 (not b_next!1009))))

(declare-fun tp!4446 () Bool)

(declare-fun b_and!1819 () Bool)

(assert (=> start!4104 (= tp!4446 b_and!1819)))

(declare-fun b!30525 () Bool)

(declare-fun res!18404 () Bool)

(declare-fun e!19576 () Bool)

(assert (=> b!30525 (=> (not res!18404) (not e!19576))))

(declare-datatypes ((array!1955 0))(
  ( (array!1956 (arr!931 (Array (_ BitVec 32) (_ BitVec 64))) (size!1032 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1955)

(declare-datatypes ((List!762 0))(
  ( (Nil!759) (Cons!758 (h!1325 (_ BitVec 64)) (t!3455 List!762)) )
))
(declare-fun arrayNoDuplicates!0 (array!1955 (_ BitVec 32) List!762) Bool)

(assert (=> b!30525 (= res!18404 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!759))))

(declare-fun res!18406 () Bool)

(assert (=> start!4104 (=> (not res!18406) (not e!19576))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4104 (= res!18406 (validMask!0 mask!2294))))

(assert (=> start!4104 e!19576))

(assert (=> start!4104 true))

(assert (=> start!4104 tp!4446))

(declare-datatypes ((V!1643 0))(
  ( (V!1644 (val!708 Int)) )
))
(declare-datatypes ((ValueCell!482 0))(
  ( (ValueCellFull!482 (v!1797 V!1643)) (EmptyCell!482) )
))
(declare-datatypes ((array!1957 0))(
  ( (array!1958 (arr!932 (Array (_ BitVec 32) ValueCell!482)) (size!1033 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1957)

(declare-fun e!19579 () Bool)

(declare-fun array_inv!651 (array!1957) Bool)

(assert (=> start!4104 (and (array_inv!651 _values!1501) e!19579)))

(declare-fun array_inv!652 (array!1955) Bool)

(assert (=> start!4104 (array_inv!652 _keys!1833)))

(declare-fun tp_is_empty!1363 () Bool)

(assert (=> start!4104 tp_is_empty!1363))

(declare-fun b!30526 () Bool)

(declare-fun res!18405 () Bool)

(assert (=> b!30526 (=> (not res!18405) (not e!19576))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30526 (= res!18405 (validKeyInArray!0 k!1304))))

(declare-fun b!30527 () Bool)

(declare-fun e!19577 () Bool)

(assert (=> b!30527 (= e!19577 tp_is_empty!1363)))

(declare-fun b!30528 () Bool)

(declare-fun res!18408 () Bool)

(assert (=> b!30528 (=> (not res!18408) (not e!19576))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30528 (= res!18408 (and (= (size!1033 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1032 _keys!1833) (size!1033 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1573 () Bool)

(declare-fun mapRes!1573 () Bool)

(declare-fun tp!4447 () Bool)

(declare-fun e!19580 () Bool)

(assert (=> mapNonEmpty!1573 (= mapRes!1573 (and tp!4447 e!19580))))

(declare-fun mapRest!1573 () (Array (_ BitVec 32) ValueCell!482))

(declare-fun mapKey!1573 () (_ BitVec 32))

(declare-fun mapValue!1573 () ValueCell!482)

(assert (=> mapNonEmpty!1573 (= (arr!932 _values!1501) (store mapRest!1573 mapKey!1573 mapValue!1573))))

(declare-fun b!30529 () Bool)

(declare-fun res!18403 () Bool)

(assert (=> b!30529 (=> (not res!18403) (not e!19576))))

(declare-fun arrayContainsKey!0 (array!1955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30529 (= res!18403 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30530 () Bool)

(assert (=> b!30530 (= e!19576 false)))

(declare-datatypes ((SeekEntryResult!104 0))(
  ( (MissingZero!104 (index!2538 (_ BitVec 32))) (Found!104 (index!2539 (_ BitVec 32))) (Intermediate!104 (undefined!916 Bool) (index!2540 (_ BitVec 32)) (x!6542 (_ BitVec 32))) (Undefined!104) (MissingVacant!104 (index!2541 (_ BitVec 32))) )
))
(declare-fun lt!11429 () SeekEntryResult!104)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1955 (_ BitVec 32)) SeekEntryResult!104)

(assert (=> b!30530 (= lt!11429 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!30531 () Bool)

(assert (=> b!30531 (= e!19580 tp_is_empty!1363)))

(declare-fun b!30532 () Bool)

(assert (=> b!30532 (= e!19579 (and e!19577 mapRes!1573))))

(declare-fun condMapEmpty!1573 () Bool)

(declare-fun mapDefault!1573 () ValueCell!482)

