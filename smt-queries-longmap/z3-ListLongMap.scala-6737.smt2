; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84412 () Bool)

(assert start!84412)

(declare-fun b_free!19983 () Bool)

(declare-fun b_next!19983 () Bool)

(assert (=> start!84412 (= b_free!19983 (not b_next!19983))))

(declare-fun tp!69726 () Bool)

(declare-fun b_and!32029 () Bool)

(assert (=> start!84412 (= tp!69726 b_and!32029)))

(declare-fun res!660532 () Bool)

(declare-fun e!556755 () Bool)

(assert (=> start!84412 (=> (not res!660532) (not e!556755))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84412 (= res!660532 (validMask!0 mask!1948))))

(assert (=> start!84412 e!556755))

(assert (=> start!84412 true))

(declare-fun tp_is_empty!23199 () Bool)

(assert (=> start!84412 tp_is_empty!23199))

(declare-datatypes ((V!35915 0))(
  ( (V!35916 (val!11650 Int)) )
))
(declare-datatypes ((ValueCell!11118 0))(
  ( (ValueCellFull!11118 (v!14213 V!35915)) (EmptyCell!11118) )
))
(declare-datatypes ((array!62355 0))(
  ( (array!62356 (arr!30034 (Array (_ BitVec 32) ValueCell!11118)) (size!30513 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62355)

(declare-fun e!556758 () Bool)

(declare-fun array_inv!23205 (array!62355) Bool)

(assert (=> start!84412 (and (array_inv!23205 _values!1278) e!556758)))

(assert (=> start!84412 tp!69726))

(declare-datatypes ((array!62357 0))(
  ( (array!62358 (arr!30035 (Array (_ BitVec 32) (_ BitVec 64))) (size!30514 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62357)

(declare-fun array_inv!23206 (array!62357) Bool)

(assert (=> start!84412 (array_inv!23206 _keys!1544)))

(declare-fun b!987342 () Bool)

(declare-fun e!556757 () Bool)

(declare-fun mapRes!36830 () Bool)

(assert (=> b!987342 (= e!556758 (and e!556757 mapRes!36830))))

(declare-fun condMapEmpty!36830 () Bool)

(declare-fun mapDefault!36830 () ValueCell!11118)

(assert (=> b!987342 (= condMapEmpty!36830 (= (arr!30034 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11118)) mapDefault!36830)))))

(declare-fun b!987343 () Bool)

(declare-fun e!556754 () Bool)

(assert (=> b!987343 (= e!556754 tp_is_empty!23199)))

(declare-fun b!987344 () Bool)

(declare-fun res!660533 () Bool)

(assert (=> b!987344 (=> (not res!660533) (not e!556755))))

(declare-datatypes ((List!20768 0))(
  ( (Nil!20765) (Cons!20764 (h!21926 (_ BitVec 64)) (t!29679 List!20768)) )
))
(declare-fun arrayNoDuplicates!0 (array!62357 (_ BitVec 32) List!20768) Bool)

(assert (=> b!987344 (= res!660533 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20765))))

(declare-fun b!987345 () Bool)

(declare-fun res!660529 () Bool)

(assert (=> b!987345 (=> (not res!660529) (not e!556755))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987345 (= res!660529 (validKeyInArray!0 (select (arr!30035 _keys!1544) from!1932)))))

(declare-fun b!987346 () Bool)

(assert (=> b!987346 (= e!556755 (not (bvslt from!1932 (size!30513 _values!1278))))))

(declare-datatypes ((tuple2!14838 0))(
  ( (tuple2!14839 (_1!7430 (_ BitVec 64)) (_2!7430 V!35915)) )
))
(declare-datatypes ((List!20769 0))(
  ( (Nil!20766) (Cons!20765 (h!21927 tuple2!14838) (t!29680 List!20769)) )
))
(declare-datatypes ((ListLongMap!13535 0))(
  ( (ListLongMap!13536 (toList!6783 List!20769)) )
))
(declare-fun lt!437695 () ListLongMap!13535)

(declare-fun lt!437692 () tuple2!14838)

(declare-fun lt!437696 () tuple2!14838)

(declare-fun +!3068 (ListLongMap!13535 tuple2!14838) ListLongMap!13535)

(assert (=> b!987346 (= (+!3068 (+!3068 lt!437695 lt!437692) lt!437696) (+!3068 (+!3068 lt!437695 lt!437696) lt!437692))))

(declare-fun lt!437693 () V!35915)

(assert (=> b!987346 (= lt!437696 (tuple2!14839 (select (arr!30035 _keys!1544) from!1932) lt!437693))))

(declare-fun minValue!1220 () V!35915)

(assert (=> b!987346 (= lt!437692 (tuple2!14839 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32769 0))(
  ( (Unit!32770) )
))
(declare-fun lt!437694 () Unit!32769)

(declare-fun addCommutativeForDiffKeys!692 (ListLongMap!13535 (_ BitVec 64) V!35915 (_ BitVec 64) V!35915) Unit!32769)

(assert (=> b!987346 (= lt!437694 (addCommutativeForDiffKeys!692 lt!437695 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30035 _keys!1544) from!1932) lt!437693))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15578 (ValueCell!11118 V!35915) V!35915)

(declare-fun dynLambda!1851 (Int (_ BitVec 64)) V!35915)

(assert (=> b!987346 (= lt!437693 (get!15578 (select (arr!30034 _values!1278) from!1932) (dynLambda!1851 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35915)

(declare-fun getCurrentListMapNoExtraKeys!3474 (array!62357 array!62355 (_ BitVec 32) (_ BitVec 32) V!35915 V!35915 (_ BitVec 32) Int) ListLongMap!13535)

(assert (=> b!987346 (= lt!437695 (+!3068 (getCurrentListMapNoExtraKeys!3474 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14839 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!987347 () Bool)

(declare-fun res!660530 () Bool)

(assert (=> b!987347 (=> (not res!660530) (not e!556755))))

(assert (=> b!987347 (= res!660530 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30514 _keys!1544))))))

(declare-fun b!987348 () Bool)

(declare-fun res!660527 () Bool)

(assert (=> b!987348 (=> (not res!660527) (not e!556755))))

(assert (=> b!987348 (= res!660527 (and (= (size!30513 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30514 _keys!1544) (size!30513 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!36830 () Bool)

(assert (=> mapIsEmpty!36830 mapRes!36830))

(declare-fun b!987349 () Bool)

(declare-fun res!660531 () Bool)

(assert (=> b!987349 (=> (not res!660531) (not e!556755))))

(assert (=> b!987349 (= res!660531 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!36830 () Bool)

(declare-fun tp!69727 () Bool)

(assert (=> mapNonEmpty!36830 (= mapRes!36830 (and tp!69727 e!556754))))

(declare-fun mapValue!36830 () ValueCell!11118)

(declare-fun mapRest!36830 () (Array (_ BitVec 32) ValueCell!11118))

(declare-fun mapKey!36830 () (_ BitVec 32))

(assert (=> mapNonEmpty!36830 (= (arr!30034 _values!1278) (store mapRest!36830 mapKey!36830 mapValue!36830))))

(declare-fun b!987350 () Bool)

(declare-fun res!660528 () Bool)

(assert (=> b!987350 (=> (not res!660528) (not e!556755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62357 (_ BitVec 32)) Bool)

(assert (=> b!987350 (= res!660528 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987351 () Bool)

(assert (=> b!987351 (= e!556757 tp_is_empty!23199)))

(assert (= (and start!84412 res!660532) b!987348))

(assert (= (and b!987348 res!660527) b!987350))

(assert (= (and b!987350 res!660528) b!987344))

(assert (= (and b!987344 res!660533) b!987347))

(assert (= (and b!987347 res!660530) b!987345))

(assert (= (and b!987345 res!660529) b!987349))

(assert (= (and b!987349 res!660531) b!987346))

(assert (= (and b!987342 condMapEmpty!36830) mapIsEmpty!36830))

(assert (= (and b!987342 (not condMapEmpty!36830)) mapNonEmpty!36830))

(get-info :version)

(assert (= (and mapNonEmpty!36830 ((_ is ValueCellFull!11118) mapValue!36830)) b!987343))

(assert (= (and b!987342 ((_ is ValueCellFull!11118) mapDefault!36830)) b!987351))

(assert (= start!84412 b!987342))

(declare-fun b_lambda!15005 () Bool)

(assert (=> (not b_lambda!15005) (not b!987346)))

(declare-fun t!29678 () Bool)

(declare-fun tb!6761 () Bool)

(assert (=> (and start!84412 (= defaultEntry!1281 defaultEntry!1281) t!29678) tb!6761))

(declare-fun result!13513 () Bool)

(assert (=> tb!6761 (= result!13513 tp_is_empty!23199)))

(assert (=> b!987346 t!29678))

(declare-fun b_and!32031 () Bool)

(assert (= b_and!32029 (and (=> t!29678 result!13513) b_and!32031)))

(declare-fun m!913927 () Bool)

(assert (=> b!987350 m!913927))

(declare-fun m!913929 () Bool)

(assert (=> b!987346 m!913929))

(declare-fun m!913931 () Bool)

(assert (=> b!987346 m!913931))

(declare-fun m!913933 () Bool)

(assert (=> b!987346 m!913933))

(declare-fun m!913935 () Bool)

(assert (=> b!987346 m!913935))

(declare-fun m!913937 () Bool)

(assert (=> b!987346 m!913937))

(assert (=> b!987346 m!913935))

(declare-fun m!913939 () Bool)

(assert (=> b!987346 m!913939))

(assert (=> b!987346 m!913939))

(declare-fun m!913941 () Bool)

(assert (=> b!987346 m!913941))

(assert (=> b!987346 m!913929))

(declare-fun m!913943 () Bool)

(assert (=> b!987346 m!913943))

(assert (=> b!987346 m!913931))

(declare-fun m!913945 () Bool)

(assert (=> b!987346 m!913945))

(declare-fun m!913947 () Bool)

(assert (=> b!987346 m!913947))

(assert (=> b!987346 m!913933))

(assert (=> b!987346 m!913947))

(declare-fun m!913949 () Bool)

(assert (=> b!987346 m!913949))

(declare-fun m!913951 () Bool)

(assert (=> mapNonEmpty!36830 m!913951))

(assert (=> b!987345 m!913931))

(assert (=> b!987345 m!913931))

(declare-fun m!913953 () Bool)

(assert (=> b!987345 m!913953))

(declare-fun m!913955 () Bool)

(assert (=> b!987344 m!913955))

(declare-fun m!913957 () Bool)

(assert (=> start!84412 m!913957))

(declare-fun m!913959 () Bool)

(assert (=> start!84412 m!913959))

(declare-fun m!913961 () Bool)

(assert (=> start!84412 m!913961))

(check-sat (not mapNonEmpty!36830) (not b!987346) (not start!84412) tp_is_empty!23199 (not b_next!19983) (not b_lambda!15005) (not b!987350) (not b!987344) b_and!32031 (not b!987345))
(check-sat b_and!32031 (not b_next!19983))
