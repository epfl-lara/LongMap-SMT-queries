; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39534 () Bool)

(assert start!39534)

(declare-fun b_free!9801 () Bool)

(declare-fun b_next!9801 () Bool)

(assert (=> start!39534 (= b_free!9801 (not b_next!9801))))

(declare-fun tp!34932 () Bool)

(declare-fun b_and!17457 () Bool)

(assert (=> start!39534 (= tp!34932 b_and!17457)))

(declare-fun b!422769 () Bool)

(declare-fun res!246947 () Bool)

(declare-fun e!251467 () Bool)

(assert (=> b!422769 (=> (not res!246947) (not e!251467))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25753 0))(
  ( (array!25754 (arr!12326 (Array (_ BitVec 32) (_ BitVec 64))) (size!12678 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25753)

(assert (=> b!422769 (= res!246947 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12678 _keys!709))))))

(declare-fun b!422770 () Bool)

(declare-fun res!246949 () Bool)

(assert (=> b!422770 (=> (not res!246949) (not e!251467))))

(assert (=> b!422770 (= res!246949 (or (= (select (arr!12326 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12326 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422771 () Bool)

(declare-fun e!251469 () Bool)

(declare-fun tp_is_empty!10953 () Bool)

(assert (=> b!422771 (= e!251469 tp_is_empty!10953)))

(declare-fun b!422772 () Bool)

(declare-fun e!251471 () Bool)

(assert (=> b!422772 (= e!251471 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15709 0))(
  ( (V!15710 (val!5521 Int)) )
))
(declare-fun minValue!515 () V!15709)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5133 0))(
  ( (ValueCellFull!5133 (v!7768 V!15709)) (EmptyCell!5133) )
))
(declare-datatypes ((array!25755 0))(
  ( (array!25756 (arr!12327 (Array (_ BitVec 32) ValueCell!5133)) (size!12679 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25755)

(declare-fun zeroValue!515 () V!15709)

(declare-datatypes ((tuple2!7252 0))(
  ( (tuple2!7253 (_1!3637 (_ BitVec 64)) (_2!3637 V!15709)) )
))
(declare-datatypes ((List!7258 0))(
  ( (Nil!7255) (Cons!7254 (h!8110 tuple2!7252) (t!12702 List!7258)) )
))
(declare-datatypes ((ListLongMap!6165 0))(
  ( (ListLongMap!6166 (toList!3098 List!7258)) )
))
(declare-fun lt!194035 () ListLongMap!6165)

(declare-fun v!412 () V!15709)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!194036 () array!25753)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1302 (array!25753 array!25755 (_ BitVec 32) (_ BitVec 32) V!15709 V!15709 (_ BitVec 32) Int) ListLongMap!6165)

(assert (=> b!422772 (= lt!194035 (getCurrentListMapNoExtraKeys!1302 lt!194036 (array!25756 (store (arr!12327 _values!549) i!563 (ValueCellFull!5133 v!412)) (size!12679 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194034 () ListLongMap!6165)

(assert (=> b!422772 (= lt!194034 (getCurrentListMapNoExtraKeys!1302 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422773 () Bool)

(declare-fun e!251472 () Bool)

(assert (=> b!422773 (= e!251472 tp_is_empty!10953)))

(declare-fun b!422774 () Bool)

(declare-fun res!246946 () Bool)

(assert (=> b!422774 (=> (not res!246946) (not e!251467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25753 (_ BitVec 32)) Bool)

(assert (=> b!422774 (= res!246946 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422775 () Bool)

(declare-fun res!246950 () Bool)

(assert (=> b!422775 (=> (not res!246950) (not e!251467))))

(declare-datatypes ((List!7259 0))(
  ( (Nil!7256) (Cons!7255 (h!8111 (_ BitVec 64)) (t!12703 List!7259)) )
))
(declare-fun arrayNoDuplicates!0 (array!25753 (_ BitVec 32) List!7259) Bool)

(assert (=> b!422775 (= res!246950 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7256))))

(declare-fun b!422776 () Bool)

(declare-fun res!246941 () Bool)

(assert (=> b!422776 (=> (not res!246941) (not e!251467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422776 (= res!246941 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18051 () Bool)

(declare-fun mapRes!18051 () Bool)

(assert (=> mapIsEmpty!18051 mapRes!18051))

(declare-fun b!422778 () Bool)

(declare-fun res!246951 () Bool)

(assert (=> b!422778 (=> (not res!246951) (not e!251471))))

(assert (=> b!422778 (= res!246951 (bvsle from!863 i!563))))

(declare-fun b!422779 () Bool)

(declare-fun res!246943 () Bool)

(assert (=> b!422779 (=> (not res!246943) (not e!251467))))

(assert (=> b!422779 (= res!246943 (and (= (size!12679 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12678 _keys!709) (size!12679 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!422780 () Bool)

(declare-fun res!246945 () Bool)

(assert (=> b!422780 (=> (not res!246945) (not e!251467))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25753 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422780 (= res!246945 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422781 () Bool)

(declare-fun res!246944 () Bool)

(assert (=> b!422781 (=> (not res!246944) (not e!251471))))

(assert (=> b!422781 (= res!246944 (arrayNoDuplicates!0 lt!194036 #b00000000000000000000000000000000 Nil!7256))))

(declare-fun b!422782 () Bool)

(declare-fun e!251468 () Bool)

(assert (=> b!422782 (= e!251468 (and e!251472 mapRes!18051))))

(declare-fun condMapEmpty!18051 () Bool)

(declare-fun mapDefault!18051 () ValueCell!5133)

(assert (=> b!422782 (= condMapEmpty!18051 (= (arr!12327 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5133)) mapDefault!18051)))))

(declare-fun mapNonEmpty!18051 () Bool)

(declare-fun tp!34931 () Bool)

(assert (=> mapNonEmpty!18051 (= mapRes!18051 (and tp!34931 e!251469))))

(declare-fun mapValue!18051 () ValueCell!5133)

(declare-fun mapKey!18051 () (_ BitVec 32))

(declare-fun mapRest!18051 () (Array (_ BitVec 32) ValueCell!5133))

(assert (=> mapNonEmpty!18051 (= (arr!12327 _values!549) (store mapRest!18051 mapKey!18051 mapValue!18051))))

(declare-fun b!422783 () Bool)

(assert (=> b!422783 (= e!251467 e!251471)))

(declare-fun res!246940 () Bool)

(assert (=> b!422783 (=> (not res!246940) (not e!251471))))

(assert (=> b!422783 (= res!246940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194036 mask!1025))))

(assert (=> b!422783 (= lt!194036 (array!25754 (store (arr!12326 _keys!709) i!563 k0!794) (size!12678 _keys!709)))))

(declare-fun b!422777 () Bool)

(declare-fun res!246948 () Bool)

(assert (=> b!422777 (=> (not res!246948) (not e!251467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422777 (= res!246948 (validKeyInArray!0 k0!794))))

(declare-fun res!246942 () Bool)

(assert (=> start!39534 (=> (not res!246942) (not e!251467))))

(assert (=> start!39534 (= res!246942 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12678 _keys!709))))))

(assert (=> start!39534 e!251467))

(assert (=> start!39534 tp_is_empty!10953))

(assert (=> start!39534 tp!34932))

(assert (=> start!39534 true))

(declare-fun array_inv!8982 (array!25755) Bool)

(assert (=> start!39534 (and (array_inv!8982 _values!549) e!251468)))

(declare-fun array_inv!8983 (array!25753) Bool)

(assert (=> start!39534 (array_inv!8983 _keys!709)))

(assert (= (and start!39534 res!246942) b!422776))

(assert (= (and b!422776 res!246941) b!422779))

(assert (= (and b!422779 res!246943) b!422774))

(assert (= (and b!422774 res!246946) b!422775))

(assert (= (and b!422775 res!246950) b!422769))

(assert (= (and b!422769 res!246947) b!422777))

(assert (= (and b!422777 res!246948) b!422770))

(assert (= (and b!422770 res!246949) b!422780))

(assert (= (and b!422780 res!246945) b!422783))

(assert (= (and b!422783 res!246940) b!422781))

(assert (= (and b!422781 res!246944) b!422778))

(assert (= (and b!422778 res!246951) b!422772))

(assert (= (and b!422782 condMapEmpty!18051) mapIsEmpty!18051))

(assert (= (and b!422782 (not condMapEmpty!18051)) mapNonEmpty!18051))

(get-info :version)

(assert (= (and mapNonEmpty!18051 ((_ is ValueCellFull!5133) mapValue!18051)) b!422771))

(assert (= (and b!422782 ((_ is ValueCellFull!5133) mapDefault!18051)) b!422773))

(assert (= start!39534 b!422782))

(declare-fun m!412473 () Bool)

(assert (=> start!39534 m!412473))

(declare-fun m!412475 () Bool)

(assert (=> start!39534 m!412475))

(declare-fun m!412477 () Bool)

(assert (=> b!422783 m!412477))

(declare-fun m!412479 () Bool)

(assert (=> b!422783 m!412479))

(declare-fun m!412481 () Bool)

(assert (=> b!422774 m!412481))

(declare-fun m!412483 () Bool)

(assert (=> b!422780 m!412483))

(declare-fun m!412485 () Bool)

(assert (=> b!422770 m!412485))

(declare-fun m!412487 () Bool)

(assert (=> b!422777 m!412487))

(declare-fun m!412489 () Bool)

(assert (=> b!422772 m!412489))

(declare-fun m!412491 () Bool)

(assert (=> b!422772 m!412491))

(declare-fun m!412493 () Bool)

(assert (=> b!422772 m!412493))

(declare-fun m!412495 () Bool)

(assert (=> mapNonEmpty!18051 m!412495))

(declare-fun m!412497 () Bool)

(assert (=> b!422781 m!412497))

(declare-fun m!412499 () Bool)

(assert (=> b!422776 m!412499))

(declare-fun m!412501 () Bool)

(assert (=> b!422775 m!412501))

(check-sat (not b!422777) (not b_next!9801) (not b!422780) (not b!422783) (not b!422772) b_and!17457 (not b!422776) (not mapNonEmpty!18051) (not b!422781) tp_is_empty!10953 (not b!422775) (not b!422774) (not start!39534))
(check-sat b_and!17457 (not b_next!9801))
