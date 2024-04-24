; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36780 () Bool)

(assert start!36780)

(declare-fun b!367457 () Bool)

(declare-fun res!205770 () Bool)

(declare-fun e!224867 () Bool)

(assert (=> b!367457 (=> (not res!205770) (not e!224867))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12531 0))(
  ( (V!12532 (val!4329 Int)) )
))
(declare-datatypes ((ValueCell!3941 0))(
  ( (ValueCellFull!3941 (v!6527 V!12531)) (EmptyCell!3941) )
))
(declare-datatypes ((array!21080 0))(
  ( (array!21081 (arr!10008 (Array (_ BitVec 32) ValueCell!3941)) (size!10360 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21080)

(declare-datatypes ((array!21082 0))(
  ( (array!21083 (arr!10009 (Array (_ BitVec 32) (_ BitVec 64))) (size!10361 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21082)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!367457 (= res!205770 (and (= (size!10360 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10361 _keys!658) (size!10360 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!367458 () Bool)

(declare-fun e!224870 () Bool)

(assert (=> b!367458 (= e!224870 false)))

(declare-fun lt!169413 () Bool)

(declare-fun lt!169414 () array!21082)

(declare-datatypes ((List!5475 0))(
  ( (Nil!5472) (Cons!5471 (h!6327 (_ BitVec 64)) (t!10617 List!5475)) )
))
(declare-fun arrayNoDuplicates!0 (array!21082 (_ BitVec 32) List!5475) Bool)

(assert (=> b!367458 (= lt!169413 (arrayNoDuplicates!0 lt!169414 #b00000000000000000000000000000000 Nil!5472))))

(declare-fun b!367460 () Bool)

(declare-fun e!224871 () Bool)

(declare-fun tp_is_empty!8569 () Bool)

(assert (=> b!367460 (= e!224871 tp_is_empty!8569)))

(declare-fun mapNonEmpty!14418 () Bool)

(declare-fun mapRes!14418 () Bool)

(declare-fun tp!28494 () Bool)

(assert (=> mapNonEmpty!14418 (= mapRes!14418 (and tp!28494 e!224871))))

(declare-fun mapKey!14418 () (_ BitVec 32))

(declare-fun mapValue!14418 () ValueCell!3941)

(declare-fun mapRest!14418 () (Array (_ BitVec 32) ValueCell!3941))

(assert (=> mapNonEmpty!14418 (= (arr!10008 _values!506) (store mapRest!14418 mapKey!14418 mapValue!14418))))

(declare-fun b!367461 () Bool)

(declare-fun res!205769 () Bool)

(assert (=> b!367461 (=> (not res!205769) (not e!224867))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!367461 (= res!205769 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10361 _keys!658))))))

(declare-fun b!367462 () Bool)

(declare-fun res!205766 () Bool)

(assert (=> b!367462 (=> (not res!205766) (not e!224867))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!367462 (= res!205766 (validKeyInArray!0 k0!778))))

(declare-fun b!367463 () Bool)

(declare-fun res!205768 () Bool)

(assert (=> b!367463 (=> (not res!205768) (not e!224867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21082 (_ BitVec 32)) Bool)

(assert (=> b!367463 (= res!205768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!367464 () Bool)

(declare-fun res!205764 () Bool)

(assert (=> b!367464 (=> (not res!205764) (not e!224867))))

(declare-fun arrayContainsKey!0 (array!21082 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!367464 (= res!205764 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14418 () Bool)

(assert (=> mapIsEmpty!14418 mapRes!14418))

(declare-fun b!367465 () Bool)

(declare-fun res!205767 () Bool)

(assert (=> b!367465 (=> (not res!205767) (not e!224867))))

(assert (=> b!367465 (= res!205767 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5472))))

(declare-fun b!367466 () Bool)

(declare-fun e!224866 () Bool)

(assert (=> b!367466 (= e!224866 tp_is_empty!8569)))

(declare-fun res!205772 () Bool)

(assert (=> start!36780 (=> (not res!205772) (not e!224867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36780 (= res!205772 (validMask!0 mask!970))))

(assert (=> start!36780 e!224867))

(assert (=> start!36780 true))

(declare-fun e!224868 () Bool)

(declare-fun array_inv!7434 (array!21080) Bool)

(assert (=> start!36780 (and (array_inv!7434 _values!506) e!224868)))

(declare-fun array_inv!7435 (array!21082) Bool)

(assert (=> start!36780 (array_inv!7435 _keys!658)))

(declare-fun b!367459 () Bool)

(assert (=> b!367459 (= e!224867 e!224870)))

(declare-fun res!205771 () Bool)

(assert (=> b!367459 (=> (not res!205771) (not e!224870))))

(assert (=> b!367459 (= res!205771 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169414 mask!970))))

(assert (=> b!367459 (= lt!169414 (array!21083 (store (arr!10009 _keys!658) i!548 k0!778) (size!10361 _keys!658)))))

(declare-fun b!367467 () Bool)

(declare-fun res!205765 () Bool)

(assert (=> b!367467 (=> (not res!205765) (not e!224867))))

(assert (=> b!367467 (= res!205765 (or (= (select (arr!10009 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10009 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!367468 () Bool)

(assert (=> b!367468 (= e!224868 (and e!224866 mapRes!14418))))

(declare-fun condMapEmpty!14418 () Bool)

(declare-fun mapDefault!14418 () ValueCell!3941)

(assert (=> b!367468 (= condMapEmpty!14418 (= (arr!10008 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3941)) mapDefault!14418)))))

(assert (= (and start!36780 res!205772) b!367457))

(assert (= (and b!367457 res!205770) b!367463))

(assert (= (and b!367463 res!205768) b!367465))

(assert (= (and b!367465 res!205767) b!367461))

(assert (= (and b!367461 res!205769) b!367462))

(assert (= (and b!367462 res!205766) b!367467))

(assert (= (and b!367467 res!205765) b!367464))

(assert (= (and b!367464 res!205764) b!367459))

(assert (= (and b!367459 res!205771) b!367458))

(assert (= (and b!367468 condMapEmpty!14418) mapIsEmpty!14418))

(assert (= (and b!367468 (not condMapEmpty!14418)) mapNonEmpty!14418))

(get-info :version)

(assert (= (and mapNonEmpty!14418 ((_ is ValueCellFull!3941) mapValue!14418)) b!367460))

(assert (= (and b!367468 ((_ is ValueCellFull!3941) mapDefault!14418)) b!367466))

(assert (= start!36780 b!367468))

(declare-fun m!364697 () Bool)

(assert (=> b!367464 m!364697))

(declare-fun m!364699 () Bool)

(assert (=> b!367463 m!364699))

(declare-fun m!364701 () Bool)

(assert (=> b!367465 m!364701))

(declare-fun m!364703 () Bool)

(assert (=> b!367467 m!364703))

(declare-fun m!364705 () Bool)

(assert (=> mapNonEmpty!14418 m!364705))

(declare-fun m!364707 () Bool)

(assert (=> b!367459 m!364707))

(declare-fun m!364709 () Bool)

(assert (=> b!367459 m!364709))

(declare-fun m!364711 () Bool)

(assert (=> b!367458 m!364711))

(declare-fun m!364713 () Bool)

(assert (=> b!367462 m!364713))

(declare-fun m!364715 () Bool)

(assert (=> start!36780 m!364715))

(declare-fun m!364717 () Bool)

(assert (=> start!36780 m!364717))

(declare-fun m!364719 () Bool)

(assert (=> start!36780 m!364719))

(check-sat (not start!36780) (not b!367465) (not mapNonEmpty!14418) (not b!367462) (not b!367458) (not b!367459) tp_is_empty!8569 (not b!367463) (not b!367464))
(check-sat)
