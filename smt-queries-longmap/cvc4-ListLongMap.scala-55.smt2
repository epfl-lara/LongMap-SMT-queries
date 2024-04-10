; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!846 () Bool)

(assert start!846)

(declare-fun b_free!239 () Bool)

(declare-fun b_next!239 () Bool)

(assert (=> start!846 (= b_free!239 (not b_next!239))))

(declare-fun tp!947 () Bool)

(declare-fun b_and!385 () Bool)

(assert (=> start!846 (= tp!947 b_and!385)))

(declare-fun b!6829 () Bool)

(declare-fun e!3779 () Bool)

(assert (=> b!6829 (= e!3779 true)))

(declare-datatypes ((SeekEntryResult!25 0))(
  ( (MissingZero!25 (index!2219 (_ BitVec 32))) (Found!25 (index!2220 (_ BitVec 32))) (Intermediate!25 (undefined!837 Bool) (index!2221 (_ BitVec 32)) (x!2555 (_ BitVec 32))) (Undefined!25) (MissingVacant!25 (index!2222 (_ BitVec 32))) )
))
(declare-fun lt!1332 () SeekEntryResult!25)

(declare-fun lt!1331 () (_ BitVec 32))

(assert (=> b!6829 (and (is-Found!25 lt!1332) (= (index!2220 lt!1332) lt!1331))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!565 0))(
  ( (array!566 (arr!271 (Array (_ BitVec 32) (_ BitVec 64))) (size!333 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!565)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!565 (_ BitVec 32)) SeekEntryResult!25)

(assert (=> b!6829 (= lt!1332 (seekEntry!0 k!1278 _keys!1806 mask!2250))))

(declare-datatypes ((Unit!123 0))(
  ( (Unit!124) )
))
(declare-fun lt!1334 () Unit!123)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!565 (_ BitVec 32)) Unit!123)

(assert (=> b!6829 (= lt!1334 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1278 lt!1331 _keys!1806 mask!2250))))

(declare-fun res!7065 () Bool)

(declare-fun e!3772 () Bool)

(assert (=> start!846 (=> (not res!7065) (not e!3772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!846 (= res!7065 (validMask!0 mask!2250))))

(assert (=> start!846 e!3772))

(assert (=> start!846 tp!947))

(assert (=> start!846 true))

(declare-datatypes ((V!599 0))(
  ( (V!600 (val!164 Int)) )
))
(declare-datatypes ((ValueCell!142 0))(
  ( (ValueCellFull!142 (v!1255 V!599)) (EmptyCell!142) )
))
(declare-datatypes ((array!567 0))(
  ( (array!568 (arr!272 (Array (_ BitVec 32) ValueCell!142)) (size!334 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!567)

(declare-fun e!3774 () Bool)

(declare-fun array_inv!197 (array!567) Bool)

(assert (=> start!846 (and (array_inv!197 _values!1492) e!3774)))

(declare-fun tp_is_empty!317 () Bool)

(assert (=> start!846 tp_is_empty!317))

(declare-fun array_inv!198 (array!565) Bool)

(assert (=> start!846 (array_inv!198 _keys!1806)))

(declare-fun b!6830 () Bool)

(declare-fun e!3776 () Bool)

(declare-fun arrayContainsKey!0 (array!565 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6830 (= e!3776 (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6831 () Bool)

(declare-fun res!7061 () Bool)

(assert (=> b!6831 (=> (not res!7061) (not e!3772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!565 (_ BitVec 32)) Bool)

(assert (=> b!6831 (= res!7061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6832 () Bool)

(declare-fun e!3777 () Bool)

(assert (=> b!6832 (= e!3777 tp_is_empty!317)))

(declare-fun b!6833 () Bool)

(declare-fun res!7063 () Bool)

(assert (=> b!6833 (=> (not res!7063) (not e!3772))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!599)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!599)

(declare-datatypes ((tuple2!172 0))(
  ( (tuple2!173 (_1!86 (_ BitVec 64)) (_2!86 V!599)) )
))
(declare-datatypes ((List!181 0))(
  ( (Nil!178) (Cons!177 (h!743 tuple2!172) (t!2316 List!181)) )
))
(declare-datatypes ((ListLongMap!177 0))(
  ( (ListLongMap!178 (toList!104 List!181)) )
))
(declare-fun contains!78 (ListLongMap!177 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!63 (array!565 array!567 (_ BitVec 32) (_ BitVec 32) V!599 V!599 (_ BitVec 32) Int) ListLongMap!177)

(assert (=> b!6833 (= res!7063 (contains!78 (getCurrentListMap!63 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!6834 () Bool)

(declare-fun res!7064 () Bool)

(assert (=> b!6834 (=> (not res!7064) (not e!3772))))

(assert (=> b!6834 (= res!7064 (and (= (size!334 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!333 _keys!1806) (size!334 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!6835 () Bool)

(declare-fun res!7069 () Bool)

(assert (=> b!6835 (=> res!7069 e!3779)))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!565 (_ BitVec 32)) SeekEntryResult!25)

(assert (=> b!6835 (= res!7069 (not (= (seekEntryOrOpen!0 k!1278 _keys!1806 mask!2250) (Found!25 lt!1331))))))

(declare-fun b!6836 () Bool)

(declare-fun res!7067 () Bool)

(assert (=> b!6836 (=> (not res!7067) (not e!3772))))

(declare-datatypes ((List!182 0))(
  ( (Nil!179) (Cons!178 (h!744 (_ BitVec 64)) (t!2317 List!182)) )
))
(declare-fun arrayNoDuplicates!0 (array!565 (_ BitVec 32) List!182) Bool)

(assert (=> b!6836 (= res!7067 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!179))))

(declare-fun b!6837 () Bool)

(declare-fun e!3775 () Bool)

(assert (=> b!6837 (= e!3775 e!3779)))

(declare-fun res!7068 () Bool)

(assert (=> b!6837 (=> res!7068 e!3779)))

(assert (=> b!6837 (= res!7068 (not (= (size!333 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(assert (=> b!6837 (arrayForallSeekEntryOrOpenFound!0 lt!1331 _keys!1806 mask!2250)))

(declare-fun lt!1333 () Unit!123)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!565 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!123)

(assert (=> b!6837 (= lt!1333 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1331))))

(declare-fun arrayScanForKey!0 (array!565 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6837 (= lt!1331 (arrayScanForKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000))))

(declare-fun b!6838 () Bool)

(assert (=> b!6838 (= e!3772 (not e!3775))))

(declare-fun res!7066 () Bool)

(assert (=> b!6838 (=> res!7066 e!3775)))

(assert (=> b!6838 (= res!7066 (not (arrayContainsKey!0 _keys!1806 k!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6838 e!3776))

(declare-fun c!491 () Bool)

(assert (=> b!6838 (= c!491 (and (not (= k!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!1335 () Unit!123)

(declare-fun lemmaKeyInListMapIsInArray!43 (array!565 array!567 (_ BitVec 32) (_ BitVec 32) V!599 V!599 (_ BitVec 64) Int) Unit!123)

(assert (=> b!6838 (= lt!1335 (lemmaKeyInListMapIsInArray!43 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k!1278 defaultEntry!1495))))

(declare-fun b!6839 () Bool)

(declare-fun res!7062 () Bool)

(assert (=> b!6839 (=> (not res!7062) (not e!3772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6839 (= res!7062 (validKeyInArray!0 k!1278))))

(declare-fun b!6840 () Bool)

(declare-fun e!3778 () Bool)

(declare-fun mapRes!446 () Bool)

(assert (=> b!6840 (= e!3774 (and e!3778 mapRes!446))))

(declare-fun condMapEmpty!446 () Bool)

(declare-fun mapDefault!446 () ValueCell!142)

