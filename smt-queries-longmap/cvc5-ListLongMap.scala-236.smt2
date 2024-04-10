; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4098 () Bool)

(assert start!4098)

(declare-fun b_free!1003 () Bool)

(declare-fun b_next!1003 () Bool)

(assert (=> start!4098 (= b_free!1003 (not b_next!1003))))

(declare-fun tp!4428 () Bool)

(declare-fun b_and!1813 () Bool)

(assert (=> start!4098 (= tp!4428 b_and!1813)))

(declare-fun b!30435 () Bool)

(declare-fun res!18345 () Bool)

(declare-fun e!19535 () Bool)

(assert (=> b!30435 (=> (not res!18345) (not e!19535))))

(declare-datatypes ((array!1943 0))(
  ( (array!1944 (arr!925 (Array (_ BitVec 32) (_ BitVec 64))) (size!1026 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1943)

(declare-datatypes ((List!758 0))(
  ( (Nil!755) (Cons!754 (h!1321 (_ BitVec 64)) (t!3451 List!758)) )
))
(declare-fun arrayNoDuplicates!0 (array!1943 (_ BitVec 32) List!758) Bool)

(assert (=> b!30435 (= res!18345 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!755))))

(declare-fun res!18339 () Bool)

(assert (=> start!4098 (=> (not res!18339) (not e!19535))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4098 (= res!18339 (validMask!0 mask!2294))))

(assert (=> start!4098 e!19535))

(assert (=> start!4098 true))

(assert (=> start!4098 tp!4428))

(declare-datatypes ((V!1635 0))(
  ( (V!1636 (val!705 Int)) )
))
(declare-datatypes ((ValueCell!479 0))(
  ( (ValueCellFull!479 (v!1794 V!1635)) (EmptyCell!479) )
))
(declare-datatypes ((array!1945 0))(
  ( (array!1946 (arr!926 (Array (_ BitVec 32) ValueCell!479)) (size!1027 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1945)

(declare-fun e!19531 () Bool)

(declare-fun array_inv!645 (array!1945) Bool)

(assert (=> start!4098 (and (array_inv!645 _values!1501) e!19531)))

(declare-fun array_inv!646 (array!1943) Bool)

(assert (=> start!4098 (array_inv!646 _keys!1833)))

(declare-fun tp_is_empty!1357 () Bool)

(assert (=> start!4098 tp_is_empty!1357))

(declare-fun b!30436 () Bool)

(declare-fun res!18342 () Bool)

(assert (=> b!30436 (=> (not res!18342) (not e!19535))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1635)

(declare-fun minValue!1443 () V!1635)

(declare-datatypes ((tuple2!1164 0))(
  ( (tuple2!1165 (_1!593 (_ BitVec 64)) (_2!593 V!1635)) )
))
(declare-datatypes ((List!759 0))(
  ( (Nil!756) (Cons!755 (h!1322 tuple2!1164) (t!3452 List!759)) )
))
(declare-datatypes ((ListLongMap!741 0))(
  ( (ListLongMap!742 (toList!386 List!759)) )
))
(declare-fun contains!326 (ListLongMap!741 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!214 (array!1943 array!1945 (_ BitVec 32) (_ BitVec 32) V!1635 V!1635 (_ BitVec 32) Int) ListLongMap!741)

(assert (=> b!30436 (= res!18342 (not (contains!326 (getCurrentListMap!214 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!30437 () Bool)

(declare-fun e!19534 () Bool)

(assert (=> b!30437 (= e!19534 tp_is_empty!1357)))

(declare-fun mapIsEmpty!1564 () Bool)

(declare-fun mapRes!1564 () Bool)

(assert (=> mapIsEmpty!1564 mapRes!1564))

(declare-fun b!30438 () Bool)

(declare-fun e!19532 () Bool)

(assert (=> b!30438 (= e!19532 tp_is_empty!1357)))

(declare-fun b!30439 () Bool)

(declare-fun res!18343 () Bool)

(assert (=> b!30439 (=> (not res!18343) (not e!19535))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1943 (_ BitVec 32)) Bool)

(assert (=> b!30439 (= res!18343 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30440 () Bool)

(declare-fun res!18344 () Bool)

(assert (=> b!30440 (=> (not res!18344) (not e!19535))))

(assert (=> b!30440 (= res!18344 (and (= (size!1027 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1026 _keys!1833) (size!1027 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30441 () Bool)

(declare-fun res!18341 () Bool)

(assert (=> b!30441 (=> (not res!18341) (not e!19535))))

(declare-fun arrayContainsKey!0 (array!1943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30441 (= res!18341 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30442 () Bool)

(assert (=> b!30442 (= e!19535 false)))

(declare-datatypes ((SeekEntryResult!102 0))(
  ( (MissingZero!102 (index!2530 (_ BitVec 32))) (Found!102 (index!2531 (_ BitVec 32))) (Intermediate!102 (undefined!914 Bool) (index!2532 (_ BitVec 32)) (x!6532 (_ BitVec 32))) (Undefined!102) (MissingVacant!102 (index!2533 (_ BitVec 32))) )
))
(declare-fun lt!11420 () SeekEntryResult!102)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1943 (_ BitVec 32)) SeekEntryResult!102)

(assert (=> b!30442 (= lt!11420 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!30443 () Bool)

(declare-fun res!18340 () Bool)

(assert (=> b!30443 (=> (not res!18340) (not e!19535))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30443 (= res!18340 (validKeyInArray!0 k!1304))))

(declare-fun mapNonEmpty!1564 () Bool)

(declare-fun tp!4429 () Bool)

(assert (=> mapNonEmpty!1564 (= mapRes!1564 (and tp!4429 e!19534))))

(declare-fun mapKey!1564 () (_ BitVec 32))

(declare-fun mapRest!1564 () (Array (_ BitVec 32) ValueCell!479))

(declare-fun mapValue!1564 () ValueCell!479)

(assert (=> mapNonEmpty!1564 (= (arr!926 _values!1501) (store mapRest!1564 mapKey!1564 mapValue!1564))))

(declare-fun b!30444 () Bool)

(assert (=> b!30444 (= e!19531 (and e!19532 mapRes!1564))))

(declare-fun condMapEmpty!1564 () Bool)

(declare-fun mapDefault!1564 () ValueCell!479)

