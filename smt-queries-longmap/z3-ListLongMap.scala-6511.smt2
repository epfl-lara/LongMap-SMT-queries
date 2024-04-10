; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82908 () Bool)

(assert start!82908)

(declare-fun b_free!19035 () Bool)

(declare-fun b_next!19035 () Bool)

(assert (=> start!82908 (= b_free!19035 (not b_next!19035))))

(declare-fun tp!66233 () Bool)

(declare-fun b_and!30523 () Bool)

(assert (=> start!82908 (= tp!66233 b_and!30523)))

(declare-fun mapNonEmpty!34759 () Bool)

(declare-fun mapRes!34759 () Bool)

(declare-fun tp!66234 () Bool)

(declare-fun e!545276 () Bool)

(assert (=> mapNonEmpty!34759 (= mapRes!34759 (and tp!66234 e!545276))))

(declare-datatypes ((V!34107 0))(
  ( (V!34108 (val!10972 Int)) )
))
(declare-datatypes ((ValueCell!10440 0))(
  ( (ValueCellFull!10440 (v!13530 V!34107)) (EmptyCell!10440) )
))
(declare-fun mapValue!34759 () ValueCell!10440)

(declare-fun mapRest!34759 () (Array (_ BitVec 32) ValueCell!10440))

(declare-datatypes ((array!59759 0))(
  ( (array!59760 (arr!28748 (Array (_ BitVec 32) ValueCell!10440)) (size!29227 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59759)

(declare-fun mapKey!34759 () (_ BitVec 32))

(assert (=> mapNonEmpty!34759 (= (arr!28748 _values!1400) (store mapRest!34759 mapKey!34759 mapValue!34759))))

(declare-fun b!967416 () Bool)

(declare-fun res!647596 () Bool)

(declare-fun e!545272 () Bool)

(assert (=> b!967416 (=> (not res!647596) (not e!545272))))

(declare-datatypes ((array!59761 0))(
  ( (array!59762 (arr!28749 (Array (_ BitVec 32) (_ BitVec 64))) (size!29228 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59761)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59761 (_ BitVec 32)) Bool)

(assert (=> b!967416 (= res!647596 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!967417 () Bool)

(assert (=> b!967417 (= e!545272 (not true))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-fun minValue!1342 () V!34107)

(declare-fun defaultEntry!1403 () Int)

(declare-fun i!803 () (_ BitVec 32))

(declare-fun zeroValue!1342 () V!34107)

(declare-fun from!2084 () (_ BitVec 32))

(declare-datatypes ((tuple2!14110 0))(
  ( (tuple2!14111 (_1!7066 (_ BitVec 64)) (_2!7066 V!34107)) )
))
(declare-datatypes ((List!19960 0))(
  ( (Nil!19957) (Cons!19956 (h!21118 tuple2!14110) (t!28323 List!19960)) )
))
(declare-datatypes ((ListLongMap!12807 0))(
  ( (ListLongMap!12808 (toList!6419 List!19960)) )
))
(declare-fun contains!5520 (ListLongMap!12807 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3652 (array!59761 array!59759 (_ BitVec 32) (_ BitVec 32) V!34107 V!34107 (_ BitVec 32) Int) ListLongMap!12807)

(assert (=> b!967417 (contains!5520 (getCurrentListMap!3652 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 (bvsub from!2084 #b00000000000000000000000000000001) defaultEntry!1403) (select (arr!28749 _keys!1686) i!803))))

(declare-datatypes ((Unit!32321 0))(
  ( (Unit!32322) )
))
(declare-fun lt!431419 () Unit!32321)

(declare-fun lemmaInListMapFromThenInFromMinusOne!55 (array!59761 array!59759 (_ BitVec 32) (_ BitVec 32) V!34107 V!34107 (_ BitVec 32) (_ BitVec 32) Int) Unit!32321)

(assert (=> b!967417 (= lt!431419 (lemmaInListMapFromThenInFromMinusOne!55 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 i!803 defaultEntry!1403))))

(declare-fun b!967418 () Bool)

(declare-fun tp_is_empty!21843 () Bool)

(assert (=> b!967418 (= e!545276 tp_is_empty!21843)))

(declare-fun b!967419 () Bool)

(declare-fun e!545274 () Bool)

(declare-fun e!545275 () Bool)

(assert (=> b!967419 (= e!545274 (and e!545275 mapRes!34759))))

(declare-fun condMapEmpty!34759 () Bool)

(declare-fun mapDefault!34759 () ValueCell!10440)

(assert (=> b!967419 (= condMapEmpty!34759 (= (arr!28748 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10440)) mapDefault!34759)))))

(declare-fun b!967420 () Bool)

(declare-fun res!647599 () Bool)

(assert (=> b!967420 (=> (not res!647599) (not e!545272))))

(declare-fun newFrom!159 () (_ BitVec 32))

(assert (=> b!967420 (= res!647599 (and (bvsge from!2084 #b00000000000000000000000000000000) (bvslt from!2084 (size!29228 _keys!1686)) (bvsge newFrom!159 #b00000000000000000000000000000000) (bvsle newFrom!159 from!2084) (bvsge i!803 from!2084) (bvslt i!803 (size!29228 _keys!1686))))))

(declare-fun b!967421 () Bool)

(declare-fun res!647598 () Bool)

(assert (=> b!967421 (=> (not res!647598) (not e!545272))))

(assert (=> b!967421 (= res!647598 (bvsgt from!2084 newFrom!159))))

(declare-fun res!647597 () Bool)

(assert (=> start!82908 (=> (not res!647597) (not e!545272))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82908 (= res!647597 (validMask!0 mask!2110))))

(assert (=> start!82908 e!545272))

(assert (=> start!82908 true))

(declare-fun array_inv!22261 (array!59759) Bool)

(assert (=> start!82908 (and (array_inv!22261 _values!1400) e!545274)))

(declare-fun array_inv!22262 (array!59761) Bool)

(assert (=> start!82908 (array_inv!22262 _keys!1686)))

(assert (=> start!82908 tp!66233))

(assert (=> start!82908 tp_is_empty!21843))

(declare-fun mapIsEmpty!34759 () Bool)

(assert (=> mapIsEmpty!34759 mapRes!34759))

(declare-fun b!967422 () Bool)

(declare-fun res!647595 () Bool)

(assert (=> b!967422 (=> (not res!647595) (not e!545272))))

(assert (=> b!967422 (= res!647595 (and (= (size!29227 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!29228 _keys!1686) (size!29227 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!967423 () Bool)

(assert (=> b!967423 (= e!545275 tp_is_empty!21843)))

(declare-fun b!967424 () Bool)

(declare-fun res!647602 () Bool)

(assert (=> b!967424 (=> (not res!647602) (not e!545272))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!967424 (= res!647602 (validKeyInArray!0 (select (arr!28749 _keys!1686) i!803)))))

(declare-fun b!967425 () Bool)

(declare-fun res!647601 () Bool)

(assert (=> b!967425 (=> (not res!647601) (not e!545272))))

(declare-datatypes ((List!19961 0))(
  ( (Nil!19958) (Cons!19957 (h!21119 (_ BitVec 64)) (t!28324 List!19961)) )
))
(declare-fun arrayNoDuplicates!0 (array!59761 (_ BitVec 32) List!19961) Bool)

(assert (=> b!967425 (= res!647601 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19958))))

(declare-fun b!967426 () Bool)

(declare-fun res!647600 () Bool)

(assert (=> b!967426 (=> (not res!647600) (not e!545272))))

(assert (=> b!967426 (= res!647600 (contains!5520 (getCurrentListMap!3652 _keys!1686 _values!1400 mask!2110 extraKeys!1321 zeroValue!1342 minValue!1342 from!2084 defaultEntry!1403) (select (arr!28749 _keys!1686) i!803)))))

(assert (= (and start!82908 res!647597) b!967422))

(assert (= (and b!967422 res!647595) b!967416))

(assert (= (and b!967416 res!647596) b!967425))

(assert (= (and b!967425 res!647601) b!967420))

(assert (= (and b!967420 res!647599) b!967424))

(assert (= (and b!967424 res!647602) b!967426))

(assert (= (and b!967426 res!647600) b!967421))

(assert (= (and b!967421 res!647598) b!967417))

(assert (= (and b!967419 condMapEmpty!34759) mapIsEmpty!34759))

(assert (= (and b!967419 (not condMapEmpty!34759)) mapNonEmpty!34759))

(get-info :version)

(assert (= (and mapNonEmpty!34759 ((_ is ValueCellFull!10440) mapValue!34759)) b!967418))

(assert (= (and b!967419 ((_ is ValueCellFull!10440) mapDefault!34759)) b!967423))

(assert (= start!82908 b!967419))

(declare-fun m!895973 () Bool)

(assert (=> start!82908 m!895973))

(declare-fun m!895975 () Bool)

(assert (=> start!82908 m!895975))

(declare-fun m!895977 () Bool)

(assert (=> start!82908 m!895977))

(declare-fun m!895979 () Bool)

(assert (=> b!967416 m!895979))

(declare-fun m!895981 () Bool)

(assert (=> b!967426 m!895981))

(declare-fun m!895983 () Bool)

(assert (=> b!967426 m!895983))

(assert (=> b!967426 m!895981))

(assert (=> b!967426 m!895983))

(declare-fun m!895985 () Bool)

(assert (=> b!967426 m!895985))

(assert (=> b!967424 m!895983))

(assert (=> b!967424 m!895983))

(declare-fun m!895987 () Bool)

(assert (=> b!967424 m!895987))

(declare-fun m!895989 () Bool)

(assert (=> b!967425 m!895989))

(declare-fun m!895991 () Bool)

(assert (=> mapNonEmpty!34759 m!895991))

(declare-fun m!895993 () Bool)

(assert (=> b!967417 m!895993))

(assert (=> b!967417 m!895983))

(assert (=> b!967417 m!895993))

(assert (=> b!967417 m!895983))

(declare-fun m!895995 () Bool)

(assert (=> b!967417 m!895995))

(declare-fun m!895997 () Bool)

(assert (=> b!967417 m!895997))

(check-sat (not b_next!19035) (not start!82908) (not b!967424) (not b!967416) tp_is_empty!21843 (not b!967426) b_and!30523 (not b!967417) (not b!967425) (not mapNonEmpty!34759))
(check-sat b_and!30523 (not b_next!19035))
