; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83432 () Bool)

(assert start!83432)

(declare-fun b_free!19425 () Bool)

(declare-fun b_next!19425 () Bool)

(assert (=> start!83432 (= b_free!19425 (not b_next!19425))))

(declare-fun tp!67553 () Bool)

(declare-fun b_and!31027 () Bool)

(assert (=> start!83432 (= tp!67553 b_and!31027)))

(declare-fun b!974465 () Bool)

(declare-fun res!652311 () Bool)

(declare-fun e!549240 () Bool)

(assert (=> b!974465 (=> (not res!652311) (not e!549240))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-datatypes ((V!34747 0))(
  ( (V!34748 (val!11212 Int)) )
))
(declare-fun minValue!1367 () V!34747)

(declare-fun i!822 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10680 0))(
  ( (ValueCellFull!10680 (v!13771 V!34747)) (EmptyCell!10680) )
))
(declare-datatypes ((array!60687 0))(
  ( (array!60688 (arr!29207 (Array (_ BitVec 32) ValueCell!10680)) (size!29686 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60687)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60689 0))(
  ( (array!60690 (arr!29208 (Array (_ BitVec 32) (_ BitVec 64))) (size!29687 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60689)

(declare-fun zeroValue!1367 () V!34747)

(declare-datatypes ((tuple2!14414 0))(
  ( (tuple2!14415 (_1!7218 (_ BitVec 64)) (_2!7218 V!34747)) )
))
(declare-datatypes ((List!20266 0))(
  ( (Nil!20263) (Cons!20262 (h!21424 tuple2!14414) (t!28743 List!20266)) )
))
(declare-datatypes ((ListLongMap!13111 0))(
  ( (ListLongMap!13112 (toList!6571 List!20266)) )
))
(declare-fun contains!5657 (ListLongMap!13111 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3804 (array!60689 array!60687 (_ BitVec 32) (_ BitVec 32) V!34747 V!34747 (_ BitVec 32) Int) ListLongMap!13111)

(assert (=> b!974465 (= res!652311 (contains!5657 (getCurrentListMap!3804 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29208 _keys!1717) i!822)))))

(declare-fun b!974466 () Bool)

(declare-fun e!549237 () Bool)

(declare-fun tp_is_empty!22323 () Bool)

(assert (=> b!974466 (= e!549237 tp_is_empty!22323)))

(declare-fun b!974467 () Bool)

(assert (=> b!974467 (= e!549240 false)))

(declare-fun lt!432773 () ListLongMap!13111)

(assert (=> b!974467 (= lt!432773 (getCurrentListMap!3804 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974468 () Bool)

(declare-fun res!652308 () Bool)

(assert (=> b!974468 (=> (not res!652308) (not e!549240))))

(assert (=> b!974468 (= res!652308 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29687 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29687 _keys!1717))))))

(declare-fun mapIsEmpty!35494 () Bool)

(declare-fun mapRes!35494 () Bool)

(assert (=> mapIsEmpty!35494 mapRes!35494))

(declare-fun b!974469 () Bool)

(declare-fun res!652305 () Bool)

(assert (=> b!974469 (=> (not res!652305) (not e!549240))))

(declare-datatypes ((List!20267 0))(
  ( (Nil!20264) (Cons!20263 (h!21425 (_ BitVec 64)) (t!28744 List!20267)) )
))
(declare-fun arrayNoDuplicates!0 (array!60689 (_ BitVec 32) List!20267) Bool)

(assert (=> b!974469 (= res!652305 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20264))))

(declare-fun b!974470 () Bool)

(declare-fun e!549238 () Bool)

(assert (=> b!974470 (= e!549238 tp_is_empty!22323)))

(declare-fun res!652309 () Bool)

(assert (=> start!83432 (=> (not res!652309) (not e!549240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83432 (= res!652309 (validMask!0 mask!2147))))

(assert (=> start!83432 e!549240))

(assert (=> start!83432 true))

(declare-fun e!549239 () Bool)

(declare-fun array_inv!22589 (array!60687) Bool)

(assert (=> start!83432 (and (array_inv!22589 _values!1425) e!549239)))

(assert (=> start!83432 tp_is_empty!22323))

(assert (=> start!83432 tp!67553))

(declare-fun array_inv!22590 (array!60689) Bool)

(assert (=> start!83432 (array_inv!22590 _keys!1717)))

(declare-fun b!974464 () Bool)

(declare-fun res!652307 () Bool)

(assert (=> b!974464 (=> (not res!652307) (not e!549240))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60689 (_ BitVec 32)) Bool)

(assert (=> b!974464 (= res!652307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35494 () Bool)

(declare-fun tp!67554 () Bool)

(assert (=> mapNonEmpty!35494 (= mapRes!35494 (and tp!67554 e!549237))))

(declare-fun mapRest!35494 () (Array (_ BitVec 32) ValueCell!10680))

(declare-fun mapKey!35494 () (_ BitVec 32))

(declare-fun mapValue!35494 () ValueCell!10680)

(assert (=> mapNonEmpty!35494 (= (arr!29207 _values!1425) (store mapRest!35494 mapKey!35494 mapValue!35494))))

(declare-fun b!974471 () Bool)

(declare-fun res!652310 () Bool)

(assert (=> b!974471 (=> (not res!652310) (not e!549240))))

(assert (=> b!974471 (= res!652310 (and (= (size!29686 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29687 _keys!1717) (size!29686 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974472 () Bool)

(declare-fun res!652306 () Bool)

(assert (=> b!974472 (=> (not res!652306) (not e!549240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974472 (= res!652306 (validKeyInArray!0 (select (arr!29208 _keys!1717) i!822)))))

(declare-fun b!974473 () Bool)

(assert (=> b!974473 (= e!549239 (and e!549238 mapRes!35494))))

(declare-fun condMapEmpty!35494 () Bool)

(declare-fun mapDefault!35494 () ValueCell!10680)

(assert (=> b!974473 (= condMapEmpty!35494 (= (arr!29207 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10680)) mapDefault!35494)))))

(assert (= (and start!83432 res!652309) b!974471))

(assert (= (and b!974471 res!652310) b!974464))

(assert (= (and b!974464 res!652307) b!974469))

(assert (= (and b!974469 res!652305) b!974468))

(assert (= (and b!974468 res!652308) b!974472))

(assert (= (and b!974472 res!652306) b!974465))

(assert (= (and b!974465 res!652311) b!974467))

(assert (= (and b!974473 condMapEmpty!35494) mapIsEmpty!35494))

(assert (= (and b!974473 (not condMapEmpty!35494)) mapNonEmpty!35494))

(get-info :version)

(assert (= (and mapNonEmpty!35494 ((_ is ValueCellFull!10680) mapValue!35494)) b!974466))

(assert (= (and b!974473 ((_ is ValueCellFull!10680) mapDefault!35494)) b!974470))

(assert (= start!83432 b!974473))

(declare-fun m!901979 () Bool)

(assert (=> b!974472 m!901979))

(assert (=> b!974472 m!901979))

(declare-fun m!901981 () Bool)

(assert (=> b!974472 m!901981))

(declare-fun m!901983 () Bool)

(assert (=> b!974465 m!901983))

(assert (=> b!974465 m!901979))

(assert (=> b!974465 m!901983))

(assert (=> b!974465 m!901979))

(declare-fun m!901985 () Bool)

(assert (=> b!974465 m!901985))

(declare-fun m!901987 () Bool)

(assert (=> start!83432 m!901987))

(declare-fun m!901989 () Bool)

(assert (=> start!83432 m!901989))

(declare-fun m!901991 () Bool)

(assert (=> start!83432 m!901991))

(declare-fun m!901993 () Bool)

(assert (=> b!974467 m!901993))

(declare-fun m!901995 () Bool)

(assert (=> b!974464 m!901995))

(declare-fun m!901997 () Bool)

(assert (=> b!974469 m!901997))

(declare-fun m!901999 () Bool)

(assert (=> mapNonEmpty!35494 m!901999))

(check-sat (not mapNonEmpty!35494) tp_is_empty!22323 (not b_next!19425) (not b!974472) (not b!974469) (not start!83432) (not b!974467) (not b!974464) (not b!974465) b_and!31027)
(check-sat b_and!31027 (not b_next!19425))
