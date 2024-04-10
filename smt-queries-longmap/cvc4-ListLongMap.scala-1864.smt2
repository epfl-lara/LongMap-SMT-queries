; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33622 () Bool)

(assert start!33622)

(declare-fun b_free!6857 () Bool)

(declare-fun b_next!6857 () Bool)

(assert (=> start!33622 (= b_free!6857 (not b_next!6857))))

(declare-fun tp!24075 () Bool)

(declare-fun b_and!14037 () Bool)

(assert (=> start!33622 (= tp!24075 b_and!14037)))

(declare-fun b!333665 () Bool)

(declare-fun res!183819 () Bool)

(declare-fun e!204875 () Bool)

(assert (=> b!333665 (=> (not res!183819) (not e!204875))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10055 0))(
  ( (V!10056 (val!3449 Int)) )
))
(declare-datatypes ((ValueCell!3061 0))(
  ( (ValueCellFull!3061 (v!5611 V!10055)) (EmptyCell!3061) )
))
(declare-datatypes ((array!17213 0))(
  ( (array!17214 (arr!8137 (Array (_ BitVec 32) ValueCell!3061)) (size!8489 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17213)

(declare-datatypes ((array!17215 0))(
  ( (array!17216 (arr!8138 (Array (_ BitVec 32) (_ BitVec 64))) (size!8490 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17215)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333665 (= res!183819 (and (= (size!8489 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8490 _keys!1895) (size!8489 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333666 () Bool)

(declare-fun res!183817 () Bool)

(assert (=> b!333666 (=> (not res!183817) (not e!204875))))

(declare-datatypes ((List!4631 0))(
  ( (Nil!4628) (Cons!4627 (h!5483 (_ BitVec 64)) (t!9719 List!4631)) )
))
(declare-fun arrayNoDuplicates!0 (array!17215 (_ BitVec 32) List!4631) Bool)

(assert (=> b!333666 (= res!183817 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4628))))

(declare-fun mapNonEmpty!11610 () Bool)

(declare-fun mapRes!11610 () Bool)

(declare-fun tp!24074 () Bool)

(declare-fun e!204873 () Bool)

(assert (=> mapNonEmpty!11610 (= mapRes!11610 (and tp!24074 e!204873))))

(declare-fun mapKey!11610 () (_ BitVec 32))

(declare-fun mapValue!11610 () ValueCell!3061)

(declare-fun mapRest!11610 () (Array (_ BitVec 32) ValueCell!3061))

(assert (=> mapNonEmpty!11610 (= (arr!8137 _values!1525) (store mapRest!11610 mapKey!11610 mapValue!11610))))

(declare-fun b!333667 () Bool)

(declare-fun res!183816 () Bool)

(assert (=> b!333667 (=> (not res!183816) (not e!204875))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun zeroValue!1467 () V!10055)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10055)

(declare-datatypes ((tuple2!5012 0))(
  ( (tuple2!5013 (_1!2517 (_ BitVec 64)) (_2!2517 V!10055)) )
))
(declare-datatypes ((List!4632 0))(
  ( (Nil!4629) (Cons!4628 (h!5484 tuple2!5012) (t!9720 List!4632)) )
))
(declare-datatypes ((ListLongMap!3925 0))(
  ( (ListLongMap!3926 (toList!1978 List!4632)) )
))
(declare-fun contains!2022 (ListLongMap!3925 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1506 (array!17215 array!17213 (_ BitVec 32) (_ BitVec 32) V!10055 V!10055 (_ BitVec 32) Int) ListLongMap!3925)

(assert (=> b!333667 (= res!183816 (not (contains!2022 (getCurrentListMap!1506 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!183818 () Bool)

(assert (=> start!33622 (=> (not res!183818) (not e!204875))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33622 (= res!183818 (validMask!0 mask!2385))))

(assert (=> start!33622 e!204875))

(assert (=> start!33622 true))

(declare-fun tp_is_empty!6809 () Bool)

(assert (=> start!33622 tp_is_empty!6809))

(assert (=> start!33622 tp!24075))

(declare-fun e!204874 () Bool)

(declare-fun array_inv!6052 (array!17213) Bool)

(assert (=> start!33622 (and (array_inv!6052 _values!1525) e!204874)))

(declare-fun array_inv!6053 (array!17215) Bool)

(assert (=> start!33622 (array_inv!6053 _keys!1895)))

(declare-fun b!333668 () Bool)

(declare-fun e!204872 () Bool)

(assert (=> b!333668 (= e!204872 tp_is_empty!6809)))

(declare-fun b!333669 () Bool)

(assert (=> b!333669 (= e!204875 false)))

(declare-datatypes ((SeekEntryResult!3141 0))(
  ( (MissingZero!3141 (index!14743 (_ BitVec 32))) (Found!3141 (index!14744 (_ BitVec 32))) (Intermediate!3141 (undefined!3953 Bool) (index!14745 (_ BitVec 32)) (x!33235 (_ BitVec 32))) (Undefined!3141) (MissingVacant!3141 (index!14746 (_ BitVec 32))) )
))
(declare-fun lt!159388 () SeekEntryResult!3141)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17215 (_ BitVec 32)) SeekEntryResult!3141)

(assert (=> b!333669 (= lt!159388 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11610 () Bool)

(assert (=> mapIsEmpty!11610 mapRes!11610))

(declare-fun b!333670 () Bool)

(declare-fun res!183821 () Bool)

(assert (=> b!333670 (=> (not res!183821) (not e!204875))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333670 (= res!183821 (validKeyInArray!0 k!1348))))

(declare-fun b!333671 () Bool)

(assert (=> b!333671 (= e!204874 (and e!204872 mapRes!11610))))

(declare-fun condMapEmpty!11610 () Bool)

(declare-fun mapDefault!11610 () ValueCell!3061)

