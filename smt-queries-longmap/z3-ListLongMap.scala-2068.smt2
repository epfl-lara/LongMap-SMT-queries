; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35578 () Bool)

(assert start!35578)

(declare-fun b!356724 () Bool)

(declare-fun res!197993 () Bool)

(declare-fun e!218530 () Bool)

(assert (=> b!356724 (=> (not res!197993) (not e!218530))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356724 (= res!197993 (validKeyInArray!0 k0!1077))))

(declare-fun mapIsEmpty!13554 () Bool)

(declare-fun mapRes!13554 () Bool)

(assert (=> mapIsEmpty!13554 mapRes!13554))

(declare-fun b!356726 () Bool)

(declare-fun res!197988 () Bool)

(assert (=> b!356726 (=> (not res!197988) (not e!218530))))

(declare-datatypes ((array!19631 0))(
  ( (array!19632 (arr!9309 (Array (_ BitVec 32) (_ BitVec 64))) (size!9661 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19631)

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun arrayContainsKey!0 (array!19631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356726 (= res!197988 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356727 () Bool)

(declare-fun e!218528 () Bool)

(declare-fun e!218527 () Bool)

(assert (=> b!356727 (= e!218528 (and e!218527 mapRes!13554))))

(declare-fun condMapEmpty!13554 () Bool)

(declare-datatypes ((V!11685 0))(
  ( (V!11686 (val!4060 Int)) )
))
(declare-datatypes ((ValueCell!3672 0))(
  ( (ValueCellFull!3672 (v!6254 V!11685)) (EmptyCell!3672) )
))
(declare-datatypes ((array!19633 0))(
  ( (array!19634 (arr!9310 (Array (_ BitVec 32) ValueCell!3672)) (size!9662 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19633)

(declare-fun mapDefault!13554 () ValueCell!3672)

(assert (=> b!356727 (= condMapEmpty!13554 (= (arr!9310 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3672)) mapDefault!13554)))))

(declare-fun b!356728 () Bool)

(assert (=> b!356728 (= e!218530 (not true))))

(assert (=> b!356728 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11685)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11685)

(declare-datatypes ((Unit!10984 0))(
  ( (Unit!10985) )
))
(declare-fun lt!165962 () Unit!10984)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!11 (array!19631 array!19633 (_ BitVec 32) (_ BitVec 32) V!11685 V!11685 (_ BitVec 64) (_ BitVec 32)) Unit!10984)

(assert (=> b!356728 (= lt!165962 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!11 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356729 () Bool)

(declare-fun res!197991 () Bool)

(assert (=> b!356729 (=> (not res!197991) (not e!218530))))

(assert (=> b!356729 (= res!197991 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9661 _keys!1456))))))

(declare-fun b!356730 () Bool)

(declare-fun e!218529 () Bool)

(declare-fun tp_is_empty!8031 () Bool)

(assert (=> b!356730 (= e!218529 tp_is_empty!8031)))

(declare-fun b!356731 () Bool)

(declare-fun res!197989 () Bool)

(assert (=> b!356731 (=> (not res!197989) (not e!218530))))

(assert (=> b!356731 (= res!197989 (and (= (size!9662 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9661 _keys!1456) (size!9662 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356725 () Bool)

(declare-fun res!197990 () Bool)

(assert (=> b!356725 (=> (not res!197990) (not e!218530))))

(assert (=> b!356725 (= res!197990 (not (= (select (arr!9309 _keys!1456) from!1805) k0!1077)))))

(declare-fun res!197994 () Bool)

(assert (=> start!35578 (=> (not res!197994) (not e!218530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35578 (= res!197994 (validMask!0 mask!1842))))

(assert (=> start!35578 e!218530))

(assert (=> start!35578 tp_is_empty!8031))

(assert (=> start!35578 true))

(declare-fun array_inv!6842 (array!19631) Bool)

(assert (=> start!35578 (array_inv!6842 _keys!1456)))

(declare-fun array_inv!6843 (array!19633) Bool)

(assert (=> start!35578 (and (array_inv!6843 _values!1208) e!218528)))

(declare-fun b!356732 () Bool)

(declare-fun res!197992 () Bool)

(assert (=> b!356732 (=> (not res!197992) (not e!218530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19631 (_ BitVec 32)) Bool)

(assert (=> b!356732 (= res!197992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356733 () Bool)

(assert (=> b!356733 (= e!218527 tp_is_empty!8031)))

(declare-fun b!356734 () Bool)

(declare-fun res!197995 () Bool)

(assert (=> b!356734 (=> (not res!197995) (not e!218530))))

(declare-datatypes ((List!5376 0))(
  ( (Nil!5373) (Cons!5372 (h!6228 (_ BitVec 64)) (t!10526 List!5376)) )
))
(declare-fun arrayNoDuplicates!0 (array!19631 (_ BitVec 32) List!5376) Bool)

(assert (=> b!356734 (= res!197995 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5373))))

(declare-fun mapNonEmpty!13554 () Bool)

(declare-fun tp!27531 () Bool)

(assert (=> mapNonEmpty!13554 (= mapRes!13554 (and tp!27531 e!218529))))

(declare-fun mapRest!13554 () (Array (_ BitVec 32) ValueCell!3672))

(declare-fun mapKey!13554 () (_ BitVec 32))

(declare-fun mapValue!13554 () ValueCell!3672)

(assert (=> mapNonEmpty!13554 (= (arr!9310 _values!1208) (store mapRest!13554 mapKey!13554 mapValue!13554))))

(assert (= (and start!35578 res!197994) b!356731))

(assert (= (and b!356731 res!197989) b!356732))

(assert (= (and b!356732 res!197992) b!356734))

(assert (= (and b!356734 res!197995) b!356724))

(assert (= (and b!356724 res!197993) b!356729))

(assert (= (and b!356729 res!197991) b!356726))

(assert (= (and b!356726 res!197988) b!356725))

(assert (= (and b!356725 res!197990) b!356728))

(assert (= (and b!356727 condMapEmpty!13554) mapIsEmpty!13554))

(assert (= (and b!356727 (not condMapEmpty!13554)) mapNonEmpty!13554))

(get-info :version)

(assert (= (and mapNonEmpty!13554 ((_ is ValueCellFull!3672) mapValue!13554)) b!356730))

(assert (= (and b!356727 ((_ is ValueCellFull!3672) mapDefault!13554)) b!356733))

(assert (= start!35578 b!356727))

(declare-fun m!355025 () Bool)

(assert (=> b!356732 m!355025))

(declare-fun m!355027 () Bool)

(assert (=> b!356726 m!355027))

(declare-fun m!355029 () Bool)

(assert (=> b!356734 m!355029))

(declare-fun m!355031 () Bool)

(assert (=> b!356725 m!355031))

(declare-fun m!355033 () Bool)

(assert (=> start!35578 m!355033))

(declare-fun m!355035 () Bool)

(assert (=> start!35578 m!355035))

(declare-fun m!355037 () Bool)

(assert (=> start!35578 m!355037))

(declare-fun m!355039 () Bool)

(assert (=> b!356728 m!355039))

(declare-fun m!355041 () Bool)

(assert (=> b!356728 m!355041))

(declare-fun m!355043 () Bool)

(assert (=> mapNonEmpty!13554 m!355043))

(declare-fun m!355045 () Bool)

(assert (=> b!356724 m!355045))

(check-sat (not start!35578) (not b!356734) (not b!356732) (not mapNonEmpty!13554) (not b!356728) (not b!356724) tp_is_empty!8031 (not b!356726))
(check-sat)
