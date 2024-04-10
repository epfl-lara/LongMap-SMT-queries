; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43210 () Bool)

(assert start!43210)

(declare-fun b!478876 () Bool)

(declare-fun e!281641 () Bool)

(assert (=> b!478876 (= e!281641 false)))

(declare-fun lt!217783 () Bool)

(declare-datatypes ((array!30875 0))(
  ( (array!30876 (arr!14845 (Array (_ BitVec 32) (_ BitVec 64))) (size!15203 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30875)

(declare-datatypes ((List!9073 0))(
  ( (Nil!9070) (Cons!9069 (h!9925 (_ BitVec 64)) (t!15279 List!9073)) )
))
(declare-fun arrayNoDuplicates!0 (array!30875 (_ BitVec 32) List!9073) Bool)

(assert (=> b!478876 (= lt!217783 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9070))))

(declare-fun res!285687 () Bool)

(assert (=> start!43210 (=> (not res!285687) (not e!281641))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43210 (= res!285687 (validMask!0 mask!2352))))

(assert (=> start!43210 e!281641))

(assert (=> start!43210 true))

(declare-datatypes ((V!19203 0))(
  ( (V!19204 (val!6847 Int)) )
))
(declare-datatypes ((ValueCell!6438 0))(
  ( (ValueCellFull!6438 (v!9136 V!19203)) (EmptyCell!6438) )
))
(declare-datatypes ((array!30877 0))(
  ( (array!30878 (arr!14846 (Array (_ BitVec 32) ValueCell!6438)) (size!15204 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30877)

(declare-fun e!281639 () Bool)

(declare-fun array_inv!10710 (array!30877) Bool)

(assert (=> start!43210 (and (array_inv!10710 _values!1516) e!281639)))

(declare-fun array_inv!10711 (array!30875) Bool)

(assert (=> start!43210 (array_inv!10711 _keys!1874)))

(declare-fun b!478877 () Bool)

(declare-fun e!281643 () Bool)

(declare-fun tp_is_empty!13599 () Bool)

(assert (=> b!478877 (= e!281643 tp_is_empty!13599)))

(declare-fun b!478878 () Bool)

(declare-fun e!281642 () Bool)

(assert (=> b!478878 (= e!281642 tp_is_empty!13599)))

(declare-fun b!478879 () Bool)

(declare-fun res!285686 () Bool)

(assert (=> b!478879 (=> (not res!285686) (not e!281641))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30875 (_ BitVec 32)) Bool)

(assert (=> b!478879 (= res!285686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478880 () Bool)

(declare-fun res!285685 () Bool)

(assert (=> b!478880 (=> (not res!285685) (not e!281641))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478880 (= res!285685 (and (= (size!15204 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15203 _keys!1874) (size!15204 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22093 () Bool)

(declare-fun mapRes!22093 () Bool)

(declare-fun tp!42568 () Bool)

(assert (=> mapNonEmpty!22093 (= mapRes!22093 (and tp!42568 e!281643))))

(declare-fun mapValue!22093 () ValueCell!6438)

(declare-fun mapRest!22093 () (Array (_ BitVec 32) ValueCell!6438))

(declare-fun mapKey!22093 () (_ BitVec 32))

(assert (=> mapNonEmpty!22093 (= (arr!14846 _values!1516) (store mapRest!22093 mapKey!22093 mapValue!22093))))

(declare-fun b!478881 () Bool)

(assert (=> b!478881 (= e!281639 (and e!281642 mapRes!22093))))

(declare-fun condMapEmpty!22093 () Bool)

(declare-fun mapDefault!22093 () ValueCell!6438)

(assert (=> b!478881 (= condMapEmpty!22093 (= (arr!14846 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6438)) mapDefault!22093)))))

(declare-fun mapIsEmpty!22093 () Bool)

(assert (=> mapIsEmpty!22093 mapRes!22093))

(assert (= (and start!43210 res!285687) b!478880))

(assert (= (and b!478880 res!285685) b!478879))

(assert (= (and b!478879 res!285686) b!478876))

(assert (= (and b!478881 condMapEmpty!22093) mapIsEmpty!22093))

(assert (= (and b!478881 (not condMapEmpty!22093)) mapNonEmpty!22093))

(get-info :version)

(assert (= (and mapNonEmpty!22093 ((_ is ValueCellFull!6438) mapValue!22093)) b!478877))

(assert (= (and b!478881 ((_ is ValueCellFull!6438) mapDefault!22093)) b!478878))

(assert (= start!43210 b!478881))

(declare-fun m!460997 () Bool)

(assert (=> b!478876 m!460997))

(declare-fun m!460999 () Bool)

(assert (=> start!43210 m!460999))

(declare-fun m!461001 () Bool)

(assert (=> start!43210 m!461001))

(declare-fun m!461003 () Bool)

(assert (=> start!43210 m!461003))

(declare-fun m!461005 () Bool)

(assert (=> b!478879 m!461005))

(declare-fun m!461007 () Bool)

(assert (=> mapNonEmpty!22093 m!461007))

(check-sat (not b!478876) (not start!43210) (not mapNonEmpty!22093) tp_is_empty!13599 (not b!478879))
(check-sat)
