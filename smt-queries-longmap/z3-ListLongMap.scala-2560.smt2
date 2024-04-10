; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39180 () Bool)

(assert start!39180)

(declare-fun b_free!9447 () Bool)

(declare-fun b_next!9447 () Bool)

(assert (=> start!39180 (= b_free!9447 (not b_next!9447))))

(declare-fun tp!33869 () Bool)

(declare-fun b_and!16833 () Bool)

(assert (=> start!39180 (= tp!33869 b_and!16833)))

(declare-fun b!412662 () Bool)

(declare-fun res!239673 () Bool)

(declare-fun e!246896 () Bool)

(assert (=> b!412662 (=> (not res!239673) (not e!246896))))

(declare-datatypes ((array!25059 0))(
  ( (array!25060 (arr!11979 (Array (_ BitVec 32) (_ BitVec 64))) (size!12331 (_ BitVec 32))) )
))
(declare-fun lt!189525 () array!25059)

(declare-datatypes ((List!6963 0))(
  ( (Nil!6960) (Cons!6959 (h!7815 (_ BitVec 64)) (t!12137 List!6963)) )
))
(declare-fun arrayNoDuplicates!0 (array!25059 (_ BitVec 32) List!6963) Bool)

(assert (=> b!412662 (= res!239673 (arrayNoDuplicates!0 lt!189525 #b00000000000000000000000000000000 Nil!6960))))

(declare-fun res!239671 () Bool)

(declare-fun e!246899 () Bool)

(assert (=> start!39180 (=> (not res!239671) (not e!246899))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun _keys!709 () array!25059)

(assert (=> start!39180 (= res!239671 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12331 _keys!709))))))

(assert (=> start!39180 e!246899))

(declare-fun tp_is_empty!10599 () Bool)

(assert (=> start!39180 tp_is_empty!10599))

(assert (=> start!39180 tp!33869))

(assert (=> start!39180 true))

(declare-datatypes ((V!15237 0))(
  ( (V!15238 (val!5344 Int)) )
))
(declare-datatypes ((ValueCell!4956 0))(
  ( (ValueCellFull!4956 (v!7591 V!15237)) (EmptyCell!4956) )
))
(declare-datatypes ((array!25061 0))(
  ( (array!25062 (arr!11980 (Array (_ BitVec 32) ValueCell!4956)) (size!12332 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25061)

(declare-fun e!246897 () Bool)

(declare-fun array_inv!8734 (array!25061) Bool)

(assert (=> start!39180 (and (array_inv!8734 _values!549) e!246897)))

(declare-fun array_inv!8735 (array!25059) Bool)

(assert (=> start!39180 (array_inv!8735 _keys!709)))

(declare-fun mapNonEmpty!17520 () Bool)

(declare-fun mapRes!17520 () Bool)

(declare-fun tp!33870 () Bool)

(declare-fun e!246895 () Bool)

(assert (=> mapNonEmpty!17520 (= mapRes!17520 (and tp!33870 e!246895))))

(declare-fun mapValue!17520 () ValueCell!4956)

(declare-fun mapKey!17520 () (_ BitVec 32))

(declare-fun mapRest!17520 () (Array (_ BitVec 32) ValueCell!4956))

(assert (=> mapNonEmpty!17520 (= (arr!11980 _values!549) (store mapRest!17520 mapKey!17520 mapValue!17520))))

(declare-fun mapIsEmpty!17520 () Bool)

(assert (=> mapIsEmpty!17520 mapRes!17520))

(declare-fun b!412663 () Bool)

(declare-fun res!239679 () Bool)

(assert (=> b!412663 (=> (not res!239679) (not e!246899))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!412663 (= res!239679 (validMask!0 mask!1025))))

(declare-fun b!412664 () Bool)

(declare-fun res!239672 () Bool)

(assert (=> b!412664 (=> (not res!239672) (not e!246899))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25059 (_ BitVec 32)) Bool)

(assert (=> b!412664 (= res!239672 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!412665 () Bool)

(assert (=> b!412665 (= e!246896 false)))

(declare-fun minValue!515 () V!15237)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!6936 0))(
  ( (tuple2!6937 (_1!3479 (_ BitVec 64)) (_2!3479 V!15237)) )
))
(declare-datatypes ((List!6964 0))(
  ( (Nil!6961) (Cons!6960 (h!7816 tuple2!6936) (t!12138 List!6964)) )
))
(declare-datatypes ((ListLongMap!5849 0))(
  ( (ListLongMap!5850 (toList!2940 List!6964)) )
))
(declare-fun lt!189527 () ListLongMap!5849)

(declare-fun zeroValue!515 () V!15237)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15237)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1148 (array!25059 array!25061 (_ BitVec 32) (_ BitVec 32) V!15237 V!15237 (_ BitVec 32) Int) ListLongMap!5849)

(assert (=> b!412665 (= lt!189527 (getCurrentListMapNoExtraKeys!1148 lt!189525 (array!25062 (store (arr!11980 _values!549) i!563 (ValueCellFull!4956 v!412)) (size!12332 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189526 () ListLongMap!5849)

(assert (=> b!412665 (= lt!189526 (getCurrentListMapNoExtraKeys!1148 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!412666 () Bool)

(declare-fun e!246900 () Bool)

(assert (=> b!412666 (= e!246900 tp_is_empty!10599)))

(declare-fun b!412667 () Bool)

(declare-fun res!239668 () Bool)

(assert (=> b!412667 (=> (not res!239668) (not e!246899))))

(assert (=> b!412667 (= res!239668 (and (= (size!12332 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12331 _keys!709) (size!12332 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!412668 () Bool)

(declare-fun res!239674 () Bool)

(assert (=> b!412668 (=> (not res!239674) (not e!246899))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!412668 (= res!239674 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!412669 () Bool)

(declare-fun res!239677 () Bool)

(assert (=> b!412669 (=> (not res!239677) (not e!246899))))

(assert (=> b!412669 (= res!239677 (or (= (select (arr!11979 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11979 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!412670 () Bool)

(declare-fun res!239675 () Bool)

(assert (=> b!412670 (=> (not res!239675) (not e!246896))))

(assert (=> b!412670 (= res!239675 (bvsle from!863 i!563))))

(declare-fun b!412671 () Bool)

(declare-fun res!239670 () Bool)

(assert (=> b!412671 (=> (not res!239670) (not e!246899))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!412671 (= res!239670 (validKeyInArray!0 k0!794))))

(declare-fun b!412672 () Bool)

(declare-fun res!239676 () Bool)

(assert (=> b!412672 (=> (not res!239676) (not e!246899))))

(assert (=> b!412672 (= res!239676 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12331 _keys!709))))))

(declare-fun b!412673 () Bool)

(assert (=> b!412673 (= e!246897 (and e!246900 mapRes!17520))))

(declare-fun condMapEmpty!17520 () Bool)

(declare-fun mapDefault!17520 () ValueCell!4956)

(assert (=> b!412673 (= condMapEmpty!17520 (= (arr!11980 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4956)) mapDefault!17520)))))

(declare-fun b!412674 () Bool)

(assert (=> b!412674 (= e!246899 e!246896)))

(declare-fun res!239669 () Bool)

(assert (=> b!412674 (=> (not res!239669) (not e!246896))))

(assert (=> b!412674 (= res!239669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189525 mask!1025))))

(assert (=> b!412674 (= lt!189525 (array!25060 (store (arr!11979 _keys!709) i!563 k0!794) (size!12331 _keys!709)))))

(declare-fun b!412675 () Bool)

(declare-fun res!239678 () Bool)

(assert (=> b!412675 (=> (not res!239678) (not e!246899))))

(assert (=> b!412675 (= res!239678 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6960))))

(declare-fun b!412676 () Bool)

(assert (=> b!412676 (= e!246895 tp_is_empty!10599)))

(assert (= (and start!39180 res!239671) b!412663))

(assert (= (and b!412663 res!239679) b!412667))

(assert (= (and b!412667 res!239668) b!412664))

(assert (= (and b!412664 res!239672) b!412675))

(assert (= (and b!412675 res!239678) b!412672))

(assert (= (and b!412672 res!239676) b!412671))

(assert (= (and b!412671 res!239670) b!412669))

(assert (= (and b!412669 res!239677) b!412668))

(assert (= (and b!412668 res!239674) b!412674))

(assert (= (and b!412674 res!239669) b!412662))

(assert (= (and b!412662 res!239673) b!412670))

(assert (= (and b!412670 res!239675) b!412665))

(assert (= (and b!412673 condMapEmpty!17520) mapIsEmpty!17520))

(assert (= (and b!412673 (not condMapEmpty!17520)) mapNonEmpty!17520))

(get-info :version)

(assert (= (and mapNonEmpty!17520 ((_ is ValueCellFull!4956) mapValue!17520)) b!412676))

(assert (= (and b!412673 ((_ is ValueCellFull!4956) mapDefault!17520)) b!412666))

(assert (= start!39180 b!412673))

(declare-fun m!402403 () Bool)

(assert (=> b!412675 m!402403))

(declare-fun m!402405 () Bool)

(assert (=> b!412664 m!402405))

(declare-fun m!402407 () Bool)

(assert (=> b!412668 m!402407))

(declare-fun m!402409 () Bool)

(assert (=> start!39180 m!402409))

(declare-fun m!402411 () Bool)

(assert (=> start!39180 m!402411))

(declare-fun m!402413 () Bool)

(assert (=> b!412665 m!402413))

(declare-fun m!402415 () Bool)

(assert (=> b!412665 m!402415))

(declare-fun m!402417 () Bool)

(assert (=> b!412665 m!402417))

(declare-fun m!402419 () Bool)

(assert (=> b!412674 m!402419))

(declare-fun m!402421 () Bool)

(assert (=> b!412674 m!402421))

(declare-fun m!402423 () Bool)

(assert (=> b!412669 m!402423))

(declare-fun m!402425 () Bool)

(assert (=> b!412663 m!402425))

(declare-fun m!402427 () Bool)

(assert (=> b!412671 m!402427))

(declare-fun m!402429 () Bool)

(assert (=> mapNonEmpty!17520 m!402429))

(declare-fun m!402431 () Bool)

(assert (=> b!412662 m!402431))

(check-sat (not start!39180) (not mapNonEmpty!17520) tp_is_empty!10599 (not b_next!9447) (not b!412675) (not b!412674) b_and!16833 (not b!412671) (not b!412665) (not b!412664) (not b!412663) (not b!412662) (not b!412668))
(check-sat b_and!16833 (not b_next!9447))
