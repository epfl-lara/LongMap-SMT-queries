; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108000 () Bool)

(assert start!108000)

(declare-fun mapNonEmpty!51437 () Bool)

(declare-fun mapRes!51437 () Bool)

(declare-fun tp!98195 () Bool)

(declare-fun e!728300 () Bool)

(assert (=> mapNonEmpty!51437 (= mapRes!51437 (and tp!98195 e!728300))))

(declare-datatypes ((V!49467 0))(
  ( (V!49468 (val!16711 Int)) )
))
(declare-datatypes ((ValueCell!15738 0))(
  ( (ValueCellFull!15738 (v!19308 V!49467)) (EmptyCell!15738) )
))
(declare-fun mapRest!51437 () (Array (_ BitVec 32) ValueCell!15738))

(declare-fun mapKey!51437 () (_ BitVec 32))

(declare-fun mapValue!51437 () ValueCell!15738)

(declare-datatypes ((array!83652 0))(
  ( (array!83653 (arr!40338 (Array (_ BitVec 32) ValueCell!15738)) (size!40888 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83652)

(assert (=> mapNonEmpty!51437 (= (arr!40338 _values!1187) (store mapRest!51437 mapKey!51437 mapValue!51437))))

(declare-fun b!1275694 () Bool)

(declare-fun tp_is_empty!33273 () Bool)

(assert (=> b!1275694 (= e!728300 tp_is_empty!33273)))

(declare-fun b!1275695 () Bool)

(declare-fun e!728302 () Bool)

(declare-fun e!728301 () Bool)

(assert (=> b!1275695 (= e!728302 (and e!728301 mapRes!51437))))

(declare-fun condMapEmpty!51437 () Bool)

(declare-fun mapDefault!51437 () ValueCell!15738)

(assert (=> b!1275695 (= condMapEmpty!51437 (= (arr!40338 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15738)) mapDefault!51437)))))

(declare-fun b!1275696 () Bool)

(declare-fun res!847892 () Bool)

(declare-fun e!728304 () Bool)

(assert (=> b!1275696 (=> (not res!847892) (not e!728304))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((array!83654 0))(
  ( (array!83655 (arr!40339 (Array (_ BitVec 32) (_ BitVec 64))) (size!40889 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83654)

(assert (=> b!1275696 (= res!847892 (and (= (size!40888 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40889 _keys!1427) (size!40888 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275697 () Bool)

(assert (=> b!1275697 (= e!728304 false)))

(declare-fun lt!575377 () Bool)

(declare-datatypes ((List!28622 0))(
  ( (Nil!28619) (Cons!28618 (h!29827 (_ BitVec 64)) (t!42158 List!28622)) )
))
(declare-fun arrayNoDuplicates!0 (array!83654 (_ BitVec 32) List!28622) Bool)

(assert (=> b!1275697 (= lt!575377 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28619))))

(declare-fun mapIsEmpty!51437 () Bool)

(assert (=> mapIsEmpty!51437 mapRes!51437))

(declare-fun b!1275698 () Bool)

(assert (=> b!1275698 (= e!728301 tp_is_empty!33273)))

(declare-fun res!847891 () Bool)

(assert (=> start!108000 (=> (not res!847891) (not e!728304))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108000 (= res!847891 (validMask!0 mask!1805))))

(assert (=> start!108000 e!728304))

(assert (=> start!108000 true))

(declare-fun array_inv!30663 (array!83652) Bool)

(assert (=> start!108000 (and (array_inv!30663 _values!1187) e!728302)))

(declare-fun array_inv!30664 (array!83654) Bool)

(assert (=> start!108000 (array_inv!30664 _keys!1427)))

(declare-fun b!1275699 () Bool)

(declare-fun res!847893 () Bool)

(assert (=> b!1275699 (=> (not res!847893) (not e!728304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83654 (_ BitVec 32)) Bool)

(assert (=> b!1275699 (= res!847893 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(assert (= (and start!108000 res!847891) b!1275696))

(assert (= (and b!1275696 res!847892) b!1275699))

(assert (= (and b!1275699 res!847893) b!1275697))

(assert (= (and b!1275695 condMapEmpty!51437) mapIsEmpty!51437))

(assert (= (and b!1275695 (not condMapEmpty!51437)) mapNonEmpty!51437))

(get-info :version)

(assert (= (and mapNonEmpty!51437 ((_ is ValueCellFull!15738) mapValue!51437)) b!1275694))

(assert (= (and b!1275695 ((_ is ValueCellFull!15738) mapDefault!51437)) b!1275698))

(assert (= start!108000 b!1275695))

(declare-fun m!1171847 () Bool)

(assert (=> mapNonEmpty!51437 m!1171847))

(declare-fun m!1171849 () Bool)

(assert (=> b!1275697 m!1171849))

(declare-fun m!1171851 () Bool)

(assert (=> start!108000 m!1171851))

(declare-fun m!1171853 () Bool)

(assert (=> start!108000 m!1171853))

(declare-fun m!1171855 () Bool)

(assert (=> start!108000 m!1171855))

(declare-fun m!1171857 () Bool)

(assert (=> b!1275699 m!1171857))

(check-sat (not b!1275697) tp_is_empty!33273 (not b!1275699) (not mapNonEmpty!51437) (not start!108000))
(check-sat)
