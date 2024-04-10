; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35572 () Bool)

(assert start!35572)

(declare-fun b!356625 () Bool)

(declare-fun res!197921 () Bool)

(declare-fun e!218483 () Bool)

(assert (=> b!356625 (=> (not res!197921) (not e!218483))))

(declare-datatypes ((array!19619 0))(
  ( (array!19620 (arr!9303 (Array (_ BitVec 32) (_ BitVec 64))) (size!9655 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19619)

(declare-datatypes ((List!5374 0))(
  ( (Nil!5371) (Cons!5370 (h!6226 (_ BitVec 64)) (t!10524 List!5374)) )
))
(declare-fun arrayNoDuplicates!0 (array!19619 (_ BitVec 32) List!5374) Bool)

(assert (=> b!356625 (= res!197921 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5371))))

(declare-fun b!356626 () Bool)

(declare-fun res!197917 () Bool)

(assert (=> b!356626 (=> (not res!197917) (not e!218483))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19619 (_ BitVec 32)) Bool)

(assert (=> b!356626 (= res!197917 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!356627 () Bool)

(declare-fun res!197919 () Bool)

(assert (=> b!356627 (=> (not res!197919) (not e!218483))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356627 (= res!197919 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9655 _keys!1456))))))

(declare-fun b!356628 () Bool)

(declare-fun e!218484 () Bool)

(declare-fun tp_is_empty!8025 () Bool)

(assert (=> b!356628 (= e!218484 tp_is_empty!8025)))

(declare-fun b!356629 () Bool)

(declare-fun res!197916 () Bool)

(assert (=> b!356629 (=> (not res!197916) (not e!218483))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19619 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356629 (= res!197916 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun mapNonEmpty!13545 () Bool)

(declare-fun mapRes!13545 () Bool)

(declare-fun tp!27522 () Bool)

(declare-fun e!218482 () Bool)

(assert (=> mapNonEmpty!13545 (= mapRes!13545 (and tp!27522 e!218482))))

(declare-datatypes ((V!11677 0))(
  ( (V!11678 (val!4057 Int)) )
))
(declare-datatypes ((ValueCell!3669 0))(
  ( (ValueCellFull!3669 (v!6251 V!11677)) (EmptyCell!3669) )
))
(declare-fun mapRest!13545 () (Array (_ BitVec 32) ValueCell!3669))

(declare-fun mapKey!13545 () (_ BitVec 32))

(declare-datatypes ((array!19621 0))(
  ( (array!19622 (arr!9304 (Array (_ BitVec 32) ValueCell!3669)) (size!9656 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19621)

(declare-fun mapValue!13545 () ValueCell!3669)

(assert (=> mapNonEmpty!13545 (= (arr!9304 _values!1208) (store mapRest!13545 mapKey!13545 mapValue!13545))))

(declare-fun b!356630 () Bool)

(declare-fun res!197922 () Bool)

(assert (=> b!356630 (=> (not res!197922) (not e!218483))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!356630 (= res!197922 (and (= (size!9656 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9655 _keys!1456) (size!9656 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!356631 () Bool)

(assert (=> b!356631 (= e!218482 tp_is_empty!8025)))

(declare-fun b!356632 () Bool)

(declare-fun res!197920 () Bool)

(assert (=> b!356632 (=> (not res!197920) (not e!218483))))

(assert (=> b!356632 (= res!197920 (not (= (select (arr!9303 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356633 () Bool)

(assert (=> b!356633 (= e!218483 (not true))))

(assert (=> b!356633 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun minValue!1150 () V!11677)

(declare-datatypes ((Unit!10980 0))(
  ( (Unit!10981) )
))
(declare-fun lt!165953 () Unit!10980)

(declare-fun zeroValue!1150 () V!11677)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!9 (array!19619 array!19621 (_ BitVec 32) (_ BitVec 32) V!11677 V!11677 (_ BitVec 64) (_ BitVec 32)) Unit!10980)

(assert (=> b!356633 (= lt!165953 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!9 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356634 () Bool)

(declare-fun res!197918 () Bool)

(assert (=> b!356634 (=> (not res!197918) (not e!218483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356634 (= res!197918 (validKeyInArray!0 k0!1077))))

(declare-fun b!356635 () Bool)

(declare-fun e!218485 () Bool)

(assert (=> b!356635 (= e!218485 (and e!218484 mapRes!13545))))

(declare-fun condMapEmpty!13545 () Bool)

(declare-fun mapDefault!13545 () ValueCell!3669)

(assert (=> b!356635 (= condMapEmpty!13545 (= (arr!9304 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3669)) mapDefault!13545)))))

(declare-fun mapIsEmpty!13545 () Bool)

(assert (=> mapIsEmpty!13545 mapRes!13545))

(declare-fun res!197923 () Bool)

(assert (=> start!35572 (=> (not res!197923) (not e!218483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35572 (= res!197923 (validMask!0 mask!1842))))

(assert (=> start!35572 e!218483))

(assert (=> start!35572 tp_is_empty!8025))

(assert (=> start!35572 true))

(declare-fun array_inv!6836 (array!19619) Bool)

(assert (=> start!35572 (array_inv!6836 _keys!1456)))

(declare-fun array_inv!6837 (array!19621) Bool)

(assert (=> start!35572 (and (array_inv!6837 _values!1208) e!218485)))

(assert (= (and start!35572 res!197923) b!356630))

(assert (= (and b!356630 res!197922) b!356626))

(assert (= (and b!356626 res!197917) b!356625))

(assert (= (and b!356625 res!197921) b!356634))

(assert (= (and b!356634 res!197918) b!356627))

(assert (= (and b!356627 res!197919) b!356629))

(assert (= (and b!356629 res!197916) b!356632))

(assert (= (and b!356632 res!197920) b!356633))

(assert (= (and b!356635 condMapEmpty!13545) mapIsEmpty!13545))

(assert (= (and b!356635 (not condMapEmpty!13545)) mapNonEmpty!13545))

(get-info :version)

(assert (= (and mapNonEmpty!13545 ((_ is ValueCellFull!3669) mapValue!13545)) b!356631))

(assert (= (and b!356635 ((_ is ValueCellFull!3669) mapDefault!13545)) b!356628))

(assert (= start!35572 b!356635))

(declare-fun m!354959 () Bool)

(assert (=> mapNonEmpty!13545 m!354959))

(declare-fun m!354961 () Bool)

(assert (=> start!35572 m!354961))

(declare-fun m!354963 () Bool)

(assert (=> start!35572 m!354963))

(declare-fun m!354965 () Bool)

(assert (=> start!35572 m!354965))

(declare-fun m!354967 () Bool)

(assert (=> b!356629 m!354967))

(declare-fun m!354969 () Bool)

(assert (=> b!356634 m!354969))

(declare-fun m!354971 () Bool)

(assert (=> b!356633 m!354971))

(declare-fun m!354973 () Bool)

(assert (=> b!356633 m!354973))

(declare-fun m!354975 () Bool)

(assert (=> b!356625 m!354975))

(declare-fun m!354977 () Bool)

(assert (=> b!356626 m!354977))

(declare-fun m!354979 () Bool)

(assert (=> b!356632 m!354979))

(check-sat (not start!35572) tp_is_empty!8025 (not b!356625) (not mapNonEmpty!13545) (not b!356634) (not b!356629) (not b!356626) (not b!356633))
(check-sat)
