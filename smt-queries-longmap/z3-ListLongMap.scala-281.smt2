; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4570 () Bool)

(assert start!4570)

(declare-fun b_free!1273 () Bool)

(declare-fun b_next!1273 () Bool)

(assert (=> start!4570 (= b_free!1273 (not b_next!1273))))

(declare-fun tp!5265 () Bool)

(declare-fun b_and!2091 () Bool)

(assert (=> start!4570 (= tp!5265 b_and!2091)))

(declare-fun b!35664 () Bool)

(declare-fun e!22528 () Bool)

(declare-fun e!22529 () Bool)

(declare-fun mapRes!1996 () Bool)

(assert (=> b!35664 (= e!22528 (and e!22529 mapRes!1996))))

(declare-fun condMapEmpty!1996 () Bool)

(declare-datatypes ((V!1995 0))(
  ( (V!1996 (val!840 Int)) )
))
(declare-datatypes ((ValueCell!614 0))(
  ( (ValueCellFull!614 (v!1938 V!1995)) (EmptyCell!614) )
))
(declare-datatypes ((array!2455 0))(
  ( (array!2456 (arr!1172 (Array (_ BitVec 32) ValueCell!614)) (size!1273 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2455)

(declare-fun mapDefault!1996 () ValueCell!614)

(assert (=> b!35664 (= condMapEmpty!1996 (= (arr!1172 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!614)) mapDefault!1996)))))

(declare-fun b!35665 () Bool)

(declare-fun res!21637 () Bool)

(declare-fun e!22526 () Bool)

(assert (=> b!35665 (=> (not res!21637) (not e!22526))))

(declare-datatypes ((array!2457 0))(
  ( (array!2458 (arr!1173 (Array (_ BitVec 32) (_ BitVec 64))) (size!1274 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2457)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2457 (_ BitVec 32)) Bool)

(assert (=> b!35665 (= res!21637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!35666 () Bool)

(declare-fun e!22527 () Bool)

(declare-fun tp_is_empty!1627 () Bool)

(assert (=> b!35666 (= e!22527 tp_is_empty!1627)))

(declare-fun b!35667 () Bool)

(declare-fun res!21642 () Bool)

(assert (=> b!35667 (=> (not res!21642) (not e!22526))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!35667 (= res!21642 (and (= (size!1273 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1274 _keys!1833) (size!1273 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!35668 () Bool)

(declare-fun e!22531 () Bool)

(declare-fun e!22532 () Bool)

(assert (=> b!35668 (= e!22531 e!22532)))

(declare-fun res!21638 () Bool)

(assert (=> b!35668 (=> (not res!21638) (not e!22532))))

(declare-datatypes ((SeekEntryResult!155 0))(
  ( (MissingZero!155 (index!2742 (_ BitVec 32))) (Found!155 (index!2743 (_ BitVec 32))) (Intermediate!155 (undefined!967 Bool) (index!2744 (_ BitVec 32)) (x!7035 (_ BitVec 32))) (Undefined!155) (MissingVacant!155 (index!2745 (_ BitVec 32))) )
))
(declare-fun lt!13149 () SeekEntryResult!155)

(get-info :version)

(assert (=> b!35668 (= res!21638 ((_ is Found!155) lt!13149))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2457 (_ BitVec 32)) SeekEntryResult!155)

(assert (=> b!35668 (= lt!13149 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!35669 () Bool)

(declare-fun res!21636 () Bool)

(assert (=> b!35669 (=> (not res!21636) (not e!22531))))

(declare-fun arrayContainsKey!0 (array!2457 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!35669 (= res!21636 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun res!21635 () Bool)

(assert (=> start!4570 (=> (not res!21635) (not e!22526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4570 (= res!21635 (validMask!0 mask!2294))))

(assert (=> start!4570 e!22526))

(assert (=> start!4570 true))

(assert (=> start!4570 tp!5265))

(declare-fun array_inv!805 (array!2455) Bool)

(assert (=> start!4570 (and (array_inv!805 _values!1501) e!22528)))

(declare-fun array_inv!806 (array!2457) Bool)

(assert (=> start!4570 (array_inv!806 _keys!1833)))

(assert (=> start!4570 tp_is_empty!1627))

(declare-fun b!35670 () Bool)

(assert (=> b!35670 (= e!22526 e!22531)))

(declare-fun res!21639 () Bool)

(assert (=> b!35670 (=> (not res!21639) (not e!22531))))

(declare-datatypes ((tuple2!1332 0))(
  ( (tuple2!1333 (_1!677 (_ BitVec 64)) (_2!677 V!1995)) )
))
(declare-datatypes ((List!928 0))(
  ( (Nil!925) (Cons!924 (h!1491 tuple2!1332) (t!3633 List!928)) )
))
(declare-datatypes ((ListLongMap!903 0))(
  ( (ListLongMap!904 (toList!467 List!928)) )
))
(declare-fun lt!13150 () ListLongMap!903)

(declare-fun contains!418 (ListLongMap!903 (_ BitVec 64)) Bool)

(assert (=> b!35670 (= res!21639 (not (contains!418 lt!13150 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1995)

(declare-fun minValue!1443 () V!1995)

(declare-fun getCurrentListMap!288 (array!2457 array!2455 (_ BitVec 32) (_ BitVec 32) V!1995 V!1995 (_ BitVec 32) Int) ListLongMap!903)

(assert (=> b!35670 (= lt!13150 (getCurrentListMap!288 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1996 () Bool)

(assert (=> mapIsEmpty!1996 mapRes!1996))

(declare-fun mapNonEmpty!1996 () Bool)

(declare-fun tp!5266 () Bool)

(assert (=> mapNonEmpty!1996 (= mapRes!1996 (and tp!5266 e!22527))))

(declare-fun mapRest!1996 () (Array (_ BitVec 32) ValueCell!614))

(declare-fun mapValue!1996 () ValueCell!614)

(declare-fun mapKey!1996 () (_ BitVec 32))

(assert (=> mapNonEmpty!1996 (= (arr!1172 _values!1501) (store mapRest!1996 mapKey!1996 mapValue!1996))))

(declare-fun b!35671 () Bool)

(assert (=> b!35671 (= e!22529 tp_is_empty!1627)))

(declare-fun b!35672 () Bool)

(declare-fun res!21641 () Bool)

(assert (=> b!35672 (=> (not res!21641) (not e!22526))))

(declare-datatypes ((List!929 0))(
  ( (Nil!926) (Cons!925 (h!1492 (_ BitVec 64)) (t!3634 List!929)) )
))
(declare-fun arrayNoDuplicates!0 (array!2457 (_ BitVec 32) List!929) Bool)

(assert (=> b!35672 (= res!21641 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!926))))

(declare-fun b!35673 () Bool)

(declare-fun res!21640 () Bool)

(assert (=> b!35673 (=> (not res!21640) (not e!22526))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!35673 (= res!21640 (validKeyInArray!0 k0!1304))))

(declare-fun b!35674 () Bool)

(assert (=> b!35674 (= e!22532 (not true))))

(assert (=> b!35674 (contains!418 lt!13150 (select (arr!1173 _keys!1833) (index!2743 lt!13149)))))

(declare-datatypes ((Unit!794 0))(
  ( (Unit!795) )
))
(declare-fun lt!13151 () Unit!794)

(declare-fun lemmaValidKeyInArrayIsInListMap!71 (array!2457 array!2455 (_ BitVec 32) (_ BitVec 32) V!1995 V!1995 (_ BitVec 32) Int) Unit!794)

(assert (=> b!35674 (= lt!13151 (lemmaValidKeyInArrayIsInListMap!71 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2743 lt!13149) defaultEntry!1504))))

(assert (= (and start!4570 res!21635) b!35667))

(assert (= (and b!35667 res!21642) b!35665))

(assert (= (and b!35665 res!21637) b!35672))

(assert (= (and b!35672 res!21641) b!35673))

(assert (= (and b!35673 res!21640) b!35670))

(assert (= (and b!35670 res!21639) b!35669))

(assert (= (and b!35669 res!21636) b!35668))

(assert (= (and b!35668 res!21638) b!35674))

(assert (= (and b!35664 condMapEmpty!1996) mapIsEmpty!1996))

(assert (= (and b!35664 (not condMapEmpty!1996)) mapNonEmpty!1996))

(assert (= (and mapNonEmpty!1996 ((_ is ValueCellFull!614) mapValue!1996)) b!35666))

(assert (= (and b!35664 ((_ is ValueCellFull!614) mapDefault!1996)) b!35671))

(assert (= start!4570 b!35664))

(declare-fun m!28573 () Bool)

(assert (=> b!35673 m!28573))

(declare-fun m!28575 () Bool)

(assert (=> b!35669 m!28575))

(declare-fun m!28577 () Bool)

(assert (=> b!35665 m!28577))

(declare-fun m!28579 () Bool)

(assert (=> b!35668 m!28579))

(declare-fun m!28581 () Bool)

(assert (=> start!4570 m!28581))

(declare-fun m!28583 () Bool)

(assert (=> start!4570 m!28583))

(declare-fun m!28585 () Bool)

(assert (=> start!4570 m!28585))

(declare-fun m!28587 () Bool)

(assert (=> b!35670 m!28587))

(declare-fun m!28589 () Bool)

(assert (=> b!35670 m!28589))

(declare-fun m!28591 () Bool)

(assert (=> b!35672 m!28591))

(declare-fun m!28593 () Bool)

(assert (=> b!35674 m!28593))

(assert (=> b!35674 m!28593))

(declare-fun m!28595 () Bool)

(assert (=> b!35674 m!28595))

(declare-fun m!28597 () Bool)

(assert (=> b!35674 m!28597))

(declare-fun m!28599 () Bool)

(assert (=> mapNonEmpty!1996 m!28599))

(check-sat (not b!35673) b_and!2091 (not start!4570) (not mapNonEmpty!1996) (not b!35669) (not b!35672) tp_is_empty!1627 (not b_next!1273) (not b!35668) (not b!35670) (not b!35665) (not b!35674))
(check-sat b_and!2091 (not b_next!1273))
