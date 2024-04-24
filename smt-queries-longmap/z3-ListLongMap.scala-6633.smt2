; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83938 () Bool)

(assert start!83938)

(declare-fun b_free!19579 () Bool)

(declare-fun b_next!19579 () Bool)

(assert (=> start!83938 (= b_free!19579 (not b_next!19579))))

(declare-fun tp!68179 () Bool)

(declare-fun b_and!31257 () Bool)

(assert (=> start!83938 (= tp!68179 b_and!31257)))

(declare-fun b!979140 () Bool)

(declare-fun res!655006 () Bool)

(declare-fun e!552107 () Bool)

(assert (=> b!979140 (=> (not res!655006) (not e!552107))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!979140 (= res!655006 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapNonEmpty!35888 () Bool)

(declare-fun mapRes!35888 () Bool)

(declare-fun tp!68180 () Bool)

(declare-fun e!552104 () Bool)

(assert (=> mapNonEmpty!35888 (= mapRes!35888 (and tp!68180 e!552104))))

(declare-datatypes ((V!35081 0))(
  ( (V!35082 (val!11337 Int)) )
))
(declare-datatypes ((ValueCell!10805 0))(
  ( (ValueCellFull!10805 (v!13896 V!35081)) (EmptyCell!10805) )
))
(declare-datatypes ((array!61196 0))(
  ( (array!61197 (arr!29451 (Array (_ BitVec 32) ValueCell!10805)) (size!29931 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61196)

(declare-fun mapValue!35888 () ValueCell!10805)

(declare-fun mapRest!35888 () (Array (_ BitVec 32) ValueCell!10805))

(declare-fun mapKey!35888 () (_ BitVec 32))

(assert (=> mapNonEmpty!35888 (= (arr!29451 _values!1278) (store mapRest!35888 mapKey!35888 mapValue!35888))))

(declare-fun mapIsEmpty!35888 () Bool)

(assert (=> mapIsEmpty!35888 mapRes!35888))

(declare-fun b!979141 () Bool)

(declare-fun res!655005 () Bool)

(assert (=> b!979141 (=> (not res!655005) (not e!552107))))

(declare-datatypes ((array!61198 0))(
  ( (array!61199 (arr!29452 (Array (_ BitVec 32) (_ BitVec 64))) (size!29932 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61198)

(declare-datatypes ((List!20402 0))(
  ( (Nil!20399) (Cons!20398 (h!21566 (_ BitVec 64)) (t!28929 List!20402)) )
))
(declare-fun arrayNoDuplicates!0 (array!61198 (_ BitVec 32) List!20402) Bool)

(assert (=> b!979141 (= res!655005 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20399))))

(declare-fun b!979142 () Bool)

(declare-fun res!655008 () Bool)

(assert (=> b!979142 (=> (not res!655008) (not e!552107))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!979142 (= res!655008 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29932 _keys!1544))))))

(declare-fun b!979143 () Bool)

(assert (=> b!979143 (= e!552107 (not true))))

(declare-datatypes ((tuple2!14538 0))(
  ( (tuple2!14539 (_1!7280 (_ BitVec 64)) (_2!7280 V!35081)) )
))
(declare-datatypes ((List!20403 0))(
  ( (Nil!20400) (Cons!20399 (h!21567 tuple2!14538) (t!28930 List!20403)) )
))
(declare-datatypes ((ListLongMap!13237 0))(
  ( (ListLongMap!13238 (toList!6634 List!20403)) )
))
(declare-fun lt!434040 () ListLongMap!13237)

(declare-fun lt!434038 () tuple2!14538)

(declare-fun lt!434037 () tuple2!14538)

(declare-fun +!2949 (ListLongMap!13237 tuple2!14538) ListLongMap!13237)

(assert (=> b!979143 (= (+!2949 (+!2949 lt!434040 lt!434038) lt!434037) (+!2949 (+!2949 lt!434040 lt!434037) lt!434038))))

(declare-fun lt!434036 () V!35081)

(assert (=> b!979143 (= lt!434037 (tuple2!14539 (select (arr!29452 _keys!1544) from!1932) lt!434036))))

(declare-fun minValue!1220 () V!35081)

(assert (=> b!979143 (= lt!434038 (tuple2!14539 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32478 0))(
  ( (Unit!32479) )
))
(declare-fun lt!434039 () Unit!32478)

(declare-fun addCommutativeForDiffKeys!556 (ListLongMap!13237 (_ BitVec 64) V!35081 (_ BitVec 64) V!35081) Unit!32478)

(assert (=> b!979143 (= lt!434039 (addCommutativeForDiffKeys!556 lt!434040 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29452 _keys!1544) from!1932) lt!434036))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15267 (ValueCell!10805 V!35081) V!35081)

(declare-fun dynLambda!1744 (Int (_ BitVec 64)) V!35081)

(assert (=> b!979143 (= lt!434036 (get!15267 (select (arr!29451 _values!1278) from!1932) (dynLambda!1744 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35081)

(declare-fun getCurrentListMapNoExtraKeys!3382 (array!61198 array!61196 (_ BitVec 32) (_ BitVec 32) V!35081 V!35081 (_ BitVec 32) Int) ListLongMap!13237)

(assert (=> b!979143 (= lt!434040 (+!2949 (getCurrentListMapNoExtraKeys!3382 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14539 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!979144 () Bool)

(declare-fun res!655007 () Bool)

(assert (=> b!979144 (=> (not res!655007) (not e!552107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979144 (= res!655007 (validKeyInArray!0 (select (arr!29452 _keys!1544) from!1932)))))

(declare-fun res!655004 () Bool)

(assert (=> start!83938 (=> (not res!655004) (not e!552107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83938 (= res!655004 (validMask!0 mask!1948))))

(assert (=> start!83938 e!552107))

(assert (=> start!83938 true))

(declare-fun tp_is_empty!22573 () Bool)

(assert (=> start!83938 tp_is_empty!22573))

(declare-fun e!552105 () Bool)

(declare-fun array_inv!22811 (array!61196) Bool)

(assert (=> start!83938 (and (array_inv!22811 _values!1278) e!552105)))

(assert (=> start!83938 tp!68179))

(declare-fun array_inv!22812 (array!61198) Bool)

(assert (=> start!83938 (array_inv!22812 _keys!1544)))

(declare-fun b!979145 () Bool)

(declare-fun e!552106 () Bool)

(assert (=> b!979145 (= e!552105 (and e!552106 mapRes!35888))))

(declare-fun condMapEmpty!35888 () Bool)

(declare-fun mapDefault!35888 () ValueCell!10805)

(assert (=> b!979145 (= condMapEmpty!35888 (= (arr!29451 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10805)) mapDefault!35888)))))

(declare-fun b!979146 () Bool)

(declare-fun res!655009 () Bool)

(assert (=> b!979146 (=> (not res!655009) (not e!552107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61198 (_ BitVec 32)) Bool)

(assert (=> b!979146 (= res!655009 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979147 () Bool)

(assert (=> b!979147 (= e!552104 tp_is_empty!22573)))

(declare-fun b!979148 () Bool)

(declare-fun res!655003 () Bool)

(assert (=> b!979148 (=> (not res!655003) (not e!552107))))

(assert (=> b!979148 (= res!655003 (and (= (size!29931 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29932 _keys!1544) (size!29931 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979149 () Bool)

(assert (=> b!979149 (= e!552106 tp_is_empty!22573)))

(assert (= (and start!83938 res!655004) b!979148))

(assert (= (and b!979148 res!655003) b!979146))

(assert (= (and b!979146 res!655009) b!979141))

(assert (= (and b!979141 res!655005) b!979142))

(assert (= (and b!979142 res!655008) b!979144))

(assert (= (and b!979144 res!655007) b!979140))

(assert (= (and b!979140 res!655006) b!979143))

(assert (= (and b!979145 condMapEmpty!35888) mapIsEmpty!35888))

(assert (= (and b!979145 (not condMapEmpty!35888)) mapNonEmpty!35888))

(get-info :version)

(assert (= (and mapNonEmpty!35888 ((_ is ValueCellFull!10805) mapValue!35888)) b!979147))

(assert (= (and b!979145 ((_ is ValueCellFull!10805) mapDefault!35888)) b!979149))

(assert (= start!83938 b!979145))

(declare-fun b_lambda!14637 () Bool)

(assert (=> (not b_lambda!14637) (not b!979143)))

(declare-fun t!28928 () Bool)

(declare-fun tb!6377 () Bool)

(assert (=> (and start!83938 (= defaultEntry!1281 defaultEntry!1281) t!28928) tb!6377))

(declare-fun result!12751 () Bool)

(assert (=> tb!6377 (= result!12751 tp_is_empty!22573)))

(assert (=> b!979143 t!28928))

(declare-fun b_and!31259 () Bool)

(assert (= b_and!31257 (and (=> t!28928 result!12751) b_and!31259)))

(declare-fun m!906653 () Bool)

(assert (=> b!979144 m!906653))

(assert (=> b!979144 m!906653))

(declare-fun m!906655 () Bool)

(assert (=> b!979144 m!906655))

(assert (=> b!979143 m!906653))

(declare-fun m!906657 () Bool)

(assert (=> b!979143 m!906657))

(declare-fun m!906659 () Bool)

(assert (=> b!979143 m!906659))

(assert (=> b!979143 m!906659))

(declare-fun m!906661 () Bool)

(assert (=> b!979143 m!906661))

(assert (=> b!979143 m!906653))

(declare-fun m!906663 () Bool)

(assert (=> b!979143 m!906663))

(declare-fun m!906665 () Bool)

(assert (=> b!979143 m!906665))

(declare-fun m!906667 () Bool)

(assert (=> b!979143 m!906667))

(assert (=> b!979143 m!906665))

(declare-fun m!906669 () Bool)

(assert (=> b!979143 m!906669))

(assert (=> b!979143 m!906667))

(declare-fun m!906671 () Bool)

(assert (=> b!979143 m!906671))

(declare-fun m!906673 () Bool)

(assert (=> b!979143 m!906673))

(assert (=> b!979143 m!906657))

(assert (=> b!979143 m!906673))

(declare-fun m!906675 () Bool)

(assert (=> b!979143 m!906675))

(declare-fun m!906677 () Bool)

(assert (=> start!83938 m!906677))

(declare-fun m!906679 () Bool)

(assert (=> start!83938 m!906679))

(declare-fun m!906681 () Bool)

(assert (=> start!83938 m!906681))

(declare-fun m!906683 () Bool)

(assert (=> b!979141 m!906683))

(declare-fun m!906685 () Bool)

(assert (=> b!979146 m!906685))

(declare-fun m!906687 () Bool)

(assert (=> mapNonEmpty!35888 m!906687))

(check-sat (not b_next!19579) (not b!979146) (not b_lambda!14637) (not b!979144) (not mapNonEmpty!35888) (not b!979141) (not b!979143) tp_is_empty!22573 (not start!83938) b_and!31259)
(check-sat b_and!31259 (not b_next!19579))
