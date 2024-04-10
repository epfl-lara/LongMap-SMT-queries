; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38892 () Bool)

(assert start!38892)

(declare-fun b!406586 () Bool)

(declare-fun e!244306 () Bool)

(declare-fun e!244303 () Bool)

(declare-fun mapRes!17088 () Bool)

(assert (=> b!406586 (= e!244306 (and e!244303 mapRes!17088))))

(declare-fun condMapEmpty!17088 () Bool)

(declare-datatypes ((V!14853 0))(
  ( (V!14854 (val!5200 Int)) )
))
(declare-datatypes ((ValueCell!4812 0))(
  ( (ValueCellFull!4812 (v!7447 V!14853)) (EmptyCell!4812) )
))
(declare-datatypes ((array!24511 0))(
  ( (array!24512 (arr!11705 (Array (_ BitVec 32) ValueCell!4812)) (size!12057 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24511)

(declare-fun mapDefault!17088 () ValueCell!4812)

(assert (=> b!406586 (= condMapEmpty!17088 (= (arr!11705 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4812)) mapDefault!17088)))))

(declare-fun b!406587 () Bool)

(declare-fun tp_is_empty!10311 () Bool)

(assert (=> b!406587 (= e!244303 tp_is_empty!10311)))

(declare-fun b!406588 () Bool)

(declare-fun res!234893 () Bool)

(declare-fun e!244308 () Bool)

(assert (=> b!406588 (=> (not res!234893) (not e!244308))))

(declare-datatypes ((array!24513 0))(
  ( (array!24514 (arr!11706 (Array (_ BitVec 32) (_ BitVec 64))) (size!12058 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24513)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!406588 (= res!234893 (and (= (size!12057 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12058 _keys!709) (size!12057 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406589 () Bool)

(declare-fun res!234894 () Bool)

(assert (=> b!406589 (=> (not res!234894) (not e!244308))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406589 (= res!234894 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17088 () Bool)

(declare-fun tp!33207 () Bool)

(declare-fun e!244305 () Bool)

(assert (=> mapNonEmpty!17088 (= mapRes!17088 (and tp!33207 e!244305))))

(declare-fun mapRest!17088 () (Array (_ BitVec 32) ValueCell!4812))

(declare-fun mapKey!17088 () (_ BitVec 32))

(declare-fun mapValue!17088 () ValueCell!4812)

(assert (=> mapNonEmpty!17088 (= (arr!11705 _values!549) (store mapRest!17088 mapKey!17088 mapValue!17088))))

(declare-fun b!406590 () Bool)

(declare-fun res!234895 () Bool)

(assert (=> b!406590 (=> (not res!234895) (not e!244308))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406590 (= res!234895 (or (= (select (arr!11706 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11706 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406591 () Bool)

(assert (=> b!406591 (= e!244305 tp_is_empty!10311)))

(declare-fun b!406592 () Bool)

(declare-fun e!244304 () Bool)

(assert (=> b!406592 (= e!244308 e!244304)))

(declare-fun res!234891 () Bool)

(assert (=> b!406592 (=> (not res!234891) (not e!244304))))

(declare-fun lt!188512 () array!24513)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24513 (_ BitVec 32)) Bool)

(assert (=> b!406592 (= res!234891 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188512 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!406592 (= lt!188512 (array!24514 (store (arr!11706 _keys!709) i!563 k0!794) (size!12058 _keys!709)))))

(declare-fun mapIsEmpty!17088 () Bool)

(assert (=> mapIsEmpty!17088 mapRes!17088))

(declare-fun b!406593 () Bool)

(declare-fun res!234890 () Bool)

(assert (=> b!406593 (=> (not res!234890) (not e!244308))))

(declare-fun arrayContainsKey!0 (array!24513 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406593 (= res!234890 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406595 () Bool)

(declare-fun res!234896 () Bool)

(assert (=> b!406595 (=> (not res!234896) (not e!244308))))

(assert (=> b!406595 (= res!234896 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12058 _keys!709))))))

(declare-fun b!406596 () Bool)

(declare-fun res!234889 () Bool)

(assert (=> b!406596 (=> (not res!234889) (not e!244308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406596 (= res!234889 (validKeyInArray!0 k0!794))))

(declare-fun b!406597 () Bool)

(declare-fun res!234892 () Bool)

(assert (=> b!406597 (=> (not res!234892) (not e!244308))))

(assert (=> b!406597 (= res!234892 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406598 () Bool)

(assert (=> b!406598 (= e!244304 false)))

(declare-fun lt!188513 () Bool)

(declare-datatypes ((List!6796 0))(
  ( (Nil!6793) (Cons!6792 (h!7648 (_ BitVec 64)) (t!11970 List!6796)) )
))
(declare-fun arrayNoDuplicates!0 (array!24513 (_ BitVec 32) List!6796) Bool)

(assert (=> b!406598 (= lt!188513 (arrayNoDuplicates!0 lt!188512 #b00000000000000000000000000000000 Nil!6793))))

(declare-fun res!234897 () Bool)

(assert (=> start!38892 (=> (not res!234897) (not e!244308))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38892 (= res!234897 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12058 _keys!709))))))

(assert (=> start!38892 e!244308))

(assert (=> start!38892 true))

(declare-fun array_inv!8548 (array!24511) Bool)

(assert (=> start!38892 (and (array_inv!8548 _values!549) e!244306)))

(declare-fun array_inv!8549 (array!24513) Bool)

(assert (=> start!38892 (array_inv!8549 _keys!709)))

(declare-fun b!406594 () Bool)

(declare-fun res!234888 () Bool)

(assert (=> b!406594 (=> (not res!234888) (not e!244308))))

(assert (=> b!406594 (= res!234888 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6793))))

(assert (= (and start!38892 res!234897) b!406589))

(assert (= (and b!406589 res!234894) b!406588))

(assert (= (and b!406588 res!234893) b!406597))

(assert (= (and b!406597 res!234892) b!406594))

(assert (= (and b!406594 res!234888) b!406595))

(assert (= (and b!406595 res!234896) b!406596))

(assert (= (and b!406596 res!234889) b!406590))

(assert (= (and b!406590 res!234895) b!406593))

(assert (= (and b!406593 res!234890) b!406592))

(assert (= (and b!406592 res!234891) b!406598))

(assert (= (and b!406586 condMapEmpty!17088) mapIsEmpty!17088))

(assert (= (and b!406586 (not condMapEmpty!17088)) mapNonEmpty!17088))

(get-info :version)

(assert (= (and mapNonEmpty!17088 ((_ is ValueCellFull!4812) mapValue!17088)) b!406591))

(assert (= (and b!406586 ((_ is ValueCellFull!4812) mapDefault!17088)) b!406587))

(assert (= start!38892 b!406586))

(declare-fun m!398599 () Bool)

(assert (=> b!406598 m!398599))

(declare-fun m!398601 () Bool)

(assert (=> b!406597 m!398601))

(declare-fun m!398603 () Bool)

(assert (=> start!38892 m!398603))

(declare-fun m!398605 () Bool)

(assert (=> start!38892 m!398605))

(declare-fun m!398607 () Bool)

(assert (=> mapNonEmpty!17088 m!398607))

(declare-fun m!398609 () Bool)

(assert (=> b!406594 m!398609))

(declare-fun m!398611 () Bool)

(assert (=> b!406593 m!398611))

(declare-fun m!398613 () Bool)

(assert (=> b!406589 m!398613))

(declare-fun m!398615 () Bool)

(assert (=> b!406590 m!398615))

(declare-fun m!398617 () Bool)

(assert (=> b!406596 m!398617))

(declare-fun m!398619 () Bool)

(assert (=> b!406592 m!398619))

(declare-fun m!398621 () Bool)

(assert (=> b!406592 m!398621))

(check-sat (not b!406597) tp_is_empty!10311 (not b!406592) (not b!406593) (not b!406594) (not b!406589) (not start!38892) (not b!406596) (not b!406598) (not mapNonEmpty!17088))
(check-sat)
