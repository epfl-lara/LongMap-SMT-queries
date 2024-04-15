; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33852 () Bool)

(assert start!33852)

(declare-fun b_free!7045 () Bool)

(declare-fun b_next!7045 () Bool)

(assert (=> start!33852 (= b_free!7045 (not b_next!7045))))

(declare-fun tp!24647 () Bool)

(declare-fun b_and!14205 () Bool)

(assert (=> start!33852 (= tp!24647 b_and!14205)))

(declare-fun b!336787 () Bool)

(declare-fun res!185992 () Bool)

(declare-fun e!206684 () Bool)

(assert (=> b!336787 (=> (not res!185992) (not e!206684))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10307 0))(
  ( (V!10308 (val!3543 Int)) )
))
(declare-datatypes ((ValueCell!3155 0))(
  ( (ValueCellFull!3155 (v!5702 V!10307)) (EmptyCell!3155) )
))
(declare-datatypes ((array!17569 0))(
  ( (array!17570 (arr!8312 (Array (_ BitVec 32) ValueCell!3155)) (size!8665 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17569)

(declare-datatypes ((array!17571 0))(
  ( (array!17572 (arr!8313 (Array (_ BitVec 32) (_ BitVec 64))) (size!8666 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17571)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!336787 (= res!185992 (and (= (size!8665 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8666 _keys!1895) (size!8665 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!11901 () Bool)

(declare-fun mapRes!11901 () Bool)

(assert (=> mapIsEmpty!11901 mapRes!11901))

(declare-fun b!336788 () Bool)

(declare-fun e!206683 () Bool)

(assert (=> b!336788 (= e!206684 e!206683)))

(declare-fun res!185998 () Bool)

(assert (=> b!336788 (=> (not res!185998) (not e!206683))))

(declare-datatypes ((SeekEntryResult!3213 0))(
  ( (MissingZero!3213 (index!15031 (_ BitVec 32))) (Found!3213 (index!15032 (_ BitVec 32))) (Intermediate!3213 (undefined!4025 Bool) (index!15033 (_ BitVec 32)) (x!33588 (_ BitVec 32))) (Undefined!3213) (MissingVacant!3213 (index!15034 (_ BitVec 32))) )
))
(declare-fun lt!160130 () SeekEntryResult!3213)

(get-info :version)

(assert (=> b!336788 (= res!185998 (and (not ((_ is Found!3213) lt!160130)) ((_ is MissingZero!3213) lt!160130)))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17571 (_ BitVec 32)) SeekEntryResult!3213)

(assert (=> b!336788 (= lt!160130 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!185994 () Bool)

(assert (=> start!33852 (=> (not res!185994) (not e!206684))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33852 (= res!185994 (validMask!0 mask!2385))))

(assert (=> start!33852 e!206684))

(assert (=> start!33852 true))

(declare-fun tp_is_empty!6997 () Bool)

(assert (=> start!33852 tp_is_empty!6997))

(assert (=> start!33852 tp!24647))

(declare-fun e!206686 () Bool)

(declare-fun array_inv!6202 (array!17569) Bool)

(assert (=> start!33852 (and (array_inv!6202 _values!1525) e!206686)))

(declare-fun array_inv!6203 (array!17571) Bool)

(assert (=> start!33852 (array_inv!6203 _keys!1895)))

(declare-fun b!336789 () Bool)

(declare-fun e!206685 () Bool)

(assert (=> b!336789 (= e!206686 (and e!206685 mapRes!11901))))

(declare-fun condMapEmpty!11901 () Bool)

(declare-fun mapDefault!11901 () ValueCell!3155)

(assert (=> b!336789 (= condMapEmpty!11901 (= (arr!8312 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3155)) mapDefault!11901)))))

(declare-fun b!336790 () Bool)

(declare-fun res!185993 () Bool)

(assert (=> b!336790 (=> (not res!185993) (not e!206684))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17571 (_ BitVec 32)) Bool)

(assert (=> b!336790 (= res!185993 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!336791 () Bool)

(assert (=> b!336791 (= e!206683 false)))

(declare-fun lt!160131 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17571 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!336791 (= lt!160131 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!11901 () Bool)

(declare-fun tp!24648 () Bool)

(declare-fun e!206682 () Bool)

(assert (=> mapNonEmpty!11901 (= mapRes!11901 (and tp!24648 e!206682))))

(declare-fun mapValue!11901 () ValueCell!3155)

(declare-fun mapKey!11901 () (_ BitVec 32))

(declare-fun mapRest!11901 () (Array (_ BitVec 32) ValueCell!3155))

(assert (=> mapNonEmpty!11901 (= (arr!8312 _values!1525) (store mapRest!11901 mapKey!11901 mapValue!11901))))

(declare-fun b!336792 () Bool)

(assert (=> b!336792 (= e!206682 tp_is_empty!6997)))

(declare-fun b!336793 () Bool)

(declare-fun res!185995 () Bool)

(assert (=> b!336793 (=> (not res!185995) (not e!206684))))

(declare-datatypes ((List!4728 0))(
  ( (Nil!4725) (Cons!4724 (h!5580 (_ BitVec 64)) (t!9813 List!4728)) )
))
(declare-fun arrayNoDuplicates!0 (array!17571 (_ BitVec 32) List!4728) Bool)

(assert (=> b!336793 (= res!185995 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4725))))

(declare-fun b!336794 () Bool)

(declare-fun res!185996 () Bool)

(assert (=> b!336794 (=> (not res!185996) (not e!206683))))

(declare-fun arrayContainsKey!0 (array!17571 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!336794 (= res!185996 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!336795 () Bool)

(declare-fun res!185999 () Bool)

(assert (=> b!336795 (=> (not res!185999) (not e!206684))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!336795 (= res!185999 (validKeyInArray!0 k0!1348))))

(declare-fun b!336796 () Bool)

(assert (=> b!336796 (= e!206685 tp_is_empty!6997)))

(declare-fun b!336797 () Bool)

(declare-fun res!185997 () Bool)

(assert (=> b!336797 (=> (not res!185997) (not e!206684))))

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10307)

(declare-fun zeroValue!1467 () V!10307)

(declare-datatypes ((tuple2!5094 0))(
  ( (tuple2!5095 (_1!2558 (_ BitVec 64)) (_2!2558 V!10307)) )
))
(declare-datatypes ((List!4729 0))(
  ( (Nil!4726) (Cons!4725 (h!5581 tuple2!5094) (t!9814 List!4729)) )
))
(declare-datatypes ((ListLongMap!3997 0))(
  ( (ListLongMap!3998 (toList!2014 List!4729)) )
))
(declare-fun contains!2072 (ListLongMap!3997 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1520 (array!17571 array!17569 (_ BitVec 32) (_ BitVec 32) V!10307 V!10307 (_ BitVec 32) Int) ListLongMap!3997)

(assert (=> b!336797 (= res!185997 (not (contains!2072 (getCurrentListMap!1520 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!33852 res!185994) b!336787))

(assert (= (and b!336787 res!185992) b!336790))

(assert (= (and b!336790 res!185993) b!336793))

(assert (= (and b!336793 res!185995) b!336795))

(assert (= (and b!336795 res!185999) b!336797))

(assert (= (and b!336797 res!185997) b!336788))

(assert (= (and b!336788 res!185998) b!336794))

(assert (= (and b!336794 res!185996) b!336791))

(assert (= (and b!336789 condMapEmpty!11901) mapIsEmpty!11901))

(assert (= (and b!336789 (not condMapEmpty!11901)) mapNonEmpty!11901))

(assert (= (and mapNonEmpty!11901 ((_ is ValueCellFull!3155) mapValue!11901)) b!336792))

(assert (= (and b!336789 ((_ is ValueCellFull!3155) mapDefault!11901)) b!336796))

(assert (= start!33852 b!336789))

(declare-fun m!339961 () Bool)

(assert (=> mapNonEmpty!11901 m!339961))

(declare-fun m!339963 () Bool)

(assert (=> b!336788 m!339963))

(declare-fun m!339965 () Bool)

(assert (=> b!336790 m!339965))

(declare-fun m!339967 () Bool)

(assert (=> b!336797 m!339967))

(assert (=> b!336797 m!339967))

(declare-fun m!339969 () Bool)

(assert (=> b!336797 m!339969))

(declare-fun m!339971 () Bool)

(assert (=> b!336791 m!339971))

(declare-fun m!339973 () Bool)

(assert (=> b!336794 m!339973))

(declare-fun m!339975 () Bool)

(assert (=> b!336795 m!339975))

(declare-fun m!339977 () Bool)

(assert (=> start!33852 m!339977))

(declare-fun m!339979 () Bool)

(assert (=> start!33852 m!339979))

(declare-fun m!339981 () Bool)

(assert (=> start!33852 m!339981))

(declare-fun m!339983 () Bool)

(assert (=> b!336793 m!339983))

(check-sat tp_is_empty!6997 (not b!336794) (not b!336797) (not mapNonEmpty!11901) b_and!14205 (not b!336793) (not b!336788) (not b!336790) (not start!33852) (not b_next!7045) (not b!336795) (not b!336791))
(check-sat b_and!14205 (not b_next!7045))
