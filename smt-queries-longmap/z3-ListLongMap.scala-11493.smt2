; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134168 () Bool)

(assert start!134168)

(declare-fun mapNonEmpty!59634 () Bool)

(declare-fun mapRes!59634 () Bool)

(declare-fun tp!113559 () Bool)

(declare-fun e!873229 () Bool)

(assert (=> mapNonEmpty!59634 (= mapRes!59634 (and tp!113559 e!873229))))

(declare-fun mapKey!59634 () (_ BitVec 32))

(declare-datatypes ((V!59993 0))(
  ( (V!59994 (val!19503 Int)) )
))
(declare-datatypes ((ValueCell!18389 0))(
  ( (ValueCellFull!18389 (v!22247 V!59993)) (EmptyCell!18389) )
))
(declare-datatypes ((array!104494 0))(
  ( (array!104495 (arr!50432 (Array (_ BitVec 32) ValueCell!18389)) (size!50983 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104494)

(declare-fun mapValue!59634 () ValueCell!18389)

(declare-fun mapRest!59634 () (Array (_ BitVec 32) ValueCell!18389))

(assert (=> mapNonEmpty!59634 (= (arr!50432 _values!487) (store mapRest!59634 mapKey!59634 mapValue!59634))))

(declare-fun b!1566494 () Bool)

(declare-fun res!1070139 () Bool)

(declare-fun e!873230 () Bool)

(assert (=> b!1566494 (=> (not res!1070139) (not e!873230))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((array!104496 0))(
  ( (array!104497 (arr!50433 (Array (_ BitVec 32) (_ BitVec 64))) (size!50984 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104496)

(assert (=> b!1566494 (= res!1070139 (and (= (size!50983 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50984 _keys!637) (size!50983 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1070140 () Bool)

(assert (=> start!134168 (=> (not res!1070140) (not e!873230))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134168 (= res!1070140 (validMask!0 mask!947))))

(assert (=> start!134168 e!873230))

(assert (=> start!134168 true))

(declare-fun array_inv!39437 (array!104496) Bool)

(assert (=> start!134168 (array_inv!39437 _keys!637)))

(declare-fun e!873232 () Bool)

(declare-fun array_inv!39438 (array!104494) Bool)

(assert (=> start!134168 (and (array_inv!39438 _values!487) e!873232)))

(declare-fun mapIsEmpty!59634 () Bool)

(assert (=> mapIsEmpty!59634 mapRes!59634))

(declare-fun b!1566495 () Bool)

(declare-fun e!873231 () Bool)

(declare-fun tp_is_empty!38839 () Bool)

(assert (=> b!1566495 (= e!873231 tp_is_empty!38839)))

(declare-fun b!1566496 () Bool)

(assert (=> b!1566496 (= e!873232 (and e!873231 mapRes!59634))))

(declare-fun condMapEmpty!59634 () Bool)

(declare-fun mapDefault!59634 () ValueCell!18389)

(assert (=> b!1566496 (= condMapEmpty!59634 (= (arr!50432 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18389)) mapDefault!59634)))))

(declare-fun b!1566497 () Bool)

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1566497 (= e!873230 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50984 _keys!637)) (bvslt (bvsub (bvadd #b00000000000000000000000000000001 (size!50984 _keys!637)) from!782) #b00000000000000000000000000000000)))))

(declare-fun b!1566498 () Bool)

(assert (=> b!1566498 (= e!873229 tp_is_empty!38839)))

(declare-fun b!1566499 () Bool)

(declare-fun res!1070141 () Bool)

(assert (=> b!1566499 (=> (not res!1070141) (not e!873230))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104496 (_ BitVec 32)) Bool)

(assert (=> b!1566499 (= res!1070141 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1566500 () Bool)

(declare-fun res!1070138 () Bool)

(assert (=> b!1566500 (=> (not res!1070138) (not e!873230))))

(declare-datatypes ((List!36587 0))(
  ( (Nil!36584) (Cons!36583 (h!38047 (_ BitVec 64)) (t!51426 List!36587)) )
))
(declare-fun arrayNoDuplicates!0 (array!104496 (_ BitVec 32) List!36587) Bool)

(assert (=> b!1566500 (= res!1070138 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36584))))

(assert (= (and start!134168 res!1070140) b!1566494))

(assert (= (and b!1566494 res!1070139) b!1566499))

(assert (= (and b!1566499 res!1070141) b!1566500))

(assert (= (and b!1566500 res!1070138) b!1566497))

(assert (= (and b!1566496 condMapEmpty!59634) mapIsEmpty!59634))

(assert (= (and b!1566496 (not condMapEmpty!59634)) mapNonEmpty!59634))

(get-info :version)

(assert (= (and mapNonEmpty!59634 ((_ is ValueCellFull!18389) mapValue!59634)) b!1566498))

(assert (= (and b!1566496 ((_ is ValueCellFull!18389) mapDefault!59634)) b!1566495))

(assert (= start!134168 b!1566496))

(declare-fun m!1441671 () Bool)

(assert (=> mapNonEmpty!59634 m!1441671))

(declare-fun m!1441673 () Bool)

(assert (=> start!134168 m!1441673))

(declare-fun m!1441675 () Bool)

(assert (=> start!134168 m!1441675))

(declare-fun m!1441677 () Bool)

(assert (=> start!134168 m!1441677))

(declare-fun m!1441679 () Bool)

(assert (=> b!1566499 m!1441679))

(declare-fun m!1441681 () Bool)

(assert (=> b!1566500 m!1441681))

(check-sat tp_is_empty!38839 (not b!1566499) (not b!1566500) (not mapNonEmpty!59634) (not start!134168))
(check-sat)
(get-model)

(declare-fun d!163767 () Bool)

(declare-fun res!1070170 () Bool)

(declare-fun e!873269 () Bool)

(assert (=> d!163767 (=> res!1070170 e!873269)))

(assert (=> d!163767 (= res!1070170 (bvsge #b00000000000000000000000000000000 (size!50984 _keys!637)))))

(assert (=> d!163767 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947) e!873269)))

(declare-fun bm!71994 () Bool)

(declare-fun call!71997 () Bool)

(assert (=> bm!71994 (= call!71997 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!637 mask!947))))

(declare-fun b!1566551 () Bool)

(declare-fun e!873270 () Bool)

(assert (=> b!1566551 (= e!873270 call!71997)))

(declare-fun b!1566552 () Bool)

(declare-fun e!873271 () Bool)

(assert (=> b!1566552 (= e!873269 e!873271)))

(declare-fun c!145027 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1566552 (= c!145027 (validKeyInArray!0 (select (arr!50433 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566553 () Bool)

(assert (=> b!1566553 (= e!873271 call!71997)))

(declare-fun b!1566554 () Bool)

(assert (=> b!1566554 (= e!873271 e!873270)))

(declare-fun lt!672913 () (_ BitVec 64))

(assert (=> b!1566554 (= lt!672913 (select (arr!50433 _keys!637) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!51893 0))(
  ( (Unit!51894) )
))
(declare-fun lt!672912 () Unit!51893)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!104496 (_ BitVec 64) (_ BitVec 32)) Unit!51893)

(assert (=> b!1566554 (= lt!672912 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!637 lt!672913 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!104496 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1566554 (arrayContainsKey!0 _keys!637 lt!672913 #b00000000000000000000000000000000)))

(declare-fun lt!672914 () Unit!51893)

(assert (=> b!1566554 (= lt!672914 lt!672912)))

(declare-fun res!1070171 () Bool)

(declare-datatypes ((SeekEntryResult!13469 0))(
  ( (MissingZero!13469 (index!56274 (_ BitVec 32))) (Found!13469 (index!56275 (_ BitVec 32))) (Intermediate!13469 (undefined!14281 Bool) (index!56276 (_ BitVec 32)) (x!140432 (_ BitVec 32))) (Undefined!13469) (MissingVacant!13469 (index!56277 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!104496 (_ BitVec 32)) SeekEntryResult!13469)

(assert (=> b!1566554 (= res!1070171 (= (seekEntryOrOpen!0 (select (arr!50433 _keys!637) #b00000000000000000000000000000000) _keys!637 mask!947) (Found!13469 #b00000000000000000000000000000000)))))

(assert (=> b!1566554 (=> (not res!1070171) (not e!873270))))

(assert (= (and d!163767 (not res!1070170)) b!1566552))

(assert (= (and b!1566552 c!145027) b!1566554))

(assert (= (and b!1566552 (not c!145027)) b!1566553))

(assert (= (and b!1566554 res!1070171) b!1566551))

(assert (= (or b!1566551 b!1566553) bm!71994))

(declare-fun m!1441707 () Bool)

(assert (=> bm!71994 m!1441707))

(declare-fun m!1441709 () Bool)

(assert (=> b!1566552 m!1441709))

(assert (=> b!1566552 m!1441709))

(declare-fun m!1441711 () Bool)

(assert (=> b!1566552 m!1441711))

(assert (=> b!1566554 m!1441709))

(declare-fun m!1441713 () Bool)

(assert (=> b!1566554 m!1441713))

(declare-fun m!1441715 () Bool)

(assert (=> b!1566554 m!1441715))

(assert (=> b!1566554 m!1441709))

(declare-fun m!1441717 () Bool)

(assert (=> b!1566554 m!1441717))

(assert (=> b!1566499 d!163767))

(declare-fun d!163769 () Bool)

(assert (=> d!163769 (= (validMask!0 mask!947) (and (or (= mask!947 #b00000000000000000000000000000111) (= mask!947 #b00000000000000000000000000001111) (= mask!947 #b00000000000000000000000000011111) (= mask!947 #b00000000000000000000000000111111) (= mask!947 #b00000000000000000000000001111111) (= mask!947 #b00000000000000000000000011111111) (= mask!947 #b00000000000000000000000111111111) (= mask!947 #b00000000000000000000001111111111) (= mask!947 #b00000000000000000000011111111111) (= mask!947 #b00000000000000000000111111111111) (= mask!947 #b00000000000000000001111111111111) (= mask!947 #b00000000000000000011111111111111) (= mask!947 #b00000000000000000111111111111111) (= mask!947 #b00000000000000001111111111111111) (= mask!947 #b00000000000000011111111111111111) (= mask!947 #b00000000000000111111111111111111) (= mask!947 #b00000000000001111111111111111111) (= mask!947 #b00000000000011111111111111111111) (= mask!947 #b00000000000111111111111111111111) (= mask!947 #b00000000001111111111111111111111) (= mask!947 #b00000000011111111111111111111111) (= mask!947 #b00000000111111111111111111111111) (= mask!947 #b00000001111111111111111111111111) (= mask!947 #b00000011111111111111111111111111) (= mask!947 #b00000111111111111111111111111111) (= mask!947 #b00001111111111111111111111111111) (= mask!947 #b00011111111111111111111111111111) (= mask!947 #b00111111111111111111111111111111)) (bvsle mask!947 #b00111111111111111111111111111111)))))

(assert (=> start!134168 d!163769))

(declare-fun d!163771 () Bool)

(assert (=> d!163771 (= (array_inv!39437 _keys!637) (bvsge (size!50984 _keys!637) #b00000000000000000000000000000000))))

(assert (=> start!134168 d!163771))

(declare-fun d!163773 () Bool)

(assert (=> d!163773 (= (array_inv!39438 _values!487) (bvsge (size!50983 _values!487) #b00000000000000000000000000000000))))

(assert (=> start!134168 d!163773))

(declare-fun bm!71997 () Bool)

(declare-fun call!72000 () Bool)

(declare-fun c!145030 () Bool)

(assert (=> bm!71997 (= call!72000 (arrayNoDuplicates!0 _keys!637 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!145030 (Cons!36583 (select (arr!50433 _keys!637) #b00000000000000000000000000000000) Nil!36584) Nil!36584)))))

(declare-fun b!1566565 () Bool)

(declare-fun e!873281 () Bool)

(assert (=> b!1566565 (= e!873281 call!72000)))

(declare-fun b!1566566 () Bool)

(assert (=> b!1566566 (= e!873281 call!72000)))

(declare-fun b!1566567 () Bool)

(declare-fun e!873280 () Bool)

(declare-fun contains!10351 (List!36587 (_ BitVec 64)) Bool)

(assert (=> b!1566567 (= e!873280 (contains!10351 Nil!36584 (select (arr!50433 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun b!1566568 () Bool)

(declare-fun e!873283 () Bool)

(declare-fun e!873282 () Bool)

(assert (=> b!1566568 (= e!873283 e!873282)))

(declare-fun res!1070179 () Bool)

(assert (=> b!1566568 (=> (not res!1070179) (not e!873282))))

(assert (=> b!1566568 (= res!1070179 (not e!873280))))

(declare-fun res!1070178 () Bool)

(assert (=> b!1566568 (=> (not res!1070178) (not e!873280))))

(assert (=> b!1566568 (= res!1070178 (validKeyInArray!0 (select (arr!50433 _keys!637) #b00000000000000000000000000000000)))))

(declare-fun d!163775 () Bool)

(declare-fun res!1070180 () Bool)

(assert (=> d!163775 (=> res!1070180 e!873283)))

(assert (=> d!163775 (= res!1070180 (bvsge #b00000000000000000000000000000000 (size!50984 _keys!637)))))

(assert (=> d!163775 (= (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36584) e!873283)))

(declare-fun b!1566569 () Bool)

(assert (=> b!1566569 (= e!873282 e!873281)))

(assert (=> b!1566569 (= c!145030 (validKeyInArray!0 (select (arr!50433 _keys!637) #b00000000000000000000000000000000)))))

(assert (= (and d!163775 (not res!1070180)) b!1566568))

(assert (= (and b!1566568 res!1070178) b!1566567))

(assert (= (and b!1566568 res!1070179) b!1566569))

(assert (= (and b!1566569 c!145030) b!1566565))

(assert (= (and b!1566569 (not c!145030)) b!1566566))

(assert (= (or b!1566565 b!1566566) bm!71997))

(assert (=> bm!71997 m!1441709))

(declare-fun m!1441719 () Bool)

(assert (=> bm!71997 m!1441719))

(assert (=> b!1566567 m!1441709))

(assert (=> b!1566567 m!1441709))

(declare-fun m!1441721 () Bool)

(assert (=> b!1566567 m!1441721))

(assert (=> b!1566568 m!1441709))

(assert (=> b!1566568 m!1441709))

(assert (=> b!1566568 m!1441711))

(assert (=> b!1566569 m!1441709))

(assert (=> b!1566569 m!1441709))

(assert (=> b!1566569 m!1441711))

(assert (=> b!1566500 d!163775))

(declare-fun b!1566577 () Bool)

(declare-fun e!873289 () Bool)

(assert (=> b!1566577 (= e!873289 tp_is_empty!38839)))

(declare-fun mapNonEmpty!59643 () Bool)

(declare-fun mapRes!59643 () Bool)

(declare-fun tp!113568 () Bool)

(declare-fun e!873288 () Bool)

(assert (=> mapNonEmpty!59643 (= mapRes!59643 (and tp!113568 e!873288))))

(declare-fun mapKey!59643 () (_ BitVec 32))

(declare-fun mapValue!59643 () ValueCell!18389)

(declare-fun mapRest!59643 () (Array (_ BitVec 32) ValueCell!18389))

(assert (=> mapNonEmpty!59643 (= mapRest!59634 (store mapRest!59643 mapKey!59643 mapValue!59643))))

(declare-fun condMapEmpty!59643 () Bool)

(declare-fun mapDefault!59643 () ValueCell!18389)

(assert (=> mapNonEmpty!59634 (= condMapEmpty!59643 (= mapRest!59634 ((as const (Array (_ BitVec 32) ValueCell!18389)) mapDefault!59643)))))

(assert (=> mapNonEmpty!59634 (= tp!113559 (and e!873289 mapRes!59643))))

(declare-fun b!1566576 () Bool)

(assert (=> b!1566576 (= e!873288 tp_is_empty!38839)))

(declare-fun mapIsEmpty!59643 () Bool)

(assert (=> mapIsEmpty!59643 mapRes!59643))

(assert (= (and mapNonEmpty!59634 condMapEmpty!59643) mapIsEmpty!59643))

(assert (= (and mapNonEmpty!59634 (not condMapEmpty!59643)) mapNonEmpty!59643))

(assert (= (and mapNonEmpty!59643 ((_ is ValueCellFull!18389) mapValue!59643)) b!1566576))

(assert (= (and mapNonEmpty!59634 ((_ is ValueCellFull!18389) mapDefault!59643)) b!1566577))

(declare-fun m!1441723 () Bool)

(assert (=> mapNonEmpty!59643 m!1441723))

(check-sat (not b!1566567) tp_is_empty!38839 (not b!1566568) (not bm!71997) (not b!1566552) (not mapNonEmpty!59643) (not b!1566569) (not b!1566554) (not bm!71994))
(check-sat)
