; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33724 () Bool)

(assert start!33724)

(declare-fun b_free!6973 () Bool)

(declare-fun b_next!6973 () Bool)

(assert (=> start!33724 (= b_free!6973 (not b_next!6973))))

(declare-fun tp!24422 () Bool)

(declare-fun b_and!14127 () Bool)

(assert (=> start!33724 (= tp!24422 b_and!14127)))

(declare-fun b!335284 () Bool)

(declare-fun e!205810 () Bool)

(declare-fun e!205807 () Bool)

(declare-fun mapRes!11784 () Bool)

(assert (=> b!335284 (= e!205810 (and e!205807 mapRes!11784))))

(declare-fun condMapEmpty!11784 () Bool)

(declare-datatypes ((V!10211 0))(
  ( (V!10212 (val!3507 Int)) )
))
(declare-datatypes ((ValueCell!3119 0))(
  ( (ValueCellFull!3119 (v!5663 V!10211)) (EmptyCell!3119) )
))
(declare-datatypes ((array!17423 0))(
  ( (array!17424 (arr!8242 (Array (_ BitVec 32) ValueCell!3119)) (size!8595 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17423)

(declare-fun mapDefault!11784 () ValueCell!3119)

(assert (=> b!335284 (= condMapEmpty!11784 (= (arr!8242 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3119)) mapDefault!11784)))))

(declare-fun b!335285 () Bool)

(declare-fun res!185063 () Bool)

(declare-fun e!205806 () Bool)

(assert (=> b!335285 (=> (not res!185063) (not e!205806))))

(declare-datatypes ((SeekEntryResult!3190 0))(
  ( (MissingZero!3190 (index!14939 (_ BitVec 32))) (Found!3190 (index!14940 (_ BitVec 32))) (Intermediate!3190 (undefined!4002 Bool) (index!14941 (_ BitVec 32)) (x!33439 (_ BitVec 32))) (Undefined!3190) (MissingVacant!3190 (index!14942 (_ BitVec 32))) )
))
(declare-fun lt!159642 () SeekEntryResult!3190)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17425 0))(
  ( (array!17426 (arr!8243 (Array (_ BitVec 32) (_ BitVec 64))) (size!8596 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17425)

(declare-fun arrayContainsKey!0 (array!17425 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335285 (= res!185063 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14940 lt!159642)))))

(declare-fun b!335286 () Bool)

(declare-fun res!185061 () Bool)

(declare-fun e!205804 () Bool)

(assert (=> b!335286 (=> (not res!185061) (not e!205804))))

(declare-datatypes ((List!4678 0))(
  ( (Nil!4675) (Cons!4674 (h!5530 (_ BitVec 64)) (t!9757 List!4678)) )
))
(declare-fun arrayNoDuplicates!0 (array!17425 (_ BitVec 32) List!4678) Bool)

(assert (=> b!335286 (= res!185061 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4675))))

(declare-fun b!335287 () Bool)

(declare-fun e!205805 () Bool)

(assert (=> b!335287 (= e!205805 e!205806)))

(declare-fun res!185060 () Bool)

(assert (=> b!335287 (=> (not res!185060) (not e!205806))))

(get-info :version)

(assert (=> b!335287 (= res!185060 (and ((_ is Found!3190) lt!159642) (= (select (arr!8243 _keys!1895) (index!14940 lt!159642)) k0!1348)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17425 (_ BitVec 32)) SeekEntryResult!3190)

(assert (=> b!335287 (= lt!159642 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapNonEmpty!11784 () Bool)

(declare-fun tp!24423 () Bool)

(declare-fun e!205809 () Bool)

(assert (=> mapNonEmpty!11784 (= mapRes!11784 (and tp!24423 e!205809))))

(declare-fun mapRest!11784 () (Array (_ BitVec 32) ValueCell!3119))

(declare-fun mapValue!11784 () ValueCell!3119)

(declare-fun mapKey!11784 () (_ BitVec 32))

(assert (=> mapNonEmpty!11784 (= (arr!8242 _values!1525) (store mapRest!11784 mapKey!11784 mapValue!11784))))

(declare-fun b!335288 () Bool)

(declare-fun res!185062 () Bool)

(assert (=> b!335288 (=> (not res!185062) (not e!205804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17425 (_ BitVec 32)) Bool)

(assert (=> b!335288 (= res!185062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!335289 () Bool)

(declare-fun tp_is_empty!6925 () Bool)

(assert (=> b!335289 (= e!205809 tp_is_empty!6925)))

(declare-fun res!185065 () Bool)

(assert (=> start!33724 (=> (not res!185065) (not e!205804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33724 (= res!185065 (validMask!0 mask!2385))))

(assert (=> start!33724 e!205804))

(assert (=> start!33724 true))

(assert (=> start!33724 tp_is_empty!6925))

(assert (=> start!33724 tp!24422))

(declare-fun array_inv!6150 (array!17423) Bool)

(assert (=> start!33724 (and (array_inv!6150 _values!1525) e!205810)))

(declare-fun array_inv!6151 (array!17425) Bool)

(assert (=> start!33724 (array_inv!6151 _keys!1895)))

(declare-fun mapIsEmpty!11784 () Bool)

(assert (=> mapIsEmpty!11784 mapRes!11784))

(declare-fun b!335290 () Bool)

(assert (=> b!335290 (= e!205807 tp_is_empty!6925)))

(declare-fun b!335291 () Bool)

(declare-fun res!185066 () Bool)

(assert (=> b!335291 (=> (not res!185066) (not e!205804))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335291 (= res!185066 (validKeyInArray!0 k0!1348))))

(declare-fun b!335292 () Bool)

(assert (=> b!335292 (= e!205804 e!205805)))

(declare-fun res!185064 () Bool)

(assert (=> b!335292 (=> (not res!185064) (not e!205805))))

(declare-datatypes ((tuple2!5042 0))(
  ( (tuple2!5043 (_1!2532 (_ BitVec 64)) (_2!2532 V!10211)) )
))
(declare-datatypes ((List!4679 0))(
  ( (Nil!4676) (Cons!4675 (h!5531 tuple2!5042) (t!9758 List!4679)) )
))
(declare-datatypes ((ListLongMap!3945 0))(
  ( (ListLongMap!3946 (toList!1988 List!4679)) )
))
(declare-fun lt!159641 () ListLongMap!3945)

(declare-fun contains!2043 (ListLongMap!3945 (_ BitVec 64)) Bool)

(assert (=> b!335292 (= res!185064 (not (contains!2043 lt!159641 k0!1348)))))

(declare-fun zeroValue!1467 () V!10211)

(declare-fun defaultEntry!1528 () Int)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10211)

(declare-fun getCurrentListMap!1495 (array!17425 array!17423 (_ BitVec 32) (_ BitVec 32) V!10211 V!10211 (_ BitVec 32) Int) ListLongMap!3945)

(assert (=> b!335292 (= lt!159641 (getCurrentListMap!1495 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!335293 () Bool)

(declare-fun res!185059 () Bool)

(assert (=> b!335293 (=> (not res!185059) (not e!205804))))

(assert (=> b!335293 (= res!185059 (and (= (size!8595 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8596 _keys!1895) (size!8595 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!335294 () Bool)

(assert (=> b!335294 (= e!205806 (not true))))

(assert (=> b!335294 (contains!2043 lt!159641 (select (arr!8243 _keys!1895) (index!14940 lt!159642)))))

(declare-datatypes ((Unit!10426 0))(
  ( (Unit!10427) )
))
(declare-fun lt!159640 () Unit!10426)

(declare-fun lemmaValidKeyInArrayIsInListMap!170 (array!17425 array!17423 (_ BitVec 32) (_ BitVec 32) V!10211 V!10211 (_ BitVec 32) Int) Unit!10426)

(assert (=> b!335294 (= lt!159640 (lemmaValidKeyInArrayIsInListMap!170 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14940 lt!159642) defaultEntry!1528))))

(assert (=> b!335294 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159639 () Unit!10426)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17425 (_ BitVec 64) (_ BitVec 32)) Unit!10426)

(assert (=> b!335294 (= lt!159639 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14940 lt!159642)))))

(assert (= (and start!33724 res!185065) b!335293))

(assert (= (and b!335293 res!185059) b!335288))

(assert (= (and b!335288 res!185062) b!335286))

(assert (= (and b!335286 res!185061) b!335291))

(assert (= (and b!335291 res!185066) b!335292))

(assert (= (and b!335292 res!185064) b!335287))

(assert (= (and b!335287 res!185060) b!335285))

(assert (= (and b!335285 res!185063) b!335294))

(assert (= (and b!335284 condMapEmpty!11784) mapIsEmpty!11784))

(assert (= (and b!335284 (not condMapEmpty!11784)) mapNonEmpty!11784))

(assert (= (and mapNonEmpty!11784 ((_ is ValueCellFull!3119) mapValue!11784)) b!335289))

(assert (= (and b!335284 ((_ is ValueCellFull!3119) mapDefault!11784)) b!335290))

(assert (= start!33724 b!335284))

(declare-fun m!338819 () Bool)

(assert (=> b!335291 m!338819))

(declare-fun m!338821 () Bool)

(assert (=> b!335294 m!338821))

(declare-fun m!338823 () Bool)

(assert (=> b!335294 m!338823))

(declare-fun m!338825 () Bool)

(assert (=> b!335294 m!338825))

(declare-fun m!338827 () Bool)

(assert (=> b!335294 m!338827))

(declare-fun m!338829 () Bool)

(assert (=> b!335294 m!338829))

(assert (=> b!335294 m!338827))

(declare-fun m!338831 () Bool)

(assert (=> mapNonEmpty!11784 m!338831))

(assert (=> b!335287 m!338827))

(declare-fun m!338833 () Bool)

(assert (=> b!335287 m!338833))

(declare-fun m!338835 () Bool)

(assert (=> b!335285 m!338835))

(declare-fun m!338837 () Bool)

(assert (=> start!33724 m!338837))

(declare-fun m!338839 () Bool)

(assert (=> start!33724 m!338839))

(declare-fun m!338841 () Bool)

(assert (=> start!33724 m!338841))

(declare-fun m!338843 () Bool)

(assert (=> b!335292 m!338843))

(declare-fun m!338845 () Bool)

(assert (=> b!335292 m!338845))

(declare-fun m!338847 () Bool)

(assert (=> b!335288 m!338847))

(declare-fun m!338849 () Bool)

(assert (=> b!335286 m!338849))

(check-sat (not b!335287) b_and!14127 (not b!335288) (not b!335285) (not b_next!6973) (not mapNonEmpty!11784) (not start!33724) (not b!335291) tp_is_empty!6925 (not b!335292) (not b!335294) (not b!335286))
(check-sat b_and!14127 (not b_next!6973))
