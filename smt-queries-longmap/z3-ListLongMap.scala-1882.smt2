; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33728 () Bool)

(assert start!33728)

(declare-fun b_free!6963 () Bool)

(declare-fun b_next!6963 () Bool)

(assert (=> start!33728 (= b_free!6963 (not b_next!6963))))

(declare-fun tp!24392 () Bool)

(declare-fun b_and!14143 () Bool)

(assert (=> start!33728 (= tp!24392 b_and!14143)))

(declare-fun b!335394 () Bool)

(declare-fun e!205881 () Bool)

(declare-fun e!205878 () Bool)

(assert (=> b!335394 (= e!205881 e!205878)))

(declare-fun res!185069 () Bool)

(assert (=> b!335394 (=> (not res!185069) (not e!205878))))

(declare-datatypes ((V!10197 0))(
  ( (V!10198 (val!3502 Int)) )
))
(declare-datatypes ((tuple2!5086 0))(
  ( (tuple2!5087 (_1!2554 (_ BitVec 64)) (_2!2554 V!10197)) )
))
(declare-datatypes ((List!4706 0))(
  ( (Nil!4703) (Cons!4702 (h!5558 tuple2!5086) (t!9794 List!4706)) )
))
(declare-datatypes ((ListLongMap!3999 0))(
  ( (ListLongMap!4000 (toList!2015 List!4706)) )
))
(declare-fun lt!159816 () ListLongMap!3999)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun contains!2059 (ListLongMap!3999 (_ BitVec 64)) Bool)

(assert (=> b!335394 (= res!185069 (not (contains!2059 lt!159816 k0!1348)))))

(declare-fun zeroValue!1467 () V!10197)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3114 0))(
  ( (ValueCellFull!3114 (v!5664 V!10197)) (EmptyCell!3114) )
))
(declare-datatypes ((array!17423 0))(
  ( (array!17424 (arr!8242 (Array (_ BitVec 32) ValueCell!3114)) (size!8594 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17423)

(declare-datatypes ((array!17425 0))(
  ( (array!17426 (arr!8243 (Array (_ BitVec 32) (_ BitVec 64))) (size!8595 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17425)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10197)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun getCurrentListMap!1539 (array!17425 array!17423 (_ BitVec 32) (_ BitVec 32) V!10197 V!10197 (_ BitVec 32) Int) ListLongMap!3999)

(assert (=> b!335394 (= lt!159816 (getCurrentListMap!1539 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335395 () Bool)

(declare-fun res!185070 () Bool)

(assert (=> b!335395 (=> (not res!185070) (not e!205881))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335395 (= res!185070 (validKeyInArray!0 k0!1348))))

(declare-fun b!335396 () Bool)

(declare-fun res!185068 () Bool)

(assert (=> b!335396 (=> (not res!185068) (not e!205881))))

(declare-datatypes ((List!4707 0))(
  ( (Nil!4704) (Cons!4703 (h!5559 (_ BitVec 64)) (t!9795 List!4707)) )
))
(declare-fun arrayNoDuplicates!0 (array!17425 (_ BitVec 32) List!4707) Bool)

(assert (=> b!335396 (= res!185068 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4704))))

(declare-fun res!185072 () Bool)

(assert (=> start!33728 (=> (not res!185072) (not e!205881))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33728 (= res!185072 (validMask!0 mask!2385))))

(assert (=> start!33728 e!205881))

(assert (=> start!33728 true))

(declare-fun tp_is_empty!6915 () Bool)

(assert (=> start!33728 tp_is_empty!6915))

(assert (=> start!33728 tp!24392))

(declare-fun e!205879 () Bool)

(declare-fun array_inv!6124 (array!17423) Bool)

(assert (=> start!33728 (and (array_inv!6124 _values!1525) e!205879)))

(declare-fun array_inv!6125 (array!17425) Bool)

(assert (=> start!33728 (array_inv!6125 _keys!1895)))

(declare-fun b!335397 () Bool)

(declare-fun e!205877 () Bool)

(assert (=> b!335397 (= e!205877 tp_is_empty!6915)))

(declare-fun mapNonEmpty!11769 () Bool)

(declare-fun mapRes!11769 () Bool)

(declare-fun tp!24393 () Bool)

(declare-fun e!205875 () Bool)

(assert (=> mapNonEmpty!11769 (= mapRes!11769 (and tp!24393 e!205875))))

(declare-fun mapRest!11769 () (Array (_ BitVec 32) ValueCell!3114))

(declare-fun mapValue!11769 () ValueCell!3114)

(declare-fun mapKey!11769 () (_ BitVec 32))

(assert (=> mapNonEmpty!11769 (= (arr!8242 _values!1525) (store mapRest!11769 mapKey!11769 mapValue!11769))))

(declare-fun b!335398 () Bool)

(declare-fun e!205880 () Bool)

(assert (=> b!335398 (= e!205880 (not true))))

(declare-datatypes ((SeekEntryResult!3187 0))(
  ( (MissingZero!3187 (index!14927 (_ BitVec 32))) (Found!3187 (index!14928 (_ BitVec 32))) (Intermediate!3187 (undefined!3999 Bool) (index!14929 (_ BitVec 32)) (x!33425 (_ BitVec 32))) (Undefined!3187) (MissingVacant!3187 (index!14930 (_ BitVec 32))) )
))
(declare-fun lt!159817 () SeekEntryResult!3187)

(assert (=> b!335398 (contains!2059 lt!159816 (select (arr!8243 _keys!1895) (index!14928 lt!159817)))))

(declare-datatypes ((Unit!10439 0))(
  ( (Unit!10440) )
))
(declare-fun lt!159815 () Unit!10439)

(declare-fun lemmaValidKeyInArrayIsInListMap!166 (array!17425 array!17423 (_ BitVec 32) (_ BitVec 32) V!10197 V!10197 (_ BitVec 32) Int) Unit!10439)

(assert (=> b!335398 (= lt!159815 (lemmaValidKeyInArrayIsInListMap!166 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14928 lt!159817) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335398 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159814 () Unit!10439)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17425 (_ BitVec 64) (_ BitVec 32)) Unit!10439)

(assert (=> b!335398 (= lt!159814 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14928 lt!159817)))))

(declare-fun b!335399 () Bool)

(declare-fun res!185071 () Bool)

(assert (=> b!335399 (=> (not res!185071) (not e!205881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17425 (_ BitVec 32)) Bool)

(assert (=> b!335399 (= res!185071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335400 () Bool)

(assert (=> b!335400 (= e!205878 e!205880)))

(declare-fun res!185075 () Bool)

(assert (=> b!335400 (=> (not res!185075) (not e!205880))))

(get-info :version)

(assert (=> b!335400 (= res!185075 (and ((_ is Found!3187) lt!159817) (= (select (arr!8243 _keys!1895) (index!14928 lt!159817)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17425 (_ BitVec 32)) SeekEntryResult!3187)

(assert (=> b!335400 (= lt!159817 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335401 () Bool)

(assert (=> b!335401 (= e!205879 (and e!205877 mapRes!11769))))

(declare-fun condMapEmpty!11769 () Bool)

(declare-fun mapDefault!11769 () ValueCell!3114)

(assert (=> b!335401 (= condMapEmpty!11769 (= (arr!8242 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3114)) mapDefault!11769)))))

(declare-fun b!335402 () Bool)

(declare-fun res!185073 () Bool)

(assert (=> b!335402 (=> (not res!185073) (not e!205880))))

(assert (=> b!335402 (= res!185073 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14928 lt!159817)))))

(declare-fun b!335403 () Bool)

(declare-fun res!185074 () Bool)

(assert (=> b!335403 (=> (not res!185074) (not e!205881))))

(assert (=> b!335403 (= res!185074 (and (= (size!8594 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8595 _keys!1895) (size!8594 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335404 () Bool)

(assert (=> b!335404 (= e!205875 tp_is_empty!6915)))

(declare-fun mapIsEmpty!11769 () Bool)

(assert (=> mapIsEmpty!11769 mapRes!11769))

(assert (= (and start!33728 res!185072) b!335403))

(assert (= (and b!335403 res!185074) b!335399))

(assert (= (and b!335399 res!185071) b!335396))

(assert (= (and b!335396 res!185068) b!335395))

(assert (= (and b!335395 res!185070) b!335394))

(assert (= (and b!335394 res!185069) b!335400))

(assert (= (and b!335400 res!185075) b!335402))

(assert (= (and b!335402 res!185073) b!335398))

(assert (= (and b!335401 condMapEmpty!11769) mapIsEmpty!11769))

(assert (= (and b!335401 (not condMapEmpty!11769)) mapNonEmpty!11769))

(assert (= (and mapNonEmpty!11769 ((_ is ValueCellFull!3114) mapValue!11769)) b!335404))

(assert (= (and b!335401 ((_ is ValueCellFull!3114) mapDefault!11769)) b!335397))

(assert (= start!33728 b!335401))

(declare-fun m!339389 () Bool)

(assert (=> b!335396 m!339389))

(declare-fun m!339391 () Bool)

(assert (=> b!335394 m!339391))

(declare-fun m!339393 () Bool)

(assert (=> b!335394 m!339393))

(declare-fun m!339395 () Bool)

(assert (=> b!335399 m!339395))

(declare-fun m!339397 () Bool)

(assert (=> b!335398 m!339397))

(assert (=> b!335398 m!339397))

(declare-fun m!339399 () Bool)

(assert (=> b!335398 m!339399))

(declare-fun m!339401 () Bool)

(assert (=> b!335398 m!339401))

(declare-fun m!339403 () Bool)

(assert (=> b!335398 m!339403))

(declare-fun m!339405 () Bool)

(assert (=> b!335398 m!339405))

(declare-fun m!339407 () Bool)

(assert (=> b!335402 m!339407))

(assert (=> b!335400 m!339397))

(declare-fun m!339409 () Bool)

(assert (=> b!335400 m!339409))

(declare-fun m!339411 () Bool)

(assert (=> mapNonEmpty!11769 m!339411))

(declare-fun m!339413 () Bool)

(assert (=> b!335395 m!339413))

(declare-fun m!339415 () Bool)

(assert (=> start!33728 m!339415))

(declare-fun m!339417 () Bool)

(assert (=> start!33728 m!339417))

(declare-fun m!339419 () Bool)

(assert (=> start!33728 m!339419))

(check-sat (not start!33728) tp_is_empty!6915 (not b!335402) (not b!335398) (not b!335394) b_and!14143 (not b_next!6963) (not b!335396) (not b!335400) (not mapNonEmpty!11769) (not b!335395) (not b!335399))
(check-sat b_and!14143 (not b_next!6963))
