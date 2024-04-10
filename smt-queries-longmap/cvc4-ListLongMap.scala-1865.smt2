; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33628 () Bool)

(assert start!33628)

(declare-fun b_free!6863 () Bool)

(declare-fun b_next!6863 () Bool)

(assert (=> start!33628 (= b_free!6863 (not b_next!6863))))

(declare-fun tp!24093 () Bool)

(declare-fun b_and!14043 () Bool)

(assert (=> start!33628 (= tp!24093 b_and!14043)))

(declare-fun mapIsEmpty!11619 () Bool)

(declare-fun mapRes!11619 () Bool)

(assert (=> mapIsEmpty!11619 mapRes!11619))

(declare-fun b!333746 () Bool)

(declare-fun e!204921 () Bool)

(assert (=> b!333746 (= e!204921 false)))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((array!17225 0))(
  ( (array!17226 (arr!8143 (Array (_ BitVec 32) (_ BitVec 64))) (size!8495 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17225)

(declare-datatypes ((SeekEntryResult!3144 0))(
  ( (MissingZero!3144 (index!14755 (_ BitVec 32))) (Found!3144 (index!14756 (_ BitVec 32))) (Intermediate!3144 (undefined!3956 Bool) (index!14757 (_ BitVec 32)) (x!33246 (_ BitVec 32))) (Undefined!3144) (MissingVacant!3144 (index!14758 (_ BitVec 32))) )
))
(declare-fun lt!159397 () SeekEntryResult!3144)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17225 (_ BitVec 32)) SeekEntryResult!3144)

(assert (=> b!333746 (= lt!159397 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!333747 () Bool)

(declare-fun res!183872 () Bool)

(assert (=> b!333747 (=> (not res!183872) (not e!204921))))

(declare-datatypes ((V!10063 0))(
  ( (V!10064 (val!3452 Int)) )
))
(declare-datatypes ((ValueCell!3064 0))(
  ( (ValueCellFull!3064 (v!5614 V!10063)) (EmptyCell!3064) )
))
(declare-datatypes ((array!17227 0))(
  ( (array!17228 (arr!8144 (Array (_ BitVec 32) ValueCell!3064)) (size!8496 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17227)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!333747 (= res!183872 (and (= (size!8496 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8495 _keys!1895) (size!8496 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!333749 () Bool)

(declare-fun e!204918 () Bool)

(declare-fun tp_is_empty!6815 () Bool)

(assert (=> b!333749 (= e!204918 tp_is_empty!6815)))

(declare-fun mapNonEmpty!11619 () Bool)

(declare-fun tp!24092 () Bool)

(assert (=> mapNonEmpty!11619 (= mapRes!11619 (and tp!24092 e!204918))))

(declare-fun mapValue!11619 () ValueCell!3064)

(declare-fun mapKey!11619 () (_ BitVec 32))

(declare-fun mapRest!11619 () (Array (_ BitVec 32) ValueCell!3064))

(assert (=> mapNonEmpty!11619 (= (arr!8144 _values!1525) (store mapRest!11619 mapKey!11619 mapValue!11619))))

(declare-fun b!333750 () Bool)

(declare-fun res!183873 () Bool)

(assert (=> b!333750 (=> (not res!183873) (not e!204921))))

(declare-datatypes ((List!4636 0))(
  ( (Nil!4633) (Cons!4632 (h!5488 (_ BitVec 64)) (t!9724 List!4636)) )
))
(declare-fun arrayNoDuplicates!0 (array!17225 (_ BitVec 32) List!4636) Bool)

(assert (=> b!333750 (= res!183873 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4633))))

(declare-fun b!333751 () Bool)

(declare-fun res!183870 () Bool)

(assert (=> b!333751 (=> (not res!183870) (not e!204921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!333751 (= res!183870 (validKeyInArray!0 k!1348))))

(declare-fun b!333752 () Bool)

(declare-fun e!204919 () Bool)

(assert (=> b!333752 (= e!204919 tp_is_empty!6815)))

(declare-fun b!333748 () Bool)

(declare-fun res!183874 () Bool)

(assert (=> b!333748 (=> (not res!183874) (not e!204921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17225 (_ BitVec 32)) Bool)

(assert (=> b!333748 (= res!183874 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!183875 () Bool)

(assert (=> start!33628 (=> (not res!183875) (not e!204921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33628 (= res!183875 (validMask!0 mask!2385))))

(assert (=> start!33628 e!204921))

(assert (=> start!33628 true))

(assert (=> start!33628 tp_is_empty!6815))

(assert (=> start!33628 tp!24093))

(declare-fun e!204917 () Bool)

(declare-fun array_inv!6056 (array!17227) Bool)

(assert (=> start!33628 (and (array_inv!6056 _values!1525) e!204917)))

(declare-fun array_inv!6057 (array!17225) Bool)

(assert (=> start!33628 (array_inv!6057 _keys!1895)))

(declare-fun b!333753 () Bool)

(assert (=> b!333753 (= e!204917 (and e!204919 mapRes!11619))))

(declare-fun condMapEmpty!11619 () Bool)

(declare-fun mapDefault!11619 () ValueCell!3064)

