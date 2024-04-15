; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110602 () Bool)

(assert start!110602)

(declare-fun b_free!29437 () Bool)

(declare-fun b_next!29437 () Bool)

(assert (=> start!110602 (= b_free!29437 (not b_next!29437))))

(declare-fun tp!103633 () Bool)

(declare-fun b_and!47627 () Bool)

(assert (=> start!110602 (= tp!103633 b_and!47627)))

(declare-fun b!1308573 () Bool)

(declare-fun res!868691 () Bool)

(declare-fun e!746605 () Bool)

(assert (=> b!1308573 (=> (not res!868691) (not e!746605))))

(declare-datatypes ((array!87249 0))(
  ( (array!87250 (arr!42105 (Array (_ BitVec 32) (_ BitVec 64))) (size!42657 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87249)

(declare-datatypes ((List!29949 0))(
  ( (Nil!29946) (Cons!29945 (h!31154 (_ BitVec 64)) (t!43547 List!29949)) )
))
(declare-fun arrayNoDuplicates!0 (array!87249 (_ BitVec 32) List!29949) Bool)

(assert (=> b!1308573 (= res!868691 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!29946))))

(declare-fun b!1308574 () Bool)

(declare-fun e!746606 () Bool)

(declare-fun e!746607 () Bool)

(declare-fun mapRes!54379 () Bool)

(assert (=> b!1308574 (= e!746606 (and e!746607 mapRes!54379))))

(declare-fun condMapEmpty!54379 () Bool)

(declare-datatypes ((V!51993 0))(
  ( (V!51994 (val!17658 Int)) )
))
(declare-datatypes ((ValueCell!16685 0))(
  ( (ValueCellFull!16685 (v!20284 V!51993)) (EmptyCell!16685) )
))
(declare-datatypes ((array!87251 0))(
  ( (array!87252 (arr!42106 (Array (_ BitVec 32) ValueCell!16685)) (size!42658 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87251)

(declare-fun mapDefault!54379 () ValueCell!16685)

(assert (=> b!1308574 (= condMapEmpty!54379 (= (arr!42106 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16685)) mapDefault!54379)))))

(declare-fun b!1308575 () Bool)

(declare-fun res!868699 () Bool)

(assert (=> b!1308575 (=> (not res!868699) (not e!746605))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1308575 (= res!868699 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42657 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1308576 () Bool)

(declare-fun e!746608 () Bool)

(declare-fun tp_is_empty!35167 () Bool)

(assert (=> b!1308576 (= e!746608 tp_is_empty!35167)))

(declare-fun b!1308577 () Bool)

(declare-fun res!868696 () Bool)

(assert (=> b!1308577 (=> (not res!868696) (not e!746605))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1308577 (= res!868696 (validKeyInArray!0 (select (arr!42105 _keys!1628) from!2020)))))

(declare-fun b!1308578 () Bool)

(declare-fun res!868694 () Bool)

(assert (=> b!1308578 (=> (not res!868694) (not e!746605))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1308578 (= res!868694 (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1308579 () Bool)

(declare-fun res!868692 () Bool)

(assert (=> b!1308579 (=> (not res!868692) (not e!746605))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun minValue!1296 () V!51993)

(declare-fun zeroValue!1296 () V!51993)

(declare-datatypes ((tuple2!22822 0))(
  ( (tuple2!22823 (_1!11422 (_ BitVec 64)) (_2!11422 V!51993)) )
))
(declare-datatypes ((List!29950 0))(
  ( (Nil!29947) (Cons!29946 (h!31155 tuple2!22822) (t!43548 List!29950)) )
))
(declare-datatypes ((ListLongMap!20479 0))(
  ( (ListLongMap!20480 (toList!10255 List!29950)) )
))
(declare-fun contains!8332 (ListLongMap!20479 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5150 (array!87249 array!87251 (_ BitVec 32) (_ BitVec 32) V!51993 V!51993 (_ BitVec 32) Int) ListLongMap!20479)

(assert (=> b!1308579 (= res!868692 (contains!8332 (getCurrentListMap!5150 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1308580 () Bool)

(declare-fun res!868693 () Bool)

(assert (=> b!1308580 (=> (not res!868693) (not e!746605))))

(assert (=> b!1308580 (= res!868693 (and (= (size!42658 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42657 _keys!1628) (size!42658 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun res!868695 () Bool)

(assert (=> start!110602 (=> (not res!868695) (not e!746605))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110602 (= res!868695 (validMask!0 mask!2040))))

(assert (=> start!110602 e!746605))

(assert (=> start!110602 tp!103633))

(declare-fun array_inv!32017 (array!87249) Bool)

(assert (=> start!110602 (array_inv!32017 _keys!1628)))

(assert (=> start!110602 true))

(assert (=> start!110602 tp_is_empty!35167))

(declare-fun array_inv!32018 (array!87251) Bool)

(assert (=> start!110602 (and (array_inv!32018 _values!1354) e!746606)))

(declare-fun b!1308581 () Bool)

(assert (=> b!1308581 (= e!746605 (not true))))

(assert (=> b!1308581 (contains!8332 (getCurrentListMap!5150 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43141 0))(
  ( (Unit!43142) )
))
(declare-fun lt!584988 () Unit!43141)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!15 (array!87249 array!87251 (_ BitVec 32) (_ BitVec 32) V!51993 V!51993 (_ BitVec 64) (_ BitVec 32) Int) Unit!43141)

(assert (=> b!1308581 (= lt!584988 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstNoXZero!15 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1308582 () Bool)

(declare-fun res!868698 () Bool)

(assert (=> b!1308582 (=> (not res!868698) (not e!746605))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87249 (_ BitVec 32)) Bool)

(assert (=> b!1308582 (= res!868698 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1308583 () Bool)

(assert (=> b!1308583 (= e!746607 tp_is_empty!35167)))

(declare-fun mapNonEmpty!54379 () Bool)

(declare-fun tp!103634 () Bool)

(assert (=> mapNonEmpty!54379 (= mapRes!54379 (and tp!103634 e!746608))))

(declare-fun mapRest!54379 () (Array (_ BitVec 32) ValueCell!16685))

(declare-fun mapKey!54379 () (_ BitVec 32))

(declare-fun mapValue!54379 () ValueCell!16685)

(assert (=> mapNonEmpty!54379 (= (arr!42106 _values!1354) (store mapRest!54379 mapKey!54379 mapValue!54379))))

(declare-fun b!1308584 () Bool)

(declare-fun res!868697 () Bool)

(assert (=> b!1308584 (=> (not res!868697) (not e!746605))))

(assert (=> b!1308584 (= res!868697 (not (= (select (arr!42105 _keys!1628) from!2020) k0!1175)))))

(declare-fun mapIsEmpty!54379 () Bool)

(assert (=> mapIsEmpty!54379 mapRes!54379))

(assert (= (and start!110602 res!868695) b!1308580))

(assert (= (and b!1308580 res!868693) b!1308582))

(assert (= (and b!1308582 res!868698) b!1308573))

(assert (= (and b!1308573 res!868691) b!1308575))

(assert (= (and b!1308575 res!868699) b!1308579))

(assert (= (and b!1308579 res!868692) b!1308584))

(assert (= (and b!1308584 res!868697) b!1308577))

(assert (= (and b!1308577 res!868696) b!1308578))

(assert (= (and b!1308578 res!868694) b!1308581))

(assert (= (and b!1308574 condMapEmpty!54379) mapIsEmpty!54379))

(assert (= (and b!1308574 (not condMapEmpty!54379)) mapNonEmpty!54379))

(get-info :version)

(assert (= (and mapNonEmpty!54379 ((_ is ValueCellFull!16685) mapValue!54379)) b!1308576))

(assert (= (and b!1308574 ((_ is ValueCellFull!16685) mapDefault!54379)) b!1308583))

(assert (= start!110602 b!1308574))

(declare-fun m!1198455 () Bool)

(assert (=> b!1308579 m!1198455))

(assert (=> b!1308579 m!1198455))

(declare-fun m!1198457 () Bool)

(assert (=> b!1308579 m!1198457))

(declare-fun m!1198459 () Bool)

(assert (=> b!1308582 m!1198459))

(declare-fun m!1198461 () Bool)

(assert (=> start!110602 m!1198461))

(declare-fun m!1198463 () Bool)

(assert (=> start!110602 m!1198463))

(declare-fun m!1198465 () Bool)

(assert (=> start!110602 m!1198465))

(declare-fun m!1198467 () Bool)

(assert (=> b!1308581 m!1198467))

(assert (=> b!1308581 m!1198467))

(declare-fun m!1198469 () Bool)

(assert (=> b!1308581 m!1198469))

(declare-fun m!1198471 () Bool)

(assert (=> b!1308581 m!1198471))

(declare-fun m!1198473 () Bool)

(assert (=> b!1308584 m!1198473))

(declare-fun m!1198475 () Bool)

(assert (=> b!1308573 m!1198475))

(declare-fun m!1198477 () Bool)

(assert (=> mapNonEmpty!54379 m!1198477))

(assert (=> b!1308577 m!1198473))

(assert (=> b!1308577 m!1198473))

(declare-fun m!1198479 () Bool)

(assert (=> b!1308577 m!1198479))

(check-sat (not b_next!29437) b_and!47627 (not b!1308579) (not b!1308582) (not b!1308581) (not start!110602) tp_is_empty!35167 (not b!1308577) (not b!1308573) (not mapNonEmpty!54379))
(check-sat b_and!47627 (not b_next!29437))
