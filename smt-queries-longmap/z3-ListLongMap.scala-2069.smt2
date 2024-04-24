; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35568 () Bool)

(assert start!35568)

(declare-fun b!356737 () Bool)

(declare-fun res!198035 () Bool)

(declare-fun e!218523 () Bool)

(assert (=> b!356737 (=> (not res!198035) (not e!218523))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19622 0))(
  ( (array!19623 (arr!9304 (Array (_ BitVec 32) (_ BitVec 64))) (size!9656 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19622)

(declare-datatypes ((V!11691 0))(
  ( (V!11692 (val!4062 Int)) )
))
(declare-datatypes ((ValueCell!3674 0))(
  ( (ValueCellFull!3674 (v!6257 V!11691)) (EmptyCell!3674) )
))
(declare-datatypes ((array!19624 0))(
  ( (array!19625 (arr!9305 (Array (_ BitVec 32) ValueCell!3674)) (size!9657 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19624)

(assert (=> b!356737 (= res!198035 (and (= (size!9657 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9656 _keys!1456) (size!9657 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!13560 () Bool)

(declare-fun mapRes!13560 () Bool)

(assert (=> mapIsEmpty!13560 mapRes!13560))

(declare-fun res!198037 () Bool)

(assert (=> start!35568 (=> (not res!198037) (not e!218523))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35568 (= res!198037 (validMask!0 mask!1842))))

(assert (=> start!35568 e!218523))

(declare-fun tp_is_empty!8035 () Bool)

(assert (=> start!35568 tp_is_empty!8035))

(assert (=> start!35568 true))

(declare-fun array_inv!6874 (array!19622) Bool)

(assert (=> start!35568 (array_inv!6874 _keys!1456)))

(declare-fun e!218527 () Bool)

(declare-fun array_inv!6875 (array!19624) Bool)

(assert (=> start!35568 (and (array_inv!6875 _values!1208) e!218527)))

(declare-fun b!356738 () Bool)

(declare-fun res!198038 () Bool)

(assert (=> b!356738 (=> (not res!198038) (not e!218523))))

(declare-fun from!1805 () (_ BitVec 32))

(assert (=> b!356738 (= res!198038 (and (bvsge from!1805 #b00000000000000000000000000000000) (bvslt from!1805 (size!9656 _keys!1456))))))

(declare-fun b!356739 () Bool)

(declare-fun res!198040 () Bool)

(assert (=> b!356739 (=> (not res!198040) (not e!218523))))

(declare-datatypes ((List!5285 0))(
  ( (Nil!5282) (Cons!5281 (h!6137 (_ BitVec 64)) (t!10427 List!5285)) )
))
(declare-fun arrayNoDuplicates!0 (array!19622 (_ BitVec 32) List!5285) Bool)

(assert (=> b!356739 (= res!198040 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5282))))

(declare-fun b!356740 () Bool)

(assert (=> b!356740 (= e!218523 (not true))))

(declare-fun k0!1077 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!19622 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!356740 (arrayContainsKey!0 _keys!1456 k0!1077 (bvadd #b00000000000000000000000000000001 from!1805))))

(declare-fun zeroValue!1150 () V!11691)

(declare-fun minValue!1150 () V!11691)

(declare-datatypes ((Unit!10971 0))(
  ( (Unit!10972) )
))
(declare-fun lt!165986 () Unit!10971)

(declare-fun lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!14 (array!19622 array!19624 (_ BitVec 32) (_ BitVec 32) V!11691 V!11691 (_ BitVec 64) (_ BitVec 32)) Unit!10971)

(assert (=> b!356740 (= lt!165986 (lemmaArrayContainsFromAndNotEqualThenContainsFromPlusOne!14 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 k0!1077 from!1805))))

(declare-fun b!356741 () Bool)

(declare-fun e!218525 () Bool)

(assert (=> b!356741 (= e!218525 tp_is_empty!8035)))

(declare-fun b!356742 () Bool)

(declare-fun res!198033 () Bool)

(assert (=> b!356742 (=> (not res!198033) (not e!218523))))

(assert (=> b!356742 (= res!198033 (arrayContainsKey!0 _keys!1456 k0!1077 from!1805))))

(declare-fun b!356743 () Bool)

(declare-fun res!198039 () Bool)

(assert (=> b!356743 (=> (not res!198039) (not e!218523))))

(assert (=> b!356743 (= res!198039 (not (= (select (arr!9304 _keys!1456) from!1805) k0!1077)))))

(declare-fun b!356744 () Bool)

(declare-fun e!218524 () Bool)

(assert (=> b!356744 (= e!218527 (and e!218524 mapRes!13560))))

(declare-fun condMapEmpty!13560 () Bool)

(declare-fun mapDefault!13560 () ValueCell!3674)

(assert (=> b!356744 (= condMapEmpty!13560 (= (arr!9305 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3674)) mapDefault!13560)))))

(declare-fun b!356745 () Bool)

(assert (=> b!356745 (= e!218524 tp_is_empty!8035)))

(declare-fun b!356746 () Bool)

(declare-fun res!198034 () Bool)

(assert (=> b!356746 (=> (not res!198034) (not e!218523))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!356746 (= res!198034 (validKeyInArray!0 k0!1077))))

(declare-fun b!356747 () Bool)

(declare-fun res!198036 () Bool)

(assert (=> b!356747 (=> (not res!198036) (not e!218523))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19622 (_ BitVec 32)) Bool)

(assert (=> b!356747 (= res!198036 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun mapNonEmpty!13560 () Bool)

(declare-fun tp!27537 () Bool)

(assert (=> mapNonEmpty!13560 (= mapRes!13560 (and tp!27537 e!218525))))

(declare-fun mapValue!13560 () ValueCell!3674)

(declare-fun mapKey!13560 () (_ BitVec 32))

(declare-fun mapRest!13560 () (Array (_ BitVec 32) ValueCell!3674))

(assert (=> mapNonEmpty!13560 (= (arr!9305 _values!1208) (store mapRest!13560 mapKey!13560 mapValue!13560))))

(assert (= (and start!35568 res!198037) b!356737))

(assert (= (and b!356737 res!198035) b!356747))

(assert (= (and b!356747 res!198036) b!356739))

(assert (= (and b!356739 res!198040) b!356746))

(assert (= (and b!356746 res!198034) b!356738))

(assert (= (and b!356738 res!198038) b!356742))

(assert (= (and b!356742 res!198033) b!356743))

(assert (= (and b!356743 res!198039) b!356740))

(assert (= (and b!356744 condMapEmpty!13560) mapIsEmpty!13560))

(assert (= (and b!356744 (not condMapEmpty!13560)) mapNonEmpty!13560))

(get-info :version)

(assert (= (and mapNonEmpty!13560 ((_ is ValueCellFull!3674) mapValue!13560)) b!356741))

(assert (= (and b!356744 ((_ is ValueCellFull!3674) mapDefault!13560)) b!356745))

(assert (= start!35568 b!356744))

(declare-fun m!355293 () Bool)

(assert (=> start!35568 m!355293))

(declare-fun m!355295 () Bool)

(assert (=> start!35568 m!355295))

(declare-fun m!355297 () Bool)

(assert (=> start!35568 m!355297))

(declare-fun m!355299 () Bool)

(assert (=> b!356743 m!355299))

(declare-fun m!355301 () Bool)

(assert (=> mapNonEmpty!13560 m!355301))

(declare-fun m!355303 () Bool)

(assert (=> b!356740 m!355303))

(declare-fun m!355305 () Bool)

(assert (=> b!356740 m!355305))

(declare-fun m!355307 () Bool)

(assert (=> b!356739 m!355307))

(declare-fun m!355309 () Bool)

(assert (=> b!356746 m!355309))

(declare-fun m!355311 () Bool)

(assert (=> b!356742 m!355311))

(declare-fun m!355313 () Bool)

(assert (=> b!356747 m!355313))

(check-sat (not start!35568) (not mapNonEmpty!13560) (not b!356739) (not b!356742) (not b!356746) (not b!356740) (not b!356747) tp_is_empty!8035)
(check-sat)
