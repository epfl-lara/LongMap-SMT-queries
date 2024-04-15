; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83448 () Bool)

(assert start!83448)

(declare-fun b_free!19453 () Bool)

(declare-fun b_next!19453 () Bool)

(assert (=> start!83448 (= b_free!19453 (not b_next!19453))))

(declare-fun tp!67647 () Bool)

(declare-fun b_and!31029 () Bool)

(assert (=> start!83448 (= tp!67647 b_and!31029)))

(declare-fun b!974708 () Bool)

(declare-fun res!652526 () Bool)

(declare-fun e!549356 () Bool)

(assert (=> b!974708 (=> (not res!652526) (not e!549356))))

(declare-datatypes ((array!60676 0))(
  ( (array!60677 (arr!29202 (Array (_ BitVec 32) (_ BitVec 64))) (size!29683 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60676)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60676 (_ BitVec 32)) Bool)

(assert (=> b!974708 (= res!652526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!652528 () Bool)

(assert (=> start!83448 (=> (not res!652528) (not e!549356))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83448 (= res!652528 (validMask!0 mask!2147))))

(assert (=> start!83448 e!549356))

(assert (=> start!83448 true))

(declare-datatypes ((V!34793 0))(
  ( (V!34794 (val!11229 Int)) )
))
(declare-datatypes ((ValueCell!10697 0))(
  ( (ValueCellFull!10697 (v!13787 V!34793)) (EmptyCell!10697) )
))
(declare-datatypes ((array!60678 0))(
  ( (array!60679 (arr!29203 (Array (_ BitVec 32) ValueCell!10697)) (size!29684 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60678)

(declare-fun e!549357 () Bool)

(declare-fun array_inv!22635 (array!60678) Bool)

(assert (=> start!83448 (and (array_inv!22635 _values!1425) e!549357)))

(declare-fun tp_is_empty!22357 () Bool)

(assert (=> start!83448 tp_is_empty!22357))

(assert (=> start!83448 tp!67647))

(declare-fun array_inv!22636 (array!60676) Bool)

(assert (=> start!83448 (array_inv!22636 _keys!1717)))

(declare-fun b!974709 () Bool)

(declare-fun res!652530 () Bool)

(assert (=> b!974709 (=> (not res!652530) (not e!549356))))

(declare-datatypes ((List!20308 0))(
  ( (Nil!20305) (Cons!20304 (h!21466 (_ BitVec 64)) (t!28776 List!20308)) )
))
(declare-fun arrayNoDuplicates!0 (array!60676 (_ BitVec 32) List!20308) Bool)

(assert (=> b!974709 (= res!652530 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20305))))

(declare-fun b!974710 () Bool)

(declare-fun res!652527 () Bool)

(assert (=> b!974710 (=> (not res!652527) (not e!549356))))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974710 (= res!652527 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29683 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29683 _keys!1717))))))

(declare-fun b!974711 () Bool)

(declare-fun e!549355 () Bool)

(assert (=> b!974711 (= e!549355 tp_is_empty!22357)))

(declare-fun mapIsEmpty!35545 () Bool)

(declare-fun mapRes!35545 () Bool)

(assert (=> mapIsEmpty!35545 mapRes!35545))

(declare-fun mapNonEmpty!35545 () Bool)

(declare-fun tp!67648 () Bool)

(declare-fun e!549353 () Bool)

(assert (=> mapNonEmpty!35545 (= mapRes!35545 (and tp!67648 e!549353))))

(declare-fun mapRest!35545 () (Array (_ BitVec 32) ValueCell!10697))

(declare-fun mapKey!35545 () (_ BitVec 32))

(declare-fun mapValue!35545 () ValueCell!10697)

(assert (=> mapNonEmpty!35545 (= (arr!29203 _values!1425) (store mapRest!35545 mapKey!35545 mapValue!35545))))

(declare-fun b!974712 () Bool)

(declare-fun res!652525 () Bool)

(assert (=> b!974712 (=> (not res!652525) (not e!549356))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974712 (= res!652525 (validKeyInArray!0 (select (arr!29202 _keys!1717) i!822)))))

(declare-fun b!974713 () Bool)

(assert (=> b!974713 (= e!549353 tp_is_empty!22357)))

(declare-fun b!974714 () Bool)

(assert (=> b!974714 (= e!549356 false)))

(declare-fun zeroValue!1367 () V!34793)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34793)

(declare-datatypes ((tuple2!14502 0))(
  ( (tuple2!14503 (_1!7262 (_ BitVec 64)) (_2!7262 V!34793)) )
))
(declare-datatypes ((List!20309 0))(
  ( (Nil!20306) (Cons!20305 (h!21467 tuple2!14502) (t!28777 List!20309)) )
))
(declare-datatypes ((ListLongMap!13189 0))(
  ( (ListLongMap!13190 (toList!6610 List!20309)) )
))
(declare-fun lt!432579 () ListLongMap!13189)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3772 (array!60676 array!60678 (_ BitVec 32) (_ BitVec 32) V!34793 V!34793 (_ BitVec 32) Int) ListLongMap!13189)

(assert (=> b!974714 (= lt!432579 (getCurrentListMap!3772 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!974715 () Bool)

(declare-fun res!652531 () Bool)

(assert (=> b!974715 (=> (not res!652531) (not e!549356))))

(declare-fun contains!5643 (ListLongMap!13189 (_ BitVec 64)) Bool)

(assert (=> b!974715 (= res!652531 (contains!5643 (getCurrentListMap!3772 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29202 _keys!1717) i!822)))))

(declare-fun b!974716 () Bool)

(declare-fun res!652529 () Bool)

(assert (=> b!974716 (=> (not res!652529) (not e!549356))))

(assert (=> b!974716 (= res!652529 (and (= (size!29684 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29683 _keys!1717) (size!29684 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!974717 () Bool)

(assert (=> b!974717 (= e!549357 (and e!549355 mapRes!35545))))

(declare-fun condMapEmpty!35545 () Bool)

(declare-fun mapDefault!35545 () ValueCell!10697)

(assert (=> b!974717 (= condMapEmpty!35545 (= (arr!29203 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10697)) mapDefault!35545)))))

(assert (= (and start!83448 res!652528) b!974716))

(assert (= (and b!974716 res!652529) b!974708))

(assert (= (and b!974708 res!652526) b!974709))

(assert (= (and b!974709 res!652530) b!974710))

(assert (= (and b!974710 res!652527) b!974712))

(assert (= (and b!974712 res!652525) b!974715))

(assert (= (and b!974715 res!652531) b!974714))

(assert (= (and b!974717 condMapEmpty!35545) mapIsEmpty!35545))

(assert (= (and b!974717 (not condMapEmpty!35545)) mapNonEmpty!35545))

(get-info :version)

(assert (= (and mapNonEmpty!35545 ((_ is ValueCellFull!10697) mapValue!35545)) b!974713))

(assert (= (and b!974717 ((_ is ValueCellFull!10697) mapDefault!35545)) b!974711))

(assert (= start!83448 b!974717))

(declare-fun m!901565 () Bool)

(assert (=> b!974708 m!901565))

(declare-fun m!901567 () Bool)

(assert (=> b!974714 m!901567))

(declare-fun m!901569 () Bool)

(assert (=> mapNonEmpty!35545 m!901569))

(declare-fun m!901571 () Bool)

(assert (=> b!974715 m!901571))

(declare-fun m!901573 () Bool)

(assert (=> b!974715 m!901573))

(assert (=> b!974715 m!901571))

(assert (=> b!974715 m!901573))

(declare-fun m!901575 () Bool)

(assert (=> b!974715 m!901575))

(declare-fun m!901577 () Bool)

(assert (=> start!83448 m!901577))

(declare-fun m!901579 () Bool)

(assert (=> start!83448 m!901579))

(declare-fun m!901581 () Bool)

(assert (=> start!83448 m!901581))

(declare-fun m!901583 () Bool)

(assert (=> b!974709 m!901583))

(assert (=> b!974712 m!901573))

(assert (=> b!974712 m!901573))

(declare-fun m!901585 () Bool)

(assert (=> b!974712 m!901585))

(check-sat (not mapNonEmpty!35545) (not b!974712) (not b!974715) (not start!83448) (not b!974708) tp_is_empty!22357 (not b_next!19453) b_and!31029 (not b!974709) (not b!974714))
(check-sat b_and!31029 (not b_next!19453))
