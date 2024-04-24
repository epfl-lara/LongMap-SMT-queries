; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84902 () Bool)

(assert start!84902)

(declare-fun b_free!20089 () Bool)

(declare-fun b_next!20089 () Bool)

(assert (=> start!84902 (= b_free!20089 (not b_next!20089))))

(declare-fun tp!70066 () Bool)

(declare-fun b_and!32269 () Bool)

(assert (=> start!84902 (= tp!70066 b_and!32269)))

(declare-fun b!991791 () Bool)

(declare-fun e!559336 () Bool)

(declare-fun e!559335 () Bool)

(assert (=> b!991791 (= e!559336 e!559335)))

(declare-fun res!662826 () Bool)

(assert (=> b!991791 (=> (not res!662826) (not e!559335))))

(declare-fun lt!440055 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!991791 (= res!662826 (and (or lt!440055 (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (or lt!440055 (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (or (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not lt!440055))))))

(assert (=> b!991791 (= lt!440055 (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!991792 () Bool)

(declare-fun res!662827 () Bool)

(assert (=> b!991792 (=> (not res!662827) (not e!559336))))

(declare-datatypes ((array!62618 0))(
  ( (array!62619 (arr!30155 (Array (_ BitVec 32) (_ BitVec 64))) (size!30635 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62618)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62618 (_ BitVec 32)) Bool)

(assert (=> b!991792 (= res!662827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!991793 () Bool)

(declare-fun res!662825 () Bool)

(assert (=> b!991793 (=> (not res!662825) (not e!559336))))

(declare-datatypes ((List!20840 0))(
  ( (Nil!20837) (Cons!20836 (h!22004 (_ BitVec 64)) (t!29809 List!20840)) )
))
(declare-fun arrayNoDuplicates!0 (array!62618 (_ BitVec 32) List!20840) Bool)

(assert (=> b!991793 (= res!662825 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20837))))

(declare-fun mapNonEmpty!37010 () Bool)

(declare-fun mapRes!37010 () Bool)

(declare-fun tp!70067 () Bool)

(declare-fun e!559337 () Bool)

(assert (=> mapNonEmpty!37010 (= mapRes!37010 (and tp!70067 e!559337))))

(declare-datatypes ((V!36057 0))(
  ( (V!36058 (val!11703 Int)) )
))
(declare-datatypes ((ValueCell!11171 0))(
  ( (ValueCellFull!11171 (v!14273 V!36057)) (EmptyCell!11171) )
))
(declare-fun mapRest!37010 () (Array (_ BitVec 32) ValueCell!11171))

(declare-datatypes ((array!62620 0))(
  ( (array!62621 (arr!30156 (Array (_ BitVec 32) ValueCell!11171)) (size!30636 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62620)

(declare-fun mapKey!37010 () (_ BitVec 32))

(declare-fun mapValue!37010 () ValueCell!11171)

(assert (=> mapNonEmpty!37010 (= (arr!30156 _values!1278) (store mapRest!37010 mapKey!37010 mapValue!37010))))

(declare-fun b!991794 () Bool)

(declare-fun res!662829 () Bool)

(assert (=> b!991794 (=> (not res!662829) (not e!559336))))

(assert (=> b!991794 (= res!662829 (and (= (size!30636 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30635 _keys!1544) (size!30636 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!991795 () Bool)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!991795 (= e!559335 (bvsge from!1932 (size!30636 _values!1278)))))

(declare-fun minValue!1220 () V!36057)

(declare-datatypes ((tuple2!14932 0))(
  ( (tuple2!14933 (_1!7477 (_ BitVec 64)) (_2!7477 V!36057)) )
))
(declare-datatypes ((List!20841 0))(
  ( (Nil!20838) (Cons!20837 (h!22005 tuple2!14932) (t!29810 List!20841)) )
))
(declare-datatypes ((ListLongMap!13631 0))(
  ( (ListLongMap!13632 (toList!6831 List!20841)) )
))
(declare-fun lt!440054 () ListLongMap!13631)

(declare-fun zeroValue!1220 () V!36057)

(declare-fun defaultEntry!1281 () Int)

(declare-fun getCurrentListMap!3878 (array!62618 array!62620 (_ BitVec 32) (_ BitVec 32) V!36057 V!36057 (_ BitVec 32) Int) ListLongMap!13631)

(assert (=> b!991795 (= lt!440054 (getCurrentListMap!3878 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun res!662828 () Bool)

(assert (=> start!84902 (=> (not res!662828) (not e!559336))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84902 (= res!662828 (validMask!0 mask!1948))))

(assert (=> start!84902 e!559336))

(assert (=> start!84902 true))

(declare-fun tp_is_empty!23305 () Bool)

(assert (=> start!84902 tp_is_empty!23305))

(declare-fun e!559333 () Bool)

(declare-fun array_inv!23315 (array!62620) Bool)

(assert (=> start!84902 (and (array_inv!23315 _values!1278) e!559333)))

(assert (=> start!84902 tp!70066))

(declare-fun array_inv!23316 (array!62618) Bool)

(assert (=> start!84902 (array_inv!23316 _keys!1544)))

(declare-fun b!991796 () Bool)

(declare-fun e!559334 () Bool)

(assert (=> b!991796 (= e!559333 (and e!559334 mapRes!37010))))

(declare-fun condMapEmpty!37010 () Bool)

(declare-fun mapDefault!37010 () ValueCell!11171)

(assert (=> b!991796 (= condMapEmpty!37010 (= (arr!30156 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11171)) mapDefault!37010)))))

(declare-fun b!991797 () Bool)

(assert (=> b!991797 (= e!559334 tp_is_empty!23305)))

(declare-fun mapIsEmpty!37010 () Bool)

(assert (=> mapIsEmpty!37010 mapRes!37010))

(declare-fun b!991798 () Bool)

(declare-fun res!662831 () Bool)

(assert (=> b!991798 (=> (not res!662831) (not e!559336))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!991798 (= res!662831 (validKeyInArray!0 (select (arr!30155 _keys!1544) from!1932)))))

(declare-fun b!991799 () Bool)

(assert (=> b!991799 (= e!559337 tp_is_empty!23305)))

(declare-fun b!991800 () Bool)

(declare-fun res!662830 () Bool)

(assert (=> b!991800 (=> (not res!662830) (not e!559336))))

(assert (=> b!991800 (= res!662830 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30635 _keys!1544))))))

(assert (= (and start!84902 res!662828) b!991794))

(assert (= (and b!991794 res!662829) b!991792))

(assert (= (and b!991792 res!662827) b!991793))

(assert (= (and b!991793 res!662825) b!991800))

(assert (= (and b!991800 res!662830) b!991798))

(assert (= (and b!991798 res!662831) b!991791))

(assert (= (and b!991791 res!662826) b!991795))

(assert (= (and b!991796 condMapEmpty!37010) mapIsEmpty!37010))

(assert (= (and b!991796 (not condMapEmpty!37010)) mapNonEmpty!37010))

(get-info :version)

(assert (= (and mapNonEmpty!37010 ((_ is ValueCellFull!11171) mapValue!37010)) b!991799))

(assert (= (and b!991796 ((_ is ValueCellFull!11171) mapDefault!37010)) b!991797))

(assert (= start!84902 b!991796))

(declare-fun m!919969 () Bool)

(assert (=> start!84902 m!919969))

(declare-fun m!919971 () Bool)

(assert (=> start!84902 m!919971))

(declare-fun m!919973 () Bool)

(assert (=> start!84902 m!919973))

(declare-fun m!919975 () Bool)

(assert (=> b!991798 m!919975))

(assert (=> b!991798 m!919975))

(declare-fun m!919977 () Bool)

(assert (=> b!991798 m!919977))

(declare-fun m!919979 () Bool)

(assert (=> b!991793 m!919979))

(declare-fun m!919981 () Bool)

(assert (=> b!991795 m!919981))

(declare-fun m!919983 () Bool)

(assert (=> mapNonEmpty!37010 m!919983))

(declare-fun m!919985 () Bool)

(assert (=> b!991792 m!919985))

(check-sat (not b_next!20089) (not b!991792) b_and!32269 (not b!991793) (not mapNonEmpty!37010) (not b!991798) (not start!84902) (not b!991795) tp_is_empty!23305)
(check-sat b_and!32269 (not b_next!20089))
