; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82618 () Bool)

(assert start!82618)

(declare-fun b_free!18769 () Bool)

(declare-fun b_next!18769 () Bool)

(assert (=> start!82618 (= b_free!18769 (not b_next!18769))))

(declare-fun tp!65427 () Bool)

(declare-fun b_and!30231 () Bool)

(assert (=> start!82618 (= tp!65427 b_and!30231)))

(declare-fun res!644554 () Bool)

(declare-fun e!543003 () Bool)

(assert (=> start!82618 (=> (not res!644554) (not e!543003))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82618 (= res!644554 (validMask!0 mask!2110))))

(assert (=> start!82618 e!543003))

(assert (=> start!82618 true))

(declare-datatypes ((V!33745 0))(
  ( (V!33746 (val!10836 Int)) )
))
(declare-datatypes ((ValueCell!10304 0))(
  ( (ValueCellFull!10304 (v!13393 V!33745)) (EmptyCell!10304) )
))
(declare-datatypes ((array!59168 0))(
  ( (array!59169 (arr!28453 (Array (_ BitVec 32) ValueCell!10304)) (size!28934 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59168)

(declare-fun e!543007 () Bool)

(declare-fun array_inv!22103 (array!59168) Bool)

(assert (=> start!82618 (and (array_inv!22103 _values!1400) e!543007)))

(declare-datatypes ((array!59170 0))(
  ( (array!59171 (arr!28454 (Array (_ BitVec 32) (_ BitVec 64))) (size!28935 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59170)

(declare-fun array_inv!22104 (array!59170) Bool)

(assert (=> start!82618 (array_inv!22104 _keys!1686)))

(assert (=> start!82618 tp!65427))

(declare-fun tp_is_empty!21571 () Bool)

(assert (=> start!82618 tp_is_empty!21571))

(declare-fun b!963022 () Bool)

(declare-fun res!644559 () Bool)

(assert (=> b!963022 (=> (not res!644559) (not e!543003))))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!963022 (= res!644559 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!28935 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!28935 _keys!1686))))))

(declare-fun b!963023 () Bool)

(declare-fun res!644556 () Bool)

(assert (=> b!963023 (=> (not res!644556) (not e!543003))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!963023 (= res!644556 (and (= (size!28934 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28935 _keys!1686) (size!28934 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!963024 () Bool)

(declare-fun e!543006 () Bool)

(assert (=> b!963024 (= e!543006 tp_is_empty!21571)))

(declare-fun mapNonEmpty!34351 () Bool)

(declare-fun mapRes!34351 () Bool)

(declare-fun tp!65428 () Bool)

(declare-fun e!543005 () Bool)

(assert (=> mapNonEmpty!34351 (= mapRes!34351 (and tp!65428 e!543005))))

(declare-fun mapKey!34351 () (_ BitVec 32))

(declare-fun mapRest!34351 () (Array (_ BitVec 32) ValueCell!10304))

(declare-fun mapValue!34351 () ValueCell!10304)

(assert (=> mapNonEmpty!34351 (= (arr!28453 _values!1400) (store mapRest!34351 mapKey!34351 mapValue!34351))))

(declare-fun b!963025 () Bool)

(declare-fun res!644558 () Bool)

(assert (=> b!963025 (=> (not res!644558) (not e!543003))))

(assert (=> b!963025 (= res!644558 (bvsgt from!2084 newFrom!159))))

(declare-fun b!963026 () Bool)

(assert (=> b!963026 (= e!543005 tp_is_empty!21571)))

(declare-fun b!963027 () Bool)

(assert (=> b!963027 (= e!543007 (and e!543006 mapRes!34351))))

(declare-fun condMapEmpty!34351 () Bool)

(declare-fun mapDefault!34351 () ValueCell!10304)

(assert (=> b!963027 (= condMapEmpty!34351 (= (arr!28453 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10304)) mapDefault!34351)))))

(declare-fun b!963028 () Bool)

(declare-fun res!644555 () Bool)

(assert (=> b!963028 (=> (not res!644555) (not e!543003))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!963028 (= res!644555 (validKeyInArray!0 (select (arr!28454 _keys!1686) i!803)))))

(declare-fun b!963029 () Bool)

(assert (=> b!963029 (= e!543003 (not true))))

(declare-fun minValue!1342 () V!33745)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!33745)

(declare-datatypes ((tuple2!13980 0))(
  ( (tuple2!13981 (_1!7001 (_ BitVec 64)) (_2!7001 V!33745)) )
))
(declare-datatypes ((List!19789 0))(
  ( (Nil!19786) (Cons!19785 (h!20947 tuple2!13980) (t!28143 List!19789)) )
))
(declare-datatypes ((ListLongMap!12667 0))(
  ( (ListLongMap!12668 (toList!6349 List!19789)) )
))
(declare-fun contains!5396 (ListLongMap!12667 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3511 (array!59170 array!59168 (_ BitVec 32) (_ BitVec 32) V!33745 V!33745 (_ BitVec 32) Int) ListLongMap!12667)

(assert (=> b!963029 (contains!5396 (getCurrentListMap!3511 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28454 _keys!1686) i!803))))

(declare-datatypes ((Unit!32086 0))(
  ( (Unit!32087) )
))
(declare-fun lt!430721 () Unit!32086)

(declare-fun lemmaInListMapFromThenInFromMinusOne!9 (array!59170 array!59168 (_ BitVec 32) (_ BitVec 32) V!33745 V!33745 (_ BitVec 32) (_ BitVec 32) Int) Unit!32086)

(assert (=> b!963029 (= lt!430721 (lemmaInListMapFromThenInFromMinusOne!9 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun mapIsEmpty!34351 () Bool)

(assert (=> mapIsEmpty!34351 mapRes!34351))

(declare-fun b!963030 () Bool)

(declare-fun res!644557 () Bool)

(assert (=> b!963030 (=> (not res!644557) (not e!543003))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59170 (_ BitVec 32)) Bool)

(assert (=> b!963030 (= res!644557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!963031 () Bool)

(declare-fun res!644560 () Bool)

(assert (=> b!963031 (=> (not res!644560) (not e!543003))))

(declare-datatypes ((List!19790 0))(
  ( (Nil!19787) (Cons!19786 (h!20948 (_ BitVec 64)) (t!28144 List!19790)) )
))
(declare-fun arrayNoDuplicates!0 (array!59170 (_ BitVec 32) List!19790) Bool)

(assert (=> b!963031 (= res!644560 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19787))))

(declare-fun b!963032 () Bool)

(declare-fun res!644561 () Bool)

(assert (=> b!963032 (=> (not res!644561) (not e!543003))))

(assert (=> b!963032 (= res!644561 (contains!5396 (getCurrentListMap!3511 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28454 _keys!1686) i!803)))))

(assert (= (and start!82618 res!644554) b!963023))

(assert (= (and b!963023 res!644556) b!963030))

(assert (= (and b!963030 res!644557) b!963031))

(assert (= (and b!963031 res!644560) b!963022))

(assert (= (and b!963022 res!644559) b!963028))

(assert (= (and b!963028 res!644555) b!963032))

(assert (= (and b!963032 res!644561) b!963025))

(assert (= (and b!963025 res!644558) b!963029))

(assert (= (and b!963027 condMapEmpty!34351) mapIsEmpty!34351))

(assert (= (and b!963027 (not condMapEmpty!34351)) mapNonEmpty!34351))

(get-info :version)

(assert (= (and mapNonEmpty!34351 ((_ is ValueCellFull!10304) mapValue!34351)) b!963026))

(assert (= (and b!963027 ((_ is ValueCellFull!10304) mapDefault!34351)) b!963024))

(assert (= start!82618 b!963027))

(declare-fun m!891961 () Bool)

(assert (=> mapNonEmpty!34351 m!891961))

(declare-fun m!891963 () Bool)

(assert (=> b!963030 m!891963))

(declare-fun m!891965 () Bool)

(assert (=> b!963031 m!891965))

(declare-fun m!891967 () Bool)

(assert (=> start!82618 m!891967))

(declare-fun m!891969 () Bool)

(assert (=> start!82618 m!891969))

(declare-fun m!891971 () Bool)

(assert (=> start!82618 m!891971))

(declare-fun m!891973 () Bool)

(assert (=> b!963028 m!891973))

(assert (=> b!963028 m!891973))

(declare-fun m!891975 () Bool)

(assert (=> b!963028 m!891975))

(declare-fun m!891977 () Bool)

(assert (=> b!963029 m!891977))

(assert (=> b!963029 m!891973))

(assert (=> b!963029 m!891977))

(assert (=> b!963029 m!891973))

(declare-fun m!891979 () Bool)

(assert (=> b!963029 m!891979))

(declare-fun m!891981 () Bool)

(assert (=> b!963029 m!891981))

(declare-fun m!891983 () Bool)

(assert (=> b!963032 m!891983))

(assert (=> b!963032 m!891973))

(assert (=> b!963032 m!891983))

(assert (=> b!963032 m!891973))

(declare-fun m!891985 () Bool)

(assert (=> b!963032 m!891985))

(check-sat b_and!30231 (not b!963028) (not b!963029) (not mapNonEmpty!34351) (not b!963032) (not start!82618) (not b!963030) (not b!963031) (not b_next!18769) tp_is_empty!21571)
(check-sat b_and!30231 (not b_next!18769))
