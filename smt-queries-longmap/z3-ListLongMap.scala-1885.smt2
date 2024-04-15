; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33730 () Bool)

(assert start!33730)

(declare-fun b_free!6979 () Bool)

(declare-fun b_next!6979 () Bool)

(assert (=> start!33730 (= b_free!6979 (not b_next!6979))))

(declare-fun tp!24441 () Bool)

(declare-fun b_and!14133 () Bool)

(assert (=> start!33730 (= tp!24441 b_and!14133)))

(declare-fun mapIsEmpty!11793 () Bool)

(declare-fun mapRes!11793 () Bool)

(assert (=> mapIsEmpty!11793 mapRes!11793))

(declare-fun b!335383 () Bool)

(declare-fun res!185131 () Bool)

(declare-fun e!205870 () Bool)

(assert (=> b!335383 (=> (not res!185131) (not e!205870))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-datatypes ((V!10219 0))(
  ( (V!10220 (val!3510 Int)) )
))
(declare-datatypes ((ValueCell!3122 0))(
  ( (ValueCellFull!3122 (v!5666 V!10219)) (EmptyCell!3122) )
))
(declare-datatypes ((array!17435 0))(
  ( (array!17436 (arr!8248 (Array (_ BitVec 32) ValueCell!3122)) (size!8601 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17435)

(declare-datatypes ((array!17437 0))(
  ( (array!17438 (arr!8249 (Array (_ BitVec 32) (_ BitVec 64))) (size!8602 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17437)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!335383 (= res!185131 (and (= (size!8601 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8602 _keys!1895) (size!8601 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335384 () Bool)

(declare-fun e!205869 () Bool)

(declare-fun tp_is_empty!6931 () Bool)

(assert (=> b!335384 (= e!205869 tp_is_empty!6931)))

(declare-fun mapNonEmpty!11793 () Bool)

(declare-fun tp!24440 () Bool)

(declare-fun e!205868 () Bool)

(assert (=> mapNonEmpty!11793 (= mapRes!11793 (and tp!24440 e!205868))))

(declare-fun mapValue!11793 () ValueCell!3122)

(declare-fun mapRest!11793 () (Array (_ BitVec 32) ValueCell!3122))

(declare-fun mapKey!11793 () (_ BitVec 32))

(assert (=> mapNonEmpty!11793 (= (arr!8248 _values!1525) (store mapRest!11793 mapKey!11793 mapValue!11793))))

(declare-fun b!335385 () Bool)

(declare-fun e!205873 () Bool)

(assert (=> b!335385 (= e!205870 e!205873)))

(declare-fun res!185137 () Bool)

(assert (=> b!335385 (=> (not res!185137) (not e!205873))))

(declare-datatypes ((tuple2!5046 0))(
  ( (tuple2!5047 (_1!2534 (_ BitVec 64)) (_2!2534 V!10219)) )
))
(declare-datatypes ((List!4682 0))(
  ( (Nil!4679) (Cons!4678 (h!5534 tuple2!5046) (t!9761 List!4682)) )
))
(declare-datatypes ((ListLongMap!3949 0))(
  ( (ListLongMap!3950 (toList!1990 List!4682)) )
))
(declare-fun lt!159676 () ListLongMap!3949)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun contains!2045 (ListLongMap!3949 (_ BitVec 64)) Bool)

(assert (=> b!335385 (= res!185137 (not (contains!2045 lt!159676 k0!1348)))))

(declare-fun zeroValue!1467 () V!10219)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10219)

(declare-fun getCurrentListMap!1497 (array!17437 array!17435 (_ BitVec 32) (_ BitVec 32) V!10219 V!10219 (_ BitVec 32) Int) ListLongMap!3949)

(assert (=> b!335385 (= lt!159676 (getCurrentListMap!1497 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335387 () Bool)

(declare-fun e!205867 () Bool)

(assert (=> b!335387 (= e!205873 e!205867)))

(declare-fun res!185135 () Bool)

(assert (=> b!335387 (=> (not res!185135) (not e!205867))))

(declare-datatypes ((SeekEntryResult!3192 0))(
  ( (MissingZero!3192 (index!14947 (_ BitVec 32))) (Found!3192 (index!14948 (_ BitVec 32))) (Intermediate!3192 (undefined!4004 Bool) (index!14949 (_ BitVec 32)) (x!33449 (_ BitVec 32))) (Undefined!3192) (MissingVacant!3192 (index!14950 (_ BitVec 32))) )
))
(declare-fun lt!159677 () SeekEntryResult!3192)

(get-info :version)

(assert (=> b!335387 (= res!185135 (and ((_ is Found!3192) lt!159677) (= (select (arr!8249 _keys!1895) (index!14948 lt!159677)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17437 (_ BitVec 32)) SeekEntryResult!3192)

(assert (=> b!335387 (= lt!159677 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!335388 () Bool)

(declare-fun res!185138 () Bool)

(assert (=> b!335388 (=> (not res!185138) (not e!205870))))

(declare-datatypes ((List!4683 0))(
  ( (Nil!4680) (Cons!4679 (h!5535 (_ BitVec 64)) (t!9762 List!4683)) )
))
(declare-fun arrayNoDuplicates!0 (array!17437 (_ BitVec 32) List!4683) Bool)

(assert (=> b!335388 (= res!185138 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4680))))

(declare-fun b!335389 () Bool)

(declare-fun res!185134 () Bool)

(assert (=> b!335389 (=> (not res!185134) (not e!205870))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335389 (= res!185134 (validKeyInArray!0 k0!1348))))

(declare-fun res!185133 () Bool)

(assert (=> start!33730 (=> (not res!185133) (not e!205870))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33730 (= res!185133 (validMask!0 mask!2385))))

(assert (=> start!33730 e!205870))

(assert (=> start!33730 true))

(assert (=> start!33730 tp_is_empty!6931))

(assert (=> start!33730 tp!24441))

(declare-fun e!205871 () Bool)

(declare-fun array_inv!6154 (array!17435) Bool)

(assert (=> start!33730 (and (array_inv!6154 _values!1525) e!205871)))

(declare-fun array_inv!6155 (array!17437) Bool)

(assert (=> start!33730 (array_inv!6155 _keys!1895)))

(declare-fun b!335386 () Bool)

(assert (=> b!335386 (= e!205867 (not true))))

(assert (=> b!335386 (contains!2045 lt!159676 (select (arr!8249 _keys!1895) (index!14948 lt!159677)))))

(declare-datatypes ((Unit!10430 0))(
  ( (Unit!10431) )
))
(declare-fun lt!159675 () Unit!10430)

(declare-fun lemmaValidKeyInArrayIsInListMap!172 (array!17437 array!17435 (_ BitVec 32) (_ BitVec 32) V!10219 V!10219 (_ BitVec 32) Int) Unit!10430)

(assert (=> b!335386 (= lt!159675 (lemmaValidKeyInArrayIsInListMap!172 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14948 lt!159677) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17437 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335386 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159678 () Unit!10430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17437 (_ BitVec 64) (_ BitVec 32)) Unit!10430)

(assert (=> b!335386 (= lt!159678 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14948 lt!159677)))))

(declare-fun b!335390 () Bool)

(declare-fun res!185136 () Bool)

(assert (=> b!335390 (=> (not res!185136) (not e!205867))))

(assert (=> b!335390 (= res!185136 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14948 lt!159677)))))

(declare-fun b!335391 () Bool)

(declare-fun res!185132 () Bool)

(assert (=> b!335391 (=> (not res!185132) (not e!205870))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17437 (_ BitVec 32)) Bool)

(assert (=> b!335391 (= res!185132 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335392 () Bool)

(assert (=> b!335392 (= e!205871 (and e!205869 mapRes!11793))))

(declare-fun condMapEmpty!11793 () Bool)

(declare-fun mapDefault!11793 () ValueCell!3122)

(assert (=> b!335392 (= condMapEmpty!11793 (= (arr!8248 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3122)) mapDefault!11793)))))

(declare-fun b!335393 () Bool)

(assert (=> b!335393 (= e!205868 tp_is_empty!6931)))

(assert (= (and start!33730 res!185133) b!335383))

(assert (= (and b!335383 res!185131) b!335391))

(assert (= (and b!335391 res!185132) b!335388))

(assert (= (and b!335388 res!185138) b!335389))

(assert (= (and b!335389 res!185134) b!335385))

(assert (= (and b!335385 res!185137) b!335387))

(assert (= (and b!335387 res!185135) b!335390))

(assert (= (and b!335390 res!185136) b!335386))

(assert (= (and b!335392 condMapEmpty!11793) mapIsEmpty!11793))

(assert (= (and b!335392 (not condMapEmpty!11793)) mapNonEmpty!11793))

(assert (= (and mapNonEmpty!11793 ((_ is ValueCellFull!3122) mapValue!11793)) b!335393))

(assert (= (and b!335392 ((_ is ValueCellFull!3122) mapDefault!11793)) b!335384))

(assert (= start!33730 b!335392))

(declare-fun m!338915 () Bool)

(assert (=> start!33730 m!338915))

(declare-fun m!338917 () Bool)

(assert (=> start!33730 m!338917))

(declare-fun m!338919 () Bool)

(assert (=> start!33730 m!338919))

(declare-fun m!338921 () Bool)

(assert (=> b!335387 m!338921))

(declare-fun m!338923 () Bool)

(assert (=> b!335387 m!338923))

(assert (=> b!335386 m!338921))

(declare-fun m!338925 () Bool)

(assert (=> b!335386 m!338925))

(assert (=> b!335386 m!338921))

(declare-fun m!338927 () Bool)

(assert (=> b!335386 m!338927))

(declare-fun m!338929 () Bool)

(assert (=> b!335386 m!338929))

(declare-fun m!338931 () Bool)

(assert (=> b!335386 m!338931))

(declare-fun m!338933 () Bool)

(assert (=> b!335389 m!338933))

(declare-fun m!338935 () Bool)

(assert (=> b!335388 m!338935))

(declare-fun m!338937 () Bool)

(assert (=> mapNonEmpty!11793 m!338937))

(declare-fun m!338939 () Bool)

(assert (=> b!335391 m!338939))

(declare-fun m!338941 () Bool)

(assert (=> b!335385 m!338941))

(declare-fun m!338943 () Bool)

(assert (=> b!335385 m!338943))

(declare-fun m!338945 () Bool)

(assert (=> b!335390 m!338945))

(check-sat (not b!335386) tp_is_empty!6931 (not b!335389) (not b!335387) (not b!335385) b_and!14133 (not start!33730) (not b_next!6979) (not b!335390) (not b!335391) (not b!335388) (not mapNonEmpty!11793))
(check-sat b_and!14133 (not b_next!6979))
