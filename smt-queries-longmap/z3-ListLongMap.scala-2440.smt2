; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38444 () Bool)

(assert start!38444)

(declare-fun b!396556 () Bool)

(declare-fun e!239904 () Bool)

(declare-fun e!239903 () Bool)

(declare-fun mapRes!16437 () Bool)

(assert (=> b!396556 (= e!239904 (and e!239903 mapRes!16437))))

(declare-fun condMapEmpty!16437 () Bool)

(declare-datatypes ((V!14275 0))(
  ( (V!14276 (val!4983 Int)) )
))
(declare-datatypes ((ValueCell!4595 0))(
  ( (ValueCellFull!4595 (v!7224 V!14275)) (EmptyCell!4595) )
))
(declare-datatypes ((array!23651 0))(
  ( (array!23652 (arr!11275 (Array (_ BitVec 32) ValueCell!4595)) (size!11628 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23651)

(declare-fun mapDefault!16437 () ValueCell!4595)

(assert (=> b!396556 (= condMapEmpty!16437 (= (arr!11275 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4595)) mapDefault!16437)))))

(declare-fun b!396557 () Bool)

(declare-fun tp_is_empty!9877 () Bool)

(assert (=> b!396557 (= e!239903 tp_is_empty!9877)))

(declare-fun b!396558 () Bool)

(declare-fun e!239901 () Bool)

(assert (=> b!396558 (= e!239901 tp_is_empty!9877)))

(declare-fun b!396559 () Bool)

(declare-fun e!239899 () Bool)

(assert (=> b!396559 (= e!239899 false)))

(declare-fun lt!186977 () Bool)

(declare-datatypes ((array!23653 0))(
  ( (array!23654 (arr!11276 (Array (_ BitVec 32) (_ BitVec 64))) (size!11629 (_ BitVec 32))) )
))
(declare-fun lt!186976 () array!23653)

(declare-datatypes ((List!6496 0))(
  ( (Nil!6493) (Cons!6492 (h!7348 (_ BitVec 64)) (t!11661 List!6496)) )
))
(declare-fun arrayNoDuplicates!0 (array!23653 (_ BitVec 32) List!6496) Bool)

(assert (=> b!396559 (= lt!186977 (arrayNoDuplicates!0 lt!186976 #b00000000000000000000000000000000 Nil!6493))))

(declare-fun mapIsEmpty!16437 () Bool)

(assert (=> mapIsEmpty!16437 mapRes!16437))

(declare-fun b!396560 () Bool)

(declare-fun res!227604 () Bool)

(declare-fun e!239902 () Bool)

(assert (=> b!396560 (=> (not res!227604) (not e!239902))))

(declare-fun _keys!709 () array!23653)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396560 (= res!227604 (or (= (select (arr!11276 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11276 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!227605 () Bool)

(assert (=> start!38444 (=> (not res!227605) (not e!239902))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38444 (= res!227605 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11629 _keys!709))))))

(assert (=> start!38444 e!239902))

(assert (=> start!38444 true))

(declare-fun array_inv!8276 (array!23651) Bool)

(assert (=> start!38444 (and (array_inv!8276 _values!549) e!239904)))

(declare-fun array_inv!8277 (array!23653) Bool)

(assert (=> start!38444 (array_inv!8277 _keys!709)))

(declare-fun b!396561 () Bool)

(declare-fun res!227608 () Bool)

(assert (=> b!396561 (=> (not res!227608) (not e!239902))))

(assert (=> b!396561 (= res!227608 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6493))))

(declare-fun b!396562 () Bool)

(declare-fun res!227610 () Bool)

(assert (=> b!396562 (=> (not res!227610) (not e!239902))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396562 (= res!227610 (validKeyInArray!0 k0!794))))

(declare-fun b!396563 () Bool)

(declare-fun res!227601 () Bool)

(assert (=> b!396563 (=> (not res!227601) (not e!239902))))

(assert (=> b!396563 (= res!227601 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11629 _keys!709))))))

(declare-fun b!396564 () Bool)

(declare-fun res!227609 () Bool)

(assert (=> b!396564 (=> (not res!227609) (not e!239902))))

(declare-fun arrayContainsKey!0 (array!23653 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396564 (= res!227609 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!396565 () Bool)

(declare-fun res!227603 () Bool)

(assert (=> b!396565 (=> (not res!227603) (not e!239902))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23653 (_ BitVec 32)) Bool)

(assert (=> b!396565 (= res!227603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396566 () Bool)

(declare-fun res!227606 () Bool)

(assert (=> b!396566 (=> (not res!227606) (not e!239902))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396566 (= res!227606 (validMask!0 mask!1025))))

(declare-fun b!396567 () Bool)

(assert (=> b!396567 (= e!239902 e!239899)))

(declare-fun res!227607 () Bool)

(assert (=> b!396567 (=> (not res!227607) (not e!239899))))

(assert (=> b!396567 (= res!227607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186976 mask!1025))))

(assert (=> b!396567 (= lt!186976 (array!23654 (store (arr!11276 _keys!709) i!563 k0!794) (size!11629 _keys!709)))))

(declare-fun b!396568 () Bool)

(declare-fun res!227602 () Bool)

(assert (=> b!396568 (=> (not res!227602) (not e!239902))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!396568 (= res!227602 (and (= (size!11628 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11629 _keys!709) (size!11628 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!16437 () Bool)

(declare-fun tp!32232 () Bool)

(assert (=> mapNonEmpty!16437 (= mapRes!16437 (and tp!32232 e!239901))))

(declare-fun mapValue!16437 () ValueCell!4595)

(declare-fun mapRest!16437 () (Array (_ BitVec 32) ValueCell!4595))

(declare-fun mapKey!16437 () (_ BitVec 32))

(assert (=> mapNonEmpty!16437 (= (arr!11275 _values!549) (store mapRest!16437 mapKey!16437 mapValue!16437))))

(assert (= (and start!38444 res!227605) b!396566))

(assert (= (and b!396566 res!227606) b!396568))

(assert (= (and b!396568 res!227602) b!396565))

(assert (= (and b!396565 res!227603) b!396561))

(assert (= (and b!396561 res!227608) b!396563))

(assert (= (and b!396563 res!227601) b!396562))

(assert (= (and b!396562 res!227610) b!396560))

(assert (= (and b!396560 res!227604) b!396564))

(assert (= (and b!396564 res!227609) b!396567))

(assert (= (and b!396567 res!227607) b!396559))

(assert (= (and b!396556 condMapEmpty!16437) mapIsEmpty!16437))

(assert (= (and b!396556 (not condMapEmpty!16437)) mapNonEmpty!16437))

(get-info :version)

(assert (= (and mapNonEmpty!16437 ((_ is ValueCellFull!4595) mapValue!16437)) b!396558))

(assert (= (and b!396556 ((_ is ValueCellFull!4595) mapDefault!16437)) b!396557))

(assert (= start!38444 b!396556))

(declare-fun m!391587 () Bool)

(assert (=> b!396562 m!391587))

(declare-fun m!391589 () Bool)

(assert (=> mapNonEmpty!16437 m!391589))

(declare-fun m!391591 () Bool)

(assert (=> b!396564 m!391591))

(declare-fun m!391593 () Bool)

(assert (=> b!396561 m!391593))

(declare-fun m!391595 () Bool)

(assert (=> b!396565 m!391595))

(declare-fun m!391597 () Bool)

(assert (=> start!38444 m!391597))

(declare-fun m!391599 () Bool)

(assert (=> start!38444 m!391599))

(declare-fun m!391601 () Bool)

(assert (=> b!396567 m!391601))

(declare-fun m!391603 () Bool)

(assert (=> b!396567 m!391603))

(declare-fun m!391605 () Bool)

(assert (=> b!396559 m!391605))

(declare-fun m!391607 () Bool)

(assert (=> b!396566 m!391607))

(declare-fun m!391609 () Bool)

(assert (=> b!396560 m!391609))

(check-sat (not b!396561) (not start!38444) (not b!396562) (not b!396565) (not b!396564) tp_is_empty!9877 (not b!396567) (not mapNonEmpty!16437) (not b!396566) (not b!396559))
(check-sat)
