; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33848 () Bool)

(assert start!33848)

(declare-fun b_free!7027 () Bool)

(declare-fun b_next!7027 () Bool)

(assert (=> start!33848 (= b_free!7027 (not b_next!7027))))

(declare-fun tp!24593 () Bool)

(declare-fun b_and!14213 () Bool)

(assert (=> start!33848 (= tp!24593 b_and!14213)))

(declare-fun b!336765 () Bool)

(declare-fun res!185912 () Bool)

(declare-fun e!206698 () Bool)

(assert (=> b!336765 (=> (not res!185912) (not e!206698))))

(declare-datatypes ((array!17555 0))(
  ( (array!17556 (arr!8305 (Array (_ BitVec 32) (_ BitVec 64))) (size!8657 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17555)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17555 (_ BitVec 32)) Bool)

(assert (=> b!336765 (= res!185912 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11874 () Bool)

(declare-fun mapRes!11874 () Bool)

(declare-fun tp!24594 () Bool)

(declare-fun e!206697 () Bool)

(assert (=> mapNonEmpty!11874 (= mapRes!11874 (and tp!24594 e!206697))))

(declare-datatypes ((V!10283 0))(
  ( (V!10284 (val!3534 Int)) )
))
(declare-datatypes ((ValueCell!3146 0))(
  ( (ValueCellFull!3146 (v!5699 V!10283)) (EmptyCell!3146) )
))
(declare-fun mapValue!11874 () ValueCell!3146)

(declare-fun mapKey!11874 () (_ BitVec 32))

(declare-fun mapRest!11874 () (Array (_ BitVec 32) ValueCell!3146))

(declare-datatypes ((array!17557 0))(
  ( (array!17558 (arr!8306 (Array (_ BitVec 32) ValueCell!3146)) (size!8658 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17557)

(assert (=> mapNonEmpty!11874 (= (arr!8306 _values!1525) (store mapRest!11874 mapKey!11874 mapValue!11874))))

(declare-fun b!336766 () Bool)

(declare-fun res!185906 () Bool)

(assert (=> b!336766 (=> (not res!185906) (not e!206698))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336766 (= res!185906 (and (= (size!8658 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8657 _keys!1895) (size!8658 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!336767 () Bool)

(declare-fun res!185910 () Bool)

(assert (=> b!336767 (=> (not res!185910) (not e!206698))))

(declare-datatypes ((List!4748 0))(
  ( (Nil!4745) (Cons!4744 (h!5600 (_ BitVec 64)) (t!9842 List!4748)) )
))
(declare-fun arrayNoDuplicates!0 (array!17555 (_ BitVec 32) List!4748) Bool)

(assert (=> b!336767 (= res!185910 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4745))))

(declare-fun b!336768 () Bool)

(declare-fun e!206700 () Bool)

(declare-fun tp_is_empty!6979 () Bool)

(assert (=> b!336768 (= e!206700 tp_is_empty!6979)))

(declare-fun b!336769 () Bool)

(declare-fun e!206695 () Bool)

(assert (=> b!336769 (= e!206695 false)))

(declare-fun lt!160311 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17555 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336769 (= lt!160311 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!336770 () Bool)

(assert (=> b!336770 (= e!206697 tp_is_empty!6979)))

(declare-fun mapIsEmpty!11874 () Bool)

(assert (=> mapIsEmpty!11874 mapRes!11874))

(declare-fun b!336771 () Bool)

(declare-fun res!185911 () Bool)

(assert (=> b!336771 (=> (not res!185911) (not e!206698))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336771 (= res!185911 (validKeyInArray!0 k!1348))))

(declare-fun b!336772 () Bool)

(declare-fun res!185905 () Bool)

(assert (=> b!336772 (=> (not res!185905) (not e!206698))))

(declare-fun zeroValue!1467 () V!10283)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10283)

(declare-datatypes ((tuple2!5132 0))(
  ( (tuple2!5133 (_1!2577 (_ BitVec 64)) (_2!2577 V!10283)) )
))
(declare-datatypes ((List!4749 0))(
  ( (Nil!4746) (Cons!4745 (h!5601 tuple2!5132) (t!9843 List!4749)) )
))
(declare-datatypes ((ListLongMap!4045 0))(
  ( (ListLongMap!4046 (toList!2038 List!4749)) )
))
(declare-fun contains!2085 (ListLongMap!4045 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1559 (array!17555 array!17557 (_ BitVec 32) (_ BitVec 32) V!10283 V!10283 (_ BitVec 32) Int) ListLongMap!4045)

(assert (=> b!336772 (= res!185905 (not (contains!2085 (getCurrentListMap!1559 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!185909 () Bool)

(assert (=> start!33848 (=> (not res!185909) (not e!206698))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33848 (= res!185909 (validMask!0 mask!2385))))

(assert (=> start!33848 e!206698))

(assert (=> start!33848 true))

(assert (=> start!33848 tp_is_empty!6979))

(assert (=> start!33848 tp!24593))

(declare-fun e!206699 () Bool)

(declare-fun array_inv!6164 (array!17557) Bool)

(assert (=> start!33848 (and (array_inv!6164 _values!1525) e!206699)))

(declare-fun array_inv!6165 (array!17555) Bool)

(assert (=> start!33848 (array_inv!6165 _keys!1895)))

(declare-fun b!336773 () Bool)

(assert (=> b!336773 (= e!206698 e!206695)))

(declare-fun res!185907 () Bool)

(assert (=> b!336773 (=> (not res!185907) (not e!206695))))

(declare-datatypes ((SeekEntryResult!3209 0))(
  ( (MissingZero!3209 (index!15015 (_ BitVec 32))) (Found!3209 (index!15016 (_ BitVec 32))) (Intermediate!3209 (undefined!4021 Bool) (index!15017 (_ BitVec 32)) (x!33565 (_ BitVec 32))) (Undefined!3209) (MissingVacant!3209 (index!15018 (_ BitVec 32))) )
))
(declare-fun lt!160312 () SeekEntryResult!3209)

(assert (=> b!336773 (= res!185907 (and (not (is-Found!3209 lt!160312)) (is-MissingZero!3209 lt!160312)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17555 (_ BitVec 32)) SeekEntryResult!3209)

(assert (=> b!336773 (= lt!160312 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!336774 () Bool)

(declare-fun res!185908 () Bool)

(assert (=> b!336774 (=> (not res!185908) (not e!206695))))

(declare-fun arrayContainsKey!0 (array!17555 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336774 (= res!185908 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!336775 () Bool)

(assert (=> b!336775 (= e!206699 (and e!206700 mapRes!11874))))

(declare-fun condMapEmpty!11874 () Bool)

(declare-fun mapDefault!11874 () ValueCell!3146)

