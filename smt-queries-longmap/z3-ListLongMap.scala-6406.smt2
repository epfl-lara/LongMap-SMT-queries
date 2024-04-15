; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82214 () Bool)

(assert start!82214)

(declare-fun b_free!18505 () Bool)

(declare-fun b_next!18505 () Bool)

(assert (=> start!82214 (= b_free!18505 (not b_next!18505))))

(declare-fun tp!64476 () Bool)

(declare-fun b_and!29967 () Bool)

(assert (=> start!82214 (= tp!64476 b_and!29967)))

(declare-fun b!958257 () Bool)

(declare-fun res!641478 () Bool)

(declare-fun e!540211 () Bool)

(assert (=> b!958257 (=> (not res!641478) (not e!540211))))

(declare-datatypes ((array!58458 0))(
  ( (array!58459 (arr!28103 (Array (_ BitVec 32) (_ BitVec 64))) (size!28584 (_ BitVec 32))) )
))
(declare-fun _keys!1668 () array!58458)

(declare-fun mask!2088 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58458 (_ BitVec 32)) Bool)

(assert (=> b!958257 (= res!641478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1668 mask!2088))))

(declare-fun b!958258 () Bool)

(assert (=> b!958258 (= e!540211 false)))

(declare-datatypes ((V!33265 0))(
  ( (V!33266 (val!10656 Int)) )
))
(declare-fun minValue!1328 () V!33265)

(declare-fun extraKeys!1307 () (_ BitVec 32))

(declare-datatypes ((ValueCell!10124 0))(
  ( (ValueCellFull!10124 (v!13212 V!33265)) (EmptyCell!10124) )
))
(declare-datatypes ((array!58460 0))(
  ( (array!58461 (arr!28104 (Array (_ BitVec 32) ValueCell!10124)) (size!28585 (_ BitVec 32))) )
))
(declare-fun _values!1386 () array!58460)

(declare-fun defaultEntry!1389 () Int)

(declare-fun lt!430213 () Bool)

(declare-fun zeroValue!1328 () V!33265)

(declare-fun i!793 () (_ BitVec 32))

(declare-fun from!2064 () (_ BitVec 32))

(declare-datatypes ((tuple2!13788 0))(
  ( (tuple2!13789 (_1!6905 (_ BitVec 64)) (_2!6905 V!33265)) )
))
(declare-datatypes ((List!19573 0))(
  ( (Nil!19570) (Cons!19569 (h!20731 tuple2!13788) (t!27927 List!19573)) )
))
(declare-datatypes ((ListLongMap!12475 0))(
  ( (ListLongMap!12476 (toList!6253 List!19573)) )
))
(declare-fun contains!5299 (ListLongMap!12475 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3415 (array!58458 array!58460 (_ BitVec 32) (_ BitVec 32) V!33265 V!33265 (_ BitVec 32) Int) ListLongMap!12475)

(assert (=> b!958258 (= lt!430213 (contains!5299 (getCurrentListMap!3415 _keys!1668 _values!1386 mask!2088 extraKeys!1307 zeroValue!1328 minValue!1328 from!2064 defaultEntry!1389) (select (arr!28103 _keys!1668) i!793)))))

(declare-fun res!641476 () Bool)

(assert (=> start!82214 (=> (not res!641476) (not e!540211))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82214 (= res!641476 (validMask!0 mask!2088))))

(assert (=> start!82214 e!540211))

(assert (=> start!82214 true))

(declare-fun tp_is_empty!21211 () Bool)

(assert (=> start!82214 tp_is_empty!21211))

(declare-fun array_inv!21853 (array!58458) Bool)

(assert (=> start!82214 (array_inv!21853 _keys!1668)))

(declare-fun e!540208 () Bool)

(declare-fun array_inv!21854 (array!58460) Bool)

(assert (=> start!82214 (and (array_inv!21854 _values!1386) e!540208)))

(assert (=> start!82214 tp!64476))

(declare-fun b!958259 () Bool)

(declare-fun res!641474 () Bool)

(assert (=> b!958259 (=> (not res!641474) (not e!540211))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!958259 (= res!641474 (validKeyInArray!0 (select (arr!28103 _keys!1668) i!793)))))

(declare-fun b!958260 () Bool)

(declare-fun e!540210 () Bool)

(declare-fun mapRes!33796 () Bool)

(assert (=> b!958260 (= e!540208 (and e!540210 mapRes!33796))))

(declare-fun condMapEmpty!33796 () Bool)

(declare-fun mapDefault!33796 () ValueCell!10124)

(assert (=> b!958260 (= condMapEmpty!33796 (= (arr!28104 _values!1386) ((as const (Array (_ BitVec 32) ValueCell!10124)) mapDefault!33796)))))

(declare-fun b!958261 () Bool)

(declare-fun res!641477 () Bool)

(assert (=> b!958261 (=> (not res!641477) (not e!540211))))

(assert (=> b!958261 (= res!641477 (and (= (size!28585 _values!1386) (bvadd #b00000000000000000000000000000001 mask!2088)) (= (size!28584 _keys!1668) (size!28585 _values!1386)) (bvsge mask!2088 #b00000000000000000000000000000000) (bvsge extraKeys!1307 #b00000000000000000000000000000000) (bvsle extraKeys!1307 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33796 () Bool)

(assert (=> mapIsEmpty!33796 mapRes!33796))

(declare-fun mapNonEmpty!33796 () Bool)

(declare-fun tp!64477 () Bool)

(declare-fun e!540209 () Bool)

(assert (=> mapNonEmpty!33796 (= mapRes!33796 (and tp!64477 e!540209))))

(declare-fun mapValue!33796 () ValueCell!10124)

(declare-fun mapRest!33796 () (Array (_ BitVec 32) ValueCell!10124))

(declare-fun mapKey!33796 () (_ BitVec 32))

(assert (=> mapNonEmpty!33796 (= (arr!28104 _values!1386) (store mapRest!33796 mapKey!33796 mapValue!33796))))

(declare-fun b!958262 () Bool)

(declare-fun res!641473 () Bool)

(assert (=> b!958262 (=> (not res!641473) (not e!540211))))

(declare-datatypes ((List!19574 0))(
  ( (Nil!19571) (Cons!19570 (h!20732 (_ BitVec 64)) (t!27928 List!19574)) )
))
(declare-fun arrayNoDuplicates!0 (array!58458 (_ BitVec 32) List!19574) Bool)

(assert (=> b!958262 (= res!641473 (arrayNoDuplicates!0 _keys!1668 #b00000000000000000000000000000000 Nil!19571))))

(declare-fun b!958263 () Bool)

(assert (=> b!958263 (= e!540210 tp_is_empty!21211)))

(declare-fun b!958264 () Bool)

(assert (=> b!958264 (= e!540209 tp_is_empty!21211)))

(declare-fun b!958265 () Bool)

(declare-fun res!641475 () Bool)

(assert (=> b!958265 (=> (not res!641475) (not e!540211))))

(assert (=> b!958265 (= res!641475 (and (bvsge from!2064 #b00000000000000000000000000000000) (bvslt from!2064 (size!28584 _keys!1668)) (bvsge i!793 from!2064) (bvslt i!793 (size!28584 _keys!1668))))))

(assert (= (and start!82214 res!641476) b!958261))

(assert (= (and b!958261 res!641477) b!958257))

(assert (= (and b!958257 res!641478) b!958262))

(assert (= (and b!958262 res!641473) b!958265))

(assert (= (and b!958265 res!641475) b!958259))

(assert (= (and b!958259 res!641474) b!958258))

(assert (= (and b!958260 condMapEmpty!33796) mapIsEmpty!33796))

(assert (= (and b!958260 (not condMapEmpty!33796)) mapNonEmpty!33796))

(get-info :version)

(assert (= (and mapNonEmpty!33796 ((_ is ValueCellFull!10124) mapValue!33796)) b!958264))

(assert (= (and b!958260 ((_ is ValueCellFull!10124) mapDefault!33796)) b!958263))

(assert (= start!82214 b!958260))

(declare-fun m!888399 () Bool)

(assert (=> start!82214 m!888399))

(declare-fun m!888401 () Bool)

(assert (=> start!82214 m!888401))

(declare-fun m!888403 () Bool)

(assert (=> start!82214 m!888403))

(declare-fun m!888405 () Bool)

(assert (=> mapNonEmpty!33796 m!888405))

(declare-fun m!888407 () Bool)

(assert (=> b!958259 m!888407))

(assert (=> b!958259 m!888407))

(declare-fun m!888409 () Bool)

(assert (=> b!958259 m!888409))

(declare-fun m!888411 () Bool)

(assert (=> b!958262 m!888411))

(declare-fun m!888413 () Bool)

(assert (=> b!958258 m!888413))

(assert (=> b!958258 m!888407))

(assert (=> b!958258 m!888413))

(assert (=> b!958258 m!888407))

(declare-fun m!888415 () Bool)

(assert (=> b!958258 m!888415))

(declare-fun m!888417 () Bool)

(assert (=> b!958257 m!888417))

(check-sat b_and!29967 (not b!958257) (not b_next!18505) tp_is_empty!21211 (not start!82214) (not b!958258) (not b!958259) (not mapNonEmpty!33796) (not b!958262))
(check-sat b_and!29967 (not b_next!18505))
