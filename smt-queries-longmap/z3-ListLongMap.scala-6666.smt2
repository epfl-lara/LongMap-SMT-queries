; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83970 () Bool)

(assert start!83970)

(declare-fun b!981256 () Bool)

(declare-fun e!553187 () Bool)

(declare-fun tp_is_empty!22773 () Bool)

(assert (=> b!981256 (= e!553187 tp_is_empty!22773)))

(declare-fun b!981257 () Bool)

(declare-fun res!656632 () Bool)

(declare-fun e!553188 () Bool)

(assert (=> b!981257 (=> (not res!656632) (not e!553188))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61543 0))(
  ( (array!61544 (arr!29629 (Array (_ BitVec 32) (_ BitVec 64))) (size!30108 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61543)

(assert (=> b!981257 (= res!656632 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30108 _keys!1544))))))

(declare-fun mapNonEmpty!36188 () Bool)

(declare-fun mapRes!36188 () Bool)

(declare-fun tp!68701 () Bool)

(assert (=> mapNonEmpty!36188 (= mapRes!36188 (and tp!68701 e!553187))))

(declare-datatypes ((V!35347 0))(
  ( (V!35348 (val!11437 Int)) )
))
(declare-datatypes ((ValueCell!10905 0))(
  ( (ValueCellFull!10905 (v!13999 V!35347)) (EmptyCell!10905) )
))
(declare-fun mapValue!36188 () ValueCell!10905)

(declare-datatypes ((array!61545 0))(
  ( (array!61546 (arr!29630 (Array (_ BitVec 32) ValueCell!10905)) (size!30109 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61545)

(declare-fun mapKey!36188 () (_ BitVec 32))

(declare-fun mapRest!36188 () (Array (_ BitVec 32) ValueCell!10905))

(assert (=> mapNonEmpty!36188 (= (arr!29630 _values!1278) (store mapRest!36188 mapKey!36188 mapValue!36188))))

(declare-fun b!981258 () Bool)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981258 (= e!553188 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!1932) #b00000000000000000000000000000000)))))

(declare-fun res!656633 () Bool)

(assert (=> start!83970 (=> (not res!656633) (not e!553188))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83970 (= res!656633 (validMask!0 mask!1948))))

(assert (=> start!83970 e!553188))

(assert (=> start!83970 true))

(declare-fun e!553186 () Bool)

(declare-fun array_inv!22907 (array!61545) Bool)

(assert (=> start!83970 (and (array_inv!22907 _values!1278) e!553186)))

(declare-fun array_inv!22908 (array!61543) Bool)

(assert (=> start!83970 (array_inv!22908 _keys!1544)))

(declare-fun mapIsEmpty!36188 () Bool)

(assert (=> mapIsEmpty!36188 mapRes!36188))

(declare-fun b!981259 () Bool)

(declare-fun res!656631 () Bool)

(assert (=> b!981259 (=> (not res!656631) (not e!553188))))

(assert (=> b!981259 (= res!656631 (and (= (size!30109 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30108 _keys!1544) (size!30109 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981260 () Bool)

(declare-fun e!553185 () Bool)

(assert (=> b!981260 (= e!553186 (and e!553185 mapRes!36188))))

(declare-fun condMapEmpty!36188 () Bool)

(declare-fun mapDefault!36188 () ValueCell!10905)

(assert (=> b!981260 (= condMapEmpty!36188 (= (arr!29630 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10905)) mapDefault!36188)))))

(declare-fun b!981261 () Bool)

(declare-fun res!656628 () Bool)

(assert (=> b!981261 (=> (not res!656628) (not e!553188))))

(declare-datatypes ((List!20522 0))(
  ( (Nil!20519) (Cons!20518 (h!21680 (_ BitVec 64)) (t!29205 List!20522)) )
))
(declare-fun arrayNoDuplicates!0 (array!61543 (_ BitVec 32) List!20522) Bool)

(assert (=> b!981261 (= res!656628 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20519))))

(declare-fun b!981262 () Bool)

(declare-fun res!656629 () Bool)

(assert (=> b!981262 (=> (not res!656629) (not e!553188))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981262 (= res!656629 (validKeyInArray!0 (select (arr!29629 _keys!1544) from!1932)))))

(declare-fun b!981263 () Bool)

(assert (=> b!981263 (= e!553185 tp_is_empty!22773)))

(declare-fun b!981264 () Bool)

(declare-fun res!656630 () Bool)

(assert (=> b!981264 (=> (not res!656630) (not e!553188))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61543 (_ BitVec 32)) Bool)

(assert (=> b!981264 (= res!656630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83970 res!656633) b!981259))

(assert (= (and b!981259 res!656631) b!981264))

(assert (= (and b!981264 res!656630) b!981261))

(assert (= (and b!981261 res!656628) b!981257))

(assert (= (and b!981257 res!656632) b!981262))

(assert (= (and b!981262 res!656629) b!981258))

(assert (= (and b!981260 condMapEmpty!36188) mapIsEmpty!36188))

(assert (= (and b!981260 (not condMapEmpty!36188)) mapNonEmpty!36188))

(get-info :version)

(assert (= (and mapNonEmpty!36188 ((_ is ValueCellFull!10905) mapValue!36188)) b!981256))

(assert (= (and b!981260 ((_ is ValueCellFull!10905) mapDefault!36188)) b!981263))

(assert (= start!83970 b!981260))

(declare-fun m!908687 () Bool)

(assert (=> b!981262 m!908687))

(assert (=> b!981262 m!908687))

(declare-fun m!908689 () Bool)

(assert (=> b!981262 m!908689))

(declare-fun m!908691 () Bool)

(assert (=> start!83970 m!908691))

(declare-fun m!908693 () Bool)

(assert (=> start!83970 m!908693))

(declare-fun m!908695 () Bool)

(assert (=> start!83970 m!908695))

(declare-fun m!908697 () Bool)

(assert (=> b!981261 m!908697))

(declare-fun m!908699 () Bool)

(assert (=> b!981264 m!908699))

(declare-fun m!908701 () Bool)

(assert (=> mapNonEmpty!36188 m!908701))

(check-sat (not b!981261) (not mapNonEmpty!36188) (not b!981264) tp_is_empty!22773 (not b!981262) (not start!83970))
(check-sat)
