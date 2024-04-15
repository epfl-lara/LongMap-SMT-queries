; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83000 () Bool)

(assert start!83000)

(declare-fun b!968471 () Bool)

(declare-fun e!545839 () Bool)

(declare-fun tp_is_empty!21931 () Bool)

(assert (=> b!968471 (= e!545839 tp_is_empty!21931)))

(declare-fun b!968472 () Bool)

(declare-fun e!545842 () Bool)

(assert (=> b!968472 (= e!545842 tp_is_empty!21931)))

(declare-fun b!968473 () Bool)

(declare-fun res!648348 () Bool)

(declare-fun e!545838 () Bool)

(assert (=> b!968473 (=> (not res!648348) (not e!545838))))

(declare-datatypes ((array!59862 0))(
  ( (array!59863 (arr!28797 (Array (_ BitVec 32) (_ BitVec 64))) (size!29278 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59862)

(assert (=> b!968473 (= res!648348 (and (bvsle #b00000000000000000000000000000000 (size!29278 _keys!1717)) (bvslt (size!29278 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun res!648350 () Bool)

(assert (=> start!83000 (=> (not res!648350) (not e!545838))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83000 (= res!648350 (validMask!0 mask!2147))))

(assert (=> start!83000 e!545838))

(assert (=> start!83000 true))

(declare-datatypes ((V!34225 0))(
  ( (V!34226 (val!11016 Int)) )
))
(declare-datatypes ((ValueCell!10484 0))(
  ( (ValueCellFull!10484 (v!13573 V!34225)) (EmptyCell!10484) )
))
(declare-datatypes ((array!59864 0))(
  ( (array!59865 (arr!28798 (Array (_ BitVec 32) ValueCell!10484)) (size!29279 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59864)

(declare-fun e!545840 () Bool)

(declare-fun array_inv!22355 (array!59864) Bool)

(assert (=> start!83000 (and (array_inv!22355 _values!1425) e!545840)))

(declare-fun array_inv!22356 (array!59862) Bool)

(assert (=> start!83000 (array_inv!22356 _keys!1717)))

(declare-fun mapNonEmpty!34900 () Bool)

(declare-fun mapRes!34900 () Bool)

(declare-fun tp!66469 () Bool)

(assert (=> mapNonEmpty!34900 (= mapRes!34900 (and tp!66469 e!545842))))

(declare-fun mapValue!34900 () ValueCell!10484)

(declare-fun mapRest!34900 () (Array (_ BitVec 32) ValueCell!10484))

(declare-fun mapKey!34900 () (_ BitVec 32))

(assert (=> mapNonEmpty!34900 (= (arr!28798 _values!1425) (store mapRest!34900 mapKey!34900 mapValue!34900))))

(declare-fun mapIsEmpty!34900 () Bool)

(assert (=> mapIsEmpty!34900 mapRes!34900))

(declare-fun b!968474 () Bool)

(declare-fun res!648349 () Bool)

(assert (=> b!968474 (=> (not res!648349) (not e!545838))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968474 (= res!648349 (and (= (size!29279 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29278 _keys!1717) (size!29279 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968475 () Bool)

(assert (=> b!968475 (= e!545840 (and e!545839 mapRes!34900))))

(declare-fun condMapEmpty!34900 () Bool)

(declare-fun mapDefault!34900 () ValueCell!10484)

(assert (=> b!968475 (= condMapEmpty!34900 (= (arr!28798 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10484)) mapDefault!34900)))))

(declare-fun b!968476 () Bool)

(declare-fun res!648347 () Bool)

(assert (=> b!968476 (=> (not res!648347) (not e!545838))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59862 (_ BitVec 32)) Bool)

(assert (=> b!968476 (= res!648347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!968477 () Bool)

(declare-datatypes ((List!20035 0))(
  ( (Nil!20032) (Cons!20031 (h!21193 (_ BitVec 64)) (t!28389 List!20035)) )
))
(declare-fun noDuplicate!1379 (List!20035) Bool)

(assert (=> b!968477 (= e!545838 (not (noDuplicate!1379 Nil!20032)))))

(assert (= (and start!83000 res!648350) b!968474))

(assert (= (and b!968474 res!648349) b!968476))

(assert (= (and b!968476 res!648347) b!968473))

(assert (= (and b!968473 res!648348) b!968477))

(assert (= (and b!968475 condMapEmpty!34900) mapIsEmpty!34900))

(assert (= (and b!968475 (not condMapEmpty!34900)) mapNonEmpty!34900))

(get-info :version)

(assert (= (and mapNonEmpty!34900 ((_ is ValueCellFull!10484) mapValue!34900)) b!968472))

(assert (= (and b!968475 ((_ is ValueCellFull!10484) mapDefault!34900)) b!968471))

(assert (= start!83000 b!968475))

(declare-fun m!896203 () Bool)

(assert (=> start!83000 m!896203))

(declare-fun m!896205 () Bool)

(assert (=> start!83000 m!896205))

(declare-fun m!896207 () Bool)

(assert (=> start!83000 m!896207))

(declare-fun m!896209 () Bool)

(assert (=> mapNonEmpty!34900 m!896209))

(declare-fun m!896211 () Bool)

(assert (=> b!968476 m!896211))

(declare-fun m!896213 () Bool)

(assert (=> b!968477 m!896213))

(check-sat (not start!83000) (not b!968477) (not b!968476) tp_is_empty!21931 (not mapNonEmpty!34900))
(check-sat)
(get-model)

(declare-fun d!116063 () Bool)

(assert (=> d!116063 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!83000 d!116063))

(declare-fun d!116065 () Bool)

(assert (=> d!116065 (= (array_inv!22355 _values!1425) (bvsge (size!29279 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!83000 d!116065))

(declare-fun d!116067 () Bool)

(assert (=> d!116067 (= (array_inv!22356 _keys!1717) (bvsge (size!29278 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!83000 d!116067))

(declare-fun b!968528 () Bool)

(declare-fun e!545879 () Bool)

(declare-fun call!41712 () Bool)

(assert (=> b!968528 (= e!545879 call!41712)))

(declare-fun b!968529 () Bool)

(declare-fun e!545880 () Bool)

(assert (=> b!968529 (= e!545880 call!41712)))

(declare-fun b!968530 () Bool)

(assert (=> b!968530 (= e!545880 e!545879)))

(declare-fun lt!431311 () (_ BitVec 64))

(assert (=> b!968530 (= lt!431311 (select (arr!28797 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32234 0))(
  ( (Unit!32235) )
))
(declare-fun lt!431312 () Unit!32234)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59862 (_ BitVec 64) (_ BitVec 32)) Unit!32234)

(assert (=> b!968530 (= lt!431312 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431311 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!968530 (arrayContainsKey!0 _keys!1717 lt!431311 #b00000000000000000000000000000000)))

(declare-fun lt!431310 () Unit!32234)

(assert (=> b!968530 (= lt!431310 lt!431312)))

(declare-fun res!648380 () Bool)

(declare-datatypes ((SeekEntryResult!9194 0))(
  ( (MissingZero!9194 (index!39147 (_ BitVec 32))) (Found!9194 (index!39148 (_ BitVec 32))) (Intermediate!9194 (undefined!10006 Bool) (index!39149 (_ BitVec 32)) (x!83629 (_ BitVec 32))) (Undefined!9194) (MissingVacant!9194 (index!39150 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59862 (_ BitVec 32)) SeekEntryResult!9194)

(assert (=> b!968530 (= res!648380 (= (seekEntryOrOpen!0 (select (arr!28797 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9194 #b00000000000000000000000000000000)))))

(assert (=> b!968530 (=> (not res!648380) (not e!545879))))

(declare-fun bm!41709 () Bool)

(assert (=> bm!41709 (= call!41712 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun d!116069 () Bool)

(declare-fun res!648379 () Bool)

(declare-fun e!545881 () Bool)

(assert (=> d!116069 (=> res!648379 e!545881)))

(assert (=> d!116069 (= res!648379 (bvsge #b00000000000000000000000000000000 (size!29278 _keys!1717)))))

(assert (=> d!116069 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!545881)))

(declare-fun b!968531 () Bool)

(assert (=> b!968531 (= e!545881 e!545880)))

(declare-fun c!99861 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968531 (= c!99861 (validKeyInArray!0 (select (arr!28797 _keys!1717) #b00000000000000000000000000000000)))))

(assert (= (and d!116069 (not res!648379)) b!968531))

(assert (= (and b!968531 c!99861) b!968530))

(assert (= (and b!968531 (not c!99861)) b!968529))

(assert (= (and b!968530 res!648380) b!968528))

(assert (= (or b!968528 b!968529) bm!41709))

(declare-fun m!896239 () Bool)

(assert (=> b!968530 m!896239))

(declare-fun m!896241 () Bool)

(assert (=> b!968530 m!896241))

(declare-fun m!896243 () Bool)

(assert (=> b!968530 m!896243))

(assert (=> b!968530 m!896239))

(declare-fun m!896245 () Bool)

(assert (=> b!968530 m!896245))

(declare-fun m!896247 () Bool)

(assert (=> bm!41709 m!896247))

(assert (=> b!968531 m!896239))

(assert (=> b!968531 m!896239))

(declare-fun m!896249 () Bool)

(assert (=> b!968531 m!896249))

(assert (=> b!968476 d!116069))

(declare-fun d!116071 () Bool)

(declare-fun res!648385 () Bool)

(declare-fun e!545886 () Bool)

(assert (=> d!116071 (=> res!648385 e!545886)))

(assert (=> d!116071 (= res!648385 ((_ is Nil!20032) Nil!20032))))

(assert (=> d!116071 (= (noDuplicate!1379 Nil!20032) e!545886)))

(declare-fun b!968536 () Bool)

(declare-fun e!545887 () Bool)

(assert (=> b!968536 (= e!545886 e!545887)))

(declare-fun res!648386 () Bool)

(assert (=> b!968536 (=> (not res!648386) (not e!545887))))

(declare-fun contains!5523 (List!20035 (_ BitVec 64)) Bool)

(assert (=> b!968536 (= res!648386 (not (contains!5523 (t!28389 Nil!20032) (h!21193 Nil!20032))))))

(declare-fun b!968537 () Bool)

(assert (=> b!968537 (= e!545887 (noDuplicate!1379 (t!28389 Nil!20032)))))

(assert (= (and d!116071 (not res!648385)) b!968536))

(assert (= (and b!968536 res!648386) b!968537))

(declare-fun m!896251 () Bool)

(assert (=> b!968536 m!896251))

(declare-fun m!896253 () Bool)

(assert (=> b!968537 m!896253))

(assert (=> b!968477 d!116071))

(declare-fun mapIsEmpty!34909 () Bool)

(declare-fun mapRes!34909 () Bool)

(assert (=> mapIsEmpty!34909 mapRes!34909))

(declare-fun condMapEmpty!34909 () Bool)

(declare-fun mapDefault!34909 () ValueCell!10484)

(assert (=> mapNonEmpty!34900 (= condMapEmpty!34909 (= mapRest!34900 ((as const (Array (_ BitVec 32) ValueCell!10484)) mapDefault!34909)))))

(declare-fun e!545893 () Bool)

(assert (=> mapNonEmpty!34900 (= tp!66469 (and e!545893 mapRes!34909))))

(declare-fun mapNonEmpty!34909 () Bool)

(declare-fun tp!66478 () Bool)

(declare-fun e!545892 () Bool)

(assert (=> mapNonEmpty!34909 (= mapRes!34909 (and tp!66478 e!545892))))

(declare-fun mapKey!34909 () (_ BitVec 32))

(declare-fun mapRest!34909 () (Array (_ BitVec 32) ValueCell!10484))

(declare-fun mapValue!34909 () ValueCell!10484)

(assert (=> mapNonEmpty!34909 (= mapRest!34900 (store mapRest!34909 mapKey!34909 mapValue!34909))))

(declare-fun b!968544 () Bool)

(assert (=> b!968544 (= e!545892 tp_is_empty!21931)))

(declare-fun b!968545 () Bool)

(assert (=> b!968545 (= e!545893 tp_is_empty!21931)))

(assert (= (and mapNonEmpty!34900 condMapEmpty!34909) mapIsEmpty!34909))

(assert (= (and mapNonEmpty!34900 (not condMapEmpty!34909)) mapNonEmpty!34909))

(assert (= (and mapNonEmpty!34909 ((_ is ValueCellFull!10484) mapValue!34909)) b!968544))

(assert (= (and mapNonEmpty!34900 ((_ is ValueCellFull!10484) mapDefault!34909)) b!968545))

(declare-fun m!896255 () Bool)

(assert (=> mapNonEmpty!34909 m!896255))

(check-sat (not b!968531) (not b!968530) (not b!968537) (not bm!41709) (not b!968536) tp_is_empty!21931 (not mapNonEmpty!34909))
(check-sat)
