; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39566 () Bool)

(assert start!39566)

(declare-fun b_free!9847 () Bool)

(declare-fun b_next!9847 () Bool)

(assert (=> start!39566 (= b_free!9847 (not b_next!9847))))

(declare-fun tp!35070 () Bool)

(declare-fun b_and!17517 () Bool)

(assert (=> start!39566 (= tp!35070 b_and!17517)))

(declare-fun b!423755 () Bool)

(declare-fun res!247765 () Bool)

(declare-fun e!251853 () Bool)

(assert (=> b!423755 (=> (not res!247765) (not e!251853))))

(declare-datatypes ((array!25848 0))(
  ( (array!25849 (arr!12373 (Array (_ BitVec 32) (_ BitVec 64))) (size!12725 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25848)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25848 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423755 (= res!247765 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!423757 () Bool)

(declare-fun res!247766 () Bool)

(assert (=> b!423757 (=> (not res!247766) (not e!251853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423757 (= res!247766 (validKeyInArray!0 k0!794))))

(declare-fun b!423758 () Bool)

(declare-fun res!247771 () Bool)

(declare-fun e!251850 () Bool)

(assert (=> b!423758 (=> (not res!247771) (not e!251850))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423758 (= res!247771 (bvsle from!863 i!563))))

(declare-fun b!423759 () Bool)

(declare-fun e!251852 () Bool)

(declare-fun tp_is_empty!10999 () Bool)

(assert (=> b!423759 (= e!251852 tp_is_empty!10999)))

(declare-fun b!423760 () Bool)

(declare-fun res!247770 () Bool)

(assert (=> b!423760 (=> (not res!247770) (not e!251853))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15771 0))(
  ( (V!15772 (val!5544 Int)) )
))
(declare-datatypes ((ValueCell!5156 0))(
  ( (ValueCellFull!5156 (v!7792 V!15771)) (EmptyCell!5156) )
))
(declare-datatypes ((array!25850 0))(
  ( (array!25851 (arr!12374 (Array (_ BitVec 32) ValueCell!5156)) (size!12726 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25850)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!423760 (= res!247770 (and (= (size!12726 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12725 _keys!709) (size!12726 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423761 () Bool)

(declare-fun res!247772 () Bool)

(assert (=> b!423761 (=> (not res!247772) (not e!251853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423761 (= res!247772 (validMask!0 mask!1025))))

(declare-fun b!423762 () Bool)

(declare-fun e!251854 () Bool)

(assert (=> b!423762 (= e!251854 tp_is_empty!10999)))

(declare-fun b!423763 () Bool)

(declare-fun res!247776 () Bool)

(assert (=> b!423763 (=> (not res!247776) (not e!251853))))

(declare-datatypes ((List!7169 0))(
  ( (Nil!7166) (Cons!7165 (h!8021 (_ BitVec 64)) (t!12605 List!7169)) )
))
(declare-fun arrayNoDuplicates!0 (array!25848 (_ BitVec 32) List!7169) Bool)

(assert (=> b!423763 (= res!247776 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7166))))

(declare-fun b!423764 () Bool)

(declare-fun res!247768 () Bool)

(assert (=> b!423764 (=> (not res!247768) (not e!251850))))

(declare-fun lt!194260 () array!25848)

(assert (=> b!423764 (= res!247768 (arrayNoDuplicates!0 lt!194260 #b00000000000000000000000000000000 Nil!7166))))

(declare-fun mapNonEmpty!18120 () Bool)

(declare-fun mapRes!18120 () Bool)

(declare-fun tp!35069 () Bool)

(assert (=> mapNonEmpty!18120 (= mapRes!18120 (and tp!35069 e!251854))))

(declare-fun mapRest!18120 () (Array (_ BitVec 32) ValueCell!5156))

(declare-fun mapValue!18120 () ValueCell!5156)

(declare-fun mapKey!18120 () (_ BitVec 32))

(assert (=> mapNonEmpty!18120 (= (arr!12374 _values!549) (store mapRest!18120 mapKey!18120 mapValue!18120))))

(declare-fun b!423765 () Bool)

(assert (=> b!423765 (= e!251853 e!251850)))

(declare-fun res!247774 () Bool)

(assert (=> b!423765 (=> (not res!247774) (not e!251850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25848 (_ BitVec 32)) Bool)

(assert (=> b!423765 (= res!247774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194260 mask!1025))))

(assert (=> b!423765 (= lt!194260 (array!25849 (store (arr!12373 _keys!709) i!563 k0!794) (size!12725 _keys!709)))))

(declare-fun b!423766 () Bool)

(declare-fun e!251851 () Bool)

(assert (=> b!423766 (= e!251851 (and e!251852 mapRes!18120))))

(declare-fun condMapEmpty!18120 () Bool)

(declare-fun mapDefault!18120 () ValueCell!5156)

(assert (=> b!423766 (= condMapEmpty!18120 (= (arr!12374 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5156)) mapDefault!18120)))))

(declare-fun res!247775 () Bool)

(assert (=> start!39566 (=> (not res!247775) (not e!251853))))

(assert (=> start!39566 (= res!247775 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12725 _keys!709))))))

(assert (=> start!39566 e!251853))

(assert (=> start!39566 tp_is_empty!10999))

(assert (=> start!39566 tp!35070))

(assert (=> start!39566 true))

(declare-fun array_inv!9088 (array!25850) Bool)

(assert (=> start!39566 (and (array_inv!9088 _values!549) e!251851)))

(declare-fun array_inv!9089 (array!25848) Bool)

(assert (=> start!39566 (array_inv!9089 _keys!709)))

(declare-fun b!423756 () Bool)

(declare-fun res!247769 () Bool)

(assert (=> b!423756 (=> (not res!247769) (not e!251853))))

(assert (=> b!423756 (= res!247769 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12725 _keys!709))))))

(declare-fun mapIsEmpty!18120 () Bool)

(assert (=> mapIsEmpty!18120 mapRes!18120))

(declare-fun b!423767 () Bool)

(assert (=> b!423767 (= e!251850 false)))

(declare-fun minValue!515 () V!15771)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15771)

(declare-datatypes ((tuple2!7162 0))(
  ( (tuple2!7163 (_1!3592 (_ BitVec 64)) (_2!3592 V!15771)) )
))
(declare-datatypes ((List!7170 0))(
  ( (Nil!7167) (Cons!7166 (h!8022 tuple2!7162) (t!12606 List!7170)) )
))
(declare-datatypes ((ListLongMap!6077 0))(
  ( (ListLongMap!6078 (toList!3054 List!7170)) )
))
(declare-fun lt!194262 () ListLongMap!6077)

(declare-fun v!412 () V!15771)

(declare-fun getCurrentListMapNoExtraKeys!1300 (array!25848 array!25850 (_ BitVec 32) (_ BitVec 32) V!15771 V!15771 (_ BitVec 32) Int) ListLongMap!6077)

(assert (=> b!423767 (= lt!194262 (getCurrentListMapNoExtraKeys!1300 lt!194260 (array!25851 (store (arr!12374 _values!549) i!563 (ValueCellFull!5156 v!412)) (size!12726 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194261 () ListLongMap!6077)

(assert (=> b!423767 (= lt!194261 (getCurrentListMapNoExtraKeys!1300 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!423768 () Bool)

(declare-fun res!247767 () Bool)

(assert (=> b!423768 (=> (not res!247767) (not e!251853))))

(assert (=> b!423768 (= res!247767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423769 () Bool)

(declare-fun res!247773 () Bool)

(assert (=> b!423769 (=> (not res!247773) (not e!251853))))

(assert (=> b!423769 (= res!247773 (or (= (select (arr!12373 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12373 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39566 res!247775) b!423761))

(assert (= (and b!423761 res!247772) b!423760))

(assert (= (and b!423760 res!247770) b!423768))

(assert (= (and b!423768 res!247767) b!423763))

(assert (= (and b!423763 res!247776) b!423756))

(assert (= (and b!423756 res!247769) b!423757))

(assert (= (and b!423757 res!247766) b!423769))

(assert (= (and b!423769 res!247773) b!423755))

(assert (= (and b!423755 res!247765) b!423765))

(assert (= (and b!423765 res!247774) b!423764))

(assert (= (and b!423764 res!247768) b!423758))

(assert (= (and b!423758 res!247771) b!423767))

(assert (= (and b!423766 condMapEmpty!18120) mapIsEmpty!18120))

(assert (= (and b!423766 (not condMapEmpty!18120)) mapNonEmpty!18120))

(get-info :version)

(assert (= (and mapNonEmpty!18120 ((_ is ValueCellFull!5156) mapValue!18120)) b!423762))

(assert (= (and b!423766 ((_ is ValueCellFull!5156) mapDefault!18120)) b!423759))

(assert (= start!39566 b!423766))

(declare-fun m!413381 () Bool)

(assert (=> b!423767 m!413381))

(declare-fun m!413383 () Bool)

(assert (=> b!423767 m!413383))

(declare-fun m!413385 () Bool)

(assert (=> b!423767 m!413385))

(declare-fun m!413387 () Bool)

(assert (=> b!423757 m!413387))

(declare-fun m!413389 () Bool)

(assert (=> b!423768 m!413389))

(declare-fun m!413391 () Bool)

(assert (=> b!423764 m!413391))

(declare-fun m!413393 () Bool)

(assert (=> b!423763 m!413393))

(declare-fun m!413395 () Bool)

(assert (=> b!423769 m!413395))

(declare-fun m!413397 () Bool)

(assert (=> b!423755 m!413397))

(declare-fun m!413399 () Bool)

(assert (=> mapNonEmpty!18120 m!413399))

(declare-fun m!413401 () Bool)

(assert (=> b!423765 m!413401))

(declare-fun m!413403 () Bool)

(assert (=> b!423765 m!413403))

(declare-fun m!413405 () Bool)

(assert (=> b!423761 m!413405))

(declare-fun m!413407 () Bool)

(assert (=> start!39566 m!413407))

(declare-fun m!413409 () Bool)

(assert (=> start!39566 m!413409))

(check-sat tp_is_empty!10999 (not b!423767) (not b!423757) (not b!423765) (not b!423755) (not b!423764) (not b!423768) (not b!423761) (not b_next!9847) b_and!17517 (not mapNonEmpty!18120) (not b!423763) (not start!39566))
(check-sat b_and!17517 (not b_next!9847))
