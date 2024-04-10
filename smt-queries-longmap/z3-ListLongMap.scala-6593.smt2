; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83444 () Bool)

(assert start!83444)

(declare-fun res!652428 () Bool)

(declare-fun e!549336 () Bool)

(assert (=> start!83444 (=> (not res!652428) (not e!549336))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83444 (= res!652428 (validMask!0 mask!2147))))

(assert (=> start!83444 e!549336))

(assert (=> start!83444 true))

(declare-datatypes ((V!34763 0))(
  ( (V!34764 (val!11218 Int)) )
))
(declare-datatypes ((ValueCell!10686 0))(
  ( (ValueCellFull!10686 (v!13777 V!34763)) (EmptyCell!10686) )
))
(declare-datatypes ((array!60709 0))(
  ( (array!60710 (arr!29218 (Array (_ BitVec 32) ValueCell!10686)) (size!29697 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60709)

(declare-fun e!549337 () Bool)

(declare-fun array_inv!22597 (array!60709) Bool)

(assert (=> start!83444 (and (array_inv!22597 _values!1425) e!549337)))

(declare-datatypes ((array!60711 0))(
  ( (array!60712 (arr!29219 (Array (_ BitVec 32) (_ BitVec 64))) (size!29698 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60711)

(declare-fun array_inv!22598 (array!60711) Bool)

(assert (=> start!83444 (array_inv!22598 _keys!1717)))

(declare-fun b!974638 () Bool)

(declare-fun e!549339 () Bool)

(declare-fun tp_is_empty!22335 () Bool)

(assert (=> b!974638 (= e!549339 tp_is_empty!22335)))

(declare-fun b!974639 () Bool)

(declare-fun mapRes!35512 () Bool)

(assert (=> b!974639 (= e!549337 (and e!549339 mapRes!35512))))

(declare-fun condMapEmpty!35512 () Bool)

(declare-fun mapDefault!35512 () ValueCell!10686)

(assert (=> b!974639 (= condMapEmpty!35512 (= (arr!29218 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10686)) mapDefault!35512)))))

(declare-fun b!974640 () Bool)

(declare-fun res!652426 () Bool)

(assert (=> b!974640 (=> (not res!652426) (not e!549336))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!974640 (= res!652426 (and (= (size!29697 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29698 _keys!1717) (size!29697 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!35512 () Bool)

(assert (=> mapIsEmpty!35512 mapRes!35512))

(declare-fun mapNonEmpty!35512 () Bool)

(declare-fun tp!67584 () Bool)

(declare-fun e!549340 () Bool)

(assert (=> mapNonEmpty!35512 (= mapRes!35512 (and tp!67584 e!549340))))

(declare-fun mapKey!35512 () (_ BitVec 32))

(declare-fun mapRest!35512 () (Array (_ BitVec 32) ValueCell!10686))

(declare-fun mapValue!35512 () ValueCell!10686)

(assert (=> mapNonEmpty!35512 (= (arr!29218 _values!1425) (store mapRest!35512 mapKey!35512 mapValue!35512))))

(declare-fun b!974641 () Bool)

(declare-fun res!652427 () Bool)

(assert (=> b!974641 (=> (not res!652427) (not e!549336))))

(declare-datatypes ((List!20274 0))(
  ( (Nil!20271) (Cons!20270 (h!21432 (_ BitVec 64)) (t!28751 List!20274)) )
))
(declare-fun arrayNoDuplicates!0 (array!60711 (_ BitVec 32) List!20274) Bool)

(assert (=> b!974641 (= res!652427 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20271))))

(declare-fun b!974642 () Bool)

(declare-fun res!652425 () Bool)

(assert (=> b!974642 (=> (not res!652425) (not e!549336))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60711 (_ BitVec 32)) Bool)

(assert (=> b!974642 (= res!652425 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!974643 () Bool)

(assert (=> b!974643 (= e!549340 tp_is_empty!22335)))

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun b!974644 () Bool)

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974644 (= e!549336 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29698 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29698 _keys!1717)) (bvslt i!822 #b00000000000000000000000000000000)))))

(assert (= (and start!83444 res!652428) b!974640))

(assert (= (and b!974640 res!652426) b!974642))

(assert (= (and b!974642 res!652425) b!974641))

(assert (= (and b!974641 res!652427) b!974644))

(assert (= (and b!974639 condMapEmpty!35512) mapIsEmpty!35512))

(assert (= (and b!974639 (not condMapEmpty!35512)) mapNonEmpty!35512))

(get-info :version)

(assert (= (and mapNonEmpty!35512 ((_ is ValueCellFull!10686) mapValue!35512)) b!974643))

(assert (= (and b!974639 ((_ is ValueCellFull!10686) mapDefault!35512)) b!974638))

(assert (= start!83444 b!974639))

(declare-fun m!902113 () Bool)

(assert (=> start!83444 m!902113))

(declare-fun m!902115 () Bool)

(assert (=> start!83444 m!902115))

(declare-fun m!902117 () Bool)

(assert (=> start!83444 m!902117))

(declare-fun m!902119 () Bool)

(assert (=> mapNonEmpty!35512 m!902119))

(declare-fun m!902121 () Bool)

(assert (=> b!974641 m!902121))

(declare-fun m!902123 () Bool)

(assert (=> b!974642 m!902123))

(check-sat (not b!974641) (not b!974642) (not mapNonEmpty!35512) tp_is_empty!22335 (not start!83444))
(check-sat)
