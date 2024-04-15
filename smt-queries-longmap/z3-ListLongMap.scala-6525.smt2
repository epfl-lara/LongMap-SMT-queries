; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82986 () Bool)

(assert start!82986)

(declare-fun b!968395 () Bool)

(declare-fun e!545780 () Bool)

(declare-fun tp_is_empty!21925 () Bool)

(assert (=> b!968395 (= e!545780 tp_is_empty!21925)))

(declare-fun b!968396 () Bool)

(declare-fun res!648314 () Bool)

(declare-fun e!545779 () Bool)

(assert (=> b!968396 (=> (not res!648314) (not e!545779))))

(declare-datatypes ((array!59850 0))(
  ( (array!59851 (arr!28792 (Array (_ BitVec 32) (_ BitVec 64))) (size!29273 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59850)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59850 (_ BitVec 32)) Bool)

(assert (=> b!968396 (= res!648314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun mapIsEmpty!34888 () Bool)

(declare-fun mapRes!34888 () Bool)

(assert (=> mapIsEmpty!34888 mapRes!34888))

(declare-fun b!968397 () Bool)

(declare-fun res!648313 () Bool)

(assert (=> b!968397 (=> (not res!648313) (not e!545779))))

(declare-datatypes ((V!34217 0))(
  ( (V!34218 (val!11013 Int)) )
))
(declare-datatypes ((ValueCell!10481 0))(
  ( (ValueCellFull!10481 (v!13570 V!34217)) (EmptyCell!10481) )
))
(declare-datatypes ((array!59852 0))(
  ( (array!59853 (arr!28793 (Array (_ BitVec 32) ValueCell!10481)) (size!29274 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59852)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968397 (= res!648313 (and (= (size!29274 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29273 _keys!1717) (size!29274 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968398 () Bool)

(declare-fun e!545781 () Bool)

(declare-fun e!545782 () Bool)

(assert (=> b!968398 (= e!545781 (and e!545782 mapRes!34888))))

(declare-fun condMapEmpty!34888 () Bool)

(declare-fun mapDefault!34888 () ValueCell!10481)

(assert (=> b!968398 (= condMapEmpty!34888 (= (arr!28793 _values!1425) ((as const (Array (_ BitVec 32) ValueCell!10481)) mapDefault!34888)))))

(declare-fun b!968399 () Bool)

(assert (=> b!968399 (= e!545779 (and (bvsle #b00000000000000000000000000000000 (size!29273 _keys!1717)) (bvsge (size!29273 _keys!1717) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!34888 () Bool)

(declare-fun tp!66457 () Bool)

(assert (=> mapNonEmpty!34888 (= mapRes!34888 (and tp!66457 e!545780))))

(declare-fun mapKey!34888 () (_ BitVec 32))

(declare-fun mapValue!34888 () ValueCell!10481)

(declare-fun mapRest!34888 () (Array (_ BitVec 32) ValueCell!10481))

(assert (=> mapNonEmpty!34888 (= (arr!28793 _values!1425) (store mapRest!34888 mapKey!34888 mapValue!34888))))

(declare-fun b!968400 () Bool)

(assert (=> b!968400 (= e!545782 tp_is_empty!21925)))

(declare-fun res!648312 () Bool)

(assert (=> start!82986 (=> (not res!648312) (not e!545779))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82986 (= res!648312 (validMask!0 mask!2147))))

(assert (=> start!82986 e!545779))

(assert (=> start!82986 true))

(declare-fun array_inv!22353 (array!59852) Bool)

(assert (=> start!82986 (and (array_inv!22353 _values!1425) e!545781)))

(declare-fun array_inv!22354 (array!59850) Bool)

(assert (=> start!82986 (array_inv!22354 _keys!1717)))

(assert (= (and start!82986 res!648312) b!968397))

(assert (= (and b!968397 res!648313) b!968396))

(assert (= (and b!968396 res!648314) b!968399))

(assert (= (and b!968398 condMapEmpty!34888) mapIsEmpty!34888))

(assert (= (and b!968398 (not condMapEmpty!34888)) mapNonEmpty!34888))

(get-info :version)

(assert (= (and mapNonEmpty!34888 ((_ is ValueCellFull!10481) mapValue!34888)) b!968395))

(assert (= (and b!968398 ((_ is ValueCellFull!10481) mapDefault!34888)) b!968400))

(assert (= start!82986 b!968398))

(declare-fun m!896159 () Bool)

(assert (=> b!968396 m!896159))

(declare-fun m!896161 () Bool)

(assert (=> mapNonEmpty!34888 m!896161))

(declare-fun m!896163 () Bool)

(assert (=> start!82986 m!896163))

(declare-fun m!896165 () Bool)

(assert (=> start!82986 m!896165))

(declare-fun m!896167 () Bool)

(assert (=> start!82986 m!896167))

(check-sat (not b!968396) (not start!82986) (not mapNonEmpty!34888) tp_is_empty!21925)
(check-sat)
(get-model)

(declare-fun d!116053 () Bool)

(declare-fun res!648337 () Bool)

(declare-fun e!545820 () Bool)

(assert (=> d!116053 (=> res!648337 e!545820)))

(assert (=> d!116053 (= res!648337 (bvsge #b00000000000000000000000000000000 (size!29273 _keys!1717)))))

(assert (=> d!116053 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147) e!545820)))

(declare-fun b!968445 () Bool)

(declare-fun e!545821 () Bool)

(assert (=> b!968445 (= e!545820 e!545821)))

(declare-fun c!99858 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!968445 (= c!99858 (validKeyInArray!0 (select (arr!28792 _keys!1717) #b00000000000000000000000000000000)))))

(declare-fun b!968446 () Bool)

(declare-fun e!545819 () Bool)

(declare-fun call!41709 () Bool)

(assert (=> b!968446 (= e!545819 call!41709)))

(declare-fun b!968447 () Bool)

(assert (=> b!968447 (= e!545821 call!41709)))

(declare-fun bm!41706 () Bool)

(assert (=> bm!41706 (= call!41709 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1717 mask!2147))))

(declare-fun b!968448 () Bool)

(assert (=> b!968448 (= e!545821 e!545819)))

(declare-fun lt!431301 () (_ BitVec 64))

(assert (=> b!968448 (= lt!431301 (select (arr!28792 _keys!1717) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32232 0))(
  ( (Unit!32233) )
))
(declare-fun lt!431302 () Unit!32232)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!59850 (_ BitVec 64) (_ BitVec 32)) Unit!32232)

(assert (=> b!968448 (= lt!431302 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1717 lt!431301 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!59850 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!968448 (arrayContainsKey!0 _keys!1717 lt!431301 #b00000000000000000000000000000000)))

(declare-fun lt!431303 () Unit!32232)

(assert (=> b!968448 (= lt!431303 lt!431302)))

(declare-fun res!648338 () Bool)

(declare-datatypes ((SeekEntryResult!9193 0))(
  ( (MissingZero!9193 (index!39143 (_ BitVec 32))) (Found!9193 (index!39144 (_ BitVec 32))) (Intermediate!9193 (undefined!10005 Bool) (index!39145 (_ BitVec 32)) (x!83618 (_ BitVec 32))) (Undefined!9193) (MissingVacant!9193 (index!39146 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!59850 (_ BitVec 32)) SeekEntryResult!9193)

(assert (=> b!968448 (= res!648338 (= (seekEntryOrOpen!0 (select (arr!28792 _keys!1717) #b00000000000000000000000000000000) _keys!1717 mask!2147) (Found!9193 #b00000000000000000000000000000000)))))

(assert (=> b!968448 (=> (not res!648338) (not e!545819))))

(assert (= (and d!116053 (not res!648337)) b!968445))

(assert (= (and b!968445 c!99858) b!968448))

(assert (= (and b!968445 (not c!99858)) b!968447))

(assert (= (and b!968448 res!648338) b!968446))

(assert (= (or b!968446 b!968447) bm!41706))

(declare-fun m!896189 () Bool)

(assert (=> b!968445 m!896189))

(assert (=> b!968445 m!896189))

(declare-fun m!896191 () Bool)

(assert (=> b!968445 m!896191))

(declare-fun m!896193 () Bool)

(assert (=> bm!41706 m!896193))

(assert (=> b!968448 m!896189))

(declare-fun m!896195 () Bool)

(assert (=> b!968448 m!896195))

(declare-fun m!896197 () Bool)

(assert (=> b!968448 m!896197))

(assert (=> b!968448 m!896189))

(declare-fun m!896199 () Bool)

(assert (=> b!968448 m!896199))

(assert (=> b!968396 d!116053))

(declare-fun d!116055 () Bool)

(assert (=> d!116055 (= (validMask!0 mask!2147) (and (or (= mask!2147 #b00000000000000000000000000000111) (= mask!2147 #b00000000000000000000000000001111) (= mask!2147 #b00000000000000000000000000011111) (= mask!2147 #b00000000000000000000000000111111) (= mask!2147 #b00000000000000000000000001111111) (= mask!2147 #b00000000000000000000000011111111) (= mask!2147 #b00000000000000000000000111111111) (= mask!2147 #b00000000000000000000001111111111) (= mask!2147 #b00000000000000000000011111111111) (= mask!2147 #b00000000000000000000111111111111) (= mask!2147 #b00000000000000000001111111111111) (= mask!2147 #b00000000000000000011111111111111) (= mask!2147 #b00000000000000000111111111111111) (= mask!2147 #b00000000000000001111111111111111) (= mask!2147 #b00000000000000011111111111111111) (= mask!2147 #b00000000000000111111111111111111) (= mask!2147 #b00000000000001111111111111111111) (= mask!2147 #b00000000000011111111111111111111) (= mask!2147 #b00000000000111111111111111111111) (= mask!2147 #b00000000001111111111111111111111) (= mask!2147 #b00000000011111111111111111111111) (= mask!2147 #b00000000111111111111111111111111) (= mask!2147 #b00000001111111111111111111111111) (= mask!2147 #b00000011111111111111111111111111) (= mask!2147 #b00000111111111111111111111111111) (= mask!2147 #b00001111111111111111111111111111) (= mask!2147 #b00011111111111111111111111111111) (= mask!2147 #b00111111111111111111111111111111)) (bvsle mask!2147 #b00111111111111111111111111111111)))))

(assert (=> start!82986 d!116055))

(declare-fun d!116057 () Bool)

(assert (=> d!116057 (= (array_inv!22353 _values!1425) (bvsge (size!29274 _values!1425) #b00000000000000000000000000000000))))

(assert (=> start!82986 d!116057))

(declare-fun d!116059 () Bool)

(assert (=> d!116059 (= (array_inv!22354 _keys!1717) (bvsge (size!29273 _keys!1717) #b00000000000000000000000000000000))))

(assert (=> start!82986 d!116059))

(declare-fun mapNonEmpty!34897 () Bool)

(declare-fun mapRes!34897 () Bool)

(declare-fun tp!66466 () Bool)

(declare-fun e!545826 () Bool)

(assert (=> mapNonEmpty!34897 (= mapRes!34897 (and tp!66466 e!545826))))

(declare-fun mapKey!34897 () (_ BitVec 32))

(declare-fun mapRest!34897 () (Array (_ BitVec 32) ValueCell!10481))

(declare-fun mapValue!34897 () ValueCell!10481)

(assert (=> mapNonEmpty!34897 (= mapRest!34888 (store mapRest!34897 mapKey!34897 mapValue!34897))))

(declare-fun condMapEmpty!34897 () Bool)

(declare-fun mapDefault!34897 () ValueCell!10481)

(assert (=> mapNonEmpty!34888 (= condMapEmpty!34897 (= mapRest!34888 ((as const (Array (_ BitVec 32) ValueCell!10481)) mapDefault!34897)))))

(declare-fun e!545827 () Bool)

(assert (=> mapNonEmpty!34888 (= tp!66457 (and e!545827 mapRes!34897))))

(declare-fun b!968455 () Bool)

(assert (=> b!968455 (= e!545826 tp_is_empty!21925)))

(declare-fun mapIsEmpty!34897 () Bool)

(assert (=> mapIsEmpty!34897 mapRes!34897))

(declare-fun b!968456 () Bool)

(assert (=> b!968456 (= e!545827 tp_is_empty!21925)))

(assert (= (and mapNonEmpty!34888 condMapEmpty!34897) mapIsEmpty!34897))

(assert (= (and mapNonEmpty!34888 (not condMapEmpty!34897)) mapNonEmpty!34897))

(assert (= (and mapNonEmpty!34897 ((_ is ValueCellFull!10481) mapValue!34897)) b!968455))

(assert (= (and mapNonEmpty!34888 ((_ is ValueCellFull!10481) mapDefault!34897)) b!968456))

(declare-fun m!896201 () Bool)

(assert (=> mapNonEmpty!34897 m!896201))

(check-sat (not b!968445) (not bm!41706) tp_is_empty!21925 (not b!968448) (not mapNonEmpty!34897))
(check-sat)
