; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83484 () Bool)

(assert start!83484)

(declare-fun b_free!19489 () Bool)

(declare-fun b_next!19489 () Bool)

(assert (=> start!83484 (= b_free!19489 (not b_next!19489))))

(declare-fun tp!67756 () Bool)

(declare-fun b_and!31065 () Bool)

(assert (=> start!83484 (= tp!67756 b_and!31065)))

(declare-fun b!975248 () Bool)

(declare-fun res!652907 () Bool)

(declare-fun e!549625 () Bool)

(assert (=> b!975248 (=> (not res!652907) (not e!549625))))

(declare-datatypes ((array!60746 0))(
  ( (array!60747 (arr!29237 (Array (_ BitVec 32) (_ BitVec 64))) (size!29718 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60746)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975248 (= res!652907 (validKeyInArray!0 (select (arr!29237 _keys!1717) i!822)))))

(declare-fun b!975249 () Bool)

(assert (=> b!975249 (= e!549625 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34841 0))(
  ( (V!34842 (val!11247 Int)) )
))
(declare-datatypes ((ValueCell!10715 0))(
  ( (ValueCellFull!10715 (v!13805 V!34841)) (EmptyCell!10715) )
))
(declare-datatypes ((array!60748 0))(
  ( (array!60749 (arr!29238 (Array (_ BitVec 32) ValueCell!10715)) (size!29719 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60748)

(declare-fun zeroValue!1367 () V!34841)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34841)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14528 0))(
  ( (tuple2!14529 (_1!7275 (_ BitVec 64)) (_2!7275 V!34841)) )
))
(declare-datatypes ((List!20334 0))(
  ( (Nil!20331) (Cons!20330 (h!21492 tuple2!14528) (t!28802 List!20334)) )
))
(declare-datatypes ((ListLongMap!13215 0))(
  ( (ListLongMap!13216 (toList!6623 List!20334)) )
))
(declare-fun lt!432633 () ListLongMap!13215)

(declare-fun getCurrentListMap!3785 (array!60746 array!60748 (_ BitVec 32) (_ BitVec 32) V!34841 V!34841 (_ BitVec 32) Int) ListLongMap!13215)

(assert (=> b!975249 (= lt!432633 (getCurrentListMap!3785 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!652908 () Bool)

(assert (=> start!83484 (=> (not res!652908) (not e!549625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83484 (= res!652908 (validMask!0 mask!2147))))

(assert (=> start!83484 e!549625))

(assert (=> start!83484 true))

(declare-fun e!549624 () Bool)

(declare-fun array_inv!22659 (array!60748) Bool)

(assert (=> start!83484 (and (array_inv!22659 _values!1425) e!549624)))

(declare-fun tp_is_empty!22393 () Bool)

(assert (=> start!83484 tp_is_empty!22393))

(assert (=> start!83484 tp!67756))

(declare-fun array_inv!22660 (array!60746) Bool)

(assert (=> start!83484 (array_inv!22660 _keys!1717)))

(declare-fun b!975250 () Bool)

(declare-fun res!652904 () Bool)

(assert (=> b!975250 (=> (not res!652904) (not e!549625))))

(declare-datatypes ((List!20335 0))(
  ( (Nil!20332) (Cons!20331 (h!21493 (_ BitVec 64)) (t!28803 List!20335)) )
))
(declare-fun arrayNoDuplicates!0 (array!60746 (_ BitVec 32) List!20335) Bool)

(assert (=> b!975250 (= res!652904 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20332))))

(declare-fun b!975251 () Bool)

(declare-fun e!549627 () Bool)

(assert (=> b!975251 (= e!549627 tp_is_empty!22393)))

(declare-fun mapIsEmpty!35599 () Bool)

(declare-fun mapRes!35599 () Bool)

(assert (=> mapIsEmpty!35599 mapRes!35599))

(declare-fun b!975252 () Bool)

(declare-fun res!652909 () Bool)

(assert (=> b!975252 (=> (not res!652909) (not e!549625))))

(assert (=> b!975252 (= res!652909 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29718 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29718 _keys!1717))))))

(declare-fun b!975253 () Bool)

(declare-fun res!652905 () Bool)

(assert (=> b!975253 (=> (not res!652905) (not e!549625))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60746 (_ BitVec 32)) Bool)

(assert (=> b!975253 (= res!652905 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975254 () Bool)

(declare-fun e!549626 () Bool)

(assert (=> b!975254 (= e!549624 (and e!549626 mapRes!35599))))

(declare-fun condMapEmpty!35599 () Bool)

(declare-fun mapDefault!35599 () ValueCell!10715)

(assert (=> b!975254 (= condMapEmpty!35599 (= (arr!29238 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10715)) mapDefault!35599)))))

(declare-fun mapNonEmpty!35599 () Bool)

(declare-fun tp!67755 () Bool)

(assert (=> mapNonEmpty!35599 (= mapRes!35599 (and tp!67755 e!549627))))

(declare-fun mapValue!35599 () ValueCell!10715)

(declare-fun mapKey!35599 () (_ BitVec 32))

(declare-fun mapRest!35599 () (Array (_ BitVec 32) ValueCell!10715))

(assert (=> mapNonEmpty!35599 (= (arr!29238 _values!1425) (store mapRest!35599 mapKey!35599 mapValue!35599))))

(declare-fun b!975255 () Bool)

(assert (=> b!975255 (= e!549626 tp_is_empty!22393)))

(declare-fun b!975256 () Bool)

(declare-fun res!652906 () Bool)

(assert (=> b!975256 (=> (not res!652906) (not e!549625))))

(assert (=> b!975256 (= res!652906 (and (= (size!29719 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29718 _keys!1717) (size!29719 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975257 () Bool)

(declare-fun res!652903 () Bool)

(assert (=> b!975257 (=> (not res!652903) (not e!549625))))

(declare-fun contains!5654 (ListLongMap!13215 (_ BitVec 64)) Bool)

(assert (=> b!975257 (= res!652903 (contains!5654 (getCurrentListMap!3785 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29237 _keys!1717) i!822)))))

(assert (= (and start!83484 res!652908) b!975256))

(assert (= (and b!975256 res!652906) b!975253))

(assert (= (and b!975253 res!652905) b!975250))

(assert (= (and b!975250 res!652904) b!975252))

(assert (= (and b!975252 res!652909) b!975248))

(assert (= (and b!975248 res!652907) b!975257))

(assert (= (and b!975257 res!652903) b!975249))

(assert (= (and b!975254 condMapEmpty!35599) mapIsEmpty!35599))

(assert (= (and b!975254 (not condMapEmpty!35599)) mapNonEmpty!35599))

(get-info :version)

(assert (= (and mapNonEmpty!35599 ((_ is ValueCellFull!10715) mapValue!35599)) b!975251))

(assert (= (and b!975254 ((_ is ValueCellFull!10715) mapDefault!35599)) b!975255))

(assert (= start!83484 b!975254))

(declare-fun m!901961 () Bool)

(assert (=> b!975250 m!901961))

(declare-fun m!901963 () Bool)

(assert (=> b!975257 m!901963))

(declare-fun m!901965 () Bool)

(assert (=> b!975257 m!901965))

(assert (=> b!975257 m!901963))

(assert (=> b!975257 m!901965))

(declare-fun m!901967 () Bool)

(assert (=> b!975257 m!901967))

(declare-fun m!901969 () Bool)

(assert (=> mapNonEmpty!35599 m!901969))

(declare-fun m!901971 () Bool)

(assert (=> b!975249 m!901971))

(assert (=> b!975248 m!901965))

(assert (=> b!975248 m!901965))

(declare-fun m!901973 () Bool)

(assert (=> b!975248 m!901973))

(declare-fun m!901975 () Bool)

(assert (=> start!83484 m!901975))

(declare-fun m!901977 () Bool)

(assert (=> start!83484 m!901977))

(declare-fun m!901979 () Bool)

(assert (=> start!83484 m!901979))

(declare-fun m!901981 () Bool)

(assert (=> b!975253 m!901981))

(check-sat (not b!975250) tp_is_empty!22393 (not b!975257) (not b!975248) (not b!975249) (not mapNonEmpty!35599) (not start!83484) (not b_next!19489) (not b!975253) b_and!31065)
(check-sat b_and!31065 (not b_next!19489))
