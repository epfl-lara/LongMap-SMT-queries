; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39080 () Bool)

(assert start!39080)

(declare-fun b_free!9361 () Bool)

(declare-fun b_next!9361 () Bool)

(assert (=> start!39080 (= b_free!9361 (not b_next!9361))))

(declare-fun tp!33611 () Bool)

(declare-fun b_and!16761 () Bool)

(assert (=> start!39080 (= tp!33611 b_and!16761)))

(declare-fun b!410678 () Bool)

(declare-fun e!246091 () Bool)

(assert (=> b!410678 (= e!246091 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((V!15123 0))(
  ( (V!15124 (val!5301 Int)) )
))
(declare-fun minValue!515 () V!15123)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!4913 0))(
  ( (ValueCellFull!4913 (v!7549 V!15123)) (EmptyCell!4913) )
))
(declare-datatypes ((array!24890 0))(
  ( (array!24891 (arr!11894 (Array (_ BitVec 32) ValueCell!4913)) (size!12246 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24890)

(declare-fun zeroValue!515 () V!15123)

(declare-datatypes ((tuple2!6746 0))(
  ( (tuple2!6747 (_1!3384 (_ BitVec 64)) (_2!3384 V!15123)) )
))
(declare-datatypes ((List!6764 0))(
  ( (Nil!6761) (Cons!6760 (h!7616 tuple2!6746) (t!11930 List!6764)) )
))
(declare-datatypes ((ListLongMap!5661 0))(
  ( (ListLongMap!5662 (toList!2846 List!6764)) )
))
(declare-fun lt!189157 () ListLongMap!5661)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15123)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!24892 0))(
  ( (array!24893 (arr!11895 (Array (_ BitVec 32) (_ BitVec 64))) (size!12247 (_ BitVec 32))) )
))
(declare-fun lt!189158 () array!24892)

(declare-fun getCurrentListMapNoExtraKeys!1098 (array!24892 array!24890 (_ BitVec 32) (_ BitVec 32) V!15123 V!15123 (_ BitVec 32) Int) ListLongMap!5661)

(assert (=> b!410678 (= lt!189157 (getCurrentListMapNoExtraKeys!1098 lt!189158 (array!24891 (store (arr!11894 _values!549) i!563 (ValueCellFull!4913 v!412)) (size!12246 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!189159 () ListLongMap!5661)

(declare-fun _keys!709 () array!24892)

(assert (=> b!410678 (= lt!189159 (getCurrentListMapNoExtraKeys!1098 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!410679 () Bool)

(declare-fun res!238121 () Bool)

(declare-fun e!246092 () Bool)

(assert (=> b!410679 (=> (not res!238121) (not e!246092))))

(assert (=> b!410679 (= res!238121 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12247 _keys!709))))))

(declare-fun b!410680 () Bool)

(declare-fun res!238124 () Bool)

(assert (=> b!410680 (=> (not res!238124) (not e!246091))))

(declare-datatypes ((List!6765 0))(
  ( (Nil!6762) (Cons!6761 (h!7617 (_ BitVec 64)) (t!11931 List!6765)) )
))
(declare-fun arrayNoDuplicates!0 (array!24892 (_ BitVec 32) List!6765) Bool)

(assert (=> b!410680 (= res!238124 (arrayNoDuplicates!0 lt!189158 #b00000000000000000000000000000000 Nil!6762))))

(declare-fun b!410681 () Bool)

(declare-fun e!246094 () Bool)

(declare-fun e!246090 () Bool)

(declare-fun mapRes!17391 () Bool)

(assert (=> b!410681 (= e!246094 (and e!246090 mapRes!17391))))

(declare-fun condMapEmpty!17391 () Bool)

(declare-fun mapDefault!17391 () ValueCell!4913)

(assert (=> b!410681 (= condMapEmpty!17391 (= (arr!11894 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4913)) mapDefault!17391)))))

(declare-fun b!410682 () Bool)

(declare-fun tp_is_empty!10513 () Bool)

(assert (=> b!410682 (= e!246090 tp_is_empty!10513)))

(declare-fun b!410683 () Bool)

(declare-fun res!238123 () Bool)

(assert (=> b!410683 (=> (not res!238123) (not e!246092))))

(assert (=> b!410683 (= res!238123 (and (= (size!12246 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12247 _keys!709) (size!12246 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!238118 () Bool)

(assert (=> start!39080 (=> (not res!238118) (not e!246092))))

(assert (=> start!39080 (= res!238118 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12247 _keys!709))))))

(assert (=> start!39080 e!246092))

(assert (=> start!39080 tp_is_empty!10513))

(assert (=> start!39080 tp!33611))

(assert (=> start!39080 true))

(declare-fun array_inv!8758 (array!24890) Bool)

(assert (=> start!39080 (and (array_inv!8758 _values!549) e!246094)))

(declare-fun array_inv!8759 (array!24892) Bool)

(assert (=> start!39080 (array_inv!8759 _keys!709)))

(declare-fun b!410684 () Bool)

(declare-fun res!238128 () Bool)

(assert (=> b!410684 (=> (not res!238128) (not e!246092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24892 (_ BitVec 32)) Bool)

(assert (=> b!410684 (= res!238128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!410685 () Bool)

(declare-fun res!238126 () Bool)

(assert (=> b!410685 (=> (not res!238126) (not e!246092))))

(assert (=> b!410685 (= res!238126 (or (= (select (arr!11895 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11895 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!17391 () Bool)

(assert (=> mapIsEmpty!17391 mapRes!17391))

(declare-fun b!410686 () Bool)

(declare-fun e!246093 () Bool)

(assert (=> b!410686 (= e!246093 tp_is_empty!10513)))

(declare-fun mapNonEmpty!17391 () Bool)

(declare-fun tp!33612 () Bool)

(assert (=> mapNonEmpty!17391 (= mapRes!17391 (and tp!33612 e!246093))))

(declare-fun mapKey!17391 () (_ BitVec 32))

(declare-fun mapRest!17391 () (Array (_ BitVec 32) ValueCell!4913))

(declare-fun mapValue!17391 () ValueCell!4913)

(assert (=> mapNonEmpty!17391 (= (arr!11894 _values!549) (store mapRest!17391 mapKey!17391 mapValue!17391))))

(declare-fun b!410687 () Bool)

(declare-fun res!238120 () Bool)

(assert (=> b!410687 (=> (not res!238120) (not e!246092))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24892 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!410687 (= res!238120 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!410688 () Bool)

(declare-fun res!238119 () Bool)

(assert (=> b!410688 (=> (not res!238119) (not e!246092))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!410688 (= res!238119 (validMask!0 mask!1025))))

(declare-fun b!410689 () Bool)

(assert (=> b!410689 (= e!246092 e!246091)))

(declare-fun res!238127 () Bool)

(assert (=> b!410689 (=> (not res!238127) (not e!246091))))

(assert (=> b!410689 (= res!238127 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189158 mask!1025))))

(assert (=> b!410689 (= lt!189158 (array!24893 (store (arr!11895 _keys!709) i!563 k0!794) (size!12247 _keys!709)))))

(declare-fun b!410690 () Bool)

(declare-fun res!238117 () Bool)

(assert (=> b!410690 (=> (not res!238117) (not e!246091))))

(assert (=> b!410690 (= res!238117 (bvsle from!863 i!563))))

(declare-fun b!410691 () Bool)

(declare-fun res!238122 () Bool)

(assert (=> b!410691 (=> (not res!238122) (not e!246092))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!410691 (= res!238122 (validKeyInArray!0 k0!794))))

(declare-fun b!410692 () Bool)

(declare-fun res!238125 () Bool)

(assert (=> b!410692 (=> (not res!238125) (not e!246092))))

(assert (=> b!410692 (= res!238125 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6762))))

(assert (= (and start!39080 res!238118) b!410688))

(assert (= (and b!410688 res!238119) b!410683))

(assert (= (and b!410683 res!238123) b!410684))

(assert (= (and b!410684 res!238128) b!410692))

(assert (= (and b!410692 res!238125) b!410679))

(assert (= (and b!410679 res!238121) b!410691))

(assert (= (and b!410691 res!238122) b!410685))

(assert (= (and b!410685 res!238126) b!410687))

(assert (= (and b!410687 res!238120) b!410689))

(assert (= (and b!410689 res!238127) b!410680))

(assert (= (and b!410680 res!238124) b!410690))

(assert (= (and b!410690 res!238117) b!410678))

(assert (= (and b!410681 condMapEmpty!17391) mapIsEmpty!17391))

(assert (= (and b!410681 (not condMapEmpty!17391)) mapNonEmpty!17391))

(get-info :version)

(assert (= (and mapNonEmpty!17391 ((_ is ValueCellFull!4913) mapValue!17391)) b!410686))

(assert (= (and b!410681 ((_ is ValueCellFull!4913) mapDefault!17391)) b!410682))

(assert (= start!39080 b!410681))

(declare-fun m!401343 () Bool)

(assert (=> mapNonEmpty!17391 m!401343))

(declare-fun m!401345 () Bool)

(assert (=> b!410688 m!401345))

(declare-fun m!401347 () Bool)

(assert (=> b!410691 m!401347))

(declare-fun m!401349 () Bool)

(assert (=> b!410685 m!401349))

(declare-fun m!401351 () Bool)

(assert (=> b!410684 m!401351))

(declare-fun m!401353 () Bool)

(assert (=> start!39080 m!401353))

(declare-fun m!401355 () Bool)

(assert (=> start!39080 m!401355))

(declare-fun m!401357 () Bool)

(assert (=> b!410678 m!401357))

(declare-fun m!401359 () Bool)

(assert (=> b!410678 m!401359))

(declare-fun m!401361 () Bool)

(assert (=> b!410678 m!401361))

(declare-fun m!401363 () Bool)

(assert (=> b!410689 m!401363))

(declare-fun m!401365 () Bool)

(assert (=> b!410689 m!401365))

(declare-fun m!401367 () Bool)

(assert (=> b!410680 m!401367))

(declare-fun m!401369 () Bool)

(assert (=> b!410687 m!401369))

(declare-fun m!401371 () Bool)

(assert (=> b!410692 m!401371))

(check-sat (not b_next!9361) (not b!410687) (not b!410692) (not b!410680) (not b!410689) b_and!16761 (not b!410688) (not b!410691) (not b!410684) (not b!410678) (not start!39080) tp_is_empty!10513 (not mapNonEmpty!17391))
(check-sat b_and!16761 (not b_next!9361))
