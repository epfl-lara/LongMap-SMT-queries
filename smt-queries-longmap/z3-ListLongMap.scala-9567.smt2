; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113488 () Bool)

(assert start!113488)

(declare-fun b_free!31315 () Bool)

(declare-fun b_next!31315 () Bool)

(assert (=> start!113488 (= b_free!31315 (not b_next!31315))))

(declare-fun tp!109749 () Bool)

(declare-fun b_and!50539 () Bool)

(assert (=> start!113488 (= tp!109749 b_and!50539)))

(declare-fun b!1345170 () Bool)

(declare-fun e!765683 () Bool)

(declare-fun tp_is_empty!37315 () Bool)

(assert (=> b!1345170 (= e!765683 tp_is_empty!37315)))

(declare-fun b!1345171 () Bool)

(declare-fun e!765685 () Bool)

(declare-fun mapRes!57679 () Bool)

(assert (=> b!1345171 (= e!765685 (and e!765683 mapRes!57679))))

(declare-fun condMapEmpty!57679 () Bool)

(declare-datatypes ((V!54857 0))(
  ( (V!54858 (val!18732 Int)) )
))
(declare-datatypes ((ValueCell!17759 0))(
  ( (ValueCellFull!17759 (v!21375 V!54857)) (EmptyCell!17759) )
))
(declare-datatypes ((array!91585 0))(
  ( (array!91586 (arr!44244 (Array (_ BitVec 32) ValueCell!17759)) (size!44795 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91585)

(declare-fun mapDefault!57679 () ValueCell!17759)

(assert (=> b!1345171 (= condMapEmpty!57679 (= (arr!44244 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17759)) mapDefault!57679)))))

(declare-fun b!1345172 () Bool)

(declare-fun res!892161 () Bool)

(declare-fun e!765682 () Bool)

(assert (=> b!1345172 (=> (not res!892161) (not e!765682))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91587 0))(
  ( (array!91588 (arr!44245 (Array (_ BitVec 32) (_ BitVec 64))) (size!44796 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91587)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1345172 (= res!892161 (and (= (size!44795 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44796 _keys!1571) (size!44795 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345174 () Bool)

(declare-fun res!892163 () Bool)

(assert (=> b!1345174 (=> (not res!892163) (not e!765682))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91587 (_ BitVec 32)) Bool)

(assert (=> b!1345174 (= res!892163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345175 () Bool)

(declare-fun e!765684 () Bool)

(assert (=> b!1345175 (= e!765684 tp_is_empty!37315)))

(declare-fun b!1345176 () Bool)

(assert (=> b!1345176 (= e!765682 false)))

(declare-fun lt!595598 () Bool)

(declare-fun minValue!1245 () V!54857)

(declare-fun zeroValue!1245 () V!54857)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24182 0))(
  ( (tuple2!24183 (_1!12102 (_ BitVec 64)) (_2!12102 V!54857)) )
))
(declare-datatypes ((List!31326 0))(
  ( (Nil!31323) (Cons!31322 (h!32540 tuple2!24182) (t!45842 List!31326)) )
))
(declare-datatypes ((ListLongMap!21847 0))(
  ( (ListLongMap!21848 (toList!10939 List!31326)) )
))
(declare-fun contains!9127 (ListLongMap!21847 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5883 (array!91587 array!91585 (_ BitVec 32) (_ BitVec 32) V!54857 V!54857 (_ BitVec 32) Int) ListLongMap!21847)

(assert (=> b!1345176 (= lt!595598 (contains!9127 (getCurrentListMap!5883 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun mapIsEmpty!57679 () Bool)

(assert (=> mapIsEmpty!57679 mapRes!57679))

(declare-fun res!892159 () Bool)

(assert (=> start!113488 (=> (not res!892159) (not e!765682))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113488 (= res!892159 (validMask!0 mask!1977))))

(assert (=> start!113488 e!765682))

(assert (=> start!113488 tp_is_empty!37315))

(assert (=> start!113488 true))

(declare-fun array_inv!33617 (array!91587) Bool)

(assert (=> start!113488 (array_inv!33617 _keys!1571)))

(declare-fun array_inv!33618 (array!91585) Bool)

(assert (=> start!113488 (and (array_inv!33618 _values!1303) e!765685)))

(assert (=> start!113488 tp!109749))

(declare-fun b!1345173 () Bool)

(declare-fun res!892160 () Bool)

(assert (=> b!1345173 (=> (not res!892160) (not e!765682))))

(assert (=> b!1345173 (= res!892160 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44796 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345177 () Bool)

(declare-fun res!892162 () Bool)

(assert (=> b!1345177 (=> (not res!892162) (not e!765682))))

(declare-datatypes ((List!31327 0))(
  ( (Nil!31324) (Cons!31323 (h!32541 (_ BitVec 64)) (t!45843 List!31327)) )
))
(declare-fun arrayNoDuplicates!0 (array!91587 (_ BitVec 32) List!31327) Bool)

(assert (=> b!1345177 (= res!892162 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31324))))

(declare-fun mapNonEmpty!57679 () Bool)

(declare-fun tp!109750 () Bool)

(assert (=> mapNonEmpty!57679 (= mapRes!57679 (and tp!109750 e!765684))))

(declare-fun mapKey!57679 () (_ BitVec 32))

(declare-fun mapValue!57679 () ValueCell!17759)

(declare-fun mapRest!57679 () (Array (_ BitVec 32) ValueCell!17759))

(assert (=> mapNonEmpty!57679 (= (arr!44244 _values!1303) (store mapRest!57679 mapKey!57679 mapValue!57679))))

(assert (= (and start!113488 res!892159) b!1345172))

(assert (= (and b!1345172 res!892161) b!1345174))

(assert (= (and b!1345174 res!892163) b!1345177))

(assert (= (and b!1345177 res!892162) b!1345173))

(assert (= (and b!1345173 res!892160) b!1345176))

(assert (= (and b!1345171 condMapEmpty!57679) mapIsEmpty!57679))

(assert (= (and b!1345171 (not condMapEmpty!57679)) mapNonEmpty!57679))

(get-info :version)

(assert (= (and mapNonEmpty!57679 ((_ is ValueCellFull!17759) mapValue!57679)) b!1345175))

(assert (= (and b!1345171 ((_ is ValueCellFull!17759) mapDefault!57679)) b!1345170))

(assert (= start!113488 b!1345171))

(declare-fun m!1233261 () Bool)

(assert (=> mapNonEmpty!57679 m!1233261))

(declare-fun m!1233263 () Bool)

(assert (=> b!1345177 m!1233263))

(declare-fun m!1233265 () Bool)

(assert (=> b!1345176 m!1233265))

(assert (=> b!1345176 m!1233265))

(declare-fun m!1233267 () Bool)

(assert (=> b!1345176 m!1233267))

(declare-fun m!1233269 () Bool)

(assert (=> b!1345174 m!1233269))

(declare-fun m!1233271 () Bool)

(assert (=> start!113488 m!1233271))

(declare-fun m!1233273 () Bool)

(assert (=> start!113488 m!1233273))

(declare-fun m!1233275 () Bool)

(assert (=> start!113488 m!1233275))

(check-sat (not b_next!31315) (not mapNonEmpty!57679) b_and!50539 (not b!1345177) (not b!1345176) (not start!113488) tp_is_empty!37315 (not b!1345174))
(check-sat b_and!50539 (not b_next!31315))
