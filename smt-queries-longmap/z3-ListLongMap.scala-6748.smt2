; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84624 () Bool)

(assert start!84624)

(declare-fun b_free!20049 () Bool)

(declare-fun b_next!20049 () Bool)

(assert (=> start!84624 (= b_free!20049 (not b_next!20049))))

(declare-fun tp!69938 () Bool)

(declare-fun b_and!32181 () Bool)

(assert (=> start!84624 (= tp!69938 b_and!32181)))

(declare-fun b!989675 () Bool)

(declare-fun res!661802 () Bool)

(declare-fun e!558065 () Bool)

(assert (=> b!989675 (=> (not res!661802) (not e!558065))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62489 0))(
  ( (array!62490 (arr!30097 (Array (_ BitVec 32) (_ BitVec 64))) (size!30576 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62489)

(assert (=> b!989675 (= res!661802 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30576 _keys!1544))))))

(declare-fun b!989676 () Bool)

(declare-fun res!661799 () Bool)

(assert (=> b!989676 (=> (not res!661799) (not e!558065))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989676 (= res!661799 (validKeyInArray!0 (select (arr!30097 _keys!1544) from!1932)))))

(declare-fun b!989677 () Bool)

(declare-fun res!661803 () Bool)

(assert (=> b!989677 (=> (not res!661803) (not e!558065))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!989677 (= res!661803 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!661801 () Bool)

(assert (=> start!84624 (=> (not res!661801) (not e!558065))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84624 (= res!661801 (validMask!0 mask!1948))))

(assert (=> start!84624 e!558065))

(assert (=> start!84624 true))

(declare-fun tp_is_empty!23265 () Bool)

(assert (=> start!84624 tp_is_empty!23265))

(declare-datatypes ((V!36003 0))(
  ( (V!36004 (val!11683 Int)) )
))
(declare-datatypes ((ValueCell!11151 0))(
  ( (ValueCellFull!11151 (v!14253 V!36003)) (EmptyCell!11151) )
))
(declare-datatypes ((array!62491 0))(
  ( (array!62492 (arr!30098 (Array (_ BitVec 32) ValueCell!11151)) (size!30577 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62491)

(declare-fun e!558062 () Bool)

(declare-fun array_inv!23249 (array!62491) Bool)

(assert (=> start!84624 (and (array_inv!23249 _values!1278) e!558062)))

(assert (=> start!84624 tp!69938))

(declare-fun array_inv!23250 (array!62489) Bool)

(assert (=> start!84624 (array_inv!23250 _keys!1544)))

(declare-fun mapIsEmpty!36943 () Bool)

(declare-fun mapRes!36943 () Bool)

(assert (=> mapIsEmpty!36943 mapRes!36943))

(declare-fun b!989678 () Bool)

(declare-fun res!661800 () Bool)

(assert (=> b!989678 (=> (not res!661800) (not e!558065))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62489 (_ BitVec 32)) Bool)

(assert (=> b!989678 (= res!661800 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!989679 () Bool)

(declare-fun e!558063 () Bool)

(assert (=> b!989679 (= e!558063 tp_is_empty!23265)))

(declare-fun b!989680 () Bool)

(declare-fun e!558066 () Bool)

(assert (=> b!989680 (= e!558066 tp_is_empty!23265)))

(declare-fun mapNonEmpty!36943 () Bool)

(declare-fun tp!69939 () Bool)

(assert (=> mapNonEmpty!36943 (= mapRes!36943 (and tp!69939 e!558063))))

(declare-fun mapRest!36943 () (Array (_ BitVec 32) ValueCell!11151))

(declare-fun mapValue!36943 () ValueCell!11151)

(declare-fun mapKey!36943 () (_ BitVec 32))

(assert (=> mapNonEmpty!36943 (= (arr!30098 _values!1278) (store mapRest!36943 mapKey!36943 mapValue!36943))))

(declare-fun b!989681 () Bool)

(assert (=> b!989681 (= e!558065 false)))

(declare-datatypes ((tuple2!14890 0))(
  ( (tuple2!14891 (_1!7456 (_ BitVec 64)) (_2!7456 V!36003)) )
))
(declare-datatypes ((List!20819 0))(
  ( (Nil!20816) (Cons!20815 (h!21977 tuple2!14890) (t!29776 List!20819)) )
))
(declare-datatypes ((ListLongMap!13587 0))(
  ( (ListLongMap!13588 (toList!6809 List!20819)) )
))
(declare-fun lt!439101 () ListLongMap!13587)

(declare-fun minValue!1220 () V!36003)

(declare-fun zeroValue!1220 () V!36003)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMapNoExtraKeys!3499 (array!62489 array!62491 (_ BitVec 32) (_ BitVec 32) V!36003 V!36003 (_ BitVec 32) Int) ListLongMap!13587)

(assert (=> b!989681 (= lt!439101 (getCurrentListMapNoExtraKeys!3499 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989682 () Bool)

(declare-fun res!661797 () Bool)

(assert (=> b!989682 (=> (not res!661797) (not e!558065))))

(declare-datatypes ((List!20820 0))(
  ( (Nil!20817) (Cons!20816 (h!21978 (_ BitVec 64)) (t!29777 List!20820)) )
))
(declare-fun arrayNoDuplicates!0 (array!62489 (_ BitVec 32) List!20820) Bool)

(assert (=> b!989682 (= res!661797 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20817))))

(declare-fun b!989683 () Bool)

(declare-fun res!661798 () Bool)

(assert (=> b!989683 (=> (not res!661798) (not e!558065))))

(assert (=> b!989683 (= res!661798 (and (= (size!30577 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30576 _keys!1544) (size!30577 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989684 () Bool)

(assert (=> b!989684 (= e!558062 (and e!558066 mapRes!36943))))

(declare-fun condMapEmpty!36943 () Bool)

(declare-fun mapDefault!36943 () ValueCell!11151)

(assert (=> b!989684 (= condMapEmpty!36943 (= (arr!30098 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11151)) mapDefault!36943)))))

(assert (= (and start!84624 res!661801) b!989683))

(assert (= (and b!989683 res!661798) b!989678))

(assert (= (and b!989678 res!661800) b!989682))

(assert (= (and b!989682 res!661797) b!989675))

(assert (= (and b!989675 res!661802) b!989676))

(assert (= (and b!989676 res!661799) b!989677))

(assert (= (and b!989677 res!661803) b!989681))

(assert (= (and b!989684 condMapEmpty!36943) mapIsEmpty!36943))

(assert (= (and b!989684 (not condMapEmpty!36943)) mapNonEmpty!36943))

(get-info :version)

(assert (= (and mapNonEmpty!36943 ((_ is ValueCellFull!11151) mapValue!36943)) b!989679))

(assert (= (and b!989684 ((_ is ValueCellFull!11151) mapDefault!36943)) b!989680))

(assert (= start!84624 b!989684))

(declare-fun m!917195 () Bool)

(assert (=> b!989682 m!917195))

(declare-fun m!917197 () Bool)

(assert (=> b!989681 m!917197))

(declare-fun m!917199 () Bool)

(assert (=> mapNonEmpty!36943 m!917199))

(declare-fun m!917201 () Bool)

(assert (=> start!84624 m!917201))

(declare-fun m!917203 () Bool)

(assert (=> start!84624 m!917203))

(declare-fun m!917205 () Bool)

(assert (=> start!84624 m!917205))

(declare-fun m!917207 () Bool)

(assert (=> b!989676 m!917207))

(assert (=> b!989676 m!917207))

(declare-fun m!917209 () Bool)

(assert (=> b!989676 m!917209))

(declare-fun m!917211 () Bool)

(assert (=> b!989678 m!917211))

(check-sat (not b!989676) (not b_next!20049) (not b!989682) (not b!989678) (not b!989681) (not mapNonEmpty!36943) tp_is_empty!23265 (not start!84624) b_and!32181)
(check-sat b_and!32181 (not b_next!20049))
