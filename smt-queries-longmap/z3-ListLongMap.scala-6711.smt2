; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84406 () Bool)

(assert start!84406)

(declare-fun b_free!19939 () Bool)

(declare-fun b_next!19939 () Bool)

(assert (=> start!84406 (= b_free!19939 (not b_next!19939))))

(declare-fun tp!69421 () Bool)

(declare-fun b_and!31965 () Bool)

(assert (=> start!84406 (= tp!69421 b_and!31965)))

(declare-fun b!986375 () Bool)

(declare-fun e!556077 () Bool)

(declare-fun e!556078 () Bool)

(assert (=> b!986375 (= e!556077 e!556078)))

(declare-fun res!659791 () Bool)

(assert (=> b!986375 (=> (not res!659791) (not e!556078))))

(declare-datatypes ((array!62098 0))(
  ( (array!62099 (arr!29902 (Array (_ BitVec 32) (_ BitVec 64))) (size!30382 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62098)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!986375 (= res!659791 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29902 _keys!1544) from!1932))))))

(declare-datatypes ((V!35705 0))(
  ( (V!35706 (val!11571 Int)) )
))
(declare-datatypes ((ValueCell!11039 0))(
  ( (ValueCellFull!11039 (v!14130 V!35705)) (EmptyCell!11039) )
))
(declare-datatypes ((array!62100 0))(
  ( (array!62101 (arr!29903 (Array (_ BitVec 32) ValueCell!11039)) (size!30383 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62100)

(declare-fun lt!437620 () V!35705)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15548 (ValueCell!11039 V!35705) V!35705)

(declare-fun dynLambda!1869 (Int (_ BitVec 64)) V!35705)

(assert (=> b!986375 (= lt!437620 (get!15548 (select (arr!29903 _values!1278) from!1932) (dynLambda!1869 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35705)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((tuple2!14828 0))(
  ( (tuple2!14829 (_1!7425 (_ BitVec 64)) (_2!7425 V!35705)) )
))
(declare-datatypes ((List!20705 0))(
  ( (Nil!20702) (Cons!20701 (h!21869 tuple2!14828) (t!29580 List!20705)) )
))
(declare-datatypes ((ListLongMap!13527 0))(
  ( (ListLongMap!13528 (toList!6779 List!20705)) )
))
(declare-fun lt!437622 () ListLongMap!13527)

(declare-fun zeroValue!1220 () V!35705)

(declare-fun getCurrentListMapNoExtraKeys!3512 (array!62098 array!62100 (_ BitVec 32) (_ BitVec 32) V!35705 V!35705 (_ BitVec 32) Int) ListLongMap!13527)

(assert (=> b!986375 (= lt!437622 (getCurrentListMapNoExtraKeys!3512 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36590 () Bool)

(declare-fun mapRes!36590 () Bool)

(declare-fun tp!69422 () Bool)

(declare-fun e!556075 () Bool)

(assert (=> mapNonEmpty!36590 (= mapRes!36590 (and tp!69422 e!556075))))

(declare-fun mapValue!36590 () ValueCell!11039)

(declare-fun mapKey!36590 () (_ BitVec 32))

(declare-fun mapRest!36590 () (Array (_ BitVec 32) ValueCell!11039))

(assert (=> mapNonEmpty!36590 (= (arr!29903 _values!1278) (store mapRest!36590 mapKey!36590 mapValue!36590))))

(declare-fun b!986376 () Bool)

(declare-fun e!556080 () Bool)

(declare-fun tp_is_empty!23041 () Bool)

(assert (=> b!986376 (= e!556080 tp_is_empty!23041)))

(declare-fun b!986377 () Bool)

(assert (=> b!986377 (= e!556075 tp_is_empty!23041)))

(declare-fun b!986378 () Bool)

(assert (=> b!986378 (= e!556078 (not true))))

(declare-fun lt!437619 () tuple2!14828)

(declare-fun lt!437618 () tuple2!14828)

(declare-fun +!3078 (ListLongMap!13527 tuple2!14828) ListLongMap!13527)

(assert (=> b!986378 (= (+!3078 (+!3078 lt!437622 lt!437619) lt!437618) (+!3078 (+!3078 lt!437622 lt!437618) lt!437619))))

(assert (=> b!986378 (= lt!437618 (tuple2!14829 (select (arr!29902 _keys!1544) from!1932) lt!437620))))

(assert (=> b!986378 (= lt!437619 (tuple2!14829 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32736 0))(
  ( (Unit!32737) )
))
(declare-fun lt!437621 () Unit!32736)

(declare-fun addCommutativeForDiffKeys!685 (ListLongMap!13527 (_ BitVec 64) V!35705 (_ BitVec 64) V!35705) Unit!32736)

(assert (=> b!986378 (= lt!437621 (addCommutativeForDiffKeys!685 lt!437622 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29902 _keys!1544) from!1932) lt!437620))))

(declare-fun res!659784 () Bool)

(assert (=> start!84406 (=> (not res!659784) (not e!556077))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84406 (= res!659784 (validMask!0 mask!1948))))

(assert (=> start!84406 e!556077))

(assert (=> start!84406 true))

(assert (=> start!84406 tp_is_empty!23041))

(declare-fun e!556076 () Bool)

(declare-fun array_inv!23131 (array!62100) Bool)

(assert (=> start!84406 (and (array_inv!23131 _values!1278) e!556076)))

(assert (=> start!84406 tp!69421))

(declare-fun array_inv!23132 (array!62098) Bool)

(assert (=> start!84406 (array_inv!23132 _keys!1544)))

(declare-fun b!986379 () Bool)

(declare-fun res!659786 () Bool)

(assert (=> b!986379 (=> (not res!659786) (not e!556077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62098 (_ BitVec 32)) Bool)

(assert (=> b!986379 (= res!659786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36590 () Bool)

(assert (=> mapIsEmpty!36590 mapRes!36590))

(declare-fun b!986380 () Bool)

(declare-fun res!659788 () Bool)

(assert (=> b!986380 (=> (not res!659788) (not e!556077))))

(assert (=> b!986380 (= res!659788 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30382 _keys!1544))))))

(declare-fun b!986381 () Bool)

(assert (=> b!986381 (= e!556076 (and e!556080 mapRes!36590))))

(declare-fun condMapEmpty!36590 () Bool)

(declare-fun mapDefault!36590 () ValueCell!11039)

(assert (=> b!986381 (= condMapEmpty!36590 (= (arr!29903 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11039)) mapDefault!36590)))))

(declare-fun b!986382 () Bool)

(declare-fun res!659790 () Bool)

(assert (=> b!986382 (=> (not res!659790) (not e!556077))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!986382 (= res!659790 (validKeyInArray!0 (select (arr!29902 _keys!1544) from!1932)))))

(declare-fun b!986383 () Bool)

(declare-fun res!659785 () Bool)

(assert (=> b!986383 (=> (not res!659785) (not e!556077))))

(assert (=> b!986383 (= res!659785 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!986384 () Bool)

(declare-fun res!659789 () Bool)

(assert (=> b!986384 (=> (not res!659789) (not e!556077))))

(declare-datatypes ((List!20706 0))(
  ( (Nil!20703) (Cons!20702 (h!21870 (_ BitVec 64)) (t!29581 List!20706)) )
))
(declare-fun arrayNoDuplicates!0 (array!62098 (_ BitVec 32) List!20706) Bool)

(assert (=> b!986384 (= res!659789 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20703))))

(declare-fun b!986385 () Bool)

(declare-fun res!659787 () Bool)

(assert (=> b!986385 (=> (not res!659787) (not e!556077))))

(assert (=> b!986385 (= res!659787 (and (= (size!30383 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30382 _keys!1544) (size!30383 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(assert (= (and start!84406 res!659784) b!986385))

(assert (= (and b!986385 res!659787) b!986379))

(assert (= (and b!986379 res!659786) b!986384))

(assert (= (and b!986384 res!659789) b!986380))

(assert (= (and b!986380 res!659788) b!986382))

(assert (= (and b!986382 res!659790) b!986383))

(assert (= (and b!986383 res!659785) b!986375))

(assert (= (and b!986375 res!659791) b!986378))

(assert (= (and b!986381 condMapEmpty!36590) mapIsEmpty!36590))

(assert (= (and b!986381 (not condMapEmpty!36590)) mapNonEmpty!36590))

(get-info :version)

(assert (= (and mapNonEmpty!36590 ((_ is ValueCellFull!11039) mapValue!36590)) b!986377))

(assert (= (and b!986381 ((_ is ValueCellFull!11039) mapDefault!36590)) b!986376))

(assert (= start!84406 b!986381))

(declare-fun b_lambda!14985 () Bool)

(assert (=> (not b_lambda!14985) (not b!986375)))

(declare-fun t!29579 () Bool)

(declare-fun tb!6725 () Bool)

(assert (=> (and start!84406 (= defaultEntry!1281 defaultEntry!1281) t!29579) tb!6725))

(declare-fun result!13447 () Bool)

(assert (=> tb!6725 (= result!13447 tp_is_empty!23041)))

(assert (=> b!986375 t!29579))

(declare-fun b_and!31967 () Bool)

(assert (= b_and!31965 (and (=> t!29579 result!13447) b_and!31967)))

(declare-fun m!913823 () Bool)

(assert (=> b!986378 m!913823))

(declare-fun m!913825 () Bool)

(assert (=> b!986378 m!913825))

(declare-fun m!913827 () Bool)

(assert (=> b!986378 m!913827))

(declare-fun m!913829 () Bool)

(assert (=> b!986378 m!913829))

(assert (=> b!986378 m!913823))

(declare-fun m!913831 () Bool)

(assert (=> b!986378 m!913831))

(assert (=> b!986378 m!913829))

(declare-fun m!913833 () Bool)

(assert (=> b!986378 m!913833))

(assert (=> b!986378 m!913825))

(declare-fun m!913835 () Bool)

(assert (=> start!84406 m!913835))

(declare-fun m!913837 () Bool)

(assert (=> start!84406 m!913837))

(declare-fun m!913839 () Bool)

(assert (=> start!84406 m!913839))

(declare-fun m!913841 () Bool)

(assert (=> b!986379 m!913841))

(declare-fun m!913843 () Bool)

(assert (=> b!986384 m!913843))

(declare-fun m!913845 () Bool)

(assert (=> mapNonEmpty!36590 m!913845))

(assert (=> b!986375 m!913823))

(declare-fun m!913847 () Bool)

(assert (=> b!986375 m!913847))

(declare-fun m!913849 () Bool)

(assert (=> b!986375 m!913849))

(declare-fun m!913851 () Bool)

(assert (=> b!986375 m!913851))

(assert (=> b!986375 m!913847))

(assert (=> b!986375 m!913851))

(declare-fun m!913853 () Bool)

(assert (=> b!986375 m!913853))

(assert (=> b!986382 m!913823))

(assert (=> b!986382 m!913823))

(declare-fun m!913855 () Bool)

(assert (=> b!986382 m!913855))

(check-sat (not start!84406) (not b!986379) tp_is_empty!23041 (not b_next!19939) (not b!986378) (not b_lambda!14985) (not b!986384) (not b!986382) (not mapNonEmpty!36590) b_and!31967 (not b!986375))
(check-sat b_and!31967 (not b_next!19939))
