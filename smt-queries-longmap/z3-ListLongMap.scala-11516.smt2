; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134482 () Bool)

(assert start!134482)

(declare-fun b_free!32197 () Bool)

(declare-fun b_next!32197 () Bool)

(assert (=> start!134482 (= b_free!32197 (not b_next!32197))))

(declare-fun tp!113909 () Bool)

(declare-fun b_and!51843 () Bool)

(assert (=> start!134482 (= tp!113909 b_and!51843)))

(declare-fun b!1569349 () Bool)

(declare-fun e!874933 () Bool)

(assert (=> b!1569349 (= e!874933 false)))

(declare-fun lt!673735 () Bool)

(declare-datatypes ((V!60177 0))(
  ( (V!60178 (val!19572 Int)) )
))
(declare-datatypes ((tuple2!25310 0))(
  ( (tuple2!25311 (_1!12666 (_ BitVec 64)) (_2!12666 V!60177)) )
))
(declare-datatypes ((List!36673 0))(
  ( (Nil!36670) (Cons!36669 (h!38134 tuple2!25310) (t!51569 List!36673)) )
))
(declare-datatypes ((ListLongMap!22753 0))(
  ( (ListLongMap!22754 (toList!11392 List!36673)) )
))
(declare-fun lt!673734 () ListLongMap!22753)

(declare-fun contains!10397 (ListLongMap!22753 (_ BitVec 64)) Bool)

(assert (=> b!1569349 (= lt!673735 (contains!10397 lt!673734 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1569350 () Bool)

(declare-fun e!874936 () Bool)

(declare-fun tp_is_empty!38977 () Bool)

(assert (=> b!1569350 (= e!874936 tp_is_empty!38977)))

(declare-fun b!1569351 () Bool)

(declare-fun e!874935 () Bool)

(assert (=> b!1569351 (= e!874935 e!874933)))

(declare-fun res!1071774 () Bool)

(assert (=> b!1569351 (=> (not res!1071774) (not e!874933))))

(assert (=> b!1569351 (= res!1071774 (not (contains!10397 lt!673734 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!60177)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104766 0))(
  ( (array!104767 (arr!50561 (Array (_ BitVec 32) (_ BitVec 64))) (size!51112 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104766)

(declare-datatypes ((ValueCell!18458 0))(
  ( (ValueCellFull!18458 (v!22323 V!60177)) (EmptyCell!18458) )
))
(declare-datatypes ((array!104768 0))(
  ( (array!104769 (arr!50562 (Array (_ BitVec 32) ValueCell!18458)) (size!51113 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104768)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun minValue!453 () V!60177)

(declare-fun getCurrentListMapNoExtraKeys!6772 (array!104766 array!104768 (_ BitVec 32) (_ BitVec 32) V!60177 V!60177 (_ BitVec 32) Int) ListLongMap!22753)

(assert (=> b!1569351 (= lt!673734 (getCurrentListMapNoExtraKeys!6772 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun mapNonEmpty!59865 () Bool)

(declare-fun mapRes!59865 () Bool)

(declare-fun tp!113910 () Bool)

(declare-fun e!874931 () Bool)

(assert (=> mapNonEmpty!59865 (= mapRes!59865 (and tp!113910 e!874931))))

(declare-fun mapRest!59865 () (Array (_ BitVec 32) ValueCell!18458))

(declare-fun mapKey!59865 () (_ BitVec 32))

(declare-fun mapValue!59865 () ValueCell!18458)

(assert (=> mapNonEmpty!59865 (= (arr!50562 _values!487) (store mapRest!59865 mapKey!59865 mapValue!59865))))

(declare-fun b!1569352 () Bool)

(declare-fun res!1071777 () Bool)

(assert (=> b!1569352 (=> (not res!1071777) (not e!874935))))

(assert (=> b!1569352 (= res!1071777 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!51112 _keys!637)) (bvslt from!782 (size!51112 _keys!637))))))

(declare-fun mapIsEmpty!59865 () Bool)

(assert (=> mapIsEmpty!59865 mapRes!59865))

(declare-fun b!1569353 () Bool)

(declare-fun res!1071778 () Bool)

(assert (=> b!1569353 (=> (not res!1071778) (not e!874935))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104766 (_ BitVec 32)) Bool)

(assert (=> b!1569353 (= res!1071778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1569354 () Bool)

(declare-fun res!1071775 () Bool)

(assert (=> b!1569354 (=> (not res!1071775) (not e!874935))))

(declare-datatypes ((List!36674 0))(
  ( (Nil!36671) (Cons!36670 (h!38135 (_ BitVec 64)) (t!51570 List!36674)) )
))
(declare-fun arrayNoDuplicates!0 (array!104766 (_ BitVec 32) List!36674) Bool)

(assert (=> b!1569354 (= res!1071775 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36671))))

(declare-fun b!1569355 () Bool)

(declare-fun res!1071780 () Bool)

(assert (=> b!1569355 (=> (not res!1071780) (not e!874935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1569355 (= res!1071780 (not (validKeyInArray!0 (select (arr!50561 _keys!637) from!782))))))

(declare-fun res!1071776 () Bool)

(assert (=> start!134482 (=> (not res!1071776) (not e!874935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134482 (= res!1071776 (validMask!0 mask!947))))

(assert (=> start!134482 e!874935))

(assert (=> start!134482 tp!113909))

(assert (=> start!134482 tp_is_empty!38977))

(assert (=> start!134482 true))

(declare-fun array_inv!39523 (array!104766) Bool)

(assert (=> start!134482 (array_inv!39523 _keys!637)))

(declare-fun e!874934 () Bool)

(declare-fun array_inv!39524 (array!104768) Bool)

(assert (=> start!134482 (and (array_inv!39524 _values!487) e!874934)))

(declare-fun b!1569356 () Bool)

(assert (=> b!1569356 (= e!874931 tp_is_empty!38977)))

(declare-fun b!1569357 () Bool)

(declare-fun res!1071779 () Bool)

(assert (=> b!1569357 (=> (not res!1071779) (not e!874935))))

(assert (=> b!1569357 (= res!1071779 (and (= (size!51113 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!51112 _keys!637) (size!51113 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1569358 () Bool)

(assert (=> b!1569358 (= e!874934 (and e!874936 mapRes!59865))))

(declare-fun condMapEmpty!59865 () Bool)

(declare-fun mapDefault!59865 () ValueCell!18458)

(assert (=> b!1569358 (= condMapEmpty!59865 (= (arr!50562 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18458)) mapDefault!59865)))))

(assert (= (and start!134482 res!1071776) b!1569357))

(assert (= (and b!1569357 res!1071779) b!1569353))

(assert (= (and b!1569353 res!1071778) b!1569354))

(assert (= (and b!1569354 res!1071775) b!1569352))

(assert (= (and b!1569352 res!1071777) b!1569355))

(assert (= (and b!1569355 res!1071780) b!1569351))

(assert (= (and b!1569351 res!1071774) b!1569349))

(assert (= (and b!1569358 condMapEmpty!59865) mapIsEmpty!59865))

(assert (= (and b!1569358 (not condMapEmpty!59865)) mapNonEmpty!59865))

(get-info :version)

(assert (= (and mapNonEmpty!59865 ((_ is ValueCellFull!18458) mapValue!59865)) b!1569356))

(assert (= (and b!1569358 ((_ is ValueCellFull!18458) mapDefault!59865)) b!1569350))

(assert (= start!134482 b!1569358))

(declare-fun m!1444171 () Bool)

(assert (=> b!1569351 m!1444171))

(declare-fun m!1444173 () Bool)

(assert (=> b!1569351 m!1444173))

(declare-fun m!1444175 () Bool)

(assert (=> b!1569354 m!1444175))

(declare-fun m!1444177 () Bool)

(assert (=> start!134482 m!1444177))

(declare-fun m!1444179 () Bool)

(assert (=> start!134482 m!1444179))

(declare-fun m!1444181 () Bool)

(assert (=> start!134482 m!1444181))

(declare-fun m!1444183 () Bool)

(assert (=> mapNonEmpty!59865 m!1444183))

(declare-fun m!1444185 () Bool)

(assert (=> b!1569355 m!1444185))

(assert (=> b!1569355 m!1444185))

(declare-fun m!1444187 () Bool)

(assert (=> b!1569355 m!1444187))

(declare-fun m!1444189 () Bool)

(assert (=> b!1569349 m!1444189))

(declare-fun m!1444191 () Bool)

(assert (=> b!1569353 m!1444191))

(check-sat (not mapNonEmpty!59865) (not b_next!32197) b_and!51843 (not b!1569353) (not b!1569351) (not b!1569355) (not b!1569354) (not start!134482) (not b!1569349) tp_is_empty!38977)
(check-sat b_and!51843 (not b_next!32197))
