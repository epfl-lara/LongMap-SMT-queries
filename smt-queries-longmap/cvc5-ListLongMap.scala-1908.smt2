; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33986 () Bool)

(assert start!33986)

(declare-fun b_free!7117 () Bool)

(declare-fun b_next!7117 () Bool)

(assert (=> start!33986 (= b_free!7117 (not b_next!7117))))

(declare-fun tp!24869 () Bool)

(declare-fun b_and!14307 () Bool)

(assert (=> start!33986 (= tp!24869 b_and!14307)))

(declare-fun mapNonEmpty!12015 () Bool)

(declare-fun mapRes!12015 () Bool)

(declare-fun tp!24870 () Bool)

(declare-fun e!207742 () Bool)

(assert (=> mapNonEmpty!12015 (= mapRes!12015 (and tp!24870 e!207742))))

(declare-datatypes ((V!10403 0))(
  ( (V!10404 (val!3579 Int)) )
))
(declare-datatypes ((ValueCell!3191 0))(
  ( (ValueCellFull!3191 (v!5746 V!10403)) (EmptyCell!3191) )
))
(declare-fun mapValue!12015 () ValueCell!3191)

(declare-fun mapRest!12015 () (Array (_ BitVec 32) ValueCell!3191))

(declare-datatypes ((array!17733 0))(
  ( (array!17734 (arr!8392 (Array (_ BitVec 32) ValueCell!3191)) (size!8744 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17733)

(declare-fun mapKey!12015 () (_ BitVec 32))

(assert (=> mapNonEmpty!12015 (= (arr!8392 _values!1525) (store mapRest!12015 mapKey!12015 mapValue!12015))))

(declare-fun b!338584 () Bool)

(declare-fun res!187031 () Bool)

(declare-fun e!207746 () Bool)

(assert (=> b!338584 (=> (not res!187031) (not e!207746))))

(declare-datatypes ((array!17735 0))(
  ( (array!17736 (arr!8393 (Array (_ BitVec 32) (_ BitVec 64))) (size!8745 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17735)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17735 (_ BitVec 32)) Bool)

(assert (=> b!338584 (= res!187031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338585 () Bool)

(declare-fun res!187035 () Bool)

(assert (=> b!338585 (=> (not res!187035) (not e!207746))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!338585 (= res!187035 (and (= (size!8744 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8745 _keys!1895) (size!8744 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338586 () Bool)

(declare-fun res!187032 () Bool)

(assert (=> b!338586 (=> (not res!187032) (not e!207746))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338586 (= res!187032 (validKeyInArray!0 k!1348))))

(declare-fun b!338587 () Bool)

(declare-fun res!187036 () Bool)

(assert (=> b!338587 (=> (not res!187036) (not e!207746))))

(declare-fun zeroValue!1467 () V!10403)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10403)

(declare-datatypes ((tuple2!5198 0))(
  ( (tuple2!5199 (_1!2610 (_ BitVec 64)) (_2!2610 V!10403)) )
))
(declare-datatypes ((List!4813 0))(
  ( (Nil!4810) (Cons!4809 (h!5665 tuple2!5198) (t!9911 List!4813)) )
))
(declare-datatypes ((ListLongMap!4111 0))(
  ( (ListLongMap!4112 (toList!2071 List!4813)) )
))
(declare-fun contains!2120 (ListLongMap!4111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1592 (array!17735 array!17733 (_ BitVec 32) (_ BitVec 32) V!10403 V!10403 (_ BitVec 32) Int) ListLongMap!4111)

(assert (=> b!338587 (= res!187036 (not (contains!2120 (getCurrentListMap!1592 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun res!187033 () Bool)

(assert (=> start!33986 (=> (not res!187033) (not e!207746))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33986 (= res!187033 (validMask!0 mask!2385))))

(assert (=> start!33986 e!207746))

(assert (=> start!33986 true))

(declare-fun tp_is_empty!7069 () Bool)

(assert (=> start!33986 tp_is_empty!7069))

(assert (=> start!33986 tp!24869))

(declare-fun e!207745 () Bool)

(declare-fun array_inv!6224 (array!17733) Bool)

(assert (=> start!33986 (and (array_inv!6224 _values!1525) e!207745)))

(declare-fun array_inv!6225 (array!17735) Bool)

(assert (=> start!33986 (array_inv!6225 _keys!1895)))

(declare-fun b!338588 () Bool)

(assert (=> b!338588 (= e!207742 tp_is_empty!7069)))

(declare-fun b!338589 () Bool)

(declare-fun e!207747 () Bool)

(assert (=> b!338589 (= e!207747 false)))

(declare-datatypes ((Unit!10522 0))(
  ( (Unit!10523) )
))
(declare-fun lt!160850 () Unit!10522)

(declare-fun e!207741 () Unit!10522)

(assert (=> b!338589 (= lt!160850 e!207741)))

(declare-fun c!52437 () Bool)

(declare-fun arrayContainsKey!0 (array!17735 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338589 (= c!52437 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!338590 () Bool)

(assert (=> b!338590 (= e!207746 e!207747)))

(declare-fun res!187034 () Bool)

(assert (=> b!338590 (=> (not res!187034) (not e!207747))))

(declare-datatypes ((SeekEntryResult!3241 0))(
  ( (MissingZero!3241 (index!15143 (_ BitVec 32))) (Found!3241 (index!15144 (_ BitVec 32))) (Intermediate!3241 (undefined!4053 Bool) (index!15145 (_ BitVec 32)) (x!33737 (_ BitVec 32))) (Undefined!3241) (MissingVacant!3241 (index!15146 (_ BitVec 32))) )
))
(declare-fun lt!160851 () SeekEntryResult!3241)

(assert (=> b!338590 (= res!187034 (and (not (is-Found!3241 lt!160851)) (is-MissingZero!3241 lt!160851)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17735 (_ BitVec 32)) SeekEntryResult!3241)

(assert (=> b!338590 (= lt!160851 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!338591 () Bool)

(declare-fun Unit!10524 () Unit!10522)

(assert (=> b!338591 (= e!207741 Unit!10524)))

(declare-fun b!338592 () Bool)

(declare-fun res!187037 () Bool)

(assert (=> b!338592 (=> (not res!187037) (not e!207746))))

(declare-datatypes ((List!4814 0))(
  ( (Nil!4811) (Cons!4810 (h!5666 (_ BitVec 64)) (t!9912 List!4814)) )
))
(declare-fun arrayNoDuplicates!0 (array!17735 (_ BitVec 32) List!4814) Bool)

(assert (=> b!338592 (= res!187037 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4811))))

(declare-fun b!338593 () Bool)

(declare-fun e!207743 () Bool)

(assert (=> b!338593 (= e!207743 tp_is_empty!7069)))

(declare-fun b!338594 () Bool)

(assert (=> b!338594 (= e!207745 (and e!207743 mapRes!12015))))

(declare-fun condMapEmpty!12015 () Bool)

(declare-fun mapDefault!12015 () ValueCell!3191)

