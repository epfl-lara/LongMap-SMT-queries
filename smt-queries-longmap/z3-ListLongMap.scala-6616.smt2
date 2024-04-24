; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83798 () Bool)

(assert start!83798)

(declare-fun res!654286 () Bool)

(declare-fun e!551253 () Bool)

(assert (=> start!83798 (=> (not res!654286) (not e!551253))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83798 (= res!654286 (validMask!0 mask!1948))))

(assert (=> start!83798 e!551253))

(assert (=> start!83798 true))

(declare-datatypes ((V!34945 0))(
  ( (V!34946 (val!11286 Int)) )
))
(declare-datatypes ((ValueCell!10754 0))(
  ( (ValueCellFull!10754 (v!13844 V!34945)) (EmptyCell!10754) )
))
(declare-datatypes ((array!61008 0))(
  ( (array!61009 (arr!29361 (Array (_ BitVec 32) ValueCell!10754)) (size!29841 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61008)

(declare-fun e!551252 () Bool)

(declare-fun array_inv!22755 (array!61008) Bool)

(assert (=> start!83798 (and (array_inv!22755 _values!1278) e!551252)))

(declare-datatypes ((array!61010 0))(
  ( (array!61011 (arr!29362 (Array (_ BitVec 32) (_ BitVec 64))) (size!29842 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61010)

(declare-fun array_inv!22756 (array!61010) Bool)

(assert (=> start!83798 (array_inv!22756 _keys!1544)))

(declare-fun mapNonEmpty!35723 () Bool)

(declare-fun mapRes!35723 () Bool)

(declare-fun tp!67976 () Bool)

(declare-fun e!551250 () Bool)

(assert (=> mapNonEmpty!35723 (= mapRes!35723 (and tp!67976 e!551250))))

(declare-fun mapValue!35723 () ValueCell!10754)

(declare-fun mapKey!35723 () (_ BitVec 32))

(declare-fun mapRest!35723 () (Array (_ BitVec 32) ValueCell!10754))

(assert (=> mapNonEmpty!35723 (= (arr!29361 _values!1278) (store mapRest!35723 mapKey!35723 mapValue!35723))))

(declare-fun b!977889 () Bool)

(declare-fun e!551251 () Bool)

(assert (=> b!977889 (= e!551252 (and e!551251 mapRes!35723))))

(declare-fun condMapEmpty!35723 () Bool)

(declare-fun mapDefault!35723 () ValueCell!10754)

(assert (=> b!977889 (= condMapEmpty!35723 (= (arr!29361 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10754)) mapDefault!35723)))))

(declare-fun b!977890 () Bool)

(declare-fun res!654287 () Bool)

(assert (=> b!977890 (=> (not res!654287) (not e!551253))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!977890 (= res!654287 (and (= (size!29841 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29842 _keys!1544) (size!29841 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!977891 () Bool)

(assert (=> b!977891 (= e!551253 (bvsgt #b00000000000000000000000000000000 (size!29842 _keys!1544)))))

(declare-fun b!977892 () Bool)

(declare-fun tp_is_empty!22471 () Bool)

(assert (=> b!977892 (= e!551251 tp_is_empty!22471)))

(declare-fun b!977893 () Bool)

(assert (=> b!977893 (= e!551250 tp_is_empty!22471)))

(declare-fun mapIsEmpty!35723 () Bool)

(assert (=> mapIsEmpty!35723 mapRes!35723))

(declare-fun b!977894 () Bool)

(declare-fun res!654285 () Bool)

(assert (=> b!977894 (=> (not res!654285) (not e!551253))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61010 (_ BitVec 32)) Bool)

(assert (=> b!977894 (= res!654285 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(assert (= (and start!83798 res!654286) b!977890))

(assert (= (and b!977890 res!654287) b!977894))

(assert (= (and b!977894 res!654285) b!977891))

(assert (= (and b!977889 condMapEmpty!35723) mapIsEmpty!35723))

(assert (= (and b!977889 (not condMapEmpty!35723)) mapNonEmpty!35723))

(get-info :version)

(assert (= (and mapNonEmpty!35723 ((_ is ValueCellFull!10754) mapValue!35723)) b!977893))

(assert (= (and b!977889 ((_ is ValueCellFull!10754) mapDefault!35723)) b!977892))

(assert (= start!83798 b!977889))

(declare-fun m!905715 () Bool)

(assert (=> start!83798 m!905715))

(declare-fun m!905717 () Bool)

(assert (=> start!83798 m!905717))

(declare-fun m!905719 () Bool)

(assert (=> start!83798 m!905719))

(declare-fun m!905721 () Bool)

(assert (=> mapNonEmpty!35723 m!905721))

(declare-fun m!905723 () Bool)

(assert (=> b!977894 m!905723))

(check-sat (not b!977894) (not start!83798) (not mapNonEmpty!35723) tp_is_empty!22471)
(check-sat)
(get-model)

(declare-fun b!977939 () Bool)

(declare-fun e!551293 () Bool)

(declare-fun call!41829 () Bool)

(assert (=> b!977939 (= e!551293 call!41829)))

(declare-fun b!977940 () Bool)

(declare-fun e!551292 () Bool)

(declare-fun e!551291 () Bool)

(assert (=> b!977940 (= e!551292 e!551291)))

(declare-fun c!100295 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!977940 (= c!100295 (validKeyInArray!0 (select (arr!29362 _keys!1544) #b00000000000000000000000000000000)))))

(declare-fun b!977941 () Bool)

(assert (=> b!977941 (= e!551291 call!41829)))

(declare-fun bm!41826 () Bool)

(assert (=> bm!41826 (= call!41829 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1544 mask!1948))))

(declare-fun d!116947 () Bool)

(declare-fun res!654311 () Bool)

(assert (=> d!116947 (=> res!654311 e!551292)))

(assert (=> d!116947 (= res!654311 (bvsge #b00000000000000000000000000000000 (size!29842 _keys!1544)))))

(assert (=> d!116947 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948) e!551292)))

(declare-fun b!977942 () Bool)

(assert (=> b!977942 (= e!551291 e!551293)))

(declare-fun lt!433776 () (_ BitVec 64))

(assert (=> b!977942 (= lt!433776 (select (arr!29362 _keys!1544) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32458 0))(
  ( (Unit!32459) )
))
(declare-fun lt!433778 () Unit!32458)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!61010 (_ BitVec 64) (_ BitVec 32)) Unit!32458)

(assert (=> b!977942 (= lt!433778 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1544 lt!433776 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!61010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!977942 (arrayContainsKey!0 _keys!1544 lt!433776 #b00000000000000000000000000000000)))

(declare-fun lt!433777 () Unit!32458)

(assert (=> b!977942 (= lt!433777 lt!433778)))

(declare-fun res!654310 () Bool)

(declare-datatypes ((SeekEntryResult!9157 0))(
  ( (MissingZero!9157 (index!38999 (_ BitVec 32))) (Found!9157 (index!39000 (_ BitVec 32))) (Intermediate!9157 (undefined!9969 Bool) (index!39001 (_ BitVec 32)) (x!84502 (_ BitVec 32))) (Undefined!9157) (MissingVacant!9157 (index!39002 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!61010 (_ BitVec 32)) SeekEntryResult!9157)

(assert (=> b!977942 (= res!654310 (= (seekEntryOrOpen!0 (select (arr!29362 _keys!1544) #b00000000000000000000000000000000) _keys!1544 mask!1948) (Found!9157 #b00000000000000000000000000000000)))))

(assert (=> b!977942 (=> (not res!654310) (not e!551293))))

(assert (= (and d!116947 (not res!654311)) b!977940))

(assert (= (and b!977940 c!100295) b!977942))

(assert (= (and b!977940 (not c!100295)) b!977941))

(assert (= (and b!977942 res!654310) b!977939))

(assert (= (or b!977939 b!977941) bm!41826))

(declare-fun m!905745 () Bool)

(assert (=> b!977940 m!905745))

(assert (=> b!977940 m!905745))

(declare-fun m!905747 () Bool)

(assert (=> b!977940 m!905747))

(declare-fun m!905749 () Bool)

(assert (=> bm!41826 m!905749))

(assert (=> b!977942 m!905745))

(declare-fun m!905751 () Bool)

(assert (=> b!977942 m!905751))

(declare-fun m!905753 () Bool)

(assert (=> b!977942 m!905753))

(assert (=> b!977942 m!905745))

(declare-fun m!905755 () Bool)

(assert (=> b!977942 m!905755))

(assert (=> b!977894 d!116947))

(declare-fun d!116949 () Bool)

(assert (=> d!116949 (= (validMask!0 mask!1948) (and (or (= mask!1948 #b00000000000000000000000000000111) (= mask!1948 #b00000000000000000000000000001111) (= mask!1948 #b00000000000000000000000000011111) (= mask!1948 #b00000000000000000000000000111111) (= mask!1948 #b00000000000000000000000001111111) (= mask!1948 #b00000000000000000000000011111111) (= mask!1948 #b00000000000000000000000111111111) (= mask!1948 #b00000000000000000000001111111111) (= mask!1948 #b00000000000000000000011111111111) (= mask!1948 #b00000000000000000000111111111111) (= mask!1948 #b00000000000000000001111111111111) (= mask!1948 #b00000000000000000011111111111111) (= mask!1948 #b00000000000000000111111111111111) (= mask!1948 #b00000000000000001111111111111111) (= mask!1948 #b00000000000000011111111111111111) (= mask!1948 #b00000000000000111111111111111111) (= mask!1948 #b00000000000001111111111111111111) (= mask!1948 #b00000000000011111111111111111111) (= mask!1948 #b00000000000111111111111111111111) (= mask!1948 #b00000000001111111111111111111111) (= mask!1948 #b00000000011111111111111111111111) (= mask!1948 #b00000000111111111111111111111111) (= mask!1948 #b00000001111111111111111111111111) (= mask!1948 #b00000011111111111111111111111111) (= mask!1948 #b00000111111111111111111111111111) (= mask!1948 #b00001111111111111111111111111111) (= mask!1948 #b00011111111111111111111111111111) (= mask!1948 #b00111111111111111111111111111111)) (bvsle mask!1948 #b00111111111111111111111111111111)))))

(assert (=> start!83798 d!116949))

(declare-fun d!116951 () Bool)

(assert (=> d!116951 (= (array_inv!22755 _values!1278) (bvsge (size!29841 _values!1278) #b00000000000000000000000000000000))))

(assert (=> start!83798 d!116951))

(declare-fun d!116953 () Bool)

(assert (=> d!116953 (= (array_inv!22756 _keys!1544) (bvsge (size!29842 _keys!1544) #b00000000000000000000000000000000))))

(assert (=> start!83798 d!116953))

(declare-fun b!977950 () Bool)

(declare-fun e!551299 () Bool)

(assert (=> b!977950 (= e!551299 tp_is_empty!22471)))

(declare-fun mapIsEmpty!35732 () Bool)

(declare-fun mapRes!35732 () Bool)

(assert (=> mapIsEmpty!35732 mapRes!35732))

(declare-fun condMapEmpty!35732 () Bool)

(declare-fun mapDefault!35732 () ValueCell!10754)

(assert (=> mapNonEmpty!35723 (= condMapEmpty!35732 (= mapRest!35723 ((as const (Array (_ BitVec 32) ValueCell!10754)) mapDefault!35732)))))

(assert (=> mapNonEmpty!35723 (= tp!67976 (and e!551299 mapRes!35732))))

(declare-fun b!977949 () Bool)

(declare-fun e!551298 () Bool)

(assert (=> b!977949 (= e!551298 tp_is_empty!22471)))

(declare-fun mapNonEmpty!35732 () Bool)

(declare-fun tp!67985 () Bool)

(assert (=> mapNonEmpty!35732 (= mapRes!35732 (and tp!67985 e!551298))))

(declare-fun mapRest!35732 () (Array (_ BitVec 32) ValueCell!10754))

(declare-fun mapKey!35732 () (_ BitVec 32))

(declare-fun mapValue!35732 () ValueCell!10754)

(assert (=> mapNonEmpty!35732 (= mapRest!35723 (store mapRest!35732 mapKey!35732 mapValue!35732))))

(assert (= (and mapNonEmpty!35723 condMapEmpty!35732) mapIsEmpty!35732))

(assert (= (and mapNonEmpty!35723 (not condMapEmpty!35732)) mapNonEmpty!35732))

(assert (= (and mapNonEmpty!35732 ((_ is ValueCellFull!10754) mapValue!35732)) b!977949))

(assert (= (and mapNonEmpty!35723 ((_ is ValueCellFull!10754) mapDefault!35732)) b!977950))

(declare-fun m!905757 () Bool)

(assert (=> mapNonEmpty!35732 m!905757))

(check-sat (not b!977942) (not bm!41826) (not mapNonEmpty!35732) (not b!977940) tp_is_empty!22471)
(check-sat)
