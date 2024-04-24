; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132032 () Bool)

(assert start!132032)

(declare-fun mapNonEmpty!58153 () Bool)

(declare-fun mapRes!58153 () Bool)

(declare-fun tp!110680 () Bool)

(declare-fun e!859035 () Bool)

(assert (=> mapNonEmpty!58153 (= mapRes!58153 (and tp!110680 e!859035))))

(declare-datatypes ((V!58629 0))(
  ( (V!58630 (val!18897 Int)) )
))
(declare-datatypes ((ValueCell!17909 0))(
  ( (ValueCellFull!17909 (v!21689 V!58629)) (EmptyCell!17909) )
))
(declare-fun mapValue!58153 () ValueCell!17909)

(declare-datatypes ((array!102632 0))(
  ( (array!102633 (arr!49514 (Array (_ BitVec 32) ValueCell!17909)) (size!50065 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102632)

(declare-fun mapKey!58153 () (_ BitVec 32))

(declare-fun mapRest!58153 () (Array (_ BitVec 32) ValueCell!17909))

(assert (=> mapNonEmpty!58153 (= (arr!49514 _values!470) (store mapRest!58153 mapKey!58153 mapValue!58153))))

(declare-fun b!1544125 () Bool)

(declare-fun res!1058964 () Bool)

(declare-fun e!859038 () Bool)

(assert (=> b!1544125 (=> (not res!1058964) (not e!859038))))

(declare-datatypes ((array!102634 0))(
  ( (array!102635 (arr!49515 (Array (_ BitVec 32) (_ BitVec 64))) (size!50066 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102634)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1544125 (= res!1058964 (and (= (size!50065 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50066 _keys!618) (size!50065 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544126 () Bool)

(declare-fun e!859039 () Bool)

(declare-fun tp_is_empty!37639 () Bool)

(assert (=> b!1544126 (= e!859039 tp_is_empty!37639)))

(declare-fun b!1544127 () Bool)

(assert (=> b!1544127 (= e!859035 tp_is_empty!37639)))

(declare-fun mapIsEmpty!58153 () Bool)

(assert (=> mapIsEmpty!58153 mapRes!58153))

(declare-fun res!1058962 () Bool)

(assert (=> start!132032 (=> (not res!1058962) (not e!859038))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132032 (= res!1058962 (validMask!0 mask!926))))

(assert (=> start!132032 e!859038))

(assert (=> start!132032 true))

(declare-fun e!859037 () Bool)

(declare-fun array_inv!38787 (array!102632) Bool)

(assert (=> start!132032 (and (array_inv!38787 _values!470) e!859037)))

(declare-fun array_inv!38788 (array!102634) Bool)

(assert (=> start!132032 (array_inv!38788 _keys!618)))

(declare-fun b!1544128 () Bool)

(assert (=> b!1544128 (= e!859037 (and e!859039 mapRes!58153))))

(declare-fun condMapEmpty!58153 () Bool)

(declare-fun mapDefault!58153 () ValueCell!17909)

(assert (=> b!1544128 (= condMapEmpty!58153 (= (arr!49514 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17909)) mapDefault!58153)))))

(declare-fun b!1544129 () Bool)

(declare-fun res!1058963 () Bool)

(assert (=> b!1544129 (=> (not res!1058963) (not e!859038))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102634 (_ BitVec 32)) Bool)

(assert (=> b!1544129 (= res!1058963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544130 () Bool)

(assert (=> b!1544130 (= e!859038 (and (bvsle #b00000000000000000000000000000000 (size!50066 _keys!618)) (bvsge (size!50066 _keys!618) #b01111111111111111111111111111111)))))

(assert (= (and start!132032 res!1058962) b!1544125))

(assert (= (and b!1544125 res!1058964) b!1544129))

(assert (= (and b!1544129 res!1058963) b!1544130))

(assert (= (and b!1544128 condMapEmpty!58153) mapIsEmpty!58153))

(assert (= (and b!1544128 (not condMapEmpty!58153)) mapNonEmpty!58153))

(get-info :version)

(assert (= (and mapNonEmpty!58153 ((_ is ValueCellFull!17909) mapValue!58153)) b!1544127))

(assert (= (and b!1544128 ((_ is ValueCellFull!17909) mapDefault!58153)) b!1544126))

(assert (= start!132032 b!1544128))

(declare-fun m!1425849 () Bool)

(assert (=> mapNonEmpty!58153 m!1425849))

(declare-fun m!1425851 () Bool)

(assert (=> start!132032 m!1425851))

(declare-fun m!1425853 () Bool)

(assert (=> start!132032 m!1425853))

(declare-fun m!1425855 () Bool)

(assert (=> start!132032 m!1425855))

(declare-fun m!1425857 () Bool)

(assert (=> b!1544129 m!1425857))

(check-sat (not start!132032) (not b!1544129) (not mapNonEmpty!58153) tp_is_empty!37639)
(check-sat)
(get-model)

(declare-fun d!161405 () Bool)

(assert (=> d!161405 (= (validMask!0 mask!926) (and (or (= mask!926 #b00000000000000000000000000000111) (= mask!926 #b00000000000000000000000000001111) (= mask!926 #b00000000000000000000000000011111) (= mask!926 #b00000000000000000000000000111111) (= mask!926 #b00000000000000000000000001111111) (= mask!926 #b00000000000000000000000011111111) (= mask!926 #b00000000000000000000000111111111) (= mask!926 #b00000000000000000000001111111111) (= mask!926 #b00000000000000000000011111111111) (= mask!926 #b00000000000000000000111111111111) (= mask!926 #b00000000000000000001111111111111) (= mask!926 #b00000000000000000011111111111111) (= mask!926 #b00000000000000000111111111111111) (= mask!926 #b00000000000000001111111111111111) (= mask!926 #b00000000000000011111111111111111) (= mask!926 #b00000000000000111111111111111111) (= mask!926 #b00000000000001111111111111111111) (= mask!926 #b00000000000011111111111111111111) (= mask!926 #b00000000000111111111111111111111) (= mask!926 #b00000000001111111111111111111111) (= mask!926 #b00000000011111111111111111111111) (= mask!926 #b00000000111111111111111111111111) (= mask!926 #b00000001111111111111111111111111) (= mask!926 #b00000011111111111111111111111111) (= mask!926 #b00000111111111111111111111111111) (= mask!926 #b00001111111111111111111111111111) (= mask!926 #b00011111111111111111111111111111) (= mask!926 #b00111111111111111111111111111111)) (bvsle mask!926 #b00111111111111111111111111111111)))))

(assert (=> start!132032 d!161405))

(declare-fun d!161407 () Bool)

(assert (=> d!161407 (= (array_inv!38787 _values!470) (bvsge (size!50065 _values!470) #b00000000000000000000000000000000))))

(assert (=> start!132032 d!161407))

(declare-fun d!161409 () Bool)

(assert (=> d!161409 (= (array_inv!38788 _keys!618) (bvsge (size!50066 _keys!618) #b00000000000000000000000000000000))))

(assert (=> start!132032 d!161409))

(declare-fun b!1544175 () Bool)

(declare-fun e!859078 () Bool)

(declare-fun e!859077 () Bool)

(assert (=> b!1544175 (= e!859078 e!859077)))

(declare-fun c!142102 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1544175 (= c!142102 (validKeyInArray!0 (select (arr!49515 _keys!618) #b00000000000000000000000000000000)))))

(declare-fun b!1544176 () Bool)

(declare-fun call!68838 () Bool)

(assert (=> b!1544176 (= e!859077 call!68838)))

(declare-fun d!161411 () Bool)

(declare-fun res!1058987 () Bool)

(assert (=> d!161411 (=> res!1058987 e!859078)))

(assert (=> d!161411 (= res!1058987 (bvsge #b00000000000000000000000000000000 (size!50066 _keys!618)))))

(assert (=> d!161411 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926) e!859078)))

(declare-fun b!1544177 () Bool)

(declare-fun e!859076 () Bool)

(assert (=> b!1544177 (= e!859077 e!859076)))

(declare-fun lt!666620 () (_ BitVec 64))

(assert (=> b!1544177 (= lt!666620 (select (arr!49515 _keys!618) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51417 0))(
  ( (Unit!51418) )
))
(declare-fun lt!666619 () Unit!51417)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!102634 (_ BitVec 64) (_ BitVec 32)) Unit!51417)

(assert (=> b!1544177 (= lt!666619 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!618 lt!666620 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!102634 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1544177 (arrayContainsKey!0 _keys!618 lt!666620 #b00000000000000000000000000000000)))

(declare-fun lt!666621 () Unit!51417)

(assert (=> b!1544177 (= lt!666621 lt!666619)))

(declare-fun res!1058988 () Bool)

(declare-datatypes ((SeekEntryResult!13457 0))(
  ( (MissingZero!13457 (index!56226 (_ BitVec 32))) (Found!13457 (index!56227 (_ BitVec 32))) (Intermediate!13457 (undefined!14269 Bool) (index!56228 (_ BitVec 32)) (x!138368 (_ BitVec 32))) (Undefined!13457) (MissingVacant!13457 (index!56229 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!102634 (_ BitVec 32)) SeekEntryResult!13457)

(assert (=> b!1544177 (= res!1058988 (= (seekEntryOrOpen!0 (select (arr!49515 _keys!618) #b00000000000000000000000000000000) _keys!618 mask!926) (Found!13457 #b00000000000000000000000000000000)))))

(assert (=> b!1544177 (=> (not res!1058988) (not e!859076))))

(declare-fun bm!68835 () Bool)

(assert (=> bm!68835 (= call!68838 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!618 mask!926))))

(declare-fun b!1544178 () Bool)

(assert (=> b!1544178 (= e!859076 call!68838)))

(assert (= (and d!161411 (not res!1058987)) b!1544175))

(assert (= (and b!1544175 c!142102) b!1544177))

(assert (= (and b!1544175 (not c!142102)) b!1544176))

(assert (= (and b!1544177 res!1058988) b!1544178))

(assert (= (or b!1544178 b!1544176) bm!68835))

(declare-fun m!1425879 () Bool)

(assert (=> b!1544175 m!1425879))

(assert (=> b!1544175 m!1425879))

(declare-fun m!1425881 () Bool)

(assert (=> b!1544175 m!1425881))

(assert (=> b!1544177 m!1425879))

(declare-fun m!1425883 () Bool)

(assert (=> b!1544177 m!1425883))

(declare-fun m!1425885 () Bool)

(assert (=> b!1544177 m!1425885))

(assert (=> b!1544177 m!1425879))

(declare-fun m!1425887 () Bool)

(assert (=> b!1544177 m!1425887))

(declare-fun m!1425889 () Bool)

(assert (=> bm!68835 m!1425889))

(assert (=> b!1544129 d!161411))

(declare-fun mapNonEmpty!58162 () Bool)

(declare-fun mapRes!58162 () Bool)

(declare-fun tp!110689 () Bool)

(declare-fun e!859084 () Bool)

(assert (=> mapNonEmpty!58162 (= mapRes!58162 (and tp!110689 e!859084))))

(declare-fun mapKey!58162 () (_ BitVec 32))

(declare-fun mapValue!58162 () ValueCell!17909)

(declare-fun mapRest!58162 () (Array (_ BitVec 32) ValueCell!17909))

(assert (=> mapNonEmpty!58162 (= mapRest!58153 (store mapRest!58162 mapKey!58162 mapValue!58162))))

(declare-fun b!1544185 () Bool)

(assert (=> b!1544185 (= e!859084 tp_is_empty!37639)))

(declare-fun mapIsEmpty!58162 () Bool)

(assert (=> mapIsEmpty!58162 mapRes!58162))

(declare-fun condMapEmpty!58162 () Bool)

(declare-fun mapDefault!58162 () ValueCell!17909)

(assert (=> mapNonEmpty!58153 (= condMapEmpty!58162 (= mapRest!58153 ((as const (Array (_ BitVec 32) ValueCell!17909)) mapDefault!58162)))))

(declare-fun e!859083 () Bool)

(assert (=> mapNonEmpty!58153 (= tp!110680 (and e!859083 mapRes!58162))))

(declare-fun b!1544186 () Bool)

(assert (=> b!1544186 (= e!859083 tp_is_empty!37639)))

(assert (= (and mapNonEmpty!58153 condMapEmpty!58162) mapIsEmpty!58162))

(assert (= (and mapNonEmpty!58153 (not condMapEmpty!58162)) mapNonEmpty!58162))

(assert (= (and mapNonEmpty!58162 ((_ is ValueCellFull!17909) mapValue!58162)) b!1544185))

(assert (= (and mapNonEmpty!58153 ((_ is ValueCellFull!17909) mapDefault!58162)) b!1544186))

(declare-fun m!1425891 () Bool)

(assert (=> mapNonEmpty!58162 m!1425891))

(check-sat (not bm!68835) (not b!1544175) (not mapNonEmpty!58162) tp_is_empty!37639 (not b!1544177))
(check-sat)
