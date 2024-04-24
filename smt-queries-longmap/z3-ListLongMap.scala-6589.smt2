; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83586 () Bool)

(assert start!83586)

(declare-fun b_free!19411 () Bool)

(declare-fun b_next!19411 () Bool)

(assert (=> start!83586 (= b_free!19411 (not b_next!19411))))

(declare-fun tp!67512 () Bool)

(declare-fun b_and!31023 () Bool)

(assert (=> start!83586 (= tp!67512 b_and!31023)))

(declare-fun b!975157 () Bool)

(declare-fun e!549716 () Bool)

(declare-fun tp_is_empty!22309 () Bool)

(assert (=> b!975157 (= e!549716 tp_is_empty!22309)))

(declare-fun b!975158 () Bool)

(declare-fun res!652505 () Bool)

(declare-fun e!549717 () Bool)

(assert (=> b!975158 (=> (not res!652505) (not e!549717))))

(declare-datatypes ((array!60690 0))(
  ( (array!60691 (arr!29204 (Array (_ BitVec 32) (_ BitVec 64))) (size!29684 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60690)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!975158 (= res!652505 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29684 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29684 _keys!1717))))))

(declare-fun b!975159 () Bool)

(declare-fun res!652504 () Bool)

(assert (=> b!975159 (=> (not res!652504) (not e!549717))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60690 (_ BitVec 32)) Bool)

(assert (=> b!975159 (= res!652504 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!975160 () Bool)

(declare-fun res!652508 () Bool)

(assert (=> b!975160 (=> (not res!652508) (not e!549717))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!975160 (= res!652508 (validKeyInArray!0 (select (arr!29204 _keys!1717) i!822)))))

(declare-fun b!975161 () Bool)

(assert (=> b!975161 (= e!549717 false)))

(declare-datatypes ((V!34729 0))(
  ( (V!34730 (val!11205 Int)) )
))
(declare-datatypes ((ValueCell!10673 0))(
  ( (ValueCellFull!10673 (v!13761 V!34729)) (EmptyCell!10673) )
))
(declare-datatypes ((array!60692 0))(
  ( (array!60693 (arr!29205 (Array (_ BitVec 32) ValueCell!10673)) (size!29685 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60692)

(declare-datatypes ((tuple2!14408 0))(
  ( (tuple2!14409 (_1!7215 (_ BitVec 64)) (_2!7215 V!34729)) )
))
(declare-datatypes ((List!20253 0))(
  ( (Nil!20250) (Cons!20249 (h!21417 tuple2!14408) (t!28722 List!20253)) )
))
(declare-datatypes ((ListLongMap!13107 0))(
  ( (ListLongMap!13108 (toList!6569 List!20253)) )
))
(declare-fun lt!433113 () ListLongMap!13107)

(declare-fun zeroValue!1367 () V!34729)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34729)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3802 (array!60690 array!60692 (_ BitVec 32) (_ BitVec 32) V!34729 V!34729 (_ BitVec 32) Int) ListLongMap!13107)

(assert (=> b!975161 (= lt!433113 (getCurrentListMap!3802 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!652507 () Bool)

(assert (=> start!83586 (=> (not res!652507) (not e!549717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83586 (= res!652507 (validMask!0 mask!2147))))

(assert (=> start!83586 e!549717))

(assert (=> start!83586 true))

(declare-fun e!549714 () Bool)

(declare-fun array_inv!22641 (array!60692) Bool)

(assert (=> start!83586 (and (array_inv!22641 _values!1425) e!549714)))

(assert (=> start!83586 tp_is_empty!22309))

(assert (=> start!83586 tp!67512))

(declare-fun array_inv!22642 (array!60690) Bool)

(assert (=> start!83586 (array_inv!22642 _keys!1717)))

(declare-fun b!975162 () Bool)

(declare-fun res!652506 () Bool)

(assert (=> b!975162 (=> (not res!652506) (not e!549717))))

(declare-datatypes ((List!20254 0))(
  ( (Nil!20251) (Cons!20250 (h!21418 (_ BitVec 64)) (t!28723 List!20254)) )
))
(declare-fun arrayNoDuplicates!0 (array!60690 (_ BitVec 32) List!20254) Bool)

(assert (=> b!975162 (= res!652506 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20251))))

(declare-fun mapIsEmpty!35473 () Bool)

(declare-fun mapRes!35473 () Bool)

(assert (=> mapIsEmpty!35473 mapRes!35473))

(declare-fun b!975163 () Bool)

(declare-fun res!652503 () Bool)

(assert (=> b!975163 (=> (not res!652503) (not e!549717))))

(declare-fun contains!5674 (ListLongMap!13107 (_ BitVec 64)) Bool)

(assert (=> b!975163 (= res!652503 (contains!5674 (getCurrentListMap!3802 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29204 _keys!1717) i!822)))))

(declare-fun b!975164 () Bool)

(assert (=> b!975164 (= e!549714 (and e!549716 mapRes!35473))))

(declare-fun condMapEmpty!35473 () Bool)

(declare-fun mapDefault!35473 () ValueCell!10673)

(assert (=> b!975164 (= condMapEmpty!35473 (= (arr!29205 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10673)) mapDefault!35473)))))

(declare-fun mapNonEmpty!35473 () Bool)

(declare-fun tp!67513 () Bool)

(declare-fun e!549718 () Bool)

(assert (=> mapNonEmpty!35473 (= mapRes!35473 (and tp!67513 e!549718))))

(declare-fun mapValue!35473 () ValueCell!10673)

(declare-fun mapRest!35473 () (Array (_ BitVec 32) ValueCell!10673))

(declare-fun mapKey!35473 () (_ BitVec 32))

(assert (=> mapNonEmpty!35473 (= (arr!29205 _values!1425) (store mapRest!35473 mapKey!35473 mapValue!35473))))

(declare-fun b!975165 () Bool)

(declare-fun res!652502 () Bool)

(assert (=> b!975165 (=> (not res!652502) (not e!549717))))

(assert (=> b!975165 (= res!652502 (and (= (size!29685 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29684 _keys!1717) (size!29685 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!975166 () Bool)

(assert (=> b!975166 (= e!549718 tp_is_empty!22309)))

(assert (= (and start!83586 res!652507) b!975165))

(assert (= (and b!975165 res!652502) b!975159))

(assert (= (and b!975159 res!652504) b!975162))

(assert (= (and b!975162 res!652506) b!975158))

(assert (= (and b!975158 res!652505) b!975160))

(assert (= (and b!975160 res!652508) b!975163))

(assert (= (and b!975163 res!652503) b!975161))

(assert (= (and b!975164 condMapEmpty!35473) mapIsEmpty!35473))

(assert (= (and b!975164 (not condMapEmpty!35473)) mapNonEmpty!35473))

(get-info :version)

(assert (= (and mapNonEmpty!35473 ((_ is ValueCellFull!10673) mapValue!35473)) b!975166))

(assert (= (and b!975164 ((_ is ValueCellFull!10673) mapDefault!35473)) b!975157))

(assert (= start!83586 b!975164))

(declare-fun m!903119 () Bool)

(assert (=> b!975163 m!903119))

(declare-fun m!903121 () Bool)

(assert (=> b!975163 m!903121))

(assert (=> b!975163 m!903119))

(assert (=> b!975163 m!903121))

(declare-fun m!903123 () Bool)

(assert (=> b!975163 m!903123))

(declare-fun m!903125 () Bool)

(assert (=> start!83586 m!903125))

(declare-fun m!903127 () Bool)

(assert (=> start!83586 m!903127))

(declare-fun m!903129 () Bool)

(assert (=> start!83586 m!903129))

(assert (=> b!975160 m!903121))

(assert (=> b!975160 m!903121))

(declare-fun m!903131 () Bool)

(assert (=> b!975160 m!903131))

(declare-fun m!903133 () Bool)

(assert (=> b!975159 m!903133))

(declare-fun m!903135 () Bool)

(assert (=> b!975161 m!903135))

(declare-fun m!903137 () Bool)

(assert (=> b!975162 m!903137))

(declare-fun m!903139 () Bool)

(assert (=> mapNonEmpty!35473 m!903139))

(check-sat (not b!975163) (not mapNonEmpty!35473) b_and!31023 (not start!83586) (not b!975162) (not b!975160) tp_is_empty!22309 (not b_next!19411) (not b!975159) (not b!975161))
(check-sat b_and!31023 (not b_next!19411))
