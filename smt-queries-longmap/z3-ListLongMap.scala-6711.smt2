; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84220 () Bool)

(assert start!84220)

(declare-fun b_free!19939 () Bool)

(declare-fun b_next!19939 () Bool)

(assert (=> start!84220 (= b_free!19939 (not b_next!19939))))

(declare-fun tp!69421 () Bool)

(declare-fun b_and!31929 () Bool)

(assert (=> start!84220 (= tp!69421 b_and!31929)))

(declare-fun b!985233 () Bool)

(declare-fun e!555348 () Bool)

(declare-fun tp_is_empty!23041 () Bool)

(assert (=> b!985233 (= e!555348 tp_is_empty!23041)))

(declare-fun b!985234 () Bool)

(declare-fun e!555347 () Bool)

(declare-fun mapRes!36590 () Bool)

(assert (=> b!985234 (= e!555347 (and e!555348 mapRes!36590))))

(declare-fun condMapEmpty!36590 () Bool)

(declare-datatypes ((V!35705 0))(
  ( (V!35706 (val!11571 Int)) )
))
(declare-datatypes ((ValueCell!11039 0))(
  ( (ValueCellFull!11039 (v!14132 V!35705)) (EmptyCell!11039) )
))
(declare-datatypes ((array!61984 0))(
  ( (array!61985 (arr!29850 (Array (_ BitVec 32) ValueCell!11039)) (size!30331 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61984)

(declare-fun mapDefault!36590 () ValueCell!11039)

(assert (=> b!985234 (= condMapEmpty!36590 (= (arr!29850 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11039)) mapDefault!36590)))))

(declare-fun res!659337 () Bool)

(declare-fun e!555345 () Bool)

(assert (=> start!84220 (=> (not res!659337) (not e!555345))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84220 (= res!659337 (validMask!0 mask!1948))))

(assert (=> start!84220 e!555345))

(assert (=> start!84220 true))

(assert (=> start!84220 tp_is_empty!23041))

(declare-fun array_inv!23079 (array!61984) Bool)

(assert (=> start!84220 (and (array_inv!23079 _values!1278) e!555347)))

(assert (=> start!84220 tp!69421))

(declare-datatypes ((array!61986 0))(
  ( (array!61987 (arr!29851 (Array (_ BitVec 32) (_ BitVec 64))) (size!30332 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61986)

(declare-fun array_inv!23080 (array!61986) Bool)

(assert (=> start!84220 (array_inv!23080 _keys!1544)))

(declare-fun b!985235 () Bool)

(declare-fun res!659331 () Bool)

(assert (=> b!985235 (=> (not res!659331) (not e!555345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61986 (_ BitVec 32)) Bool)

(assert (=> b!985235 (= res!659331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!985236 () Bool)

(declare-fun e!555346 () Bool)

(assert (=> b!985236 (= e!555346 tp_is_empty!23041)))

(declare-fun b!985237 () Bool)

(declare-fun res!659334 () Bool)

(assert (=> b!985237 (=> (not res!659334) (not e!555345))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!985237 (= res!659334 (and (= (size!30331 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30332 _keys!1544) (size!30331 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!985238 () Bool)

(declare-fun e!555349 () Bool)

(assert (=> b!985238 (= e!555349 (not true))))

(declare-datatypes ((tuple2!14886 0))(
  ( (tuple2!14887 (_1!7454 (_ BitVec 64)) (_2!7454 V!35705)) )
))
(declare-datatypes ((List!20734 0))(
  ( (Nil!20731) (Cons!20730 (h!21892 tuple2!14886) (t!29608 List!20734)) )
))
(declare-datatypes ((ListLongMap!13573 0))(
  ( (ListLongMap!13574 (toList!6802 List!20734)) )
))
(declare-fun lt!437022 () ListLongMap!13573)

(declare-fun lt!437024 () tuple2!14886)

(declare-fun lt!437021 () tuple2!14886)

(declare-fun +!3078 (ListLongMap!13573 tuple2!14886) ListLongMap!13573)

(assert (=> b!985238 (= (+!3078 (+!3078 lt!437022 lt!437024) lt!437021) (+!3078 (+!3078 lt!437022 lt!437021) lt!437024))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!437025 () V!35705)

(assert (=> b!985238 (= lt!437021 (tuple2!14887 (select (arr!29851 _keys!1544) from!1932) lt!437025))))

(declare-fun minValue!1220 () V!35705)

(assert (=> b!985238 (= lt!437024 (tuple2!14887 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32622 0))(
  ( (Unit!32623) )
))
(declare-fun lt!437023 () Unit!32622)

(declare-fun addCommutativeForDiffKeys!682 (ListLongMap!13573 (_ BitVec 64) V!35705 (_ BitVec 64) V!35705) Unit!32622)

(assert (=> b!985238 (= lt!437023 (addCommutativeForDiffKeys!682 lt!437022 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29851 _keys!1544) from!1932) lt!437025))))

(declare-fun mapIsEmpty!36590 () Bool)

(assert (=> mapIsEmpty!36590 mapRes!36590))

(declare-fun b!985239 () Bool)

(declare-fun res!659330 () Bool)

(assert (=> b!985239 (=> (not res!659330) (not e!555345))))

(declare-datatypes ((List!20735 0))(
  ( (Nil!20732) (Cons!20731 (h!21893 (_ BitVec 64)) (t!29609 List!20735)) )
))
(declare-fun arrayNoDuplicates!0 (array!61986 (_ BitVec 32) List!20735) Bool)

(assert (=> b!985239 (= res!659330 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20732))))

(declare-fun mapNonEmpty!36590 () Bool)

(declare-fun tp!69422 () Bool)

(assert (=> mapNonEmpty!36590 (= mapRes!36590 (and tp!69422 e!555346))))

(declare-fun mapKey!36590 () (_ BitVec 32))

(declare-fun mapValue!36590 () ValueCell!11039)

(declare-fun mapRest!36590 () (Array (_ BitVec 32) ValueCell!11039))

(assert (=> mapNonEmpty!36590 (= (arr!29850 _values!1278) (store mapRest!36590 mapKey!36590 mapValue!36590))))

(declare-fun b!985240 () Bool)

(declare-fun res!659333 () Bool)

(assert (=> b!985240 (=> (not res!659333) (not e!555345))))

(assert (=> b!985240 (= res!659333 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!985241 () Bool)

(assert (=> b!985241 (= e!555345 e!555349)))

(declare-fun res!659336 () Bool)

(assert (=> b!985241 (=> (not res!659336) (not e!555349))))

(assert (=> b!985241 (= res!659336 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29851 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15515 (ValueCell!11039 V!35705) V!35705)

(declare-fun dynLambda!1835 (Int (_ BitVec 64)) V!35705)

(assert (=> b!985241 (= lt!437025 (get!15515 (select (arr!29850 _values!1278) from!1932) (dynLambda!1835 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35705)

(declare-fun getCurrentListMapNoExtraKeys!3507 (array!61986 array!61984 (_ BitVec 32) (_ BitVec 32) V!35705 V!35705 (_ BitVec 32) Int) ListLongMap!13573)

(assert (=> b!985241 (= lt!437022 (getCurrentListMapNoExtraKeys!3507 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!985242 () Bool)

(declare-fun res!659335 () Bool)

(assert (=> b!985242 (=> (not res!659335) (not e!555345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!985242 (= res!659335 (validKeyInArray!0 (select (arr!29851 _keys!1544) from!1932)))))

(declare-fun b!985243 () Bool)

(declare-fun res!659332 () Bool)

(assert (=> b!985243 (=> (not res!659332) (not e!555345))))

(assert (=> b!985243 (= res!659332 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30332 _keys!1544))))))

(assert (= (and start!84220 res!659337) b!985237))

(assert (= (and b!985237 res!659334) b!985235))

(assert (= (and b!985235 res!659331) b!985239))

(assert (= (and b!985239 res!659330) b!985243))

(assert (= (and b!985243 res!659332) b!985242))

(assert (= (and b!985242 res!659335) b!985240))

(assert (= (and b!985240 res!659333) b!985241))

(assert (= (and b!985241 res!659336) b!985238))

(assert (= (and b!985234 condMapEmpty!36590) mapIsEmpty!36590))

(assert (= (and b!985234 (not condMapEmpty!36590)) mapNonEmpty!36590))

(get-info :version)

(assert (= (and mapNonEmpty!36590 ((_ is ValueCellFull!11039) mapValue!36590)) b!985236))

(assert (= (and b!985234 ((_ is ValueCellFull!11039) mapDefault!36590)) b!985233))

(assert (= start!84220 b!985234))

(declare-fun b_lambda!14953 () Bool)

(assert (=> (not b_lambda!14953) (not b!985241)))

(declare-fun t!29607 () Bool)

(declare-fun tb!6725 () Bool)

(assert (=> (and start!84220 (= defaultEntry!1281 defaultEntry!1281) t!29607) tb!6725))

(declare-fun result!13447 () Bool)

(assert (=> tb!6725 (= result!13447 tp_is_empty!23041)))

(assert (=> b!985241 t!29607))

(declare-fun b_and!31931 () Bool)

(assert (= b_and!31929 (and (=> t!29607 result!13447) b_and!31931)))

(declare-fun m!911771 () Bool)

(assert (=> b!985242 m!911771))

(assert (=> b!985242 m!911771))

(declare-fun m!911773 () Bool)

(assert (=> b!985242 m!911773))

(declare-fun m!911775 () Bool)

(assert (=> b!985239 m!911775))

(assert (=> b!985238 m!911771))

(declare-fun m!911777 () Bool)

(assert (=> b!985238 m!911777))

(assert (=> b!985238 m!911771))

(declare-fun m!911779 () Bool)

(assert (=> b!985238 m!911779))

(declare-fun m!911781 () Bool)

(assert (=> b!985238 m!911781))

(assert (=> b!985238 m!911777))

(declare-fun m!911783 () Bool)

(assert (=> b!985238 m!911783))

(assert (=> b!985238 m!911781))

(declare-fun m!911785 () Bool)

(assert (=> b!985238 m!911785))

(declare-fun m!911787 () Bool)

(assert (=> start!84220 m!911787))

(declare-fun m!911789 () Bool)

(assert (=> start!84220 m!911789))

(declare-fun m!911791 () Bool)

(assert (=> start!84220 m!911791))

(assert (=> b!985241 m!911771))

(declare-fun m!911793 () Bool)

(assert (=> b!985241 m!911793))

(declare-fun m!911795 () Bool)

(assert (=> b!985241 m!911795))

(declare-fun m!911797 () Bool)

(assert (=> b!985241 m!911797))

(assert (=> b!985241 m!911793))

(assert (=> b!985241 m!911797))

(declare-fun m!911799 () Bool)

(assert (=> b!985241 m!911799))

(declare-fun m!911801 () Bool)

(assert (=> b!985235 m!911801))

(declare-fun m!911803 () Bool)

(assert (=> mapNonEmpty!36590 m!911803))

(check-sat (not b!985238) (not b!985241) (not b_lambda!14953) (not b!985235) (not b_next!19939) (not b!985242) (not mapNonEmpty!36590) (not b!985239) tp_is_empty!23041 b_and!31931 (not start!84220))
(check-sat b_and!31931 (not b_next!19939))
