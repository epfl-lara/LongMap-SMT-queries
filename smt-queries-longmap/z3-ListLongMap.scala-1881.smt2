; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!33706 () Bool)

(assert start!33706)

(declare-fun b_free!6955 () Bool)

(declare-fun b_next!6955 () Bool)

(assert (=> start!33706 (= b_free!6955 (not b_next!6955))))

(declare-fun tp!24369 () Bool)

(declare-fun b_and!14109 () Bool)

(assert (=> start!33706 (= tp!24369 b_and!14109)))

(declare-fun b!334987 () Bool)

(declare-fun e!205621 () Bool)

(declare-fun e!205617 () Bool)

(declare-fun mapRes!11757 () Bool)

(assert (=> b!334987 (= e!205621 (and e!205617 mapRes!11757))))

(declare-fun condMapEmpty!11757 () Bool)

(declare-datatypes ((V!10187 0))(
  ( (V!10188 (val!3498 Int)) )
))
(declare-datatypes ((ValueCell!3110 0))(
  ( (ValueCellFull!3110 (v!5654 V!10187)) (EmptyCell!3110) )
))
(declare-datatypes ((array!17387 0))(
  ( (array!17388 (arr!8224 (Array (_ BitVec 32) ValueCell!3110)) (size!8577 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17387)

(declare-fun mapDefault!11757 () ValueCell!3110)

(assert (=> b!334987 (= condMapEmpty!11757 (= (arr!8224 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3110)) mapDefault!11757)))))

(declare-fun b!334988 () Bool)

(declare-fun res!184849 () Bool)

(declare-fun e!205619 () Bool)

(assert (=> b!334988 (=> (not res!184849) (not e!205619))))

(declare-datatypes ((array!17389 0))(
  ( (array!17390 (arr!8225 (Array (_ BitVec 32) (_ BitVec 64))) (size!8578 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17389)

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17389 (_ BitVec 32)) Bool)

(assert (=> b!334988 (= res!184849 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11757 () Bool)

(assert (=> mapIsEmpty!11757 mapRes!11757))

(declare-fun b!334989 () Bool)

(declare-fun tp_is_empty!6907 () Bool)

(assert (=> b!334989 (= e!205617 tp_is_empty!6907)))

(declare-fun res!184850 () Bool)

(assert (=> start!33706 (=> (not res!184850) (not e!205619))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33706 (= res!184850 (validMask!0 mask!2385))))

(assert (=> start!33706 e!205619))

(assert (=> start!33706 true))

(assert (=> start!33706 tp_is_empty!6907))

(assert (=> start!33706 tp!24369))

(declare-fun array_inv!6134 (array!17387) Bool)

(assert (=> start!33706 (and (array_inv!6134 _values!1525) e!205621)))

(declare-fun array_inv!6135 (array!17389) Bool)

(assert (=> start!33706 (array_inv!6135 _keys!1895)))

(declare-fun b!334990 () Bool)

(declare-fun res!184845 () Bool)

(assert (=> b!334990 (=> (not res!184845) (not e!205619))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!334990 (= res!184845 (and (= (size!8577 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8578 _keys!1895) (size!8577 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!334991 () Bool)

(declare-fun e!205618 () Bool)

(assert (=> b!334991 (= e!205618 (not true))))

(declare-datatypes ((tuple2!5026 0))(
  ( (tuple2!5027 (_1!2524 (_ BitVec 64)) (_2!2524 V!10187)) )
))
(declare-datatypes ((List!4665 0))(
  ( (Nil!4662) (Cons!4661 (h!5517 tuple2!5026) (t!9744 List!4665)) )
))
(declare-datatypes ((ListLongMap!3929 0))(
  ( (ListLongMap!3930 (toList!1980 List!4665)) )
))
(declare-fun lt!159533 () ListLongMap!3929)

(declare-datatypes ((SeekEntryResult!3182 0))(
  ( (MissingZero!3182 (index!14907 (_ BitVec 32))) (Found!3182 (index!14908 (_ BitVec 32))) (Intermediate!3182 (undefined!3994 Bool) (index!14909 (_ BitVec 32)) (x!33407 (_ BitVec 32))) (Undefined!3182) (MissingVacant!3182 (index!14910 (_ BitVec 32))) )
))
(declare-fun lt!159532 () SeekEntryResult!3182)

(declare-fun contains!2035 (ListLongMap!3929 (_ BitVec 64)) Bool)

(assert (=> b!334991 (contains!2035 lt!159533 (select (arr!8225 _keys!1895) (index!14908 lt!159532)))))

(declare-fun zeroValue!1467 () V!10187)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10187)

(declare-datatypes ((Unit!10410 0))(
  ( (Unit!10411) )
))
(declare-fun lt!159531 () Unit!10410)

(declare-fun lemmaValidKeyInArrayIsInListMap!162 (array!17389 array!17387 (_ BitVec 32) (_ BitVec 32) V!10187 V!10187 (_ BitVec 32) Int) Unit!10410)

(assert (=> b!334991 (= lt!159531 (lemmaValidKeyInArrayIsInListMap!162 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14908 lt!159532) defaultEntry!1528))))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17389 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!334991 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159534 () Unit!10410)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17389 (_ BitVec 64) (_ BitVec 32)) Unit!10410)

(assert (=> b!334991 (= lt!159534 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k0!1348 (index!14908 lt!159532)))))

(declare-fun b!334992 () Bool)

(declare-fun res!184847 () Bool)

(assert (=> b!334992 (=> (not res!184847) (not e!205619))))

(declare-datatypes ((List!4666 0))(
  ( (Nil!4663) (Cons!4662 (h!5518 (_ BitVec 64)) (t!9745 List!4666)) )
))
(declare-fun arrayNoDuplicates!0 (array!17389 (_ BitVec 32) List!4666) Bool)

(assert (=> b!334992 (= res!184847 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4663))))

(declare-fun mapNonEmpty!11757 () Bool)

(declare-fun tp!24368 () Bool)

(declare-fun e!205616 () Bool)

(assert (=> mapNonEmpty!11757 (= mapRes!11757 (and tp!24368 e!205616))))

(declare-fun mapKey!11757 () (_ BitVec 32))

(declare-fun mapValue!11757 () ValueCell!3110)

(declare-fun mapRest!11757 () (Array (_ BitVec 32) ValueCell!3110))

(assert (=> mapNonEmpty!11757 (= (arr!8224 _values!1525) (store mapRest!11757 mapKey!11757 mapValue!11757))))

(declare-fun b!334993 () Bool)

(declare-fun e!205620 () Bool)

(assert (=> b!334993 (= e!205619 e!205620)))

(declare-fun res!184846 () Bool)

(assert (=> b!334993 (=> (not res!184846) (not e!205620))))

(assert (=> b!334993 (= res!184846 (not (contains!2035 lt!159533 k0!1348)))))

(declare-fun getCurrentListMap!1489 (array!17389 array!17387 (_ BitVec 32) (_ BitVec 32) V!10187 V!10187 (_ BitVec 32) Int) ListLongMap!3929)

(assert (=> b!334993 (= lt!159533 (getCurrentListMap!1489 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528))))

(declare-fun b!334994 () Bool)

(declare-fun res!184844 () Bool)

(assert (=> b!334994 (=> (not res!184844) (not e!205618))))

(assert (=> b!334994 (= res!184844 (arrayContainsKey!0 _keys!1895 k0!1348 (index!14908 lt!159532)))))

(declare-fun b!334995 () Bool)

(declare-fun res!184843 () Bool)

(assert (=> b!334995 (=> (not res!184843) (not e!205619))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!334995 (= res!184843 (validKeyInArray!0 k0!1348))))

(declare-fun b!334996 () Bool)

(assert (=> b!334996 (= e!205620 e!205618)))

(declare-fun res!184848 () Bool)

(assert (=> b!334996 (=> (not res!184848) (not e!205618))))

(get-info :version)

(assert (=> b!334996 (= res!184848 (and ((_ is Found!3182) lt!159532) (= (select (arr!8225 _keys!1895) (index!14908 lt!159532)) k0!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17389 (_ BitVec 32)) SeekEntryResult!3182)

(assert (=> b!334996 (= lt!159532 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun b!334997 () Bool)

(assert (=> b!334997 (= e!205616 tp_is_empty!6907)))

(assert (= (and start!33706 res!184850) b!334990))

(assert (= (and b!334990 res!184845) b!334988))

(assert (= (and b!334988 res!184849) b!334992))

(assert (= (and b!334992 res!184847) b!334995))

(assert (= (and b!334995 res!184843) b!334993))

(assert (= (and b!334993 res!184846) b!334996))

(assert (= (and b!334996 res!184848) b!334994))

(assert (= (and b!334994 res!184844) b!334991))

(assert (= (and b!334987 condMapEmpty!11757) mapIsEmpty!11757))

(assert (= (and b!334987 (not condMapEmpty!11757)) mapNonEmpty!11757))

(assert (= (and mapNonEmpty!11757 ((_ is ValueCellFull!3110) mapValue!11757)) b!334997))

(assert (= (and b!334987 ((_ is ValueCellFull!3110) mapDefault!11757)) b!334989))

(assert (= start!33706 b!334987))

(declare-fun m!338531 () Bool)

(assert (=> b!334996 m!338531))

(declare-fun m!338533 () Bool)

(assert (=> b!334996 m!338533))

(declare-fun m!338535 () Bool)

(assert (=> b!334988 m!338535))

(declare-fun m!338537 () Bool)

(assert (=> b!334995 m!338537))

(declare-fun m!338539 () Bool)

(assert (=> b!334992 m!338539))

(declare-fun m!338541 () Bool)

(assert (=> b!334994 m!338541))

(assert (=> b!334991 m!338531))

(declare-fun m!338543 () Bool)

(assert (=> b!334991 m!338543))

(declare-fun m!338545 () Bool)

(assert (=> b!334991 m!338545))

(declare-fun m!338547 () Bool)

(assert (=> b!334991 m!338547))

(assert (=> b!334991 m!338531))

(declare-fun m!338549 () Bool)

(assert (=> b!334991 m!338549))

(declare-fun m!338551 () Bool)

(assert (=> start!33706 m!338551))

(declare-fun m!338553 () Bool)

(assert (=> start!33706 m!338553))

(declare-fun m!338555 () Bool)

(assert (=> start!33706 m!338555))

(declare-fun m!338557 () Bool)

(assert (=> mapNonEmpty!11757 m!338557))

(declare-fun m!338559 () Bool)

(assert (=> b!334993 m!338559))

(declare-fun m!338561 () Bool)

(assert (=> b!334993 m!338561))

(check-sat (not b!334994) (not b!334995) (not b_next!6955) tp_is_empty!6907 (not start!33706) (not b!334991) (not mapNonEmpty!11757) (not b!334996) (not b!334992) (not b!334988) (not b!334993) b_and!14109)
(check-sat b_and!14109 (not b_next!6955))
