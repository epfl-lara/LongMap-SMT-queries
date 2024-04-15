; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113048 () Bool)

(assert start!113048)

(declare-fun b_free!31099 () Bool)

(declare-fun b_next!31099 () Bool)

(assert (=> start!113048 (= b_free!31099 (not b_next!31099))))

(declare-fun tp!109103 () Bool)

(declare-fun b_and!50111 () Bool)

(assert (=> start!113048 (= tp!109103 b_and!50111)))

(declare-fun b!1339838 () Bool)

(declare-fun e!763188 () Bool)

(declare-fun tp_is_empty!37099 () Bool)

(assert (=> b!1339838 (= e!763188 tp_is_empty!37099)))

(declare-fun b!1339839 () Bool)

(declare-fun e!763186 () Bool)

(assert (=> b!1339839 (= e!763186 false)))

(declare-datatypes ((V!54569 0))(
  ( (V!54570 (val!18624 Int)) )
))
(declare-fun minValue!1245 () V!54569)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!90999 0))(
  ( (array!91000 (arr!43956 (Array (_ BitVec 32) (_ BitVec 64))) (size!44508 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90999)

(declare-fun zeroValue!1245 () V!54569)

(declare-fun lt!593757 () Bool)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17651 0))(
  ( (ValueCellFull!17651 (v!21271 V!54569)) (EmptyCell!17651) )
))
(declare-datatypes ((array!91001 0))(
  ( (array!91002 (arr!43957 (Array (_ BitVec 32) ValueCell!17651)) (size!44509 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91001)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24030 0))(
  ( (tuple2!24031 (_1!12026 (_ BitVec 64)) (_2!12026 V!54569)) )
))
(declare-datatypes ((List!31181 0))(
  ( (Nil!31178) (Cons!31177 (h!32386 tuple2!24030) (t!45505 List!31181)) )
))
(declare-datatypes ((ListLongMap!21687 0))(
  ( (ListLongMap!21688 (toList!10859 List!31181)) )
))
(declare-fun contains!8964 (ListLongMap!21687 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5712 (array!90999 array!91001 (_ BitVec 32) (_ BitVec 32) V!54569 V!54569 (_ BitVec 32) Int) ListLongMap!21687)

(assert (=> b!1339839 (= lt!593757 (contains!8964 (getCurrentListMap!5712 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1339840 () Bool)

(declare-fun e!763189 () Bool)

(declare-fun mapRes!57355 () Bool)

(assert (=> b!1339840 (= e!763189 (and e!763188 mapRes!57355))))

(declare-fun condMapEmpty!57355 () Bool)

(declare-fun mapDefault!57355 () ValueCell!17651)

(assert (=> b!1339840 (= condMapEmpty!57355 (= (arr!43957 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17651)) mapDefault!57355)))))

(declare-fun mapIsEmpty!57355 () Bool)

(assert (=> mapIsEmpty!57355 mapRes!57355))

(declare-fun b!1339841 () Bool)

(declare-fun res!888814 () Bool)

(assert (=> b!1339841 (=> (not res!888814) (not e!763186))))

(assert (=> b!1339841 (= res!888814 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44508 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1339842 () Bool)

(declare-fun e!763190 () Bool)

(assert (=> b!1339842 (= e!763190 tp_is_empty!37099)))

(declare-fun b!1339843 () Bool)

(declare-fun res!888816 () Bool)

(assert (=> b!1339843 (=> (not res!888816) (not e!763186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90999 (_ BitVec 32)) Bool)

(assert (=> b!1339843 (= res!888816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1339844 () Bool)

(declare-fun res!888815 () Bool)

(assert (=> b!1339844 (=> (not res!888815) (not e!763186))))

(assert (=> b!1339844 (= res!888815 (and (= (size!44509 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44508 _keys!1571) (size!44509 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888813 () Bool)

(assert (=> start!113048 (=> (not res!888813) (not e!763186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113048 (= res!888813 (validMask!0 mask!1977))))

(assert (=> start!113048 e!763186))

(assert (=> start!113048 tp_is_empty!37099))

(assert (=> start!113048 true))

(declare-fun array_inv!33337 (array!90999) Bool)

(assert (=> start!113048 (array_inv!33337 _keys!1571)))

(declare-fun array_inv!33338 (array!91001) Bool)

(assert (=> start!113048 (and (array_inv!33338 _values!1303) e!763189)))

(assert (=> start!113048 tp!109103))

(declare-fun mapNonEmpty!57355 () Bool)

(declare-fun tp!109102 () Bool)

(assert (=> mapNonEmpty!57355 (= mapRes!57355 (and tp!109102 e!763190))))

(declare-fun mapValue!57355 () ValueCell!17651)

(declare-fun mapRest!57355 () (Array (_ BitVec 32) ValueCell!17651))

(declare-fun mapKey!57355 () (_ BitVec 32))

(assert (=> mapNonEmpty!57355 (= (arr!43957 _values!1303) (store mapRest!57355 mapKey!57355 mapValue!57355))))

(declare-fun b!1339845 () Bool)

(declare-fun res!888817 () Bool)

(assert (=> b!1339845 (=> (not res!888817) (not e!763186))))

(declare-datatypes ((List!31182 0))(
  ( (Nil!31179) (Cons!31178 (h!32387 (_ BitVec 64)) (t!45506 List!31182)) )
))
(declare-fun arrayNoDuplicates!0 (array!90999 (_ BitVec 32) List!31182) Bool)

(assert (=> b!1339845 (= res!888817 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31179))))

(assert (= (and start!113048 res!888813) b!1339844))

(assert (= (and b!1339844 res!888815) b!1339843))

(assert (= (and b!1339843 res!888816) b!1339845))

(assert (= (and b!1339845 res!888817) b!1339841))

(assert (= (and b!1339841 res!888814) b!1339839))

(assert (= (and b!1339840 condMapEmpty!57355) mapIsEmpty!57355))

(assert (= (and b!1339840 (not condMapEmpty!57355)) mapNonEmpty!57355))

(get-info :version)

(assert (= (and mapNonEmpty!57355 ((_ is ValueCellFull!17651) mapValue!57355)) b!1339842))

(assert (= (and b!1339840 ((_ is ValueCellFull!17651) mapDefault!57355)) b!1339838))

(assert (= start!113048 b!1339840))

(declare-fun m!1227289 () Bool)

(assert (=> mapNonEmpty!57355 m!1227289))

(declare-fun m!1227291 () Bool)

(assert (=> b!1339845 m!1227291))

(declare-fun m!1227293 () Bool)

(assert (=> start!113048 m!1227293))

(declare-fun m!1227295 () Bool)

(assert (=> start!113048 m!1227295))

(declare-fun m!1227297 () Bool)

(assert (=> start!113048 m!1227297))

(declare-fun m!1227299 () Bool)

(assert (=> b!1339839 m!1227299))

(assert (=> b!1339839 m!1227299))

(declare-fun m!1227301 () Bool)

(assert (=> b!1339839 m!1227301))

(declare-fun m!1227303 () Bool)

(assert (=> b!1339843 m!1227303))

(check-sat tp_is_empty!37099 (not b!1339843) (not b!1339839) (not b_next!31099) (not b!1339845) (not mapNonEmpty!57355) b_and!50111 (not start!113048))
(check-sat b_and!50111 (not b_next!31099))
