; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113266 () Bool)

(assert start!113266)

(declare-fun b_free!31317 () Bool)

(declare-fun b_next!31317 () Bool)

(assert (=> start!113266 (= b_free!31317 (not b_next!31317))))

(declare-fun tp!109755 () Bool)

(declare-fun b_and!50539 () Bool)

(assert (=> start!113266 (= tp!109755 b_and!50539)))

(declare-fun b!1343895 () Bool)

(declare-fun res!891657 () Bool)

(declare-fun e!764855 () Bool)

(assert (=> b!1343895 (=> (not res!891657) (not e!764855))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91478 0))(
  ( (array!91479 (arr!44195 (Array (_ BitVec 32) (_ BitVec 64))) (size!44745 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91478)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54859 0))(
  ( (V!54860 (val!18733 Int)) )
))
(declare-datatypes ((ValueCell!17760 0))(
  ( (ValueCellFull!17760 (v!21381 V!54859)) (EmptyCell!17760) )
))
(declare-datatypes ((array!91480 0))(
  ( (array!91481 (arr!44196 (Array (_ BitVec 32) ValueCell!17760)) (size!44746 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91480)

(assert (=> b!1343895 (= res!891657 (and (= (size!44746 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44745 _keys!1571) (size!44746 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!57682 () Bool)

(declare-fun mapRes!57682 () Bool)

(assert (=> mapIsEmpty!57682 mapRes!57682))

(declare-fun b!1343896 () Bool)

(assert (=> b!1343896 (= e!764855 false)))

(declare-fun minValue!1245 () V!54859)

(declare-fun lt!595125 () Bool)

(declare-fun zeroValue!1245 () V!54859)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24136 0))(
  ( (tuple2!24137 (_1!12079 (_ BitVec 64)) (_2!12079 V!54859)) )
))
(declare-datatypes ((List!31292 0))(
  ( (Nil!31289) (Cons!31288 (h!32497 tuple2!24136) (t!45816 List!31292)) )
))
(declare-datatypes ((ListLongMap!21793 0))(
  ( (ListLongMap!21794 (toList!10912 List!31292)) )
))
(declare-fun contains!9088 (ListLongMap!21793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5868 (array!91478 array!91480 (_ BitVec 32) (_ BitVec 32) V!54859 V!54859 (_ BitVec 32) Int) ListLongMap!21793)

(assert (=> b!1343896 (= lt!595125 (contains!9088 (getCurrentListMap!5868 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343897 () Bool)

(declare-fun e!764857 () Bool)

(declare-fun tp_is_empty!37317 () Bool)

(assert (=> b!1343897 (= e!764857 tp_is_empty!37317)))

(declare-fun b!1343898 () Bool)

(declare-fun e!764854 () Bool)

(assert (=> b!1343898 (= e!764854 tp_is_empty!37317)))

(declare-fun res!891658 () Bool)

(assert (=> start!113266 (=> (not res!891658) (not e!764855))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113266 (= res!891658 (validMask!0 mask!1977))))

(assert (=> start!113266 e!764855))

(assert (=> start!113266 tp_is_empty!37317))

(assert (=> start!113266 true))

(declare-fun array_inv!33309 (array!91478) Bool)

(assert (=> start!113266 (array_inv!33309 _keys!1571)))

(declare-fun e!764858 () Bool)

(declare-fun array_inv!33310 (array!91480) Bool)

(assert (=> start!113266 (and (array_inv!33310 _values!1303) e!764858)))

(assert (=> start!113266 tp!109755))

(declare-fun mapNonEmpty!57682 () Bool)

(declare-fun tp!109756 () Bool)

(assert (=> mapNonEmpty!57682 (= mapRes!57682 (and tp!109756 e!764857))))

(declare-fun mapKey!57682 () (_ BitVec 32))

(declare-fun mapRest!57682 () (Array (_ BitVec 32) ValueCell!17760))

(declare-fun mapValue!57682 () ValueCell!17760)

(assert (=> mapNonEmpty!57682 (= (arr!44196 _values!1303) (store mapRest!57682 mapKey!57682 mapValue!57682))))

(declare-fun b!1343899 () Bool)

(declare-fun res!891656 () Bool)

(assert (=> b!1343899 (=> (not res!891656) (not e!764855))))

(declare-datatypes ((List!31293 0))(
  ( (Nil!31290) (Cons!31289 (h!32498 (_ BitVec 64)) (t!45817 List!31293)) )
))
(declare-fun arrayNoDuplicates!0 (array!91478 (_ BitVec 32) List!31293) Bool)

(assert (=> b!1343899 (= res!891656 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31290))))

(declare-fun b!1343900 () Bool)

(declare-fun res!891660 () Bool)

(assert (=> b!1343900 (=> (not res!891660) (not e!764855))))

(assert (=> b!1343900 (= res!891660 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44745 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343901 () Bool)

(declare-fun res!891659 () Bool)

(assert (=> b!1343901 (=> (not res!891659) (not e!764855))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91478 (_ BitVec 32)) Bool)

(assert (=> b!1343901 (= res!891659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343902 () Bool)

(assert (=> b!1343902 (= e!764858 (and e!764854 mapRes!57682))))

(declare-fun condMapEmpty!57682 () Bool)

(declare-fun mapDefault!57682 () ValueCell!17760)

(assert (=> b!1343902 (= condMapEmpty!57682 (= (arr!44196 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17760)) mapDefault!57682)))))

(assert (= (and start!113266 res!891658) b!1343895))

(assert (= (and b!1343895 res!891657) b!1343901))

(assert (= (and b!1343901 res!891659) b!1343899))

(assert (= (and b!1343899 res!891656) b!1343900))

(assert (= (and b!1343900 res!891660) b!1343896))

(assert (= (and b!1343902 condMapEmpty!57682) mapIsEmpty!57682))

(assert (= (and b!1343902 (not condMapEmpty!57682)) mapNonEmpty!57682))

(get-info :version)

(assert (= (and mapNonEmpty!57682 ((_ is ValueCellFull!17760) mapValue!57682)) b!1343897))

(assert (= (and b!1343902 ((_ is ValueCellFull!17760) mapDefault!57682)) b!1343898))

(assert (= start!113266 b!1343902))

(declare-fun m!1231679 () Bool)

(assert (=> b!1343896 m!1231679))

(assert (=> b!1343896 m!1231679))

(declare-fun m!1231681 () Bool)

(assert (=> b!1343896 m!1231681))

(declare-fun m!1231683 () Bool)

(assert (=> b!1343901 m!1231683))

(declare-fun m!1231685 () Bool)

(assert (=> start!113266 m!1231685))

(declare-fun m!1231687 () Bool)

(assert (=> start!113266 m!1231687))

(declare-fun m!1231689 () Bool)

(assert (=> start!113266 m!1231689))

(declare-fun m!1231691 () Bool)

(assert (=> mapNonEmpty!57682 m!1231691))

(declare-fun m!1231693 () Bool)

(assert (=> b!1343899 m!1231693))

(check-sat (not start!113266) (not b_next!31317) tp_is_empty!37317 b_and!50539 (not b!1343899) (not mapNonEmpty!57682) (not b!1343901) (not b!1343896))
(check-sat b_and!50539 (not b_next!31317))
