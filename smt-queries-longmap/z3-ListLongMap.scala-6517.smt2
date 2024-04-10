; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82944 () Bool)

(assert start!82944)

(declare-fun b_free!19071 () Bool)

(declare-fun b_next!19071 () Bool)

(assert (=> start!82944 (= b_free!19071 (not b_next!19071))))

(declare-fun tp!66341 () Bool)

(declare-fun b_and!30559 () Bool)

(assert (=> start!82944 (= tp!66341 b_and!30559)))

(declare-fun b!968010 () Bool)

(declare-fun e!545543 () Bool)

(declare-fun e!545545 () Bool)

(declare-fun mapRes!34813 () Bool)

(assert (=> b!968010 (= e!545543 (and e!545545 mapRes!34813))))

(declare-fun condMapEmpty!34813 () Bool)

(declare-datatypes ((V!34155 0))(
  ( (V!34156 (val!10990 Int)) )
))
(declare-datatypes ((ValueCell!10458 0))(
  ( (ValueCellFull!10458 (v!13548 V!34155)) (EmptyCell!10458) )
))
(declare-datatypes ((array!59831 0))(
  ( (array!59832 (arr!28784 (Array (_ BitVec 32) ValueCell!10458)) (size!29263 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59831)

(declare-fun mapDefault!34813 () ValueCell!10458)

(assert (=> b!968010 (= condMapEmpty!34813 (= (arr!28784 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10458)) mapDefault!34813)))))

(declare-fun res!648033 () Bool)

(declare-fun e!545544 () Bool)

(assert (=> start!82944 (=> (not res!648033) (not e!545544))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82944 (= res!648033 (validMask!0 mask!2110))))

(assert (=> start!82944 e!545544))

(assert (=> start!82944 true))

(declare-fun array_inv!22285 (array!59831) Bool)

(assert (=> start!82944 (and (array_inv!22285 _values!1400) e!545543)))

(declare-datatypes ((array!59833 0))(
  ( (array!59834 (arr!28785 (Array (_ BitVec 32) (_ BitVec 64))) (size!29264 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59833)

(declare-fun array_inv!22286 (array!59833) Bool)

(assert (=> start!82944 (array_inv!22286 _keys!1686)))

(assert (=> start!82944 tp!66341))

(declare-fun tp_is_empty!21879 () Bool)

(assert (=> start!82944 tp_is_empty!21879))

(declare-fun newFrom!159 () (_ BitVec 32))

(declare-fun from!2084 () (_ BitVec 32))

(declare-fun b!968011 () Bool)

(declare-fun i!803 () (_ BitVec 32))

(assert (=> b!968011 (= e!545544 (not (or (bvslt (bvsub from!2084 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge (bvsub from!2084 #b00000000000000000000000000000001) (size!29264 _keys!1686)) (bvslt i!803 (bvsub from!2084 #b00000000000000000000000000000001)) (bvslt (bvsub (bvsub from!2084 #b00000000000000000000000000000001) newFrom!159) (bvsub from!2084 newFrom!159)))))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34155)

(declare-fun defaultEntry!1403 () Int)

(declare-fun zeroValue!1342 () V!34155)

(declare-datatypes ((tuple2!14138 0))(
  ( (tuple2!14139 (_1!7080 (_ BitVec 64)) (_2!7080 V!34155)) )
))
(declare-datatypes ((List!19986 0))(
  ( (Nil!19983) (Cons!19982 (h!21144 tuple2!14138) (t!28349 List!19986)) )
))
(declare-datatypes ((ListLongMap!12835 0))(
  ( (ListLongMap!12836 (toList!6433 List!19986)) )
))
(declare-fun contains!5534 (ListLongMap!12835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3666 (array!59833 array!59831 (_ BitVec 32) (_ BitVec 32) V!34155 V!34155 (_ BitVec 32) Int) ListLongMap!12835)

(assert (=> b!968011 (contains!5534 (getCurrentListMap!3666 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28785 _keys!1686) i!803))))

(declare-datatypes ((Unit!32347 0))(
  ( (Unit!32348) )
))
(declare-fun lt!431473 () Unit!32347)

(declare-fun lemmaInListMapFromThenInFromMinusOne!68 (array!59833 array!59831 (_ BitVec 32) (_ BitVec 32) V!34155 V!34155 (_ BitVec 32) (_ BitVec 32) Int) Unit!32347)

(assert (=> b!968011 (= lt!431473 (lemmaInListMapFromThenInFromMinusOne!68 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!968012 () Bool)

(assert (=> b!968012 (= e!545545 tp_is_empty!21879)))

(declare-fun mapNonEmpty!34813 () Bool)

(declare-fun tp!66342 () Bool)

(declare-fun e!545542 () Bool)

(assert (=> mapNonEmpty!34813 (= mapRes!34813 (and tp!66342 e!545542))))

(declare-fun mapRest!34813 () (Array (_ BitVec 32) ValueCell!10458))

(declare-fun mapValue!34813 () ValueCell!10458)

(declare-fun mapKey!34813 () (_ BitVec 32))

(assert (=> mapNonEmpty!34813 (= (arr!28784 _values!1400) (store mapRest!34813 mapKey!34813 mapValue!34813))))

(declare-fun b!968013 () Bool)

(declare-fun res!648027 () Bool)

(assert (=> b!968013 (=> (not res!648027) (not e!545544))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59833 (_ BitVec 32)) Bool)

(assert (=> b!968013 (= res!648027 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!968014 () Bool)

(declare-fun res!648034 () Bool)

(assert (=> b!968014 (=> (not res!648034) (not e!545544))))

(assert (=> b!968014 (= res!648034 (contains!5534 (getCurrentListMap!3666 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28785 _keys!1686) i!803)))))

(declare-fun b!968015 () Bool)

(declare-fun res!648030 () Bool)

(assert (=> b!968015 (=> (not res!648030) (not e!545544))))

(assert (=> b!968015 (= res!648030 (and (= (size!29263 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29264 _keys!1686) (size!29263 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!968016 () Bool)

(declare-fun res!648032 () Bool)

(assert (=> b!968016 (=> (not res!648032) (not e!545544))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968016 (= res!648032 (validKeyInArray!0 (select (arr!28785 _keys!1686) i!803)))))

(declare-fun mapIsEmpty!34813 () Bool)

(assert (=> mapIsEmpty!34813 mapRes!34813))

(declare-fun b!968017 () Bool)

(declare-fun res!648028 () Bool)

(assert (=> b!968017 (=> (not res!648028) (not e!545544))))

(declare-datatypes ((List!19987 0))(
  ( (Nil!19984) (Cons!19983 (h!21145 (_ BitVec 64)) (t!28350 List!19987)) )
))
(declare-fun arrayNoDuplicates!0 (array!59833 (_ BitVec 32) List!19987) Bool)

(assert (=> b!968017 (= res!648028 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19984))))

(declare-fun b!968018 () Bool)

(assert (=> b!968018 (= e!545542 tp_is_empty!21879)))

(declare-fun b!968019 () Bool)

(declare-fun res!648029 () Bool)

(assert (=> b!968019 (=> (not res!648029) (not e!545544))))

(assert (=> b!968019 (= res!648029 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29264 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29264 _keys!1686))))))

(declare-fun b!968020 () Bool)

(declare-fun res!648031 () Bool)

(assert (=> b!968020 (=> (not res!648031) (not e!545544))))

(assert (=> b!968020 (= res!648031 (bvsgt from!2084 newFrom!159))))

(assert (= (and start!82944 res!648033) b!968015))

(assert (= (and b!968015 res!648030) b!968013))

(assert (= (and b!968013 res!648027) b!968017))

(assert (= (and b!968017 res!648028) b!968019))

(assert (= (and b!968019 res!648029) b!968016))

(assert (= (and b!968016 res!648032) b!968014))

(assert (= (and b!968014 res!648034) b!968020))

(assert (= (and b!968020 res!648031) b!968011))

(assert (= (and b!968010 condMapEmpty!34813) mapIsEmpty!34813))

(assert (= (and b!968010 (not condMapEmpty!34813)) mapNonEmpty!34813))

(get-info :version)

(assert (= (and mapNonEmpty!34813 ((_ is ValueCellFull!10458) mapValue!34813)) b!968018))

(assert (= (and b!968010 ((_ is ValueCellFull!10458) mapDefault!34813)) b!968012))

(assert (= start!82944 b!968010))

(declare-fun m!896441 () Bool)

(assert (=> start!82944 m!896441))

(declare-fun m!896443 () Bool)

(assert (=> start!82944 m!896443))

(declare-fun m!896445 () Bool)

(assert (=> start!82944 m!896445))

(declare-fun m!896447 () Bool)

(assert (=> b!968016 m!896447))

(assert (=> b!968016 m!896447))

(declare-fun m!896449 () Bool)

(assert (=> b!968016 m!896449))

(declare-fun m!896451 () Bool)

(assert (=> b!968011 m!896451))

(assert (=> b!968011 m!896447))

(assert (=> b!968011 m!896451))

(assert (=> b!968011 m!896447))

(declare-fun m!896453 () Bool)

(assert (=> b!968011 m!896453))

(declare-fun m!896455 () Bool)

(assert (=> b!968011 m!896455))

(declare-fun m!896457 () Bool)

(assert (=> b!968014 m!896457))

(assert (=> b!968014 m!896447))

(assert (=> b!968014 m!896457))

(assert (=> b!968014 m!896447))

(declare-fun m!896459 () Bool)

(assert (=> b!968014 m!896459))

(declare-fun m!896461 () Bool)

(assert (=> b!968017 m!896461))

(declare-fun m!896463 () Bool)

(assert (=> b!968013 m!896463))

(declare-fun m!896465 () Bool)

(assert (=> mapNonEmpty!34813 m!896465))

(check-sat b_and!30559 tp_is_empty!21879 (not b!968016) (not mapNonEmpty!34813) (not b!968017) (not b!968013) (not b!968014) (not b!968011) (not start!82944) (not b_next!19071))
(check-sat b_and!30559 (not b_next!19071))
