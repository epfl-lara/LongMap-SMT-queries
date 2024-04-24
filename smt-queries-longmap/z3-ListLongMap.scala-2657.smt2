; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39746 () Bool)

(assert start!39746)

(declare-fun b_free!10027 () Bool)

(declare-fun b_next!10027 () Bool)

(assert (=> start!39746 (= b_free!10027 (not b_next!10027))))

(declare-fun tp!35610 () Bool)

(declare-fun b_and!17727 () Bool)

(assert (=> start!39746 (= tp!35610 b_and!17727)))

(declare-fun b!428100 () Bool)

(declare-fun res!251278 () Bool)

(declare-fun e!253740 () Bool)

(assert (=> b!428100 (=> (not res!251278) (not e!253740))))

(declare-datatypes ((array!26204 0))(
  ( (array!26205 (arr!12551 (Array (_ BitVec 32) (_ BitVec 64))) (size!12903 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26204)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26204 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428100 (= res!251278 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!428101 () Bool)

(declare-fun res!251275 () Bool)

(declare-fun e!253735 () Bool)

(assert (=> b!428101 (=> (not res!251275) (not e!253735))))

(declare-fun lt!195629 () array!26204)

(declare-datatypes ((List!7315 0))(
  ( (Nil!7312) (Cons!7311 (h!8167 (_ BitVec 64)) (t!12783 List!7315)) )
))
(declare-fun arrayNoDuplicates!0 (array!26204 (_ BitVec 32) List!7315) Bool)

(assert (=> b!428101 (= res!251275 (arrayNoDuplicates!0 lt!195629 #b00000000000000000000000000000000 Nil!7312))))

(declare-fun b!428102 () Bool)

(declare-fun e!253739 () Bool)

(declare-fun tp_is_empty!11179 () Bool)

(assert (=> b!428102 (= e!253739 tp_is_empty!11179)))

(declare-fun b!428103 () Bool)

(declare-fun res!251277 () Bool)

(assert (=> b!428103 (=> (not res!251277) (not e!253740))))

(assert (=> b!428103 (= res!251277 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7312))))

(declare-fun b!428104 () Bool)

(declare-fun e!253737 () Bool)

(assert (=> b!428104 (= e!253737 tp_is_empty!11179)))

(declare-fun b!428105 () Bool)

(declare-fun res!251274 () Bool)

(assert (=> b!428105 (=> (not res!251274) (not e!253735))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428105 (= res!251274 (bvsle from!863 i!563))))

(declare-fun b!428106 () Bool)

(declare-fun e!253738 () Bool)

(declare-fun e!253736 () Bool)

(assert (=> b!428106 (= e!253738 (not e!253736))))

(declare-fun res!251271 () Bool)

(assert (=> b!428106 (=> res!251271 e!253736)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428106 (= res!251271 (not (validKeyInArray!0 (select (arr!12551 _keys!709) from!863))))))

(declare-datatypes ((V!16011 0))(
  ( (V!16012 (val!5634 Int)) )
))
(declare-datatypes ((tuple2!7314 0))(
  ( (tuple2!7315 (_1!3668 (_ BitVec 64)) (_2!3668 V!16011)) )
))
(declare-datatypes ((List!7316 0))(
  ( (Nil!7313) (Cons!7312 (h!8168 tuple2!7314) (t!12784 List!7316)) )
))
(declare-datatypes ((ListLongMap!6229 0))(
  ( (ListLongMap!6230 (toList!3130 List!7316)) )
))
(declare-fun lt!195631 () ListLongMap!6229)

(declare-fun lt!195636 () ListLongMap!6229)

(assert (=> b!428106 (= lt!195631 lt!195636)))

(declare-fun v!412 () V!16011)

(declare-fun lt!195630 () ListLongMap!6229)

(declare-fun +!1343 (ListLongMap!6229 tuple2!7314) ListLongMap!6229)

(assert (=> b!428106 (= lt!195636 (+!1343 lt!195630 (tuple2!7315 k0!794 v!412)))))

(declare-fun minValue!515 () V!16011)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16011)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5246 0))(
  ( (ValueCellFull!5246 (v!7882 V!16011)) (EmptyCell!5246) )
))
(declare-datatypes ((array!26206 0))(
  ( (array!26207 (arr!12552 (Array (_ BitVec 32) ValueCell!5246)) (size!12904 (_ BitVec 32))) )
))
(declare-fun lt!195634 () array!26206)

(declare-fun getCurrentListMapNoExtraKeys!1375 (array!26204 array!26206 (_ BitVec 32) (_ BitVec 32) V!16011 V!16011 (_ BitVec 32) Int) ListLongMap!6229)

(assert (=> b!428106 (= lt!195631 (getCurrentListMapNoExtraKeys!1375 lt!195629 lt!195634 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26206)

(assert (=> b!428106 (= lt!195630 (getCurrentListMapNoExtraKeys!1375 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12557 0))(
  ( (Unit!12558) )
))
(declare-fun lt!195632 () Unit!12557)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!525 (array!26204 array!26206 (_ BitVec 32) (_ BitVec 32) V!16011 V!16011 (_ BitVec 32) (_ BitVec 64) V!16011 (_ BitVec 32) Int) Unit!12557)

(assert (=> b!428106 (= lt!195632 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!525 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428107 () Bool)

(assert (=> b!428107 (= e!253740 e!253735)))

(declare-fun res!251282 () Bool)

(assert (=> b!428107 (=> (not res!251282) (not e!253735))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26204 (_ BitVec 32)) Bool)

(assert (=> b!428107 (= res!251282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195629 mask!1025))))

(assert (=> b!428107 (= lt!195629 (array!26205 (store (arr!12551 _keys!709) i!563 k0!794) (size!12903 _keys!709)))))

(declare-fun mapIsEmpty!18390 () Bool)

(declare-fun mapRes!18390 () Bool)

(assert (=> mapIsEmpty!18390 mapRes!18390))

(declare-fun b!428108 () Bool)

(declare-fun e!253741 () Bool)

(assert (=> b!428108 (= e!253741 (and e!253739 mapRes!18390))))

(declare-fun condMapEmpty!18390 () Bool)

(declare-fun mapDefault!18390 () ValueCell!5246)

(assert (=> b!428108 (= condMapEmpty!18390 (= (arr!12552 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5246)) mapDefault!18390)))))

(declare-fun mapNonEmpty!18390 () Bool)

(declare-fun tp!35609 () Bool)

(assert (=> mapNonEmpty!18390 (= mapRes!18390 (and tp!35609 e!253737))))

(declare-fun mapValue!18390 () ValueCell!5246)

(declare-fun mapRest!18390 () (Array (_ BitVec 32) ValueCell!5246))

(declare-fun mapKey!18390 () (_ BitVec 32))

(assert (=> mapNonEmpty!18390 (= (arr!12552 _values!549) (store mapRest!18390 mapKey!18390 mapValue!18390))))

(declare-fun b!428109 () Bool)

(assert (=> b!428109 (= e!253736 true)))

(declare-fun lt!195635 () ListLongMap!6229)

(declare-fun get!6222 (ValueCell!5246 V!16011) V!16011)

(declare-fun dynLambda!759 (Int (_ BitVec 64)) V!16011)

(assert (=> b!428109 (= lt!195635 (+!1343 lt!195636 (tuple2!7315 (select (arr!12551 _keys!709) from!863) (get!6222 (select (arr!12552 _values!549) from!863) (dynLambda!759 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428110 () Bool)

(assert (=> b!428110 (= e!253735 e!253738)))

(declare-fun res!251281 () Bool)

(assert (=> b!428110 (=> (not res!251281) (not e!253738))))

(assert (=> b!428110 (= res!251281 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!428110 (= lt!195635 (getCurrentListMapNoExtraKeys!1375 lt!195629 lt!195634 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428110 (= lt!195634 (array!26207 (store (arr!12552 _values!549) i!563 (ValueCellFull!5246 v!412)) (size!12904 _values!549)))))

(declare-fun lt!195633 () ListLongMap!6229)

(assert (=> b!428110 (= lt!195633 (getCurrentListMapNoExtraKeys!1375 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!251280 () Bool)

(assert (=> start!39746 (=> (not res!251280) (not e!253740))))

(assert (=> start!39746 (= res!251280 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12903 _keys!709))))))

(assert (=> start!39746 e!253740))

(assert (=> start!39746 tp_is_empty!11179))

(assert (=> start!39746 tp!35610))

(assert (=> start!39746 true))

(declare-fun array_inv!9212 (array!26206) Bool)

(assert (=> start!39746 (and (array_inv!9212 _values!549) e!253741)))

(declare-fun array_inv!9213 (array!26204) Bool)

(assert (=> start!39746 (array_inv!9213 _keys!709)))

(declare-fun b!428111 () Bool)

(declare-fun res!251272 () Bool)

(assert (=> b!428111 (=> (not res!251272) (not e!253740))))

(assert (=> b!428111 (= res!251272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428112 () Bool)

(declare-fun res!251276 () Bool)

(assert (=> b!428112 (=> (not res!251276) (not e!253740))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428112 (= res!251276 (validMask!0 mask!1025))))

(declare-fun b!428113 () Bool)

(declare-fun res!251279 () Bool)

(assert (=> b!428113 (=> (not res!251279) (not e!253740))))

(assert (=> b!428113 (= res!251279 (or (= (select (arr!12551 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12551 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428114 () Bool)

(declare-fun res!251273 () Bool)

(assert (=> b!428114 (=> (not res!251273) (not e!253740))))

(assert (=> b!428114 (= res!251273 (validKeyInArray!0 k0!794))))

(declare-fun b!428115 () Bool)

(declare-fun res!251283 () Bool)

(assert (=> b!428115 (=> (not res!251283) (not e!253740))))

(assert (=> b!428115 (= res!251283 (and (= (size!12904 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12903 _keys!709) (size!12904 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428116 () Bool)

(declare-fun res!251270 () Bool)

(assert (=> b!428116 (=> (not res!251270) (not e!253740))))

(assert (=> b!428116 (= res!251270 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12903 _keys!709))))))

(assert (= (and start!39746 res!251280) b!428112))

(assert (= (and b!428112 res!251276) b!428115))

(assert (= (and b!428115 res!251283) b!428111))

(assert (= (and b!428111 res!251272) b!428103))

(assert (= (and b!428103 res!251277) b!428116))

(assert (= (and b!428116 res!251270) b!428114))

(assert (= (and b!428114 res!251273) b!428113))

(assert (= (and b!428113 res!251279) b!428100))

(assert (= (and b!428100 res!251278) b!428107))

(assert (= (and b!428107 res!251282) b!428101))

(assert (= (and b!428101 res!251275) b!428105))

(assert (= (and b!428105 res!251274) b!428110))

(assert (= (and b!428110 res!251281) b!428106))

(assert (= (and b!428106 (not res!251271)) b!428109))

(assert (= (and b!428108 condMapEmpty!18390) mapIsEmpty!18390))

(assert (= (and b!428108 (not condMapEmpty!18390)) mapNonEmpty!18390))

(get-info :version)

(assert (= (and mapNonEmpty!18390 ((_ is ValueCellFull!5246) mapValue!18390)) b!428104))

(assert (= (and b!428108 ((_ is ValueCellFull!5246) mapDefault!18390)) b!428102))

(assert (= start!39746 b!428108))

(declare-fun b_lambda!9137 () Bool)

(assert (=> (not b_lambda!9137) (not b!428109)))

(declare-fun t!12782 () Bool)

(declare-fun tb!3425 () Bool)

(assert (=> (and start!39746 (= defaultEntry!557 defaultEntry!557) t!12782) tb!3425))

(declare-fun result!6385 () Bool)

(assert (=> tb!3425 (= result!6385 tp_is_empty!11179)))

(assert (=> b!428109 t!12782))

(declare-fun b_and!17729 () Bool)

(assert (= b_and!17727 (and (=> t!12782 result!6385) b_and!17729)))

(declare-fun m!416825 () Bool)

(assert (=> b!428114 m!416825))

(declare-fun m!416827 () Bool)

(assert (=> b!428113 m!416827))

(declare-fun m!416829 () Bool)

(assert (=> b!428100 m!416829))

(declare-fun m!416831 () Bool)

(assert (=> b!428110 m!416831))

(declare-fun m!416833 () Bool)

(assert (=> b!428110 m!416833))

(declare-fun m!416835 () Bool)

(assert (=> b!428110 m!416835))

(declare-fun m!416837 () Bool)

(assert (=> b!428107 m!416837))

(declare-fun m!416839 () Bool)

(assert (=> b!428107 m!416839))

(declare-fun m!416841 () Bool)

(assert (=> b!428112 m!416841))

(declare-fun m!416843 () Bool)

(assert (=> mapNonEmpty!18390 m!416843))

(declare-fun m!416845 () Bool)

(assert (=> b!428106 m!416845))

(declare-fun m!416847 () Bool)

(assert (=> b!428106 m!416847))

(declare-fun m!416849 () Bool)

(assert (=> b!428106 m!416849))

(declare-fun m!416851 () Bool)

(assert (=> b!428106 m!416851))

(declare-fun m!416853 () Bool)

(assert (=> b!428106 m!416853))

(declare-fun m!416855 () Bool)

(assert (=> b!428106 m!416855))

(assert (=> b!428106 m!416849))

(declare-fun m!416857 () Bool)

(assert (=> start!39746 m!416857))

(declare-fun m!416859 () Bool)

(assert (=> start!39746 m!416859))

(assert (=> b!428109 m!416849))

(declare-fun m!416861 () Bool)

(assert (=> b!428109 m!416861))

(declare-fun m!416863 () Bool)

(assert (=> b!428109 m!416863))

(assert (=> b!428109 m!416863))

(assert (=> b!428109 m!416861))

(declare-fun m!416865 () Bool)

(assert (=> b!428109 m!416865))

(declare-fun m!416867 () Bool)

(assert (=> b!428109 m!416867))

(declare-fun m!416869 () Bool)

(assert (=> b!428111 m!416869))

(declare-fun m!416871 () Bool)

(assert (=> b!428101 m!416871))

(declare-fun m!416873 () Bool)

(assert (=> b!428103 m!416873))

(check-sat (not b_lambda!9137) (not start!39746) tp_is_empty!11179 (not b!428103) (not b!428106) (not mapNonEmpty!18390) (not b!428110) (not b!428114) b_and!17729 (not b!428111) (not b!428101) (not b!428112) (not b!428100) (not b_next!10027) (not b!428109) (not b!428107))
(check-sat b_and!17729 (not b_next!10027))
