; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108456 () Bool)

(assert start!108456)

(declare-fun b_free!28003 () Bool)

(declare-fun b_next!28003 () Bool)

(assert (=> start!108456 (= b_free!28003 (not b_next!28003))))

(declare-fun tp!99120 () Bool)

(declare-fun b_and!46045 () Bool)

(assert (=> start!108456 (= tp!99120 b_and!46045)))

(declare-fun b!1279985 () Bool)

(declare-fun e!731358 () Bool)

(declare-fun tp_is_empty!33643 () Bool)

(assert (=> b!1279985 (= e!731358 tp_is_empty!33643)))

(declare-fun b!1279986 () Bool)

(declare-fun e!731357 () Bool)

(declare-fun e!731360 () Bool)

(declare-fun mapRes!52016 () Bool)

(assert (=> b!1279986 (= e!731357 (and e!731360 mapRes!52016))))

(declare-fun condMapEmpty!52016 () Bool)

(declare-datatypes ((V!49961 0))(
  ( (V!49962 (val!16896 Int)) )
))
(declare-datatypes ((ValueCell!15923 0))(
  ( (ValueCellFull!15923 (v!19495 V!49961)) (EmptyCell!15923) )
))
(declare-datatypes ((array!84257 0))(
  ( (array!84258 (arr!40633 (Array (_ BitVec 32) ValueCell!15923)) (size!41185 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84257)

(declare-fun mapDefault!52016 () ValueCell!15923)

(assert (=> b!1279986 (= condMapEmpty!52016 (= (arr!40633 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!15923)) mapDefault!52016)))))

(declare-fun b!1279987 () Bool)

(declare-fun res!850265 () Bool)

(declare-fun e!731361 () Bool)

(assert (=> b!1279987 (=> (not res!850265) (not e!731361))))

(declare-datatypes ((array!84259 0))(
  ( (array!84260 (arr!40634 (Array (_ BitVec 32) (_ BitVec 64))) (size!41186 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84259)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84259 (_ BitVec 32)) Bool)

(assert (=> b!1279987 (= res!850265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1279988 () Bool)

(declare-fun res!850268 () Bool)

(assert (=> b!1279988 (=> (not res!850268) (not e!731361))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1279988 (= res!850268 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41186 _keys!1741))))))

(declare-fun b!1279989 () Bool)

(declare-fun res!850267 () Bool)

(assert (=> b!1279989 (=> (not res!850267) (not e!731361))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1279989 (= res!850267 (and (= (size!41185 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41186 _keys!1741) (size!41185 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!850264 () Bool)

(assert (=> start!108456 (=> (not res!850264) (not e!731361))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108456 (= res!850264 (validMask!0 mask!2175))))

(assert (=> start!108456 e!731361))

(assert (=> start!108456 tp_is_empty!33643))

(assert (=> start!108456 true))

(declare-fun array_inv!31011 (array!84257) Bool)

(assert (=> start!108456 (and (array_inv!31011 _values!1445) e!731357)))

(declare-fun array_inv!31012 (array!84259) Bool)

(assert (=> start!108456 (array_inv!31012 _keys!1741)))

(assert (=> start!108456 tp!99120))

(declare-fun mapIsEmpty!52016 () Bool)

(assert (=> mapIsEmpty!52016 mapRes!52016))

(declare-fun b!1279990 () Bool)

(assert (=> b!1279990 (= e!731360 tp_is_empty!33643)))

(declare-fun b!1279991 () Bool)

(declare-fun res!850266 () Bool)

(assert (=> b!1279991 (=> (not res!850266) (not e!731361))))

(declare-datatypes ((List!28885 0))(
  ( (Nil!28882) (Cons!28881 (h!30090 (_ BitVec 64)) (t!42417 List!28885)) )
))
(declare-fun arrayNoDuplicates!0 (array!84259 (_ BitVec 32) List!28885) Bool)

(assert (=> b!1279991 (= res!850266 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28882))))

(declare-fun b!1279992 () Bool)

(assert (=> b!1279992 (= e!731361 false)))

(declare-fun minValue!1387 () V!49961)

(declare-fun zeroValue!1387 () V!49961)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun lt!575899 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21694 0))(
  ( (tuple2!21695 (_1!10858 (_ BitVec 64)) (_2!10858 V!49961)) )
))
(declare-datatypes ((List!28886 0))(
  ( (Nil!28883) (Cons!28882 (h!30091 tuple2!21694) (t!42418 List!28886)) )
))
(declare-datatypes ((ListLongMap!19351 0))(
  ( (ListLongMap!19352 (toList!9691 List!28886)) )
))
(declare-fun contains!7736 (ListLongMap!19351 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4665 (array!84259 array!84257 (_ BitVec 32) (_ BitVec 32) V!49961 V!49961 (_ BitVec 32) Int) ListLongMap!19351)

(assert (=> b!1279992 (= lt!575899 (contains!7736 (getCurrentListMap!4665 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52016 () Bool)

(declare-fun tp!99119 () Bool)

(assert (=> mapNonEmpty!52016 (= mapRes!52016 (and tp!99119 e!731358))))

(declare-fun mapKey!52016 () (_ BitVec 32))

(declare-fun mapValue!52016 () ValueCell!15923)

(declare-fun mapRest!52016 () (Array (_ BitVec 32) ValueCell!15923))

(assert (=> mapNonEmpty!52016 (= (arr!40633 _values!1445) (store mapRest!52016 mapKey!52016 mapValue!52016))))

(assert (= (and start!108456 res!850264) b!1279989))

(assert (= (and b!1279989 res!850267) b!1279987))

(assert (= (and b!1279987 res!850265) b!1279991))

(assert (= (and b!1279991 res!850266) b!1279988))

(assert (= (and b!1279988 res!850268) b!1279992))

(assert (= (and b!1279986 condMapEmpty!52016) mapIsEmpty!52016))

(assert (= (and b!1279986 (not condMapEmpty!52016)) mapNonEmpty!52016))

(get-info :version)

(assert (= (and mapNonEmpty!52016 ((_ is ValueCellFull!15923) mapValue!52016)) b!1279985))

(assert (= (and b!1279986 ((_ is ValueCellFull!15923) mapDefault!52016)) b!1279990))

(assert (= start!108456 b!1279986))

(declare-fun m!1174305 () Bool)

(assert (=> start!108456 m!1174305))

(declare-fun m!1174307 () Bool)

(assert (=> start!108456 m!1174307))

(declare-fun m!1174309 () Bool)

(assert (=> start!108456 m!1174309))

(declare-fun m!1174311 () Bool)

(assert (=> b!1279992 m!1174311))

(assert (=> b!1279992 m!1174311))

(declare-fun m!1174313 () Bool)

(assert (=> b!1279992 m!1174313))

(declare-fun m!1174315 () Bool)

(assert (=> b!1279991 m!1174315))

(declare-fun m!1174317 () Bool)

(assert (=> b!1279987 m!1174317))

(declare-fun m!1174319 () Bool)

(assert (=> mapNonEmpty!52016 m!1174319))

(check-sat (not b_next!28003) (not mapNonEmpty!52016) (not b!1279991) (not b!1279992) tp_is_empty!33643 (not b!1279987) (not start!108456) b_and!46045)
(check-sat b_and!46045 (not b_next!28003))
