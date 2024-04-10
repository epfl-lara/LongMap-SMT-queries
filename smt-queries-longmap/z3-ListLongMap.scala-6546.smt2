; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83162 () Bool)

(assert start!83162)

(declare-fun b_free!19155 () Bool)

(declare-fun b_next!19155 () Bool)

(assert (=> start!83162 (= b_free!19155 (not b_next!19155))))

(declare-fun tp!66743 () Bool)

(declare-fun b_and!30643 () Bool)

(assert (=> start!83162 (= tp!66743 b_and!30643)))

(declare-fun b!970196 () Bool)

(declare-fun res!649369 () Bool)

(declare-fun e!546964 () Bool)

(assert (=> b!970196 (=> (not res!649369) (not e!546964))))

(declare-datatypes ((array!60165 0))(
  ( (array!60166 (arr!28946 (Array (_ BitVec 32) (_ BitVec 64))) (size!29425 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60165)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!970196 (= res!649369 (validKeyInArray!0 (select (arr!28946 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35089 () Bool)

(declare-fun mapRes!35089 () Bool)

(assert (=> mapIsEmpty!35089 mapRes!35089))

(declare-fun b!970197 () Bool)

(declare-fun e!546962 () Bool)

(declare-fun tp_is_empty!22053 () Bool)

(assert (=> b!970197 (= e!546962 tp_is_empty!22053)))

(declare-fun b!970198 () Bool)

(assert (=> b!970198 (= e!546964 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34387 0))(
  ( (V!34388 (val!11077 Int)) )
))
(declare-datatypes ((ValueCell!10545 0))(
  ( (ValueCellFull!10545 (v!13636 V!34387)) (EmptyCell!10545) )
))
(declare-datatypes ((array!60167 0))(
  ( (array!60168 (arr!28947 (Array (_ BitVec 32) ValueCell!10545)) (size!29426 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60167)

(declare-fun zeroValue!1367 () V!34387)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34387)

(declare-fun lt!431711 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14192 0))(
  ( (tuple2!14193 (_1!7107 (_ BitVec 64)) (_2!7107 V!34387)) )
))
(declare-datatypes ((List!20063 0))(
  ( (Nil!20060) (Cons!20059 (h!21221 tuple2!14192) (t!28426 List!20063)) )
))
(declare-datatypes ((ListLongMap!12889 0))(
  ( (ListLongMap!12890 (toList!6460 List!20063)) )
))
(declare-fun contains!5564 (ListLongMap!12889 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3693 (array!60165 array!60167 (_ BitVec 32) (_ BitVec 32) V!34387 V!34387 (_ BitVec 32) Int) ListLongMap!12889)

(assert (=> b!970198 (= lt!431711 (contains!5564 (getCurrentListMap!3693 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28946 _keys!1717) i!822)))))

(declare-fun b!970199 () Bool)

(declare-fun res!649367 () Bool)

(assert (=> b!970199 (=> (not res!649367) (not e!546964))))

(assert (=> b!970199 (= res!649367 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29425 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29425 _keys!1717))))))

(declare-fun b!970200 () Bool)

(declare-fun e!546963 () Bool)

(assert (=> b!970200 (= e!546963 (and e!546962 mapRes!35089))))

(declare-fun condMapEmpty!35089 () Bool)

(declare-fun mapDefault!35089 () ValueCell!10545)

(assert (=> b!970200 (= condMapEmpty!35089 (= (arr!28947 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10545)) mapDefault!35089)))))

(declare-fun b!970201 () Bool)

(declare-fun res!649370 () Bool)

(assert (=> b!970201 (=> (not res!649370) (not e!546964))))

(declare-datatypes ((List!20064 0))(
  ( (Nil!20061) (Cons!20060 (h!21222 (_ BitVec 64)) (t!28427 List!20064)) )
))
(declare-fun arrayNoDuplicates!0 (array!60165 (_ BitVec 32) List!20064) Bool)

(assert (=> b!970201 (= res!649370 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20061))))

(declare-fun b!970202 () Bool)

(declare-fun res!649371 () Bool)

(assert (=> b!970202 (=> (not res!649371) (not e!546964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60165 (_ BitVec 32)) Bool)

(assert (=> b!970202 (= res!649371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970203 () Bool)

(declare-fun e!546961 () Bool)

(assert (=> b!970203 (= e!546961 tp_is_empty!22053)))

(declare-fun b!970204 () Bool)

(declare-fun res!649368 () Bool)

(assert (=> b!970204 (=> (not res!649368) (not e!546964))))

(assert (=> b!970204 (= res!649368 (and (= (size!29426 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29425 _keys!1717) (size!29426 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!649366 () Bool)

(assert (=> start!83162 (=> (not res!649366) (not e!546964))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83162 (= res!649366 (validMask!0 mask!2147))))

(assert (=> start!83162 e!546964))

(assert (=> start!83162 true))

(declare-fun array_inv!22407 (array!60167) Bool)

(assert (=> start!83162 (and (array_inv!22407 _values!1425) e!546963)))

(assert (=> start!83162 tp_is_empty!22053))

(assert (=> start!83162 tp!66743))

(declare-fun array_inv!22408 (array!60165) Bool)

(assert (=> start!83162 (array_inv!22408 _keys!1717)))

(declare-fun mapNonEmpty!35089 () Bool)

(declare-fun tp!66744 () Bool)

(assert (=> mapNonEmpty!35089 (= mapRes!35089 (and tp!66744 e!546961))))

(declare-fun mapKey!35089 () (_ BitVec 32))

(declare-fun mapValue!35089 () ValueCell!10545)

(declare-fun mapRest!35089 () (Array (_ BitVec 32) ValueCell!10545))

(assert (=> mapNonEmpty!35089 (= (arr!28947 _values!1425) (store mapRest!35089 mapKey!35089 mapValue!35089))))

(assert (= (and start!83162 res!649366) b!970204))

(assert (= (and b!970204 res!649368) b!970202))

(assert (= (and b!970202 res!649371) b!970201))

(assert (= (and b!970201 res!649370) b!970199))

(assert (= (and b!970199 res!649367) b!970196))

(assert (= (and b!970196 res!649369) b!970198))

(assert (= (and b!970200 condMapEmpty!35089) mapIsEmpty!35089))

(assert (= (and b!970200 (not condMapEmpty!35089)) mapNonEmpty!35089))

(get-info :version)

(assert (= (and mapNonEmpty!35089 ((_ is ValueCellFull!10545) mapValue!35089)) b!970203))

(assert (= (and b!970200 ((_ is ValueCellFull!10545) mapDefault!35089)) b!970197))

(assert (= start!83162 b!970200))

(declare-fun m!897987 () Bool)

(assert (=> b!970196 m!897987))

(assert (=> b!970196 m!897987))

(declare-fun m!897989 () Bool)

(assert (=> b!970196 m!897989))

(declare-fun m!897991 () Bool)

(assert (=> b!970202 m!897991))

(declare-fun m!897993 () Bool)

(assert (=> b!970201 m!897993))

(declare-fun m!897995 () Bool)

(assert (=> start!83162 m!897995))

(declare-fun m!897997 () Bool)

(assert (=> start!83162 m!897997))

(declare-fun m!897999 () Bool)

(assert (=> start!83162 m!897999))

(declare-fun m!898001 () Bool)

(assert (=> mapNonEmpty!35089 m!898001))

(declare-fun m!898003 () Bool)

(assert (=> b!970198 m!898003))

(assert (=> b!970198 m!897987))

(assert (=> b!970198 m!898003))

(assert (=> b!970198 m!897987))

(declare-fun m!898005 () Bool)

(assert (=> b!970198 m!898005))

(check-sat (not start!83162) (not b!970198) (not b!970202) (not b_next!19155) (not b!970196) tp_is_empty!22053 b_and!30643 (not b!970201) (not mapNonEmpty!35089))
(check-sat b_and!30643 (not b_next!19155))
