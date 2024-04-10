; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!838 () Bool)

(assert start!838)

(declare-fun b_free!231 () Bool)

(declare-fun b_next!231 () Bool)

(assert (=> start!838 (= b_free!231 (not b_next!231))))

(declare-fun tp!922 () Bool)

(declare-fun b_and!377 () Bool)

(assert (=> start!838 (= tp!922 b_and!377)))

(declare-fun b!6665 () Bool)

(declare-fun e!3679 () Bool)

(declare-datatypes ((array!551 0))(
  ( (array!552 (arr!264 (Array (_ BitVec 32) (_ BitVec 64))) (size!326 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!551)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!551 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!6665 (= e!3679 (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6666 () Bool)

(declare-fun e!3677 () Bool)

(assert (=> b!6666 (= e!3677 true)))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!23 0))(
  ( (MissingZero!23 (index!2211 (_ BitVec 32))) (Found!23 (index!2212 (_ BitVec 32))) (Intermediate!23 (undefined!835 Bool) (index!2213 (_ BitVec 32)) (x!2545 (_ BitVec 32))) (Undefined!23) (MissingVacant!23 (index!2214 (_ BitVec 32))) )
))
(declare-fun lt!1278 () SeekEntryResult!23)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!551 (_ BitVec 32)) SeekEntryResult!23)

(assert (=> b!6666 (= lt!1278 (seekEntryOrOpen!0 k0!1278 _keys!1806 mask!2250))))

(declare-fun b!6667 () Bool)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!6667 (= e!3679 (ite (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1413 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!6668 () Bool)

(declare-fun res!6964 () Bool)

(declare-fun e!3681 () Bool)

(assert (=> b!6668 (=> (not res!6964) (not e!3681))))

(declare-datatypes ((V!589 0))(
  ( (V!590 (val!160 Int)) )
))
(declare-datatypes ((ValueCell!138 0))(
  ( (ValueCellFull!138 (v!1251 V!589)) (EmptyCell!138) )
))
(declare-datatypes ((array!553 0))(
  ( (array!554 (arr!265 (Array (_ BitVec 32) ValueCell!138)) (size!327 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!553)

(assert (=> b!6668 (= res!6964 (and (= (size!327 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!326 _keys!1806) (size!327 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!434 () Bool)

(declare-fun mapRes!434 () Bool)

(declare-fun tp!923 () Bool)

(declare-fun e!3680 () Bool)

(assert (=> mapNonEmpty!434 (= mapRes!434 (and tp!923 e!3680))))

(declare-fun mapKey!434 () (_ BitVec 32))

(declare-fun mapValue!434 () ValueCell!138)

(declare-fun mapRest!434 () (Array (_ BitVec 32) ValueCell!138))

(assert (=> mapNonEmpty!434 (= (arr!265 _values!1492) (store mapRest!434 mapKey!434 mapValue!434))))

(declare-fun b!6669 () Bool)

(declare-fun res!6959 () Bool)

(assert (=> b!6669 (=> (not res!6959) (not e!3681))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!551 (_ BitVec 32)) Bool)

(assert (=> b!6669 (= res!6959 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!6670 () Bool)

(declare-fun e!3676 () Bool)

(assert (=> b!6670 (= e!3676 e!3677)))

(declare-fun res!6962 () Bool)

(assert (=> b!6670 (=> res!6962 e!3677)))

(assert (=> b!6670 (= res!6962 (not (= (size!326 _keys!1806) (bvadd #b00000000000000000000000000000001 mask!2250))))))

(declare-fun lt!1277 () (_ BitVec 32))

(assert (=> b!6670 (arrayForallSeekEntryOrOpenFound!0 lt!1277 _keys!1806 mask!2250)))

(declare-datatypes ((Unit!117 0))(
  ( (Unit!118) )
))
(declare-fun lt!1275 () Unit!117)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!551 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!117)

(assert (=> b!6670 (= lt!1275 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1806 mask!2250 #b00000000000000000000000000000000 lt!1277))))

(declare-fun arrayScanForKey!0 (array!551 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!6670 (= lt!1277 (arrayScanForKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000))))

(declare-fun b!6671 () Bool)

(declare-fun e!3678 () Bool)

(declare-fun tp_is_empty!309 () Bool)

(assert (=> b!6671 (= e!3678 tp_is_empty!309)))

(declare-fun b!6672 () Bool)

(declare-fun e!3682 () Bool)

(assert (=> b!6672 (= e!3682 (and e!3678 mapRes!434))))

(declare-fun condMapEmpty!434 () Bool)

(declare-fun mapDefault!434 () ValueCell!138)

(assert (=> b!6672 (= condMapEmpty!434 (= (arr!265 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!138)) mapDefault!434)))))

(declare-fun mapIsEmpty!434 () Bool)

(assert (=> mapIsEmpty!434 mapRes!434))

(declare-fun b!6673 () Bool)

(declare-fun res!6961 () Bool)

(assert (=> b!6673 (=> (not res!6961) (not e!3681))))

(declare-datatypes ((List!177 0))(
  ( (Nil!174) (Cons!173 (h!739 (_ BitVec 64)) (t!2312 List!177)) )
))
(declare-fun arrayNoDuplicates!0 (array!551 (_ BitVec 32) List!177) Bool)

(assert (=> b!6673 (= res!6961 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!174))))

(declare-fun b!6674 () Bool)

(assert (=> b!6674 (= e!3681 (not e!3676))))

(declare-fun res!6958 () Bool)

(assert (=> b!6674 (=> res!6958 e!3676)))

(assert (=> b!6674 (= res!6958 (not (arrayContainsKey!0 _keys!1806 k0!1278 #b00000000000000000000000000000000)))))

(assert (=> b!6674 e!3679))

(declare-fun c!479 () Bool)

(assert (=> b!6674 (= c!479 (and (not (= k0!1278 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1278 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!589)

(declare-fun lt!1276 () Unit!117)

(declare-fun zeroValue!1434 () V!589)

(declare-fun lemmaKeyInListMapIsInArray!41 (array!551 array!553 (_ BitVec 32) (_ BitVec 32) V!589 V!589 (_ BitVec 64) Int) Unit!117)

(assert (=> b!6674 (= lt!1276 (lemmaKeyInListMapIsInArray!41 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 k0!1278 defaultEntry!1495))))

(declare-fun b!6676 () Bool)

(declare-fun res!6960 () Bool)

(assert (=> b!6676 (=> (not res!6960) (not e!3681))))

(declare-datatypes ((tuple2!168 0))(
  ( (tuple2!169 (_1!84 (_ BitVec 64)) (_2!84 V!589)) )
))
(declare-datatypes ((List!178 0))(
  ( (Nil!175) (Cons!174 (h!740 tuple2!168) (t!2313 List!178)) )
))
(declare-datatypes ((ListLongMap!173 0))(
  ( (ListLongMap!174 (toList!102 List!178)) )
))
(declare-fun contains!76 (ListLongMap!173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!61 (array!551 array!553 (_ BitVec 32) (_ BitVec 32) V!589 V!589 (_ BitVec 32) Int) ListLongMap!173)

(assert (=> b!6676 (= res!6960 (contains!76 (getCurrentListMap!61 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!6677 () Bool)

(declare-fun res!6957 () Bool)

(assert (=> b!6677 (=> (not res!6957) (not e!3681))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!6677 (= res!6957 (validKeyInArray!0 k0!1278))))

(declare-fun b!6675 () Bool)

(assert (=> b!6675 (= e!3680 tp_is_empty!309)))

(declare-fun res!6963 () Bool)

(assert (=> start!838 (=> (not res!6963) (not e!3681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!838 (= res!6963 (validMask!0 mask!2250))))

(assert (=> start!838 e!3681))

(assert (=> start!838 tp!922))

(assert (=> start!838 true))

(declare-fun array_inv!191 (array!553) Bool)

(assert (=> start!838 (and (array_inv!191 _values!1492) e!3682)))

(assert (=> start!838 tp_is_empty!309))

(declare-fun array_inv!192 (array!551) Bool)

(assert (=> start!838 (array_inv!192 _keys!1806)))

(assert (= (and start!838 res!6963) b!6668))

(assert (= (and b!6668 res!6964) b!6669))

(assert (= (and b!6669 res!6959) b!6673))

(assert (= (and b!6673 res!6961) b!6676))

(assert (= (and b!6676 res!6960) b!6677))

(assert (= (and b!6677 res!6957) b!6674))

(assert (= (and b!6674 c!479) b!6665))

(assert (= (and b!6674 (not c!479)) b!6667))

(assert (= (and b!6674 (not res!6958)) b!6670))

(assert (= (and b!6670 (not res!6962)) b!6666))

(assert (= (and b!6672 condMapEmpty!434) mapIsEmpty!434))

(assert (= (and b!6672 (not condMapEmpty!434)) mapNonEmpty!434))

(get-info :version)

(assert (= (and mapNonEmpty!434 ((_ is ValueCellFull!138) mapValue!434)) b!6675))

(assert (= (and b!6672 ((_ is ValueCellFull!138) mapDefault!434)) b!6671))

(assert (= start!838 b!6672))

(declare-fun m!3887 () Bool)

(assert (=> start!838 m!3887))

(declare-fun m!3889 () Bool)

(assert (=> start!838 m!3889))

(declare-fun m!3891 () Bool)

(assert (=> start!838 m!3891))

(declare-fun m!3893 () Bool)

(assert (=> b!6677 m!3893))

(declare-fun m!3895 () Bool)

(assert (=> b!6676 m!3895))

(assert (=> b!6676 m!3895))

(declare-fun m!3897 () Bool)

(assert (=> b!6676 m!3897))

(declare-fun m!3899 () Bool)

(assert (=> b!6670 m!3899))

(declare-fun m!3901 () Bool)

(assert (=> b!6670 m!3901))

(declare-fun m!3903 () Bool)

(assert (=> b!6670 m!3903))

(declare-fun m!3905 () Bool)

(assert (=> mapNonEmpty!434 m!3905))

(declare-fun m!3907 () Bool)

(assert (=> b!6673 m!3907))

(declare-fun m!3909 () Bool)

(assert (=> b!6674 m!3909))

(declare-fun m!3911 () Bool)

(assert (=> b!6674 m!3911))

(assert (=> b!6665 m!3909))

(declare-fun m!3913 () Bool)

(assert (=> b!6666 m!3913))

(declare-fun m!3915 () Bool)

(assert (=> b!6669 m!3915))

(check-sat (not b!6673) tp_is_empty!309 b_and!377 (not b!6669) (not b_next!231) (not b!6666) (not b!6670) (not start!838) (not b!6677) (not mapNonEmpty!434) (not b!6676) (not b!6674) (not b!6665))
(check-sat b_and!377 (not b_next!231))
