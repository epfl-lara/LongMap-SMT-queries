; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133364 () Bool)

(assert start!133364)

(declare-fun b!1559342 () Bool)

(declare-fun res!1066400 () Bool)

(declare-fun e!868860 () Bool)

(assert (=> b!1559342 (=> (not res!1066400) (not e!868860))))

(declare-datatypes ((array!103642 0))(
  ( (array!103643 (arr!50014 (Array (_ BitVec 32) (_ BitVec 64))) (size!50566 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103642)

(declare-datatypes ((List!36398 0))(
  ( (Nil!36395) (Cons!36394 (h!37841 (_ BitVec 64)) (t!51123 List!36398)) )
))
(declare-fun arrayNoDuplicates!0 (array!103642 (_ BitVec 32) List!36398) Bool)

(assert (=> b!1559342 (= res!1066400 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36395))))

(declare-fun b!1559343 () Bool)

(declare-fun res!1066402 () Bool)

(assert (=> b!1559343 (=> (not res!1066402) (not e!868860))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59537 0))(
  ( (V!59538 (val!19332 Int)) )
))
(declare-datatypes ((ValueCell!18218 0))(
  ( (ValueCellFull!18218 (v!22080 V!59537)) (EmptyCell!18218) )
))
(declare-datatypes ((array!103644 0))(
  ( (array!103645 (arr!50015 (Array (_ BitVec 32) ValueCell!18218)) (size!50567 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103644)

(assert (=> b!1559343 (= res!1066402 (and (= (size!50567 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50566 _keys!637) (size!50567 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559344 () Bool)

(declare-fun e!868861 () Bool)

(declare-fun tp_is_empty!38497 () Bool)

(assert (=> b!1559344 (= e!868861 tp_is_empty!38497)))

(declare-fun b!1559345 () Bool)

(declare-fun res!1066401 () Bool)

(assert (=> b!1559345 (=> (not res!1066401) (not e!868860))))

(declare-datatypes ((tuple2!25074 0))(
  ( (tuple2!25075 (_1!12548 (_ BitVec 64)) (_2!12548 V!59537)) )
))
(declare-datatypes ((List!36399 0))(
  ( (Nil!36396) (Cons!36395 (h!37842 tuple2!25074) (t!51124 List!36399)) )
))
(declare-datatypes ((ListLongMap!22509 0))(
  ( (ListLongMap!22510 (toList!11270 List!36399)) )
))
(declare-fun contains!10180 (ListLongMap!22509 (_ BitVec 64)) Bool)

(assert (=> b!1559345 (= res!1066401 (not (contains!10180 (ListLongMap!22510 Nil!36396) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!59121 () Bool)

(declare-fun mapRes!59121 () Bool)

(declare-fun tp!112777 () Bool)

(declare-fun e!868857 () Bool)

(assert (=> mapNonEmpty!59121 (= mapRes!59121 (and tp!112777 e!868857))))

(declare-fun mapKey!59121 () (_ BitVec 32))

(declare-fun mapValue!59121 () ValueCell!18218)

(declare-fun mapRest!59121 () (Array (_ BitVec 32) ValueCell!18218))

(assert (=> mapNonEmpty!59121 (= (arr!50015 _values!487) (store mapRest!59121 mapKey!59121 mapValue!59121))))

(declare-fun res!1066403 () Bool)

(assert (=> start!133364 (=> (not res!1066403) (not e!868860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133364 (= res!1066403 (validMask!0 mask!947))))

(assert (=> start!133364 e!868860))

(assert (=> start!133364 true))

(declare-fun array_inv!39083 (array!103642) Bool)

(assert (=> start!133364 (array_inv!39083 _keys!637)))

(declare-fun e!868859 () Bool)

(declare-fun array_inv!39084 (array!103644) Bool)

(assert (=> start!133364 (and (array_inv!39084 _values!487) e!868859)))

(declare-fun b!1559346 () Bool)

(assert (=> b!1559346 (= e!868857 tp_is_empty!38497)))

(declare-fun b!1559347 () Bool)

(assert (=> b!1559347 (= e!868860 false)))

(declare-fun lt!670616 () Bool)

(assert (=> b!1559347 (= lt!670616 (contains!10180 (ListLongMap!22510 Nil!36396) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1559348 () Bool)

(assert (=> b!1559348 (= e!868859 (and e!868861 mapRes!59121))))

(declare-fun condMapEmpty!59121 () Bool)

(declare-fun mapDefault!59121 () ValueCell!18218)

(assert (=> b!1559348 (= condMapEmpty!59121 (= (arr!50015 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18218)) mapDefault!59121)))))

(declare-fun mapIsEmpty!59121 () Bool)

(assert (=> mapIsEmpty!59121 mapRes!59121))

(declare-fun b!1559349 () Bool)

(declare-fun res!1066399 () Bool)

(assert (=> b!1559349 (=> (not res!1066399) (not e!868860))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1559349 (= res!1066399 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50566 _keys!637)) (bvsge from!782 (size!50566 _keys!637))))))

(declare-fun b!1559350 () Bool)

(declare-fun res!1066404 () Bool)

(assert (=> b!1559350 (=> (not res!1066404) (not e!868860))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103642 (_ BitVec 32)) Bool)

(assert (=> b!1559350 (= res!1066404 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(assert (= (and start!133364 res!1066403) b!1559343))

(assert (= (and b!1559343 res!1066402) b!1559350))

(assert (= (and b!1559350 res!1066404) b!1559342))

(assert (= (and b!1559342 res!1066400) b!1559349))

(assert (= (and b!1559349 res!1066399) b!1559345))

(assert (= (and b!1559345 res!1066401) b!1559347))

(assert (= (and b!1559348 condMapEmpty!59121) mapIsEmpty!59121))

(assert (= (and b!1559348 (not condMapEmpty!59121)) mapNonEmpty!59121))

(get-info :version)

(assert (= (and mapNonEmpty!59121 ((_ is ValueCellFull!18218) mapValue!59121)) b!1559346))

(assert (= (and b!1559348 ((_ is ValueCellFull!18218) mapDefault!59121)) b!1559344))

(assert (= start!133364 b!1559348))

(declare-fun m!1434921 () Bool)

(assert (=> b!1559345 m!1434921))

(declare-fun m!1434923 () Bool)

(assert (=> b!1559350 m!1434923))

(declare-fun m!1434925 () Bool)

(assert (=> b!1559347 m!1434925))

(declare-fun m!1434927 () Bool)

(assert (=> b!1559342 m!1434927))

(declare-fun m!1434929 () Bool)

(assert (=> start!133364 m!1434929))

(declare-fun m!1434931 () Bool)

(assert (=> start!133364 m!1434931))

(declare-fun m!1434933 () Bool)

(assert (=> start!133364 m!1434933))

(declare-fun m!1434935 () Bool)

(assert (=> mapNonEmpty!59121 m!1434935))

(check-sat (not start!133364) (not b!1559345) (not b!1559342) (not b!1559350) (not mapNonEmpty!59121) tp_is_empty!38497 (not b!1559347))
(check-sat)
