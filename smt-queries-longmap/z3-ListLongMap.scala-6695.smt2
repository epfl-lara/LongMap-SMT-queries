; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84124 () Bool)

(assert start!84124)

(declare-fun b_free!19843 () Bool)

(declare-fun b_next!19843 () Bool)

(assert (=> start!84124 (= b_free!19843 (not b_next!19843))))

(declare-fun tp!69134 () Bool)

(declare-fun b_and!31743 () Bool)

(assert (=> start!84124 (= tp!69134 b_and!31743)))

(declare-fun b!983566 () Bool)

(declare-fun res!658190 () Bool)

(declare-fun e!554492 () Bool)

(assert (=> b!983566 (=> (not res!658190) (not e!554492))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35577 0))(
  ( (V!35578 (val!11523 Int)) )
))
(declare-datatypes ((ValueCell!10991 0))(
  ( (ValueCellFull!10991 (v!14084 V!35577)) (EmptyCell!10991) )
))
(declare-datatypes ((array!61800 0))(
  ( (array!61801 (arr!29758 (Array (_ BitVec 32) ValueCell!10991)) (size!30239 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61800)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61802 0))(
  ( (array!61803 (arr!29759 (Array (_ BitVec 32) (_ BitVec 64))) (size!30240 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61802)

(assert (=> b!983566 (= res!658190 (and (= (size!30239 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30240 _keys!1544) (size!30239 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983567 () Bool)

(declare-fun res!658189 () Bool)

(assert (=> b!983567 (=> (not res!658189) (not e!554492))))

(assert (=> b!983567 (= res!658189 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!36446 () Bool)

(declare-fun mapRes!36446 () Bool)

(assert (=> mapIsEmpty!36446 mapRes!36446))

(declare-fun b!983568 () Bool)

(declare-fun res!658187 () Bool)

(assert (=> b!983568 (=> (not res!658187) (not e!554492))))

(declare-datatypes ((List!20662 0))(
  ( (Nil!20659) (Cons!20658 (h!21820 (_ BitVec 64)) (t!29444 List!20662)) )
))
(declare-fun arrayNoDuplicates!0 (array!61802 (_ BitVec 32) List!20662) Bool)

(assert (=> b!983568 (= res!658187 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20659))))

(declare-fun res!658186 () Bool)

(assert (=> start!84124 (=> (not res!658186) (not e!554492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84124 (= res!658186 (validMask!0 mask!1948))))

(assert (=> start!84124 e!554492))

(assert (=> start!84124 true))

(declare-fun tp_is_empty!22945 () Bool)

(assert (=> start!84124 tp_is_empty!22945))

(declare-fun e!554489 () Bool)

(declare-fun array_inv!23017 (array!61800) Bool)

(assert (=> start!84124 (and (array_inv!23017 _values!1278) e!554489)))

(assert (=> start!84124 tp!69134))

(declare-fun array_inv!23018 (array!61802) Bool)

(assert (=> start!84124 (array_inv!23018 _keys!1544)))

(declare-fun b!983569 () Bool)

(assert (=> b!983569 (= e!554492 false)))

(declare-fun minValue!1220 () V!35577)

(declare-fun defaultEntry!1281 () Int)

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((tuple2!14808 0))(
  ( (tuple2!14809 (_1!7415 (_ BitVec 64)) (_2!7415 V!35577)) )
))
(declare-datatypes ((List!20663 0))(
  ( (Nil!20660) (Cons!20659 (h!21821 tuple2!14808) (t!29445 List!20663)) )
))
(declare-datatypes ((ListLongMap!13495 0))(
  ( (ListLongMap!13496 (toList!6763 List!20663)) )
))
(declare-fun lt!436329 () ListLongMap!13495)

(declare-fun zeroValue!1220 () V!35577)

(declare-fun getCurrentListMapNoExtraKeys!3472 (array!61802 array!61800 (_ BitVec 32) (_ BitVec 32) V!35577 V!35577 (_ BitVec 32) Int) ListLongMap!13495)

(assert (=> b!983569 (= lt!436329 (getCurrentListMapNoExtraKeys!3472 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983570 () Bool)

(declare-fun e!554491 () Bool)

(assert (=> b!983570 (= e!554489 (and e!554491 mapRes!36446))))

(declare-fun condMapEmpty!36446 () Bool)

(declare-fun mapDefault!36446 () ValueCell!10991)

(assert (=> b!983570 (= condMapEmpty!36446 (= (arr!29758 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10991)) mapDefault!36446)))))

(declare-fun b!983571 () Bool)

(assert (=> b!983571 (= e!554491 tp_is_empty!22945)))

(declare-fun b!983572 () Bool)

(declare-fun res!658191 () Bool)

(assert (=> b!983572 (=> (not res!658191) (not e!554492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61802 (_ BitVec 32)) Bool)

(assert (=> b!983572 (= res!658191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983573 () Bool)

(declare-fun res!658185 () Bool)

(assert (=> b!983573 (=> (not res!658185) (not e!554492))))

(assert (=> b!983573 (= res!658185 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30240 _keys!1544))))))

(declare-fun b!983574 () Bool)

(declare-fun res!658188 () Bool)

(assert (=> b!983574 (=> (not res!658188) (not e!554492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983574 (= res!658188 (validKeyInArray!0 (select (arr!29759 _keys!1544) from!1932)))))

(declare-fun b!983575 () Bool)

(declare-fun e!554488 () Bool)

(assert (=> b!983575 (= e!554488 tp_is_empty!22945)))

(declare-fun mapNonEmpty!36446 () Bool)

(declare-fun tp!69133 () Bool)

(assert (=> mapNonEmpty!36446 (= mapRes!36446 (and tp!69133 e!554488))))

(declare-fun mapRest!36446 () (Array (_ BitVec 32) ValueCell!10991))

(declare-fun mapValue!36446 () ValueCell!10991)

(declare-fun mapKey!36446 () (_ BitVec 32))

(assert (=> mapNonEmpty!36446 (= (arr!29758 _values!1278) (store mapRest!36446 mapKey!36446 mapValue!36446))))

(assert (= (and start!84124 res!658186) b!983566))

(assert (= (and b!983566 res!658190) b!983572))

(assert (= (and b!983572 res!658191) b!983568))

(assert (= (and b!983568 res!658187) b!983573))

(assert (= (and b!983573 res!658185) b!983574))

(assert (= (and b!983574 res!658188) b!983567))

(assert (= (and b!983567 res!658189) b!983569))

(assert (= (and b!983570 condMapEmpty!36446) mapIsEmpty!36446))

(assert (= (and b!983570 (not condMapEmpty!36446)) mapNonEmpty!36446))

(get-info :version)

(assert (= (and mapNonEmpty!36446 ((_ is ValueCellFull!10991) mapValue!36446)) b!983575))

(assert (= (and b!983570 ((_ is ValueCellFull!10991) mapDefault!36446)) b!983571))

(assert (= start!84124 b!983570))

(declare-fun m!910187 () Bool)

(assert (=> b!983572 m!910187))

(declare-fun m!910189 () Bool)

(assert (=> b!983574 m!910189))

(assert (=> b!983574 m!910189))

(declare-fun m!910191 () Bool)

(assert (=> b!983574 m!910191))

(declare-fun m!910193 () Bool)

(assert (=> start!84124 m!910193))

(declare-fun m!910195 () Bool)

(assert (=> start!84124 m!910195))

(declare-fun m!910197 () Bool)

(assert (=> start!84124 m!910197))

(declare-fun m!910199 () Bool)

(assert (=> b!983568 m!910199))

(declare-fun m!910201 () Bool)

(assert (=> b!983569 m!910201))

(declare-fun m!910203 () Bool)

(assert (=> mapNonEmpty!36446 m!910203))

(check-sat (not b!983569) b_and!31743 tp_is_empty!22945 (not b!983572) (not b!983568) (not mapNonEmpty!36446) (not b_next!19843) (not start!84124) (not b!983574))
(check-sat b_and!31743 (not b_next!19843))
