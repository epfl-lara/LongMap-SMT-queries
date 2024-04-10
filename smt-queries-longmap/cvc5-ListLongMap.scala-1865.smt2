; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33624 () Bool)

(assert start!33624)

(declare-fun b_free!6859 () Bool)

(declare-fun b_next!6859 () Bool)

(assert (=> start!33624 (= b_free!6859 (not b_next!6859))))

(declare-fun tp!24081 () Bool)

(declare-fun b_and!14039 () Bool)

(assert (=> start!33624 (= tp!24081 b_and!14039)))

(declare-fun b!333692 () Bool)

(declare-fun res!183839 () Bool)

(declare-fun e!204890 () Bool)

(assert (=> b!333692 (=> (not res!183839) (not e!204890))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333692 (= res!183839 (validKeyInArray!0 k!1348))))

(declare-fun b!333693 () Bool)

(declare-fun res!183835 () Bool)

(assert (=> b!333693 (=> (not res!183835) (not e!204890))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10059 0))(
  ( (V!10060 (val!3450 Int)) )
))
(declare-fun zeroValue!1467 () V!10059)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((array!17217 0))(
  ( (array!17218 (arr!8139 (Array (_ BitVec 32) (_ BitVec 64))) (size!8491 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17217)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10059)

(declare-datatypes ((ValueCell!3062 0))(
  ( (ValueCellFull!3062 (v!5612 V!10059)) (EmptyCell!3062) )
))
(declare-datatypes ((array!17219 0))(
  ( (array!17220 (arr!8140 (Array (_ BitVec 32) ValueCell!3062)) (size!8492 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17219)

(declare-datatypes ((tuple2!5014 0))(
  ( (tuple2!5015 (_1!2518 (_ BitVec 64)) (_2!2518 V!10059)) )
))
(declare-datatypes ((List!4633 0))(
  ( (Nil!4630) (Cons!4629 (h!5485 tuple2!5014) (t!9721 List!4633)) )
))
(declare-datatypes ((ListLongMap!3927 0))(
  ( (ListLongMap!3928 (toList!1979 List!4633)) )
))
(declare-fun contains!2023 (ListLongMap!3927 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1507 (array!17217 array!17219 (_ BitVec 32) (_ BitVec 32) V!10059 V!10059 (_ BitVec 32) Int) ListLongMap!3927)

(assert (=> b!333693 (= res!183835 (not (contains!2023 (getCurrentListMap!1507 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!333694 () Bool)

(declare-fun e!204887 () Bool)

(declare-fun tp_is_empty!6811 () Bool)

(assert (=> b!333694 (= e!204887 tp_is_empty!6811)))

(declare-fun b!333695 () Bool)

(declare-fun e!204891 () Bool)

(assert (=> b!333695 (= e!204891 tp_is_empty!6811)))

(declare-fun b!333696 () Bool)

(assert (=> b!333696 (= e!204890 false)))

(declare-datatypes ((SeekEntryResult!3142 0))(
  ( (MissingZero!3142 (index!14747 (_ BitVec 32))) (Found!3142 (index!14748 (_ BitVec 32))) (Intermediate!3142 (undefined!3954 Bool) (index!14749 (_ BitVec 32)) (x!33244 (_ BitVec 32))) (Undefined!3142) (MissingVacant!3142 (index!14750 (_ BitVec 32))) )
))
(declare-fun lt!159391 () SeekEntryResult!3142)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17217 (_ BitVec 32)) SeekEntryResult!3142)

(assert (=> b!333696 (= lt!159391 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!333697 () Bool)

(declare-fun e!204888 () Bool)

(declare-fun mapRes!11613 () Bool)

(assert (=> b!333697 (= e!204888 (and e!204891 mapRes!11613))))

(declare-fun condMapEmpty!11613 () Bool)

(declare-fun mapDefault!11613 () ValueCell!3062)

