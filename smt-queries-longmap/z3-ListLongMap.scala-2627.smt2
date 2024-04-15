; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39566 () Bool)

(assert start!39566)

(declare-fun b_free!9847 () Bool)

(declare-fun b_next!9847 () Bool)

(assert (=> start!39566 (= b_free!9847 (not b_next!9847))))

(declare-fun tp!35070 () Bool)

(declare-fun b_and!17477 () Bool)

(assert (=> start!39566 (= tp!35070 b_and!17477)))

(declare-fun b!423533 () Bool)

(declare-fun res!247649 () Bool)

(declare-fun e!251710 () Bool)

(assert (=> b!423533 (=> (not res!247649) (not e!251710))))

(declare-datatypes ((array!25827 0))(
  ( (array!25828 (arr!12363 (Array (_ BitVec 32) (_ BitVec 64))) (size!12716 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25827)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15771 0))(
  ( (V!15772 (val!5544 Int)) )
))
(declare-datatypes ((ValueCell!5156 0))(
  ( (ValueCellFull!5156 (v!7785 V!15771)) (EmptyCell!5156) )
))
(declare-datatypes ((array!25829 0))(
  ( (array!25830 (arr!12364 (Array (_ BitVec 32) ValueCell!5156)) (size!12717 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25829)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!423533 (= res!247649 (and (= (size!12717 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12716 _keys!709) (size!12717 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423534 () Bool)

(declare-fun e!251708 () Bool)

(declare-fun tp_is_empty!10999 () Bool)

(assert (=> b!423534 (= e!251708 tp_is_empty!10999)))

(declare-fun b!423536 () Bool)

(declare-fun e!251712 () Bool)

(assert (=> b!423536 (= e!251712 tp_is_empty!10999)))

(declare-fun b!423537 () Bool)

(declare-fun res!247646 () Bool)

(declare-fun e!251707 () Bool)

(assert (=> b!423537 (=> (not res!247646) (not e!251707))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423537 (= res!247646 (bvsle from!863 i!563))))

(declare-fun b!423538 () Bool)

(assert (=> b!423538 (= e!251707 false)))

(declare-fun minValue!515 () V!15771)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7268 0))(
  ( (tuple2!7269 (_1!3645 (_ BitVec 64)) (_2!3645 V!15771)) )
))
(declare-datatypes ((List!7263 0))(
  ( (Nil!7260) (Cons!7259 (h!8115 tuple2!7268) (t!12698 List!7263)) )
))
(declare-datatypes ((ListLongMap!6171 0))(
  ( (ListLongMap!6172 (toList!3101 List!7263)) )
))
(declare-fun lt!194007 () ListLongMap!6171)

(declare-fun zeroValue!515 () V!15771)

(declare-fun v!412 () V!15771)

(declare-fun lt!194009 () array!25827)

(declare-fun getCurrentListMapNoExtraKeys!1309 (array!25827 array!25829 (_ BitVec 32) (_ BitVec 32) V!15771 V!15771 (_ BitVec 32) Int) ListLongMap!6171)

(assert (=> b!423538 (= lt!194007 (getCurrentListMapNoExtraKeys!1309 lt!194009 (array!25830 (store (arr!12364 _values!549) i!563 (ValueCellFull!5156 v!412)) (size!12717 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194008 () ListLongMap!6171)

(assert (=> b!423538 (= lt!194008 (getCurrentListMapNoExtraKeys!1309 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!18120 () Bool)

(declare-fun mapRes!18120 () Bool)

(declare-fun tp!35069 () Bool)

(assert (=> mapNonEmpty!18120 (= mapRes!18120 (and tp!35069 e!251708))))

(declare-fun mapValue!18120 () ValueCell!5156)

(declare-fun mapKey!18120 () (_ BitVec 32))

(declare-fun mapRest!18120 () (Array (_ BitVec 32) ValueCell!5156))

(assert (=> mapNonEmpty!18120 (= (arr!12364 _values!549) (store mapRest!18120 mapKey!18120 mapValue!18120))))

(declare-fun b!423539 () Bool)

(declare-fun res!247644 () Bool)

(assert (=> b!423539 (=> (not res!247644) (not e!251710))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423539 (= res!247644 (validKeyInArray!0 k0!794))))

(declare-fun b!423540 () Bool)

(declare-fun res!247640 () Bool)

(assert (=> b!423540 (=> (not res!247640) (not e!251710))))

(assert (=> b!423540 (= res!247640 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12716 _keys!709))))))

(declare-fun b!423541 () Bool)

(declare-fun res!247643 () Bool)

(assert (=> b!423541 (=> (not res!247643) (not e!251707))))

(declare-datatypes ((List!7264 0))(
  ( (Nil!7261) (Cons!7260 (h!8116 (_ BitVec 64)) (t!12699 List!7264)) )
))
(declare-fun arrayNoDuplicates!0 (array!25827 (_ BitVec 32) List!7264) Bool)

(assert (=> b!423541 (= res!247643 (arrayNoDuplicates!0 lt!194009 #b00000000000000000000000000000000 Nil!7261))))

(declare-fun b!423542 () Bool)

(declare-fun res!247642 () Bool)

(assert (=> b!423542 (=> (not res!247642) (not e!251710))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25827 (_ BitVec 32)) Bool)

(assert (=> b!423542 (= res!247642 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423543 () Bool)

(declare-fun e!251711 () Bool)

(assert (=> b!423543 (= e!251711 (and e!251712 mapRes!18120))))

(declare-fun condMapEmpty!18120 () Bool)

(declare-fun mapDefault!18120 () ValueCell!5156)

(assert (=> b!423543 (= condMapEmpty!18120 (= (arr!12364 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5156)) mapDefault!18120)))))

(declare-fun b!423535 () Bool)

(declare-fun res!247645 () Bool)

(assert (=> b!423535 (=> (not res!247645) (not e!251710))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423535 (= res!247645 (validMask!0 mask!1025))))

(declare-fun res!247641 () Bool)

(assert (=> start!39566 (=> (not res!247641) (not e!251710))))

(assert (=> start!39566 (= res!247641 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12716 _keys!709))))))

(assert (=> start!39566 e!251710))

(assert (=> start!39566 tp_is_empty!10999))

(assert (=> start!39566 tp!35070))

(assert (=> start!39566 true))

(declare-fun array_inv!9044 (array!25829) Bool)

(assert (=> start!39566 (and (array_inv!9044 _values!549) e!251711)))

(declare-fun array_inv!9045 (array!25827) Bool)

(assert (=> start!39566 (array_inv!9045 _keys!709)))

(declare-fun b!423544 () Bool)

(declare-fun res!247639 () Bool)

(assert (=> b!423544 (=> (not res!247639) (not e!251710))))

(declare-fun arrayContainsKey!0 (array!25827 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423544 (= res!247639 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423545 () Bool)

(declare-fun res!247648 () Bool)

(assert (=> b!423545 (=> (not res!247648) (not e!251710))))

(assert (=> b!423545 (= res!247648 (or (= (select (arr!12363 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12363 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423546 () Bool)

(declare-fun res!247647 () Bool)

(assert (=> b!423546 (=> (not res!247647) (not e!251710))))

(assert (=> b!423546 (= res!247647 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7261))))

(declare-fun b!423547 () Bool)

(assert (=> b!423547 (= e!251710 e!251707)))

(declare-fun res!247650 () Bool)

(assert (=> b!423547 (=> (not res!247650) (not e!251707))))

(assert (=> b!423547 (= res!247650 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194009 mask!1025))))

(assert (=> b!423547 (= lt!194009 (array!25828 (store (arr!12363 _keys!709) i!563 k0!794) (size!12716 _keys!709)))))

(declare-fun mapIsEmpty!18120 () Bool)

(assert (=> mapIsEmpty!18120 mapRes!18120))

(assert (= (and start!39566 res!247641) b!423535))

(assert (= (and b!423535 res!247645) b!423533))

(assert (= (and b!423533 res!247649) b!423542))

(assert (= (and b!423542 res!247642) b!423546))

(assert (= (and b!423546 res!247647) b!423540))

(assert (= (and b!423540 res!247640) b!423539))

(assert (= (and b!423539 res!247644) b!423545))

(assert (= (and b!423545 res!247648) b!423544))

(assert (= (and b!423544 res!247639) b!423547))

(assert (= (and b!423547 res!247650) b!423541))

(assert (= (and b!423541 res!247643) b!423537))

(assert (= (and b!423537 res!247646) b!423538))

(assert (= (and b!423543 condMapEmpty!18120) mapIsEmpty!18120))

(assert (= (and b!423543 (not condMapEmpty!18120)) mapNonEmpty!18120))

(get-info :version)

(assert (= (and mapNonEmpty!18120 ((_ is ValueCellFull!5156) mapValue!18120)) b!423534))

(assert (= (and b!423543 ((_ is ValueCellFull!5156) mapDefault!18120)) b!423536))

(assert (= start!39566 b!423543))

(declare-fun m!412431 () Bool)

(assert (=> b!423539 m!412431))

(declare-fun m!412433 () Bool)

(assert (=> b!423544 m!412433))

(declare-fun m!412435 () Bool)

(assert (=> b!423542 m!412435))

(declare-fun m!412437 () Bool)

(assert (=> b!423546 m!412437))

(declare-fun m!412439 () Bool)

(assert (=> b!423547 m!412439))

(declare-fun m!412441 () Bool)

(assert (=> b!423547 m!412441))

(declare-fun m!412443 () Bool)

(assert (=> b!423535 m!412443))

(declare-fun m!412445 () Bool)

(assert (=> mapNonEmpty!18120 m!412445))

(declare-fun m!412447 () Bool)

(assert (=> b!423545 m!412447))

(declare-fun m!412449 () Bool)

(assert (=> b!423541 m!412449))

(declare-fun m!412451 () Bool)

(assert (=> start!39566 m!412451))

(declare-fun m!412453 () Bool)

(assert (=> start!39566 m!412453))

(declare-fun m!412455 () Bool)

(assert (=> b!423538 m!412455))

(declare-fun m!412457 () Bool)

(assert (=> b!423538 m!412457))

(declare-fun m!412459 () Bool)

(assert (=> b!423538 m!412459))

(check-sat (not start!39566) (not b_next!9847) (not b!423547) (not b!423539) (not b!423535) (not b!423546) (not b!423542) (not b!423538) b_and!17477 (not mapNonEmpty!18120) tp_is_empty!10999 (not b!423544) (not b!423541))
(check-sat b_and!17477 (not b_next!9847))
