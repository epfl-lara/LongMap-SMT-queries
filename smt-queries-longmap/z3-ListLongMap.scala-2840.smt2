; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40990 () Bool)

(assert start!40990)

(declare-fun b_free!10939 () Bool)

(declare-fun b_next!10939 () Bool)

(assert (=> start!40990 (= b_free!10939 (not b_next!10939))))

(declare-fun tp!38644 () Bool)

(declare-fun b_and!19091 () Bool)

(assert (=> start!40990 (= tp!38644 b_and!19091)))

(declare-fun res!272659 () Bool)

(declare-fun e!266809 () Bool)

(assert (=> start!40990 (=> (not res!272659) (not e!266809))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28348 0))(
  ( (array!28349 (arr!13617 (Array (_ BitVec 32) (_ BitVec 64))) (size!13969 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28348)

(assert (=> start!40990 (= res!272659 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13969 _keys!709))))))

(assert (=> start!40990 e!266809))

(declare-fun tp_is_empty!12277 () Bool)

(assert (=> start!40990 tp_is_empty!12277))

(assert (=> start!40990 tp!38644))

(assert (=> start!40990 true))

(declare-datatypes ((V!17475 0))(
  ( (V!17476 (val!6183 Int)) )
))
(declare-datatypes ((ValueCell!5795 0))(
  ( (ValueCellFull!5795 (v!8450 V!17475)) (EmptyCell!5795) )
))
(declare-datatypes ((array!28350 0))(
  ( (array!28351 (arr!13618 (Array (_ BitVec 32) ValueCell!5795)) (size!13970 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28350)

(declare-fun e!266808 () Bool)

(declare-fun array_inv!9930 (array!28350) Bool)

(assert (=> start!40990 (and (array_inv!9930 _values!549) e!266808)))

(declare-fun array_inv!9931 (array!28348) Bool)

(assert (=> start!40990 (array_inv!9931 _keys!709)))

(declare-fun b!456731 () Bool)

(declare-fun res!272650 () Bool)

(assert (=> b!456731 (=> (not res!272650) (not e!266809))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456731 (= res!272650 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13969 _keys!709))))))

(declare-fun b!456732 () Bool)

(declare-fun e!266812 () Bool)

(declare-fun e!266805 () Bool)

(assert (=> b!456732 (= e!266812 (not e!266805))))

(declare-fun res!272658 () Bool)

(assert (=> b!456732 (=> res!272658 e!266805)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456732 (= res!272658 (not (validKeyInArray!0 (select (arr!13617 _keys!709) from!863))))))

(declare-fun minValue!515 () V!17475)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17475)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!206669 () array!28350)

(declare-fun lt!206670 () array!28348)

(declare-fun v!412 () V!17475)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!8058 0))(
  ( (tuple2!8059 (_1!4040 (_ BitVec 64)) (_2!4040 V!17475)) )
))
(declare-datatypes ((List!8132 0))(
  ( (Nil!8129) (Cons!8128 (h!8984 tuple2!8058) (t!13952 List!8132)) )
))
(declare-datatypes ((ListLongMap!6973 0))(
  ( (ListLongMap!6974 (toList!3502 List!8132)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1731 (array!28348 array!28350 (_ BitVec 32) (_ BitVec 32) V!17475 V!17475 (_ BitVec 32) Int) ListLongMap!6973)

(declare-fun +!1585 (ListLongMap!6973 tuple2!8058) ListLongMap!6973)

(assert (=> b!456732 (= (getCurrentListMapNoExtraKeys!1731 lt!206670 lt!206669 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1585 (getCurrentListMapNoExtraKeys!1731 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8059 k0!794 v!412)))))

(declare-datatypes ((Unit!13275 0))(
  ( (Unit!13276) )
))
(declare-fun lt!206672 () Unit!13275)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!745 (array!28348 array!28350 (_ BitVec 32) (_ BitVec 32) V!17475 V!17475 (_ BitVec 32) (_ BitVec 64) V!17475 (_ BitVec 32) Int) Unit!13275)

(assert (=> b!456732 (= lt!206672 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!745 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!20056 () Bool)

(declare-fun mapRes!20056 () Bool)

(assert (=> mapIsEmpty!20056 mapRes!20056))

(declare-fun b!456733 () Bool)

(declare-fun e!266810 () Bool)

(assert (=> b!456733 (= e!266810 tp_is_empty!12277)))

(declare-fun b!456734 () Bool)

(declare-fun res!272656 () Bool)

(assert (=> b!456734 (=> (not res!272656) (not e!266809))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456734 (= res!272656 (validMask!0 mask!1025))))

(declare-fun b!456735 () Bool)

(declare-fun res!272655 () Bool)

(assert (=> b!456735 (=> (not res!272655) (not e!266809))))

(declare-fun arrayContainsKey!0 (array!28348 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456735 (= res!272655 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456736 () Bool)

(declare-fun e!266806 () Bool)

(assert (=> b!456736 (= e!266806 tp_is_empty!12277)))

(declare-fun b!456737 () Bool)

(declare-fun e!266811 () Bool)

(assert (=> b!456737 (= e!266809 e!266811)))

(declare-fun res!272652 () Bool)

(assert (=> b!456737 (=> (not res!272652) (not e!266811))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28348 (_ BitVec 32)) Bool)

(assert (=> b!456737 (= res!272652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206670 mask!1025))))

(assert (=> b!456737 (= lt!206670 (array!28349 (store (arr!13617 _keys!709) i!563 k0!794) (size!13969 _keys!709)))))

(declare-fun b!456738 () Bool)

(declare-fun res!272657 () Bool)

(assert (=> b!456738 (=> (not res!272657) (not e!266809))))

(assert (=> b!456738 (= res!272657 (validKeyInArray!0 k0!794))))

(declare-fun b!456739 () Bool)

(declare-fun res!272651 () Bool)

(assert (=> b!456739 (=> (not res!272651) (not e!266809))))

(assert (=> b!456739 (= res!272651 (and (= (size!13970 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13969 _keys!709) (size!13970 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456740 () Bool)

(declare-fun res!272653 () Bool)

(assert (=> b!456740 (=> (not res!272653) (not e!266809))))

(assert (=> b!456740 (= res!272653 (or (= (select (arr!13617 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13617 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456741 () Bool)

(declare-fun res!272661 () Bool)

(assert (=> b!456741 (=> (not res!272661) (not e!266809))))

(declare-datatypes ((List!8133 0))(
  ( (Nil!8130) (Cons!8129 (h!8985 (_ BitVec 64)) (t!13953 List!8133)) )
))
(declare-fun arrayNoDuplicates!0 (array!28348 (_ BitVec 32) List!8133) Bool)

(assert (=> b!456741 (= res!272661 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8130))))

(declare-fun b!456742 () Bool)

(assert (=> b!456742 (= e!266805 (bvslt from!863 (size!13969 _keys!709)))))

(declare-fun b!456743 () Bool)

(assert (=> b!456743 (= e!266811 e!266812)))

(declare-fun res!272662 () Bool)

(assert (=> b!456743 (=> (not res!272662) (not e!266812))))

(assert (=> b!456743 (= res!272662 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!206671 () ListLongMap!6973)

(assert (=> b!456743 (= lt!206671 (getCurrentListMapNoExtraKeys!1731 lt!206670 lt!206669 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!456743 (= lt!206669 (array!28351 (store (arr!13618 _values!549) i!563 (ValueCellFull!5795 v!412)) (size!13970 _values!549)))))

(declare-fun lt!206668 () ListLongMap!6973)

(assert (=> b!456743 (= lt!206668 (getCurrentListMapNoExtraKeys!1731 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456744 () Bool)

(declare-fun res!272649 () Bool)

(assert (=> b!456744 (=> (not res!272649) (not e!266811))))

(assert (=> b!456744 (= res!272649 (arrayNoDuplicates!0 lt!206670 #b00000000000000000000000000000000 Nil!8130))))

(declare-fun b!456745 () Bool)

(declare-fun res!272654 () Bool)

(assert (=> b!456745 (=> (not res!272654) (not e!266809))))

(assert (=> b!456745 (= res!272654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456746 () Bool)

(declare-fun res!272660 () Bool)

(assert (=> b!456746 (=> (not res!272660) (not e!266811))))

(assert (=> b!456746 (= res!272660 (bvsle from!863 i!563))))

(declare-fun b!456747 () Bool)

(assert (=> b!456747 (= e!266808 (and e!266810 mapRes!20056))))

(declare-fun condMapEmpty!20056 () Bool)

(declare-fun mapDefault!20056 () ValueCell!5795)

(assert (=> b!456747 (= condMapEmpty!20056 (= (arr!13618 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5795)) mapDefault!20056)))))

(declare-fun mapNonEmpty!20056 () Bool)

(declare-fun tp!38643 () Bool)

(assert (=> mapNonEmpty!20056 (= mapRes!20056 (and tp!38643 e!266806))))

(declare-fun mapValue!20056 () ValueCell!5795)

(declare-fun mapKey!20056 () (_ BitVec 32))

(declare-fun mapRest!20056 () (Array (_ BitVec 32) ValueCell!5795))

(assert (=> mapNonEmpty!20056 (= (arr!13618 _values!549) (store mapRest!20056 mapKey!20056 mapValue!20056))))

(assert (= (and start!40990 res!272659) b!456734))

(assert (= (and b!456734 res!272656) b!456739))

(assert (= (and b!456739 res!272651) b!456745))

(assert (= (and b!456745 res!272654) b!456741))

(assert (= (and b!456741 res!272661) b!456731))

(assert (= (and b!456731 res!272650) b!456738))

(assert (= (and b!456738 res!272657) b!456740))

(assert (= (and b!456740 res!272653) b!456735))

(assert (= (and b!456735 res!272655) b!456737))

(assert (= (and b!456737 res!272652) b!456744))

(assert (= (and b!456744 res!272649) b!456746))

(assert (= (and b!456746 res!272660) b!456743))

(assert (= (and b!456743 res!272662) b!456732))

(assert (= (and b!456732 (not res!272658)) b!456742))

(assert (= (and b!456747 condMapEmpty!20056) mapIsEmpty!20056))

(assert (= (and b!456747 (not condMapEmpty!20056)) mapNonEmpty!20056))

(get-info :version)

(assert (= (and mapNonEmpty!20056 ((_ is ValueCellFull!5795) mapValue!20056)) b!456736))

(assert (= (and b!456747 ((_ is ValueCellFull!5795) mapDefault!20056)) b!456733))

(assert (= start!40990 b!456747))

(declare-fun m!440367 () Bool)

(assert (=> b!456745 m!440367))

(declare-fun m!440369 () Bool)

(assert (=> b!456737 m!440369))

(declare-fun m!440371 () Bool)

(assert (=> b!456737 m!440371))

(declare-fun m!440373 () Bool)

(assert (=> b!456738 m!440373))

(declare-fun m!440375 () Bool)

(assert (=> b!456735 m!440375))

(declare-fun m!440377 () Bool)

(assert (=> b!456741 m!440377))

(declare-fun m!440379 () Bool)

(assert (=> b!456743 m!440379))

(declare-fun m!440381 () Bool)

(assert (=> b!456743 m!440381))

(declare-fun m!440383 () Bool)

(assert (=> b!456743 m!440383))

(declare-fun m!440385 () Bool)

(assert (=> mapNonEmpty!20056 m!440385))

(declare-fun m!440387 () Bool)

(assert (=> b!456744 m!440387))

(declare-fun m!440389 () Bool)

(assert (=> b!456732 m!440389))

(declare-fun m!440391 () Bool)

(assert (=> b!456732 m!440391))

(declare-fun m!440393 () Bool)

(assert (=> b!456732 m!440393))

(assert (=> b!456732 m!440393))

(declare-fun m!440395 () Bool)

(assert (=> b!456732 m!440395))

(assert (=> b!456732 m!440389))

(declare-fun m!440397 () Bool)

(assert (=> b!456732 m!440397))

(declare-fun m!440399 () Bool)

(assert (=> b!456732 m!440399))

(declare-fun m!440401 () Bool)

(assert (=> b!456734 m!440401))

(declare-fun m!440403 () Bool)

(assert (=> b!456740 m!440403))

(declare-fun m!440405 () Bool)

(assert (=> start!40990 m!440405))

(declare-fun m!440407 () Bool)

(assert (=> start!40990 m!440407))

(check-sat tp_is_empty!12277 (not mapNonEmpty!20056) (not b!456741) (not b!456745) (not b_next!10939) b_and!19091 (not b!456738) (not b!456735) (not b!456743) (not b!456732) (not b!456734) (not start!40990) (not b!456744) (not b!456737))
(check-sat b_and!19091 (not b_next!10939))
