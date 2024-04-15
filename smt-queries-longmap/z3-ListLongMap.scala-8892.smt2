; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107980 () Bool)

(assert start!107980)

(declare-fun b!1275503 () Bool)

(declare-fun e!728178 () Bool)

(declare-fun tp_is_empty!33265 () Bool)

(assert (=> b!1275503 (= e!728178 tp_is_empty!33265)))

(declare-fun res!847791 () Bool)

(declare-fun e!728180 () Bool)

(assert (=> start!107980 (=> (not res!847791) (not e!728180))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107980 (= res!847791 (validMask!0 mask!1805))))

(assert (=> start!107980 e!728180))

(assert (=> start!107980 true))

(declare-datatypes ((V!49457 0))(
  ( (V!49458 (val!16707 Int)) )
))
(declare-datatypes ((ValueCell!15734 0))(
  ( (ValueCellFull!15734 (v!19302 V!49457)) (EmptyCell!15734) )
))
(declare-datatypes ((array!83535 0))(
  ( (array!83536 (arr!40281 (Array (_ BitVec 32) ValueCell!15734)) (size!40833 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83535)

(declare-fun e!728177 () Bool)

(declare-fun array_inv!30771 (array!83535) Bool)

(assert (=> start!107980 (and (array_inv!30771 _values!1187) e!728177)))

(declare-datatypes ((array!83537 0))(
  ( (array!83538 (arr!40282 (Array (_ BitVec 32) (_ BitVec 64))) (size!40834 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83537)

(declare-fun array_inv!30772 (array!83537) Bool)

(assert (=> start!107980 (array_inv!30772 _keys!1427)))

(declare-fun b!1275504 () Bool)

(declare-fun res!847790 () Bool)

(assert (=> b!1275504 (=> (not res!847790) (not e!728180))))

(declare-datatypes ((List!28693 0))(
  ( (Nil!28690) (Cons!28689 (h!29898 (_ BitVec 64)) (t!42221 List!28693)) )
))
(declare-fun noDuplicate!2071 (List!28693) Bool)

(assert (=> b!1275504 (= res!847790 (noDuplicate!2071 Nil!28690))))

(declare-fun b!1275505 () Bool)

(declare-fun res!847792 () Bool)

(assert (=> b!1275505 (=> (not res!847792) (not e!728180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83537 (_ BitVec 32)) Bool)

(assert (=> b!1275505 (= res!847792 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275506 () Bool)

(declare-fun e!728175 () Bool)

(declare-fun contains!7652 (List!28693 (_ BitVec 64)) Bool)

(assert (=> b!1275506 (= e!728175 (contains!7652 Nil!28690 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!51422 () Bool)

(declare-fun mapRes!51422 () Bool)

(assert (=> mapIsEmpty!51422 mapRes!51422))

(declare-fun b!1275507 () Bool)

(declare-fun res!847788 () Bool)

(assert (=> b!1275507 (=> (not res!847788) (not e!728180))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275507 (= res!847788 (and (= (size!40833 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40834 _keys!1427) (size!40833 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1275508 () Bool)

(assert (=> b!1275508 (= e!728177 (and e!728178 mapRes!51422))))

(declare-fun condMapEmpty!51422 () Bool)

(declare-fun mapDefault!51422 () ValueCell!15734)

(assert (=> b!1275508 (= condMapEmpty!51422 (= (arr!40281 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15734)) mapDefault!51422)))))

(declare-fun b!1275509 () Bool)

(assert (=> b!1275509 (= e!728180 e!728175)))

(declare-fun res!847789 () Bool)

(assert (=> b!1275509 (=> res!847789 e!728175)))

(assert (=> b!1275509 (= res!847789 (contains!7652 Nil!28690 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275510 () Bool)

(declare-fun e!728176 () Bool)

(assert (=> b!1275510 (= e!728176 tp_is_empty!33265)))

(declare-fun mapNonEmpty!51422 () Bool)

(declare-fun tp!98181 () Bool)

(assert (=> mapNonEmpty!51422 (= mapRes!51422 (and tp!98181 e!728176))))

(declare-fun mapValue!51422 () ValueCell!15734)

(declare-fun mapRest!51422 () (Array (_ BitVec 32) ValueCell!15734))

(declare-fun mapKey!51422 () (_ BitVec 32))

(assert (=> mapNonEmpty!51422 (= (arr!40281 _values!1187) (store mapRest!51422 mapKey!51422 mapValue!51422))))

(declare-fun b!1275511 () Bool)

(declare-fun res!847787 () Bool)

(assert (=> b!1275511 (=> (not res!847787) (not e!728180))))

(assert (=> b!1275511 (= res!847787 (and (bvsle #b00000000000000000000000000000000 (size!40834 _keys!1427)) (bvslt (size!40834 _keys!1427) #b01111111111111111111111111111111)))))

(assert (= (and start!107980 res!847791) b!1275507))

(assert (= (and b!1275507 res!847788) b!1275505))

(assert (= (and b!1275505 res!847792) b!1275511))

(assert (= (and b!1275511 res!847787) b!1275504))

(assert (= (and b!1275504 res!847790) b!1275509))

(assert (= (and b!1275509 (not res!847789)) b!1275506))

(assert (= (and b!1275508 condMapEmpty!51422) mapIsEmpty!51422))

(assert (= (and b!1275508 (not condMapEmpty!51422)) mapNonEmpty!51422))

(get-info :version)

(assert (= (and mapNonEmpty!51422 ((_ is ValueCellFull!15734) mapValue!51422)) b!1275510))

(assert (= (and b!1275508 ((_ is ValueCellFull!15734) mapDefault!51422)) b!1275503))

(assert (= start!107980 b!1275508))

(declare-fun m!1171259 () Bool)

(assert (=> b!1275509 m!1171259))

(declare-fun m!1171261 () Bool)

(assert (=> b!1275505 m!1171261))

(declare-fun m!1171263 () Bool)

(assert (=> b!1275506 m!1171263))

(declare-fun m!1171265 () Bool)

(assert (=> b!1275504 m!1171265))

(declare-fun m!1171267 () Bool)

(assert (=> mapNonEmpty!51422 m!1171267))

(declare-fun m!1171269 () Bool)

(assert (=> start!107980 m!1171269))

(declare-fun m!1171271 () Bool)

(assert (=> start!107980 m!1171271))

(declare-fun m!1171273 () Bool)

(assert (=> start!107980 m!1171273))

(check-sat (not b!1275505) tp_is_empty!33265 (not b!1275509) (not b!1275506) (not mapNonEmpty!51422) (not start!107980) (not b!1275504))
(check-sat)
(get-model)

(declare-fun b!1275574 () Bool)

(declare-fun e!728224 () Bool)

(declare-fun call!62625 () Bool)

(assert (=> b!1275574 (= e!728224 call!62625)))

(declare-fun b!1275575 () Bool)

(declare-fun e!728225 () Bool)

(assert (=> b!1275575 (= e!728225 call!62625)))

(declare-fun bm!62622 () Bool)

(assert (=> bm!62622 (= call!62625 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun d!140267 () Bool)

(declare-fun res!847834 () Bool)

(declare-fun e!728223 () Bool)

(assert (=> d!140267 (=> res!847834 e!728223)))

(assert (=> d!140267 (= res!847834 (bvsge #b00000000000000000000000000000000 (size!40834 _keys!1427)))))

(assert (=> d!140267 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728223)))

(declare-fun b!1275576 () Bool)

(assert (=> b!1275576 (= e!728223 e!728224)))

(declare-fun c!123911 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275576 (= c!123911 (validKeyInArray!0 (select (arr!40282 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun b!1275577 () Bool)

(assert (=> b!1275577 (= e!728224 e!728225)))

(declare-fun lt!575188 () (_ BitVec 64))

(assert (=> b!1275577 (= lt!575188 (select (arr!40282 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42203 0))(
  ( (Unit!42204) )
))
(declare-fun lt!575189 () Unit!42203)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83537 (_ BitVec 64) (_ BitVec 32)) Unit!42203)

(assert (=> b!1275577 (= lt!575189 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575188 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83537 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275577 (arrayContainsKey!0 _keys!1427 lt!575188 #b00000000000000000000000000000000)))

(declare-fun lt!575187 () Unit!42203)

(assert (=> b!1275577 (= lt!575187 lt!575189)))

(declare-fun res!847833 () Bool)

(declare-datatypes ((SeekEntryResult!10003 0))(
  ( (MissingZero!10003 (index!42383 (_ BitVec 32))) (Found!10003 (index!42384 (_ BitVec 32))) (Intermediate!10003 (undefined!10815 Bool) (index!42385 (_ BitVec 32)) (x!112975 (_ BitVec 32))) (Undefined!10003) (MissingVacant!10003 (index!42386 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83537 (_ BitVec 32)) SeekEntryResult!10003)

(assert (=> b!1275577 (= res!847833 (= (seekEntryOrOpen!0 (select (arr!40282 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10003 #b00000000000000000000000000000000)))))

(assert (=> b!1275577 (=> (not res!847833) (not e!728225))))

(assert (= (and d!140267 (not res!847834)) b!1275576))

(assert (= (and b!1275576 c!123911) b!1275577))

(assert (= (and b!1275576 (not c!123911)) b!1275574))

(assert (= (and b!1275577 res!847833) b!1275575))

(assert (= (or b!1275575 b!1275574) bm!62622))

(declare-fun m!1171307 () Bool)

(assert (=> bm!62622 m!1171307))

(declare-fun m!1171309 () Bool)

(assert (=> b!1275576 m!1171309))

(assert (=> b!1275576 m!1171309))

(declare-fun m!1171311 () Bool)

(assert (=> b!1275576 m!1171311))

(assert (=> b!1275577 m!1171309))

(declare-fun m!1171313 () Bool)

(assert (=> b!1275577 m!1171313))

(declare-fun m!1171315 () Bool)

(assert (=> b!1275577 m!1171315))

(assert (=> b!1275577 m!1171309))

(declare-fun m!1171317 () Bool)

(assert (=> b!1275577 m!1171317))

(assert (=> b!1275505 d!140267))

(declare-fun d!140269 () Bool)

(declare-fun lt!575192 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!639 (List!28693) (InoxSet (_ BitVec 64)))

(assert (=> d!140269 (= lt!575192 (select (content!639 Nil!28690) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!728231 () Bool)

(assert (=> d!140269 (= lt!575192 e!728231)))

(declare-fun res!847839 () Bool)

(assert (=> d!140269 (=> (not res!847839) (not e!728231))))

(assert (=> d!140269 (= res!847839 ((_ is Cons!28689) Nil!28690))))

(assert (=> d!140269 (= (contains!7652 Nil!28690 #b0000000000000000000000000000000000000000000000000000000000000000) lt!575192)))

(declare-fun b!1275582 () Bool)

(declare-fun e!728230 () Bool)

(assert (=> b!1275582 (= e!728231 e!728230)))

(declare-fun res!847840 () Bool)

(assert (=> b!1275582 (=> res!847840 e!728230)))

(assert (=> b!1275582 (= res!847840 (= (h!29898 Nil!28690) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275583 () Bool)

(assert (=> b!1275583 (= e!728230 (contains!7652 (t!42221 Nil!28690) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140269 res!847839) b!1275582))

(assert (= (and b!1275582 (not res!847840)) b!1275583))

(declare-fun m!1171319 () Bool)

(assert (=> d!140269 m!1171319))

(declare-fun m!1171321 () Bool)

(assert (=> d!140269 m!1171321))

(declare-fun m!1171323 () Bool)

(assert (=> b!1275583 m!1171323))

(assert (=> b!1275509 d!140269))

(declare-fun d!140271 () Bool)

(declare-fun res!847845 () Bool)

(declare-fun e!728236 () Bool)

(assert (=> d!140271 (=> res!847845 e!728236)))

(assert (=> d!140271 (= res!847845 ((_ is Nil!28690) Nil!28690))))

(assert (=> d!140271 (= (noDuplicate!2071 Nil!28690) e!728236)))

(declare-fun b!1275588 () Bool)

(declare-fun e!728237 () Bool)

(assert (=> b!1275588 (= e!728236 e!728237)))

(declare-fun res!847846 () Bool)

(assert (=> b!1275588 (=> (not res!847846) (not e!728237))))

(assert (=> b!1275588 (= res!847846 (not (contains!7652 (t!42221 Nil!28690) (h!29898 Nil!28690))))))

(declare-fun b!1275589 () Bool)

(assert (=> b!1275589 (= e!728237 (noDuplicate!2071 (t!42221 Nil!28690)))))

(assert (= (and d!140271 (not res!847845)) b!1275588))

(assert (= (and b!1275588 res!847846) b!1275589))

(declare-fun m!1171325 () Bool)

(assert (=> b!1275588 m!1171325))

(declare-fun m!1171327 () Bool)

(assert (=> b!1275589 m!1171327))

(assert (=> b!1275504 d!140271))

(declare-fun d!140273 () Bool)

(assert (=> d!140273 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107980 d!140273))

(declare-fun d!140275 () Bool)

(assert (=> d!140275 (= (array_inv!30771 _values!1187) (bvsge (size!40833 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107980 d!140275))

(declare-fun d!140277 () Bool)

(assert (=> d!140277 (= (array_inv!30772 _keys!1427) (bvsge (size!40834 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107980 d!140277))

(declare-fun d!140279 () Bool)

(declare-fun lt!575193 () Bool)

(assert (=> d!140279 (= lt!575193 (select (content!639 Nil!28690) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!728239 () Bool)

(assert (=> d!140279 (= lt!575193 e!728239)))

(declare-fun res!847847 () Bool)

(assert (=> d!140279 (=> (not res!847847) (not e!728239))))

(assert (=> d!140279 (= res!847847 ((_ is Cons!28689) Nil!28690))))

(assert (=> d!140279 (= (contains!7652 Nil!28690 #b1000000000000000000000000000000000000000000000000000000000000000) lt!575193)))

(declare-fun b!1275590 () Bool)

(declare-fun e!728238 () Bool)

(assert (=> b!1275590 (= e!728239 e!728238)))

(declare-fun res!847848 () Bool)

(assert (=> b!1275590 (=> res!847848 e!728238)))

(assert (=> b!1275590 (= res!847848 (= (h!29898 Nil!28690) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275591 () Bool)

(assert (=> b!1275591 (= e!728238 (contains!7652 (t!42221 Nil!28690) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140279 res!847847) b!1275590))

(assert (= (and b!1275590 (not res!847848)) b!1275591))

(assert (=> d!140279 m!1171319))

(declare-fun m!1171329 () Bool)

(assert (=> d!140279 m!1171329))

(declare-fun m!1171331 () Bool)

(assert (=> b!1275591 m!1171331))

(assert (=> b!1275506 d!140279))

(declare-fun mapIsEmpty!51431 () Bool)

(declare-fun mapRes!51431 () Bool)

(assert (=> mapIsEmpty!51431 mapRes!51431))

(declare-fun condMapEmpty!51431 () Bool)

(declare-fun mapDefault!51431 () ValueCell!15734)

(assert (=> mapNonEmpty!51422 (= condMapEmpty!51431 (= mapRest!51422 ((as const (Array (_ BitVec 32) ValueCell!15734)) mapDefault!51431)))))

(declare-fun e!728244 () Bool)

(assert (=> mapNonEmpty!51422 (= tp!98181 (and e!728244 mapRes!51431))))

(declare-fun b!1275598 () Bool)

(declare-fun e!728245 () Bool)

(assert (=> b!1275598 (= e!728245 tp_is_empty!33265)))

(declare-fun b!1275599 () Bool)

(assert (=> b!1275599 (= e!728244 tp_is_empty!33265)))

(declare-fun mapNonEmpty!51431 () Bool)

(declare-fun tp!98190 () Bool)

(assert (=> mapNonEmpty!51431 (= mapRes!51431 (and tp!98190 e!728245))))

(declare-fun mapValue!51431 () ValueCell!15734)

(declare-fun mapRest!51431 () (Array (_ BitVec 32) ValueCell!15734))

(declare-fun mapKey!51431 () (_ BitVec 32))

(assert (=> mapNonEmpty!51431 (= mapRest!51422 (store mapRest!51431 mapKey!51431 mapValue!51431))))

(assert (= (and mapNonEmpty!51422 condMapEmpty!51431) mapIsEmpty!51431))

(assert (= (and mapNonEmpty!51422 (not condMapEmpty!51431)) mapNonEmpty!51431))

(assert (= (and mapNonEmpty!51431 ((_ is ValueCellFull!15734) mapValue!51431)) b!1275598))

(assert (= (and mapNonEmpty!51422 ((_ is ValueCellFull!15734) mapDefault!51431)) b!1275599))

(declare-fun m!1171333 () Bool)

(assert (=> mapNonEmpty!51431 m!1171333))

(check-sat (not d!140279) (not b!1275583) (not b!1275577) tp_is_empty!33265 (not b!1275591) (not b!1275576) (not b!1275589) (not mapNonEmpty!51431) (not bm!62622) (not b!1275588) (not d!140269))
(check-sat)
