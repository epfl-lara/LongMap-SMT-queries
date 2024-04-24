; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33634 () Bool)

(assert start!33634)

(declare-fun b_free!6883 () Bool)

(declare-fun b_next!6883 () Bool)

(assert (=> start!33634 (= b_free!6883 (not b_next!6883))))

(declare-fun tp!24152 () Bool)

(declare-fun b_and!14077 () Bool)

(assert (=> start!33634 (= tp!24152 b_and!14077)))

(declare-fun b!334021 () Bool)

(declare-fun e!205063 () Bool)

(assert (=> b!334021 (= e!205063 (not true))))

(declare-datatypes ((array!17258 0))(
  ( (array!17259 (arr!8159 (Array (_ BitVec 32) (_ BitVec 64))) (size!8511 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17258)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17258 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334021 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!3117 0))(
  ( (MissingZero!3117 (index!14647 (_ BitVec 32))) (Found!3117 (index!14648 (_ BitVec 32))) (Intermediate!3117 (undefined!3929 Bool) (index!14649 (_ BitVec 32)) (x!33248 (_ BitVec 32))) (Undefined!3117) (MissingVacant!3117 (index!14650 (_ BitVec 32))) )
))
(declare-fun lt!159475 () SeekEntryResult!3117)

(declare-datatypes ((Unit!10363 0))(
  ( (Unit!10364) )
))
(declare-fun lt!159474 () Unit!10363)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17258 (_ BitVec 64) (_ BitVec 32)) Unit!10363)

(assert (=> b!334021 (= lt!159474 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14648 lt!159475)))))

(declare-fun b!334022 () Bool)

(declare-fun res!184105 () Bool)

(declare-fun e!205065 () Bool)

(assert (=> b!334022 (=> (not res!184105) (not e!205065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334022 (= res!184105 (validKeyInArray!0 k0!1348))))

(declare-fun mapIsEmpty!11649 () Bool)

(declare-fun mapRes!11649 () Bool)

(assert (=> mapIsEmpty!11649 mapRes!11649))

(declare-fun b!334023 () Bool)

(declare-fun e!205067 () Bool)

(declare-fun tp_is_empty!6835 () Bool)

(assert (=> b!334023 (= e!205067 tp_is_empty!6835)))

(declare-fun b!334025 () Bool)

(declare-fun e!205066 () Bool)

(assert (=> b!334025 (= e!205066 tp_is_empty!6835)))

(declare-fun b!334026 () Bool)

(declare-fun res!184111 () Bool)

(assert (=> b!334026 (=> (not res!184111) (not e!205065))))

(declare-datatypes ((List!4568 0))(
  ( (Nil!4565) (Cons!4564 (h!5420 (_ BitVec 64)) (t!9648 List!4568)) )
))
(declare-fun arrayNoDuplicates!0 (array!17258 (_ BitVec 32) List!4568) Bool)

(assert (=> b!334026 (= res!184111 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4565))))

(declare-fun b!334027 () Bool)

(declare-fun res!184107 () Bool)

(assert (=> b!334027 (=> (not res!184107) (not e!205063))))

(assert (=> b!334027 (= res!184107 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14648 lt!159475)))))

(declare-fun b!334028 () Bool)

(assert (=> b!334028 (= e!205065 e!205063)))

(declare-fun res!184108 () Bool)

(assert (=> b!334028 (=> (not res!184108) (not e!205063))))

(get-info :version)

(assert (=> b!334028 (= res!184108 (and ((_ is Found!3117) lt!159475) (= (select (arr!8159 _keys!1895) (index!14648 lt!159475)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17258 (_ BitVec 32)) SeekEntryResult!3117)

(assert (=> b!334028 (= lt!159475 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!184106 () Bool)

(assert (=> start!33634 (=> (not res!184106) (not e!205065))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33634 (= res!184106 (validMask!0 mask!2385))))

(assert (=> start!33634 e!205065))

(assert (=> start!33634 true))

(assert (=> start!33634 tp_is_empty!6835))

(assert (=> start!33634 tp!24152))

(declare-datatypes ((V!10091 0))(
  ( (V!10092 (val!3462 Int)) )
))
(declare-datatypes ((ValueCell!3074 0))(
  ( (ValueCellFull!3074 (v!5625 V!10091)) (EmptyCell!3074) )
))
(declare-datatypes ((array!17260 0))(
  ( (array!17261 (arr!8160 (Array (_ BitVec 32) ValueCell!3074)) (size!8512 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17260)

(declare-fun e!205064 () Bool)

(declare-fun array_inv!6072 (array!17260) Bool)

(assert (=> start!33634 (and (array_inv!6072 _values!1525) e!205064)))

(declare-fun array_inv!6073 (array!17258) Bool)

(assert (=> start!33634 (array_inv!6073 _keys!1895)))

(declare-fun b!334024 () Bool)

(declare-fun res!184112 () Bool)

(assert (=> b!334024 (=> (not res!184112) (not e!205065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17258 (_ BitVec 32)) Bool)

(assert (=> b!334024 (= res!184112 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11649 () Bool)

(declare-fun tp!24153 () Bool)

(assert (=> mapNonEmpty!11649 (= mapRes!11649 (and tp!24153 e!205067))))

(declare-fun mapValue!11649 () ValueCell!3074)

(declare-fun mapKey!11649 () (_ BitVec 32))

(declare-fun mapRest!11649 () (Array (_ BitVec 32) ValueCell!3074))

(assert (=> mapNonEmpty!11649 (= (arr!8160 _values!1525) (store mapRest!11649 mapKey!11649 mapValue!11649))))

(declare-fun b!334029 () Bool)

(assert (=> b!334029 (= e!205064 (and e!205066 mapRes!11649))))

(declare-fun condMapEmpty!11649 () Bool)

(declare-fun mapDefault!11649 () ValueCell!3074)

(assert (=> b!334029 (= condMapEmpty!11649 (= (arr!8160 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3074)) mapDefault!11649)))))

(declare-fun b!334030 () Bool)

(declare-fun res!184110 () Bool)

(assert (=> b!334030 (=> (not res!184110) (not e!205065))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334030 (= res!184110 (and (= (size!8512 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8511 _keys!1895) (size!8512 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334031 () Bool)

(declare-fun res!184109 () Bool)

(assert (=> b!334031 (=> (not res!184109) (not e!205065))))

(declare-fun zeroValue!1467 () V!10091)

(declare-fun minValue!1467 () V!10091)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((tuple2!4952 0))(
  ( (tuple2!4953 (_1!2487 (_ BitVec 64)) (_2!2487 V!10091)) )
))
(declare-datatypes ((List!4569 0))(
  ( (Nil!4566) (Cons!4565 (h!5421 tuple2!4952) (t!9649 List!4569)) )
))
(declare-datatypes ((ListLongMap!3867 0))(
  ( (ListLongMap!3868 (toList!1949 List!4569)) )
))
(declare-fun contains!2012 (ListLongMap!3867 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1481 (array!17258 array!17260 (_ BitVec 32) (_ BitVec 32) V!10091 V!10091 (_ BitVec 32) Int) ListLongMap!3867)

(assert (=> b!334031 (= res!184109 (not (contains!2012 (getCurrentListMap!1481 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(assert (= (and start!33634 res!184106) b!334030))

(assert (= (and b!334030 res!184110) b!334024))

(assert (= (and b!334024 res!184112) b!334026))

(assert (= (and b!334026 res!184111) b!334022))

(assert (= (and b!334022 res!184105) b!334031))

(assert (= (and b!334031 res!184109) b!334028))

(assert (= (and b!334028 res!184108) b!334027))

(assert (= (and b!334027 res!184107) b!334021))

(assert (= (and b!334029 condMapEmpty!11649) mapIsEmpty!11649))

(assert (= (and b!334029 (not condMapEmpty!11649)) mapNonEmpty!11649))

(assert (= (and mapNonEmpty!11649 ((_ is ValueCellFull!3074) mapValue!11649)) b!334023))

(assert (= (and b!334029 ((_ is ValueCellFull!3074) mapDefault!11649)) b!334025))

(assert (= start!33634 b!334029))

(declare-fun m!338417 () Bool)

(assert (=> b!334027 m!338417))

(declare-fun m!338419 () Bool)

(assert (=> b!334026 m!338419))

(declare-fun m!338421 () Bool)

(assert (=> start!33634 m!338421))

(declare-fun m!338423 () Bool)

(assert (=> start!33634 m!338423))

(declare-fun m!338425 () Bool)

(assert (=> start!33634 m!338425))

(declare-fun m!338427 () Bool)

(assert (=> mapNonEmpty!11649 m!338427))

(declare-fun m!338429 () Bool)

(assert (=> b!334028 m!338429))

(declare-fun m!338431 () Bool)

(assert (=> b!334028 m!338431))

(declare-fun m!338433 () Bool)

(assert (=> b!334024 m!338433))

(declare-fun m!338435 () Bool)

(assert (=> b!334022 m!338435))

(declare-fun m!338437 () Bool)

(assert (=> b!334031 m!338437))

(assert (=> b!334031 m!338437))

(declare-fun m!338439 () Bool)

(assert (=> b!334031 m!338439))

(declare-fun m!338441 () Bool)

(assert (=> b!334021 m!338441))

(declare-fun m!338443 () Bool)

(assert (=> b!334021 m!338443))

(check-sat tp_is_empty!6835 b_and!14077 (not start!33634) (not b!334022) (not b!334027) (not b!334031) (not b_next!6883) (not b!334024) (not mapNonEmpty!11649) (not b!334026) (not b!334021) (not b!334028))
(check-sat b_and!14077 (not b_next!6883))
