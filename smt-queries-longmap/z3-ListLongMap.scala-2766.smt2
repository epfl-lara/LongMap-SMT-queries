; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40450 () Bool)

(assert start!40450)

(declare-fun b!445121 () Bool)

(declare-fun res!264065 () Bool)

(declare-fun e!261690 () Bool)

(assert (=> b!445121 (=> (not res!264065) (not e!261690))))

(declare-datatypes ((array!27477 0))(
  ( (array!27478 (arr!13186 (Array (_ BitVec 32) (_ BitVec 64))) (size!13538 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27477)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!16885 0))(
  ( (V!16886 (val!5962 Int)) )
))
(declare-datatypes ((ValueCell!5574 0))(
  ( (ValueCellFull!5574 (v!8213 V!16885)) (EmptyCell!5574) )
))
(declare-datatypes ((array!27479 0))(
  ( (array!27480 (arr!13187 (Array (_ BitVec 32) ValueCell!5574)) (size!13539 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27479)

(assert (=> b!445121 (= res!264065 (and (= (size!13539 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13538 _keys!709) (size!13539 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!445122 () Bool)

(declare-fun res!264067 () Bool)

(assert (=> b!445122 (=> (not res!264067) (not e!261690))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!445122 (= res!264067 (or (= (select (arr!13186 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13186 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!445123 () Bool)

(declare-fun res!264062 () Bool)

(assert (=> b!445123 (=> (not res!264062) (not e!261690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!445123 (= res!264062 (validMask!0 mask!1025))))

(declare-fun b!445124 () Bool)

(declare-fun res!264070 () Bool)

(assert (=> b!445124 (=> (not res!264070) (not e!261690))))

(declare-datatypes ((List!7884 0))(
  ( (Nil!7881) (Cons!7880 (h!8736 (_ BitVec 64)) (t!13642 List!7884)) )
))
(declare-fun arrayNoDuplicates!0 (array!27477 (_ BitVec 32) List!7884) Bool)

(assert (=> b!445124 (= res!264070 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7881))))

(declare-fun res!264064 () Bool)

(assert (=> start!40450 (=> (not res!264064) (not e!261690))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40450 (= res!264064 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13538 _keys!709))))))

(assert (=> start!40450 e!261690))

(assert (=> start!40450 true))

(declare-fun e!261689 () Bool)

(declare-fun array_inv!9560 (array!27479) Bool)

(assert (=> start!40450 (and (array_inv!9560 _values!549) e!261689)))

(declare-fun array_inv!9561 (array!27477) Bool)

(assert (=> start!40450 (array_inv!9561 _keys!709)))

(declare-fun b!445125 () Bool)

(declare-fun e!261692 () Bool)

(declare-fun mapRes!19380 () Bool)

(assert (=> b!445125 (= e!261689 (and e!261692 mapRes!19380))))

(declare-fun condMapEmpty!19380 () Bool)

(declare-fun mapDefault!19380 () ValueCell!5574)

(assert (=> b!445125 (= condMapEmpty!19380 (= (arr!13187 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5574)) mapDefault!19380)))))

(declare-fun b!445126 () Bool)

(declare-fun e!261691 () Bool)

(declare-fun tp_is_empty!11835 () Bool)

(assert (=> b!445126 (= e!261691 tp_is_empty!11835)))

(declare-fun b!445127 () Bool)

(declare-fun res!264061 () Bool)

(assert (=> b!445127 (=> (not res!264061) (not e!261690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27477 (_ BitVec 32)) Bool)

(assert (=> b!445127 (= res!264061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!445128 () Bool)

(declare-fun res!264068 () Bool)

(assert (=> b!445128 (=> (not res!264068) (not e!261690))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!445128 (= res!264068 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!445129 () Bool)

(declare-fun e!261688 () Bool)

(assert (=> b!445129 (= e!261688 false)))

(declare-fun lt!203597 () Bool)

(declare-fun lt!203596 () array!27477)

(assert (=> b!445129 (= lt!203597 (arrayNoDuplicates!0 lt!203596 #b00000000000000000000000000000000 Nil!7881))))

(declare-fun b!445130 () Bool)

(assert (=> b!445130 (= e!261692 tp_is_empty!11835)))

(declare-fun b!445131 () Bool)

(declare-fun res!264063 () Bool)

(assert (=> b!445131 (=> (not res!264063) (not e!261690))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!445131 (= res!264063 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!19380 () Bool)

(assert (=> mapIsEmpty!19380 mapRes!19380))

(declare-fun b!445132 () Bool)

(assert (=> b!445132 (= e!261690 e!261688)))

(declare-fun res!264066 () Bool)

(assert (=> b!445132 (=> (not res!264066) (not e!261688))))

(assert (=> b!445132 (= res!264066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!203596 mask!1025))))

(assert (=> b!445132 (= lt!203596 (array!27478 (store (arr!13186 _keys!709) i!563 k0!794) (size!13538 _keys!709)))))

(declare-fun mapNonEmpty!19380 () Bool)

(declare-fun tp!37362 () Bool)

(assert (=> mapNonEmpty!19380 (= mapRes!19380 (and tp!37362 e!261691))))

(declare-fun mapKey!19380 () (_ BitVec 32))

(declare-fun mapRest!19380 () (Array (_ BitVec 32) ValueCell!5574))

(declare-fun mapValue!19380 () ValueCell!5574)

(assert (=> mapNonEmpty!19380 (= (arr!13187 _values!549) (store mapRest!19380 mapKey!19380 mapValue!19380))))

(declare-fun b!445133 () Bool)

(declare-fun res!264069 () Bool)

(assert (=> b!445133 (=> (not res!264069) (not e!261690))))

(assert (=> b!445133 (= res!264069 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13538 _keys!709))))))

(assert (= (and start!40450 res!264064) b!445123))

(assert (= (and b!445123 res!264062) b!445121))

(assert (= (and b!445121 res!264065) b!445127))

(assert (= (and b!445127 res!264061) b!445124))

(assert (= (and b!445124 res!264070) b!445133))

(assert (= (and b!445133 res!264069) b!445131))

(assert (= (and b!445131 res!264063) b!445122))

(assert (= (and b!445122 res!264067) b!445128))

(assert (= (and b!445128 res!264068) b!445132))

(assert (= (and b!445132 res!264066) b!445129))

(assert (= (and b!445125 condMapEmpty!19380) mapIsEmpty!19380))

(assert (= (and b!445125 (not condMapEmpty!19380)) mapNonEmpty!19380))

(get-info :version)

(assert (= (and mapNonEmpty!19380 ((_ is ValueCellFull!5574) mapValue!19380)) b!445126))

(assert (= (and b!445125 ((_ is ValueCellFull!5574) mapDefault!19380)) b!445130))

(assert (= start!40450 b!445125))

(declare-fun m!430741 () Bool)

(assert (=> b!445131 m!430741))

(declare-fun m!430743 () Bool)

(assert (=> b!445127 m!430743))

(declare-fun m!430745 () Bool)

(assert (=> b!445124 m!430745))

(declare-fun m!430747 () Bool)

(assert (=> start!40450 m!430747))

(declare-fun m!430749 () Bool)

(assert (=> start!40450 m!430749))

(declare-fun m!430751 () Bool)

(assert (=> mapNonEmpty!19380 m!430751))

(declare-fun m!430753 () Bool)

(assert (=> b!445129 m!430753))

(declare-fun m!430755 () Bool)

(assert (=> b!445132 m!430755))

(declare-fun m!430757 () Bool)

(assert (=> b!445132 m!430757))

(declare-fun m!430759 () Bool)

(assert (=> b!445128 m!430759))

(declare-fun m!430761 () Bool)

(assert (=> b!445123 m!430761))

(declare-fun m!430763 () Bool)

(assert (=> b!445122 m!430763))

(check-sat (not b!445123) (not b!445128) (not b!445131) (not b!445129) tp_is_empty!11835 (not b!445132) (not mapNonEmpty!19380) (not b!445124) (not b!445127) (not start!40450))
(check-sat)
