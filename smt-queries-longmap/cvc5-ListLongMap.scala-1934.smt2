; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34298 () Bool)

(assert start!34298)

(declare-fun b_free!7273 () Bool)

(declare-fun b_next!7273 () Bool)

(assert (=> start!34298 (= b_free!7273 (not b_next!7273))))

(declare-fun tp!25359 () Bool)

(declare-fun b_and!14477 () Bool)

(assert (=> start!34298 (= tp!25359 b_and!14477)))

(declare-fun res!189126 () Bool)

(declare-fun e!209827 () Bool)

(assert (=> start!34298 (=> (not res!189126) (not e!209827))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34298 (= res!189126 (validMask!0 mask!2385))))

(assert (=> start!34298 e!209827))

(assert (=> start!34298 true))

(declare-fun tp_is_empty!7225 () Bool)

(assert (=> start!34298 tp_is_empty!7225))

(assert (=> start!34298 tp!25359))

(declare-datatypes ((V!10611 0))(
  ( (V!10612 (val!3657 Int)) )
))
(declare-datatypes ((ValueCell!3269 0))(
  ( (ValueCellFull!3269 (v!5831 V!10611)) (EmptyCell!3269) )
))
(declare-datatypes ((array!18047 0))(
  ( (array!18048 (arr!8542 (Array (_ BitVec 32) ValueCell!3269)) (size!8894 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!18047)

(declare-fun e!209831 () Bool)

(declare-fun array_inv!6324 (array!18047) Bool)

(assert (=> start!34298 (and (array_inv!6324 _values!1525) e!209831)))

(declare-datatypes ((array!18049 0))(
  ( (array!18050 (arr!8543 (Array (_ BitVec 32) (_ BitVec 64))) (size!8895 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!18049)

(declare-fun array_inv!6325 (array!18049) Bool)

(assert (=> start!34298 (array_inv!6325 _keys!1895)))

(declare-fun b!342155 () Bool)

(declare-fun res!189122 () Bool)

(assert (=> b!342155 (=> (not res!189122) (not e!209827))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10611)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10611)

(declare-datatypes ((tuple2!5300 0))(
  ( (tuple2!5301 (_1!2661 (_ BitVec 64)) (_2!2661 V!10611)) )
))
(declare-datatypes ((List!4917 0))(
  ( (Nil!4914) (Cons!4913 (h!5769 tuple2!5300) (t!10029 List!4917)) )
))
(declare-datatypes ((ListLongMap!4213 0))(
  ( (ListLongMap!4214 (toList!2122 List!4917)) )
))
(declare-fun contains!2178 (ListLongMap!4213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1643 (array!18049 array!18047 (_ BitVec 32) (_ BitVec 32) V!10611 V!10611 (_ BitVec 32) Int) ListLongMap!4213)

(assert (=> b!342155 (= res!189122 (not (contains!2178 (getCurrentListMap!1643 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!342156 () Bool)

(declare-fun res!189127 () Bool)

(assert (=> b!342156 (=> (not res!189127) (not e!209827))))

(assert (=> b!342156 (= res!189127 (and (= (size!8894 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8895 _keys!1895) (size!8894 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!342157 () Bool)

(declare-datatypes ((Unit!10634 0))(
  ( (Unit!10635) )
))
(declare-fun e!209829 () Unit!10634)

(declare-fun Unit!10636 () Unit!10634)

(assert (=> b!342157 (= e!209829 Unit!10636)))

(declare-fun lt!162078 () Unit!10634)

(declare-fun lemmaArrayContainsKeyThenInListMap!296 (array!18049 array!18047 (_ BitVec 32) (_ BitVec 32) V!10611 V!10611 (_ BitVec 64) (_ BitVec 32) Int) Unit!10634)

(declare-fun arrayScanForKey!0 (array!18049 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!342157 (= lt!162078 (lemmaArrayContainsKeyThenInListMap!296 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!342157 false))

(declare-fun b!342158 () Bool)

(declare-fun e!209832 () Bool)

(assert (=> b!342158 (= e!209832 tp_is_empty!7225)))

(declare-fun b!342159 () Bool)

(declare-fun res!189123 () Bool)

(assert (=> b!342159 (=> (not res!189123) (not e!209827))))

(declare-datatypes ((List!4918 0))(
  ( (Nil!4915) (Cons!4914 (h!5770 (_ BitVec 64)) (t!10030 List!4918)) )
))
(declare-fun arrayNoDuplicates!0 (array!18049 (_ BitVec 32) List!4918) Bool)

(assert (=> b!342159 (= res!189123 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4915))))

(declare-fun b!342160 () Bool)

(declare-fun Unit!10637 () Unit!10634)

(assert (=> b!342160 (= e!209829 Unit!10637)))

(declare-fun b!342161 () Bool)

(declare-fun e!209826 () Bool)

(assert (=> b!342161 (= e!209826 false)))

(declare-fun lt!162077 () Unit!10634)

(assert (=> b!342161 (= lt!162077 e!209829)))

(declare-fun c!52791 () Bool)

(declare-fun arrayContainsKey!0 (array!18049 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!342161 (= c!52791 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!342162 () Bool)

(declare-fun e!209830 () Bool)

(assert (=> b!342162 (= e!209830 tp_is_empty!7225)))

(declare-fun b!342163 () Bool)

(declare-fun res!189125 () Bool)

(assert (=> b!342163 (=> (not res!189125) (not e!209827))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!342163 (= res!189125 (validKeyInArray!0 k!1348))))

(declare-fun b!342164 () Bool)

(declare-fun res!189124 () Bool)

(assert (=> b!342164 (=> (not res!189124) (not e!209827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!18049 (_ BitVec 32)) Bool)

(assert (=> b!342164 (= res!189124 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!342165 () Bool)

(declare-fun mapRes!12270 () Bool)

(assert (=> b!342165 (= e!209831 (and e!209830 mapRes!12270))))

(declare-fun condMapEmpty!12270 () Bool)

(declare-fun mapDefault!12270 () ValueCell!3269)

