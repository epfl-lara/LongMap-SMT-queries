; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82774 () Bool)

(assert start!82774)

(declare-fun b_free!18739 () Bool)

(declare-fun b_next!18739 () Bool)

(assert (=> start!82774 (= b_free!18739 (not b_next!18739))))

(declare-fun tp!65338 () Bool)

(declare-fun b_and!30237 () Bool)

(assert (=> start!82774 (= tp!65338 b_and!30237)))

(declare-fun b!963669 () Bool)

(declare-fun res!644652 () Bool)

(declare-fun e!543510 () Bool)

(assert (=> b!963669 (=> (not res!644652) (not e!543510))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33705 0))(
  ( (V!33706 (val!10821 Int)) )
))
(declare-datatypes ((ValueCell!10289 0))(
  ( (ValueCellFull!10289 (v!13376 V!33705)) (EmptyCell!10289) )
))
(declare-datatypes ((array!59196 0))(
  ( (array!59197 (arr!28462 (Array (_ BitVec 32) ValueCell!10289)) (size!28942 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59196)

(declare-datatypes ((array!59198 0))(
  ( (array!59199 (arr!28463 (Array (_ BitVec 32) (_ BitVec 64))) (size!28943 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59198)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!963669 (= res!644652 (and (= (size!28942 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28943 _keys!1686) (size!28942 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963670 () Bool)

(declare-fun res!644649 () Bool)

(assert (=> b!963670 (=> (not res!644649) (not e!543510))))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!963670 (= res!644649 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28943 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28943 _keys!1686))))))

(declare-fun b!963671 () Bool)

(declare-fun res!644655 () Bool)

(assert (=> b!963671 (=> (not res!644655) (not e!543510))))

(declare-datatypes ((List!19732 0))(
  ( (Nil!19729) (Cons!19728 (h!20896 (_ BitVec 64)) (t!28087 List!19732)) )
))
(declare-fun arrayNoDuplicates!0 (array!59198 (_ BitVec 32) List!19732) Bool)

(assert (=> b!963671 (= res!644655 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19729))))

(declare-fun mapNonEmpty!34306 () Bool)

(declare-fun mapRes!34306 () Bool)

(declare-fun tp!65337 () Bool)

(declare-fun e!543512 () Bool)

(assert (=> mapNonEmpty!34306 (= mapRes!34306 (and tp!65337 e!543512))))

(declare-fun mapValue!34306 () ValueCell!10289)

(declare-fun mapRest!34306 () (Array (_ BitVec 32) ValueCell!10289))

(declare-fun mapKey!34306 () (_ BitVec 32))

(assert (=> mapNonEmpty!34306 (= (arr!28462 _values!1400) (store mapRest!34306 mapKey!34306 mapValue!34306))))

(declare-fun b!963672 () Bool)

(declare-fun e!543508 () Bool)

(declare-fun e!543509 () Bool)

(assert (=> b!963672 (= e!543508 (and e!543509 mapRes!34306))))

(declare-fun condMapEmpty!34306 () Bool)

(declare-fun mapDefault!34306 () ValueCell!10289)

(assert (=> b!963672 (= condMapEmpty!34306 (= (arr!28462 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10289)) mapDefault!34306)))))

(declare-fun b!963673 () Bool)

(declare-fun res!644653 () Bool)

(assert (=> b!963673 (=> (not res!644653) (not e!543510))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59198 (_ BitVec 32)) Bool)

(assert (=> b!963673 (= res!644653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!644648 () Bool)

(assert (=> start!82774 (=> (not res!644648) (not e!543510))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82774 (= res!644648 (validMask!0 mask!2110))))

(assert (=> start!82774 e!543510))

(assert (=> start!82774 true))

(declare-fun array_inv!22119 (array!59196) Bool)

(assert (=> start!82774 (and (array_inv!22119 _values!1400) e!543508)))

(declare-fun array_inv!22120 (array!59198) Bool)

(assert (=> start!82774 (array_inv!22120 _keys!1686)))

(assert (=> start!82774 tp!65338))

(declare-fun tp_is_empty!21541 () Bool)

(assert (=> start!82774 tp_is_empty!21541))

(declare-fun b!963674 () Bool)

(declare-fun res!644651 () Bool)

(assert (=> b!963674 (=> (not res!644651) (not e!543510))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963674 (= res!644651 (validKeyInArray!0 (select (arr!28463 _keys!1686) i!803)))))

(declare-fun b!963675 () Bool)

(assert (=> b!963675 (= e!543510 (not true))))

(declare-fun minValue!1342 () V!33705)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33705)

(declare-datatypes ((tuple2!13880 0))(
  ( (tuple2!13881 (_1!6951 (_ BitVec 64)) (_2!6951 V!33705)) )
))
(declare-datatypes ((List!19733 0))(
  ( (Nil!19730) (Cons!19729 (h!20897 tuple2!13880) (t!28088 List!19733)) )
))
(declare-datatypes ((ListLongMap!12579 0))(
  ( (ListLongMap!12580 (toList!6305 List!19733)) )
))
(declare-fun contains!5420 (ListLongMap!12579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3538 (array!59198 array!59196 (_ BitVec 32) (_ BitVec 32) V!33705 V!33705 (_ BitVec 32) Int) ListLongMap!12579)

(assert (=> b!963675 (contains!5420 (getCurrentListMap!3538 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28463 _keys!1686) i!803))))

(declare-datatypes ((Unit!32174 0))(
  ( (Unit!32175) )
))
(declare-fun lt!431273 () Unit!32174)

(declare-fun lemmaInListMapFromThenInFromMinusOne!1 (array!59198 array!59196 (_ BitVec 32) (_ BitVec 32) V!33705 V!33705 (_ BitVec 32) (_ BitVec 32) Int) Unit!32174)

(assert (=> b!963675 (= lt!431273 (lemmaInListMapFromThenInFromMinusOne!1 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!963676 () Bool)

(declare-fun res!644650 () Bool)

(assert (=> b!963676 (=> (not res!644650) (not e!543510))))

(assert (=> b!963676 (= res!644650 (contains!5420 (getCurrentListMap!3538 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28463 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34306 () Bool)

(assert (=> mapIsEmpty!34306 mapRes!34306))

(declare-fun b!963677 () Bool)

(assert (=> b!963677 (= e!543509 tp_is_empty!21541)))

(declare-fun b!963678 () Bool)

(declare-fun res!644654 () Bool)

(assert (=> b!963678 (=> (not res!644654) (not e!543510))))

(assert (=> b!963678 (= res!644654 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963679 () Bool)

(assert (=> b!963679 (= e!543512 tp_is_empty!21541)))

(assert (= (and start!82774 res!644648) b!963669))

(assert (= (and b!963669 res!644652) b!963673))

(assert (= (and b!963673 res!644653) b!963671))

(assert (= (and b!963671 res!644655) b!963670))

(assert (= (and b!963670 res!644649) b!963674))

(assert (= (and b!963674 res!644651) b!963676))

(assert (= (and b!963676 res!644650) b!963678))

(assert (= (and b!963678 res!644654) b!963675))

(assert (= (and b!963672 condMapEmpty!34306) mapIsEmpty!34306))

(assert (= (and b!963672 (not condMapEmpty!34306)) mapNonEmpty!34306))

(get-info :version)

(assert (= (and mapNonEmpty!34306 ((_ is ValueCellFull!10289) mapValue!34306)) b!963679))

(assert (= (and b!963672 ((_ is ValueCellFull!10289) mapDefault!34306)) b!963677))

(assert (= start!82774 b!963672))

(declare-fun m!893623 () Bool)

(assert (=> b!963675 m!893623))

(declare-fun m!893625 () Bool)

(assert (=> b!963675 m!893625))

(assert (=> b!963675 m!893623))

(assert (=> b!963675 m!893625))

(declare-fun m!893627 () Bool)

(assert (=> b!963675 m!893627))

(declare-fun m!893629 () Bool)

(assert (=> b!963675 m!893629))

(declare-fun m!893631 () Bool)

(assert (=> b!963676 m!893631))

(assert (=> b!963676 m!893625))

(assert (=> b!963676 m!893631))

(assert (=> b!963676 m!893625))

(declare-fun m!893633 () Bool)

(assert (=> b!963676 m!893633))

(declare-fun m!893635 () Bool)

(assert (=> start!82774 m!893635))

(declare-fun m!893637 () Bool)

(assert (=> start!82774 m!893637))

(declare-fun m!893639 () Bool)

(assert (=> start!82774 m!893639))

(declare-fun m!893641 () Bool)

(assert (=> b!963671 m!893641))

(declare-fun m!893643 () Bool)

(assert (=> b!963673 m!893643))

(declare-fun m!893645 () Bool)

(assert (=> mapNonEmpty!34306 m!893645))

(assert (=> b!963674 m!893625))

(assert (=> b!963674 m!893625))

(declare-fun m!893647 () Bool)

(assert (=> b!963674 m!893647))

(check-sat (not b_next!18739) (not b!963673) tp_is_empty!21541 b_and!30237 (not b!963676) (not b!963675) (not mapNonEmpty!34306) (not b!963671) (not b!963674) (not start!82774))
(check-sat b_and!30237 (not b_next!18739))
