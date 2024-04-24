; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83328 () Bool)

(assert start!83328)

(declare-fun b_free!19153 () Bool)

(declare-fun b_next!19153 () Bool)

(assert (=> start!83328 (= b_free!19153 (not b_next!19153))))

(declare-fun tp!66739 () Bool)

(declare-fun b_and!30651 () Bool)

(assert (=> start!83328 (= tp!66739 b_and!30651)))

(declare-fun b!971072 () Bool)

(declare-fun e!547530 () Bool)

(declare-fun tp_is_empty!22051 () Bool)

(assert (=> b!971072 (= e!547530 tp_is_empty!22051)))

(declare-fun b!971073 () Bool)

(declare-fun res!649694 () Bool)

(declare-fun e!547528 () Bool)

(assert (=> b!971073 (=> (not res!649694) (not e!547528))))

(declare-datatypes ((array!60180 0))(
  ( (array!60181 (arr!28949 (Array (_ BitVec 32) (_ BitVec 64))) (size!29429 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60180)

(declare-datatypes ((List!20047 0))(
  ( (Nil!20044) (Cons!20043 (h!21211 (_ BitVec 64)) (t!28402 List!20047)) )
))
(declare-fun arrayNoDuplicates!0 (array!60180 (_ BitVec 32) List!20047) Bool)

(assert (=> b!971073 (= res!649694 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20044))))

(declare-fun mapNonEmpty!35086 () Bool)

(declare-fun mapRes!35086 () Bool)

(declare-fun tp!66738 () Bool)

(assert (=> mapNonEmpty!35086 (= mapRes!35086 (and tp!66738 e!547530))))

(declare-datatypes ((V!34385 0))(
  ( (V!34386 (val!11076 Int)) )
))
(declare-datatypes ((ValueCell!10544 0))(
  ( (ValueCellFull!10544 (v!13632 V!34385)) (EmptyCell!10544) )
))
(declare-fun mapRest!35086 () (Array (_ BitVec 32) ValueCell!10544))

(declare-fun mapValue!35086 () ValueCell!10544)

(declare-datatypes ((array!60182 0))(
  ( (array!60183 (arr!28950 (Array (_ BitVec 32) ValueCell!10544)) (size!29430 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60182)

(declare-fun mapKey!35086 () (_ BitVec 32))

(assert (=> mapNonEmpty!35086 (= (arr!28950 _values!1425) (store mapRest!35086 mapKey!35086 mapValue!35086))))

(declare-fun res!649693 () Bool)

(assert (=> start!83328 (=> (not res!649693) (not e!547528))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83328 (= res!649693 (validMask!0 mask!2147))))

(assert (=> start!83328 e!547528))

(assert (=> start!83328 true))

(declare-fun e!547531 () Bool)

(declare-fun array_inv!22459 (array!60182) Bool)

(assert (=> start!83328 (and (array_inv!22459 _values!1425) e!547531)))

(assert (=> start!83328 tp_is_empty!22051))

(assert (=> start!83328 tp!66739))

(declare-fun array_inv!22460 (array!60180) Bool)

(assert (=> start!83328 (array_inv!22460 _keys!1717)))

(declare-fun b!971074 () Bool)

(declare-fun e!547527 () Bool)

(assert (=> b!971074 (= e!547531 (and e!547527 mapRes!35086))))

(declare-fun condMapEmpty!35086 () Bool)

(declare-fun mapDefault!35086 () ValueCell!10544)

(assert (=> b!971074 (= condMapEmpty!35086 (= (arr!28950 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10544)) mapDefault!35086)))))

(declare-fun b!971075 () Bool)

(declare-fun res!649692 () Bool)

(assert (=> b!971075 (=> (not res!649692) (not e!547528))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60180 (_ BitVec 32)) Bool)

(assert (=> b!971075 (= res!649692 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971076 () Bool)

(declare-fun res!649697 () Bool)

(assert (=> b!971076 (=> (not res!649697) (not e!547528))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!971076 (= res!649697 (and (= (size!29430 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29429 _keys!1717) (size!29430 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35086 () Bool)

(assert (=> mapIsEmpty!35086 mapRes!35086))

(declare-fun b!971077 () Bool)

(assert (=> b!971077 (= e!547527 tp_is_empty!22051)))

(declare-fun b!971078 () Bool)

(assert (=> b!971078 (= e!547528 false)))

(declare-fun lt!432069 () Bool)

(declare-fun zeroValue!1367 () V!34385)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34385)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((tuple2!14188 0))(
  ( (tuple2!14189 (_1!7105 (_ BitVec 64)) (_2!7105 V!34385)) )
))
(declare-datatypes ((List!20048 0))(
  ( (Nil!20045) (Cons!20044 (h!21212 tuple2!14188) (t!28403 List!20048)) )
))
(declare-datatypes ((ListLongMap!12887 0))(
  ( (ListLongMap!12888 (toList!6459 List!20048)) )
))
(declare-fun contains!5574 (ListLongMap!12887 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3692 (array!60180 array!60182 (_ BitVec 32) (_ BitVec 32) V!34385 V!34385 (_ BitVec 32) Int) ListLongMap!12887)

(assert (=> b!971078 (= lt!432069 (contains!5574 (getCurrentListMap!3692 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!28949 _keys!1717) i!822)))))

(declare-fun b!971079 () Bool)

(declare-fun res!649695 () Bool)

(assert (=> b!971079 (=> (not res!649695) (not e!547528))))

(assert (=> b!971079 (= res!649695 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29429 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29429 _keys!1717))))))

(declare-fun b!971080 () Bool)

(declare-fun res!649696 () Bool)

(assert (=> b!971080 (=> (not res!649696) (not e!547528))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971080 (= res!649696 (validKeyInArray!0 (select (arr!28949 _keys!1717) i!822)))))

(assert (= (and start!83328 res!649693) b!971076))

(assert (= (and b!971076 res!649697) b!971075))

(assert (= (and b!971075 res!649692) b!971073))

(assert (= (and b!971073 res!649694) b!971079))

(assert (= (and b!971079 res!649695) b!971080))

(assert (= (and b!971080 res!649696) b!971078))

(assert (= (and b!971074 condMapEmpty!35086) mapIsEmpty!35086))

(assert (= (and b!971074 (not condMapEmpty!35086)) mapNonEmpty!35086))

(get-info :version)

(assert (= (and mapNonEmpty!35086 ((_ is ValueCellFull!10544) mapValue!35086)) b!971072))

(assert (= (and b!971074 ((_ is ValueCellFull!10544) mapDefault!35086)) b!971077))

(assert (= start!83328 b!971074))

(declare-fun m!899261 () Bool)

(assert (=> b!971078 m!899261))

(declare-fun m!899263 () Bool)

(assert (=> b!971078 m!899263))

(assert (=> b!971078 m!899261))

(assert (=> b!971078 m!899263))

(declare-fun m!899265 () Bool)

(assert (=> b!971078 m!899265))

(declare-fun m!899267 () Bool)

(assert (=> b!971075 m!899267))

(declare-fun m!899269 () Bool)

(assert (=> b!971073 m!899269))

(assert (=> b!971080 m!899263))

(assert (=> b!971080 m!899263))

(declare-fun m!899271 () Bool)

(assert (=> b!971080 m!899271))

(declare-fun m!899273 () Bool)

(assert (=> start!83328 m!899273))

(declare-fun m!899275 () Bool)

(assert (=> start!83328 m!899275))

(declare-fun m!899277 () Bool)

(assert (=> start!83328 m!899277))

(declare-fun m!899279 () Bool)

(assert (=> mapNonEmpty!35086 m!899279))

(check-sat (not mapNonEmpty!35086) (not b!971073) b_and!30651 (not start!83328) (not b!971078) (not b!971075) (not b!971080) tp_is_empty!22051 (not b_next!19153))
(check-sat b_and!30651 (not b_next!19153))
