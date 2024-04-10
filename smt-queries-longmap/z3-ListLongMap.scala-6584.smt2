; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83390 () Bool)

(assert start!83390)

(declare-fun b_free!19383 () Bool)

(declare-fun b_next!19383 () Bool)

(assert (=> start!83390 (= b_free!19383 (not b_next!19383))))

(declare-fun tp!67428 () Bool)

(declare-fun b_and!30985 () Bool)

(assert (=> start!83390 (= tp!67428 b_and!30985)))

(declare-fun b!973834 () Bool)

(declare-fun e!548923 () Bool)

(declare-fun e!548922 () Bool)

(declare-fun mapRes!35431 () Bool)

(assert (=> b!973834 (= e!548923 (and e!548922 mapRes!35431))))

(declare-fun condMapEmpty!35431 () Bool)

(declare-datatypes ((V!34691 0))(
  ( (V!34692 (val!11191 Int)) )
))
(declare-datatypes ((ValueCell!10659 0))(
  ( (ValueCellFull!10659 (v!13750 V!34691)) (EmptyCell!10659) )
))
(declare-datatypes ((array!60603 0))(
  ( (array!60604 (arr!29165 (Array (_ BitVec 32) ValueCell!10659)) (size!29644 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60603)

(declare-fun mapDefault!35431 () ValueCell!10659)

(assert (=> b!973834 (= condMapEmpty!35431 (= (arr!29165 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10659)) mapDefault!35431)))))

(declare-fun mapIsEmpty!35431 () Bool)

(assert (=> mapIsEmpty!35431 mapRes!35431))

(declare-fun mapNonEmpty!35431 () Bool)

(declare-fun tp!67427 () Bool)

(declare-fun e!548926 () Bool)

(assert (=> mapNonEmpty!35431 (= mapRes!35431 (and tp!67427 e!548926))))

(declare-fun mapValue!35431 () ValueCell!10659)

(declare-fun mapKey!35431 () (_ BitVec 32))

(declare-fun mapRest!35431 () (Array (_ BitVec 32) ValueCell!10659))

(assert (=> mapNonEmpty!35431 (= (arr!29165 _values!1425) (store mapRest!35431 mapKey!35431 mapValue!35431))))

(declare-fun b!973835 () Bool)

(declare-fun res!651870 () Bool)

(declare-fun e!548924 () Bool)

(assert (=> b!973835 (=> (not res!651870) (not e!548924))))

(declare-datatypes ((array!60605 0))(
  ( (array!60606 (arr!29166 (Array (_ BitVec 32) (_ BitVec 64))) (size!29645 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60605)

(declare-datatypes ((List!20233 0))(
  ( (Nil!20230) (Cons!20229 (h!21391 (_ BitVec 64)) (t!28710 List!20233)) )
))
(declare-fun arrayNoDuplicates!0 (array!60605 (_ BitVec 32) List!20233) Bool)

(assert (=> b!973835 (= res!651870 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20230))))

(declare-fun b!973836 () Bool)

(declare-fun tp_is_empty!22281 () Bool)

(assert (=> b!973836 (= e!548922 tp_is_empty!22281)))

(declare-fun b!973837 () Bool)

(assert (=> b!973837 (= e!548924 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34691)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34691)

(declare-datatypes ((tuple2!14374 0))(
  ( (tuple2!14375 (_1!7198 (_ BitVec 64)) (_2!7198 V!34691)) )
))
(declare-datatypes ((List!20234 0))(
  ( (Nil!20231) (Cons!20230 (h!21392 tuple2!14374) (t!28711 List!20234)) )
))
(declare-datatypes ((ListLongMap!13071 0))(
  ( (ListLongMap!13072 (toList!6551 List!20234)) )
))
(declare-fun lt!432710 () ListLongMap!13071)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3784 (array!60605 array!60603 (_ BitVec 32) (_ BitVec 32) V!34691 V!34691 (_ BitVec 32) Int) ListLongMap!13071)

(assert (=> b!973837 (= lt!432710 (getCurrentListMap!3784 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!651866 () Bool)

(assert (=> start!83390 (=> (not res!651866) (not e!548924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83390 (= res!651866 (validMask!0 mask!2147))))

(assert (=> start!83390 e!548924))

(assert (=> start!83390 true))

(declare-fun array_inv!22559 (array!60603) Bool)

(assert (=> start!83390 (and (array_inv!22559 _values!1425) e!548923)))

(assert (=> start!83390 tp_is_empty!22281))

(assert (=> start!83390 tp!67428))

(declare-fun array_inv!22560 (array!60605) Bool)

(assert (=> start!83390 (array_inv!22560 _keys!1717)))

(declare-fun b!973838 () Bool)

(assert (=> b!973838 (= e!548926 tp_is_empty!22281)))

(declare-fun b!973839 () Bool)

(declare-fun res!651867 () Bool)

(assert (=> b!973839 (=> (not res!651867) (not e!548924))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!973839 (= res!651867 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29645 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29645 _keys!1717))))))

(declare-fun b!973840 () Bool)

(declare-fun res!651869 () Bool)

(assert (=> b!973840 (=> (not res!651869) (not e!548924))))

(declare-fun contains!5642 (ListLongMap!13071 (_ BitVec 64)) Bool)

(assert (=> b!973840 (= res!651869 (contains!5642 (getCurrentListMap!3784 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29166 _keys!1717) i!822)))))

(declare-fun b!973841 () Bool)

(declare-fun res!651868 () Bool)

(assert (=> b!973841 (=> (not res!651868) (not e!548924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973841 (= res!651868 (validKeyInArray!0 (select (arr!29166 _keys!1717) i!822)))))

(declare-fun b!973842 () Bool)

(declare-fun res!651864 () Bool)

(assert (=> b!973842 (=> (not res!651864) (not e!548924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60605 (_ BitVec 32)) Bool)

(assert (=> b!973842 (= res!651864 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973843 () Bool)

(declare-fun res!651865 () Bool)

(assert (=> b!973843 (=> (not res!651865) (not e!548924))))

(assert (=> b!973843 (= res!651865 (and (= (size!29644 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29645 _keys!1717) (size!29644 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(assert (= (and start!83390 res!651866) b!973843))

(assert (= (and b!973843 res!651865) b!973842))

(assert (= (and b!973842 res!651864) b!973835))

(assert (= (and b!973835 res!651870) b!973839))

(assert (= (and b!973839 res!651867) b!973841))

(assert (= (and b!973841 res!651868) b!973840))

(assert (= (and b!973840 res!651869) b!973837))

(assert (= (and b!973834 condMapEmpty!35431) mapIsEmpty!35431))

(assert (= (and b!973834 (not condMapEmpty!35431)) mapNonEmpty!35431))

(get-info :version)

(assert (= (and mapNonEmpty!35431 ((_ is ValueCellFull!10659) mapValue!35431)) b!973838))

(assert (= (and b!973834 ((_ is ValueCellFull!10659) mapDefault!35431)) b!973836))

(assert (= start!83390 b!973834))

(declare-fun m!901517 () Bool)

(assert (=> b!973835 m!901517))

(declare-fun m!901519 () Bool)

(assert (=> b!973840 m!901519))

(declare-fun m!901521 () Bool)

(assert (=> b!973840 m!901521))

(assert (=> b!973840 m!901519))

(assert (=> b!973840 m!901521))

(declare-fun m!901523 () Bool)

(assert (=> b!973840 m!901523))

(declare-fun m!901525 () Bool)

(assert (=> b!973837 m!901525))

(declare-fun m!901527 () Bool)

(assert (=> mapNonEmpty!35431 m!901527))

(declare-fun m!901529 () Bool)

(assert (=> start!83390 m!901529))

(declare-fun m!901531 () Bool)

(assert (=> start!83390 m!901531))

(declare-fun m!901533 () Bool)

(assert (=> start!83390 m!901533))

(declare-fun m!901535 () Bool)

(assert (=> b!973842 m!901535))

(assert (=> b!973841 m!901521))

(assert (=> b!973841 m!901521))

(declare-fun m!901537 () Bool)

(assert (=> b!973841 m!901537))

(check-sat b_and!30985 (not b!973835) (not b!973842) (not b_next!19383) tp_is_empty!22281 (not b!973837) (not b!973840) (not b!973841) (not start!83390) (not mapNonEmpty!35431))
(check-sat b_and!30985 (not b_next!19383))
