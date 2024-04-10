; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77824 () Bool)

(assert start!77824)

(declare-fun b_free!16383 () Bool)

(declare-fun b_next!16383 () Bool)

(assert (=> start!77824 (= b_free!16383 (not b_next!16383))))

(declare-fun tp!57414 () Bool)

(declare-fun b_and!26923 () Bool)

(assert (=> start!77824 (= tp!57414 b_and!26923)))

(declare-fun b!908514 () Bool)

(declare-fun e!509195 () Bool)

(declare-fun e!509198 () Bool)

(assert (=> b!908514 (= e!509195 (not e!509198))))

(declare-fun res!613196 () Bool)

(assert (=> b!908514 (=> res!613196 e!509198)))

(declare-fun i!717 () (_ BitVec 32))

(declare-datatypes ((array!53636 0))(
  ( (array!53637 (arr!25776 (Array (_ BitVec 32) (_ BitVec 64))) (size!26235 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53636)

(assert (=> b!908514 (= res!613196 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26235 _keys!1386))))))

(declare-datatypes ((V!30033 0))(
  ( (V!30034 (val!9451 Int)) )
))
(declare-datatypes ((ValueCell!8919 0))(
  ( (ValueCellFull!8919 (v!11958 V!30033)) (EmptyCell!8919) )
))
(declare-datatypes ((array!53638 0))(
  ( (array!53639 (arr!25777 (Array (_ BitVec 32) ValueCell!8919)) (size!26236 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53638)

(declare-fun defaultEntry!1160 () Int)

(declare-fun lt!409741 () V!30033)

(declare-fun get!13569 (ValueCell!8919 V!30033) V!30033)

(declare-fun dynLambda!1378 (Int (_ BitVec 64)) V!30033)

(assert (=> b!908514 (= lt!409741 (get!13569 (select (arr!25777 _values!1152) i!717) (dynLambda!1378 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!53636 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!908514 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!30033)

(declare-datatypes ((Unit!30836 0))(
  ( (Unit!30837) )
))
(declare-fun lt!409742 () Unit!30836)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!30033)

(declare-fun lemmaKeyInListMapIsInArray!250 (array!53636 array!53638 (_ BitVec 32) (_ BitVec 32) V!30033 V!30033 (_ BitVec 64) Int) Unit!30836)

(assert (=> b!908514 (= lt!409742 (lemmaKeyInListMapIsInArray!250 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!908515 () Bool)

(declare-fun e!509199 () Bool)

(assert (=> b!908515 (= e!509199 e!509195)))

(declare-fun res!613195 () Bool)

(assert (=> b!908515 (=> (not res!613195) (not e!509195))))

(declare-datatypes ((tuple2!12316 0))(
  ( (tuple2!12317 (_1!6169 (_ BitVec 64)) (_2!6169 V!30033)) )
))
(declare-datatypes ((List!18111 0))(
  ( (Nil!18108) (Cons!18107 (h!19253 tuple2!12316) (t!25666 List!18111)) )
))
(declare-datatypes ((ListLongMap!11013 0))(
  ( (ListLongMap!11014 (toList!5522 List!18111)) )
))
(declare-fun lt!409745 () ListLongMap!11013)

(declare-fun contains!4565 (ListLongMap!11013 (_ BitVec 64)) Bool)

(assert (=> b!908515 (= res!613195 (contains!4565 lt!409745 k0!1033))))

(declare-fun getCurrentListMap!2785 (array!53636 array!53638 (_ BitVec 32) (_ BitVec 32) V!30033 V!30033 (_ BitVec 32) Int) ListLongMap!11013)

(assert (=> b!908515 (= lt!409745 (getCurrentListMap!2785 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!908516 () Bool)

(declare-fun res!613198 () Bool)

(assert (=> b!908516 (=> (not res!613198) (not e!509199))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53636 (_ BitVec 32)) Bool)

(assert (=> b!908516 (= res!613198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!908517 () Bool)

(declare-fun res!613197 () Bool)

(assert (=> b!908517 (=> (not res!613197) (not e!509195))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!908517 (= res!613197 (inRange!0 i!717 mask!1756))))

(declare-fun b!908518 () Bool)

(declare-fun e!509196 () Bool)

(declare-fun e!509194 () Bool)

(declare-fun mapRes!29917 () Bool)

(assert (=> b!908518 (= e!509196 (and e!509194 mapRes!29917))))

(declare-fun condMapEmpty!29917 () Bool)

(declare-fun mapDefault!29917 () ValueCell!8919)

(assert (=> b!908518 (= condMapEmpty!29917 (= (arr!25777 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8919)) mapDefault!29917)))))

(declare-fun b!908519 () Bool)

(declare-fun res!613200 () Bool)

(declare-fun e!509192 () Bool)

(assert (=> b!908519 (=> res!613200 e!509192)))

(declare-fun lt!409744 () ListLongMap!11013)

(declare-fun apply!503 (ListLongMap!11013 (_ BitVec 64)) V!30033)

(assert (=> b!908519 (= res!613200 (not (= (apply!503 lt!409744 k0!1033) lt!409741)))))

(declare-fun b!908520 () Bool)

(declare-fun res!613199 () Bool)

(assert (=> b!908520 (=> (not res!613199) (not e!509195))))

(assert (=> b!908520 (= res!613199 (and (= (select (arr!25776 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!29917 () Bool)

(declare-fun tp!57413 () Bool)

(declare-fun e!509193 () Bool)

(assert (=> mapNonEmpty!29917 (= mapRes!29917 (and tp!57413 e!509193))))

(declare-fun mapKey!29917 () (_ BitVec 32))

(declare-fun mapRest!29917 () (Array (_ BitVec 32) ValueCell!8919))

(declare-fun mapValue!29917 () ValueCell!8919)

(assert (=> mapNonEmpty!29917 (= (arr!25777 _values!1152) (store mapRest!29917 mapKey!29917 mapValue!29917))))

(declare-fun b!908522 () Bool)

(assert (=> b!908522 (= e!509198 e!509192)))

(declare-fun res!613201 () Bool)

(assert (=> b!908522 (=> res!613201 e!509192)))

(assert (=> b!908522 (= res!613201 (not (contains!4565 lt!409744 k0!1033)))))

(assert (=> b!908522 (= lt!409744 (getCurrentListMap!2785 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!908523 () Bool)

(declare-fun tp_is_empty!18801 () Bool)

(assert (=> b!908523 (= e!509193 tp_is_empty!18801)))

(declare-fun b!908524 () Bool)

(declare-fun res!613194 () Bool)

(assert (=> b!908524 (=> (not res!613194) (not e!509199))))

(assert (=> b!908524 (= res!613194 (and (= (size!26236 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26235 _keys!1386) (size!26236 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!908525 () Bool)

(assert (=> b!908525 (= e!509192 true)))

(assert (=> b!908525 (= (apply!503 lt!409745 k0!1033) lt!409741)))

(declare-fun lt!409743 () Unit!30836)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!55 (array!53636 array!53638 (_ BitVec 32) (_ BitVec 32) V!30033 V!30033 (_ BitVec 64) V!30033 (_ BitVec 32) Int) Unit!30836)

(assert (=> b!908525 (= lt!409743 (lemmaListMapApplyFromThenApplyFromZero!55 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!409741 i!717 defaultEntry!1160))))

(declare-fun mapIsEmpty!29917 () Bool)

(assert (=> mapIsEmpty!29917 mapRes!29917))

(declare-fun b!908526 () Bool)

(assert (=> b!908526 (= e!509194 tp_is_empty!18801)))

(declare-fun res!613203 () Bool)

(assert (=> start!77824 (=> (not res!613203) (not e!509199))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77824 (= res!613203 (validMask!0 mask!1756))))

(assert (=> start!77824 e!509199))

(declare-fun array_inv!20180 (array!53638) Bool)

(assert (=> start!77824 (and (array_inv!20180 _values!1152) e!509196)))

(assert (=> start!77824 tp!57414))

(assert (=> start!77824 true))

(assert (=> start!77824 tp_is_empty!18801))

(declare-fun array_inv!20181 (array!53636) Bool)

(assert (=> start!77824 (array_inv!20181 _keys!1386)))

(declare-fun b!908521 () Bool)

(declare-fun res!613202 () Bool)

(assert (=> b!908521 (=> (not res!613202) (not e!509199))))

(declare-datatypes ((List!18112 0))(
  ( (Nil!18109) (Cons!18108 (h!19254 (_ BitVec 64)) (t!25667 List!18112)) )
))
(declare-fun arrayNoDuplicates!0 (array!53636 (_ BitVec 32) List!18112) Bool)

(assert (=> b!908521 (= res!613202 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18109))))

(assert (= (and start!77824 res!613203) b!908524))

(assert (= (and b!908524 res!613194) b!908516))

(assert (= (and b!908516 res!613198) b!908521))

(assert (= (and b!908521 res!613202) b!908515))

(assert (= (and b!908515 res!613195) b!908517))

(assert (= (and b!908517 res!613197) b!908520))

(assert (= (and b!908520 res!613199) b!908514))

(assert (= (and b!908514 (not res!613196)) b!908522))

(assert (= (and b!908522 (not res!613201)) b!908519))

(assert (= (and b!908519 (not res!613200)) b!908525))

(assert (= (and b!908518 condMapEmpty!29917) mapIsEmpty!29917))

(assert (= (and b!908518 (not condMapEmpty!29917)) mapNonEmpty!29917))

(get-info :version)

(assert (= (and mapNonEmpty!29917 ((_ is ValueCellFull!8919) mapValue!29917)) b!908523))

(assert (= (and b!908518 ((_ is ValueCellFull!8919) mapDefault!29917)) b!908526))

(assert (= start!77824 b!908518))

(declare-fun b_lambda!13267 () Bool)

(assert (=> (not b_lambda!13267) (not b!908514)))

(declare-fun t!25665 () Bool)

(declare-fun tb!5405 () Bool)

(assert (=> (and start!77824 (= defaultEntry!1160 defaultEntry!1160) t!25665) tb!5405))

(declare-fun result!10607 () Bool)

(assert (=> tb!5405 (= result!10607 tp_is_empty!18801)))

(assert (=> b!908514 t!25665))

(declare-fun b_and!26925 () Bool)

(assert (= b_and!26923 (and (=> t!25665 result!10607) b_and!26925)))

(declare-fun m!843849 () Bool)

(assert (=> b!908522 m!843849))

(declare-fun m!843851 () Bool)

(assert (=> b!908522 m!843851))

(declare-fun m!843853 () Bool)

(assert (=> b!908514 m!843853))

(declare-fun m!843855 () Bool)

(assert (=> b!908514 m!843855))

(declare-fun m!843857 () Bool)

(assert (=> b!908514 m!843857))

(declare-fun m!843859 () Bool)

(assert (=> b!908514 m!843859))

(assert (=> b!908514 m!843853))

(assert (=> b!908514 m!843857))

(declare-fun m!843861 () Bool)

(assert (=> b!908514 m!843861))

(declare-fun m!843863 () Bool)

(assert (=> b!908520 m!843863))

(declare-fun m!843865 () Bool)

(assert (=> b!908515 m!843865))

(declare-fun m!843867 () Bool)

(assert (=> b!908515 m!843867))

(declare-fun m!843869 () Bool)

(assert (=> b!908516 m!843869))

(declare-fun m!843871 () Bool)

(assert (=> b!908521 m!843871))

(declare-fun m!843873 () Bool)

(assert (=> start!77824 m!843873))

(declare-fun m!843875 () Bool)

(assert (=> start!77824 m!843875))

(declare-fun m!843877 () Bool)

(assert (=> start!77824 m!843877))

(declare-fun m!843879 () Bool)

(assert (=> b!908517 m!843879))

(declare-fun m!843881 () Bool)

(assert (=> b!908525 m!843881))

(declare-fun m!843883 () Bool)

(assert (=> b!908525 m!843883))

(declare-fun m!843885 () Bool)

(assert (=> mapNonEmpty!29917 m!843885))

(declare-fun m!843887 () Bool)

(assert (=> b!908519 m!843887))

(check-sat (not mapNonEmpty!29917) (not b!908517) b_and!26925 tp_is_empty!18801 (not b!908525) (not b!908516) (not b!908514) (not b_next!16383) (not b_lambda!13267) (not b!908515) (not b!908519) (not b!908522) (not b!908521) (not start!77824))
(check-sat b_and!26925 (not b_next!16383))
