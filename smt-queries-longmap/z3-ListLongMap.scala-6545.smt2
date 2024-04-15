; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83136 () Bool)

(assert start!83136)

(declare-fun b_free!19147 () Bool)

(declare-fun b_next!19147 () Bool)

(assert (=> start!83136 (= b_free!19147 (not b_next!19147))))

(declare-fun tp!66721 () Bool)

(declare-fun b_and!30609 () Bool)

(assert (=> start!83136 (= tp!66721 b_and!30609)))

(declare-fun b!969842 () Bool)

(declare-fun e!546753 () Bool)

(declare-fun tp_is_empty!22045 () Bool)

(assert (=> b!969842 (= e!546753 tp_is_empty!22045)))

(declare-fun b!969843 () Bool)

(declare-fun res!649178 () Bool)

(declare-fun e!546756 () Bool)

(assert (=> b!969843 (=> (not res!649178) (not e!546756))))

(declare-datatypes ((array!60082 0))(
  ( (array!60083 (arr!28905 (Array (_ BitVec 32) (_ BitVec 64))) (size!29386 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60082)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60082 (_ BitVec 32)) Bool)

(assert (=> b!969843 (= res!649178 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!969844 () Bool)

(declare-fun res!649180 () Bool)

(assert (=> b!969844 (=> (not res!649180) (not e!546756))))

(declare-datatypes ((List!20090 0))(
  ( (Nil!20087) (Cons!20086 (h!21248 (_ BitVec 64)) (t!28444 List!20090)) )
))
(declare-fun arrayNoDuplicates!0 (array!60082 (_ BitVec 32) List!20090) Bool)

(assert (=> b!969844 (= res!649180 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20087))))

(declare-fun b!969845 () Bool)

(declare-fun res!649181 () Bool)

(assert (=> b!969845 (=> (not res!649181) (not e!546756))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!969845 (= res!649181 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29386 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29386 _keys!1717))))))

(declare-fun b!969846 () Bool)

(declare-fun res!649177 () Bool)

(assert (=> b!969846 (=> (not res!649177) (not e!546756))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!969846 (= res!649177 (validKeyInArray!0 (select (arr!28905 _keys!1717) i!822)))))

(declare-fun b!969847 () Bool)

(declare-fun res!649183 () Bool)

(assert (=> b!969847 (=> (not res!649183) (not e!546756))))

(declare-datatypes ((V!34377 0))(
  ( (V!34378 (val!11073 Int)) )
))
(declare-datatypes ((ValueCell!10541 0))(
  ( (ValueCellFull!10541 (v!13631 V!34377)) (EmptyCell!10541) )
))
(declare-datatypes ((array!60084 0))(
  ( (array!60085 (arr!28906 (Array (_ BitVec 32) ValueCell!10541)) (size!29387 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60084)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!969847 (= res!649183 (and (= (size!29387 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29386 _keys!1717) (size!29387 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35077 () Bool)

(declare-fun mapRes!35077 () Bool)

(assert (=> mapIsEmpty!35077 mapRes!35077))

(declare-fun b!969848 () Bool)

(assert (=> b!969848 (= e!546756 (or (bvslt from!2118 #b00000000000000000000000000000000) (bvsgt from!2118 (size!29386 _keys!1717))))))

(declare-fun b!969849 () Bool)

(declare-fun e!546754 () Bool)

(declare-fun e!546755 () Bool)

(assert (=> b!969849 (= e!546754 (and e!546755 mapRes!35077))))

(declare-fun condMapEmpty!35077 () Bool)

(declare-fun mapDefault!35077 () ValueCell!10541)

(assert (=> b!969849 (= condMapEmpty!35077 (= (arr!28906 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10541)) mapDefault!35077)))))

(declare-fun b!969850 () Bool)

(assert (=> b!969850 (= e!546755 tp_is_empty!22045)))

(declare-fun b!969851 () Bool)

(declare-fun res!649182 () Bool)

(assert (=> b!969851 (=> (not res!649182) (not e!546756))))

(declare-fun zeroValue!1367 () V!34377)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34377)

(declare-datatypes ((tuple2!14270 0))(
  ( (tuple2!14271 (_1!7146 (_ BitVec 64)) (_2!7146 V!34377)) )
))
(declare-datatypes ((List!20091 0))(
  ( (Nil!20088) (Cons!20087 (h!21249 tuple2!14270) (t!28445 List!20091)) )
))
(declare-datatypes ((ListLongMap!12957 0))(
  ( (ListLongMap!12958 (toList!6494 List!20091)) )
))
(declare-fun contains!5542 (ListLongMap!12957 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3656 (array!60082 array!60084 (_ BitVec 32) (_ BitVec 32) V!34377 V!34377 (_ BitVec 32) Int) ListLongMap!12957)

(assert (=> b!969851 (= res!649182 (contains!5542 (getCurrentListMap!3656 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28905 _keys!1717) i!822)))))

(declare-fun mapNonEmpty!35077 () Bool)

(declare-fun tp!66720 () Bool)

(assert (=> mapNonEmpty!35077 (= mapRes!35077 (and tp!66720 e!546753))))

(declare-fun mapRest!35077 () (Array (_ BitVec 32) ValueCell!10541))

(declare-fun mapValue!35077 () ValueCell!10541)

(declare-fun mapKey!35077 () (_ BitVec 32))

(assert (=> mapNonEmpty!35077 (= (arr!28906 _values!1425) (store mapRest!35077 mapKey!35077 mapValue!35077))))

(declare-fun res!649179 () Bool)

(assert (=> start!83136 (=> (not res!649179) (not e!546756))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83136 (= res!649179 (validMask!0 mask!2147))))

(assert (=> start!83136 e!546756))

(assert (=> start!83136 true))

(declare-fun array_inv!22435 (array!60084) Bool)

(assert (=> start!83136 (and (array_inv!22435 _values!1425) e!546754)))

(assert (=> start!83136 tp_is_empty!22045))

(assert (=> start!83136 tp!66721))

(declare-fun array_inv!22436 (array!60082) Bool)

(assert (=> start!83136 (array_inv!22436 _keys!1717)))

(assert (= (and start!83136 res!649179) b!969847))

(assert (= (and b!969847 res!649183) b!969843))

(assert (= (and b!969843 res!649178) b!969844))

(assert (= (and b!969844 res!649180) b!969845))

(assert (= (and b!969845 res!649181) b!969846))

(assert (= (and b!969846 res!649177) b!969851))

(assert (= (and b!969851 res!649182) b!969848))

(assert (= (and b!969849 condMapEmpty!35077) mapIsEmpty!35077))

(assert (= (and b!969849 (not condMapEmpty!35077)) mapNonEmpty!35077))

(get-info :version)

(assert (= (and mapNonEmpty!35077 ((_ is ValueCellFull!10541) mapValue!35077)) b!969842))

(assert (= (and b!969849 ((_ is ValueCellFull!10541) mapDefault!35077)) b!969850))

(assert (= start!83136 b!969849))

(declare-fun m!897149 () Bool)

(assert (=> b!969846 m!897149))

(assert (=> b!969846 m!897149))

(declare-fun m!897151 () Bool)

(assert (=> b!969846 m!897151))

(declare-fun m!897153 () Bool)

(assert (=> b!969851 m!897153))

(assert (=> b!969851 m!897149))

(assert (=> b!969851 m!897153))

(assert (=> b!969851 m!897149))

(declare-fun m!897155 () Bool)

(assert (=> b!969851 m!897155))

(declare-fun m!897157 () Bool)

(assert (=> b!969844 m!897157))

(declare-fun m!897159 () Bool)

(assert (=> mapNonEmpty!35077 m!897159))

(declare-fun m!897161 () Bool)

(assert (=> start!83136 m!897161))

(declare-fun m!897163 () Bool)

(assert (=> start!83136 m!897163))

(declare-fun m!897165 () Bool)

(assert (=> start!83136 m!897165))

(declare-fun m!897167 () Bool)

(assert (=> b!969843 m!897167))

(check-sat (not start!83136) (not b_next!19147) (not mapNonEmpty!35077) (not b!969844) (not b!969851) b_and!30609 tp_is_empty!22045 (not b!969843) (not b!969846))
(check-sat b_and!30609 (not b_next!19147))
