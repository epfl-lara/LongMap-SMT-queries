; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83322 () Bool)

(assert start!83322)

(declare-fun b_free!19333 () Bool)

(declare-fun b_next!19333 () Bool)

(assert (=> start!83322 (= b_free!19333 (not b_next!19333))))

(declare-fun tp!67279 () Bool)

(declare-fun b_and!30861 () Bool)

(assert (=> start!83322 (= tp!67279 b_and!30861)))

(declare-fun b!972727 () Bool)

(declare-fun e!548265 () Bool)

(declare-fun e!548259 () Bool)

(assert (=> b!972727 (= e!548265 e!548259)))

(declare-fun res!651161 () Bool)

(assert (=> b!972727 (=> (not res!651161) (not e!548259))))

(declare-fun lt!431982 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972727 (= res!651161 (validKeyInArray!0 lt!431982))))

(declare-datatypes ((array!60436 0))(
  ( (array!60437 (arr!29082 (Array (_ BitVec 32) (_ BitVec 64))) (size!29563 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60436)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972727 (= lt!431982 (select (arr!29082 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-datatypes ((V!34625 0))(
  ( (V!34626 (val!11166 Int)) )
))
(declare-datatypes ((ValueCell!10634 0))(
  ( (ValueCellFull!10634 (v!13724 V!34625)) (EmptyCell!10634) )
))
(declare-datatypes ((array!60438 0))(
  ( (array!60439 (arr!29083 (Array (_ BitVec 32) ValueCell!10634)) (size!29564 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60438)

(declare-fun zeroValue!1367 () V!34625)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34625)

(declare-datatypes ((tuple2!14402 0))(
  ( (tuple2!14403 (_1!7212 (_ BitVec 64)) (_2!7212 V!34625)) )
))
(declare-datatypes ((List!20213 0))(
  ( (Nil!20210) (Cons!20209 (h!21371 tuple2!14402) (t!28635 List!20213)) )
))
(declare-datatypes ((ListLongMap!13089 0))(
  ( (ListLongMap!13090 (toList!6560 List!20213)) )
))
(declare-fun lt!431983 () ListLongMap!13089)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3722 (array!60436 array!60438 (_ BitVec 32) (_ BitVec 32) V!34625 V!34625 (_ BitVec 32) Int) ListLongMap!13089)

(assert (=> b!972727 (= lt!431983 (getCurrentListMap!3722 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972728 () Bool)

(declare-fun e!548261 () Bool)

(assert (=> b!972728 (= e!548261 e!548265)))

(declare-fun res!651163 () Bool)

(assert (=> b!972728 (=> (not res!651163) (not e!548265))))

(declare-fun lt!431984 () ListLongMap!13089)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5601 (ListLongMap!13089 (_ BitVec 64)) Bool)

(assert (=> b!972728 (= res!651163 (contains!5601 lt!431984 (select (arr!29082 _keys!1717) i!822)))))

(assert (=> b!972728 (= lt!431984 (getCurrentListMap!3722 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!972729 () Bool)

(declare-fun res!651160 () Bool)

(assert (=> b!972729 (=> (not res!651160) (not e!548261))))

(declare-datatypes ((List!20214 0))(
  ( (Nil!20211) (Cons!20210 (h!21372 (_ BitVec 64)) (t!28636 List!20214)) )
))
(declare-fun arrayNoDuplicates!0 (array!60436 (_ BitVec 32) List!20214) Bool)

(assert (=> b!972729 (= res!651160 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20211))))

(declare-fun mapNonEmpty!35356 () Bool)

(declare-fun mapRes!35356 () Bool)

(declare-fun tp!67278 () Bool)

(declare-fun e!548262 () Bool)

(assert (=> mapNonEmpty!35356 (= mapRes!35356 (and tp!67278 e!548262))))

(declare-fun mapKey!35356 () (_ BitVec 32))

(declare-fun mapValue!35356 () ValueCell!10634)

(declare-fun mapRest!35356 () (Array (_ BitVec 32) ValueCell!10634))

(assert (=> mapNonEmpty!35356 (= (arr!29083 _values!1425) (store mapRest!35356 mapKey!35356 mapValue!35356))))

(declare-fun b!972730 () Bool)

(declare-fun e!548264 () Bool)

(declare-fun tp_is_empty!22231 () Bool)

(assert (=> b!972730 (= e!548264 tp_is_empty!22231)))

(declare-fun b!972731 () Bool)

(declare-fun res!651164 () Bool)

(assert (=> b!972731 (=> (not res!651164) (not e!548261))))

(assert (=> b!972731 (= res!651164 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29563 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29563 _keys!1717))))))

(declare-fun b!972732 () Bool)

(assert (=> b!972732 (= e!548262 tp_is_empty!22231)))

(declare-fun b!972734 () Bool)

(declare-fun e!548263 () Bool)

(assert (=> b!972734 (= e!548263 (and e!548264 mapRes!35356))))

(declare-fun condMapEmpty!35356 () Bool)

(declare-fun mapDefault!35356 () ValueCell!10634)

(assert (=> b!972734 (= condMapEmpty!35356 (= (arr!29083 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10634)) mapDefault!35356)))))

(declare-fun mapIsEmpty!35356 () Bool)

(assert (=> mapIsEmpty!35356 mapRes!35356))

(declare-fun b!972735 () Bool)

(declare-fun res!651165 () Bool)

(assert (=> b!972735 (=> (not res!651165) (not e!548261))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60436 (_ BitVec 32)) Bool)

(assert (=> b!972735 (= res!651165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972736 () Bool)

(assert (=> b!972736 (= e!548259 (not true))))

(declare-fun lt!431980 () tuple2!14402)

(declare-fun +!2913 (ListLongMap!13089 tuple2!14402) ListLongMap!13089)

(assert (=> b!972736 (contains!5601 (+!2913 lt!431984 lt!431980) (select (arr!29082 _keys!1717) i!822))))

(declare-datatypes ((Unit!32278 0))(
  ( (Unit!32279) )
))
(declare-fun lt!431985 () Unit!32278)

(declare-fun lt!431979 () V!34625)

(declare-fun addStillContains!583 (ListLongMap!13089 (_ BitVec 64) V!34625 (_ BitVec 64)) Unit!32278)

(assert (=> b!972736 (= lt!431985 (addStillContains!583 lt!431984 lt!431982 lt!431979 (select (arr!29082 _keys!1717) i!822)))))

(assert (=> b!972736 (= lt!431983 (+!2913 (getCurrentListMap!3722 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!431980))))

(assert (=> b!972736 (= lt!431980 (tuple2!14403 lt!431982 lt!431979))))

(declare-fun get!15076 (ValueCell!10634 V!34625) V!34625)

(declare-fun dynLambda!1669 (Int (_ BitVec 64)) V!34625)

(assert (=> b!972736 (= lt!431979 (get!15076 (select (arr!29083 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1669 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!431981 () Unit!32278)

(declare-fun lemmaListMapRecursiveValidKeyArray!253 (array!60436 array!60438 (_ BitVec 32) (_ BitVec 32) V!34625 V!34625 (_ BitVec 32) Int) Unit!32278)

(assert (=> b!972736 (= lt!431981 (lemmaListMapRecursiveValidKeyArray!253 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972737 () Bool)

(declare-fun res!651166 () Bool)

(assert (=> b!972737 (=> (not res!651166) (not e!548261))))

(assert (=> b!972737 (= res!651166 (and (= (size!29564 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29563 _keys!1717) (size!29564 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun res!651159 () Bool)

(assert (=> start!83322 (=> (not res!651159) (not e!548261))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83322 (= res!651159 (validMask!0 mask!2147))))

(assert (=> start!83322 e!548261))

(assert (=> start!83322 true))

(declare-fun array_inv!22553 (array!60438) Bool)

(assert (=> start!83322 (and (array_inv!22553 _values!1425) e!548263)))

(assert (=> start!83322 tp_is_empty!22231))

(assert (=> start!83322 tp!67279))

(declare-fun array_inv!22554 (array!60436) Bool)

(assert (=> start!83322 (array_inv!22554 _keys!1717)))

(declare-fun b!972733 () Bool)

(declare-fun res!651162 () Bool)

(assert (=> b!972733 (=> (not res!651162) (not e!548261))))

(assert (=> b!972733 (= res!651162 (validKeyInArray!0 (select (arr!29082 _keys!1717) i!822)))))

(assert (= (and start!83322 res!651159) b!972737))

(assert (= (and b!972737 res!651166) b!972735))

(assert (= (and b!972735 res!651165) b!972729))

(assert (= (and b!972729 res!651160) b!972731))

(assert (= (and b!972731 res!651164) b!972733))

(assert (= (and b!972733 res!651162) b!972728))

(assert (= (and b!972728 res!651163) b!972727))

(assert (= (and b!972727 res!651161) b!972736))

(assert (= (and b!972734 condMapEmpty!35356) mapIsEmpty!35356))

(assert (= (and b!972734 (not condMapEmpty!35356)) mapNonEmpty!35356))

(get-info :version)

(assert (= (and mapNonEmpty!35356 ((_ is ValueCellFull!10634) mapValue!35356)) b!972732))

(assert (= (and b!972734 ((_ is ValueCellFull!10634) mapDefault!35356)) b!972730))

(assert (= start!83322 b!972734))

(declare-fun b_lambda!14479 () Bool)

(assert (=> (not b_lambda!14479) (not b!972736)))

(declare-fun t!28634 () Bool)

(declare-fun tb!6273 () Bool)

(assert (=> (and start!83322 (= defaultEntry!1428 defaultEntry!1428) t!28634) tb!6273))

(declare-fun result!12531 () Bool)

(assert (=> tb!6273 (= result!12531 tp_is_empty!22231)))

(assert (=> b!972736 t!28634))

(declare-fun b_and!30863 () Bool)

(assert (= b_and!30861 (and (=> t!28634 result!12531) b_and!30863)))

(declare-fun m!899681 () Bool)

(assert (=> b!972728 m!899681))

(assert (=> b!972728 m!899681))

(declare-fun m!899683 () Bool)

(assert (=> b!972728 m!899683))

(declare-fun m!899685 () Bool)

(assert (=> b!972728 m!899685))

(declare-fun m!899687 () Bool)

(assert (=> b!972727 m!899687))

(declare-fun m!899689 () Bool)

(assert (=> b!972727 m!899689))

(declare-fun m!899691 () Bool)

(assert (=> b!972727 m!899691))

(declare-fun m!899693 () Bool)

(assert (=> b!972735 m!899693))

(declare-fun m!899695 () Bool)

(assert (=> start!83322 m!899695))

(declare-fun m!899697 () Bool)

(assert (=> start!83322 m!899697))

(declare-fun m!899699 () Bool)

(assert (=> start!83322 m!899699))

(declare-fun m!899701 () Bool)

(assert (=> mapNonEmpty!35356 m!899701))

(assert (=> b!972733 m!899681))

(assert (=> b!972733 m!899681))

(declare-fun m!899703 () Bool)

(assert (=> b!972733 m!899703))

(declare-fun m!899705 () Bool)

(assert (=> b!972729 m!899705))

(declare-fun m!899707 () Bool)

(assert (=> b!972736 m!899707))

(declare-fun m!899709 () Bool)

(assert (=> b!972736 m!899709))

(declare-fun m!899711 () Bool)

(assert (=> b!972736 m!899711))

(assert (=> b!972736 m!899709))

(assert (=> b!972736 m!899681))

(assert (=> b!972736 m!899681))

(declare-fun m!899713 () Bool)

(assert (=> b!972736 m!899713))

(assert (=> b!972736 m!899707))

(declare-fun m!899715 () Bool)

(assert (=> b!972736 m!899715))

(declare-fun m!899717 () Bool)

(assert (=> b!972736 m!899717))

(declare-fun m!899719 () Bool)

(assert (=> b!972736 m!899719))

(declare-fun m!899721 () Bool)

(assert (=> b!972736 m!899721))

(assert (=> b!972736 m!899721))

(assert (=> b!972736 m!899681))

(declare-fun m!899723 () Bool)

(assert (=> b!972736 m!899723))

(assert (=> b!972736 m!899715))

(check-sat (not b!972728) tp_is_empty!22231 (not mapNonEmpty!35356) (not b!972729) b_and!30863 (not b!972727) (not b!972735) (not b!972736) (not start!83322) (not b_lambda!14479) (not b_next!19333) (not b!972733))
(check-sat b_and!30863 (not b_next!19333))
