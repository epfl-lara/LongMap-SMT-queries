; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84538 () Bool)

(assert start!84538)

(declare-fun b_free!19957 () Bool)

(declare-fun b_next!19957 () Bool)

(assert (=> start!84538 (= b_free!19957 (not b_next!19957))))

(declare-fun tp!69646 () Bool)

(declare-fun b_and!32001 () Bool)

(assert (=> start!84538 (= tp!69646 b_and!32001)))

(declare-fun b!987768 () Bool)

(declare-fun res!660568 () Bool)

(declare-fun e!557090 () Bool)

(assert (=> b!987768 (=> (not res!660568) (not e!557090))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987768 (= res!660568 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987769 () Bool)

(declare-fun res!660571 () Bool)

(assert (=> b!987769 (=> (not res!660571) (not e!557090))))

(declare-datatypes ((array!62348 0))(
  ( (array!62349 (arr!30027 (Array (_ BitVec 32) (_ BitVec 64))) (size!30507 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62348)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987769 (= res!660571 (validKeyInArray!0 (select (arr!30027 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36788 () Bool)

(declare-fun mapRes!36788 () Bool)

(declare-fun tp!69647 () Bool)

(declare-fun e!557094 () Bool)

(assert (=> mapNonEmpty!36788 (= mapRes!36788 (and tp!69647 e!557094))))

(declare-datatypes ((V!35881 0))(
  ( (V!35882 (val!11637 Int)) )
))
(declare-datatypes ((ValueCell!11105 0))(
  ( (ValueCellFull!11105 (v!14196 V!35881)) (EmptyCell!11105) )
))
(declare-fun mapRest!36788 () (Array (_ BitVec 32) ValueCell!11105))

(declare-datatypes ((array!62350 0))(
  ( (array!62351 (arr!30028 (Array (_ BitVec 32) ValueCell!11105)) (size!30508 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62350)

(declare-fun mapKey!36788 () (_ BitVec 32))

(declare-fun mapValue!36788 () ValueCell!11105)

(assert (=> mapNonEmpty!36788 (= (arr!30028 _values!1278) (store mapRest!36788 mapKey!36788 mapValue!36788))))

(declare-fun b!987771 () Bool)

(declare-fun tp_is_empty!23173 () Bool)

(assert (=> b!987771 (= e!557094 tp_is_empty!23173)))

(declare-fun b!987772 () Bool)

(declare-fun res!660566 () Bool)

(assert (=> b!987772 (=> (not res!660566) (not e!557090))))

(declare-fun mask!1948 () (_ BitVec 32))

(assert (=> b!987772 (= res!660566 (and (= (size!30508 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30507 _keys!1544) (size!30508 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987773 () Bool)

(declare-fun res!660567 () Bool)

(assert (=> b!987773 (=> (not res!660567) (not e!557090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62348 (_ BitVec 32)) Bool)

(assert (=> b!987773 (= res!660567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36788 () Bool)

(assert (=> mapIsEmpty!36788 mapRes!36788))

(declare-fun b!987774 () Bool)

(assert (=> b!987774 (= e!557090 false)))

(declare-fun minValue!1220 () V!35881)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14844 0))(
  ( (tuple2!14845 (_1!7433 (_ BitVec 64)) (_2!7433 V!35881)) )
))
(declare-datatypes ((List!20751 0))(
  ( (Nil!20748) (Cons!20747 (h!21915 tuple2!14844) (t!29642 List!20751)) )
))
(declare-datatypes ((ListLongMap!13543 0))(
  ( (ListLongMap!13544 (toList!6787 List!20751)) )
))
(declare-fun lt!437916 () ListLongMap!13543)

(declare-fun zeroValue!1220 () V!35881)

(declare-fun +!3086 (ListLongMap!13543 tuple2!14844) ListLongMap!13543)

(declare-fun getCurrentListMapNoExtraKeys!3516 (array!62348 array!62350 (_ BitVec 32) (_ BitVec 32) V!35881 V!35881 (_ BitVec 32) Int) ListLongMap!13543)

(assert (=> b!987774 (= lt!437916 (+!3086 (getCurrentListMapNoExtraKeys!3516 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14845 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987775 () Bool)

(declare-fun e!557091 () Bool)

(assert (=> b!987775 (= e!557091 tp_is_empty!23173)))

(declare-fun b!987776 () Bool)

(declare-fun res!660565 () Bool)

(assert (=> b!987776 (=> (not res!660565) (not e!557090))))

(assert (=> b!987776 (= res!660565 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30507 _keys!1544))))))

(declare-fun b!987777 () Bool)

(declare-fun e!557092 () Bool)

(assert (=> b!987777 (= e!557092 (and e!557091 mapRes!36788))))

(declare-fun condMapEmpty!36788 () Bool)

(declare-fun mapDefault!36788 () ValueCell!11105)

(assert (=> b!987777 (= condMapEmpty!36788 (= (arr!30028 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11105)) mapDefault!36788)))))

(declare-fun res!660570 () Bool)

(assert (=> start!84538 (=> (not res!660570) (not e!557090))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84538 (= res!660570 (validMask!0 mask!1948))))

(assert (=> start!84538 e!557090))

(assert (=> start!84538 true))

(assert (=> start!84538 tp_is_empty!23173))

(declare-fun array_inv!23221 (array!62350) Bool)

(assert (=> start!84538 (and (array_inv!23221 _values!1278) e!557092)))

(assert (=> start!84538 tp!69646))

(declare-fun array_inv!23222 (array!62348) Bool)

(assert (=> start!84538 (array_inv!23222 _keys!1544)))

(declare-fun b!987770 () Bool)

(declare-fun res!660569 () Bool)

(assert (=> b!987770 (=> (not res!660569) (not e!557090))))

(declare-datatypes ((List!20752 0))(
  ( (Nil!20749) (Cons!20748 (h!21916 (_ BitVec 64)) (t!29643 List!20752)) )
))
(declare-fun arrayNoDuplicates!0 (array!62348 (_ BitVec 32) List!20752) Bool)

(assert (=> b!987770 (= res!660569 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20749))))

(assert (= (and start!84538 res!660570) b!987772))

(assert (= (and b!987772 res!660566) b!987773))

(assert (= (and b!987773 res!660567) b!987770))

(assert (= (and b!987770 res!660569) b!987776))

(assert (= (and b!987776 res!660565) b!987769))

(assert (= (and b!987769 res!660571) b!987768))

(assert (= (and b!987768 res!660568) b!987774))

(assert (= (and b!987777 condMapEmpty!36788) mapIsEmpty!36788))

(assert (= (and b!987777 (not condMapEmpty!36788)) mapNonEmpty!36788))

(get-info :version)

(assert (= (and mapNonEmpty!36788 ((_ is ValueCellFull!11105) mapValue!36788)) b!987771))

(assert (= (and b!987777 ((_ is ValueCellFull!11105) mapDefault!36788)) b!987775))

(assert (= start!84538 b!987777))

(declare-fun m!914837 () Bool)

(assert (=> b!987774 m!914837))

(assert (=> b!987774 m!914837))

(declare-fun m!914839 () Bool)

(assert (=> b!987774 m!914839))

(declare-fun m!914841 () Bool)

(assert (=> b!987770 m!914841))

(declare-fun m!914843 () Bool)

(assert (=> start!84538 m!914843))

(declare-fun m!914845 () Bool)

(assert (=> start!84538 m!914845))

(declare-fun m!914847 () Bool)

(assert (=> start!84538 m!914847))

(declare-fun m!914849 () Bool)

(assert (=> b!987769 m!914849))

(assert (=> b!987769 m!914849))

(declare-fun m!914851 () Bool)

(assert (=> b!987769 m!914851))

(declare-fun m!914853 () Bool)

(assert (=> b!987773 m!914853))

(declare-fun m!914855 () Bool)

(assert (=> mapNonEmpty!36788 m!914855))

(check-sat (not start!84538) b_and!32001 (not b_next!19957) tp_is_empty!23173 (not b!987774) (not mapNonEmpty!36788) (not b!987770) (not b!987769) (not b!987773))
(check-sat b_and!32001 (not b_next!19957))
