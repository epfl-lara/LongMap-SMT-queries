; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113126 () Bool)

(assert start!113126)

(declare-fun b_free!31177 () Bool)

(declare-fun b_next!31177 () Bool)

(assert (=> start!113126 (= b_free!31177 (not b_next!31177))))

(declare-fun tp!109336 () Bool)

(declare-fun b_and!50243 () Bool)

(assert (=> start!113126 (= tp!109336 b_and!50243)))

(declare-fun b!1341187 () Bool)

(declare-fun res!889757 () Bool)

(declare-fun e!763771 () Bool)

(assert (=> b!1341187 (=> (not res!889757) (not e!763771))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1341187 (= res!889757 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1341188 () Bool)

(assert (=> b!1341188 (= e!763771 (not true))))

(declare-datatypes ((V!54673 0))(
  ( (V!54674 (val!18663 Int)) )
))
(declare-datatypes ((tuple2!24082 0))(
  ( (tuple2!24083 (_1!12052 (_ BitVec 64)) (_2!12052 V!54673)) )
))
(declare-datatypes ((List!31233 0))(
  ( (Nil!31230) (Cons!31229 (h!32438 tuple2!24082) (t!45613 List!31233)) )
))
(declare-datatypes ((ListLongMap!21739 0))(
  ( (ListLongMap!21740 (toList!10885 List!31233)) )
))
(declare-fun lt!593930 () ListLongMap!21739)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!8990 (ListLongMap!21739 (_ BitVec 64)) Bool)

(assert (=> b!1341188 (contains!8990 lt!593930 k0!1142)))

(declare-fun zeroValue!1245 () V!54673)

(declare-datatypes ((Unit!43826 0))(
  ( (Unit!43827) )
))
(declare-fun lt!593931 () Unit!43826)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!331 ((_ BitVec 64) (_ BitVec 64) V!54673 ListLongMap!21739) Unit!43826)

(assert (=> b!1341188 (= lt!593931 (lemmaInListMapAfterAddingDiffThenInBefore!331 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!593930))))

(declare-fun minValue!1245 () V!54673)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((array!91147 0))(
  ( (array!91148 (arr!44030 (Array (_ BitVec 32) (_ BitVec 64))) (size!44582 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91147)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17690 0))(
  ( (ValueCellFull!17690 (v!21310 V!54673)) (EmptyCell!17690) )
))
(declare-datatypes ((array!91149 0))(
  ( (array!91150 (arr!44031 (Array (_ BitVec 32) ValueCell!17690)) (size!44583 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91149)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun +!4792 (ListLongMap!21739 tuple2!24082) ListLongMap!21739)

(declare-fun getCurrentListMapNoExtraKeys!6435 (array!91147 array!91149 (_ BitVec 32) (_ BitVec 32) V!54673 V!54673 (_ BitVec 32) Int) ListLongMap!21739)

(declare-fun get!22224 (ValueCell!17690 V!54673) V!54673)

(declare-fun dynLambda!3722 (Int (_ BitVec 64)) V!54673)

(assert (=> b!1341188 (= lt!593930 (+!4792 (getCurrentListMapNoExtraKeys!6435 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24083 (select (arr!44030 _keys!1571) from!1960) (get!22224 (select (arr!44031 _values!1303) from!1960) (dynLambda!3722 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1341189 () Bool)

(declare-fun res!889761 () Bool)

(assert (=> b!1341189 (=> (not res!889761) (not e!763771))))

(assert (=> b!1341189 (= res!889761 (and (= (size!44583 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44582 _keys!1571) (size!44583 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1341190 () Bool)

(declare-fun res!889760 () Bool)

(assert (=> b!1341190 (=> (not res!889760) (not e!763771))))

(assert (=> b!1341190 (= res!889760 (not (= (select (arr!44030 _keys!1571) from!1960) k0!1142)))))

(declare-fun mapNonEmpty!57472 () Bool)

(declare-fun mapRes!57472 () Bool)

(declare-fun tp!109337 () Bool)

(declare-fun e!763772 () Bool)

(assert (=> mapNonEmpty!57472 (= mapRes!57472 (and tp!109337 e!763772))))

(declare-fun mapKey!57472 () (_ BitVec 32))

(declare-fun mapValue!57472 () ValueCell!17690)

(declare-fun mapRest!57472 () (Array (_ BitVec 32) ValueCell!17690))

(assert (=> mapNonEmpty!57472 (= (arr!44031 _values!1303) (store mapRest!57472 mapKey!57472 mapValue!57472))))

(declare-fun b!1341191 () Bool)

(declare-fun e!763774 () Bool)

(declare-fun e!763773 () Bool)

(assert (=> b!1341191 (= e!763774 (and e!763773 mapRes!57472))))

(declare-fun condMapEmpty!57472 () Bool)

(declare-fun mapDefault!57472 () ValueCell!17690)

(assert (=> b!1341191 (= condMapEmpty!57472 (= (arr!44031 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17690)) mapDefault!57472)))))

(declare-fun res!889762 () Bool)

(assert (=> start!113126 (=> (not res!889762) (not e!763771))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113126 (= res!889762 (validMask!0 mask!1977))))

(assert (=> start!113126 e!763771))

(declare-fun tp_is_empty!37177 () Bool)

(assert (=> start!113126 tp_is_empty!37177))

(assert (=> start!113126 true))

(declare-fun array_inv!33383 (array!91147) Bool)

(assert (=> start!113126 (array_inv!33383 _keys!1571)))

(declare-fun array_inv!33384 (array!91149) Bool)

(assert (=> start!113126 (and (array_inv!33384 _values!1303) e!763774)))

(assert (=> start!113126 tp!109336))

(declare-fun b!1341192 () Bool)

(declare-fun res!889765 () Bool)

(assert (=> b!1341192 (=> (not res!889765) (not e!763771))))

(declare-datatypes ((List!31234 0))(
  ( (Nil!31231) (Cons!31230 (h!32439 (_ BitVec 64)) (t!45614 List!31234)) )
))
(declare-fun arrayNoDuplicates!0 (array!91147 (_ BitVec 32) List!31234) Bool)

(assert (=> b!1341192 (= res!889765 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31231))))

(declare-fun b!1341193 () Bool)

(assert (=> b!1341193 (= e!763773 tp_is_empty!37177)))

(declare-fun b!1341194 () Bool)

(declare-fun res!889758 () Bool)

(assert (=> b!1341194 (=> (not res!889758) (not e!763771))))

(assert (=> b!1341194 (= res!889758 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44582 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1341195 () Bool)

(declare-fun res!889763 () Bool)

(assert (=> b!1341195 (=> (not res!889763) (not e!763771))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1341195 (= res!889763 (validKeyInArray!0 (select (arr!44030 _keys!1571) from!1960)))))

(declare-fun mapIsEmpty!57472 () Bool)

(assert (=> mapIsEmpty!57472 mapRes!57472))

(declare-fun b!1341196 () Bool)

(assert (=> b!1341196 (= e!763772 tp_is_empty!37177)))

(declare-fun b!1341197 () Bool)

(declare-fun res!889764 () Bool)

(assert (=> b!1341197 (=> (not res!889764) (not e!763771))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91147 (_ BitVec 32)) Bool)

(assert (=> b!1341197 (= res!889764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1341198 () Bool)

(declare-fun res!889759 () Bool)

(assert (=> b!1341198 (=> (not res!889759) (not e!763771))))

(declare-fun getCurrentListMap!5738 (array!91147 array!91149 (_ BitVec 32) (_ BitVec 32) V!54673 V!54673 (_ BitVec 32) Int) ListLongMap!21739)

(assert (=> b!1341198 (= res!889759 (contains!8990 (getCurrentListMap!5738 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(assert (= (and start!113126 res!889762) b!1341189))

(assert (= (and b!1341189 res!889761) b!1341197))

(assert (= (and b!1341197 res!889764) b!1341192))

(assert (= (and b!1341192 res!889765) b!1341194))

(assert (= (and b!1341194 res!889758) b!1341198))

(assert (= (and b!1341198 res!889759) b!1341190))

(assert (= (and b!1341190 res!889760) b!1341195))

(assert (= (and b!1341195 res!889763) b!1341187))

(assert (= (and b!1341187 res!889757) b!1341188))

(assert (= (and b!1341191 condMapEmpty!57472) mapIsEmpty!57472))

(assert (= (and b!1341191 (not condMapEmpty!57472)) mapNonEmpty!57472))

(get-info :version)

(assert (= (and mapNonEmpty!57472 ((_ is ValueCellFull!17690) mapValue!57472)) b!1341196))

(assert (= (and b!1341191 ((_ is ValueCellFull!17690) mapDefault!57472)) b!1341193))

(assert (= start!113126 b!1341191))

(declare-fun b_lambda!24343 () Bool)

(assert (=> (not b_lambda!24343) (not b!1341188)))

(declare-fun t!45612 () Bool)

(declare-fun tb!12183 () Bool)

(assert (=> (and start!113126 (= defaultEntry!1306 defaultEntry!1306) t!45612) tb!12183))

(declare-fun result!25465 () Bool)

(assert (=> tb!12183 (= result!25465 tp_is_empty!37177)))

(assert (=> b!1341188 t!45612))

(declare-fun b_and!50245 () Bool)

(assert (= b_and!50243 (and (=> t!45612 result!25465) b_and!50245)))

(declare-fun m!1228411 () Bool)

(assert (=> b!1341188 m!1228411))

(declare-fun m!1228413 () Bool)

(assert (=> b!1341188 m!1228413))

(declare-fun m!1228415 () Bool)

(assert (=> b!1341188 m!1228415))

(declare-fun m!1228417 () Bool)

(assert (=> b!1341188 m!1228417))

(assert (=> b!1341188 m!1228411))

(declare-fun m!1228419 () Bool)

(assert (=> b!1341188 m!1228419))

(assert (=> b!1341188 m!1228413))

(declare-fun m!1228421 () Bool)

(assert (=> b!1341188 m!1228421))

(declare-fun m!1228423 () Bool)

(assert (=> b!1341188 m!1228423))

(assert (=> b!1341188 m!1228415))

(declare-fun m!1228425 () Bool)

(assert (=> b!1341188 m!1228425))

(declare-fun m!1228427 () Bool)

(assert (=> start!113126 m!1228427))

(declare-fun m!1228429 () Bool)

(assert (=> start!113126 m!1228429))

(declare-fun m!1228431 () Bool)

(assert (=> start!113126 m!1228431))

(declare-fun m!1228433 () Bool)

(assert (=> mapNonEmpty!57472 m!1228433))

(declare-fun m!1228435 () Bool)

(assert (=> b!1341198 m!1228435))

(assert (=> b!1341198 m!1228435))

(declare-fun m!1228437 () Bool)

(assert (=> b!1341198 m!1228437))

(assert (=> b!1341190 m!1228423))

(assert (=> b!1341195 m!1228423))

(assert (=> b!1341195 m!1228423))

(declare-fun m!1228439 () Bool)

(assert (=> b!1341195 m!1228439))

(declare-fun m!1228441 () Bool)

(assert (=> b!1341197 m!1228441))

(declare-fun m!1228443 () Bool)

(assert (=> b!1341192 m!1228443))

(check-sat (not mapNonEmpty!57472) (not b_next!31177) (not b_lambda!24343) (not b!1341188) tp_is_empty!37177 (not start!113126) (not b!1341198) (not b!1341197) b_and!50245 (not b!1341192) (not b!1341195))
(check-sat b_and!50245 (not b_next!31177))
