; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83020 () Bool)

(assert start!83020)

(declare-fun b!968731 () Bool)

(declare-fun res!648472 () Bool)

(declare-fun e!546004 () Bool)

(assert (=> b!968731 (=> (not res!648472) (not e!546004))))

(declare-datatypes ((array!59941 0))(
  ( (array!59942 (arr!28836 (Array (_ BitVec 32) (_ BitVec 64))) (size!29315 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59941)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59941 (_ BitVec 32)) Bool)

(assert (=> b!968731 (= res!648472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968732 () Bool)

(declare-fun res!648470 () Bool)

(assert (=> b!968732 (=> (not res!648470) (not e!546004))))

(assert (=> b!968732 (= res!648470 (and (bvsle #b00000000000000000000000000000000 (size!29315 _keys!1717)) (bvslt (size!29315 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun res!648469 () Bool)

(assert (=> start!83020 (=> (not res!648469) (not e!546004))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83020 (= res!648469 (validMask!0 mask!2147))))

(assert (=> start!83020 e!546004))

(assert (=> start!83020 true))

(declare-datatypes ((V!34227 0))(
  ( (V!34228 (val!11017 Int)) )
))
(declare-datatypes ((ValueCell!10485 0))(
  ( (ValueCellFull!10485 (v!13575 V!34227)) (EmptyCell!10485) )
))
(declare-datatypes ((array!59943 0))(
  ( (array!59944 (arr!28837 (Array (_ BitVec 32) ValueCell!10485)) (size!29316 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59943)

(declare-fun e!546001 () Bool)

(declare-fun array_inv!22323 (array!59943) Bool)

(assert (=> start!83020 (and (array_inv!22323 _values!1425) e!546001)))

(declare-fun array_inv!22324 (array!59941) Bool)

(assert (=> start!83020 (array_inv!22324 _keys!1717)))

(declare-fun b!968733 () Bool)

(declare-fun e!546002 () Bool)

(declare-fun mapRes!34903 () Bool)

(assert (=> b!968733 (= e!546001 (and e!546002 mapRes!34903))))

(declare-fun condMapEmpty!34903 () Bool)

(declare-fun mapDefault!34903 () ValueCell!10485)

(assert (=> b!968733 (= condMapEmpty!34903 (= (arr!28837 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10485)) mapDefault!34903)))))

(declare-fun b!968734 () Bool)

(declare-datatypes ((List!20003 0))(
  ( (Nil!20000) (Cons!19999 (h!21161 (_ BitVec 64)) (t!28366 List!20003)) )
))
(declare-fun noDuplicate!1370 (List!20003) Bool)

(assert (=> b!968734 (= e!546004 (not (noDuplicate!1370 Nil!20000)))))

(declare-fun mapIsEmpty!34903 () Bool)

(assert (=> mapIsEmpty!34903 mapRes!34903))

(declare-fun b!968735 () Bool)

(declare-fun tp_is_empty!21933 () Bool)

(assert (=> b!968735 (= e!546002 tp_is_empty!21933)))

(declare-fun b!968736 () Bool)

(declare-fun res!648471 () Bool)

(assert (=> b!968736 (=> (not res!648471) (not e!546004))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968736 (= res!648471 (and (= (size!29316 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29315 _keys!1717) (size!29316 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!34903 () Bool)

(declare-fun tp!66471 () Bool)

(declare-fun e!546003 () Bool)

(assert (=> mapNonEmpty!34903 (= mapRes!34903 (and tp!66471 e!546003))))

(declare-fun mapRest!34903 () (Array (_ BitVec 32) ValueCell!10485))

(declare-fun mapKey!34903 () (_ BitVec 32))

(declare-fun mapValue!34903 () ValueCell!10485)

(assert (=> mapNonEmpty!34903 (= (arr!28837 _values!1425) (store mapRest!34903 mapKey!34903 mapValue!34903))))

(declare-fun b!968737 () Bool)

(assert (=> b!968737 (= e!546003 tp_is_empty!21933)))

(assert (= (and start!83020 res!648469) b!968736))

(assert (= (and b!968736 res!648471) b!968731))

(assert (= (and b!968731 res!648472) b!968732))

(assert (= (and b!968732 res!648470) b!968734))

(assert (= (and b!968733 condMapEmpty!34903) mapIsEmpty!34903))

(assert (= (and b!968733 (not condMapEmpty!34903)) mapNonEmpty!34903))

(get-info :version)

(assert (= (and mapNonEmpty!34903 ((_ is ValueCellFull!10485) mapValue!34903)) b!968737))

(assert (= (and b!968733 ((_ is ValueCellFull!10485) mapDefault!34903)) b!968735))

(assert (= start!83020 b!968733))

(declare-fun m!896973 () Bool)

(assert (=> b!968731 m!896973))

(declare-fun m!896975 () Bool)

(assert (=> start!83020 m!896975))

(declare-fun m!896977 () Bool)

(assert (=> start!83020 m!896977))

(declare-fun m!896979 () Bool)

(assert (=> start!83020 m!896979))

(declare-fun m!896981 () Bool)

(assert (=> b!968734 m!896981))

(declare-fun m!896983 () Bool)

(assert (=> mapNonEmpty!34903 m!896983))

(check-sat (not mapNonEmpty!34903) tp_is_empty!21933 (not b!968731) (not b!968734) (not start!83020))
(check-sat)
(get-model)

(declare-fun d!116261 () Bool)

(declare-fun res!648489 () Bool)

(declare-fun e!546025 () Bool)

(assert (=> d!116261 (=> res!648489 e!546025)))

(assert (=> d!116261 (= res!648489 ((_ is Nil!20000) Nil!20000))))

(assert (=> d!116261 (= (noDuplicate!1370 Nil!20000) e!546025)))

(declare-fun b!968763 () Bool)

(declare-fun e!546026 () Bool)

(assert (=> b!968763 (= e!546025 e!546026)))

(declare-fun res!648490 () Bool)

(assert (=> b!968763 (=> (not res!648490) (not e!546026))))

(declare-fun contains!5544 (List!20003 (_ BitVec 64)) Bool)

(assert (=> b!968763 (= res!648490 (not (contains!5544 (t!28366 Nil!20000) (h!21161 Nil!20000))))))

(declare-fun b!968764 () Bool)

(assert (=> b!968764 (= e!546026 (noDuplicate!1370 (t!28366 Nil!20000)))))

(assert (= (and d!116261 (not res!648489)) b!968763))

(assert (= (and b!968763 res!648490) b!968764))

(declare-fun m!896997 () Bool)

(assert (=> b!968763 m!896997))

(declare-fun m!896999 () Bool)

(assert (=> b!968764 m!896999))

(assert (=> b!968734 d!116261))

(declare-fun d!116263 () Bool)

(declare-fun res!648495 () Bool)

(declare-fun e!546035 () Bool)

(assert (=> d!116263 (=> res!648495 e!546035)))

(assert (=> d!116263 (= res!648495 (bvsge #b00000000000000000000000000000000 (size!29315 _keys!1717)))))

(assert (=> d!116263 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!546035)))

(declare-fun b!968773 () Bool)

(declare-fun e!546033 () Bool)

(declare-fun call!41738 () Bool)

(assert (=> b!968773 (= e!546033 call!41738)))

(declare-fun bm!41735 () Bool)

(assert (=> bm!41735 (= call!41738 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun b!968774 () Bool)

(declare-fun e!546034 () Bool)

(assert (=> b!968774 (= e!546034 call!41738)))

(declare-fun b!968775 () Bool)

(assert (=> b!968775 (= e!546035 e!546033)))

(declare-fun c!99926 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968775 (= c!99926 (validKeyInArray!0 (select (arr!28836 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!968776 () Bool)

(assert (=> b!968776 (= e!546033 e!546034)))

(declare-fun lt!431548 () (_ BitVec 64))

(assert (=> b!968776 (= lt!431548 (select (arr!28836 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32365 0))(
  ( (Unit!32366) )
))
(declare-fun lt!431547 () Unit!32365)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59941 (_ BitVec 64) (_ BitVec 32)) Unit!32365)

(assert (=> b!968776 (= lt!431547 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431548 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59941 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!968776 (arrayContainsKey!0 _keys!1717 lt!431548 #b00000000000000000000000000000000)))

(declare-fun lt!431546 () Unit!32365)

(assert (=> b!968776 (= lt!431546 lt!431547)))

(declare-fun res!648496 () Bool)

(declare-datatypes ((SeekEntryResult!9199 0))(
  ( (MissingZero!9199 (index!39167 (_ BitVec 32))) (Found!9199 (index!39168 (_ BitVec 32))) (Intermediate!9199 (undefined!10011 Bool) (index!39169 (_ BitVec 32)) (x!83639 (_ BitVec 32))) (Undefined!9199) (MissingVacant!9199 (index!39170 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59941 (_ BitVec 32)) SeekEntryResult!9199)

(assert (=> b!968776 (= res!648496 (= (seekEntryOrOpen!0 (select (arr!28836 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9199 #b00000000000000000000000000000000)))))

(assert (=> b!968776 (=> (not res!648496) (not e!546034))))

(assert (= (and d!116263 (not res!648495)) b!968775))

(assert (= (and b!968775 c!99926) b!968776))

(assert (= (and b!968775 (not c!99926)) b!968773))

(assert (= (and b!968776 res!648496) b!968774))

(assert (= (or b!968774 b!968773) bm!41735))

(declare-fun m!897001 () Bool)

(assert (=> bm!41735 m!897001))

(declare-fun m!897003 () Bool)

(assert (=> b!968775 m!897003))

(assert (=> b!968775 m!897003))

(declare-fun m!897005 () Bool)

(assert (=> b!968775 m!897005))

(assert (=> b!968776 m!897003))

(declare-fun m!897007 () Bool)

(assert (=> b!968776 m!897007))

(declare-fun m!897009 () Bool)

(assert (=> b!968776 m!897009))

(assert (=> b!968776 m!897003))

(declare-fun m!897011 () Bool)

(assert (=> b!968776 m!897011))

(assert (=> b!968731 d!116263))

(declare-fun d!116265 () Bool)

(assert (=> d!116265 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83020 d!116265))

(declare-fun d!116267 () Bool)

(assert (=> d!116267 (= (array_inv!22323 _values!1425) (bvsge (size!29316 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83020 d!116267))

(declare-fun d!116269 () Bool)

(assert (=> d!116269 (= (array_inv!22324 _keys!1717) (bvsge (size!29315 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83020 d!116269))

(declare-fun b!968784 () Bool)

(declare-fun e!546041 () Bool)

(assert (=> b!968784 (= e!546041 tp_is_empty!21933)))

(declare-fun mapIsEmpty!34909 () Bool)

(declare-fun mapRes!34909 () Bool)

(assert (=> mapIsEmpty!34909 mapRes!34909))

(declare-fun mapNonEmpty!34909 () Bool)

(declare-fun tp!66477 () Bool)

(declare-fun e!546040 () Bool)

(assert (=> mapNonEmpty!34909 (= mapRes!34909 (and tp!66477 e!546040))))

(declare-fun mapValue!34909 () ValueCell!10485)

(declare-fun mapKey!34909 () (_ BitVec 32))

(declare-fun mapRest!34909 () (Array (_ BitVec 32) ValueCell!10485))

(assert (=> mapNonEmpty!34909 (= mapRest!34903 (store mapRest!34909 mapKey!34909 mapValue!34909))))

(declare-fun condMapEmpty!34909 () Bool)

(declare-fun mapDefault!34909 () ValueCell!10485)

(assert (=> mapNonEmpty!34903 (= condMapEmpty!34909 (= mapRest!34903 ((as const (Array (_ BitVec 32) ValueCell!10485)) mapDefault!34909)))))

(assert (=> mapNonEmpty!34903 (= tp!66471 (and e!546041 mapRes!34909))))

(declare-fun b!968783 () Bool)

(assert (=> b!968783 (= e!546040 tp_is_empty!21933)))

(assert (= (and mapNonEmpty!34903 condMapEmpty!34909) mapIsEmpty!34909))

(assert (= (and mapNonEmpty!34903 (not condMapEmpty!34909)) mapNonEmpty!34909))

(assert (= (and mapNonEmpty!34909 ((_ is ValueCellFull!10485) mapValue!34909)) b!968783))

(assert (= (and mapNonEmpty!34903 ((_ is ValueCellFull!10485) mapDefault!34909)) b!968784))

(declare-fun m!897013 () Bool)

(assert (=> mapNonEmpty!34909 m!897013))

(check-sat (not b!968764) tp_is_empty!21933 (not bm!41735) (not b!968775) (not mapNonEmpty!34909) (not b!968763) (not b!968776))
(check-sat)
