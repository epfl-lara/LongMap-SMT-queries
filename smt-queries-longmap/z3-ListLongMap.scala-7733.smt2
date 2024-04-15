; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97120 () Bool)

(assert start!97120)

(declare-fun res!737001 () Bool)

(declare-fun e!630482 () Bool)

(assert (=> start!97120 (=> (not res!737001) (not e!630482))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!71582 0))(
  ( (array!71583 (arr!34445 (Array (_ BitVec 32) (_ BitVec 64))) (size!34983 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71582)

(assert (=> start!97120 (= res!737001 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34983 _keys!1208))))))

(assert (=> start!97120 e!630482))

(declare-fun array_inv!26562 (array!71582) Bool)

(assert (=> start!97120 (array_inv!26562 _keys!1208)))

(assert (=> start!97120 true))

(declare-datatypes ((V!41625 0))(
  ( (V!41626 (val!13743 Int)) )
))
(declare-datatypes ((ValueCell!12977 0))(
  ( (ValueCellFull!12977 (v!16375 V!41625)) (EmptyCell!12977) )
))
(declare-datatypes ((array!71584 0))(
  ( (array!71585 (arr!34446 (Array (_ BitVec 32) ValueCell!12977)) (size!34984 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71584)

(declare-fun e!630478 () Bool)

(declare-fun array_inv!26563 (array!71584) Bool)

(assert (=> start!97120 (and (array_inv!26563 _values!996) e!630478)))

(declare-fun b!1104587 () Bool)

(declare-fun e!630481 () Bool)

(declare-fun mapRes!42874 () Bool)

(assert (=> b!1104587 (= e!630478 (and e!630481 mapRes!42874))))

(declare-fun condMapEmpty!42874 () Bool)

(declare-fun mapDefault!42874 () ValueCell!12977)

(assert (=> b!1104587 (= condMapEmpty!42874 (= (arr!34446 _values!996) ((as const (Array (_ BitVec 32) ValueCell!12977)) mapDefault!42874)))))

(declare-fun b!1104588 () Bool)

(declare-fun res!737007 () Bool)

(assert (=> b!1104588 (=> (not res!737007) (not e!630482))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1104588 (= res!737007 (validKeyInArray!0 k0!934))))

(declare-fun b!1104589 () Bool)

(declare-fun e!630479 () Bool)

(assert (=> b!1104589 (= e!630482 e!630479)))

(declare-fun res!737002 () Bool)

(assert (=> b!1104589 (=> (not res!737002) (not e!630479))))

(declare-fun lt!494990 () array!71582)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71582 (_ BitVec 32)) Bool)

(assert (=> b!1104589 (= res!737002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!494990 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1104589 (= lt!494990 (array!71583 (store (arr!34445 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34983 _keys!1208)))))

(declare-fun b!1104590 () Bool)

(declare-fun res!737008 () Bool)

(assert (=> b!1104590 (=> (not res!737008) (not e!630482))))

(assert (=> b!1104590 (= res!737008 (= (select (arr!34445 _keys!1208) i!673) k0!934))))

(declare-fun b!1104591 () Bool)

(declare-fun res!737009 () Bool)

(assert (=> b!1104591 (=> (not res!737009) (not e!630482))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1104591 (= res!737009 (and (= (size!34984 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34983 _keys!1208) (size!34984 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1104592 () Bool)

(declare-fun res!737004 () Bool)

(assert (=> b!1104592 (=> (not res!737004) (not e!630482))))

(assert (=> b!1104592 (= res!737004 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1104593 () Bool)

(declare-fun tp_is_empty!27373 () Bool)

(assert (=> b!1104593 (= e!630481 tp_is_empty!27373)))

(declare-fun b!1104594 () Bool)

(declare-fun e!630480 () Bool)

(assert (=> b!1104594 (= e!630480 tp_is_empty!27373)))

(declare-fun b!1104595 () Bool)

(declare-fun res!737006 () Bool)

(assert (=> b!1104595 (=> (not res!737006) (not e!630482))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1104595 (= res!737006 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!42874 () Bool)

(declare-fun tp!81794 () Bool)

(assert (=> mapNonEmpty!42874 (= mapRes!42874 (and tp!81794 e!630480))))

(declare-fun mapRest!42874 () (Array (_ BitVec 32) ValueCell!12977))

(declare-fun mapValue!42874 () ValueCell!12977)

(declare-fun mapKey!42874 () (_ BitVec 32))

(assert (=> mapNonEmpty!42874 (= (arr!34446 _values!996) (store mapRest!42874 mapKey!42874 mapValue!42874))))

(declare-fun b!1104596 () Bool)

(declare-fun res!737003 () Bool)

(assert (=> b!1104596 (=> (not res!737003) (not e!630482))))

(assert (=> b!1104596 (= res!737003 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!34983 _keys!1208))))))

(declare-fun b!1104597 () Bool)

(assert (=> b!1104597 (= e!630479 false)))

(declare-fun lt!494991 () Bool)

(declare-datatypes ((List!24095 0))(
  ( (Nil!24092) (Cons!24091 (h!25300 (_ BitVec 64)) (t!34351 List!24095)) )
))
(declare-fun arrayNoDuplicates!0 (array!71582 (_ BitVec 32) List!24095) Bool)

(assert (=> b!1104597 (= lt!494991 (arrayNoDuplicates!0 lt!494990 #b00000000000000000000000000000000 Nil!24092))))

(declare-fun b!1104598 () Bool)

(declare-fun res!737005 () Bool)

(assert (=> b!1104598 (=> (not res!737005) (not e!630482))))

(assert (=> b!1104598 (= res!737005 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24092))))

(declare-fun mapIsEmpty!42874 () Bool)

(assert (=> mapIsEmpty!42874 mapRes!42874))

(assert (= (and start!97120 res!737001) b!1104595))

(assert (= (and b!1104595 res!737006) b!1104591))

(assert (= (and b!1104591 res!737009) b!1104592))

(assert (= (and b!1104592 res!737004) b!1104598))

(assert (= (and b!1104598 res!737005) b!1104596))

(assert (= (and b!1104596 res!737003) b!1104588))

(assert (= (and b!1104588 res!737007) b!1104590))

(assert (= (and b!1104590 res!737008) b!1104589))

(assert (= (and b!1104589 res!737002) b!1104597))

(assert (= (and b!1104587 condMapEmpty!42874) mapIsEmpty!42874))

(assert (= (and b!1104587 (not condMapEmpty!42874)) mapNonEmpty!42874))

(get-info :version)

(assert (= (and mapNonEmpty!42874 ((_ is ValueCellFull!12977) mapValue!42874)) b!1104594))

(assert (= (and b!1104587 ((_ is ValueCellFull!12977) mapDefault!42874)) b!1104593))

(assert (= start!97120 b!1104587))

(declare-fun m!1023745 () Bool)

(assert (=> b!1104590 m!1023745))

(declare-fun m!1023747 () Bool)

(assert (=> b!1104598 m!1023747))

(declare-fun m!1023749 () Bool)

(assert (=> b!1104588 m!1023749))

(declare-fun m!1023751 () Bool)

(assert (=> b!1104589 m!1023751))

(declare-fun m!1023753 () Bool)

(assert (=> b!1104589 m!1023753))

(declare-fun m!1023755 () Bool)

(assert (=> b!1104597 m!1023755))

(declare-fun m!1023757 () Bool)

(assert (=> b!1104592 m!1023757))

(declare-fun m!1023759 () Bool)

(assert (=> b!1104595 m!1023759))

(declare-fun m!1023761 () Bool)

(assert (=> start!97120 m!1023761))

(declare-fun m!1023763 () Bool)

(assert (=> start!97120 m!1023763))

(declare-fun m!1023765 () Bool)

(assert (=> mapNonEmpty!42874 m!1023765))

(check-sat (not start!97120) (not b!1104589) (not b!1104597) (not b!1104592) (not b!1104598) (not b!1104588) tp_is_empty!27373 (not mapNonEmpty!42874) (not b!1104595))
(check-sat)
