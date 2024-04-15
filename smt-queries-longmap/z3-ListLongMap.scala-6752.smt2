; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84642 () Bool)

(assert start!84642)

(declare-fun b_free!20071 () Bool)

(declare-fun b_next!20071 () Bool)

(assert (=> start!84642 (= b_free!20071 (not b_next!20071))))

(declare-fun tp!70008 () Bool)

(declare-fun b_and!32187 () Bool)

(assert (=> start!84642 (= tp!70008 b_and!32187)))

(declare-fun b!989856 () Bool)

(declare-fun res!661959 () Bool)

(declare-fun e!558142 () Bool)

(assert (=> b!989856 (=> (not res!661959) (not e!558142))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!62468 0))(
  ( (array!62469 (arr!30086 (Array (_ BitVec 32) (_ BitVec 64))) (size!30567 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62468)

(assert (=> b!989856 (= res!661959 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30567 _keys!1544))))))

(declare-fun b!989857 () Bool)

(declare-fun e!558140 () Bool)

(declare-fun tp_is_empty!23287 () Bool)

(assert (=> b!989857 (= e!558140 tp_is_empty!23287)))

(declare-fun b!989858 () Bool)

(declare-fun e!558141 () Bool)

(declare-datatypes ((V!36033 0))(
  ( (V!36034 (val!11694 Int)) )
))
(declare-datatypes ((ValueCell!11162 0))(
  ( (ValueCellFull!11162 (v!14263 V!36033)) (EmptyCell!11162) )
))
(declare-datatypes ((array!62470 0))(
  ( (array!62471 (arr!30087 (Array (_ BitVec 32) ValueCell!11162)) (size!30568 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62470)

(assert (=> b!989858 (= e!558141 (not (bvslt from!1932 (size!30568 _values!1278))))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!36033)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!36033)

(declare-fun defaultEntry!1281 () Int)

(declare-datatypes ((tuple2!14988 0))(
  ( (tuple2!14989 (_1!7505 (_ BitVec 64)) (_2!7505 V!36033)) )
))
(declare-datatypes ((List!20871 0))(
  ( (Nil!20868) (Cons!20867 (h!22029 tuple2!14988) (t!29829 List!20871)) )
))
(declare-datatypes ((ListLongMap!13675 0))(
  ( (ListLongMap!13676 (toList!6853 List!20871)) )
))
(declare-fun lt!438986 () ListLongMap!13675)

(declare-fun getCurrentListMap!3823 (array!62468 array!62470 (_ BitVec 32) (_ BitVec 32) V!36033 V!36033 (_ BitVec 32) Int) ListLongMap!13675)

(assert (=> b!989858 (= lt!438986 (getCurrentListMap!3823 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun lt!438984 () ListLongMap!13675)

(declare-fun lt!438985 () tuple2!14988)

(declare-fun lt!438987 () tuple2!14988)

(declare-fun +!3116 (ListLongMap!13675 tuple2!14988) ListLongMap!13675)

(assert (=> b!989858 (= (+!3116 (+!3116 lt!438984 lt!438985) lt!438987) (+!3116 (+!3116 lt!438984 lt!438987) lt!438985))))

(declare-fun lt!438983 () V!36033)

(assert (=> b!989858 (= lt!438987 (tuple2!14989 (select (arr!30086 _keys!1544) from!1932) lt!438983))))

(assert (=> b!989858 (= lt!438985 (tuple2!14989 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32725 0))(
  ( (Unit!32726) )
))
(declare-fun lt!438988 () Unit!32725)

(declare-fun addCommutativeForDiffKeys!710 (ListLongMap!13675 (_ BitVec 64) V!36033 (_ BitVec 64) V!36033) Unit!32725)

(assert (=> b!989858 (= lt!438988 (addCommutativeForDiffKeys!710 lt!438984 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30086 _keys!1544) from!1932) lt!438983))))

(declare-fun mapIsEmpty!36979 () Bool)

(declare-fun mapRes!36979 () Bool)

(assert (=> mapIsEmpty!36979 mapRes!36979))

(declare-fun b!989859 () Bool)

(declare-fun res!661963 () Bool)

(assert (=> b!989859 (=> (not res!661963) (not e!558142))))

(declare-datatypes ((List!20872 0))(
  ( (Nil!20869) (Cons!20868 (h!22030 (_ BitVec 64)) (t!29830 List!20872)) )
))
(declare-fun arrayNoDuplicates!0 (array!62468 (_ BitVec 32) List!20872) Bool)

(assert (=> b!989859 (= res!661963 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20869))))

(declare-fun b!989860 () Bool)

(declare-fun e!558139 () Bool)

(declare-fun e!558143 () Bool)

(assert (=> b!989860 (= e!558139 (and e!558143 mapRes!36979))))

(declare-fun condMapEmpty!36979 () Bool)

(declare-fun mapDefault!36979 () ValueCell!11162)

(assert (=> b!989860 (= condMapEmpty!36979 (= (arr!30087 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11162)) mapDefault!36979)))))

(declare-fun mapNonEmpty!36979 () Bool)

(declare-fun tp!70009 () Bool)

(assert (=> mapNonEmpty!36979 (= mapRes!36979 (and tp!70009 e!558140))))

(declare-fun mapRest!36979 () (Array (_ BitVec 32) ValueCell!11162))

(declare-fun mapKey!36979 () (_ BitVec 32))

(declare-fun mapValue!36979 () ValueCell!11162)

(assert (=> mapNonEmpty!36979 (= (arr!30087 _values!1278) (store mapRest!36979 mapKey!36979 mapValue!36979))))

(declare-fun b!989862 () Bool)

(assert (=> b!989862 (= e!558142 e!558141)))

(declare-fun res!661956 () Bool)

(assert (=> b!989862 (=> (not res!661956) (not e!558141))))

(assert (=> b!989862 (= res!661956 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 (select (arr!30086 _keys!1544) from!1932))))))

(declare-fun get!15632 (ValueCell!11162 V!36033) V!36033)

(declare-fun dynLambda!1862 (Int (_ BitVec 64)) V!36033)

(assert (=> b!989862 (= lt!438983 (get!15632 (select (arr!30087 _values!1278) from!1932) (dynLambda!1862 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun getCurrentListMapNoExtraKeys!3553 (array!62468 array!62470 (_ BitVec 32) (_ BitVec 32) V!36033 V!36033 (_ BitVec 32) Int) ListLongMap!13675)

(assert (=> b!989862 (= lt!438984 (getCurrentListMapNoExtraKeys!3553 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!989863 () Bool)

(assert (=> b!989863 (= e!558143 tp_is_empty!23287)))

(declare-fun b!989864 () Bool)

(declare-fun res!661960 () Bool)

(assert (=> b!989864 (=> (not res!661960) (not e!558142))))

(assert (=> b!989864 (= res!661960 (and (= (size!30568 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30567 _keys!1544) (size!30568 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!989865 () Bool)

(declare-fun res!661962 () Bool)

(assert (=> b!989865 (=> (not res!661962) (not e!558142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!989865 (= res!661962 (validKeyInArray!0 (select (arr!30086 _keys!1544) from!1932)))))

(declare-fun b!989866 () Bool)

(declare-fun res!661957 () Bool)

(assert (=> b!989866 (=> (not res!661957) (not e!558142))))

(assert (=> b!989866 (= res!661957 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!661961 () Bool)

(assert (=> start!84642 (=> (not res!661961) (not e!558142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84642 (= res!661961 (validMask!0 mask!1948))))

(assert (=> start!84642 e!558142))

(assert (=> start!84642 true))

(assert (=> start!84642 tp_is_empty!23287))

(declare-fun array_inv!23249 (array!62470) Bool)

(assert (=> start!84642 (and (array_inv!23249 _values!1278) e!558139)))

(assert (=> start!84642 tp!70008))

(declare-fun array_inv!23250 (array!62468) Bool)

(assert (=> start!84642 (array_inv!23250 _keys!1544)))

(declare-fun b!989861 () Bool)

(declare-fun res!661958 () Bool)

(assert (=> b!989861 (=> (not res!661958) (not e!558142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62468 (_ BitVec 32)) Bool)

(assert (=> b!989861 (= res!661958 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!84642 res!661961) b!989864))

(assert (= (and b!989864 res!661960) b!989861))

(assert (= (and b!989861 res!661958) b!989859))

(assert (= (and b!989859 res!661963) b!989856))

(assert (= (and b!989856 res!661959) b!989865))

(assert (= (and b!989865 res!661962) b!989866))

(assert (= (and b!989866 res!661957) b!989862))

(assert (= (and b!989862 res!661956) b!989858))

(assert (= (and b!989860 condMapEmpty!36979) mapIsEmpty!36979))

(assert (= (and b!989860 (not condMapEmpty!36979)) mapNonEmpty!36979))

(get-info :version)

(assert (= (and mapNonEmpty!36979 ((_ is ValueCellFull!11162) mapValue!36979)) b!989857))

(assert (= (and b!989860 ((_ is ValueCellFull!11162) mapDefault!36979)) b!989863))

(assert (= start!84642 b!989860))

(declare-fun b_lambda!15133 () Bool)

(assert (=> (not b_lambda!15133) (not b!989862)))

(declare-fun t!29828 () Bool)

(declare-fun tb!6809 () Bool)

(assert (=> (and start!84642 (= defaultEntry!1281 defaultEntry!1281) t!29828) tb!6809))

(declare-fun result!13627 () Bool)

(assert (=> tb!6809 (= result!13627 tp_is_empty!23287)))

(assert (=> b!989862 t!29828))

(declare-fun b_and!32189 () Bool)

(assert (= b_and!32187 (and (=> t!29828 result!13627) b_and!32189)))

(declare-fun m!916737 () Bool)

(assert (=> b!989862 m!916737))

(declare-fun m!916739 () Bool)

(assert (=> b!989862 m!916739))

(declare-fun m!916741 () Bool)

(assert (=> b!989862 m!916741))

(declare-fun m!916743 () Bool)

(assert (=> b!989862 m!916743))

(assert (=> b!989862 m!916739))

(assert (=> b!989862 m!916743))

(declare-fun m!916745 () Bool)

(assert (=> b!989862 m!916745))

(declare-fun m!916747 () Bool)

(assert (=> start!84642 m!916747))

(declare-fun m!916749 () Bool)

(assert (=> start!84642 m!916749))

(declare-fun m!916751 () Bool)

(assert (=> start!84642 m!916751))

(declare-fun m!916753 () Bool)

(assert (=> b!989861 m!916753))

(declare-fun m!916755 () Bool)

(assert (=> b!989859 m!916755))

(declare-fun m!916757 () Bool)

(assert (=> mapNonEmpty!36979 m!916757))

(assert (=> b!989858 m!916737))

(declare-fun m!916759 () Bool)

(assert (=> b!989858 m!916759))

(declare-fun m!916761 () Bool)

(assert (=> b!989858 m!916761))

(declare-fun m!916763 () Bool)

(assert (=> b!989858 m!916763))

(assert (=> b!989858 m!916761))

(assert (=> b!989858 m!916737))

(declare-fun m!916765 () Bool)

(assert (=> b!989858 m!916765))

(declare-fun m!916767 () Bool)

(assert (=> b!989858 m!916767))

(declare-fun m!916769 () Bool)

(assert (=> b!989858 m!916769))

(assert (=> b!989858 m!916765))

(assert (=> b!989865 m!916737))

(assert (=> b!989865 m!916737))

(declare-fun m!916771 () Bool)

(assert (=> b!989865 m!916771))

(check-sat (not b!989859) b_and!32189 (not b!989865) (not b!989858) (not b!989861) tp_is_empty!23287 (not mapNonEmpty!36979) (not start!84642) (not b_next!20071) (not b!989862) (not b_lambda!15133))
(check-sat b_and!32189 (not b_next!20071))
