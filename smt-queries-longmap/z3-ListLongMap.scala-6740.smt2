; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84616 () Bool)

(assert start!84616)

(declare-fun b_free!19999 () Bool)

(declare-fun b_next!19999 () Bool)

(assert (=> start!84616 (= b_free!19999 (not b_next!19999))))

(declare-fun tp!69778 () Bool)

(declare-fun b_and!32075 () Bool)

(assert (=> start!84616 (= tp!69778 b_and!32075)))

(declare-fun b!988604 () Bool)

(declare-fun res!661095 () Bool)

(declare-fun e!557530 () Bool)

(assert (=> b!988604 (=> (not res!661095) (not e!557530))))

(declare-datatypes ((array!62434 0))(
  ( (array!62435 (arr!30068 (Array (_ BitVec 32) (_ BitVec 64))) (size!30548 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62434)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!988604 (= res!661095 (validKeyInArray!0 (select (arr!30068 _keys!1544) from!1932)))))

(declare-fun b!988605 () Bool)

(declare-fun e!557528 () Bool)

(declare-fun tp_is_empty!23215 () Bool)

(assert (=> b!988605 (= e!557528 tp_is_empty!23215)))

(declare-fun mapNonEmpty!36857 () Bool)

(declare-fun mapRes!36857 () Bool)

(declare-fun tp!69779 () Bool)

(assert (=> mapNonEmpty!36857 (= mapRes!36857 (and tp!69779 e!557528))))

(declare-datatypes ((V!35937 0))(
  ( (V!35938 (val!11658 Int)) )
))
(declare-datatypes ((ValueCell!11126 0))(
  ( (ValueCellFull!11126 (v!14219 V!35937)) (EmptyCell!11126) )
))
(declare-datatypes ((array!62436 0))(
  ( (array!62437 (arr!30069 (Array (_ BitVec 32) ValueCell!11126)) (size!30549 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62436)

(declare-fun mapValue!36857 () ValueCell!11126)

(declare-fun mapRest!36857 () (Array (_ BitVec 32) ValueCell!11126))

(declare-fun mapKey!36857 () (_ BitVec 32))

(assert (=> mapNonEmpty!36857 (= (arr!30069 _values!1278) (store mapRest!36857 mapKey!36857 mapValue!36857))))

(declare-fun b!988606 () Bool)

(declare-fun e!557525 () Bool)

(declare-fun e!557529 () Bool)

(assert (=> b!988606 (= e!557525 (and e!557529 mapRes!36857))))

(declare-fun condMapEmpty!36857 () Bool)

(declare-fun mapDefault!36857 () ValueCell!11126)

(assert (=> b!988606 (= condMapEmpty!36857 (= (arr!30069 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11126)) mapDefault!36857)))))

(declare-fun mapIsEmpty!36857 () Bool)

(assert (=> mapIsEmpty!36857 mapRes!36857))

(declare-fun b!988607 () Bool)

(declare-fun e!557526 () Bool)

(assert (=> b!988607 (= e!557530 (not e!557526))))

(declare-fun res!661094 () Bool)

(assert (=> b!988607 (=> res!661094 e!557526)))

(assert (=> b!988607 (= res!661094 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!30068 _keys!1544) from!1932)))))

(declare-datatypes ((tuple2!14874 0))(
  ( (tuple2!14875 (_1!7448 (_ BitVec 64)) (_2!7448 V!35937)) )
))
(declare-datatypes ((List!20780 0))(
  ( (Nil!20777) (Cons!20776 (h!21944 tuple2!14874) (t!29699 List!20780)) )
))
(declare-datatypes ((ListLongMap!13573 0))(
  ( (ListLongMap!13574 (toList!6802 List!20780)) )
))
(declare-fun lt!438306 () ListLongMap!13573)

(declare-fun lt!438303 () tuple2!14874)

(declare-fun lt!438307 () ListLongMap!13573)

(declare-fun lt!438309 () tuple2!14874)

(declare-fun +!3101 (ListLongMap!13573 tuple2!14874) ListLongMap!13573)

(assert (=> b!988607 (= (+!3101 lt!438306 lt!438303) (+!3101 lt!438307 lt!438309))))

(declare-fun lt!438308 () ListLongMap!13573)

(assert (=> b!988607 (= lt!438307 (+!3101 lt!438308 lt!438303))))

(declare-fun lt!438304 () V!35937)

(assert (=> b!988607 (= lt!438303 (tuple2!14875 (select (arr!30068 _keys!1544) from!1932) lt!438304))))

(assert (=> b!988607 (= lt!438306 (+!3101 lt!438308 lt!438309))))

(declare-fun minValue!1220 () V!35937)

(assert (=> b!988607 (= lt!438309 (tuple2!14875 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32776 0))(
  ( (Unit!32777) )
))
(declare-fun lt!438300 () Unit!32776)

(declare-fun addCommutativeForDiffKeys!704 (ListLongMap!13573 (_ BitVec 64) V!35937 (_ BitVec 64) V!35937) Unit!32776)

(assert (=> b!988607 (= lt!438300 (addCommutativeForDiffKeys!704 lt!438308 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30068 _keys!1544) from!1932) lt!438304))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15623 (ValueCell!11126 V!35937) V!35937)

(declare-fun dynLambda!1884 (Int (_ BitVec 64)) V!35937)

(assert (=> b!988607 (= lt!438304 (get!15623 (select (arr!30069 _values!1278) from!1932) (dynLambda!1884 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!438301 () ListLongMap!13573)

(declare-fun lt!438302 () tuple2!14874)

(assert (=> b!988607 (= lt!438308 (+!3101 lt!438301 lt!438302))))

(declare-fun zeroValue!1220 () V!35937)

(assert (=> b!988607 (= lt!438302 (tuple2!14875 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3530 (array!62434 array!62436 (_ BitVec 32) (_ BitVec 32) V!35937 V!35937 (_ BitVec 32) Int) ListLongMap!13573)

(assert (=> b!988607 (= lt!438301 (getCurrentListMapNoExtraKeys!3530 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!988608 () Bool)

(declare-fun res!661092 () Bool)

(assert (=> b!988608 (=> (not res!661092) (not e!557530))))

(declare-datatypes ((List!20781 0))(
  ( (Nil!20778) (Cons!20777 (h!21945 (_ BitVec 64)) (t!29700 List!20781)) )
))
(declare-fun arrayNoDuplicates!0 (array!62434 (_ BitVec 32) List!20781) Bool)

(assert (=> b!988608 (= res!661092 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20778))))

(declare-fun b!988603 () Bool)

(declare-fun res!661091 () Bool)

(assert (=> b!988603 (=> (not res!661091) (not e!557530))))

(assert (=> b!988603 (= res!661091 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!661097 () Bool)

(assert (=> start!84616 (=> (not res!661097) (not e!557530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84616 (= res!661097 (validMask!0 mask!1948))))

(assert (=> start!84616 e!557530))

(assert (=> start!84616 true))

(assert (=> start!84616 tp_is_empty!23215))

(declare-fun array_inv!23253 (array!62436) Bool)

(assert (=> start!84616 (and (array_inv!23253 _values!1278) e!557525)))

(assert (=> start!84616 tp!69778))

(declare-fun array_inv!23254 (array!62434) Bool)

(assert (=> start!84616 (array_inv!23254 _keys!1544)))

(declare-fun b!988609 () Bool)

(declare-fun res!661096 () Bool)

(assert (=> b!988609 (=> (not res!661096) (not e!557530))))

(assert (=> b!988609 (= res!661096 (and (= (size!30549 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30548 _keys!1544) (size!30549 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!988610 () Bool)

(assert (=> b!988610 (= e!557529 tp_is_empty!23215)))

(declare-fun b!988611 () Bool)

(assert (=> b!988611 (= e!557526 (bvslt from!1932 (size!30549 _values!1278)))))

(declare-fun lt!438310 () ListLongMap!13573)

(declare-fun getCurrentListMap!3862 (array!62434 array!62436 (_ BitVec 32) (_ BitVec 32) V!35937 V!35937 (_ BitVec 32) Int) ListLongMap!13573)

(assert (=> b!988611 (= lt!438310 (getCurrentListMap!3862 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(assert (=> b!988611 (= lt!438307 (+!3101 (+!3101 lt!438301 lt!438303) lt!438302))))

(declare-fun lt!438305 () Unit!32776)

(assert (=> b!988611 (= lt!438305 (addCommutativeForDiffKeys!704 lt!438301 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!30068 _keys!1544) from!1932) lt!438304))))

(declare-fun b!988612 () Bool)

(declare-fun res!661098 () Bool)

(assert (=> b!988612 (=> (not res!661098) (not e!557530))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62434 (_ BitVec 32)) Bool)

(assert (=> b!988612 (= res!661098 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!988613 () Bool)

(declare-fun res!661093 () Bool)

(assert (=> b!988613 (=> (not res!661093) (not e!557530))))

(assert (=> b!988613 (= res!661093 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30548 _keys!1544))))))

(assert (= (and start!84616 res!661097) b!988609))

(assert (= (and b!988609 res!661096) b!988612))

(assert (= (and b!988612 res!661098) b!988608))

(assert (= (and b!988608 res!661092) b!988613))

(assert (= (and b!988613 res!661093) b!988604))

(assert (= (and b!988604 res!661095) b!988603))

(assert (= (and b!988603 res!661091) b!988607))

(assert (= (and b!988607 (not res!661094)) b!988611))

(assert (= (and b!988606 condMapEmpty!36857) mapIsEmpty!36857))

(assert (= (and b!988606 (not condMapEmpty!36857)) mapNonEmpty!36857))

(get-info :version)

(assert (= (and mapNonEmpty!36857 ((_ is ValueCellFull!11126) mapValue!36857)) b!988605))

(assert (= (and b!988606 ((_ is ValueCellFull!11126) mapDefault!36857)) b!988610))

(assert (= start!84616 b!988606))

(declare-fun b_lambda!15045 () Bool)

(assert (=> (not b_lambda!15045) (not b!988607)))

(declare-fun t!29698 () Bool)

(declare-fun tb!6769 () Bool)

(assert (=> (and start!84616 (= defaultEntry!1281 defaultEntry!1281) t!29698) tb!6769))

(declare-fun result!13539 () Bool)

(assert (=> tb!6769 (= result!13539 tp_is_empty!23215)))

(assert (=> b!988607 t!29698))

(declare-fun b_and!32077 () Bool)

(assert (= b_and!32075 (and (=> t!29698 result!13539) b_and!32077)))

(declare-fun m!915653 () Bool)

(assert (=> b!988612 m!915653))

(declare-fun m!915655 () Bool)

(assert (=> b!988608 m!915655))

(declare-fun m!915657 () Bool)

(assert (=> b!988604 m!915657))

(assert (=> b!988604 m!915657))

(declare-fun m!915659 () Bool)

(assert (=> b!988604 m!915659))

(declare-fun m!915661 () Bool)

(assert (=> mapNonEmpty!36857 m!915661))

(declare-fun m!915663 () Bool)

(assert (=> start!84616 m!915663))

(declare-fun m!915665 () Bool)

(assert (=> start!84616 m!915665))

(declare-fun m!915667 () Bool)

(assert (=> start!84616 m!915667))

(assert (=> b!988611 m!915657))

(declare-fun m!915669 () Bool)

(assert (=> b!988611 m!915669))

(declare-fun m!915671 () Bool)

(assert (=> b!988611 m!915671))

(declare-fun m!915673 () Bool)

(assert (=> b!988611 m!915673))

(assert (=> b!988611 m!915669))

(assert (=> b!988611 m!915657))

(declare-fun m!915675 () Bool)

(assert (=> b!988611 m!915675))

(declare-fun m!915677 () Bool)

(assert (=> b!988607 m!915677))

(assert (=> b!988607 m!915657))

(declare-fun m!915679 () Bool)

(assert (=> b!988607 m!915679))

(declare-fun m!915681 () Bool)

(assert (=> b!988607 m!915681))

(declare-fun m!915683 () Bool)

(assert (=> b!988607 m!915683))

(declare-fun m!915685 () Bool)

(assert (=> b!988607 m!915685))

(declare-fun m!915687 () Bool)

(assert (=> b!988607 m!915687))

(declare-fun m!915689 () Bool)

(assert (=> b!988607 m!915689))

(assert (=> b!988607 m!915657))

(declare-fun m!915691 () Bool)

(assert (=> b!988607 m!915691))

(declare-fun m!915693 () Bool)

(assert (=> b!988607 m!915693))

(assert (=> b!988607 m!915679))

(assert (=> b!988607 m!915693))

(declare-fun m!915695 () Bool)

(assert (=> b!988607 m!915695))

(check-sat tp_is_empty!23215 (not b_lambda!15045) (not mapNonEmpty!36857) (not b_next!19999) (not start!84616) b_and!32077 (not b!988608) (not b!988604) (not b!988607) (not b!988611) (not b!988612))
(check-sat b_and!32077 (not b_next!19999))
