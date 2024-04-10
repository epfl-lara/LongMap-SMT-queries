; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84156 () Bool)

(assert start!84156)

(declare-fun b_free!19857 () Bool)

(declare-fun b_next!19857 () Bool)

(assert (=> start!84156 (= b_free!19857 (not b_next!19857))))

(declare-fun tp!69174 () Bool)

(declare-fun b_and!31791 () Bool)

(assert (=> start!84156 (= tp!69174 b_and!31791)))

(declare-fun b!984037 () Bool)

(declare-fun res!658460 () Bool)

(declare-fun e!554758 () Bool)

(assert (=> b!984037 (=> (not res!658460) (not e!554758))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35595 0))(
  ( (V!35596 (val!11530 Int)) )
))
(declare-datatypes ((ValueCell!10998 0))(
  ( (ValueCellFull!10998 (v!14092 V!35595)) (EmptyCell!10998) )
))
(declare-datatypes ((array!61899 0))(
  ( (array!61900 (arr!29807 (Array (_ BitVec 32) ValueCell!10998)) (size!30286 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61899)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61901 0))(
  ( (array!61902 (arr!29808 (Array (_ BitVec 32) (_ BitVec 64))) (size!30287 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61901)

(assert (=> b!984037 (= res!658460 (and (= (size!30286 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30287 _keys!1544) (size!30286 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!984038 () Bool)

(declare-fun e!554760 () Bool)

(declare-fun e!554757 () Bool)

(declare-fun mapRes!36467 () Bool)

(assert (=> b!984038 (= e!554760 (and e!554757 mapRes!36467))))

(declare-fun condMapEmpty!36467 () Bool)

(declare-fun mapDefault!36467 () ValueCell!10998)

(assert (=> b!984038 (= condMapEmpty!36467 (= (arr!29807 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10998)) mapDefault!36467)))))

(declare-fun b!984039 () Bool)

(declare-fun res!658456 () Bool)

(assert (=> b!984039 (=> (not res!658456) (not e!554758))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!984039 (= res!658456 (validKeyInArray!0 (select (arr!29808 _keys!1544) from!1932)))))

(declare-fun b!984040 () Bool)

(declare-fun res!658462 () Bool)

(assert (=> b!984040 (=> (not res!658462) (not e!554758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61901 (_ BitVec 32)) Bool)

(assert (=> b!984040 (= res!658462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!984041 () Bool)

(declare-fun res!658461 () Bool)

(assert (=> b!984041 (=> (not res!658461) (not e!554758))))

(declare-datatypes ((List!20636 0))(
  ( (Nil!20633) (Cons!20632 (h!21794 (_ BitVec 64)) (t!29437 List!20636)) )
))
(declare-fun arrayNoDuplicates!0 (array!61901 (_ BitVec 32) List!20636) Bool)

(assert (=> b!984041 (= res!658461 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20633))))

(declare-fun res!658458 () Bool)

(assert (=> start!84156 (=> (not res!658458) (not e!554758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84156 (= res!658458 (validMask!0 mask!1948))))

(assert (=> start!84156 e!554758))

(assert (=> start!84156 true))

(declare-fun tp_is_empty!22959 () Bool)

(assert (=> start!84156 tp_is_empty!22959))

(declare-fun array_inv!23049 (array!61899) Bool)

(assert (=> start!84156 (and (array_inv!23049 _values!1278) e!554760)))

(assert (=> start!84156 tp!69174))

(declare-fun array_inv!23050 (array!61901) Bool)

(assert (=> start!84156 (array_inv!23050 _keys!1544)))

(declare-fun b!984042 () Bool)

(assert (=> b!984042 (= e!554757 tp_is_empty!22959)))

(declare-fun mapNonEmpty!36467 () Bool)

(declare-fun tp!69175 () Bool)

(declare-fun e!554755 () Bool)

(assert (=> mapNonEmpty!36467 (= mapRes!36467 (and tp!69175 e!554755))))

(declare-fun mapRest!36467 () (Array (_ BitVec 32) ValueCell!10998))

(declare-fun mapValue!36467 () ValueCell!10998)

(declare-fun mapKey!36467 () (_ BitVec 32))

(assert (=> mapNonEmpty!36467 (= (arr!29807 _values!1278) (store mapRest!36467 mapKey!36467 mapValue!36467))))

(declare-fun b!984043 () Bool)

(assert (=> b!984043 (= e!554755 tp_is_empty!22959)))

(declare-fun b!984044 () Bool)

(declare-fun e!554756 () Bool)

(assert (=> b!984044 (= e!554756 (not true))))

(declare-datatypes ((tuple2!14744 0))(
  ( (tuple2!14745 (_1!7383 (_ BitVec 64)) (_2!7383 V!35595)) )
))
(declare-datatypes ((List!20637 0))(
  ( (Nil!20634) (Cons!20633 (h!21795 tuple2!14744) (t!29438 List!20637)) )
))
(declare-datatypes ((ListLongMap!13441 0))(
  ( (ListLongMap!13442 (toList!6736 List!20637)) )
))
(declare-fun lt!436643 () ListLongMap!13441)

(declare-fun lt!436644 () tuple2!14744)

(declare-fun lt!436642 () tuple2!14744)

(declare-fun +!3029 (ListLongMap!13441 tuple2!14744) ListLongMap!13441)

(assert (=> b!984044 (= (+!3029 (+!3029 lt!436643 lt!436644) lt!436642) (+!3029 (+!3029 lt!436643 lt!436642) lt!436644))))

(declare-fun lt!436646 () V!35595)

(assert (=> b!984044 (= lt!436642 (tuple2!14745 (select (arr!29808 _keys!1544) from!1932) lt!436646))))

(declare-fun minValue!1220 () V!35595)

(assert (=> b!984044 (= lt!436644 (tuple2!14745 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32697 0))(
  ( (Unit!32698) )
))
(declare-fun lt!436645 () Unit!32697)

(declare-fun addCommutativeForDiffKeys!657 (ListLongMap!13441 (_ BitVec 64) V!35595 (_ BitVec 64) V!35595) Unit!32697)

(assert (=> b!984044 (= lt!436645 (addCommutativeForDiffKeys!657 lt!436643 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29808 _keys!1544) from!1932) lt!436646))))

(declare-fun mapIsEmpty!36467 () Bool)

(assert (=> mapIsEmpty!36467 mapRes!36467))

(declare-fun b!984045 () Bool)

(declare-fun res!658457 () Bool)

(assert (=> b!984045 (=> (not res!658457) (not e!554758))))

(assert (=> b!984045 (= res!658457 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!984046 () Bool)

(assert (=> b!984046 (= e!554758 e!554756)))

(declare-fun res!658463 () Bool)

(assert (=> b!984046 (=> (not res!658463) (not e!554756))))

(assert (=> b!984046 (= res!658463 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!29808 _keys!1544) from!1932))))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15457 (ValueCell!10998 V!35595) V!35595)

(declare-fun dynLambda!1810 (Int (_ BitVec 64)) V!35595)

(assert (=> b!984046 (= lt!436646 (get!15457 (select (arr!29807 _values!1278) from!1932) (dynLambda!1810 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35595)

(declare-fun getCurrentListMapNoExtraKeys!3430 (array!61901 array!61899 (_ BitVec 32) (_ BitVec 32) V!35595 V!35595 (_ BitVec 32) Int) ListLongMap!13441)

(assert (=> b!984046 (= lt!436643 (getCurrentListMapNoExtraKeys!3430 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!984047 () Bool)

(declare-fun res!658459 () Bool)

(assert (=> b!984047 (=> (not res!658459) (not e!554758))))

(assert (=> b!984047 (= res!658459 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30287 _keys!1544))))))

(assert (= (and start!84156 res!658458) b!984037))

(assert (= (and b!984037 res!658460) b!984040))

(assert (= (and b!984040 res!658462) b!984041))

(assert (= (and b!984041 res!658461) b!984047))

(assert (= (and b!984047 res!658459) b!984039))

(assert (= (and b!984039 res!658456) b!984045))

(assert (= (and b!984045 res!658457) b!984046))

(assert (= (and b!984046 res!658463) b!984044))

(assert (= (and b!984038 condMapEmpty!36467) mapIsEmpty!36467))

(assert (= (and b!984038 (not condMapEmpty!36467)) mapNonEmpty!36467))

(get-info :version)

(assert (= (and mapNonEmpty!36467 ((_ is ValueCellFull!10998) mapValue!36467)) b!984043))

(assert (= (and b!984038 ((_ is ValueCellFull!10998) mapDefault!36467)) b!984042))

(assert (= start!84156 b!984038))

(declare-fun b_lambda!14889 () Bool)

(assert (=> (not b_lambda!14889) (not b!984046)))

(declare-fun t!29436 () Bool)

(declare-fun tb!6651 () Bool)

(assert (=> (and start!84156 (= defaultEntry!1281 defaultEntry!1281) t!29436) tb!6651))

(declare-fun result!13291 () Bool)

(assert (=> tb!6651 (= result!13291 tp_is_empty!22959)))

(assert (=> b!984046 t!29436))

(declare-fun b_and!31793 () Bool)

(assert (= b_and!31791 (and (=> t!29436 result!13291) b_and!31793)))

(declare-fun m!911135 () Bool)

(assert (=> b!984039 m!911135))

(assert (=> b!984039 m!911135))

(declare-fun m!911137 () Bool)

(assert (=> b!984039 m!911137))

(assert (=> b!984044 m!911135))

(declare-fun m!911139 () Bool)

(assert (=> b!984044 m!911139))

(declare-fun m!911141 () Bool)

(assert (=> b!984044 m!911141))

(assert (=> b!984044 m!911141))

(declare-fun m!911143 () Bool)

(assert (=> b!984044 m!911143))

(assert (=> b!984044 m!911139))

(declare-fun m!911145 () Bool)

(assert (=> b!984044 m!911145))

(assert (=> b!984044 m!911135))

(declare-fun m!911147 () Bool)

(assert (=> b!984044 m!911147))

(assert (=> b!984046 m!911135))

(declare-fun m!911149 () Bool)

(assert (=> b!984046 m!911149))

(declare-fun m!911151 () Bool)

(assert (=> b!984046 m!911151))

(declare-fun m!911153 () Bool)

(assert (=> b!984046 m!911153))

(assert (=> b!984046 m!911149))

(assert (=> b!984046 m!911153))

(declare-fun m!911155 () Bool)

(assert (=> b!984046 m!911155))

(declare-fun m!911157 () Bool)

(assert (=> b!984040 m!911157))

(declare-fun m!911159 () Bool)

(assert (=> start!84156 m!911159))

(declare-fun m!911161 () Bool)

(assert (=> start!84156 m!911161))

(declare-fun m!911163 () Bool)

(assert (=> start!84156 m!911163))

(declare-fun m!911165 () Bool)

(assert (=> b!984041 m!911165))

(declare-fun m!911167 () Bool)

(assert (=> mapNonEmpty!36467 m!911167))

(check-sat (not b!984040) (not b_next!19857) (not b!984041) (not b_lambda!14889) (not start!84156) (not b!984039) tp_is_empty!22959 b_and!31793 (not b!984046) (not mapNonEmpty!36467) (not b!984044))
(check-sat b_and!31793 (not b_next!19857))
