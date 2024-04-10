; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83402 () Bool)

(assert start!83402)

(declare-fun b_free!19395 () Bool)

(declare-fun b_next!19395 () Bool)

(assert (=> start!83402 (= b_free!19395 (not b_next!19395))))

(declare-fun tp!67463 () Bool)

(declare-fun b_and!30997 () Bool)

(assert (=> start!83402 (= tp!67463 b_and!30997)))

(declare-fun b!974014 () Bool)

(declare-fun e!549014 () Bool)

(declare-fun tp_is_empty!22293 () Bool)

(assert (=> b!974014 (= e!549014 tp_is_empty!22293)))

(declare-fun b!974015 () Bool)

(declare-fun res!651991 () Bool)

(declare-fun e!549015 () Bool)

(assert (=> b!974015 (=> (not res!651991) (not e!549015))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34707 0))(
  ( (V!34708 (val!11197 Int)) )
))
(declare-datatypes ((ValueCell!10665 0))(
  ( (ValueCellFull!10665 (v!13756 V!34707)) (EmptyCell!10665) )
))
(declare-datatypes ((array!60627 0))(
  ( (array!60628 (arr!29177 (Array (_ BitVec 32) ValueCell!10665)) (size!29656 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60627)

(declare-fun zeroValue!1367 () V!34707)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34707)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60629 0))(
  ( (array!60630 (arr!29178 (Array (_ BitVec 32) (_ BitVec 64))) (size!29657 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60629)

(declare-datatypes ((tuple2!14386 0))(
  ( (tuple2!14387 (_1!7204 (_ BitVec 64)) (_2!7204 V!34707)) )
))
(declare-datatypes ((List!20244 0))(
  ( (Nil!20241) (Cons!20240 (h!21402 tuple2!14386) (t!28721 List!20244)) )
))
(declare-datatypes ((ListLongMap!13083 0))(
  ( (ListLongMap!13084 (toList!6557 List!20244)) )
))
(declare-fun contains!5647 (ListLongMap!13083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3790 (array!60629 array!60627 (_ BitVec 32) (_ BitVec 32) V!34707 V!34707 (_ BitVec 32) Int) ListLongMap!13083)

(assert (=> b!974015 (= res!651991 (contains!5647 (getCurrentListMap!3790 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29178 _keys!1717) i!822)))))

(declare-fun b!974016 () Bool)

(declare-fun res!651995 () Bool)

(assert (=> b!974016 (=> (not res!651995) (not e!549015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60629 (_ BitVec 32)) Bool)

(assert (=> b!974016 (= res!651995 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapNonEmpty!35449 () Bool)

(declare-fun mapRes!35449 () Bool)

(declare-fun tp!67464 () Bool)

(declare-fun e!549012 () Bool)

(assert (=> mapNonEmpty!35449 (= mapRes!35449 (and tp!67464 e!549012))))

(declare-fun mapValue!35449 () ValueCell!10665)

(declare-fun mapRest!35449 () (Array (_ BitVec 32) ValueCell!10665))

(declare-fun mapKey!35449 () (_ BitVec 32))

(assert (=> mapNonEmpty!35449 (= (arr!29177 _values!1425) (store mapRest!35449 mapKey!35449 mapValue!35449))))

(declare-fun b!974017 () Bool)

(assert (=> b!974017 (= e!549015 false)))

(declare-fun lt!432728 () ListLongMap!13083)

(assert (=> b!974017 (= lt!432728 (getCurrentListMap!3790 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!651990 () Bool)

(assert (=> start!83402 (=> (not res!651990) (not e!549015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83402 (= res!651990 (validMask!0 mask!2147))))

(assert (=> start!83402 e!549015))

(assert (=> start!83402 true))

(declare-fun e!549016 () Bool)

(declare-fun array_inv!22567 (array!60627) Bool)

(assert (=> start!83402 (and (array_inv!22567 _values!1425) e!549016)))

(assert (=> start!83402 tp_is_empty!22293))

(assert (=> start!83402 tp!67463))

(declare-fun array_inv!22568 (array!60629) Bool)

(assert (=> start!83402 (array_inv!22568 _keys!1717)))

(declare-fun mapIsEmpty!35449 () Bool)

(assert (=> mapIsEmpty!35449 mapRes!35449))

(declare-fun b!974018 () Bool)

(declare-fun res!651992 () Bool)

(assert (=> b!974018 (=> (not res!651992) (not e!549015))))

(assert (=> b!974018 (= res!651992 (and (= (size!29656 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29657 _keys!1717) (size!29656 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974019 () Bool)

(declare-fun res!651996 () Bool)

(assert (=> b!974019 (=> (not res!651996) (not e!549015))))

(assert (=> b!974019 (= res!651996 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29657 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29657 _keys!1717))))))

(declare-fun b!974020 () Bool)

(declare-fun res!651993 () Bool)

(assert (=> b!974020 (=> (not res!651993) (not e!549015))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974020 (= res!651993 (validKeyInArray!0 (select (arr!29178 _keys!1717) i!822)))))

(declare-fun b!974021 () Bool)

(assert (=> b!974021 (= e!549016 (and e!549014 mapRes!35449))))

(declare-fun condMapEmpty!35449 () Bool)

(declare-fun mapDefault!35449 () ValueCell!10665)

(assert (=> b!974021 (= condMapEmpty!35449 (= (arr!29177 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10665)) mapDefault!35449)))))

(declare-fun b!974022 () Bool)

(declare-fun res!651994 () Bool)

(assert (=> b!974022 (=> (not res!651994) (not e!549015))))

(declare-datatypes ((List!20245 0))(
  ( (Nil!20242) (Cons!20241 (h!21403 (_ BitVec 64)) (t!28722 List!20245)) )
))
(declare-fun arrayNoDuplicates!0 (array!60629 (_ BitVec 32) List!20245) Bool)

(assert (=> b!974022 (= res!651994 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20242))))

(declare-fun b!974023 () Bool)

(assert (=> b!974023 (= e!549012 tp_is_empty!22293)))

(assert (= (and start!83402 res!651990) b!974018))

(assert (= (and b!974018 res!651992) b!974016))

(assert (= (and b!974016 res!651995) b!974022))

(assert (= (and b!974022 res!651994) b!974019))

(assert (= (and b!974019 res!651996) b!974020))

(assert (= (and b!974020 res!651993) b!974015))

(assert (= (and b!974015 res!651991) b!974017))

(assert (= (and b!974021 condMapEmpty!35449) mapIsEmpty!35449))

(assert (= (and b!974021 (not condMapEmpty!35449)) mapNonEmpty!35449))

(get-info :version)

(assert (= (and mapNonEmpty!35449 ((_ is ValueCellFull!10665) mapValue!35449)) b!974023))

(assert (= (and b!974021 ((_ is ValueCellFull!10665) mapDefault!35449)) b!974014))

(assert (= start!83402 b!974021))

(declare-fun m!901649 () Bool)

(assert (=> b!974017 m!901649))

(declare-fun m!901651 () Bool)

(assert (=> b!974020 m!901651))

(assert (=> b!974020 m!901651))

(declare-fun m!901653 () Bool)

(assert (=> b!974020 m!901653))

(declare-fun m!901655 () Bool)

(assert (=> mapNonEmpty!35449 m!901655))

(declare-fun m!901657 () Bool)

(assert (=> b!974022 m!901657))

(declare-fun m!901659 () Bool)

(assert (=> b!974016 m!901659))

(declare-fun m!901661 () Bool)

(assert (=> start!83402 m!901661))

(declare-fun m!901663 () Bool)

(assert (=> start!83402 m!901663))

(declare-fun m!901665 () Bool)

(assert (=> start!83402 m!901665))

(declare-fun m!901667 () Bool)

(assert (=> b!974015 m!901667))

(assert (=> b!974015 m!901651))

(assert (=> b!974015 m!901667))

(assert (=> b!974015 m!901651))

(declare-fun m!901669 () Bool)

(assert (=> b!974015 m!901669))

(check-sat (not b!974017) b_and!30997 (not b_next!19395) (not b!974022) (not b!974020) (not mapNonEmpty!35449) tp_is_empty!22293 (not b!974015) (not b!974016) (not start!83402))
(check-sat b_and!30997 (not b_next!19395))
