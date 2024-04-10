; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33646 () Bool)

(assert start!33646)

(declare-fun b_free!6881 () Bool)

(declare-fun b_next!6881 () Bool)

(assert (=> start!33646 (= b_free!6881 (not b_next!6881))))

(declare-fun tp!24147 () Bool)

(declare-fun b_and!14061 () Bool)

(assert (=> start!33646 (= tp!24147 b_and!14061)))

(declare-fun b!334041 () Bool)

(declare-fun e!205078 () Bool)

(assert (=> b!334041 (= e!205078 (not true))))

(declare-datatypes ((array!17259 0))(
  ( (array!17260 (arr!8160 (Array (_ BitVec 32) (_ BitVec 64))) (size!8512 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17259)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17259 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334041 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3152 0))(
  ( (MissingZero!3152 (index!14787 (_ BitVec 32))) (Found!3152 (index!14788 (_ BitVec 32))) (Intermediate!3152 (undefined!3964 Bool) (index!14789 (_ BitVec 32)) (x!33278 (_ BitVec 32))) (Undefined!3152) (MissingVacant!3152 (index!14790 (_ BitVec 32))) )
))
(declare-fun lt!159450 () SeekEntryResult!3152)

(declare-datatypes ((Unit!10385 0))(
  ( (Unit!10386) )
))
(declare-fun lt!159451 () Unit!10385)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17259 (_ BitVec 64) (_ BitVec 32)) Unit!10385)

(assert (=> b!334041 (= lt!159451 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14788 lt!159450)))))

(declare-fun b!334042 () Bool)

(declare-fun e!205080 () Bool)

(declare-fun tp_is_empty!6833 () Bool)

(assert (=> b!334042 (= e!205080 tp_is_empty!6833)))

(declare-fun b!334043 () Bool)

(declare-fun res!184086 () Bool)

(declare-fun e!205079 () Bool)

(assert (=> b!334043 (=> (not res!184086) (not e!205079))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10087 0))(
  ( (V!10088 (val!3461 Int)) )
))
(declare-datatypes ((ValueCell!3073 0))(
  ( (ValueCellFull!3073 (v!5623 V!10087)) (EmptyCell!3073) )
))
(declare-datatypes ((array!17261 0))(
  ( (array!17262 (arr!8161 (Array (_ BitVec 32) ValueCell!3073)) (size!8513 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17261)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334043 (= res!184086 (and (= (size!8513 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8512 _keys!1895) (size!8513 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334044 () Bool)

(assert (=> b!334044 (= e!205079 e!205078)))

(declare-fun res!184088 () Bool)

(assert (=> b!334044 (=> (not res!184088) (not e!205078))))

(assert (=> b!334044 (= res!184088 (and (is-Found!3152 lt!159450) (= (select (arr!8160 _keys!1895) (index!14788 lt!159450)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17259 (_ BitVec 32)) SeekEntryResult!3152)

(assert (=> b!334044 (= lt!159450 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!334045 () Bool)

(declare-fun res!184090 () Bool)

(assert (=> b!334045 (=> (not res!184090) (not e!205079))))

(declare-datatypes ((List!4649 0))(
  ( (Nil!4646) (Cons!4645 (h!5501 (_ BitVec 64)) (t!9737 List!4649)) )
))
(declare-fun arrayNoDuplicates!0 (array!17259 (_ BitVec 32) List!4649) Bool)

(assert (=> b!334045 (= res!184090 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4646))))

(declare-fun b!334046 () Bool)

(declare-fun e!205081 () Bool)

(declare-fun e!205082 () Bool)

(declare-fun mapRes!11646 () Bool)

(assert (=> b!334046 (= e!205081 (and e!205082 mapRes!11646))))

(declare-fun condMapEmpty!11646 () Bool)

(declare-fun mapDefault!11646 () ValueCell!3073)

