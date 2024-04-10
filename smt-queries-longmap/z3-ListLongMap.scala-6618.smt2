; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83660 () Bool)

(assert start!83660)

(declare-fun b!977157 () Bool)

(declare-fun e!550804 () Bool)

(declare-datatypes ((List!20368 0))(
  ( (Nil!20365) (Cons!20364 (h!21526 (_ BitVec 64)) (t!28883 List!20368)) )
))
(declare-fun noDuplicate!1374 (List!20368) Bool)

(assert (=> b!977157 (= e!550804 (not (noDuplicate!1374 Nil!20365)))))

(declare-fun b!977158 () Bool)

(declare-fun res!654024 () Bool)

(assert (=> b!977158 (=> (not res!654024) (not e!550804))))

(declare-datatypes ((array!61001 0))(
  ( (array!61002 (arr!29360 (Array (_ BitVec 32) (_ BitVec 64))) (size!29839 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61001)

(assert (=> b!977158 (= res!654024 (and (bvsle #b00000000000000000000000000000000 (size!29839 _keys!1544)) (bvslt (size!29839 _keys!1544) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!35750 () Bool)

(declare-fun mapRes!35750 () Bool)

(assert (=> mapIsEmpty!35750 mapRes!35750))

(declare-fun b!977159 () Bool)

(declare-fun e!550805 () Bool)

(declare-fun tp_is_empty!22485 () Bool)

(assert (=> b!977159 (= e!550805 tp_is_empty!22485)))

(declare-fun b!977160 () Bool)

(declare-fun e!550806 () Bool)

(assert (=> b!977160 (= e!550806 (and e!550805 mapRes!35750))))

(declare-fun condMapEmpty!35750 () Bool)

(declare-datatypes ((V!34963 0))(
  ( (V!34964 (val!11293 Int)) )
))
(declare-datatypes ((ValueCell!10761 0))(
  ( (ValueCellFull!10761 (v!13854 V!34963)) (EmptyCell!10761) )
))
(declare-datatypes ((array!61003 0))(
  ( (array!61004 (arr!29361 (Array (_ BitVec 32) ValueCell!10761)) (size!29840 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61003)

(declare-fun mapDefault!35750 () ValueCell!10761)

(assert (=> b!977160 (= condMapEmpty!35750 (= (arr!29361 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10761)) mapDefault!35750)))))

(declare-fun b!977161 () Bool)

(declare-fun res!654023 () Bool)

(assert (=> b!977161 (=> (not res!654023) (not e!550804))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977161 (= res!654023 (and (= (size!29840 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29839 _keys!1544) (size!29840 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977162 () Bool)

(declare-fun e!550807 () Bool)

(assert (=> b!977162 (= e!550807 tp_is_empty!22485)))

(declare-fun res!654021 () Bool)

(assert (=> start!83660 (=> (not res!654021) (not e!550804))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83660 (= res!654021 (validMask!0 mask!1948))))

(assert (=> start!83660 e!550804))

(assert (=> start!83660 true))

(declare-fun array_inv!22697 (array!61003) Bool)

(assert (=> start!83660 (and (array_inv!22697 _values!1278) e!550806)))

(declare-fun array_inv!22698 (array!61001) Bool)

(assert (=> start!83660 (array_inv!22698 _keys!1544)))

(declare-fun b!977163 () Bool)

(declare-fun res!654022 () Bool)

(assert (=> b!977163 (=> (not res!654022) (not e!550804))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61001 (_ BitVec 32)) Bool)

(assert (=> b!977163 (= res!654022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapNonEmpty!35750 () Bool)

(declare-fun tp!68002 () Bool)

(assert (=> mapNonEmpty!35750 (= mapRes!35750 (and tp!68002 e!550807))))

(declare-fun mapRest!35750 () (Array (_ BitVec 32) ValueCell!10761))

(declare-fun mapValue!35750 () ValueCell!10761)

(declare-fun mapKey!35750 () (_ BitVec 32))

(assert (=> mapNonEmpty!35750 (= (arr!29361 _values!1278) (store mapRest!35750 mapKey!35750 mapValue!35750))))

(assert (= (and start!83660 res!654021) b!977161))

(assert (= (and b!977161 res!654023) b!977163))

(assert (= (and b!977163 res!654022) b!977158))

(assert (= (and b!977158 res!654024) b!977157))

(assert (= (and b!977160 condMapEmpty!35750) mapIsEmpty!35750))

(assert (= (and b!977160 (not condMapEmpty!35750)) mapNonEmpty!35750))

(get-info :version)

(assert (= (and mapNonEmpty!35750 ((_ is ValueCellFull!10761) mapValue!35750)) b!977162))

(assert (= (and b!977160 ((_ is ValueCellFull!10761) mapDefault!35750)) b!977159))

(assert (= start!83660 b!977160))

(declare-fun m!904521 () Bool)

(assert (=> b!977157 m!904521))

(declare-fun m!904523 () Bool)

(assert (=> start!83660 m!904523))

(declare-fun m!904525 () Bool)

(assert (=> start!83660 m!904525))

(declare-fun m!904527 () Bool)

(assert (=> start!83660 m!904527))

(declare-fun m!904529 () Bool)

(assert (=> b!977163 m!904529))

(declare-fun m!904531 () Bool)

(assert (=> mapNonEmpty!35750 m!904531))

(check-sat (not b!977163) tp_is_empty!22485 (not b!977157) (not start!83660) (not mapNonEmpty!35750))
(check-sat)
(get-model)

(declare-fun b!977193 () Bool)

(declare-fun e!550829 () Bool)

(declare-fun call!41790 () Bool)

(assert (=> b!977193 (= e!550829 call!41790)))

(declare-fun b!977194 () Bool)

(declare-fun e!550831 () Bool)

(assert (=> b!977194 (= e!550831 e!550829)))

(declare-fun c!100019 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977194 (= c!100019 (validKeyInArray!0 (select (arr!29360 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!977195 () Bool)

(declare-fun e!550830 () Bool)

(assert (=> b!977195 (= e!550829 e!550830)))

(declare-fun lt!433434 () (_ BitVec 64))

(assert (=> b!977195 (= lt!433434 (select (arr!29360 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32493 0))(
  ( (Unit!32494) )
))
(declare-fun lt!433435 () Unit!32493)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!61001 (_ BitVec 64) (_ BitVec 32)) Unit!32493)

(assert (=> b!977195 (= lt!433435 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433434 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!61001 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!977195 (arrayContainsKey!0 _keys!1544 lt!433434 #b00000000000000000000000000000000)))

(declare-fun lt!433433 () Unit!32493)

(assert (=> b!977195 (= lt!433433 lt!433435)))

(declare-fun res!654041 () Bool)

(declare-datatypes ((SeekEntryResult!9204 0))(
  ( (MissingZero!9204 (index!39187 (_ BitVec 32))) (Found!9204 (index!39188 (_ BitVec 32))) (Intermediate!9204 (undefined!10016 Bool) (index!39189 (_ BitVec 32)) (x!84555 (_ BitVec 32))) (Undefined!9204) (MissingVacant!9204 (index!39190 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!61001 (_ BitVec 32)) SeekEntryResult!9204)

(assert (=> b!977195 (= res!654041 (= (seekEntryOrOpen!0 (select (arr!29360 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9204 #b00000000000000000000000000000000)))))

(assert (=> b!977195 (=> (not res!654041) (not e!550830))))

(declare-fun b!977196 () Bool)

(assert (=> b!977196 (= e!550830 call!41790)))

(declare-fun d!116645 () Bool)

(declare-fun res!654042 () Bool)

(assert (=> d!116645 (=> res!654042 e!550831)))

(assert (=> d!116645 (= res!654042 (bvsge #b00000000000000000000000000000000 (size!29839 _keys!1544)))))

(assert (=> d!116645 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!550831)))

(declare-fun bm!41787 () Bool)

(assert (=> bm!41787 (= call!41790 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(assert (= (and d!116645 (not res!654042)) b!977194))

(assert (= (and b!977194 c!100019) b!977195))

(assert (= (and b!977194 (not c!100019)) b!977193))

(assert (= (and b!977195 res!654041) b!977196))

(assert (= (or b!977196 b!977193) bm!41787))

(declare-fun m!904545 () Bool)

(assert (=> b!977194 m!904545))

(assert (=> b!977194 m!904545))

(declare-fun m!904547 () Bool)

(assert (=> b!977194 m!904547))

(assert (=> b!977195 m!904545))

(declare-fun m!904549 () Bool)

(assert (=> b!977195 m!904549))

(declare-fun m!904551 () Bool)

(assert (=> b!977195 m!904551))

(assert (=> b!977195 m!904545))

(declare-fun m!904553 () Bool)

(assert (=> b!977195 m!904553))

(declare-fun m!904555 () Bool)

(assert (=> bm!41787 m!904555))

(assert (=> b!977163 d!116645))

(declare-fun d!116647 () Bool)

(assert (=> d!116647 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83660 d!116647))

(declare-fun d!116649 () Bool)

(assert (=> d!116649 (= (array_inv!22697 _values!1278) (bvsge (size!29840 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83660 d!116649))

(declare-fun d!116651 () Bool)

(assert (=> d!116651 (= (array_inv!22698 _keys!1544) (bvsge (size!29839 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83660 d!116651))

(declare-fun d!116653 () Bool)

(declare-fun res!654047 () Bool)

(declare-fun e!550836 () Bool)

(assert (=> d!116653 (=> res!654047 e!550836)))

(assert (=> d!116653 (= res!654047 ((_ is Nil!20365) Nil!20365))))

(assert (=> d!116653 (= (noDuplicate!1374 Nil!20365) e!550836)))

(declare-fun b!977201 () Bool)

(declare-fun e!550837 () Bool)

(assert (=> b!977201 (= e!550836 e!550837)))

(declare-fun res!654048 () Bool)

(assert (=> b!977201 (=> (not res!654048) (not e!550837))))

(declare-fun contains!5703 (List!20368 (_ BitVec 64)) Bool)

(assert (=> b!977201 (= res!654048 (not (contains!5703 (t!28883 Nil!20365) (h!21526 Nil!20365))))))

(declare-fun b!977202 () Bool)

(assert (=> b!977202 (= e!550837 (noDuplicate!1374 (t!28883 Nil!20365)))))

(assert (= (and d!116653 (not res!654047)) b!977201))

(assert (= (and b!977201 res!654048) b!977202))

(declare-fun m!904557 () Bool)

(assert (=> b!977201 m!904557))

(declare-fun m!904559 () Bool)

(assert (=> b!977202 m!904559))

(assert (=> b!977157 d!116653))

(declare-fun b!977210 () Bool)

(declare-fun e!550842 () Bool)

(assert (=> b!977210 (= e!550842 tp_is_empty!22485)))

(declare-fun mapNonEmpty!35756 () Bool)

(declare-fun mapRes!35756 () Bool)

(declare-fun tp!68008 () Bool)

(declare-fun e!550843 () Bool)

(assert (=> mapNonEmpty!35756 (= mapRes!35756 (and tp!68008 e!550843))))

(declare-fun mapValue!35756 () ValueCell!10761)

(declare-fun mapKey!35756 () (_ BitVec 32))

(declare-fun mapRest!35756 () (Array (_ BitVec 32) ValueCell!10761))

(assert (=> mapNonEmpty!35756 (= mapRest!35750 (store mapRest!35756 mapKey!35756 mapValue!35756))))

(declare-fun mapIsEmpty!35756 () Bool)

(assert (=> mapIsEmpty!35756 mapRes!35756))

(declare-fun condMapEmpty!35756 () Bool)

(declare-fun mapDefault!35756 () ValueCell!10761)

(assert (=> mapNonEmpty!35750 (= condMapEmpty!35756 (= mapRest!35750 ((as const (Array (_ BitVec 32) ValueCell!10761)) mapDefault!35756)))))

(assert (=> mapNonEmpty!35750 (= tp!68002 (and e!550842 mapRes!35756))))

(declare-fun b!977209 () Bool)

(assert (=> b!977209 (= e!550843 tp_is_empty!22485)))

(assert (= (and mapNonEmpty!35750 condMapEmpty!35756) mapIsEmpty!35756))

(assert (= (and mapNonEmpty!35750 (not condMapEmpty!35756)) mapNonEmpty!35756))

(assert (= (and mapNonEmpty!35756 ((_ is ValueCellFull!10761) mapValue!35756)) b!977209))

(assert (= (and mapNonEmpty!35750 ((_ is ValueCellFull!10761) mapDefault!35756)) b!977210))

(declare-fun m!904561 () Bool)

(assert (=> mapNonEmpty!35756 m!904561))

(check-sat (not bm!41787) tp_is_empty!22485 (not b!977201) (not b!977202) (not b!977195) (not mapNonEmpty!35756) (not b!977194))
(check-sat)
