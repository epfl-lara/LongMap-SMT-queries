; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133734 () Bool)

(assert start!133734)

(declare-fun b_free!32097 () Bool)

(declare-fun b_next!32097 () Bool)

(assert (=> start!133734 (= b_free!32097 (not b_next!32097))))

(declare-fun tp!113495 () Bool)

(declare-fun b_and!51667 () Bool)

(assert (=> start!133734 (= tp!113495 b_and!51667)))

(declare-fun b!1563725 () Bool)

(declare-fun e!871528 () Bool)

(declare-fun e!871527 () Bool)

(declare-fun mapRes!59601 () Bool)

(assert (=> b!1563725 (= e!871528 (and e!871527 mapRes!59601))))

(declare-fun condMapEmpty!59601 () Bool)

(declare-datatypes ((V!59963 0))(
  ( (V!59964 (val!19492 Int)) )
))
(declare-datatypes ((ValueCell!18378 0))(
  ( (ValueCellFull!18378 (v!22244 V!59963)) (EmptyCell!18378) )
))
(declare-datatypes ((array!104326 0))(
  ( (array!104327 (arr!50355 (Array (_ BitVec 32) ValueCell!18378)) (size!50905 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104326)

(declare-fun mapDefault!59601 () ValueCell!18378)

(assert (=> b!1563725 (= condMapEmpty!59601 (= (arr!50355 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18378)) mapDefault!59601)))))

(declare-fun b!1563726 () Bool)

(declare-fun tp_is_empty!38817 () Bool)

(assert (=> b!1563726 (= e!871527 tp_is_empty!38817)))

(declare-fun b!1563727 () Bool)

(declare-fun res!1069049 () Bool)

(declare-fun e!871525 () Bool)

(assert (=> b!1563727 (=> (not res!1069049) (not e!871525))))

(declare-datatypes ((array!104328 0))(
  ( (array!104329 (arr!50356 (Array (_ BitVec 32) (_ BitVec 64))) (size!50906 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104328)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104328 (_ BitVec 32)) Bool)

(assert (=> b!1563727 (= res!1069049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1563728 () Bool)

(declare-fun res!1069044 () Bool)

(assert (=> b!1563728 (=> (not res!1069044) (not e!871525))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1563728 (= res!1069044 (and (= (size!50905 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50906 _keys!637) (size!50905 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59601 () Bool)

(declare-fun tp!113496 () Bool)

(declare-fun e!871523 () Bool)

(assert (=> mapNonEmpty!59601 (= mapRes!59601 (and tp!113496 e!871523))))

(declare-fun mapValue!59601 () ValueCell!18378)

(declare-fun mapRest!59601 () (Array (_ BitVec 32) ValueCell!18378))

(declare-fun mapKey!59601 () (_ BitVec 32))

(assert (=> mapNonEmpty!59601 (= (arr!50355 _values!487) (store mapRest!59601 mapKey!59601 mapValue!59601))))

(declare-fun b!1563730 () Bool)

(declare-fun res!1069045 () Bool)

(assert (=> b!1563730 (=> (not res!1069045) (not e!871525))))

(declare-datatypes ((List!36532 0))(
  ( (Nil!36529) (Cons!36528 (h!37974 (_ BitVec 64)) (t!51379 List!36532)) )
))
(declare-fun arrayNoDuplicates!0 (array!104328 (_ BitVec 32) List!36532) Bool)

(assert (=> b!1563730 (= res!1069045 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36529))))

(declare-fun b!1563731 () Bool)

(declare-fun e!871526 () Bool)

(assert (=> b!1563731 (= e!871525 e!871526)))

(declare-fun res!1069050 () Bool)

(assert (=> b!1563731 (=> (not res!1069050) (not e!871526))))

(declare-datatypes ((tuple2!25148 0))(
  ( (tuple2!25149 (_1!12585 (_ BitVec 64)) (_2!12585 V!59963)) )
))
(declare-datatypes ((List!36533 0))(
  ( (Nil!36530) (Cons!36529 (h!37975 tuple2!25148) (t!51380 List!36533)) )
))
(declare-datatypes ((ListLongMap!22583 0))(
  ( (ListLongMap!22584 (toList!11307 List!36533)) )
))
(declare-fun lt!671945 () ListLongMap!22583)

(declare-fun contains!10297 (ListLongMap!22583 (_ BitVec 64)) Bool)

(assert (=> b!1563731 (= res!1069050 (not (contains!10297 lt!671945 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59963)

(declare-fun minValue!453 () V!59963)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6690 (array!104328 array!104326 (_ BitVec 32) (_ BitVec 32) V!59963 V!59963 (_ BitVec 32) Int) ListLongMap!22583)

(assert (=> b!1563731 (= lt!671945 (getCurrentListMapNoExtraKeys!6690 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1563732 () Bool)

(declare-fun res!1069046 () Bool)

(assert (=> b!1563732 (=> (not res!1069046) (not e!871525))))

(assert (=> b!1563732 (= res!1069046 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50906 _keys!637)) (bvslt from!782 (size!50906 _keys!637))))))

(declare-fun mapIsEmpty!59601 () Bool)

(assert (=> mapIsEmpty!59601 mapRes!59601))

(declare-fun b!1563733 () Bool)

(declare-fun res!1069048 () Bool)

(assert (=> b!1563733 (=> (not res!1069048) (not e!871525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1563733 (= res!1069048 (not (validKeyInArray!0 (select (arr!50356 _keys!637) from!782))))))

(declare-fun b!1563734 () Bool)

(assert (=> b!1563734 (= e!871523 tp_is_empty!38817)))

(declare-fun res!1069047 () Bool)

(assert (=> start!133734 (=> (not res!1069047) (not e!871525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133734 (= res!1069047 (validMask!0 mask!947))))

(assert (=> start!133734 e!871525))

(assert (=> start!133734 tp!113495))

(assert (=> start!133734 tp_is_empty!38817))

(assert (=> start!133734 true))

(declare-fun array_inv!39129 (array!104328) Bool)

(assert (=> start!133734 (array_inv!39129 _keys!637)))

(declare-fun array_inv!39130 (array!104326) Bool)

(assert (=> start!133734 (and (array_inv!39130 _values!487) e!871528)))

(declare-fun b!1563729 () Bool)

(assert (=> b!1563729 (= e!871526 false)))

(declare-fun lt!671946 () Bool)

(assert (=> b!1563729 (= lt!671946 (contains!10297 lt!671945 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and start!133734 res!1069047) b!1563728))

(assert (= (and b!1563728 res!1069044) b!1563727))

(assert (= (and b!1563727 res!1069049) b!1563730))

(assert (= (and b!1563730 res!1069045) b!1563732))

(assert (= (and b!1563732 res!1069046) b!1563733))

(assert (= (and b!1563733 res!1069048) b!1563731))

(assert (= (and b!1563731 res!1069050) b!1563729))

(assert (= (and b!1563725 condMapEmpty!59601) mapIsEmpty!59601))

(assert (= (and b!1563725 (not condMapEmpty!59601)) mapNonEmpty!59601))

(get-info :version)

(assert (= (and mapNonEmpty!59601 ((_ is ValueCellFull!18378) mapValue!59601)) b!1563734))

(assert (= (and b!1563725 ((_ is ValueCellFull!18378) mapDefault!59601)) b!1563726))

(assert (= start!133734 b!1563725))

(declare-fun m!1439171 () Bool)

(assert (=> b!1563729 m!1439171))

(declare-fun m!1439173 () Bool)

(assert (=> b!1563730 m!1439173))

(declare-fun m!1439175 () Bool)

(assert (=> start!133734 m!1439175))

(declare-fun m!1439177 () Bool)

(assert (=> start!133734 m!1439177))

(declare-fun m!1439179 () Bool)

(assert (=> start!133734 m!1439179))

(declare-fun m!1439181 () Bool)

(assert (=> b!1563733 m!1439181))

(assert (=> b!1563733 m!1439181))

(declare-fun m!1439183 () Bool)

(assert (=> b!1563733 m!1439183))

(declare-fun m!1439185 () Bool)

(assert (=> b!1563727 m!1439185))

(declare-fun m!1439187 () Bool)

(assert (=> b!1563731 m!1439187))

(declare-fun m!1439189 () Bool)

(assert (=> b!1563731 m!1439189))

(declare-fun m!1439191 () Bool)

(assert (=> mapNonEmpty!59601 m!1439191))

(check-sat (not b!1563729) tp_is_empty!38817 (not b_next!32097) (not mapNonEmpty!59601) (not b!1563731) (not b!1563730) (not b!1563733) (not b!1563727) b_and!51667 (not start!133734))
(check-sat b_and!51667 (not b_next!32097))
