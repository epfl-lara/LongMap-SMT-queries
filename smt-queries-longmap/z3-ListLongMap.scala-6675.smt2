; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84190 () Bool)

(assert start!84190)

(declare-fun b_free!19777 () Bool)

(declare-fun b_next!19777 () Bool)

(assert (=> start!84190 (= b_free!19777 (not b_next!19777))))

(declare-fun tp!68854 () Bool)

(declare-fun b_and!31647 () Bool)

(assert (=> start!84190 (= tp!68854 b_and!31647)))

(declare-fun mapIsEmpty!36266 () Bool)

(declare-fun mapRes!36266 () Bool)

(assert (=> mapIsEmpty!36266 mapRes!36266))

(declare-fun b!983042 () Bool)

(declare-fun res!657586 () Bool)

(declare-fun e!554224 () Bool)

(assert (=> b!983042 (=> (not res!657586) (not e!554224))))

(declare-datatypes ((array!61680 0))(
  ( (array!61681 (arr!29693 (Array (_ BitVec 32) (_ BitVec 64))) (size!30173 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61680)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!983042 (= res!657586 (validKeyInArray!0 (select (arr!29693 _keys!1544) from!1932)))))

(declare-fun mapNonEmpty!36266 () Bool)

(declare-fun tp!68855 () Bool)

(declare-fun e!554221 () Bool)

(assert (=> mapNonEmpty!36266 (= mapRes!36266 (and tp!68855 e!554221))))

(declare-datatypes ((V!35417 0))(
  ( (V!35418 (val!11463 Int)) )
))
(declare-datatypes ((ValueCell!10931 0))(
  ( (ValueCellFull!10931 (v!14022 V!35417)) (EmptyCell!10931) )
))
(declare-datatypes ((array!61682 0))(
  ( (array!61683 (arr!29694 (Array (_ BitVec 32) ValueCell!10931)) (size!30174 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61682)

(declare-fun mapRest!36266 () (Array (_ BitVec 32) ValueCell!10931))

(declare-fun mapValue!36266 () ValueCell!10931)

(declare-fun mapKey!36266 () (_ BitVec 32))

(assert (=> mapNonEmpty!36266 (= (arr!29694 _values!1278) (store mapRest!36266 mapKey!36266 mapValue!36266))))

(declare-fun b!983043 () Bool)

(declare-fun e!554225 () Bool)

(declare-fun e!554223 () Bool)

(assert (=> b!983043 (= e!554225 (and e!554223 mapRes!36266))))

(declare-fun condMapEmpty!36266 () Bool)

(declare-fun mapDefault!36266 () ValueCell!10931)

(assert (=> b!983043 (= condMapEmpty!36266 (= (arr!29694 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10931)) mapDefault!36266)))))

(declare-fun b!983044 () Bool)

(declare-fun tp_is_empty!22825 () Bool)

(assert (=> b!983044 (= e!554223 tp_is_empty!22825)))

(declare-fun res!657581 () Bool)

(assert (=> start!84190 (=> (not res!657581) (not e!554224))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84190 (= res!657581 (validMask!0 mask!1948))))

(assert (=> start!84190 e!554224))

(assert (=> start!84190 true))

(assert (=> start!84190 tp_is_empty!22825))

(declare-fun array_inv!22981 (array!61682) Bool)

(assert (=> start!84190 (and (array_inv!22981 _values!1278) e!554225)))

(assert (=> start!84190 tp!68854))

(declare-fun array_inv!22982 (array!61680) Bool)

(assert (=> start!84190 (array_inv!22982 _keys!1544)))

(declare-fun b!983045 () Bool)

(declare-fun e!554226 () Bool)

(assert (=> b!983045 (= e!554224 e!554226)))

(declare-fun res!657580 () Bool)

(assert (=> b!983045 (=> (not res!657580) (not e!554226))))

(assert (=> b!983045 (= res!657580 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29693 _keys!1544) from!1932))))))

(declare-fun lt!436367 () V!35417)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15421 (ValueCell!10931 V!35417) V!35417)

(declare-fun dynLambda!1814 (Int (_ BitVec 64)) V!35417)

(assert (=> b!983045 (= lt!436367 (get!15421 (select (arr!29694 _values!1278) from!1932) (dynLambda!1814 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35417)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35417)

(declare-datatypes ((tuple2!14692 0))(
  ( (tuple2!14693 (_1!7357 (_ BitVec 64)) (_2!7357 V!35417)) )
))
(declare-datatypes ((List!20569 0))(
  ( (Nil!20566) (Cons!20565 (h!21733 tuple2!14692) (t!29288 List!20569)) )
))
(declare-datatypes ((ListLongMap!13391 0))(
  ( (ListLongMap!13392 (toList!6711 List!20569)) )
))
(declare-fun lt!436370 () ListLongMap!13391)

(declare-fun getCurrentListMapNoExtraKeys!3455 (array!61680 array!61682 (_ BitVec 32) (_ BitVec 32) V!35417 V!35417 (_ BitVec 32) Int) ListLongMap!13391)

(assert (=> b!983045 (= lt!436370 (getCurrentListMapNoExtraKeys!3455 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!983046 () Bool)

(declare-fun res!657585 () Bool)

(assert (=> b!983046 (=> (not res!657585) (not e!554224))))

(assert (=> b!983046 (= res!657585 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!983047 () Bool)

(declare-fun res!657582 () Bool)

(assert (=> b!983047 (=> (not res!657582) (not e!554224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61680 (_ BitVec 32)) Bool)

(assert (=> b!983047 (= res!657582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!983048 () Bool)

(assert (=> b!983048 (= e!554221 tp_is_empty!22825)))

(declare-fun b!983049 () Bool)

(declare-fun res!657579 () Bool)

(assert (=> b!983049 (=> (not res!657579) (not e!554224))))

(assert (=> b!983049 (= res!657579 (and (= (size!30174 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30173 _keys!1544) (size!30174 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!983050 () Bool)

(assert (=> b!983050 (= e!554226 (not true))))

(declare-fun lt!436371 () tuple2!14692)

(declare-fun lt!436369 () tuple2!14692)

(declare-fun +!3021 (ListLongMap!13391 tuple2!14692) ListLongMap!13391)

(assert (=> b!983050 (= (+!3021 (+!3021 lt!436370 lt!436371) lt!436369) (+!3021 (+!3021 lt!436370 lt!436369) lt!436371))))

(assert (=> b!983050 (= lt!436369 (tuple2!14693 (select (arr!29693 _keys!1544) from!1932) lt!436367))))

(assert (=> b!983050 (= lt!436371 (tuple2!14693 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32622 0))(
  ( (Unit!32623) )
))
(declare-fun lt!436368 () Unit!32622)

(declare-fun addCommutativeForDiffKeys!628 (ListLongMap!13391 (_ BitVec 64) V!35417 (_ BitVec 64) V!35417) Unit!32622)

(assert (=> b!983050 (= lt!436368 (addCommutativeForDiffKeys!628 lt!436370 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29693 _keys!1544) from!1932) lt!436367))))

(declare-fun b!983051 () Bool)

(declare-fun res!657583 () Bool)

(assert (=> b!983051 (=> (not res!657583) (not e!554224))))

(assert (=> b!983051 (= res!657583 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30173 _keys!1544))))))

(declare-fun b!983052 () Bool)

(declare-fun res!657584 () Bool)

(assert (=> b!983052 (=> (not res!657584) (not e!554224))))

(declare-datatypes ((List!20570 0))(
  ( (Nil!20567) (Cons!20566 (h!21734 (_ BitVec 64)) (t!29289 List!20570)) )
))
(declare-fun arrayNoDuplicates!0 (array!61680 (_ BitVec 32) List!20570) Bool)

(assert (=> b!983052 (= res!657584 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20567))))

(assert (= (and start!84190 res!657581) b!983049))

(assert (= (and b!983049 res!657579) b!983047))

(assert (= (and b!983047 res!657582) b!983052))

(assert (= (and b!983052 res!657584) b!983051))

(assert (= (and b!983051 res!657583) b!983042))

(assert (= (and b!983042 res!657586) b!983046))

(assert (= (and b!983046 res!657585) b!983045))

(assert (= (and b!983045 res!657580) b!983050))

(assert (= (and b!983043 condMapEmpty!36266) mapIsEmpty!36266))

(assert (= (and b!983043 (not condMapEmpty!36266)) mapNonEmpty!36266))

(get-info :version)

(assert (= (and mapNonEmpty!36266 ((_ is ValueCellFull!10931) mapValue!36266)) b!983048))

(assert (= (and b!983043 ((_ is ValueCellFull!10931) mapDefault!36266)) b!983044))

(assert (= start!84190 b!983043))

(declare-fun b_lambda!14829 () Bool)

(assert (=> (not b_lambda!14829) (not b!983045)))

(declare-fun t!29287 () Bool)

(declare-fun tb!6569 () Bool)

(assert (=> (and start!84190 (= defaultEntry!1281 defaultEntry!1281) t!29287) tb!6569))

(declare-fun result!13135 () Bool)

(assert (=> tb!6569 (= result!13135 tp_is_empty!22825)))

(assert (=> b!983045 t!29287))

(declare-fun b_and!31649 () Bool)

(assert (= b_and!31647 (and (=> t!29287 result!13135) b_and!31649)))

(declare-fun m!910781 () Bool)

(assert (=> b!983052 m!910781))

(declare-fun m!910783 () Bool)

(assert (=> mapNonEmpty!36266 m!910783))

(declare-fun m!910785 () Bool)

(assert (=> b!983042 m!910785))

(assert (=> b!983042 m!910785))

(declare-fun m!910787 () Bool)

(assert (=> b!983042 m!910787))

(assert (=> b!983045 m!910785))

(declare-fun m!910789 () Bool)

(assert (=> b!983045 m!910789))

(declare-fun m!910791 () Bool)

(assert (=> b!983045 m!910791))

(declare-fun m!910793 () Bool)

(assert (=> b!983045 m!910793))

(assert (=> b!983045 m!910789))

(assert (=> b!983045 m!910793))

(declare-fun m!910795 () Bool)

(assert (=> b!983045 m!910795))

(declare-fun m!910797 () Bool)

(assert (=> b!983050 m!910797))

(assert (=> b!983050 m!910785))

(declare-fun m!910799 () Bool)

(assert (=> b!983050 m!910799))

(assert (=> b!983050 m!910799))

(declare-fun m!910801 () Bool)

(assert (=> b!983050 m!910801))

(assert (=> b!983050 m!910797))

(declare-fun m!910803 () Bool)

(assert (=> b!983050 m!910803))

(assert (=> b!983050 m!910785))

(declare-fun m!910805 () Bool)

(assert (=> b!983050 m!910805))

(declare-fun m!910807 () Bool)

(assert (=> b!983047 m!910807))

(declare-fun m!910809 () Bool)

(assert (=> start!84190 m!910809))

(declare-fun m!910811 () Bool)

(assert (=> start!84190 m!910811))

(declare-fun m!910813 () Bool)

(assert (=> start!84190 m!910813))

(check-sat (not b!983045) (not b!983052) b_and!31649 (not start!84190) tp_is_empty!22825 (not b!983042) (not b_next!19777) (not b!983047) (not b_lambda!14829) (not mapNonEmpty!36266) (not b!983050))
(check-sat b_and!31649 (not b_next!19777))
