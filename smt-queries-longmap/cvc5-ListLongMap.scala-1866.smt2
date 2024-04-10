; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33630 () Bool)

(assert start!33630)

(declare-fun b_free!6865 () Bool)

(declare-fun b_next!6865 () Bool)

(assert (=> start!33630 (= b_free!6865 (not b_next!6865))))

(declare-fun tp!24098 () Bool)

(declare-fun b_and!14045 () Bool)

(assert (=> start!33630 (= tp!24098 b_and!14045)))

(declare-fun res!183897 () Bool)

(declare-fun e!204939 () Bool)

(assert (=> start!33630 (=> (not res!183897) (not e!204939))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33630 (= res!183897 (validMask!0 mask!2385))))

(assert (=> start!33630 e!204939))

(assert (=> start!33630 true))

(declare-fun tp_is_empty!6817 () Bool)

(assert (=> start!33630 tp_is_empty!6817))

(assert (=> start!33630 tp!24098))

(declare-datatypes ((V!10067 0))(
  ( (V!10068 (val!3453 Int)) )
))
(declare-datatypes ((ValueCell!3065 0))(
  ( (ValueCellFull!3065 (v!5615 V!10067)) (EmptyCell!3065) )
))
(declare-datatypes ((array!17229 0))(
  ( (array!17230 (arr!8145 (Array (_ BitVec 32) ValueCell!3065)) (size!8497 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17229)

(declare-fun e!204937 () Bool)

(declare-fun array_inv!6058 (array!17229) Bool)

(assert (=> start!33630 (and (array_inv!6058 _values!1525) e!204937)))

(declare-datatypes ((array!17231 0))(
  ( (array!17232 (arr!8146 (Array (_ BitVec 32) (_ BitVec 64))) (size!8498 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17231)

(declare-fun array_inv!6059 (array!17231) Bool)

(assert (=> start!33630 (array_inv!6059 _keys!1895)))

(declare-fun b!333777 () Bool)

(declare-fun e!204938 () Bool)

(assert (=> b!333777 (= e!204938 (not true))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17231 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!333777 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3145 0))(
  ( (MissingZero!3145 (index!14759 (_ BitVec 32))) (Found!3145 (index!14760 (_ BitVec 32))) (Intermediate!3145 (undefined!3957 Bool) (index!14761 (_ BitVec 32)) (x!33255 (_ BitVec 32))) (Undefined!3145) (MissingVacant!3145 (index!14762 (_ BitVec 32))) )
))
(declare-fun lt!159402 () SeekEntryResult!3145)

(declare-datatypes ((Unit!10373 0))(
  ( (Unit!10374) )
))
(declare-fun lt!159403 () Unit!10373)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17231 (_ BitVec 64) (_ BitVec 32)) Unit!10373)

(assert (=> b!333777 (= lt!159403 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14760 lt!159402)))))

(declare-fun b!333778 () Bool)

(declare-fun res!183893 () Bool)

(assert (=> b!333778 (=> (not res!183893) (not e!204939))))

(declare-datatypes ((List!4637 0))(
  ( (Nil!4634) (Cons!4633 (h!5489 (_ BitVec 64)) (t!9725 List!4637)) )
))
(declare-fun arrayNoDuplicates!0 (array!17231 (_ BitVec 32) List!4637) Bool)

(assert (=> b!333778 (= res!183893 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4634))))

(declare-fun mapIsEmpty!11622 () Bool)

(declare-fun mapRes!11622 () Bool)

(assert (=> mapIsEmpty!11622 mapRes!11622))

(declare-fun b!333779 () Bool)

(assert (=> b!333779 (= e!204939 e!204938)))

(declare-fun res!183894 () Bool)

(assert (=> b!333779 (=> (not res!183894) (not e!204938))))

(assert (=> b!333779 (= res!183894 (and (is-Found!3145 lt!159402) (= (select (arr!8146 _keys!1895) (index!14760 lt!159402)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17231 (_ BitVec 32)) SeekEntryResult!3145)

(assert (=> b!333779 (= lt!159402 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!333780 () Bool)

(declare-fun e!204935 () Bool)

(assert (=> b!333780 (= e!204937 (and e!204935 mapRes!11622))))

(declare-fun condMapEmpty!11622 () Bool)

(declare-fun mapDefault!11622 () ValueCell!3065)

